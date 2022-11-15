<div class="modal fade" id="login">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content" style="width: 1000px; right: 50%">
            <form action="${pageContext.request.contextPath}/Usuario" method="POST">
                <div class="modal-body" style="padding: 1px">

                    <div class="toda">
                        <div class="imagd">
                            <button type="button" class="botonsit" data-bs-dismiss="modal"
                                    aria-label="Close"><i class="fas fa-times"></i></button>
                                    <div class="iamgenp">
                                        <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""/>
                                    </div>
                        </div>
                        <div class="loginsito">
                            <div class="modal-header bg-primary text-white">
                                <h3 class="modal-title fw-bold lead" style="padding: 5px; font-family: 'Kaushan Script', cursive; font-size: 40px;">Iniciar Sesión</h3>
                            </div>
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
                            <div class="page">
                                <a target="_blank" href="${pageContext.request.contextPath}/Recuperar.jsp">&#191;Olvid&#243; su contrase&#241;a?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>