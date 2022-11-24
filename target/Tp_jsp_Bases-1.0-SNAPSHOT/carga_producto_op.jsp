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
        <title>Se Realiza la Carga</title>
    </head>
    <body>
                    <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qProd = "INSERT INTO tb_productos (nombre, descripcion, costo) VALUES (?,?,?)";
                String qSet = " SET @id_producto= LAST_INSERT_ID()";
                String qRel = " INSERT INTO tb_productos_sucursales (id_tbproducto, id_tbsucursal, stock)"
                            + " VALUES( @id_producto,?, ?)";
                
                PreparedStatement consultaProd = null;
                PreparedStatement consultaSet = null;
                PreparedStatement consultaRel = null;
                
                String vId = request.getParameter("id");
                String vDesc = request.getParameter("descripcion");
                String vProd = request.getParameter("producto");
                String vCosto = request.getParameter("costo");
                String vCant = request.getParameter("stock");
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpractico", "root", "");
                    consultaProd = conexion.prepareStatement(qProd);
                    consultaProd.setString(1, request.getParameter("producto"));
                    consultaProd.setString(2, request.getParameter("descripcion"));
                    consultaProd.setString(3,request.getParameter("costo"));
                    consultaSet = conexion.prepareStatement(qSet);
                    consultaRel = conexion.prepareStatement(qRel);
                    consultaRel.setString(1,request.getParameter("id"));
                    consultaRel.setString(2,request.getParameter("stock"));
                    consultaProd.execute();
                    consultaSet.execute();
                    consultaRel.execute();
                    out.print("Producto cargado exitosamente!!!!");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(consultaProd + "</br>");
                    out.println(consultaSet + "</br>");
                    out.println(consultaRel + "</br>");
                    
                } finally {
                    try {

                        consultaProd.close();
                        consultaSet.close();
                        consultaRel.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>