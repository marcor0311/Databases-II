<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto I - BD2</title>
    </head>
    <body>
        
        <div align="center">
            <h1>Menú principal</h1>
            <h2>Qué desea hacer</h2>            
                    <button style="height:40px; width:200px" onclick="location.href='crtablas.jsp'">
                    Agregar nuevo</button>          <%--Accede entidad fuerte--%>
                    <button style="height:40px; width:200px" onclick="location.href='retablas.jsp'">
                    Consultar información</button>  <%--Accede entidad fuerte--%>
                <br><br>   
                    <button style="height:40px; width:200px" onclick="location.href='uptablas.jsp'">
                    Actualizar tablas</button>      <%--Accede tabla transaacional--%>
                    <button style="height:40px; width:200px" onclick="location.href='detablas.jsp'">
                    Eliminar información</button>   <%--Accede tabla transaacional--%>
                <br><br><br>
                    <button style="height:40px; width:200px" onclick="location.href='index.html'">
                    Cerrar Sesión</button>          <%--Accede tabla transaacional--%>
        </div>         
                   
    </body>
</html>
