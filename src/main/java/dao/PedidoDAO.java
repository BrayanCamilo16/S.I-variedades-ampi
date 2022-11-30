package dao;

import java.sql.*;
import java.util.*;
import vo.PedidoVO;
import java.util.logging.*;
import vo.CarritoVO;

/**
 *
 * @author jhona
 */
public class PedidoDAO {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    int r = 0;
    private String sql = "";
    boolean operacionExitosa = false;

    public PedidoDAO() {
    }

    public PedidoDAO(PedidoVO vo) {
    }

    // Este metodo devuelve los VO de pedido
    public List<PedidoVO> consultarPedidosCliente(int idCliente) {
        PedidoVO pedidoVo = null;

        List<PedidoVO> pedidos = new ArrayList();

        sql = "SELECT id_pedido, fecha_pedido, fecha_entrega, destino_pedido, estado_pedido FROM pedido AS ped INNER JOIN usuario_pedido AS usu_ped ON ped.id_pedido = usu_ped.id_pedido_fk WHERE id_usuario_cliente_fk = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Llenamos el VO del pedido
                pedidoVo = new PedidoVO(rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getString("fecha_entrega"), rs.getString("destino_pedido"), rs.getString("estado_pedido"), rs.getInt("id_pedido"));

                pedidos.add(pedidoVo);
            }

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al consultar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return pedidos;
    }
    public int GenerarCompra(PedidoVO pedi, int codigoCliente) {
        int id_pedido;
        sql = "insert into pedido (fecha_pedido, fecha_entrega, destino_pedido, estado_pedido, ) VALUES (?,?,?,?)";
        try {
            // Se inserta el pedido
            conn = Conexion.getConnection();
//            for (int i = 0; i < pedi.getDetallePedido().size(); i++) {
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, pedi.getFechaPedido());
                stmt.setString(2, pedi.getFechaEntrega());
                stmt.setString(3, pedi.getDestinoPedido());
                stmt.setString(4, pedi.getEstadoPedido());
//                pedi.setIdProducto(pedi.getDetallePedido().get(i).getIdProdu());
//                System.out.println("IDPRODUCTO"+PEDI)
                r = stmt.executeUpdate();
//            }

            //ea para identificar la ultima compra
            sql = "SELECT id_pedido from pedido ORDER by id_pedido DESC LIMIT 1";
            rs = stmt.executeQuery(sql);
            rs.next();
            id_pedido = rs.getInt("id_pedido");
            rs.close();

            for (CarritoVO detalle : pedi.getDetallePedido()) {
                System.out.println("detalle = " + detalle);
                sql = "INSERT INTO detalles_pedido (id_pedido, id_producto, precio_unidad, cantidad) VALUES (?,?,?,?)";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id_pedido);
                stmt.setInt(2, detalle.getIdProdu());
                stmt.setDouble(3, detalle.getPrecioCompra());
                stmt.setDouble(4, detalle.getCantidad());
                r = stmt.executeUpdate();
            }
            
            sql = "INSERT INTO usuario_pedido (INSERT INTO usuario_pedido (id_pedido_fk, id_usuario_cliente_FK) VALUES (?,?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_pedido);
            stmt.setInt(2, codigoCliente);
            r= stmt.executeUpdate(sql);
//            id_pedido = rs.getInt("id_pedido");
            rs.close();

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al consultar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return r;
    }

    public ArrayList<PedidoVO> listarP() {
        ArrayList<PedidoVO> listarPedidos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            sql = "SELECT * FROM pedido ORDER BY id_pedido DESC";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {

                PedidoVO pedi = new PedidoVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                listarPedidos.add(pedi);

            }

        } catch (SQLException e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return listarPedidos;
    }

    public boolean EnProceso(int idPedido) {
        try {
            sql = "update pedido set estado_pedido='En Proceso'  where id_pedido=?";
            conn = Conexion.getConnection();
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a eliminar, estos van en orden a la base de datos
            stmt.setInt(1, idPedido);
            stmt.executeUpdate();
            operacionExitosa = true;

        } catch (SQLException e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return operacionExitosa;
    }
}
