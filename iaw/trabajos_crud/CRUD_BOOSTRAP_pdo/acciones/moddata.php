<?php
    include("../templates/header.php");

    $id_socio = $_POST['id_socio'];
    $nombre = $_POST["nombre"];
    $apellido1 = $_POST["ape1"];
    $apellido2 = $_POST["ape2"];
    $email = $_POST["email"];
    $fecha_ingreso = $_POST["fe_ingreso"];
    $fecha_nacimiento = $_POST["fe_nacimiento"];
    $telefono = $_POST["telefono"];
    $via = $_POST["via"];

    // comienza una transaccion
    $conexion->beginTransaction();

    $sql_update_socio = "UPDATE socios SET nombre = :nombre, apellido1 = :apellido1, apellido2 = :apellido2, correo_electronico = :email, fecha_ingreso = :fecha_ingreso, fecha_nacimiento = :fecha_nacimiento, telefono = :telefono, id_via = :via WHERE id_socio = :id_socio";
    
    try {
        // Prepara la instrucción de actualización
        $stmt = $conexion->prepare($sql_update_socio);
        $stmt->bindParam(':id_socio', $id_socio);
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':apellido1', $apellido1);
        $stmt->bindParam(':apellido2', $apellido2);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':fecha_ingreso', $fecha_ingreso);
        $stmt->bindParam(':fecha_nacimiento', $fecha_nacimiento);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':via', $via);

        // esto para ejecutar la insercion
        $stmt->execute();

        // si ha hecho bien la actualizacion de datos que haga el commit para confirmarlo        $conexion->commit();
        echo '<script>alert("Datos actualizados correctamente"); window.location.href="../index.php";</script>';
    } catch (PDOException $e) {
        // si el update ha fallado que haga un rollback
        $conexion->rollBack();
        echo '<script>alert("Datos no actualizados debido a un error: ' . $e->getMessage() . '"); window.location.href="../index.php";</script>';
    } finally {
        // cierra la conexion
        $conexion = null;
    }
?>
