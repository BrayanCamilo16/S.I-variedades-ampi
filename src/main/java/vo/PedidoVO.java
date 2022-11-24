package vo;

import java.util.List;

public class PedidoVO {
    private int idPedido;
    private String fechaPedido;
    private String fechaEntrega;
    private String destinoPedido;
    private String estadoPedido;
    private int idProducto;
    private List<CarritoVO>detallePedido;

    public PedidoVO() {
    }

    public PedidoVO(int idPedido, String estadoPedido) {
        this.idPedido = idPedido;
        this.estadoPedido = estadoPedido;
    }

    public PedidoVO(int idPedido, String fechaPedido, String fechaEntrega, String destinoPedido, String estadoPedido) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
        this.destinoPedido = destinoPedido;
        this.estadoPedido = estadoPedido;
    }

    public PedidoVO(String fechaPedido, String fechaEntrega, String destinoPedido, String estadoPedido) {
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
        this.destinoPedido = destinoPedido;
        this.estadoPedido = estadoPedido;
    }

    public PedidoVO(int idPedido, String fechaPedido, String fechaEntrega, String destinoPedido, String estadoPedido, int idProducto) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
        this.destinoPedido = destinoPedido;
        this.estadoPedido = estadoPedido;
        this.idProducto = idProducto;
    }

    public PedidoVO(String fechaPedido, String fechaEntrega, String destinoPedido, String estadoPedido, int idProducto, List<CarritoVO> detallePedido) {
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
        this.destinoPedido = destinoPedido;
        this.estadoPedido = estadoPedido;
        this.idProducto = idProducto;
        this.detallePedido = detallePedido;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(String fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getDestinoPedido() {
        return destinoPedido;
    }

    public void setDestinoPedido(String destinoPedido) {
        this.destinoPedido = destinoPedido;
    }

    public String getEstadoPedido() {
        return estadoPedido;
    }

    public void setEstadoPedido(String estadoPedido) {
        this.estadoPedido = estadoPedido;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public List<CarritoVO> getDetallePedido() {
        return detallePedido;
    }

    public void setDetallePedido(List<CarritoVO> detallePedido) {
        this.detallePedido = detallePedido;
    }


    @Override
    public String toString() {
        return "PedidoVO{" + "idPedido=" + idPedido + ", fechaPedido=" + fechaPedido + ", fechaEntrega=" + fechaEntrega + ", destinoPedido=" + destinoPedido + ", estadoPedido=" + estadoPedido + ", idProducto=" + idProducto + '}';
    }
    
}
