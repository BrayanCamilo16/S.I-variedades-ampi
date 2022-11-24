<%@page import="vo.UsuarioVO"%>
<%@page import="dao.UsuarioDAO"%>
<%
    UsuarioDAO usuarioDao = new UsuarioDAO();
    HttpSession sesionPedido = request.getSession();
    UsuarioVO usuarioVO = (UsuarioVO) sesionPedido.getAttribute("usuarioVo");
    String idUsuario = String.valueOf(usuarioVO.getIdUsuario());

%>


<div class="modal fade" id="generarPedido">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h3 class="modal-title fw-bold lead">Generar pedido</h3>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
            <form  method="POST" action="${pageContext.request.contextPath}/EjemploCarrito?accion=GenerarPedido">
                <div class="modal-body">
                    <div class="form-group mb-2">
                        <label for="pass">Dirección envio <span class="text-danger">*</span></label>
                        <input type="text"  name="direccionEnvio" >
                    </div>
                <div class="modal-footer">
                
                    <button type="submit">Generar pedido</button> 
                         
                </div>

            </form>
        </div>
    </div>
</div>
