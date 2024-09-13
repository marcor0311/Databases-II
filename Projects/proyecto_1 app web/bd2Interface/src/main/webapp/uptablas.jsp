<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto I - BD2</title>
    </head>
    <body>
        
        <div align="center">
            <h1>Actualizar en Tablas de Base</h1>
            <h2>Seleccione una opción</h2>
            
                    <button style="height:40px; width:200px" onclick="location.href='funcional/updateDistri.jsp'">
                    Actualizar Distribuidores</button>     <%--Accede entidad fuerte--%>
                <br><br>
                    <button style="height:40px; width:200px" onclick="location.href='funcional/updateProducto.jsp'">
                    Actualizar Productos</button>            <%--Accede entidad fuerte--%>
                <br><br>
                    <button style="height:40px; width:200px" onclick="location.href='funcional/updateTT.jsp'">
                    Actualizar Transacción</button><%--Accede tabla transaacional--%>
        </div>
                 
    </body>
</html>