<?php
    require "Person.php";

    class Director extends Person {

        public function __construct(string $firstName, string $lastName, string $gender, string $birthDate) {
            parent::__construct($firstName, $lastName, $gender, $birthDate);
        }

        // Méthodes
        public function __toString() {
            return "Réalisateur: " . $this->getFirstName() . " " . $this->getLastName() . ": " . $this->getGender() . " né le " . $this->getbirthDate()->format("Y/m/d") . "<br>";
        }
        
    }
