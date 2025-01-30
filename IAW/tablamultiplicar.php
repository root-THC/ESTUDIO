<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>PRUEBAS PHP</title>
</head>
<style>
    tr , td {
        border: 1px solid black;
        text-align: center;
        background-color:  	lightgray;
    }
    th {

        border: 1px solid black;
        text-align: center;
        background-color:  	Violet;
    }
</style>    
<body>
<!-- link colores https://htmlcolorcodes.com/es/nombres-de-los-colores/ --> 
<!-- contenido  -->
    <h1><?php echo "TABLA DE MULTIPLICAR CON SIFILIS"; ?></h1>
<ul>
        
<table>
    
   
    <?php
     // echo "1+1 es =". 1+1 .""; los . . son para hacer operacion con por ejemplo con variables $xxx
    $maxTaules = 10;
    $maxDinsLaTaula = 10;
    echo "<th>X</th>";
    for ($x=1;$x <= $maxTaules; $x++){   
        echo "<th>$x</th>";   
    }

    for ($taulaDel = 1; $taulaDel <= $maxTaules; $taulaDel++){
        echo "<tr>";  
        echo "<th>$taulaDel</th>";
    

        for ($i = 1; $i <= $maxDinsLaTaula; $i++ ){
            $resultado = $i * $taulaDel;        
            echo "<td> $resultado</td>";
            
        }
        
        

    }
    ?>
     
    

</table>
    
      
</ul>




</body>
</html>
