<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<%@page import="vo.ProductoVO"%>
<%@include file="../cache.jsp" %>
<%@include file="ValidarRolVendedor.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/EstadoProducto.js" type="text/javascript"></script>
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /Navbar  -->
        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de activar e inactivar
            if (request.getAttribute("titleerror") != null) {%>
        <script>
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: '${titleerror}',
                showConfirmButton: false,
                timer: 2000
            })
        </script>
        <%} else if (request.getAttribute("titleexito") != null) {%>
        <script>
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: '${titleexito}',
                showConfirmButton: false,
                timer: 2000
            })
        </script>
        <%}%>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <buttom class=" btn btn-primary text-white p-2 mb-2 my-3 float-end" data-bs-toggle="modal" data-bs-target="#registrarProducto"><i class="fas fa-plus-circle me-1"></i>Agregar producto</buttom>
                    <table class="content-table" id="product">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Descripci&#243;n</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Estado</th>
                                <th>Imagen</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  
                                ProductoDAO productoDao = new ProductoDAO();
                                ProductoVO productoVo = null;
                                List<ProductoVO> productos = productoDao.selectAllProducts();
                                DecimalFormat f = new DecimalFormat("##.00");
                                int contadorProductos = 0;

                                for (int i = 0; i < productos.size(); i++) {
                                    productoVo = productos.get(i);
                                    contadorProductos++;
                            %>
                            <tr class="">
                                <td><%= contadorProductos%></td>
                                <td><%= productoVo.getNombreProducto()%></td>
                                <td><%= productoVo.getDescripcionProducto()%></td>
                                <td>$ <%= f.format(productoVo.getPrecioUnitarioProducto())%></td>
                                <td><%= f.format(productoVo.getStockProducto())%></td>
                                <td><%= productoVo.getEstadoProducto()%></td>
                                <td><img  src="${pageContext.request.contextPath}/files/producto/<%= productoVo.getNombreImgProducto()%>" alt="<%= productoVo.getNombreProducto()%>"/></td>
                                <td class="d-flex justify-content-evenly align-items-center h-100">
                                    <form action="${pageContext.request.contextPath}/Producto" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="idProducto" value="<%= productoVo.getIdProducto()%>">
                                        <input type="hidden" name="opcion" value="1">
                                        <button type="submit" class="border-0 bg-transparent text-primary"><i class="fas fa-edit"></i></button>
                                    </form>
                                    <%
                                        if (productoVo.getEstadoProducto().equals("Activo")) {%>

                                    <input type="hidden" name="codigoId" value="<%=productoVo.getIdProducto()%>">
                                    <button class="btn-transparent border-0 bg-transparent py-2" onclick="alertaInactivarP(<%=productoVo.getIdProducto()%>, 'Activo')"><i class="bi bi-person-check-fill fa-x5 text-primary" style="font-size: 25px;"></i></button>

                                    <%} else if (productoVo.getEstadoProducto().equals("Inactivo")) {%>

                                    <input type="hidden" name="codigoId" value="<%=productoVo.getIdProducto()%>">
                                    <button class="btn-transparent border-0 bg-transparent py-2" onclick="alertaActivarP(<%=productoVo.getIdProducto()%>, 'Inactivo')"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 25px;"></i></button>

                                    <%}%>
                                </td>

                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <!-- registrar categoria  -->
        <jsp:include page="../WEB-INF/paginas/comunes/registrarProducto.jsp" />
        <!-- /registrar categoria  -->
    </body>
</html>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script>
                                        $(document).ready(function () {
                                            $('#product').DataTable({
                                                "language": {
                                                    "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
                                                }
                                            });
                                        });
</script>

