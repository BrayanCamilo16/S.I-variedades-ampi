<%@page import="vo.UsuarioVO"%>
<body>
    <%
        UsuarioVO VO = new UsuarioVO();
        if (request.getAttribute("ConsultadoUsuario") != null) {//UsuarioVO VO = (UsuarioVO) request.getAttribute("UsuarioConsultado");%>
    <script>
        window.$('#update').modal('show');
        $(document).on('click', '#closeModal', function () {
            location.href = "${pageContext.request.contextPath}/admin/usuarios.jsp";
        });
    </script>
    <%
        } else {
            out.print(request.getAttribute("ConsultadoUsuario"));
        }
    %>
    Este es el ususario: ${ConsultadoUsuario}
    <div class="modal fade" id="update">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <div>
                        <h3 class="modal-title fw-bold lead">Actualizar Usuario</h3>
                        <span>Es f&#225;cil y r&#225;pido.</span>
                    </div>
                    <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
                </div>


                <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;" id="formulario">
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
    </div>
</body>