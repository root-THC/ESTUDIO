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
$lista_productos = [];
$total_con_iva = 0;
for ($i = 1; $i <= 7; $i++) {
    
    $indice_aleatorio = rand(0, count($productos) - 1);
    $producto = $productos[$indice_aleatorio];
    

    $esta_en_llistat = in_array($producto['producto'],$lista_productos );
    
    /*    
    if($esta_en_llistat == true){
    }else{
        $lista_productos[] = $producto['producto'];
    }
        */
    if(! $esta_en_llistat) {
            $lista_productos[] = $producto['producto'];
    
    
    
    

    // Condición para definir cantidad

    if ($producto['cantidad'] == "pedido" OR $producto['cantidad'] == "unidad") {
        $cantidad = mt_rand(1, 20);

        if ($producto['cantidad'] == "unidad" && $cantidad > 1) {
            $producto['cantidad'] = "unidades";
        }
    } else {

        $cantidad = mt_rand(100, 2000) / 100;
    }
    $total_articulos += $cantidad;

    $subtotal = $cantidad * $producto['€/u'];
    $total_sin_iva += $subtotal;
    $num_iva = calcularIVA($subtotal, $iva);
    $precio_con_iva = $subtotal + $num_iva;
    // Descuentos
    $price_discount5 = $subtotal * 0.05;
    $price_discount10 = $subtotal * 0.10;
    // IVA con descuentos
    $iva_result5 = ($subtotal - $price_discount5) * $iva;
    $iva_result10 = ($subtotal - $price_discount10) * $iva;
    $subtotal_discount5 =  calcularIVA(($subtotal - $price_discount5),$iva) ;
    $subtotal_discount10 =  calcularIVA(($subtotal - $price_discount10),$iva);



    echo "<tr>";
        echo "<td>
        <img src='{$producto['imagen']}' alt='{$producto['producto']}' width='50'><br>
        {$producto['producto']}
        </td>";

    // Mostrar cantidad
    echo "<td>$cantidad {$producto['cantidad']}</td>";
    echo "<td>{$producto['€/u']} €/{$producto['cantidad']}</td>";
    echo "<td>" . number_format($subtotal, 2) . " €</td>";

    // Descuento e IVA según subtotal
    if ($subtotal < 30) {
        echo "<td>0% (0,00€)</td>";
        echo "<td>" . number_format($num_iva, 2) . "€</td>";
        echo "<td>" . number_format($precio_con_iva, 2) . "€</td>";
        $total_con_iva += $precio_con_iva;
    } elseif ($subtotal >= 30 && $subtotal <= 50) {
        echo "<td>5% " . number_format($price_discount5, 2) . "€</td>";
        echo "<td>" . number_format($iva_result5, 2) . "€</td>";
        echo "<td>" . number_format($subtotal_discount5, 2) . "€</td>";
        $total_con_iva += $subtotal - $price_discount5 + $iva_result5;
    } elseif ($subtotal > 50) {
        echo "<td>10% " . number_format($price_discount10, 2) . "€</td>";
        echo "<td>" . number_format($iva_result10, 2) . "€</td>";
        echo "<td>" . number_format($subtotal_discount10, 2) . "€</td>";
        $total_con_iva += $subtotal - $price_discount10 + $iva_result10;
    }
    echo "</tr>";


}

echo "</table>";

echo "<p> Total productos : " . number_format($total_articulos) ."</p>";
echo "<p>Total sin IVA : " . number_format($total_sin_iva, 2) . "€ </p>";
echo "<p>Total con IVA y descuentos: " . number_format($total_con_iva, 2) . "€ </p>";
echo "<p> Lista de productos: ";

sort($lista_productos);

$i=0;

foreach ($lista_productos as $x){
    if ($i==0){
        echo ""; 
        echo "$x";
    }else{
        echo ", "; 
        echo "$x";
    }
    $i=1;
}

echo "</p>";

?>
