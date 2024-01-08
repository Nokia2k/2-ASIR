<?php
    include("../index.php");

    $nombre = $_POST["nombre"];
    $apellido1 = $_POST["ape1"];
    $apellido2 = $_POST["ape2"];
    $email = $_POST["email"];
    $fecha_ingreso = $_POST["fe_ingreso"];
    $fecha_nacimiento = $_POST["fe_nacimiento"];
    $telefono = $_POST["telefono"];
    $via = $_POST["via"];

    // ESTO PARA SABER EL ULTIMO ID
    $consulta_id = 'SELECT MAX(id_socio)+1 as ultimo_id FROM socios';
    $stmt = $conexion->query($consulta_id);

    if ($stmt) {
        $fila = $stmt->fetch(PDO::FETCH_ASSOC);
        $socio_id = $fila['ultimo_id'];
    }
    // ESTO PARA SABER EL ULTIMO ID

    $instruccion_sql = "INSERT INTO socios (id_socio, nombre, apellido1, apellido2, correo_electronico, fecha_ingreso, fecha_nacimiento, telefono, id_via) VALUES (:id_socio, :nombre, :apellido1, :apellido2, :email, :fecha_ingreso, :fecha_nacimiento, :telefono, :via)";
    
    try {
        // inicia una transaccion
        $conexion->beginTransaction();

        $stmt = $conexion->prepare($instruccion_sql);
        $stmt->bindParam(':id_socio', $socio_id);
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

        // si ha hecho bien la insercion que haga el commit para confirmarlo        $conexion->commit();
        echo '<script>alert("Datos insertados correctamente"); window.location.href="../index.php";</script>';
    } catch (PDOException $e) {
        // si el insert ha fallado que haga un rollback        $conexion->rollBack();
        echo '<script>alert("Datos erroneos"); window.location.href="../index.php";</script>';
    } finally {
        // cierra la conexión
        $conexion = null;
    }
?>
