<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ejercicio 4.2 - PHP</h1>
    <h2>Ejercicio de Funciones</h2>
    <?php
        $texto = "uno-dos-tres-cuatro-cinco";
        $array = explode("-", $texto);
        for ($i = 0; $i < count($array); $i++) {
        $n = $array[$i];
        echo "-> $n";
        echo "<br>";

        }
        

    ?>
</body>
</html>