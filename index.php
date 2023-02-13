<?php 

    spl_autoload_register(function ($class_name) {
    require_once $class_name . '.php';
    });


    echo "<h3>Instanciations:</h3><br>";
    $director1 = new Director("James", "Cameron", "Homme", '1900-05-06');
    echo $director1;
    $movieType1 = new Movietype("Drama");
    echo $movieType1 . "<br>";

    $role1 = new Role("Jack Dawson");
    $role2 = new Role("Rose DeWitt");
    $role3 = new Role("Testeur3");
    $movie1 = new Movie("Titanic", "1984-05-06", 98.56, $director1, "blablabla blabla bla blablabla blabla bla", $movieType1);
    $actor1 = new Actor("Leonardo", "DiCaprio", "Homme", "1980-12-10");
    $actor2 = new Actor("Kate", "Winslet", "Femme", "1985-08-04");
    $actor3 = new Actor("TEST3", "test3", "Homme", "2014-05-02");

    // ?
    // $actor1->addRoleToActor($role1);
    // $actor2->addRoleToActor($role1);
    // ?

    $casting1 = new Casting($movie1, $actor1, $role1);
    $casting2 = new Casting($movie1, $actor2, $role2);
    $casting3 = new Casting($movie1, $actor3, $role3);



    echo $movie1;

    echo "<br><br><br> <h3>Résultat:</h3><br>Liste des films du genre \"" . $movieType1->getType() . "\":<br> " . implode(' ,', $movieType1->getGenreMoviesList()) . "";
    echo "<br><br>" . $director1->printFilmography();
    // echo "<br><br>" . $role1->printAllActors();
    // echo "<br><br>" . $role1->printAllActorsName();

    echo "<br><br>Casting:<br>";
    $movie1->printMovieCastings();

    echo "<br><br>";
    $role1->printAllActorsName();
    echo "<br>";

    
    echo implode($actor1->printActorMovieList());

    
    




