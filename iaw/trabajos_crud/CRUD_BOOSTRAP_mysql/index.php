
<?php include("templates/header.php"); ?>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertar">
Insertar Socio
</button>

<main class="container">
  <?php     
    $titulo_socios = "<table class='table table-dark'><tr><th></th><th>Nombre</th><th>Apellido 1</th><th>Apellido 2</th><th>E-mail</th><th>Fecha de ingreso</th><th>Fecha de nacimiento</th><th>Telefono</th><th>Via</th><th></th></tr>";
  
    $sql_query = "SELECT * FROM socios ";
  
    // CONSULTA DE LA TABLA SOCIOS
    echo $titulo_socios;
  
    $result = $conexion->query($sql_query);
    while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr><td><a href='./modificar.php?id_socio=" . $row['id_socio'] . "' class='btn btn-warning'>Editar</a></td>";
      echo "<td>" . $row["nombre"] . "</td><td>" . $row["apellido1"] . "</td><td>" . $row["apellido2"] . "</td><td>" . $row["correo_electronico"] . "</td><td>" . $row["fecha_ingreso"] . "</td><td>" . $row["fecha_nacimiento"] . "</td><td>" . $row["telefono"] . "</td><td>" . $row["id_via"] . "</td>";
      echo "<td><a href='./acciones/deldata.php?id_socio=" . $row['id_socio'] . "' class='btn btn-danger'>Eliminar</a></td></tr>";
    }
    echo "</table>";
  ?>            
</main>

<?php include("insertar.php"); ?>    

<?php include("templates/footer.php"); ?>
 