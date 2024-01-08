<?php

  // Datos de la base de datos
  $usuario = "viktor";
  $password = "12345";
  $servidor = "127.0.0.1:3306";
  $basededatos = "bbdd_prueba";

  // creación de la conexión a la base de datos
  $conexion = mysqli_connect( $servidor, $usuario, $password, $basededatos ) or die ("No se ha podido conectar al servidor de Base de datos");
  
  // Selección del a base de datos a utilizar
  $db = mysqli_select_db( $conexion, $basededatos ) or die ("No se ha podido conectar a la base de datos" );
  
  // consulta. guardamos en variable.
  $consulta = "SELECT * FROM prueba1";
  $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta");
  
  // Motrar el resultado de los registro de la base de datos
  // Encabezado de la tabla
  echo "<table border='3'>";
  echo "<tr>";
  echo "<th>campo1</th>";
  echo "<th>campo2</th>";
  echo "<th>campo3</th>";
  echo "</tr>";
  
  // Bucle while que recorre cada registro y muestra cada campo en la tabla.
  while ($columna = mysqli_fetch_array( $resultado ))
  {
    echo "<tr>";
    echo "<td>" . $columna['campo1'] . "</td><td>" . $columna['campo2'] . "</td><td>" . $columna['campo3'] . "</td>";
    echo "</tr>";
  }
  echo "</table>"; // Fin de la tabla
  
  // cerrar conexión de base de datos
  mysqli_close( $conexion );

?>
