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
        h1,h {
            margin: 20px;
            padding: 8px;
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
<th>Products</th>
<th>Quantity</th>
<th>Price/unite</th>
<th>Subtotal</th>
<th>Discount</th>
<th>Iva 21% </th> 
<th>Total 'Discount Applied'</th> <!-- FIRST DISCOUNT APPLIED BEFORE THE IVA TO THE TOTAL -->

<!-- END STATIC TABLES -->       
  
    <?php
    $total_quantity = 0;
    $total_noiva = 0;
    $total_withiva = 0;
    for ($i = 1; $i <= 10; $i++) {  
        $quantity_number = rand (1,20);
        $price = rand (0,600);
        $subtotal = $quantity_number * $price;
        $subtotal_withiva = $subtotal * 1.21;

        $total_products = $i;
        $total_quantity += $quantity_number;
        $total_noiva += $subtotal ;
        $total_withiva += $subtotal_withiva;
        $price_discount5 = $subtotal * 0.05;
        $price_discount10 = $subtotal * 0.10;
        #TOTAL
        $subtotal_discount5 = (($subtotal - $price_discount5) * 0.21);
        $subtotal_discount10 = (($subtotal - $price_discount10) * 0.21);
        
        echo "<tr>"; 
        echo "<td>Article $i</td>" ;
        # Camp Quantitat
        if ($quantity_number==1){
            echo "<td> $quantity_number ud</td>";
        } 
        elseif ( $quantity_number==0){
            echo "<td> No hay existencias </td>";
        } 
        else {
            echo "<td>$quantity_number uds</td>";
        }
        # Camp Price
        echo "<td> $price €</td>";
        # Camp Subtotal
        echo "<td> $subtotal €</td>";
        #Camp Discount
        if($price<30){
            echo "<td> 0% (0,00€)</td>"; 
            echo "<td> IVA ".$subtotal*0.21. " €</td>";
            echo  "<td> ".$subtotal*1.21. " €</td>";
            
        } 
        elseif ($price >= 30 && $price <50){
            echo "<td> 5% (-  $price_discount5 €) </td>";
            echo "<td> IVA " . $subtotal*0.21 ." €</td>";
            echo "<td> $subtotal_discount5 €</td>";
        } 
        elseif ($price>=50) { 
            echo "<td> 10% (-  $price_discount10 €) </td>";
            echo "<td> IVA " . $subtotal*0.21 ." €</td>";
            echo "<td> $subtotal_discount10 €</td>";
        }
        
        echo  "</tr>";
    }
     ?>
  </table>
  <?php 
  echo "<p>Quantity of products: $total_quantity uds</p>";
  echo "<p>Total (Without IVA):$total_noiva € ";
  echo "<p>Total (With IVA): $total_withiva €  </p>";
 
  ?>


</body>
</html>