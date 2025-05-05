<!DOCTYPE html>
<html lang="ca-ES">
<head>
    <link rel="stylesheet" href="estils/estil.css"> <!-- atenció, cal crear-lo! -->
</head>
<body>
    <!-- contingut -->
    <h1>Processar el formulari</h1>
    <p>Coses que m'arriben:</p>
    <?php
        echo "<p>Nom (de \$_GET): " . $_GET['nom'] . "</p>";
        echo "<p>Nom (de \$_POST): " . $_POST['nom'] . "</p>";
        echo "<p>Nom (de \$_REQUEST): " . $_REQUEST['nom'] . "</p>";
    ?>
</body>
</html>
