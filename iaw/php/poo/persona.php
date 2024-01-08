<?php

class Persona {

    // Propiedades

    private $nombre;
    private $apellido1;
    private $apellido2;
    private $edad;



    // Constructor

    function __construct($nombre, $apellido1, $apellido2, $edad) {

        $this->nombre = $nombre;
        $this->apellido1 = $apellido1;
        $this->apellido2 = $apellido2;
        $this->edad = $edad;

    }

    // Seters
    function set_nombre($nombre) {
        $this->nombre = $nombre;
    }
    function set_apellido1($apellido1) {
        $this->apellido1 = $apellido1;
    }
    function set_apellido2($apellido2) {
        $this->apellido2 = $apellido2;
    }
    function set_edad($edad) {
        $this->edad = $edad;
    }

    // Geters

    function get_nombre() {
        return $this->nombre;
    }
    function get_apellido1() {  
        return $this->apellido1;
    }
    function get_apellido2() {  
        return $this->apellido2;
    }
    function get_edad() {  
        return $this->edad;
    }

    // Imprimir
    function imprimir () {
    
        return "
        <tr>
            <td>".$this->nombre."</td>
            <td>".$this->apellido1."</td>
            <td>".$this->apellido2."</td>
            <td>".$this->edad."</td>
        </tr>";
    }

}

?>