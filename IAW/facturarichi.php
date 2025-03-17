<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RICHI FACTURATOR ;)</title>
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
<th>Total </th> <!-- Discount Applied Before Taxes  -->

<!-- END STATIC TABLES -->       
  
    <?php
    $total_products = 0;
    $total_noiva = 0;
    $total_withiva = 0;
    for ($i = 1; $i <= 10; $i++) {  
        $quantity_number = rand (1,10);
        $price = rand (0,100);
        $subtotal = $quantity_number * $price;
        $subtotal_withiva = $subtotal * 1.21;

        $total_products = $i;
        $total_products1 += $quantity_number;
        $total_noiva += $subtotal ;
        $total_withiva += $subtotal_withiva;
        $price_discount5 = $subtotal * 0.05;
        $price_discount10 = $subtotal * 0.10;
        #SUBTOTAL DISCOUNT
        $iva_result5 = ($subtotal - $price_discount5) * 0.21;
        $iva_result10 = ($subtotal - $price_discount10) * 0.21;
        $subtotal_discount5 = (($subtotal - $price_discount5) * 1.21);
        $subtotal_discount10 = (($subtotal - $price_discount10) * 1.21);
        
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
        #Camp Discount + IVA + TOTAL DISCOUNT APPLIED
        if($subtotal<30){
            echo "<td> 0% (0,00€)</td>"; # DISCOUNT
            echo "<td> IVA ". number_format($subtotal*0.21,2) . " €</td>"; #IVA
            echo  "<td> ". $subtotal*1.21 . " €</td>"; #TOTAL
            
        } 
        elseif ($subtotal >= 30 && $subtotal <=50){
            echo "<td> 5% (-  $price_discount5 €) </td>"; # DISCOUNT
            echo "<td> IVA " . number_format($iva_result5,2) . "€</td>"; #IVA
            echo "<td>" . number_format($subtotal_discount5,2) . "€</td>"; #TOTAL
        } 
        elseif ($subtotal>50) { 
            echo "<td> 10% (-  $price_discount10 €) </td>"; # DISCOUNT
            echo "<td> IVA " . number_format($iva_result10,2) . "€</td>"; #IVA
            echo "<td>" . number_format($subtotal_discount10,2) . "€</td>"; #TOTAL
        }
        
        echo  "</tr>";
    }
     ?>
  </table>
  <?php 
  echo "<p>Quantity of products : $total_products uds</p>";
  echo "<p>Total (Without IVA) : $total_noiva € </p>";
  echo "<p>Total (With IVA) : $total_withiva €  </p>";
 
  ?>


</body>
</html>