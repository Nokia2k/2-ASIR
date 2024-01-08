<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="estilo.css">
    <title>Personas</title>
</head>

<body>
    <?php

    include 'persona.php';

    $p = new persona("Juan", "Alvarez", "Torregrosa", 22);
    $p2 = new persona("Alvaro", "Martinez", "Fernandez", 20);

    ?>

    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido 1</th>
                <th>Apellido 2</th>
                <th>Edad</th>
            </tr>
        </thead>
        <tbody>
            <?php
                echo $p->imprimir();
                echo $p2->imprimir();
            ?>
        </tbody>
    </table>

    <?php
        echo "<h2>Valores de las personas modificadas </h2>";
        $p->set_apellido1("Cambiado");
        $p2->set_apellido2("Hermoso");
    ?>

    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido 1</th>
                <th>Apellido 2</th>
                <th>Edad</th>
            </tr>
        </thead>
        <tbody>
            <?php
                echo $p->imprimir();
                echo $p2->imprimir();
            ?>
        </tbody>
    </table>

</body>
</html>