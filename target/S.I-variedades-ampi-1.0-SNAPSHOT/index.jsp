<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <title>Variedades Ampi</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/paginas/comunes/alerta.jsp" />
        <!-- header  -->
        <jsp:include page="WEB-INF/paginas/comunes/header.jsp" />
        <!-- /header  -->

        <%
            //cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("mensajeErrorrr") != null) {%>
        ${mensajeErrorrr}
        <% } else {%>
        <%}%>


        <%
            //cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}
        <% } else {%>
        ${mensajeExito}
        <%}%>


        <!--        este es el  banner-->

    <banner>
        <div class="infor">
            <h1>Bienvenidos a Variedades Ampi</h1>
            <p>Sistema de informacion para manejar todo el proceso de facturacion de los pedidos de la empresa Variedades Ampi.</p>
        </div>
        <div class="curveado">
            <img src="${pageContext.request.contextPath}/img/bannerwaves.svg"></a>
        </div>
    </banner><br><br>
    <!--fin del banner-->
    <section>
        <h4 class="compras-cate">Compra por categor&#237;as</h4>
        <!-- categorias  -->
        <jsp:include page="WEB-INF/paginas/comunes/categorias.jsp" />
        <!-- /categorias  -->
        <h4 class="compras-produ">Productos</h4>
        <!-- Productos  -->
        <jsp:include page="WEB-INF/paginas/comunes/productos.jsp" />
        <!-- /Productos  -->
    </section>

    <%
        //este es el mensaje cuando el usuario intenta ingresar, pero su estado esta inactivo
        //cuando es diferente a nulo es que si hubo un error
        if (request.getAttribute("tituloErrorr") != null) {%>
    <h1>${tituloErrorr}</h1>
    <span>${mensajeDescriptivoo}</span>
    <%}%>
    <!-- footer  -->
    <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
    <!-- /footer  -->

    <jsp:include page="/WEB-INF/paginas/login.jsp" />
    <jsp:include page="/WEB-INF/paginas/signup.jsp" />



    <!-- File js  -->
    <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
    <!-- /File js  -->

    <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
    <script src="${pageContext.request.contextPath}/js/sliderC.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/slider.js" type="text/javascript"></script>
</body>
</html>
