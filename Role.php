<?php 

    class Role {

        // Propriétés
        private string $_name;

        // Constructeur
        public function __construct(string $name) {
            $this->_name = $name;
        }

        // Accesseurs/Mutateurs
        public function getName(): string {
            return $this->_name;
        }
        public function setName($name) {
            $this->_name = $name;
        }

        // Méthodes
        public function __toString() {
            return "Role: " . $this->getName();
        }
    }


