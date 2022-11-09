<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="vo.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VariedadesAmpi|Administrador</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/EstadosUsuario.js"></script>
    </head>
    <body>
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de activar e inactivar
            if (request.getAttribute("titleerror") != null) {%>
        ${titleerror}
        <%} else {%>
        ${titleexito}
        <%}%>

        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de usuario creado exitosamente o no
            HttpSession sesiones = request.getSession();
            if (sesiones.getAttribute("mensajeErroro") != null) {%>
        <script>
            alert("${mensajeErroro}");
        </script>

        <%} else if (sesiones.getAttribute("mensajeExitoo") != null) {%>
        <script>
            alert("${mensajeExitoo}");
        </script>
        <%}%>
        <a class="btn btn-primary text-white p-2 mb-2 my-3 float-end" href="" data-bs-toggle="modal" data-bs-target="#crear"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>
        <table id="user">
            <thead>
                <tr>
                    <th class="titulo-usuarios text-center">#</th>
                    <th class="titulo-usuarios text-center">Nombre</th>
                    <th class="titulo-usuarios text-center">Apellido</th>
                    <th class="titulo-usuarios text-center">Email</th>
                    <th class="titulo-usuarios text-center">Tipo Documento</th>
                    <th class="titulo-usuarios text-center">Numero Documento</th>
                    <th class="titulo-usuarios text-center">Estado</th>
                    <th class="titulo-usuarios text-center">Telefono</th>
                    <th class="titulo-usuarios text-center">Direccion</th>
                    <th class="titulo-usuarios text-center">Sexo</th>
                    <th class="titulo-usuarios text-center">Cargo</th>
                    <th class="titulo-usuarios text-center">Acciones</th>
                </tr>
            </thead>
            <%
                UsuarioVO user = new UsuarioVO();
                UsuarioDAO userD = new UsuarioDAO();
                ArrayList<UsuarioVO> listaUsuarios = userD.listar();
                for (int i = 0; i < listaUsuarios.size(); i++) {
                    user = listaUsuarios.get(i);
                    String estado = " ";
                    if (user.isEstadoUsuario() == true) {
                        estado = "Activo";
                    } else if (user.isEstadoUsuario() == false) {
                        estado = "Inactivo";
                    }
            %>
            <tr>
                <td><%=user.getIdUsuario()%></td>
                <td><%=user.getNombreUsuario()%></td>
                <td><%=user.getApellidoUsuario()%></td>
                <td><%=user.getEmailUsuario()%></td>
                <td><%=user.getTipoDocumento()%></td>
                <td><%=user.getNumDocumentoUsuario()%></td>
                <td>
                    <%
                        if (user.isEstadoUsuario() == true) {%>
                    <button class="btn btn-primary rounded-pill"><%=estado%></button>
                    <%} else if (user.isEstadoUsuario() == false) {%>
                    <button class="btn btn-danger rounded-pill"><%=estado%></button>
                    <%}%>
                </td>

                <td><%=user.getTelefonoUsuario()%></td>
                <td><%=user.getDireccionUsuario()%></td>
                <td><%=user.getSexoUsuario()%></td>
                <td><%=user.getIdRol()%></td>
                <td>
                    <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                        <input type="hidden" name="codigo" value="<%=user.getIdUsuario()%>">
                        <input type="hidden" name="action" value="6">
                        <button type="submit" class="btn-transparent bg-transparent border-0" data-bs-toggle="modal" data-bs-target="#update"><i class="fas fa-edit text-info"></i></button>
                    </form>
                    <%
                        if (user.isEstadoUsuario() == true) {%>
                    <input type="hidden" name="codigoId" value="<%=user.getIdUsuario()%>">
                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaInactivar(<%=user.getIdUsuario()%>, true)"><i class="bi bi-person-check-fill fa-x5 text-primary" style="font-size: 25px;"></i></button>


                    <%} else if (user.isEstadoUsuario() == false) {%>
                    <input type="hidden" name="codigoId" value="<%=user.getIdUsuario()%>">
                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaActivar(<%=user.getIdUsuario()%>, false)"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 25px;"></i></button>

                    <%}%>
                </td>
            </tr>

            <%}%>
        </table>

        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->
        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
        <jsp:include page="ModificarUsuario.jsp"/>
    </body>
</html>
<script>
    $(document).ready(function () {
        $('#user').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<jsp:include page="CrearUsuario.jsp"/>
<script>
    window.$('#update').modal('show');
    $(document).on('click', '#closeModal', function () {
        window.$('#update').modal('hide');
        window.$('#update').removeClass('show');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    });
</script>