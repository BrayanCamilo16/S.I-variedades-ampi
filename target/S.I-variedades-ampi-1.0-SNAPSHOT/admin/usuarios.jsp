<%@page import="vo.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cache.jsp" %>
<%@include file="ValidarRolAdmin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <title>VariedadesAmpi|Administrador</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/EstadosUsuario.js" type="text/javascript"></script>
    </head>
    <body>  
        <%            UsuarioVO VO = new UsuarioVO();
//    boolean ConsultadoUsuario = false;
//    String modalStatic = "";
            HttpSession sesionn = request.getSession();
            if (sesionn.getAttribute("ConsultadoUsuario") != null) {
//        ConsultadoUsuario = true;
//        modalStatic = "data-backdrop=\"static\" data-keyboard=\"false\" tabindex=\"-1\"";
//    }
        %>
        <%@page import="vo.UsuarioVO" %>
        <%
            UsuarioVO VoO = new UsuarioVO();
        //    boolean ConsultadoUsuario = false;
        //    String modalStatic = "";
            if (sesionn.getAttribute("ConsultadoUsuario") != null) {
        //        ConsultadoUsuario = true;
        //        modalStatic = "data-backdrop=\"static\" data-keyboard=\"false\" tabindex=\"-1\"";
        //    }
        %>
        <div class="modal fade" id="update">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <div>
                            <h3 class="modal-title fw-bold lead">Actualiza un Usuario</h3>
                            <span>Es f&#225;cil y r&#225;pido.</span>
                        </div>
                        <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal"
                                aria-label="Close"><i class="fas fa-times"></i></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;"
                          id="formulario">
                        <div class="modal-body">


                            <input type="hidden" name="codigoId" value="${ConsultadoUsuario.idUsuario}">


                            <label>Nombre</label>
                            <input type="text" disabled name="nombre"  value="${ConsultadoUsuario.nombreUsuario}">

                            <label>Apellido</label>
                            <input type="text" disabled  name="apellido" value="${ConsultadoUsuario.apellidoUsuario}">

                            <label>Email</label>
                            <input type="text" disabled  name="email" value="${ConsultadoUsuario.emailUsuario}">

                            <label>Contraseña</label>
                            <input type="hidden" disabled  name="pass" value="${ConsultadoUsuario.passUsuario}">


                            <label>Tipo Documento</label>
                            <select name="tipoDocu" disabled>
                                <option <%=VO.getTipoDocumento().equals("1") ? "selected" : " "%> value="1">Cedula de Ciudadania</option>
                                <option <%=VO.getTipoDocumento().equals("2") ? "selected" : " "%> value="2">Cedula de Extranjeria</option>
                                <option <%=VO.getTipoDocumento().equals("3") ? "selected" : " "%> value="3">Tarjeta Identidadad</option>
                                <option <%=VO.getTipoDocumento().equals("4") ? "selected" : " "%> value="4">Pasaporte</option>
                                <option <%=VO.getTipoDocumento().equals("5") ? "selected" : " "%> value="5">NIT</option>
                            </select>

                            <label>Numero Documento</label>
                            <input type="text" name="numDocu" disabled value="${ConsultadoUsuario.numDocumentoUsuario}">

                            <label>Telefono</label>
                            <input type="text" name="telefono" disabled value="${ConsultadoUsuario.telefonoUsuario}">

                            <label>Direccion</label>
                            <input type="text" name="direccion" disabled value="${ConsultadoUsuario.direccionUsuario}">

                            <label>Sexo</label>
                            <select name="sexo" disabled>
                                <option <%=VO.getSexoUsuario().equals("1") ? "selected" : " "%> value="1">Masculino</option>
                                <option <%=VO.getSexoUsuario().equals("2") ? "selected" : " "%> value="2">Femenino</option>
                                <option <%=VO.getSexoUsuario().equals("3") ? "selected" : " "%> value="3">Otro</option>
                            </select>

                            <label>Estado</label>
                            <input type="text" name="estado" disabled value="${ConsultadoUsuario.estadoUsuario}">

                            <label>Rol</label>
                            <select name="rol">
                                <option <%=VO.getIdRol().equals("1") ? "selected" : " "%> value="1">Administrador</option>
                                <option <%=VO.getIdRol().equals("2") ? "selected" : " "%> value="2">Empleado</option>
                                <option <%=VO.getIdRol().equals("3") ? "selected" : " "%> value="3">Cliente</option>
                            </select>
                        </div>



                        <div class="modal-footer d-flex justify-content-center">
                            <input type="hidden" value="3" name="action">
                            <button class="btn btn-primary btn-lg">Actualizar Usuario</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <%}%>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>
            window.$('#update').modal('show');
            $(document).on('click', '#closeModal', function () {
            location.href = "${pageContext.request.contextPath}/admin/productos.jsp";
            });
        </script>
        <%}%>

        ${ConsultadoUsuario}
        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /Navbar  -->

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
        <div class="todo">
            <a class="btn btn-primary" href="" data-bs-toggle="modal" data-bs-target="#crear"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>
            <table id="user" class="tables">
                <tr class="theadd">
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

                    <th class="titulo-usuarios text-center" colspan="3">Acciones</th>
                </tr>
                <tfoot> 
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

                        <th class="titulo-usuarios text-center"  colspan="3">Acciones</th>
                    </tr>
                </tfoot> 
                <%UsuarioDAO usuDAO = new UsuarioDAO();
                    ArrayList<UsuarioVO> listarUsuarios = usuDAO.listar();
                    request.setAttribute("lista", listarUsuarios);
                    String estadou = "";
                %>

                <c:forEach items="${lista}" var="u">
                    <tbody>
                        <tr>
                            <td class="text-center">${u.getIdUsuario()}</td>
                            <td class="text-center">${u.getNombreUsuario()}</td>
                            <td class="text-center">${u.getApellidoUsuario()}</td>
                            <td class="text-center">${u.getEmailUsuario()}</td>
                            <td class="text-center">${u.getTipoDocumento()}</td>
                            <td class="text-center">${u.getNumDocumentoUsuario()}</td>
                            <td class="text-center">
                                <c:if test="${u.isEstadoUsuario() == true}">
                                    <button class="btn btn-primary rounded-pill"><%=estadou = "Activo"%></button>
                                </c:if>
                                <c:if test="${u.isEstadoUsuario() == false}">
                                    <button class="btn btn-danger rounded-pill"><%=estadou = "Inactivo"%></button>
                                </c:if>
                            </td>
                            <td class="text-center">${u.getTelefonoUsuario()}</td>
                            <td class="text-center">${u.getDireccionUsuario()}</td>
                            <td class="text-center">${u.getSexoUsuario()}</td>
                            <td class="text-center">${u.getIdRol()}</td>
                            <td class="text-center">
                                <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                                    <input type="hidden" name="codigo" value="${u.getIdUsuario()}">
                                    <input type="hidden" name="action" value="6">
                                    <button type="submit" class="btn-transparent bg-transparent border-0" data-bs-toggle="modal" data-bs-target="#update"><i class="fas fa-edit text-info"></i></button>
                                </form>
                            </td>
                            <c:if test="${u.isEstadoUsuario() == true}">
                                <td>
                                    <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaInactivar(${u.getIdUsuario()}, true)"><i class="bi bi-person-check-fill fa-x5 text-primary" style="font-size: 25px;"></i></button>
                                </td>
                            </c:if>


                            <c:if test="${u.isEstadoUsuario() == false}">
                                <td>
                                    <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaActivar(${u.getIdUsuario()}, false)"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 25px;"></i></button>
                                </td>
                            </c:if>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->  

        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <jsp:include page="CrearUsuario.jsp" />
        <jsp:include page="ModificarUsuario.jsp" />

    </body>
</html>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script>
                                        $(document).ready(function () {
                                            $('#user').DataTable({
                                                "language": {
                                                    "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
                                                }
                                            });
                                        });
</script>

