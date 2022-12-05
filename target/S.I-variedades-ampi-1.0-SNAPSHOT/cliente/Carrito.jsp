<%@page import="vo.ProductoVO"%>
<%@include file="../cache.jsp" %>
<%@include file="ValidarRolCliente.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/EliminarProductoCarrito.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <div class="container mt-4">
            <div class="row">
                <div class="col-sm-4">
                    <table class="tablita">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Producto</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td>${car.getItem()}</td>
                                    <td><img src="${pageContext.request.contextPath}/files/producto/${car.getImagenProducto()}"/></td>
                                    <td>${car.getNombre()}</td>
                                    <td>${car.getDescripcion()}</td>
                                    <td>$${car.getPrecioCompra()}</td>
                                    <td class="clk">
                                        <form method="POST" action="${pageContext.request.contextPath}/EjemploCarrito?accion=RestarCarrito&id=${car.getIdProdu()}">
                                            <button type="submit" class="border-0 bg-transparent"><i class="fas fa-minus-circle me-2 text-danger"></i></button>
                                        </form>
                                        ${car.getCantidad()}
                                        <form method="POST" action="${pageContext.request.contextPath}/EjemploCarrito?accion=SumarCarrito&id=${car.getIdProdu()}">
                                            <button type="submit" class="border-0 bg-transparent"><i class="fas fa-plus-circle ms-2 text-success"></i></button>
                                        </form>
                                    </td>
                                    <td>$${car.getSubtotal()}</td>
                                    <td>
                                        <input type="hidden" id="idP" value="${car.getIdProdu()}">
                                        <a href="#" id="btnDelete"><button class="btn-transparent border-0 bg-transparent"><i class="fa-solid fa-trash text-danger" style="font-size: 25px;"></i></button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col ms-4">
                    <div class="pedidoo" style="float: right">
                        <div class="pedidoti">
                            <h3>Generar Pedido</h3>
                        </div>
                        <div class="tarjetap">
                            <label>Subtotal:</label>
                            <input type="text" value="$${monto}" readonly="">
                            <label>Descuento:</label>
                            <input type="text" value="${desc}" readonly="">
                            <label>Total a pagar:</label>
                            <input type="text" value="$${monto}" readonly="">
                        </div>
                        <div class="tarjetaf">
                            <button type="button" data-bs-toggle="modal" data-bs-target="#generarPedido" class="buty">Realizar Pago<i class="fa-solid fa-dollar-sign"></i></button><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->
        <jsp:include page="generarPedido.jsp" />
        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

    </body>
</html>