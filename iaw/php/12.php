<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ejercicio 12 - PHP</h1>
    <h2>Ejercicio de Numeros y mas cosas</h2>
    <?php
        function iniciar_array($num, $min, $max) {
            echo "Si me has dado de minimo: $min";
            echo "<br>";
            echo "Si me has dado de maximo: $max";
            echo "<br>";
            echo "Y te tengo que dar $num de numeros entre esos dos, son estos:\n";
            echo "<br>";
            echo "<br>";
            $cont = 1;
            $maximo = 0;
            $minimo = PHP_INT_MAX;
            $media = 0;
            while ($num >= $cont) {
                $valor = rand($min, $max);
                echo "-> $valor";
                echo "<br>";
                $cont++;
                if ($maximo < $valor) {
                    $maximo = $valor;
                }

                if ($minimo > $valor) {
                    $minimo = $valor;
                }
                
                $media = $media + $valor;

            }
            $media = $media / $num;

            echo "<br>";
            echo "El mas grande de los $num numeros generados es: $maximo";
            echo "<br>";
            echo "El mas pequeño de los $num numeros generados es: $minimo";
            echo "<br>";
            echo "La media de los $num numeros generados es: $media";
            
                
        }
        iniciar_array(10,1,31437642584923);
    ?>
</body>
</html>