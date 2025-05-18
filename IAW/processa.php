<!DOCTYPE html>
<html lang="ca-ES">
  <head>
    <meta charset="utf-8"/>
    <title>Processo el formulari</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estils/estil.css"> <!-- atenció, cal crear-lo! -->
  </head>
  <body>
    <!--contingut -->
    <h1> Has recibido los siguientes datos </h1>
<?php

    function valorarCalma() {
        switch (true) {
            case ($_REQUEST['vol'] >= 0 && $_REQUEST['vol'] <= 3):
                return "estressada";
            case ($_REQUEST['vol'] >= 4 && $_REQUEST['vol'] <= 7):
                return "normalet";
            case ($_REQUEST['vol'] >= 8 && $_REQUEST['vol'] <= 9):
                return "zen";
            case ($_REQUEST['vol'] == 10):
                return "samadhi";
        }
    }

    $intereses = explode(',', $_REQUEST['intereses']);
    foreach ($intereses as $i) {
        $i = trim($i);
    }
    sort($intereses);
      
  
    if (isset($_GET['nombre'])) {
        
        echo "<h2>Se han enviado los datos con el método GET</h2>";
        echo "<p> Hola $_GET[nombre] </p>";
        echo "<p>$_GET[correo] </p>";
        echo "<p>$_GET[fechanacimiento] </p>";
        echo "<p>Grado de calma: " . $_GET['vol'] . " " . valorarCalma() . "</p>";
        echo "<p>Tus intereses són:</p>";
        echo "<ul>";
        foreach ($intereses as $interes) {
            echo "<li>" . $interes . "</li>";
        }
        echo "</ul>";


    } 
    elseif (isset($_POST['nombre'])) {

        echo "<h2>Se han enviado los datos con el método POST</h2>";
        echo "<p>Hola $_POST[nombre] </p>";
        echo "<p>Correo electrónico: $_POST[correo] </p>";
        echo "<p>Fecha nacimiento: $_POST[fechanacimiento] </p>";
        echo "<p>Grado de calma: " . $_POST['vol'] . " " . valorarCalma() . "</p>";
        echo "<p>Tus intereses són:</p>";
        echo "<ul>";
        foreach ($intereses as $interes) {
             echo "<li>" . $interes . "</li>";
        }
        echo "</ul>";
    }

      
?>
    
  </body>
</html>

