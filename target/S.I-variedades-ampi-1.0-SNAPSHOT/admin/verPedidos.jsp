<%@page import="java.util.ArrayList"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="vo.PedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <table class="content-table" id="pedidos">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Fecha Pedido</th>
                                <th>Fecha Entrega</th>
                                <th>Destino</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody class="tbi-user">
                            <%
                                PedidoVO pedi = new PedidoVO();
                                PedidoDAO pediD = new PedidoDAO();
                                ArrayList<PedidoVO> listapedidos = pediD.listarP();
                                for (int i = 0; i < listapedidos.size(); i++) {
                                    pedi = listapedidos.get(i);
                            %>
                            <tr>
                                <td><%=pedi.getIdPedido()%></td>
                                <td><%=pedi.getFechaPedido()%></td>
                                <td><%=pedi.getFechaEntrega()%></td>
                                <td><%=pedi.getDestinoPedido()%></td>
                                <td><%=pedi.getEstadoPedido()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
                        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->
        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
    </body>
</html>
<script>
    $(document).ready(function () {
        $('#pedidos').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
