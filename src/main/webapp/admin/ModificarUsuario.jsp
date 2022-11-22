<%@page import="vo.UsuarioVO" %>
<%
    UsuarioVO VO = (UsuarioVO) request.getAttribute("ConsultadoUsuario");
//    boolean ConsultadoUsuario = false;
//    String modalStatic = "";
    if (request.getAttribute("ConsultadoUsuario") != null) {
//        ConsultadoUsuario = true;
%>

<div class="modal fade" id="update">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content" style="width: 600px;">
            <div class="modal-header bg-primary">
                <div class="headersito">
                    <h3 class="re">Actualiza un Usuario</h3>
                    <span class="text-white">Es f&#225;cil y r&#225;pido.</span>
                </div>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal"
                        aria-label="Close" id="closeModal"><i class="fas fa-times"></i></button>
            </div>
            <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;"
                  id="formulario">
                <div class="modal-body">
                    <div class="imagen-u">
                        <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""/>
                    </div>

                    <div class="formy">

                        <input type="hidden" name="codigoId" value="${ConsultadoUsuario.idUsuario}">

                        <label for="nombre" class="formulario_label">Nombre</label>
                        <input type="text" class="form-control mt-1" disabled name="nombre"  value="${ConsultadoUsuario.nombreUsuario}">

                        <label for="apellido" class="formulario_label">Apellido</label>
                        <input type="text" class="form-control mt-1" disabled  name="apellido" value="${ConsultadoUsuario.apellidoUsuario}">

                        <label for="emailSingup" class="formulario_label">Correo electr&#243;nico</label>
                        <input type="text" class="form-control mt-1" disabled  name="email" value="${ConsultadoUsuario.emailUsuario}">

                        <input type="hidden" disabled  name="pass" value="${ConsultadoUsuario.passUsuario}">

                        <label for="tipo-doc" class="formulario_label">Tipo de Documento</label>
                        <select class="form-select" name="tipoDocu" disabled>
                            <option <%=VO.getTipoDocumento().equals("1") ? "selected" : " "%> value="1">Cedula de Ciudadania</option>
                            <option <%=VO.getTipoDocumento().equals("2") ? "selected" : " "%> value="2">Cedula de Extranjeria</option>
                            <option <%=VO.getTipoDocumento().equals("3") ? "selected" : " "%> value="3">Tarjeta Identidadad</option>
                            <option <%=VO.getTipoDocumento().equals("4") ? "selected" : " "%> value="4">Pasaporte</option>
                            <option <%=VO.getTipoDocumento().equals("5") ? "selected" : " "%> value="5">NIT</option>
                        </select>

                        <label for="num-documento" class="formulario_label">Numero Documento</label>
                        <input type="number" class="form-control mt-1" name="numDocu" disabled value="${ConsultadoUsuario.numDocumentoUsuario}">

                        <label for="telefono" class="formulario_label">Telefono</label>
                        <input type="text" class="form-control mt-1" name="telefono" disabled value="${ConsultadoUsuario.telefonoUsuario}">

                        <label for="direccion" class="formulario_label">Direccion</label>
                        <input type="text" class="form-control mt-1" name="direccion" disabled value="${ConsultadoUsuario.direccionUsuario}">

                        <label for="sexo" class="formulario_label">Sexo</label>
                        <select class="form-select" name="sexo"  disabled>
                            <option <%=VO.getSexoUsuario().equals("1") ? "selected" : " "%> value="1">Masculino</option>
                            <option <%=VO.getSexoUsuario().equals("2") ? "selected" : " "%> value="2">Femenino</option>
                            <option <%=VO.getSexoUsuario().equals("3") ? "selected" : " "%> value="3">Otro</option>
                        </select>

                        <label for="estado" class="formulario_label">Estado</label>
                        <input type="text" class="form-control mt-1" name="estado" disabled value="${ConsultadoUsuario.estadoUsuario}">

                        <label for="rol" class="formulario_label">Rol</label>
                        <select class="form-select" name="rol">
                            <option value="1">Administrador</option>
                            <option value="2">Vendedor</option>
                            <option value="3">Cliente</option>
                        </select>
                    </div>
                </div>


                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="registro-us">Actualizar Usuario</button>
                    <input type="hidden" value="3" name="action">
                </div>

            </form>
        </div>
    </div>
</div>
<%}%>