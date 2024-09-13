<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Proyecto I - BD2</title>
</head>
<body>
    
    <div align="center">
        <h1>Resumen Transaccional</h1>
        <form action="selectmes" method="post">
            <label for="meses">Selecciona un mes:</label>
            <select id="meses" name="mes">
                <option value="enero">Enero</option>
                <option value="febrero">Febrero</option>
                <option value="marzo">Marzo</option>
                <option value="abril">Abril</option>
                <option value="mayo">Mayo</option>
                <option value="junio">Junio</option>
                <option value="julio">Julio</option>
                <option value="agosto">Agosto</option>
                <option value="septiembre">Septiembre</option>
                <option value="octubre">Octubre</option>
                <option value="noviembre">Noviembre</option>
                <option value="diciembre">Diciembre</option>
                <%-- Gracias Kevin --%>
            </select>
            <br><br>
            
            <label for="anhos">Selecciona un año:</label>
            <select id="anhos" name="anho">
                <option value="2023">2023</option>
                <option value="2022">2022</option>
                <option value="2021">2021</option>
                <option value="2020">2020</option>
                <option value="2019">2019</option>
                <option value="2018">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>
                <option value="2015">2015</option>
            </select>
        </form>
        <br><br>
        <input type="submit" value="Consultar" onclick="location.href='displayRT.jsp'">
    </div>
        
</body>
</html>
