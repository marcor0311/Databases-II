<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto I - BD2</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>
        
        <div align="center">
            <h1>Añadir Producto</h1>
            <form action="/bd2Interface/funcional/crearOrden" method="post">
                Nombre: <input type="text" name="nombre" required>
                <br><br>
                Descripción : <input type="text" name="descripcion" required>
                <br><br>
                Precio Unitario: <input type="number" name="precioU" required>
                <br><br>
                Cantidad Disponible <input type="number" name="cantidadD" required>
                <br><br>
                Id Distribuidor <input type="number" name="idDis" required>
                <br><br>
                
                <input style="height:30px; width:150px" type="submit" value="Añadir Producto">
            </form>
        </div>      
        
    </body>
</html>