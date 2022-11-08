<div class="modal fade" id="login">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h3 class="modal-title fw-bold lead">Iniciar sesi&#243;n</h3>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
            <form action="${pageContext.request.contextPath}/Usuario" method="POST">
                <div class="modal-body">

                    <div class="grupo-loginn">
                        <input type="text" name="email" id="email" placeholder=" " required class="input-entrada"><span class="barra"></span>
                        <label for="email" class="labell-entrada">Correo electr&#243;nico</label>
                        <input type="hidden" name="action" value="1">
                    </div>
                    <div class="grupo-loginn">
                        <input type="password" name="pass" id="pass" required placeholder=" " class="input-entrada"><span class="barra"></span>
                        <label for="pass" class="labell-entrada">Contrase&#241;a</label>
                    </div>
                    <button type="submit" class="ingreso-lo">Ingresar<i class="fas fa-sign-in-alt me-1"></i></button>
                </div>
            </form>
            <div class="text-center mb-3">
                <a href="${pageContext.request.contextPath}/Recuperar.jsp">&#191;Olvid&#243; su contrase&#241;a?</a>
            </div>
        </div>
    </div>
</div>