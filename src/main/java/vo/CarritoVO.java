package vo;

public class CarritoVO {

    int item;
    int idProdu;
    String Nombre;
    String Descripcion;
    double PrecioCompra;
    int cantidad;
    double subtotal;
    String imagenProducto;

    public CarritoVO() {
    }

    public CarritoVO(int item, int idProdu, String Nombre, String Descripcion, double PrecioCompra, int cantidad, double subtotal, String imagenProducto) {
        this.item = item;
        this.idProdu = idProdu;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.PrecioCompra = PrecioCompra;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
        this.imagenProducto = imagenProducto;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdProdu() {
        return idProdu;
    }

    public void setIdProdu(int idProdu) {
        this.idProdu = idProdu;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getPrecioCompra() {
        return PrecioCompra;
    }

    public void setPrecioCompra(double PrecioCompra) {
        this.PrecioCompra = PrecioCompra;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getImagenProducto() {
        return imagenProducto;
    }

    public void setImagenProducto(String imagenProducto) {
        this.imagenProducto = imagenProducto;
    }
}
