<?php
clearstatcache(); // Limpia la caché de archivos
$archivos = glob("*.php") OR glob("*.php") ; // Obtiene todos los archivos PHP en el directorio
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selecciona un archivo PHP</title>
</head>
<body>
    <h1>Archivos disponibles</h1>
    <ul>
        <?php foreach ($archivos as $archivo): ?>
            <?php if ($archivo !== 'index.php'): // Evita mostrar index.php ?>
                <li><a href="<?php echo $archivo; ?>"><?php echo $archivo; ?></a></li>
            <?php endif; ?>
        <?php endforeach; ?>
    </ul>
</body>
</html>



