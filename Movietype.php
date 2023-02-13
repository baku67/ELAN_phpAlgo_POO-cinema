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

        }
        public function addMutipleMoviesToTypeList(array $movies) {

        }

        public function __toString() {
            return "Type " . $this->getType() . "<br>";
        }
    }