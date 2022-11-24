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
        <title>Inicio de Actividades</title>
    </head>
    <body>
          
         <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;
                String selectSucursales= "SELECT * FROM tb_sucursales";
                PreparedStatement consultaSucursales = null;
                ResultSet listaSucursales= null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpractico", "root", "");
                    consultaSucursales = conexion.prepareStatement(selectSucursales);
                    listaSucursales= consultaSucursales.executeQuery();
                     
                   while(listaSucursales.next()){
                   %>
                  
                   <h1>Sucursal: <%out.print(listaSucursales.getString("nombre"));%></h1>
                   <p>Dirección: <%out.print(listaSucursales.getString("direccion"));%></p>
                   
                   <ul>
                       <li><a href= "carga_productos.jsp?id=<%out.print(listaSucursales.getString("id_sucursal"));%>">carga</a></li>
                       <li><a href= "muestra_productos.jsp?id=<%out.print(listaSucursales.getString("id_sucursal"));%>&sucur=<%out.print(listaSucursales.getString("nombre"));%></br>&dir=<%out.print(listaSucursales.getString("direccion"));%>">muestra</a></li>
                       <li><a href= "elimina_producto.jsp?id=<%out.print(listaSucursales.getString("id_sucursal"));%>">elimina</a></li> 
                   </ul>
                 
                   <%
                    }    
                    
                } catch (Exception e) {
                    e.printStackTrace();
                    /*out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                 */
                } finally {
                    try {
                        
                        consultaSucursales.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>

</html>

