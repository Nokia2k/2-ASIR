<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ejercicio 3 - PHP</h1>
    <h2>Ejercicio de dias de la semana y su numero</h2>
    <?php
        $dia = rand(1,7);
        switch ($dia) {
            case 1:
                echo "El primer dia es Lunes -> $dia";
                break;
            case 2:
                echo "El segundo dia es Martes -> $dia";
                break;
            case 3:
                echo "El tercer dia es Miercoles -> $dia";
                break;
            case 4:
                echo "El cuarto dia es Jueves -> $dia";
                break;
            case 5:
                echo "El quinto dia es Viernes -> $dia";
                break;
            case 6:
                echo "El sexto dia es Sabado -> $dia";
                break;
            case 7:
                echo "El septimo dia es Domingo -> $dia";
                break;
            default:
                echo "Algo malo ha pasado";
        }
    ?>
    
</body>
</html>