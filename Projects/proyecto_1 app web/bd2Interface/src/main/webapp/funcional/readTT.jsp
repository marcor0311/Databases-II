<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto I - BD2</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>
        
        <div align="center">
            <h1>Ver Transacci�n</h1>
            <form action="/bd2Interface/funcional/readTT" method="post">
                Id Orden: <input type="number" name="idOrd" required>
                <br><br>
                Id Producto: <input type="number" name="idProducto" required>
                <br><br>
                <input style="height:30px; width:150px" type="submit" value="Ver Transacci�n">
            </form>
        </div>      
        
    </body>
</html>