<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto I - BD2</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>
        
        <div align="center">
            <h1>Inicio de sesi�n</h1>
            <form action="login" method="post">
                Usuario : <input type="text" name="user" required>
                <br><br>
                Contrase�a: <input type="text" name="password" required>
                <br><br>
                <input style="height:30px; width:150px" type="submit" value="Iniciar Sesi�n">
            </form>
        </div>
       
        <script>
            window.onload = function() {
            var errorMessage = "<%= request.getAttribute("errorMessage") %>";
            if (errorMessage) {
                alert(errorMessage);
            }
          };
        </script>
        
    </body>
</html>