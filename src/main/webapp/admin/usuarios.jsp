<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="vo.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script>
            Swal.fire({
                position: 'top-end',
                html:'${titleerror}',
                showConfirmButton: false,
                timer: 4000,
                timerProgressBar: true
            });
        </script>
        <%} else if (request.getAttribute("titleexito") != null) {%>
        <script>
            Swal.fire({
                icon: 'warning',
                position: 'top-end',
                html:'${titleexito}',
                showConfirmButton: false,
                timer: 4000,
                timerProgressBar: true
            });
        </script>
        <%}%>


        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de usuario creado exitosamente o no
            if (request.getAttribute("mensajeErroro") != null) {%>
        <script>
            Swal.fire(
                    'No se puedo registrar!',
                    '${mensajeErroro}',
                    'error'
                    );
        </script>

        <%} else if (request.getAttribute("mensajeExitoo") != null) {%>
        <script>
            Swal.fire(
                    'Registro Exitoso!',
                    '${mensajeExitoo}',
                    'success'
                    );
        </script>
        <%}%>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a class="btn btn-primary text-white p-2 mb-2 my-3 float-end" href="" data-bs-toggle="modal" data-bs-target="#crear"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>
                    <table class="content-table" id="user">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                <th>Tipo Documento</th>
                                <th>Numero Documento</th>
                                <th>Estado</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Sexo</th>
                                <th>Cargo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="tbi-user">
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
                                    <%} else {%>
                                    <button class="btn btn-danger rounded-pill"><%=estado%></button>
                                    <%}%>
                                </td>

                                <td><%=user.getTelefonoUsuario()%></td>
                                <td><%=user.getDireccionUsuario()%></td>
                                <td><%=user.getSexoUsuario()%></td>
                                <td><%=user.getIdRol()%></td>
                                <td class="clkk">
                                    <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                                        <input type="hidden" name="codigo" value="<%=user.getIdUsuario()%>">
                                        <input type="hidden" name="action" value="6">
                                        <button type="submit" class="btn-transparent bg-transparent border-0" data-bs-toggle="modal" data-bs-target="#update"><i class="fas fa-edit text-info" style="font-size: 20px; padding: 0 10px;"></i></button>
                                    </form>
                                    <%
                                        if (user.isEstadoUsuario() == true) {%>
                                    <input type="hidden" name="codigoId" value="<%=user.getIdUsuario()%>">
                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaInactivar(<%=user.getIdUsuario()%>, true)"><i class="bi bi-person-check-fill fa-x5 text-primary" style="font-size: 22px;"></i></button>


                                    <%} else if (user.isEstadoUsuario() == false) {%>
                                    <input type="hidden" name="codigoId" value="<%=user.getIdUsuario()%>">
                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaActivar(<%=user.getIdUsuario()%>, false)"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 22px;"></i></button>
                                        <%}%>
                                </td>
                            </tr>

                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


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
    window.$('#update').modal('show');
    $(document).on('click', '#closeModal', function () {
        window.$('#update').modal('hide');
        window.$('#update').removeClass('show');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    });
</script>

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