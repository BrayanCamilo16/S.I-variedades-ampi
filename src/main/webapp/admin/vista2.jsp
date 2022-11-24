<%@page import="java.util.*" %>
<%@page import="java.io.File" %>
<%@page import="java.sql.*" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var fecha = prompt("Ingrese la fecha:");
            if (fecha == null) {
                window.location.href = "index.jsp";
            } else {
                window.location.href = "vista2.jsp?fecha=" + fecha;
            }
        </script>



    </head>
    <body>
        <%
            if (request.getParameter("fecha") != null) {
                Connection con;
                String valor = request.getParameter("fecha").toString();
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/variedades_ampi", "root", "");
                File jasperfile = new File(application.getRealPath("reporte/report2.jasper"));
                Map parametro = new HashMap();
                parametro.put("fecha", valor);
                byte[] bytes = JasperRunManager.runReportToPdf(jasperfile.getPath(), parametro, con);

                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream output = response.getOutputStream();
                response.getOutputStream();
                output.write(bytes, 0, bytes.length);
                output.flush();
                output.close();
            }

        %>
    </body>
</html>
