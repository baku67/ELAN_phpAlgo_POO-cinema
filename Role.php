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

        public function addActorToRole(Actor $actor) {
            $this->_actorsList[] = $actor;
        }


        // Méthodes
        public function printAllActors() {
            echo "Liste des acteurs jouant le role \"" . $this->getName() . "\":<br>" . implode($this->_actorsList);
        }
        public function printAllActorsName() {
            $actorsNames = [];
            foreach($this->_actorsList as $actor) {
                $actorsNames[] = $actor->getFirstName() . " " . $actor->getLastName();
            }
            echo "Liste des acteurs jouant le role \"" . $this->getName() . "\":<br>" . implode(', ', $actorsNames);
        }


        public function __toString() {
            return "Role: " . $this->getName();
        }
    }


