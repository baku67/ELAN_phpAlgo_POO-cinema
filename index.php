<?php 

    spl_autoload_register(function ($class_name) {
    require_once $class_name . '.php';
    });


    // 1 role = X Acteurs
    // 1 acteur = X Roles
    // Liste Roles dans Acteur, et liste Acteurs dans Role ?

    echo "Instanciations:<br>";
    $director1 = new Director("James", "Cameron", "Homme", '1900-05-06');
    echo $director1;
    $movieType1 = new Movietype("drama");
    echo $movieType1 . "<br>";
    $movie1 = new Movie("Titanic", "1984-05-06", 98.56, $director1, "blablabla blabla bla blablabla blabla bla", $movieType1);
    echo $movie1;
    $actor1 = new Actor("Leonardo", "DiCaprio", "Homme", "1975-12-10");
    echo $actor1;
    $role1 = new Role("Jack Dawson");
    echo $role1;



