<?php 

    spl_autoload_register(function ($class_name) {
    require_once $class_name . '.php';
    });


    echo "<h3>Instanciations:</h3><br>";
    $director1 = new Director("James", "Cameron", "Homme", '1900-05-06');
    echo $director1;
    $movieType1 = new Movietype("Drama");
    echo $movieType1 . "<br>";
    $movie1 = new Movie("Titanic", "1984-05-06", 98.56, $director1, "blablabla blabla bla blablabla blabla bla", $movieType1);
    echo $movie1;
    $movie2 = new Movie("Titanic2", "1994-10-11", 102.32, $director1, "blobloblo bloblo blo blobloblo bloblo blo", $movieType1);

    echo "<br><br><br> <h3>Résultat:</h3><br>Liste des films du genre \"" . $movieType1->getType() . "\":<br> " . implode(' ,', $movieType1->getGenreMoviesList()) . "<br>";
    echo "<br><br>" . $director1->printFilmography();
    

    // 1 role = X Acteurs
    // 1 acteur = X Roles
    // Liste Roles dans Acteur, et liste Acteurs dans Role ?

    // $actor1 = new Actor("Leonardo", "DiCaprio", "Homme", "1975-12-10");
    // echo $actor1;
    // $role1 = new Role("Jack Dawson");
    // echo $role1;



