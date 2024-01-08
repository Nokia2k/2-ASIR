<!-- Modal-->

<div class="modal fade" id="insertar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Insertar socio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="./acciones/insertdata.php" method="post">
        <div class="modal-body">
          <label for="">Nombre</label>
          <input type="text" class="form-control" name=nombre value="" placeholder="EJ: Jhon">

          <label for="">Apellido 1</label>
          <input type="text" class="form-control" name=ape1 value="" placeholder="EJ: Doe">

          <label for="">Apellido 2</label>
          <input type="text" class="form-control" name=ape2 value="" placeholder="EJ: Doe">

          <label for="">E-mail</label>
          <input type="email" class="form-control" name=email value="" placeholder="EJ: ejemplo@ejemplo.com">

          <label for="">Fecha de ingreso</label>
          <input type="date" class="form-control" name=fe_ingreso value="">

          <label for="">Fecha de nacimiento</label>
          <input type="date" class="form-control" name=fe_nacimiento value="">

          <label for="">Telefono</label>
          <input type="text" class="form-control" name=telefono value="" placeholder="EJ: 123456789">

          <label for="">Via</label>
          <select class="form-select mb-3" name="via">
            <option selected>Seleccionar via</option>
            <?php
              // Para indicar las distintas vias utilizando PDO
              $stmt = $conexion->query("SELECT id_via FROM via");

              while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='".$row['id_via']."'>".$row['id_via']."</option>";
              }
            ?>
          </select>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary">Insertar Socio</button>
        </div>
      </form>
    </div>
  </div>
</div>



