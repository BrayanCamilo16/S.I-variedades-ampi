<%@include file="../cache.jsp" %>
<%@include file="ValidarRolVendedor.jsp" %>
<%@page import="vo.UsuarioVO"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
    </head>
    <body>
        <!-- header  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar-roles.jsp" />
        <!-- /header  -->
        <div class="todoContenidooo">
            <div id="medioContenidooo" class="medioContenidooo">
                <div class="cajasi">

                    <div class="cajad">
                        <h1>Gestion de Productos</h1>
                        <img src="../img/productos.png" alt=""/>
                        <a href="productos.jsp">
                            <div class="masI">
                                <span class="psni">Mas Info<i class="fa-solid fa-circle-arrow-right"></i></span>
                            </div>
                        </a>

                    </div>

                    <div class="cajad">
                        <h1>Gestion de Categorias</h1>
                        <img src="../img/categorias.png" alt=""/>
                        <a href="categorias.jsp">
                            <div class="masI">
                                <span class="psni">Mas Info<i class="fa-solid fa-circle-arrow-right"></i></span>
                            </div>
                        </a>
                    </div>

                    <div class="cajad">
                        <h1>Reportes</h1>
                        <img src="../img/reporte.png" alt=""/>
                        <a href="reporte.jsp">
                            <div class="masI">
                                <span class="psni">Mas Info<i class="fa-solid fa-circle-arrow-right"></i></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->
        
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        
        <jsp:include page="../WEB-INF/paginas/ActualizarPerfil.jsp" />
    </body>
</html>