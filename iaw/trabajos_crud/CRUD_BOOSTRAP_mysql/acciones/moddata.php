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

  // Comienza una transacción
  mysqli_begin_transaction($conexion);

  $sql_update_socio = "UPDATE socios SET nombre = '$nombre', apellido1 = '$apellido1', apellido2 = '$apellido2', correo_electronico = '$email', fecha_ingreso = '$fecha_ingreso', fecha_nacimiento = '$fecha_nacimiento',telefono = '$telefono',id_via = '$via' WHERE id_socio = '$id_socio'";
  echo "$sql_update_socio";
  $resultado_sql = mysqli_query($conexion, $sql_update_socio);

  if ($resultado_sql) {
    // si ha hecho bien la actualizacion de datos que haga el commit para confirmarlo
    mysqli_commit($conexion);
    echo '<script>alert("Datos actualizados correctamente"); window.location.href="../index.php";</script>';
  } else {
    // si el update ha fallado que haga un rollback
    mysqli_rollback($conexion);
    echo '<script>alert("Datos no actualizados debido a un error: ' . mysqli_error($conexion) . '"); window.location.href="../index.php";</script>';
  }

  mysqli_close($conexion);
?>
