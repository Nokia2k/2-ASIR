<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 1 php</title>
</head>
<body>
    <h1>Ejercicio 2 - PHP</h1>
    <h2>Ejercicio de notas aleatorias</h2>
    <?php
        $nota = rand(0,10);
        if ($nota >= 0 and $nota <= 5) {
            echo "Insuficiente -> $nota";
        } else if ($nota > 5 and $nota <= 6) {
            echo "Suficiente -> $nota";
        } else if ($nota > 6 and $nota <= 7) {
            echo "Bien -> $nota";
        } else if ($nota > 7 and $nota <= 9) {
            echo "Notable -> $nota";
        } else if ($nota > 9 and $nota <= 10) {
            echo "Sobresaliente -> $nota";
        }
    ?>
</body>
</html>