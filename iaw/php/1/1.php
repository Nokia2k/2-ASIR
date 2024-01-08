<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 1 php</title>
</head>
<body>
    <h1>Ejercicio 1 - PHP</h1>
    <h2>Ejercicio Lanzar una moneda</h2>
    <?php
        $lanzar = rand(1,2);
        if ($lanzar == 1) {
            print "<img src=./img/cara.jpg>";
        } else if ($lanzar == 2) {
            print "<img src=./img/cruz.jpg>";
        }
    ?>
</body>
</html>