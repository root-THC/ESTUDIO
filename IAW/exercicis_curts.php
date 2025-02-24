<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>EXERCICIS IAW</title>
    </head>
    <body>
        
<?php
// Programa que comprueba si una variable es mayor que cero o no. $n=-23 → dirá "-23 no es mayor que cero" //
/*
$n = -23;

if ($n > 0) {
    echo "Es mayor que cero"; 
} else { 
    echo "Es más pequeño que cero";
}

// Programa similar al anterior, pero que dirá si la variable es positiva, negativa o cero

$n = 0;

if ($n > 0) {
    echo "La variable es positiva";
} elseif ($n < 0) {
    echo "La variable es negativa";
} else {
    echo "La variable es cero";
}

*/

// A partir del preu recollit a una variable, i el número d'unitats en una altra, el programa et dirà: preu amb IVA

$preu_recollit = 10;
$unitat = 5;
$iva = 1.21;
$preu_senseiva = $unitat * $preu_recollit;
$preu_ambiva = $preu_senseiva * $iva;
$descompte = 0.95;
$preu_ambdescompte = $preu_ambiva * $descompte;

echo "PRECIO CON IVA : $preu_ambiva € \n";
echo "DESCUENTO APLICADO : $preu_ambdescompte € \n";

//Comences amb dues variables, $a i $b, amb valors assignats. Cal que les reordenis, 
//si cal, de manera que $a sigui menors que $b, i després les treus per pantalla ("$a = 15 i $b=25")

$a = 15; 
$b = 25;

if ($a > $b) {
    
    $temp = $a; //asignar un valor temporal a solo afecta dentro de la función
    $a = $b; // aqui ponemos
    $b = $temp; // como queremos que lo entienda
    echo "$a = $a y $b = $b";
} else {
    echo "$a es más pequeño que $b \n ";
}

echo "$a = $a y $b = $b";




?>
    </body>
</html>