<%@page import="vo.ProductoVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <jsp:include page="WEB-INF/paginas/comunes/head-css.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/EliminarProductoCarrito.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="WEB-INF/paginas/comunes/header-carrito.jsp" />
        <div class="container mt-4">
            <div class="row">
                <div class="col-sm-8">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Item</th>
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
                                    <td>${car.getNombre()}</td>
                                    <td>${car.getDescripcion()}</td>
                                    <td>${car.getPrecioCompra()}</td>
                                    <td><i class="fas fa-minus-circle me-2 text-danger"></i>${car.getCantidad()}<i class="fas fa-plus-circle ms-2 text-success"></i></td>
                                    <td>${car.getSubtotal()}</td>
                                    <td>
                                        <input type="hidden" id="idP" value="${car.getIdProdu()}">
                                        <button class="btn-transparent border-0 bg-transparent" id="btnDelete"><i class="fa-solid fa-trash text-danger" style="font-size: 25px;"></i></button>
                                    </td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col ms-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal</label>
                            <input type="text" value="${monto}" readonly="" class="form-control">
                            <label>Descuento</label>
                            <input type="text" value="$ 0.0" readonly="" class="form-control">
                            <label>Total a pagar</label>
                            <input type="text" value="${monto}" readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="" class="btn btn-primary btn-block">Realizar Pago</a>
                            <a href="EjemploCarrito?accion=GenerarPedido" class="btn btn-danger btn-block">Generar Compra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de activar e inactivar
            if (request.getAttribute("MensajeError") != null) {%>
        ${MensajeError}
        <%} else {%>
        ${MensajeExito}
        <%}%>
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <jsp:include page="/WEB-INF/paginas/login.jsp" />
        <jsp:include page="/WEB-INF/paginas/signup.jsp" />



        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
    </body>
</html>