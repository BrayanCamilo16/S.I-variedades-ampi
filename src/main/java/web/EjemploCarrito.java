package web;
import dao.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import vo.*;

/**
 *
 * @author pc
 */
@WebServlet(name = "EjemploCarrito", urlPatterns = {"/EjemploCarrito"})
public class EjemploCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductoVO productoV = new ProductoVO();
    ProductoDAO produDao = new ProductoDAO();
    List<ProductoVO> prodVo = new ArrayList<>();

    List<CarritoVO> listarCarrito = new ArrayList<>();

    int item;
    double totalaPagar = 0.0;
    int cantidad = 1;

    int idproducto;
    CarritoVO car;
    double descuento = 0.0;
    double subtotal = 0.0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
//        prodVo = produDao.select();
//        System.out.println(prodVo);
        switch (accion) {
            case "Comprar":
                totalaPagar = 0.0;
                idproducto = Integer.parseInt(request.getParameter("id"));
                productoV = produDao.selectById(idproducto);
                //variables del carrito
                item = item + 1;
                car = new CarritoVO();
                car.setItem(item);
                car.setIdProdu(productoV.getIdProducto());
                car.setNombre(productoV.getNombreProducto());
                car.setDescripcion(productoV.getDescripcionProducto());
                car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                car.setCantidad(cantidad);
                car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                car.setImagenProducto(productoV.getNombreImgProducto());

                listarCarrito.add(car);
                for (int i = 0; i < listarCarrito.size(); i++) {
                    totalaPagar = totalaPagar + listarCarrito.get(i).getSubtotal();
                }
                request.setAttribute("monto", totalaPagar);
                request.setAttribute("carrito", listarCarrito);
                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;

            case "ComprarCliente":
                totalaPagar = 0.0;
                idproducto = Integer.parseInt(request.getParameter("id"));
                productoV = produDao.selectById(idproducto);
                //variables del carrito
                item = item + 1;
                car = new CarritoVO();
                car.setItem(item);
                car.setIdProdu(productoV.getIdProducto());
                car.setNombre(productoV.getNombreProducto());
                car.setDescripcion(productoV.getDescripcionProducto());
                car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                car.setCantidad(cantidad);
                car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                car.setImagenProducto(productoV.getNombreImgProducto());

                listarCarrito.add(car);
                for (int i = 0; i < listarCarrito.size(); i++) {
                    totalaPagar = totalaPagar + listarCarrito.get(i).getSubtotal();
                }

                request.setAttribute("monto", totalaPagar);
                request.setAttribute("carrito", listarCarrito);
                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("cliente/Carrito.jsp").forward(request, response);
                break;

            case "AgregarCarrito":
                int posicionProducto = 0;
                cantidad = 1;
                idproducto = Integer.parseInt(request.getParameter("id"));
                productoV = produDao.selectById(idproducto);

                //con el metodo sizze se conoce la cantidad de productos que tiene el carrito
                if (listarCarrito.size() > 0) {
                    //aqui se esta conociendo la posisicoon del produccto
                    for (int i = 0; i < listarCarrito.size(); i++) {
                        if (idproducto == listarCarrito.get(i).getIdProdu()) {
                            posicionProducto = i;
                        }
                    }
                    if (idproducto == listarCarrito.get(posicionProducto).getIdProdu()) {
                        cantidad = listarCarrito.get(posicionProducto).getCantidad() + cantidad;
                        double subtotall = listarCarrito.get(posicionProducto).getPrecioCompra() * cantidad;
                        listarCarrito.get(posicionProducto).setCantidad(cantidad);
                        listarCarrito.get(posicionProducto).setSubtotal(subtotall);
                    } else {
                        //variables del carrito
                        item = item + 1;
                        car = new CarritoVO();
                        car.setItem(item);
                        car.setIdProdu(productoV.getIdProducto());
                        car.setNombre(productoV.getNombreProducto());
                        car.setDescripcion(productoV.getDescripcionProducto());
                        car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                        car.setImagenProducto(productoV.getNombreImgProducto());
                        listarCarrito.add(car);
                    }
                } else {
                    //variables del carrito
                    item = item + 1;
                    car = new CarritoVO();
                    car.setItem(item);
                    car.setIdProdu(productoV.getIdProducto());
                    car.setNombre(productoV.getNombreProducto());
                    car.setDescripcion(productoV.getDescripcionProducto());
                    car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                    car.setImagenProducto(productoV.getNombreImgProducto());
                    listarCarrito.add(car);
                }

                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("cliente/index.jsp").forward(request, response);
                break;

            case "SumarCarrito":
                int posicionProducto2 = 0;
                cantidad = 1;
                idproducto = Integer.parseInt(request.getParameter("id"));
                productoV = produDao.selectById(idproducto);

                //con el metodo sizze se conoce la cantidad de productos que tiene el carrito
                if (listarCarrito.size() > 0) {
                    //aqui se esta conociendo la posisicoon del produccto
                    for (int i = 0; i < listarCarrito.size(); i++) {
                        if (idproducto == listarCarrito.get(i).getIdProdu()) {
                            posicionProducto2 = i;
                        }
                    }
                    if (idproducto == listarCarrito.get(posicionProducto2).getIdProdu()) {
                        cantidad = listarCarrito.get(posicionProducto2).getCantidad() + cantidad;
                        double subtotall = listarCarrito.get(posicionProducto2).getPrecioCompra() * cantidad;
                        listarCarrito.get(posicionProducto2).setCantidad(cantidad);
                        listarCarrito.get(posicionProducto2).setSubtotal(subtotall);
                    } else {
                        //variables del carrito
                        item = item + 1;
                        car = new CarritoVO();
                        car.setItem(item);
                        car.setIdProdu(productoV.getIdProducto());
                        car.setNombre(productoV.getNombreProducto());
                        car.setDescripcion(productoV.getDescripcionProducto());
                        car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                        listarCarrito.add(car);
                    }
                } else {
                    //variables del carrito
                    item = item + 1;
                    car = new CarritoVO();
                    car.setItem(item);
                    car.setIdProdu(productoV.getIdProducto());
                    car.setNombre(productoV.getNombreProducto());
                    car.setDescripcion(productoV.getDescripcionProducto());
                    car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                    listarCarrito.add(car);
                }

                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("EjemploCarrito?accion=Carrito").forward(request, response);
                break;

            case "RestarCarrito":
                int posicionProducto3 = 0;
                cantidad = 1;
                idproducto = Integer.parseInt(request.getParameter("id"));
                productoV = produDao.selectById(idproducto);

                //con el metodo sizze se conoce la cantidad de productos que tiene el carrito
                if (listarCarrito.size() > 0) {
                    //aqui se esta conociendo la posisicoon del produccto
                    for (int i = 0; i < listarCarrito.size(); i++) {
                        if (idproducto == listarCarrito.get(i).getIdProdu()) {
                            posicionProducto3 = i;
                        }
                    }
                    if (idproducto == listarCarrito.get(posicionProducto3).getIdProdu()) {
                        cantidad = listarCarrito.get(posicionProducto3).getCantidad() - cantidad;
                        double subtotall = listarCarrito.get(posicionProducto3).getPrecioCompra() * cantidad;
                        listarCarrito.get(posicionProducto3).setCantidad(cantidad);
                        listarCarrito.get(posicionProducto3).setSubtotal(subtotall);
                    } else {
                        //variables del carrito
                        item = item + 1;
                        car = new CarritoVO();
                        car.setItem(item);
                        car.setIdProdu(productoV.getIdProducto());
                        car.setNombre(productoV.getNombreProducto());
                        car.setDescripcion(productoV.getDescripcionProducto());
                        car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                        listarCarrito.add(car);
                    }
                } else {
                    //variables del carrito
                    item = item + 1;
                    car = new CarritoVO();
                    car.setItem(item);
                    car.setIdProdu(productoV.getIdProducto());
                    car.setNombre(productoV.getNombreProducto());
                    car.setDescripcion(productoV.getDescripcionProducto());
                    car.setPrecioCompra(productoV.getPrecioUnitarioProducto());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * productoV.getPrecioUnitarioProducto());
                    listarCarrito.add(car);
                }

                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("EjemploCarrito?accion=Carrito").forward(request, response);
                break;

            case "Delete":
                int idPro = Integer.parseInt(request.getParameter("idP"));
                //EL BUCLE VA A RECORRER TODALA LISTA DEL  CARRITO
                for (int i = 0; i < listarCarrito.size(); i++) {
                    //SI EL IDPRODUCTO QUE ESTA DENTRO DE LA LISTA CARRITO ES IGUAL A EL ID QUE FUE CAPTURADO
                    if (listarCarrito.get(i).getIdProdu() == idPro) {
                        //SI SE CUMPLE LA CONDICION CON EL METODO REMOVE SE ELIMINARIA
                        listarCarrito.remove(i);
                    }
                }
                break;

            case "Carrito":
                totalaPagar = 0.0;
                HttpSession sesionCarrito = request.getSession();
                sesionCarrito.setAttribute("carrito", listarCarrito);
                for (int i = 0; i < listarCarrito.size(); i++) {
                    subtotal = totalaPagar + listarCarrito.get(i).getSubtotal();;
                    totalaPagar = totalaPagar + listarCarrito.get(i).getSubtotal();
                    if (listarCarrito.get(i).getItem() >= 2) {
                        descuento = totalaPagar * 0.10;
                        totalaPagar = totalaPagar - descuento;

                    }
                }
                request.setAttribute("sub", subtotal);
                request.setAttribute("desc", descuento);
                request.setAttribute("monto", totalaPagar);
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;

            case "CarritoPedido":
                totalaPagar = 0.0;
                HttpSession sesionCarrito2 = request.getSession();
                sesionCarrito2.setAttribute("carrito", listarCarrito);
                for (int i = 0; i < listarCarrito.size(); i++) {
                    subtotal = totalaPagar + listarCarrito.get(i).getSubtotal();;
                    totalaPagar = totalaPagar + listarCarrito.get(i).getSubtotal();
                    if (listarCarrito.get(i).getItem() >= 2) {
                        descuento = totalaPagar * 0.10;
                        totalaPagar = totalaPagar - descuento;

                    }
                }
                request.setAttribute("sub", subtotal);
                request.setAttribute("desc", descuento);
                request.setAttribute("monto", totalaPagar);
                request.getRequestDispatcher("cliente/Carrito.jsp").forward(request, response);
                break;

            case "GenerarPedido":
                HttpSession sesionPedido = request.getSession();
                UsuarioVO veo = (UsuarioVO) sesionPedido.getAttribute("usuarioVo");
                if (veo == null) {
                    request.setAttribute("MensajeError", "Debes iniciar Sesion para generar el pedido");
                    request.getRequestDispatcher("EjemploCarrito?accion=Carrito").forward(request, response);
                } else {
                    String direccion = request.getParameter("direcionCliente") == null ? veo.getDireccionUsuario() : request.getParameter("direcionCliente") ;
                    PedidoVO pediVO = new PedidoVO();
                    pediVO.setDestinoPedido("direccion");
                    List<CarritoVO> listarCarrito = (List<CarritoVO>) sesionPedido.getAttribute("carrito");
                    pediVO.setDetallePedido(listarCarrito);
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String fechaPedido = sdf.format(new Date());
                    pediVO.setFechaPedido(fechaPedido);
                    pediVO.setDestinoPedido(direccion);
                    pediVO.setEstadoPedido("En Proceso");
                    pediVO.setFechaEntrega("2022-08-23");   
                    PedidoDAO pediDAO = new PedidoDAO();
                    int res = pediDAO.GenerarCompra(pediVO, veo.getIdUsuario());
                    if (res != 0 && totalaPagar > 0) {
                        request.setAttribute("MensajeExito", "Tu pedido se guardo con exito!");
                    } else {
                        request.setAttribute("MensajeError", "Tu pedido NO Se guardo con exito");
                    }
                    request.setAttribute("fechaPedido", fechaPedido);
                    request.getRequestDispatcher("cliente/factura.jsp").forward(request, response);
                }
                break;
            default:
                request.setAttribute("productos", prodVo);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        int codigoId = Integer.parseInt(request.getParameter("codigoId"));
//        String action = request.getParameter("action");
//        
//        PedidoVO VO = new PedidoVO(codigoId, action);
//        PedidoDAO DAO = new PedidoDAO(VO);
//        if (action.equals("En Proceso")) {
//            if (DAO.EnProceso(codigoId)) {
//                request.setAttribute("titleexito", "El pedido se actualizo correctamente");
//                request.getRequestDispatcher("admin/verPedidos.jsp").forward(request, response);
//            } else {
//                request.setAttribute("titleerror", "El pedido No se actualizo correctamente");
//                request.getRequestDispatcher("admin/verPedidos.jsp").forward(request, response);
//            }
//        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
