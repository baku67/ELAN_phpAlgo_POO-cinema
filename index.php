<?php 

    spl_autoload_register(function ($class_name) {
    require_once $class_name . '.php';
    });




    $director1 = new Director("James", "Cameron", "Homme", '1900-05-06');
    echo $director1;
    $movieType1 = new Movietype("drama");
    echo $movieType1;
    $movie1 = new Movie("Titanic", "1984-05-06", 98.56, $director1, "blablabla blabla bla blablabla blabla bla", $movieType1);
    echo $movie1;


// Héritage: Perssonne extendée par Réalisateur, acteur (nom, etc...)
// acteur:  + role
// realisateur:  (+ unique à un film)
// class Role ? (car instancié qu'une seule fois) 
