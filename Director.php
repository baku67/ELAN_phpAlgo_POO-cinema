<?php

    class Director extends Person {

        private array $_moviesList;

        public function __construct(string $firstName, string $lastName, string $gender, string $birthDate) {
            parent::__construct($firstName, $lastName, $gender, $birthDate);
        }

        // Ajout d'un film à la filmographie de son Réalisateur lors de la création du film
        public function addMovieToDirectorList(Movie $movie) {
            $this->_moviesList[] = $movie;
        }
        // Affichage filmographie
        public function printFilmography() {
            echo "Filmographie de " . $this->getFirstName() . " " . $this->getLastName() . ":<br>" . implode("", $this->_moviesList);
        }

        // Méthodes
        public function __toString() {
            return "Réalisateur: " . $this->getFirstName() . " " . $this->getLastName() . ": " . $this->getGender() . " né le " . $this->getbirthDate()->format("Y/m/d") . "<br>";
        }
        
    }
