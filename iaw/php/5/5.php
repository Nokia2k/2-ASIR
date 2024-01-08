<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 1 php</title>
</head>
<body>
    <h1>Ejercicio 5 - PHP</h1>
    <h2>Ejercicio de lanzar un dado</h2>
    <?php
        $lanzar = rand(1,6);
        switch ($lanzar) {
            case 1:
                print "<img src=./img/1.svg>";
                break;
            case 2:
                print "<img src=./img/2.svg>";
                break;
            case 3:
                print "<img src=./img/3.svg>";
                break;
            case 4:
                print "<img src=./img/4.svg>";
                break;
            case 5:
                print "<img src=./img/5.svg>";
                break;
            case 6:
                print "<img src=./img/6.svg>";
                break;

            default:
                echo "Algo malo ha pasado";
        }
    ?>
</body>
</html>