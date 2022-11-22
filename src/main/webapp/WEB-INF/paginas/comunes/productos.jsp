<%@page import="java.util.List"%>
<%@page import="vo.ProductoVO"%>
<%@page import="dao.ProductoDAO"%>
<div class="container-slider">
    <div class="slider" id="slider">
        <%
            ProductoDAO productoDao = new ProductoDAO();
            ProductoVO productoVo = null;
            List<ProductoVO> productos = productoDao.select();

            for (int i = 0; i < productos.size(); i++) {
                productoVo = productos.get(i);
        %>
        <div class="slider-section">
            <div class="contenido-caja">
                <div class="contenido-imagen">
                    <img src="${pageContext.request.contextPath}/files/producto/<%= productoVo.getNombreImgProducto()%>" loading="lazy" alt="alt" class="imagen"/>
                </div>
                <div class="contenido-tarjeta">
                    <h1 class="nombre"><%= productoVo.getNombreProducto()%></h1>
                    <p class="descripcion"><%= productoVo.getDescripcionProducto()%></p>
                </div>
                <div class="precio">
                    <div class="box-precio">
                        <span class="precio1">$<%= productoVo.getPrecioUnitarioProducto()%></span>
                    </div>
                        <span class="corazon"><a class="cora" href="${pageContext.request.contextPath}/EjemploCarrito?accion=Comprar&id=<%=productoVo.getIdProducto()%>"><i class="fa-regular fa-heart"></i></a></span>
                        <span class="shopping"><a class="sho" href="${pageContext.request.contextPath}/EjemploCarrito?accion=AgregarCarrito&id=<%=productoVo.getIdProducto()%>"><i class="fas fa-shopping-cart ms-1"></i></a>
                    </span>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <i class="fas fa-chevron-circle-right slider-btn-right slider-btn" id="btn-right"></i>
    <i class="fas fa-chevron-circle-left slider-btn-left slider-btn" id="btn-left"></i>
</div>