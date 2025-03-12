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
<th>Iva 21%</th>
<th>Total</th>

<!-- END STATIC TABLES -->       
  
    <?php   
    for ($i = 1; $i <= 10; $i++) {  
<<<<<<< HEAD
        $quantity_number = rand (1,100);
        $price = rand (50,600);
        $subtotal = $quantity_number * $price;
    
        echo "<tr>"; 
        echo "<td>Article $i</td>" ;
        # Camp Quantitat
        if ($quantity_number==1){
            echo "<td> $quantity_number ud</td>";
        } elseif ( $quantity_number==0){
            echo "<td> No hay existencias </td>";
        } else {
            echo "<td>$quantity_number uds</td>";
        }
        # Camp Price
        echo "<td>Preu $price €</td>";
        echo "<td>Preu $subtotal €</td>";
        echo  "</tr>";
                                }
    ?> 
=======
        echo "<tr> <th class='articulos'>Article $i</th> </tr>";
    }
    for ($a = 1; $i <= 10; ) {  
        echo "<tr> <th class='cantidad'>Article $i</th> </tr>";
    }

?> 
>>>>>>> 9fa87217e963e5f26d82357fa4308f3f1c6a18b0
  </table>
  <?php 
  #$total_productos = ;
  echo "<h>Total products:" . array_sum . "</h>";
  ?>


</body>
</html>