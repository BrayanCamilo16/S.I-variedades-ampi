<%@page import="vo.UsuarioVO" %>
<body>
    <div class="modal fade" id="signup" >
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content" style="width: 1170px; right: 63%; padding: 0">
                <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;"
                      id="formulario">
                    <div class="modal-body" style="padding: 1px">
                        <div class="todoS">
                            <div class="imagend">
                                <button type="button" class="botonsito" data-bs-dismiss="modal"
                                        aria-label="Close"><i class="fas fa-times"></i></button>
                                <img src="${pageContext.request.contextPath}/img/imagenVar.jpg" alt=""/>
                            </div>

                            <div class="contenedor-re">
                                <div class="modal-header bg-primary text-white">
                                    <h3 class="modal-title fw-bold lead" style="padding: 5px; font-family: 'Kaushan Script', cursive; font-size: 40px;">Registrate</h3>
                                </div>
                                <!--Grupo nombre-->
                                <div class="gruponombre" id="grupos-inp">
                                    <div class="otrogrupo">
                                        <i class="fa-solid fa-user-secret iconsito"></i>
                                        <input type="text" name="nombre" id="nombre"  class="puty" required>
                                        <span class="muevase">Nombre</span>
                                    </div>
                                </div>                                <span class="nombreText"></span>




                                <!--Grupo apellido-->
                                <div class="grupoapellido" id="grupos-inp">
                                    <div class="otrogrupo">
                                        <i class="fa-solid fa-user-secret iconsito"></i>
                                        <input type="text" name="apellido" id="apellido"  class="puty" required>
                                        <span class="muevase">Apellido</span>
                                    </div>
                                </div>
                                <span class="apellidoText"></span>


                                <!--                            grupo correo electronico-->
                                <div class="grupocorreo" id="grupos-inp">
                                    <div class="otrogrupo">
                                        <i class="fa-solid fa-envelope iconsito"></i>
                                        <input type="text" name="email" id="emailSingup" class="puty"  required>
                                        <span class="muevase">Correo electr&#243;nico</span>
                                    </div>
                                </div>
                                <span class="correoText" id="correoText"></span>



                                <!--                            grupo contraseña-->
                                <div class="grupopassword" id="grupos-inp">
                                    <div class="otrogrupo">
                                        <i class="fa-solid fa-lock iconsito"></i>
                                        <input type="password" name="pass" id="password" class="puty" required>
                                        <span class="muevase">Contrase&#241;a </span>
                                    </div>
                                </div>
                                <span class="passwordText"></span>


                                <div class="form-group mb-2" id="grupos-inp">
                                    <div class="otrogrupo">
                                        <i class="fa-solid fa-venus iconsito"></i>
                                        <select name="sexo" required class="puty">
                                            <option value="1">Hombre</option>
                                            <option value="2">Mujer</option>
                                            <option value="3">Otro</option>
                                        </select>
                                    </div>
                                </div>
                                <%
                                    HttpSession sesion = request.getSession();
                                    if (sesion.getAttribute("usuarioVo") != null) {
                                        UsuarioVO usuarioVO = (UsuarioVO) sesion.getAttribute("usuarioVo");
                                        String idRol = usuarioVO.getIdRol();

                                        if (idRol.equals(1)) {
                                %>
                                <div class="form-group mb-2" id="grupos-inp">
                                    <label for="rol">Rol <span class="text-danger">*</span></label>
                                    <select class="form-select" name="idRol" required>
                                        <option value="2">Vendedor</option>
                                        <option value="1">Administrador</option>
                                        <option value="3">Cliente</option>
                                    </select>
                                </div>


                                <div class="form-group mb-2" id="grupos-inp">
                                    <label for="estado">Estado <span class="text-danger">*</span></label><%//}%>
                                    <select class="form-select" name="estado" required>
                                        <option value="1">Activo</option>
                                        <option value="0">Inactivo</option>
                                    </select>
                                </div>

                                <%
                                        }

                                    }
                                %>

                                <div class="modal-footer d-flex justify-content-center">
                                    <p id="mensaje1" class="d-none">Por favor suministre bien los campos para hacer el registro correctamente.<i class="fa-solid fa-circle-exclamation"></i></p>
                                    <p id="mensaje2" class="d-none">Por favor seleccione el no soy un robot.<i class="fa-solid fa-circle-exclamation"></i></p>
                                    <div class="g-recaptcha" data-sitekey="6Ld_AhkiAAAAAA1ltvB7iId9Ga3VczHWVSJ2qFVo"></div><br><br>
                                    <button type="submit" class="btn btn-primary btn-lg">Registrarte<i class="fa-solid fa-user-plus"></i></button>

                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="2" name="action">  
                </form>
            </div>
        </div>
    </div>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>


        window.onload = function () {
            let isValid = false;
            const formu = document.getElementById("formulario");
            let mensaje2 = document.getElementById("mensaje2");

            formu.addEventListener('submit', function (event) {
                const response = grecaptcha.getResponse();
                if (!response) {
                    mensaje2.classList.remove("d-none");
                    mensaje2.style.color = "#ff0000";
                    mensaje2.style.background = "#F5C2C2";
                    mensaje2.style.padding = "20px";
                    mensaje2.style.width = "100%";
                    event.preventDefault();
                }
            });
        };
        const formulario = document.getElementById("formulario");
        const nombre = document.getElementById("nombre");
        const apellido = document.getElementById("apellido");
        const email = document.getElementById("emailSingup");
        const password = document.getElementById("password");
        const NombrePattern = /^[a-zA-Zï¿½-ï¿½\s]{1,40}$/;
        const ApellidoPattern = /^[a-zA-Zï¿½-ï¿½\s]{1,40}$/;
        const correoPattern = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
        const passwordPattern = /^.{4,12}$/;
        let mensaje = document.getElementById("mensaje1");
        formulario.addEventListener('submit', (e) => {
            if (!nombre.value.match(NombrePattern) || !apellido.value.match(ApellidoPattern) ||
                    !email.value.match(correoPattern) || !password.value.match(passwordPattern)) {
                mensaje.classList.remove("d-none");
                mensaje.style.color = "#ff0000";
                mensaje.style.background = "#F5C2C2";
                mensaje.style.padding = "20px";
                mensaje.style.width = "100%";
                e.preventDefault();
            }

        });


        nombre.addEventListener('input', () => {
            const gruponombre = document.querySelector(".gruponombre");
            const nombreText = document.querySelector(".nombreText");
            // Letras y espacios, pueden llevar acentos.

            if (nombre.value.match(NombrePattern)) {
                gruponombre.classList.add('valid');
                gruponombre.classList.remove('invalid');
                nombreText.innerHTML = "El nombre escrito es v&aacute;lido";
                nombreText.style.color = "#0051FF";
                nombreText.style.marginLeft = "18px";
                nombreText.style.display = "block";
            } else {
                gruponombre.classList.add('invalid');
                gruponombre.classList.remove('valid');
                nombreText.innerHTML = "Solo puede contener letras y espacios, no pueden llevar mas de 40 digitos.";
                nombreText.style.color = "#ff0000";
                nombreText.style.marginLeft = "18px";
                nombreText.style.display = "block";
            }

        });


        apellido.addEventListener('input', () => {
            const grupoapellido = document.querySelector(".grupoapellido");
            const apellidoText = document.querySelector(".apellidoText");
            // Letras y espacios, pueden llevar acentos.

            if (apellido.value.match(ApellidoPattern)) {
                grupoapellido.classList.add('valid');
                grupoapellido.classList.remove('invalid');
                apellidoText.innerHTML = "El apellido escrito es v&aacute;lido";
                apellidoText.style.color = "#0051FF";
                apellidoText.style.marginLeft = "18px";
                apellidoText.style.display = "block";
            } else {
                grupoapellido.classList.add('invalid');
                grupoapellido.classList.remove('valid');
                apellidoText.innerHTML = "Solo puede contener letras y espacios, no pueden llevar mas de 40 digitos.";
                apellidoText.style.color = "#ff0000";
                apellidoText.style.marginLeft = "18px";
                apellidoText.style.display = "block";
            }

        });


        email.addEventListener('input', () => {
            const grupocorreo = document.querySelector(".grupocorreo");
            const correoText = document.querySelector(".correoText");
            // Letras y espacios, pueden llevar acentos.

            if (email.value.match(correoPattern)) {
                grupocorreo.classList.add('valid');
                grupocorreo.classList.remove('invalid');
                correoText.innerHTML = "El correo escrito es v&aacute;lido";
                correoText.style.color = "#0051FF";
                correoText.style.marginLeft = "18px";
                correoText.style.display = "block";
            } else {
                grupocorreo.classList.add('invalid');
                grupocorreo.classList.remove('valid');
                correoText.innerHTML = "El correo solo puede contener letras, numeros, puntos, guiones y guion bajo. Debe incluir un @";
                correoText.style.color = "#ff0000";
                correoText.style.marginLeft = "18px";
                correoText.style.display = "block";
            }
            function correo(e, email) {
                e.preventDefault();
                console.log(email);
                correoText.innerHTML = "Este correo ya existe";
            }
        });


        password.addEventListener('input', () => {
            const grupopassword = document.querySelector(".grupopassword");
            const passwordText = document.querySelector(".passwordText");
            // 4 a 12 digitos. Puede incluir letras

            if (password.value.match(passwordPattern)) {
                grupopassword.classList.add('valid');
                grupopassword.classList.remove('invalid');
                passwordText.innerHTML = "La contrase&ntilde;a escrita es v&aacute;lido";
                passwordText.style.color = "#0051FF";
                passwordText.style.marginLeft = "18px";
                passwordText.style.display = "block";
            } else {
                grupopassword.classList.add('invalid');
                grupopassword.classList.remove('valid');
                passwordText.innerHTML = "Puede incluir letras, numero caracteres especiales, guiones. Debe ser maximo de 12 digitos";
                passwordText.style.color = "#ff0000";
                passwordText.style.marginLeft = "18px";
                passwordText.style.display = "block";
            }

        });
    </script>

    <script>
        emailInput =   document.getElementById('emailSingup');
        emailInput.addEventListener("blur", ()=>{
            isEmailInDb();
        });
        
        function isEmailInDb() {
            var parametro = {
                "action": 12,
                "email": document.getElementById('emailSingup').value
            }
            $.ajax({
                data: parametro,
                url: 'Usuario',
                type: 'POST',
                success: function (response) {
                    $('#correoText').html(response);
                    document.getElementById('correoText').style.color = "#ff0000";
                }
            });
        }
    </script>

</body>
