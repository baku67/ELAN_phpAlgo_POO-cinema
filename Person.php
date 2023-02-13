<?php

    class Person {

        // propriétés
        protected string $_firstName;
        protected string $_lastName;
        protected string $_gender;
        protected DateTime $_birthDate;

        // Constructeur
        public function __construct(string $firstName, string $lastName, string $gender, string $birthDate) {
            $this->_firstName = $firstName;
            $this->_lastName = $lastName;
            $this->_gender = $gender;
            $this->_birthDate = new DateTime ($birthDate);
        }

        // Accesseurs 
        public function getFirstName(): string {
            return $this->_firstName;
        }
        public function getLastName(): string {
            return $this->_lastName;
        }
        public function getGender(): string {
            return $this->_gender;
        }
        public function getbirthDate(): DateTime {
            return $this->_birthDate;
        }

        // Mutateurs
        public function setFirstNAme(string $firstName) {
            $this->_firstName = $firstName;
        }
        public function setLastName(string $lastName) {
            $this->_lastName = $lastName;
        }
        public function setGender(string $gender) {
            $this->_gender = $gender;
        }
        public function setBirthDate(DateTime $birthDate) {
            $this->_birthDate = $birthDate;
        }

        // Méthodes
        public function __toString() {
            return "Personne: " . $this->getFirstName() . " " . $this->getLastName() . ": " . $this->getGender() . " né le " . $this->getbirthDate()->format("Y/m/d") . "<br>";
        }

    }

    // 
    // class Actor extends Person {

    //     // Propriétés
    //     protected string $_role;

    //     // Constructeur
    //     public function __construct(string $firstName, string $lastName, string $gender, DateTime $birthDate, string $role) {
    //         parent::__construct($firstName, $lastName, $gender, $birthDate);
    //         $this->_role = $role;
    //     }

    //     // Accesseurs/Mutateurs
    //     public function getRole(): string {
    //         return $this->_role;
    //     }
    //     public function setRole(string $role) {
    //         $this->_role = $role;
    //     }

    //     // Méthodes

    // }