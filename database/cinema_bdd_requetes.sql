-- Exercice a
SELECT movie_title, YEAR(movie_frenchPublishDate), movie_length, CONCAT(person_firstName, " ", person_lastName) AS "réalisateur"
FROM movie m
INNER JOIN director d ON m.director_id = d.director_id
INNER JOIN person p ON p.person_id = d.person_id

-- Exercice b
SELECT movie_title 
FROM movie m 
WHERE movie_length > 135
ORDER BY movie_length DESC

-- Exercice c
SELECT movie_title, YEAR(movie_frenchPublishDate)
FROM movie m 
WHERE director_id = 1

-- Exercice d
SELECT COUNT(movie_id) AS nbr_films, movieGenre_label
FROM moviegenrelist m
INNER JOIN movie_genre mg ON m.movieGenre_id = mg.movieGenre_id
GROUP BY mg.movieGenre_id
ORDER BY nbr_films DESC

-- Exercice e 
SELECT COUNT(movie_id) AS "nbr_films", CONCAT(person_firstName, " ", person_lastName) AS "réalisateur"
FROM movie m
INNER JOIN director d ON d.director_id = m.director_id
INNER JOIN person p ON p.person_id = d.person_id
GROUP BY réalisateur
ORDER BY nbr_films DESC

-- Exercice f
SELECT movie_title, CONCAT(p.person_firstName, " ", p.person_lastName) AS "acteur", person_gender
FROM casting
INNER JOIN movie ON movie.movie_id = casting.movie_id
INNER JOIN actor ON casting.actor_id = actor.actor_id
INNER JOIN person p ON p.person_id = actor.person_id
WHERE (movie_title = "Titanic") 

-- Exercice g
SELECT movie_title AS "Titre film", role_name AS "Rôle", movie_frenchPublishDate AS "Date de sortie FR"
FROM casting c
INNER JOIN movie m ON m.movie_id = c.movie_id
INNER JOIN role r ON r.role_id = c.role_id
WHERE (actor_id = 1)
ORDER BY movie_frenchPublishDate DESC

-- Exercice h
SELECT CONCAT(p.person_firstName, " ", person_lastName) AS "Acteur", movie_title AS "Titre film", role_name AS "Rôle", movie_frenchPublishDate AS "Date de sortie FR"
FROM casting c
INNER JOIN movie m ON m.movie_id = c.movie_id
INNER JOIN role r ON r.role_id = c.role_id
INNER JOIN actor a ON a.actor_id = c.actor_id
INNER JOIN person p ON p.person_id = a.person_id
WHERE (c.actor_id = 1)
ORDER BY movie_frenchPublishDate DESC

-- (!) Exerice i 
SELECT movie_title AS "titre film"
FROM movie m
WHERE YEAR(NOW()) - YEAR(m.movie_frenchPublishDate) < 50
ORDER BY m.movie_id

-- Exercice j 
SELECT COUNT(actor_id) AS "Nbr d'hommes", person_gender AS "sexe"
FROM actor 
INNER JOIN person ON person.person_id = actor.person_id
GROUP BY person_gender

-- Exercice k (DateDiff OK) 
SELECT ROUND((DATEDIFF(NOW(), person_birthDate)/360)) AS "Age", CONCAT(person_firstName, " ", person_lastName) AS "Acteurs >= 50ans"
FROM actor a
INNER JOIN person p ON p.person_id = a.person_id
WHERE (ROUND((DATEDIFF(NOW(), person_birthDate)/360)) > 50 )

-- Exercice l
SELECT CONCAT(person_firstName, " ", person_lastName) AS "Acteur", COUNT(c.actor_id) AS "NbrFilms"
FROM person p 
INNER JOIN actor a ON a.person_id = p.person_id
INNER JOIN casting c ON c.actor_id = a.actor_id
GROUP BY p.person_id
HAVING COUNT(c.actor_id) >= 3 
