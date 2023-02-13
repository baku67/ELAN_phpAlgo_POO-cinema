<?php 

    class Role {

        // Propriétés
        private string $_name;
        private array $_actorsList;

        // Constructeur
        public function __construct(string $name) {
            $this->_name = $name;
            $this->_actorsList = [];
        }

        // Accesseurs/Mutateurs
        public function getName(): string {
            return $this->_name;
        }
        public function setName($name) {
            $this->_name = $name;
        }

        public function addActorToRole() {

        }
        public function addMultiplesActorsToRole() {
            
        }
        public function getActorsRoleList() {
            
        }

        // Méthodes
        public function __toString() {
            return "Role: " . $this->getName();
        }
    }


