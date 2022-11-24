<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>CARGA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
         
   <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qSucursal ="SELECT nombre,direccion FROM tb_sucursales WHERE id_sucursal=?";   
                PreparedStatement consultaSucursal = null;
                ResultSet listaSucursal = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpractico", "root", "");
                    consultaSucursal = conexion.prepareStatement(qSucursal);
                    consultaSucursal.setString(1, request.getParameter("id"));
                    listaSucursal = consultaSucursal.executeQuery();
                    listaSucursal.next();    
        %>
    <body>
        <h1>SUCURSAL: <%out.print(listaSucursal.getString("nombre"));%><h1>
        <p><%out.print(listaSucursal.getString("direccion"));%></p>        
        <form method="post" action="carga_producto_op.jsp">
            NOMBRE PRODUCTO:<input type="text" name="producto"><br>
            DESCRIPCION: <input type="text" name="descripcion"><br>
            COSTO: <input type="text" name="costo"><br>
            CANTIDAD: <input type="text" name="stock"><br>
            <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>">
            <input type="submit" value="CARGAR">
        </form>
    </body>
    <%
        } catch (Exception e) {
                    e.printStackTrace();
                    /*out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");*/

                } finally {
                    try {                                     
                        consultaSucursal.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
    %>
</html>
