<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/RecuperacionPassword.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo-variedades-ampi.png"/>
        <jsp:include page="WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <title>Nueva Contraseña</title>
    </head>
    <body class="fondoRR">
        <div id="containerRR" class="filterr">
            <div class="todoi">
                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""/></a>
                <form action="${pageContext.request.contextPath}/Usuario" method="POST" id="addformulario" class="formue">
                    <div class="nueva">
                        <label for="pass">Nueva contrase&ntilde;a:</label>
                        <input type="password" name="pass" placeholder="Nueva contrase&ntilde;a" id="pass" class="passw">
                        <i class="fa-solid fa-eye eye eye" id="eye"></i>
                    </div>
                    <div class="confirmo">
                        <label for="pass2">Confirmar contrase&ntilde;a:</label>
                        <input type="password" name="pass2" placeholder="Confirmar contrase&ntilde;a" id="pass2">
                        <i class="fa-solid fa-eye eye" id="eye2"></i>
                    </div><br><br>
                    <p id="alerta" class="d-none">Las contraseñas no coinciden, asegurese de suministrarlas correctamente<i class="fa-solid fa-circle-exclamation"></i></p>
                    <button type="submit" class="ali">Validar<i class="fa-solid fa-check"></i></button>
                    <input type="hidden" value="10" name="action">

                    <%
                        //cuando es diferente a nulo es que si hubo un error
                        if (request.getAttribute("mensajeError") != null) {%>
                    ${mensajeError}
                    <% } else {%>
                    ${mensajeExito}
                    <%}%>
                </form>
            </div>
        </div>
        <script>
            const formulario = document.getElementById("addformulario");
            const password1 = document.getElementById("pass");
            const password2 = document.getElementById("pass2");
            const alerta = document.getElementById("alerta");

            formulario.addEventListener('submit', (e) => {
                if (password1.value !== password2.value) {
                    alerta.classList.remove("d-none");
                    alerta.style.color = "#ff0000";
                    alerta.style.background = "#F5C2C2";
                    alerta.style.padding = "20px";
                    alerta.style.width = "100%";
                    e.preventDefault();
                }
                
            });

            var eye = document.getElementById("eye");
            var eye2 = document.getElementById("eye2");
            var input = document.getElementById("pass");
            var input2 = document.getElementById("pass2");
            eye.addEventListener("click", function () {
                if (input.type == "password") {
                    input.type = "text";
                    eye.style.opacity = 0.8;
                    eye.style.color = "#72B1F0";
                } else {
                    input.type = "password";
                }
            });
            eye2.addEventListener("click", function () {
                if (input2.type == "password") {
                    input2.type = "text";
                    eye2.style.opacity = 0.8;
                    eye2.style.color = "#72B1F0";
                } else {
                    input2.type = "password";
                }
            });
        </script>
</html>
