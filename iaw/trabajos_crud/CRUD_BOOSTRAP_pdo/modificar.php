<?php include("templates/header.php"); ?>

<form action="./acciones/moddata.php" method="post">

  <?php
    
    $sql_mod = "SELECT * FROM socios WHERE id_socio = :id_socio";
    $stmt = $conexion->prepare($sql_mod);
    $stmt->bindParam(':id_socio', $_REQUEST['id_socio']);
    $stmt->execute();
    $valor = $stmt->fetch(PDO::FETCH_ASSOC);
  ?>
  <input type="Hidden" class="form-control" name="id_socio" value="<?php echo $valor['id_socio'];?>">

  <label for="">Nombre</label>
  <input type="text" class="form-control" name=nombre value="<?php echo $valor['nombre'];?>" placeholder="EJ: Jhon">

  <label for="">Apellido 1</label>
  <input type="text" class="form-control" name=ape1 value="<?php echo $valor['apellido1'];?>" placeholder="EJ: Doe">

  <label for="">Apellido 2</label>
  <input type="text" class="form-control" name=ape2 value="<?php echo $valor['apellido2'];?>" placeholder="EJ: Doe">

  <label for="">E-mail</label>
  <input type="email" class="form-control" name=email value="<?php echo $valor['correo_electronico'];?>" placeholder="EJ: ejemplo@ejemplo.com">

  <label for="">Fecha de ingreso</label>
  <input type="date" class="form-control" name=fe_ingreso value="<?php echo $valor['fecha_ingreso'];?>">

  <label for="">Fecha de nacimiento</label>
  <input type="date" class="form-control" name=fe_nacimiento value="<?php echo $valor['fecha_nacimiento'];?>">

  <label for="">Telefono</label>
  <input type="text" class="form-control" name=telefono value="<?php echo $valor['telefono'];?>" placeholder="EJ: 123456789">

  <label for="">Via</label>
  <select class="form-select mb-3" name="via" >
    <option selected>Seleccionar via</option>
      <option value="1" <?php if($valor['id_via'] == 1) echo 'selected';?>>1</option>
      <option value="2" <?php if($valor['id_via'] == 2) echo 'selected';?>>2</option>
  </select>
          
  <div class="modal-footer">
    <a href="./index.php" class="btn btn-danger">Cancelar modificacion</a>
    <button type="submit" class="btn btn-success">Actualizar Socio</button>
  </div>
</form>


<?php include("templates/footer.php"); ?>