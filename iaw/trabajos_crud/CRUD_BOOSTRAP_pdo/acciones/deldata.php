<?php
    include("../index.php");

    $id_socio = $_GET['id_socio'];

    $instruccion_borrar_sql = "DELETE FROM socios WHERE id_socio = :id_socio";

    try {
        // Inicia una transacción
        $conexion->beginTransaction();

        $stmt = $conexion->prepare($instruccion_borrar_sql);
        $stmt->bindParam(':id_socio', $id_socio);
        $stmt->execute();

        // si ha hecho bien el borrado que haga el commit para confirmarlo
        $conexion->commit();
        echo '<script>alert("Socio eliminado correctamente"); window.location.href="../index.php";</script>';
    } catch (PDOException $e) {
        // si el delete ha fallado que haga un rollback
        $conexion->rollBack();
        echo '<script>alert("Error al eliminar al socio"); window.location.href="../index.php";</script>';
    } finally {
        // cierra la conexion
        $conexion = null;
    }

    include("templates/footer.php");
?>
