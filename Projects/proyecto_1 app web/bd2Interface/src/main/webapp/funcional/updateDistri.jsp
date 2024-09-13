<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto I - BD2</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>
        
       <div align="center">
            <h1>Registrar Distribuidor</h1>
            <form action="/bd2Interface/funcional/updateDistri" method="post">
                Id: <input type="number" name="idDis" required>
                <br><br>
                Nombre: <input type="text" name="nombre" required>
                <br><br>
                Correo electrónico: <input type="text" name="correo" required>
                <br><br>
                Teléfono: <input type="text" name="telefono" required>
                <br><br>
                <input style="height:30px; width:150px" type="submit" value="Actualizar">
            </form>
        </div>       
        
    </body>
</html>