<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>PRUEBAS PHP</title>
</head>
<style>
    tr , th , td {
        border: 1px solid black;
        text-align: center;
    }


</style>
<body>
<!-- contenido  -->
    <h1><?php echo "TABLA DE MULTIPLICAR CON SIFILIS"; ?></h1>
    <ul>
    <table>
    <?php

    $maxTaules = 10;
    $maxDinsLaTaula = 10;
    
    for ($taulaDel = 1; $taulaDel <= $maxTaules; $taulaDel++) {
        echo "<tr>";  
        for ($i = 1; $i <= $maxDinsLaTaula; $i++ ){
            $resultado = $i * $taulaDel;        
            echo "<th> $resultado</th>";
        }

        echo "</tr>";

    }


    ?>
    </table>
    </ul>





</body>
</html>