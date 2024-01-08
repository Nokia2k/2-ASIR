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
  $resultado = mysqli_query($conexion, $consulta_id);

  if ($resultado) {
      $fila = mysqli_fetch_assoc($resultado);
      $socio_id = $fila['ultimo_id'];
  }
  // ESTO PARA SABER EL ULTIMO ID

  $instruccion_sql = "INSERT INTO socios (id_socio, nombre, apellido1, apellido2, correo_electronico, fecha_ingreso, fecha_nacimiento, telefono, id_via) VALUES ($socio_id, '$nombre', '$apellido1', '$apellido2', '$email', '$fecha_ingreso', '$fecha_nacimiento', '$telefono', '$via')";
  $resultado_instruccion = mysqli_query($conexion, $instruccion_sql);

  if ($resultado_instruccion) {
    // si ha hecho bien la insercion que haga el commit para confirmarlo
    mysqli_commit($conexion);
    echo '<script>alert("Datos insertados correctamente"); window.location.href="../index.php";</script>';
  } else {
    // si el insert ha fallado que haga un rollback
    mysqli_rollback($conexion);
    echo '<script>alert("Datos erroneos"); window.location.href="../index.php";</script>';
  }

  // cierra la conexion
  mysqli_close($conexion);
?>
