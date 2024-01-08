<?php
    include("../index.php");

    $id_socio = $_GET['id_socio'];

    $instruccion_borrar_sql = "DELETE FROM socios WHERE id_socio = '$id_socio'";


    // Comienza una transacción
    mysqli_begin_transaction($conexion);

    $resultado_instruccion = mysqli_query($conexion, $instruccion_borrar_sql);

    if ($resultado_instruccion) {
        // si ha hecho bien el borrado que haga el commit para confirmarlo
        mysqli_commit($conexion);
        echo '<script>alert("Socio eliminado correctamente"); window.location.href="../index.php";</script>';
    } else {
        // si el delete ha fallado que haga un rollback
        mysqli_rollback($conexion);
        echo '<script>alert("Error al eliminar al socio"); window.location.href="../index.php";</script>';
    }

    // cierra la conexion
    mysqli_close($conexion);
?>
<?php include("templates/footer.php"); ?>