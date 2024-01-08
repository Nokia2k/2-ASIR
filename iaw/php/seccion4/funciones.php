<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ejercicio 4.1 - PHP</h1>
    <h2>Ejercicio de Funciones</h2>
    <!-- INSERT INTO alumno (Nombre, Edad, Nota) VALUES (Javi, 12, 5) -->
    <?php
        function insert($tabla, $datos) {
            $campos = implode(", ", array_keys($datos));
            $valores = implode(", ",$datos);
            $sentencia = "INSERT INTO $tabla ($campos) VALUES ($valores);";
            echo $sentencia;
        }

        $tabla = "Alumnos";
        $datos = array("Nombre" => "Javi", "Edad" => "15", "Nota" => "7");

        insert($tabla, $datos);
         
    ?>

</body>
</html>