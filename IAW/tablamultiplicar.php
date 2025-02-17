<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>TABLA MULTIPLICAR</title>
</head>
<style>
       table {
            border-collapse: collapse;
            margin: 20px;
        }
        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 8px;
        }
        th {
            font-size: 20px;
            background-color:rgb(255, 198, 148); 
        }
        td {
            background-color: #ffffff; 
        }
        h1 {
            margin: 20px;
        }
</style>    
    <body>
<!-- link colores https://htmlcolorcodes.com/es/nombres-de-los-colores/ --> 
<!-- contenido  -->
    <h1><?php echo "TABLA DE MULTIPLICAR"; ?></h1>
        
                <table>
    
   
    <?php


     // echo "1+1 es =". 1+1 .""; los . . son para hacer operacion con por ejemplo con variables $xxx


    $maxTaules = 10;
    
        echo "<th>X</th>";
        for ($x=1;$x <= $maxTaules; $x++){   
        echo "<th>$x</th>";   
    }

        for ($taulaDel = 1; $taulaDel <= $maxTaules; $taulaDel++){
        echo "<tr>";  
        echo "<th>$taulaDel</th>";
    

        for ($i = 1; $i <= $maxTaules; $i++ ){
            $resultado = $i * $taulaDel;        
            echo "<td> $resultado</td>";
                                             }
        
        

        }
    ?>
     
    

                </table>  
    </body>
</html>
