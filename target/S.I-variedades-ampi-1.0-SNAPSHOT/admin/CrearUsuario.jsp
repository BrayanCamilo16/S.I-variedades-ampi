<%@page import="vo.UsuarioVO" %>
<body>
    <div class="modal fade" id="crear">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header bg-primary">
                    <div class="headersito">
                        <h3 class="re">Registra un Usuario</h3>
                        <span class="text-white">Es f&#225;cil y r&#225;pido.</span>
                    </div>
                    <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal"
                            aria-label="Close"><i class="fas fa-times"></i></button>
                </div>
                <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;"
                      id="formulario">
                    <div class="modal-body">
                        <div class="imagen-u">
                            <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""/>
                        </div>
                        <!--Grupo nombre-->
                        <div class="formy">
                            
                            
                            <div class="gruponombre">
                                <label for="nombre" class="formulario_label">Nombre <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="nombre" id="nombre" required>
                                <span class="nombreText"></span>
                            </div>




                            <!--Grupo apellido-->
                            <div class="grupoapellido">
                                <label for="apellido" class="formulario_label">Apellido <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="apellido" id="apellido" required>
                                <span class="apellidoText"></span>
                            </div>





                            <div class="grupocorreo">
                                <label for="emailSingup" class="formulario_label">Correo electr&#243;nico <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="email" id="emailSingup"
                                       required><span id="text"></span>
                                <span class="correoText"></span>
                            </div>


                            <input type="hidden" name="pass" value="1234567890">


                            <div class="form-group mb-2">
                                <label for="tipo-doc" class="formulario_label">Tipo de Documento<span class="text-danger">*</span></label>
                                <select class="form-select" name="tipoDocu" required>
                                    <option value="1">C&#233;dula de ciudadan&#237;a</option>
                                    <option value="2">C&#233;lula de extranjer&#237;a</option>
                                    <option value="3">Tarjeta de identidad</option>
                                    <option value="4">Pasaporte</option>
                                    <option value="5">Nit</option>
                                </select>
                            </div>



                            <div class="form-group mb-2">
                                <label for="num-documento" class="formulario_label">No. Documento <span class="text-danger">*</span></label>
                                <input type="number" class="form-control mt-1" name="numDocu" id="num-documento"
                                       onkeydown="validation()" required>
                            </div>



                            <div class="grupophone">
                                <label for="telefono" class="formulario_label">Telefono <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="telefono" id="phone" required>
                                <span class="telefonoTextt"></span>
                            </div>



                            <div class="form-group mb-2">
                                <label for="direccion" class="formulario_label">Direcci&#243;n <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="direccion" id="direccion" required>
                            </div>


                            <div class="form-group mb-2">
                                <label for="sexo" class="formulario_label">Sexo <span class="text-danger">*</span></label>
                                <select class="form-select" name="sexo" required>
                                    <option value="1">Hombre</option>
                                    <option value="2">Mujer</option>
                                    <option value="3">Otro</option>
                                </select>
                            </div>

                            <div class="form-group mb-2">
                                <label for="rol" class="formulario_label">Rol <span class="text-danger">*</span></label>
                                <select class="form-select" name="rol" required>
                                    <option value="1">Administrador</option>
                                    <option value="2">Vendedor</option>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <p id="mensaje" class="d-none">Por favor sumnistre bien los campos para hacer el registro
                            del usuario correctamente<i class="fa-solid fa-circle-exclamation"></i></p>
                        <button type="submit" class="registro-us">Registrar<i class="fas fa-user-plus me-1"></i></button>
                    </div>
                    <input type="hidden" value="11" name="action">

                </form>
            </div>
        </div>
    </div>
    <script>
        const formulario = document.getElementById("formulario");
        const nombre = document.getElementById("nombre");
        const apellido = document.getElementById("apellido");
        const email = document.getElementById("emailSingup");
        const password = document.getElementById("password");
        const telefono = document.getElementById("phone");
        const NombrePattern = /^[a-zA-Z�-�\s]{1,40}$/;
        const ApellidoPattern = /^[a-zA-Z�-�\s]{1,40}$/;
        const correoPattern = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
        const passwordPattern = /^.{4,12}$/;
        const telefonoPattern = /^\d{7,14}$/;
        let mensaje = document.getElementById("mensaje");

        formulario.addEventListener('submit', (e) => {
            if (!nombre.value.match(NombrePattern) || !apellido.value.match(ApellidoPattern) ||
                    !email.value.match(correoPattern) || !telefono.value.match(telefonoPattern)) {
                e.preventDefault();
                mensaje.classList.remove("d-none");
                mensaje.style.color = "#ff0000";
                mensaje.style.background = "#F5C2C2";
                mensaje.style.padding = "20px";
                mensaje.style.width = "100%";
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
                nombreText.style.display = "block";
            } else {
                gruponombre.classList.add('invalid');
                gruponombre.classList.remove('valid');
                nombreText.innerHTML = "Solo puede contener letras y espacios, no pueden llevar mas de 40 digitos.";
                nombreText.style.color = "#ff0000";
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
                apellidoText.style.display = "block";
            } else {
                grupoapellido.classList.add('invalid');
                grupoapellido.classList.remove('valid');
                apellidoText.innerHTML = "Solo puede contener letras y espacios, no pueden llevar mas de 40 digitos.";
                apellidoText.style.color = "#ff0000";
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
                correoText.style.display = "block";
            } else {
                grupocorreo.classList.add('invalid');
                grupocorreo.classList.remove('valid');
                correoText.innerHTML = "El correo solo puede contener letras, numeros, puntos, guiones y guion bajo. Debe incluir un @";
                correoText.style.color = "#ff0000";
                correoText.style.display = "block";

            }

        });

        telefono.addEventListener('input', () => {
            const grupotelefono = document.querySelector(".grupophone");
            const telefonoTextt = document.querySelector(".telefonoTextt");
            // 7 a 14 numeros.
            if (telefono.value.match(telefonoPattern)) {
                grupotelefono.classList.add('valid');
                grupotelefono.classList.remove('invalid');
                telefonoTextt.innerHTML = "El telefono escrito es v&aacute;lido";
                telefonoTextt.style.color = "#0051FF";
                telefonoTextt.style.display = "block";
            } else {
                grupotelefono.classList.add('invalid');
                grupotelefono.classList.remove('valid');
                telefonoTextt.innerHTML = "Por favor escriba numeros, maximo 7 digitos y minimo 14 digitos";
                telefonoTextt.style.color = "#ff0000";
                telefonoTextt.style.display = "block";
            }
        });
    </script>
</body>