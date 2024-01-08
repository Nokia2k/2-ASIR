<!doctype html>
<html lang="es">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS v5.2.1 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles/estilo_footer.css">
  </head>

  <body>
    <header>
      <br></br>
      <img src="./img/hola.png" width="100px" height="100px" style="display: block; margin: auto; ">
      <br></br>
      <?php

        $servername = 'localhost';
        $database= 'cuchicoches_SL';
        $user = 'viktor';
        $password = '1234';

        try {

            // conexion con pdo
            $conexion = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);

            // Configurando para cambiar en casod error por excepciones
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        } catch (PDOException $e) {
            die("Error al conectar: " . $e->getMessage());
        }
    ?>
    </header>