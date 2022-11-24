<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINA</title>
    </head>
      
    <body>   <h1>PRODUCTO A ELIMINAR</h1>
             <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qProd ="DELETE FROM tb_productos_sucursales WHERE id_tbproducto=? AND id_tbsucursal=?";
                PreparedStatement eliminaProd = null;
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpractico", "root", "");
                    
                    eliminaProd = conexion.prepareStatement(qProd);
                    eliminaProd.setString(1, request.getParameter("id_tbproducto"));
                    eliminaProd.setString(2, request.getParameter("sucursal"));
                    eliminaProd.execute();       
                    
                    out.print("PRODUCTO ELIMINADO");
               
                    
                   
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(eliminaProd + "</br>");
                    
                  
                } finally {
                    try {
                        eliminaProd.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>