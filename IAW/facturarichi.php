<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>TABLA MULTIPLICAR</title>
    <style>
       table {
            border-collapse: collapse;
            margin: 20px;
        }
        th, td {
            border: 4px solid black;
            text-align: center;
            padding: 8px;
        }
        th {
            font-size: 20px;
            background-color:white; 
        }
        td {
            background-color: #ffffff; 
        }
        h1 {
            margin: 20px;
        }
        .articulos {
            background-color : white;
            padding: 8px;
            color: black;
        }
</style>
</head>

<body>
    <table>
<!-- START STATIC TABLES -->
<tr>
<th>Article</th>
<th>Quantitat</th>
<th>Preu/u</th>
<th>Subtotal</th>
<th>Descompte</th>
<th>Iva 21%</th>
<th>Total</th>

<!-- END STATIC TABLES -->       
  
    <?php   
$numero_quantitat = rand (1,100);
    for ($i = 1; $i <= 10; $i++) {  
        echo "<tr> <th class='articulos'>Article $i</th> </tr>";
    }
    for ($a = 1; $i <= 10; $i++) {  
        echo "<tr> <th class='articulos'>Article $i</th> </tr>";
    }

?> 
  </table>

</body>
</html>