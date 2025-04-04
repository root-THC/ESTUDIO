<?php
// Definir productos disponibles
$productos = [
    ['nombre' => 'patates', 'unidad' => 'kg', 'precio' => 2.05, 'imagen' => 'patata.jpg'],
    ['nombre' => 'ceba', 'unidad' => 'kg', 'precio' => 2.50, 'imagen' => 'ceba.jpg'],
    ['nombre' => 'api', 'unidad' => 'manat', 'precio' => 3.00, 'imagen' => 'api.jpg'],
    ['nombre' => 'pastanagues', 'unidad' => 'manat', 'precio' => 3.50, 'imagen' => 'pastanaga_manat.jpg'],
    ['nombre' => 'oli granel', 'unidad' => 'l', 'precio' => 8.50, 'imagen' => 'oli.jpg'],
    ['nombre' => 'pastilla de sabó', 'unidad' => 'unitat', 'precio' => 4.99, 'imagen' => 'sabo.jpg'],
    ['nombre' => 'lluç', 'unidad' => 'kg', 'precio' => 10.55, 'imagen' => 'lluc.jpg']
];

// Función para calcular IVA
function calcularIVA(float $import, float $iva = 0.21): float {
    return $import * $iva;
}

// Función para agregar producto a la lista si no existe
function afegeixProducte(array &$llistaProductes, string $producte): void {
    if (!in_array($producte, $llistaProductes)) {
        $llistaProductes[] = $producte;
    }
}

// Función para generar lista ordenada de productos
function generaLlistat(array $llistaProductes): void {
    $copia = $llistaProductes;
    sort($copia);
    echo "<p>Llista de productes a la factura: " . implode(", ", $copia) . "</p>";
}

// Obtener datos del producto según el índice
function getProducte(array $productes, int $i): string {
    return $productes[$i]['nombre'];
}

function getUnitat(array $productes, int $i): string {
    return $productes[$i]['unidad'];
}

function getPreuUnitat(array $productes, int $i): float {
    return $productes[$i]['precio'];
}

// Generar factura con datos aleatorios
$factura = [];
for ($i = 0; $i < 10; $i++) {
    $index = array_rand($productos);
    $cantidad = rand(1, 10) / 2;
    $subtotal = $cantidad * getPreuUnitat($productos, $index);
    $descuento = ($subtotal > 50) ? 0.10 : (($subtotal >= 30) ? 0.05 : 0);
    $subtotal_descuento = $subtotal * (1 - $descuento);
    $iva = calcularIVA($subtotal_descuento);
    $total = $subtotal_descuento + $iva;
    
    $factura[] = [
        'producto' => getProducte($productos, $index),
        'cantidad' => $cantidad,
        'unidad' => getUnitat($productos, $index),
        'precio' => getPreuUnitat($productos, $index),
        'subtotal' => $subtotal,
        'descuento' => $descuento * 100,
        'iva' => $iva,
        'total' => $total
    ];
}

// Mostrar factura en HTML
echo "<table border='1'>";
echo "<tr><th>Article</th><th>Quantitat</th><th>Preu/u</th><th>Subtotal</th><th>Descompte</th><th>Iva 21%</th><th>Total</th></tr>";
foreach ($factura as $item) {
    echo "<tr>";
    echo "<td>{$item['producto']}</td>";
    echo "<td>{$item['cantidad']} {$item['unidad']}</td>";
    echo "<td>{$item['precio']} €/{$item['unidad']}</td>";
    echo "<td>{$item['subtotal']}€</td>";
    echo "<td>{$item['descuento']}% (-" . number_format($item['subtotal'] * ($item['descuento'] / 100), 2) . " €)</td>";
    echo "<td>" . number_format($item['iva'], 2) . " €</td>";
    echo "<td>" . number_format($item['total'], 2) . " €</td>";
    echo "</tr>";
}
echo "</table>";

// Generar lista de productos utilizados
$llistaProductes = array_column($factura, 'producto');
generaLlistat($llistaProductes);
?>
