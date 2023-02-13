<?php

    class Actor extends Person{

        // Propriétés
        protected array $_roleList;

        // Constructeur
        public function __construct(string $firstName, string $lastName, string $gender, string $birthDate) {
            parent::__construct($firstName, $lastName, $gender, $birthDate);
            $this->_roleList = [];
        }

        // Accesseurs / Mutateurs
        public function getRoleList(): array {
            return $this->_roleList;
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

        // Méthodes
        public function __toString() {
            return "Acteur: " . $this->getFirstName() . " " . $this->getLastName() . ": " . $this->getGender() . " né le " . $this->getbirthDate()->format("Y/m/d") . "<br>";
        }

    }