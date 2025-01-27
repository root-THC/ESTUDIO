<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>PRUEBAS PHP</title>
</head>
<body>
<!-- contenido  -->
    <h1><?php echo "Hola desde PHP"; ?></h1>
    <ul>
    <table>
        <tr><th>1 Columna</th>2 Columna<th>3 Columna</th></tr>
        <tr><td>1</td>2<td>3</td></tr>
    </table>
    <?php
    $maxTaules = 10;
    $maxDinsLaTaula = 10;
    for ($taulaDel = 1; $taulaDel <= $maxTaules; $taulaDel++) {
        echo "<li>Taula del $taulaDel</li>";



        for ($i=1; $i <= $maxDinsLaTaula; i++) {

            $resultat = $i * $taulaDel;
        }

    }






    ?>
    </ul>





</body>
</html>