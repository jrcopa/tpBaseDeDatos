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
        <title>MUESTRA</title>
    </head>
    <body>
       
         <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;
               
                String qProd = "SELECT tb_productos.nombre AS producto, "
                             + " tb_productos.descripcion AS descripcion, "
                             + " tb_productos.costo AS precio, "
                             + " tb_sucursales.direccion AS direccion, "
                             + " tb_sucursales.nombre AS sucursal, "
                             + " tb_productos_sucursales.stock AS stock, "
                              + " tb_productos.id_producto AS codigo "
                             + " FROM tb_productos_sucursales "
                             + "    JOIN tb_productos ON tb_productos_sucursales.id_tbproducto= tb_productos.id_producto"
                             + "    JOIN tb_sucursales ON tb_productos_sucursales.id_tbsucursal= tb_sucursales.id_sucursal"
                             + "    AND tb_sucursales.id_sucursal=?";
                
                PreparedStatement consultaProductos = null;
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpractico", "root", "");
                    /*prepara producto*/
                   
                    consultaProductos = conexion.prepareStatement(qProd);
                    consultaProductos.setString(1, request.getParameter("id"));
                    ResultSet listaProductos = consultaProductos.executeQuery();
                  
                   out.print(request.getParameter("sucur"));
                   out.print(request.getParameter("dir") + "</br>");
                    
                    while (listaProductos.next() ) {
                         %>
                         
                        <ul>
                            
                         <li><%out.print("PRODUCTO: " + listaProductos.getString("producto") + "</br>");%></li>   
                         <li><%out.print("DESCRIPCION: " + listaProductos.getString("descripcion") + "</br>");%></li>
                          <li><%out.print("CANTIDAD: " + listaProductos.getString("stock") + "</br>");%></li>
                         <li><%out.print("PRECIO: " + listaProductos.getString("precio") + "</br>");%></li>
                         <li><%out.print("CODIGO: " + listaProductos.getString("codigo") + "</br>");%></li>
                        
                        </ul>
                        <%
                    }
                   
                    out.print("Stock disponible");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(consultaProductos + "</br>");
                } finally {
                    try {
                        consultaProductos.close();
                        
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>