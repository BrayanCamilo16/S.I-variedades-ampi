<%@page import="vo.CategoriaVO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<div class="container-sliderr">
    <div class="sliderr" id="sliderr">
        <%
            HttpSession sesion = request.getSession();
            CategoriaDAO categoriaDao = new CategoriaDAO();
            CategoriaVO categoriaVo = null;
            List<CategoriaVO> categorias = categoriaDao.select();

            for (int i = 0; i < categorias.size(); i++) {
                categoriaVo = categorias.get(i);
        %>
        <div class="slider-sectionn">
            <div class="todo-contenido">
                <div class="card">
                    <div class="face front">
                        <img src="${pageContext.request.contextPath}/files/categoria/<%= categoriaVo.getRutaImgCategoria()%>" alt="<%= categoriaVo.getDescripcionCategoria()%>">
                        <h2><%= categoriaVo.getNombreCategoria()%></h2>
                    </div>
                    <div class="face back">
                        <div class="circulo"></div>
                        <div class="contenido">
                            <h2><%= categoriaVo.getNombreCategoria()%></h2>
                            <h5><%= categoriaVo.getDescripcionCategoria()%></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <i class="fas fa-chevron-circle-right slider-btnn slider-btn-rightt" id="btn-rightt"></i>
    <i class="fas fa-chevron-circle-left slider-btnn slider-btn-leftt" id="btn-leftt"></i>
</div>