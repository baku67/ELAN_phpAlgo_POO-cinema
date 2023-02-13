<?php

    class Movietype {

        // Propriétés
        private string $_type;
        private array $_movieList;

        // Constructeur
        public function __construct(string $type) {
            $this->_type = $type;
            $this->_movieList = [];
        }

        // Accesseurs / Mutateurs
        public function getType():string {
            return $this->_type;
        }
        public function setType(string $type) {
            $this->_type = $type;
        }


        // Méthodes 
        public function addMovieToTypeList(Movie $movie) {
            $this->_movieList[] = $movie;
            echo "Le film créé \"" . $movie->getTitle() . "\" a été ajouté au Genre \"" . $this->_type . "\"<br>";
        }
        // Plus besoin car laison Film/Genre lors de la construction du film
        // public function addMutipleMoviesToTypeList(array $movies) {
        //     $moviesTitles = [];
        //     foreach($movies as $movie) {
        //         $this->_movieList[] = $movie;
        //         $movieTitles[] = $movie->getTitle();
        //     }
        // }

        public function getGenreMoviesList(): array {
            return $this->_movieList;
        }

        public function __toString() {
            return "Type " . $this->getType();
        }
    }