<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>FACTURAS FRUTAS</title>
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
        h1,h {
            margin: 20px;
            padding: 8px;
        }
        .articulos {
            background-color : white;
            padding: 8px;
            color: black;
        }
        p {
            margin: 20px;
            font-weight: bold;
        }
</style>
<table>
<?php
$iva = 0.21; // IVA GLOBAL QUE PODEMOS CAMBIAR

$productos = [
    [
    // patata
    'producto' => 'patata',
    'cantidad' => 'kg',
    '€/u' => '2.05', 
    'imagen' => 'fruit_images\patata.jpg'
    ],
    [
    //cebolla
    'producto' => 'cebolla',
    'cantidad' => 'kg',
    '€/u' => '2.50', 
    'imagen' => 'fruit_images\ceba.jpg'
    ],
    [
    //apio
    'producto' => 'apio',
    'cantidad' => 'pedido',
    '€/u' => '3', 
    'imagen' => 'fruit_images\api.jpg'
    ],
    [
    //zanahoria
    'producto' => 'zanahoria',
    'cantidad' => 'pedido',
    '€/u' => '3.50', 
    'imagen' => 'fruit_images\pastanaga_manat.jpg'
    ],
    [
    //aceite granel
    'producto' => 'aceite',
    'cantidad' => 'l',
    '€/u' => '2.50', 
    'imagen' => 'fruit_images\oli.jpg'
    ],
    [
    //pastilla de jabón
    'producto' => 'pastilla de jabón',
    'cantidad' => 'unidad',
    '€/u' => '4.99', 
    'imagen' => 'fruit_images\sabo.jpg'
    ],
    [
    //merluza
    'producto' => 'merluza',
    'cantidad' => 'kg',
    '€/u' => '10.55', 
    'imagen' => 'fruit_images\lluc.jpg'
    ],
];

//function añadir_productos ($productos[]='');


//sort para ordenar los objetos del array

// FUNCIONES
function calcularIVA(float $import, float $iva): float {
    return $import * $iva;
}




// NO TOCAR !!
echo "<tr>";
echo "<th>Artículo</th>";
echo "<th>Cantidad</th>";
echo "<th>€/u</th>";
echo "<th>Subtotal</th>";
echo "<th>Discount</th>";
echo "<th>Iva 21% </th> ";
echo "<th>Total </th> ";
echo "<tr>"; 
// NO TOCAR !!

$total_articulos = 0;
$total_sin_iva = 0;
$total_con_iva = 0;
foreach ($productos as $producto) {

    $cantidad = mt_rand(100, 2000) / 100;
    $total_articulos += $cantidad;  
    $subtotal = $cantidad * $producto['€/u'];
    $num_iva = calcularIVA($subtotal, $iva);
    $precio_con_iva = $subtotal + $num_iva;
    $total_sin_iva += $subtotal;
   
    // DESCUENTOS
    $price_discount5 = $subtotal * 0.05;
    $price_discount10 = $subtotal * 0.10;
    //CALCULO IVA CON DESCUENTOS
    $iva_result5 = ($subtotal - $price_discount5) * $iva;
    $iva_result10 = ($subtotal - $price_discount10) * $iva;
    $subtotal_discount5 = (($subtotal - $price_discount5) * (1+ $iva));
    $subtotal_discount10 = (($subtotal - $price_discount10) * (1+ $iva));

    // Mostrar fila de la tabla
    echo "<tr>";
    echo "<td>
    <img src='{$producto['imagen']}' alt='{$producto['producto']}' width='50'><br>
    {$producto['producto']}
  </td>";
    echo "<td>$cantidad {$producto['cantidad']}</td>";
    echo "<td>{$producto['€/u']} €</td>";
    echo "<td>" . number_format($subtotal, 2) . " €</td>";
    if($subtotal<30){
    echo "<td> 0% (0,00€)</td>";
    echo "<td>" . number_format ($num_iva,2) . "€</td>";
    echo "<td>" . number_format ($precio_con_iva,2) . "€</td>";
    $total_con_iva += $precio_con_iva;
    } 
    elseif ($subtotal >= 30 && $subtotal <=50){
    echo "<td> 5% " . number_format($price_discount5,2) . "€</td>"; # DISCOUNT
    echo "<td>  " . number_format($iva_result5,2) . "€</td>"; #IVA
    echo "<td>" . number_format($subtotal_discount5,2) . "€</td>"; #TOTAL
    $total_con_iva += $subtotal_discount5;     
    } 
    elseif ($subtotal>50) { 
        echo "<td> 10% " . number_format($price_discount10,2) . "€</td>"; # DISCOUNT
        echo "<td>  " . number_format($iva_result10,2) . "€</td>"; #IVA
        echo "<td>" . number_format($subtotal_discount10,2) . "€</td>"; #TOTAL
        $total_con_iva += $subtotal_discount10;
    }
    echo "</tr>";
}

echo "</table>";

echo "<p> Total productos : " . number_format($total_articulos,0) . " unidades</p>";
echo "<p> Total (NO IVA) : " . number_format($total_sin_iva,2) .  "€</p>";
echo "<p> Total (CON IVA) : " . number_format($total_con_iva,2) . "€</p>";

?>


// SI SON PRODUCTOS PEDIDOS TIENEN QUE SER REDONDEADOS 