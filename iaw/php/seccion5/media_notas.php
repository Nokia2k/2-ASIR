<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./estilo.css">
    <title>Document</title>
</head>
<body>
    <h1>Ejercicio 5.1 - PHP</h1>
    <h2>Calculo de la nota media y Formularios</h2>
    <?php

        $practicas = array();
        $examenes = array();
        $nif = $_POST["nif"];
        $correo = $_POST["correo"];
        $nombre = $_POST["nombre"];

        function insert_array($array, $tipo) {

            $total = 0;
            for ($i = 1; $i <= 100; $i++) { # si le pongo PHP_INT_MAX? 
                
                $notas = ($_POST["$tipo$i"]);
                if ($notas != "" and is_numeric($notas) == true) {
                    array_push($array, $notas);
                    $total = $total + $notas;
                } 
            }
            return $total;  
        }

        function comprobar($nif, $nombre, $correo, $notas) {
            
            # COMPROBAR LA VALIDEZ DEL NIF #
            function nif($nif){
                if (strlen($nif) == 9) {
                    $numeros = substr($nif, 0,8);
                    $letra = strtoupper(substr($nif, -1));
                    if (substr("TRWAGMYFPDXBNJZSQVHLCKE",$numeros%23,1) == $letra) {
                        $correcto_nif = 0;
                    } else {
                        $correcto_nif = 1;                        
                    }
                } else {
                    $correcto_nif = 1;
                }
                return $correcto_nif;
            }

            # COMPROBAR LA VALIDEZ DEL CORREO #
            function correo($correo){
                if (filter_var($correo, FILTER_VALIDATE_EMAIL)) {
                    $correcto_correo = 0;
                } else {
                    $correcto_correo = 1;
                    #return "Correo Incorrecto";
                }
                return $correcto_correo;
            }

            # COMPROBAR LA VALIDEZ DEL NOMBRE #
            function nombre($nombre){
                if (preg_match("/^[a-zA-Z ]*$/", $nombre)) {
                    global $correcto_nombre;
                    $correcto_nombre = 0;
                } else {
                    $correcto_nombre = 1;
                }
                return $correcto_nombre;
            }

            function nota($notas) {
                if ($notas > 10 or $notas < 0) {
                    $correcto_nota = 1;
                } else {
                    $correcto_nota = 0;
                }
                return $correcto_nota;
            }
            
            # QUE DEVUELVA EL VALOR DE CORRECTO SEGUN ESTEN TODOS LOS VALORES
            if ( correo($correo) == 0 and nif($nif) == 0 and nombre($nombre) == 0 and nota($notas) == 0 ) {
                $correcto = 0;
            } else {
                $correcto = 1;
            }
            return $correcto;
        }
        
        $p = (insert_array($practicas, "pr"));
        $e = (insert_array($examenes, "ex"));
        $p = (( $p * 4 ) / 40);
        $e = (( $e * 6 ) / 20);
        $f = $p + $e;
        $comprobacion = comprobar($nif, $nombre, $correo, $nota);
    ?>

    <form action="formulario1.php" method="post">

        <p><FONT COLOR="red"> * Requerido</FONT></p>
        <p>Nombre: <input type="text" name="nombre" value="<?php if ($comprobacion != 0) { echo $nombre; } ?>" placeholder="Ej: Jhon Doe"/><FONT COLOR="red"> *
            <?php
                if (nombre($nombre) != 0) {
                    $erro_nom = $nombre;
                    echo "El nombre esta mal puesto";
                }
            ?>
            </FONT>
        </p>
        <p>Correo: <input type="text" name="correo" value="<?php if ($comprobacion != 0) { echo $correo; } ?>" required placeholder="Ej: ejemplo@ejemplo.com"/><FONT COLOR="red"> *
            <?php
                if (correo($correo) != 0) {
                    echo "El correo esta mal puesto";
                }
            ?>
            </FONT>
        </p>
        <p>NIF: <input type="text" name="nif" value="<?php if ($comprobacion != 0) { echo $nif; } ?>" required placeholder="Ej: 12345678A"/><FONT COLOR="red"> *
            <?php
                if (nif($nif) != 0) {
                    echo "El nif esta mal puesto";
                }
            ?>
            </FONT>
        </p>
        <br>
        <p>Practica 1: <input type="text" name="pr1" value="<?php if ($comprobacion != 0) { echo $notas; } else {echo "0";} ?>"><FONT COLOR="red"> *
            <?php
                $num_nota = $_POST["pr1"];
                if ($num_nota > 10 or $num_nota < 0) {
                    echo "Valor de nota incorrecto";
                    $comprobacion = 1;
                }
            ?>
            </FONT>
        </p>
        <p>Practica 2: <input type="text" name="pr2" value="<?php if ($comprobacion != 0) { echo $notas; } else {echo "0";} ?>"><FONT COLOR="red"> *
            <?php
               $num_nota = $_POST["pr2"];
               if ($num_nota > 10 or $num_nota < 0) {
                    echo "Valor de nota incorrecto";
                    $comprobacion = 1;
                }
            ?>
            </FONT>
        </p>
        <p>Practica 3: <input type="text" name="pr3" value="<?php if ($comprobacion != 0) { echo $notas; } else {echo "0";} ?>"><FONT COLOR="red"> *
            <?php
                $num_nota = $_POST["pr3"];
                if ($num_nota > 10 or $num_nota < 0) {
                    echo "Valor de nota incorrecto";
                    $comprobacion = 1;
                }
            ?>
            </FONT>
        </p>
        <p>Practica 4: <input type="text" name="pr4" value="<?php if ($comprobacion != 0) { echo $notas; } else {echo "0";} ?>"><FONT COLOR="red"> *
            <?php
                $num_nota = $_POST["pr4"];
                if ($num_nota > 10 or $num_nota < 0) {
                    echo "Valor de nota incorrecto";
                    $comprobacion = 1;
                }
            ?>
            </FONT>
        </p>
        <br>
        <p>Examen 1: <input type="text" name="ex1" value="<?php if ($comprobacion != 0) { echo $notas; } else {echo "0";} ?>"><FONT COLOR="red"> *
            <?php
                $num_nota = $_POST["ex1"];
                if ($num_nota > 10 or $num_nota < 0) {
                    echo "Valor de nota incorrecto";
                    $comprobacion = 1;
                }
            ?>
            </FONT>
        </p>
        <p>Examen 2: <input type="text" name="ex2" value="<?php if ($comprobacion != 0) { echo $notas; } else {echo "0";} ?>"><FONT COLOR="red"> *
            <?php
                $num_nota = $_POST["ex2"];
                if ($num_nota > 10 or $num_nota < 0) {
                    echo "Valor de nota incorrecto";
                    $comprobacion = 1;
                }
            ?>
            </FONT>
        </p>

        <p><input type="submit" /></p>

    </form>

    <?php
        if ( $comprobacion == 0) {
            echo "<table>
                <tr>

                    <td colspan='2'><center>Formulario realizado correctamente</center></td>
                </tr>
                <tr>
                    <th>Campo</th>
                    <th>Valor</th>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td>$nombre</td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td>$correo</td>
                </tr>
                <tr>
                    <td>NIF:</td>
                    <td>$nif</td>
                </tr>
                <tr>
                    <td colspan='2'><center>Mostrando notas:</center></td>
                </tr>
                <tr>
                    <td>Valor total de las practicas:</td>
                    <td>$p</td>
                </tr>
                <tr>
                    <td>Valor total de los examenes:</td>
                    <td>$e</td>
                </tr>
                <tr>
                    <td>Resultado final:</td>
                    <td>$f</td>
                </tr>
            </table>";
        } else {
            echo "<table>
                <tr>
                    <td colspan='2'><center>Formulario realizado incorrectamente</center></td>
                </tr>
                <tr>
                    <th>Campo</th>
                    <th>Valor</th>
                </tr>
                <tr>
                    <td colspan='2'><center>Rellene los campos con los valores correctos</center></td>
                </tr>";
        }
    ?>
</body>
</html>