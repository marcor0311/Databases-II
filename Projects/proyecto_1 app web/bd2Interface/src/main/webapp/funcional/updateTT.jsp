<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto I - BD2</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>
        
        <div align="center">
            <h1>Actualizar Transacci�n</h1>
            <form action="/bd2Interface/funcional/updateTT" method="post">
                Id Orden: <input type="number" name="idOrd" required>
                <br><br>
                Id Producto: <input type="number" name="idProducto" required>
                <br><br>
                Nueva Cantidad: <input type="text" name="cantidad" required>
                <br><br>
                <input style="height:30px; width:150px" type="submit" value="Actualizar Transacci�n">
            </form>
        </div>      
        
    </body>
</html>