<?php

    class Actor extends Person{

        // Propriétés
        protected array $_roleList;
        protected array $_movieList;

        // Constructeur
        public function __construct(string $firstName, string $lastName, string $gender, string $birthDate) {
            parent::__construct($firstName, $lastName, $gender, $birthDate);
            $this->_roleList = [];
            $this->_movieList = [];
        }

        // Accesseurs / Mutateurs
        public function getRoleList(): array {
            return $this->_roleList;
        }
        public function addMovieToActor(Movie $movie) {
            $this->_movieList[] = $movie;
        }
        public function addRoleToActor(Role $role) {
            $this->_roleList[] = $role;
            $role->addActorToRole($this);
            return "Le rôle \"" . $role->getName() . "\" a été ajouté à l'acteur \"" . $this->getFirstName() . " " . $this->getLastName();
        }
        public function addMultipleRolesToActor(array $roles) {
            $roleArray = [];
            foreach($roles as $role) {
                $role->addActorToRole($this);
                $this->_roleList[] = $role;
                $roleArray = $role->getName();
            }
            return "Les rôles \"" . implode(", ", $roleArray) . "\" ont été ajouté à l'acteur \"" . $this->getFirstName() . " " . $this->getLastName();
        }

        // Méthodes
        public function printActorRoleList() {
            echo implode(",", $this->_roleList);
        }
        public function printActorMovieList() {
            echo "Filmographie de l'acteur " . $this->getFirstName() . " " . $this->getLastName() . ":<br>";
            return $this->_movieList;
        }

        public function __toString() {
            return "Acteur: " . $this->getFirstName() . " " . $this->getLastName() . ": " . $this->getGender() . " né le " . $this->getbirthDate()->format("Y/m/d") . "<br>";
        }

    }