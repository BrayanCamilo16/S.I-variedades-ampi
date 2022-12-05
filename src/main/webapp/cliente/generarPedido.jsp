<%@page import="vo.UsuarioVO"%> <%@page import="dao.UsuarioDAO"%> <% UsuarioDAO usuarioDao = new UsuarioDAO(); HttpSession
sesionPedido = request.getSession(); UsuarioVO usuarioVO = (UsuarioVO) sesionPedido.getAttribute("usuarioVo"); %>
<div class="modal fade" id="generarPedido">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header bg-primary text-white">
				<h3 class="modal-title fw-bold lead">Generar pedido</h3>
				<button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<form action="${pageContext.request.contextPath}/EjemploCarrito?accion=GenerarPedido" method="POST" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group mb-2">
						<label>Fecha Entrega</label>
						<input type="date" class="form-control mt-1" name="fechaE" required />
						<input type="hidden" name="accion" value="GenerarPedido" />

						<label for="pass">Direccion envio <span class="text-danger">*</span></label>
						<input
							type="text"
							class="form-control mt-1"
							name="direcionCliente"
							value="<%=usuarioVO.getDireccionUsuario()%>"
							required />
					</div>
				</div>
				<div class="modal-footer hola">
                                    <button type="submit" class="gg">Generar Pedido</button>
				</div>
			</form>
		</div>
	</div>
</div>
