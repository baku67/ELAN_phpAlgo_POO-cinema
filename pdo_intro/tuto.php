
<?php

try {
    $mysqlConnection = new PDO(
        'mysql:host=localhost;dbname=basile_cinema;charset=utf8',
        'root',
        '',
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION],
    );
}
catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}


// Utilisation de query() ici car pas de besoin de préparer la requètes avec des paramètres sécurisés
$movieList = $mysqlConnection->query('
SELECT movie_title, YEAR(movie_frenchPublishDate), movie_length, CONCAT(person_firstName, " ", person_lastName) AS "réalisateur"
FROM movie m
INNER JOIN director d ON m.director_id = d.director_id
INNER JOIN person p ON p.person_id = d.person_id
');
// $movieList->execute();
$movies = $movieList->fetchAll();

echo "<h1>Liste des films:</h1><br>";
foreach($movies as $movie) {
?>
    <p><?= $movie["movie_title"] ?></p>
<?php
}


// Requête préparée avec prepare() et id actor:
echo "<br><h1>Liste des films de l'acteur ID=1:</h1><br>";
$actorMovieList = $mysqlConnection->prepare('
    SELECT movie_title AS "Titre film", role_name AS "Rôle", movie_frenchPublishDate AS "Date de sortie FR"
    FROM casting c
    INNER JOIN movie m ON m.movie_id = c.movie_id
    INNER JOIN role r ON r.role_id = c.role_id
    WHERE (actor_id = :actorId)
    ORDER BY movie_frenchPublishDate DESC
');
$actorMovieList->execute([
    'actorId' => 1
]);
$actorMovies = $actorMovieList->fetchAll();
foreach ($actorMovies as $actorMovie) {
?>
    <p><?= $actorMovie["Titre film"] ?></p>
<?php
}

?>



