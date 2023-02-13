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

        
    }


?>