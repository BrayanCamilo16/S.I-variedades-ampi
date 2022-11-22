<%@page import="vo.UsuarioVO" %>
<%
    UsuarioVO VO = (UsuarioVO) request.getAttribute("UsuarioR");
//    boolean ConsultadoUsuario = false;
//    String modalStatic = "";
    if (request.getAttribute("UsuarioR") != null) {
//        ConsultadoUsuario = true;
%>
<div class="modal fade" id="perfil">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content" style="width: 1000px; right: 50%">

            <form method="post" action="${pageContext.request.contextPath}/Usuario" style="overflow-y: scroll;">
                <div class="modal-body" style="padding: 1px">
                    <div class="todop">
                        <div class="jueg">
                            <button type="button" class="botonsit" data-bs-dismiss="modal"
                                    aria-label="Close"><i class="fas fa-times"></i></button>
                            <div class="iamgenu">
                                <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""/>
                            </div>
                        </div>
                        <div class="kilo">
                            <div class="modal-header bg-primary">
                                <div class="headersito">
                                    <h3 class="re">Mi Perfil</h3>
                                </div>
                            </div>
                            <div class="formy">
                                <input type="hidden" name="codigoId" value="${UsuarioR.idUsuario}">

                                <label for="nombre" class="formulario_label">Nombre</label>
                                <input type="text" class="form-control mt-1" name="nombre" value="${UsuarioR.nombreUsuario}">

                                <label for="apellido" class="formulario_label">Apellido</label>
                                <input type="text" class="form-control mt-1" name="apellido" value="${UsuarioR.apellidoUsuario}">

                                <label for="emailSingup" class="formulario_label">Email</label>
                                <input type="text" class="form-control mt-1" name="email" value="${UsuarioR.emailUsuario}">

                                <label for="password" class="formulario_label">Contraseña</label>
                                <input type="password" class="form-control mt-1" name="pass" value="${UsuarioR.passUsuario}">


                                <label for="tipo-doc" class="formulario_label">Tipo Documento</label>
                                <select class="form-select" name="tipoDocu">
                                    <option <%=VO.getTipoDocumento().equals("1") ? "selected" : " "%> value="1">Cedula de Ciudadania</option>
                                    <option <%=VO.getTipoDocumento().equals("2") ? "selected" : " "%> value="2">Cedula de Extranjeria</option>
                                    <option <%=VO.getTipoDocumento().equals("3") ? "selected" : " "%> value="3">Tarjeta Identidadad</option>
                                    <option <%=VO.getTipoDocumento().equals("4") ? "selected" : " "%> value="4">Pasaporte</option>
                                    <option <%=VO.getTipoDocumento().equals("5") ? "selected" : " "%> value="5">NIT</option>
                                </select>

                                <label for="num-documento" class="formulario_label">Numero Documento</label>
                                <input type="text" class="form-control mt-1" name="numDocu" value="${UsuarioR.numDocumentoUsuario}">

                                <label for="telefono" class="formulario_label">Telefono</label>
                                <input type="text" class="form-control mt-1" name="telefono" value="${UsuarioR.telefonoUsuario}">

                                <label for="direccion" class="formulario_label">Direccion</label>
                                <input type="text" class="form-control mt-1" name="direccion" value="${UsuarioR.direccionUsuario}">

                                <label for="sexo" class="formulario_label">Sexo</label>
                                <select class="form-select" name="sexo">
                                    <option <%=VO.getSexoUsuario().equals("1") ? "selected" : " "%> value="1">Masculino</option>
                                    <option <%=VO.getSexoUsuario().equals("2") ? "selected" : " "%> value="2">Femenino</option>
                                    <option <%=VO.getSexoUsuario().equals("3") ? "selected" : " "%> value="3">Otro</option>
                                </select>

                                <label for="estado" class="formulario_label">Estado</label>
                                <input type="text" class="form-control mt-1" name="estado" disabled value="${UsuarioR.estadoUsuario}">

                                <label for="rol" class="formulario_label">Rol</label>
                                <select class="form-select" name="rol" disabled>
                                    <option <%=VO.getIdRol().equals("1") ? "selected" : " "%> value="1">Administrador</option>
                                    <option <%=VO.getIdRol().equals("2") ? "selected" : " "%> value="2">Empleado</option>
                                    <option <%=VO.getIdRol().equals("3") ? "selected" : " "%> value="3">Cliente</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="registro-us">Actualizar Perfil<i class="fa-solid fa-pen-to-square"></i></button>
                    <input type="hidden" value="3" name="action">
                </div>
            </form>
        </div>
    </div>
</div>
<%}%>
