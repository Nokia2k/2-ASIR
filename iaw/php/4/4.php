<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 1 php</title>
</head>
<body>
    <h1>Ejercicio 4 - PHP</h1>
    <h2>Ejercicio de lanzar un dado</h2>
    <?php
        $lanzar = rand(1,6);
        if ($lanzar == 1) {
            print "<img src=./img/1.svg>";
        } else if ($lanzar == 2) {
            print "<img src=./img/2.svg>";
        } else if ($lanzar == 3) {
            print "<img src=./img/3.svg>";
        } else if ($lanzar == 4) {
            print "<img src=./img/4.svg>";
        } else if ($lanzar == 5) {
            print "<img src=./img/5.svg>";
        } else {
            print "<img src=./img/6.svg>";
        }
    ?>
</body>
</html>