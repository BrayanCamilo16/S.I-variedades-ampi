<%-- 
    Document   : factura
    Created on : 16/09/2022, 8:44:43 a. m.
    Author     : SENA
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="vo.ProductoVO"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>  
    <body>
        <div class="modal fade" id="generarP">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h3 class="modal-title fw-bold lead">factura</h3>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
           
                <div class="modal-body">
                  <%
    String fecha = (String) request.getAttribute("fechaPedido");
    
    
        Connection con;
  
       
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/variedades_ampi","root","") ;
        File jasperfile = new File(application.getRealPath("reporte/factura.jasper"));
        Map parametro = new HashMap();
        parametro.put("fac",fecha);
        byte[] bytes =JasperRunManager.runReportToPdf(jasperfile.getPath(),parametro,con );
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream output = response.getOutputStream();
        response.getOutputStream();
        output.write(bytes,0,bytes.length);
        output.flush();
        output.close();
        %>
    
           
                </div>

                <div class="modal-footer">
               
             
                </div>

    </body>
</html>
