<%@include file="../cache.jsp" %>
<%@include file="ValidarRolCliente.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-roles.jsp" />
        <!-- /Navbar  -->

        <div class="todoContenidoooo">
            <div id="medioContenidoooo" class="medioContenidoooo">
                <div class="cajasii">

                    <div class="cajadd">
                        <h1>Mis pedidos</h1>
                        <p class="con">Consulta todos tus pedidos!</p>
                        <i class="fas fa-shopping-cart hol"></i>
                        <a href="pedidos.jsp">
                            <div class="masII">
                                <span class="psnii">Mas Info<i class="fa-solid fa-circle-arrow-right"></i></span>
                            </div>
                        </a>

                    </div>

                    <!--                    <div class="cajadd">
                                            <h1>Mis facturas</h1>
                                            <p class="con">Consulta todas tus facturas!</p>
                                            <i class="fas fa-solid fa-envelope-open-text hol"></i>
                                            <a href="facturas.jsp">
                                                <div class="masII">
                                                    <span class="psnii">Mas Info<i class="fa-solid fa-circle-arrow-right"></i></span>
                                                </div>
                                            </a>
                                        </div>-->
                </div>
            </div>
        </div>
        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("MensajeError") != null) {%>
        <script>
            Swal.fire({
                html:'${MensajeError}',
                showConfirmButton: false,
                timerProgressBar: true
            });
        </script>
        <%} else if (request.getAttribute("MensajeExito") != null) {%>
        <script>
            Swal.fire({
                icon: 'success',
                html:'${MensajeExito}',
                showConfirmButton: false,
                timerProgressBar: true
            });
        </script>
        <%}%>
        <a aria-current="page" href="${pageContext.request.contextPath}/EjemploCarrito?accion=CarritoPedido"><div class="carro-iconoo"><i class="fas fa-shopping-cart icono">(<label style="color: black">${contador}</label>)</i></div></a>
        <br><br><br>
        <section>
            <h4 class="compras-cate">Compra por categor&#237;as</h4>
            <!-- categorias  -->
            <jsp:include page="../WEB-INF/paginas/comunes/categorias.jsp" />
            <!-- /categorias  -->
            <h4 class="compras-produ">Productos</h4>
            <!-- Productos  -->
            <jsp:include page="../WEB-INF/paginas/comunes/productos.jsp" />
            <!-- /Productos  -->

        </section>

        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
        <jsp:include page="../WEB-INF/paginas/ActualizarPerfil.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <script src="${pageContext.request.contextPath}/js/sliderCategorias.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/sliderProductos.js" type="text/javascript"></script>
    </body>
</html>
