<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto I - BD2</title>
    </head>
    <body>
        
        <div align="center">
            <h1>Leer Tablas de Base</h1>
            <h2>Seleccione una opción</h2>
            
                <button style="height:40px; width:200px" onclick="location.href='funcional/readDistri.jsp'">
                Consultar Distribuidores</button>     <%--Accede entidad fuerte--%>
            
                <button style="height:40px; width:200px" onclick="location.href='funcional/readProducto.jsp'">
                Consultar Productos</button>          <%--Accede entidad fuerte--%>
            <br><br>   
                <button style="height:40px; width:200px" onclick="location.href='funcional/readTT.jsp'">
                Consultar Transacción</button>        <%--Accede tabla transaacional--%>
            
                <button style="height:40px; width:200px" onclick="location.href='funcional/readLog.jsp'">
                Consultar Registros</button>          <%--Accede Log--%>
            <br><br>
                <button style="height:40px; width:200px" onclick="location.href='funcional/readRT.jsp'">
                Resumen Transaccional</button>        <%--Accede Log--%>
        </div>
             
    </body>
</html>