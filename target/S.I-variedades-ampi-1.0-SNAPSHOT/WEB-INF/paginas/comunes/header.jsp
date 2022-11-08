<nav class="nabvarsito">
    <input type="checkbox" id="check">
    <label for="check" class="check-btn">
        <i class="fas fa-bars"></i>
    </label>
    <a href="${pageContext.request.contextPath}" class="logo-e">
        <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt="" class="logotipoo">
    </a>
    <ul class="ulsito">
        <div class="esoaciado">
            <li class="lisito">
                <a aria-current="page" href="EjemploCarrito?accion=Carrito"><i class="fas  fa-cart-plus">(<label style="color: black">${contador}</label>)</i>Carrito</a>
            </li>
            <li class="lisito">
                <a aria-current="page" href="">Productos</a>
            </li>
            <li class="lisito">
                <a aria-current="page" href="">Categorias</a>
            </li>
        </div>
            <li id="il-m">
            <a href="" data-bs-toggle="modal" data-bs-target="#signup"><i class="fas fa-user-plus me-1"></i>
                <span class="spna"></span>
                <span class="spna"></span>
                <span class="spna"></span>
                <span class="spna"></span>
                Crear cuenta</a>
        </li>
        <li id="il-m">
            <a href="" data-bs-toggle="modal" data-bs-target="#login"><i class="fas fa-sign-in-alt me-1"></i>
                <span class="spna"></span>
                <span class="spna"></span>
                <span class="spna"></span>
                <span class="spna"></span>
                Iniciar sesi&#243;n</a>
        </li>
        <li class="lisito">
            <a><i class="fa-solid fa-question"></i></a>
        </li>
    </ul>
</nav>