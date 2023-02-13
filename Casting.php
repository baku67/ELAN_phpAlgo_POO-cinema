<?php

    class Casting {

        private Movie $_movie;
        private Actor $_actor;
        private Role $_role;

        public function __construct(Movie $movie, Actor $actor, Role $role) {
            $this->_movie = $movie;
            $this->_actor = $actor;
            $this->_role = $role;
        }

        // Accesseurs / Mutateurs
        public function getMovie():Movie {
            return $this->_movie;
        }
        public function getActor():Actor {
            return $this->_actor;
        }
        public function getRole():Role {
            return $this->_role;
        }

        public function setMovie(Movie $movie) {
            $this->_movie = $movie;
        }
        public function setActor(Actor $actor) {
            $this->_actor = $actor;
        }
        public function setRole(Role $role) {
            $this->_role = $role;
        }

        
        // méthodes:
        public function printCasting() {
            echo "Dans le film \"" . $this->_movie->getTitle() . "\", " ;
        }





    }


?>