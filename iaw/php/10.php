<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ejercicio 10 - PHP</h1>
    <h2>Ejercicio de Paises y sus capitales</h2>
    <?php
        $hola=array("Italy"=>"Rome", "Luxembourg"=>"Luxembourg", "Belgium"=> "Brussels", "
        Denmark"=>"Copenhagen", "Finland"=>"Helsinki", "France" => "Paris", "
        Slovakia"=>"Bratislava", "Slovenia"=>"Ljubljana", "Germany" => "Berlin", "
        Greece" => "Athens", "Ireland"=>"Dublin", "Netherlands"=>"Amsterdam", "
        Portugal"=>"Lisbon", "Spain"=>"Madrid", "Sweden"=>"Stockholm", "United
        Kingdom"=>"London", "Cyprus"=>"Nicosia", "Lithuania"=>"Vilnius", "Czech
        Republic"=>"Prague", "Estonia"=>"Tallin", "Hungary"=>"Budapest", "Latvia"=>"
        Riga", "Malta"=>"Valetta", "Austria" => "Vienna", "Poland"=>"Warsaw");
        foreach ($hola as $Pais => $Capital) {
            echo "Paisano: " . $Pais . " - Capitalenfermo: " . $Capital;
            echo "<br>";
        }

    ?>
</body>
</html>