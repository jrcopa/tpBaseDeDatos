<%-- 
    Document   : elimina_producto.jsp
    Created on : 18 nov 2022, 0:22:53
    Author     : usuario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR PRODUCTO</title>
    </head>
         
    <body>
        <p>Ingrese el codigo del producto que desea eliminar</p>
        <form method="post" action="elimina_producto_op.jsp">
            <input type="text" name="id_tbproducto" >
            <input type="hidden" name="sucursal" value="<%out.print(request.getParameter("id"));%>">
           
            <input type="submit" value="ELIMINAR">
        </form>
    </body>
</html>
