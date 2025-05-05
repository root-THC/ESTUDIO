<?php
clearstatcache(); // Limpia la caché de archivos

// Combina los archivos .php y .html
$archivos = array_merge(glob("*.php"), glob("*.html"));
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selecciona un archivo</title>
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