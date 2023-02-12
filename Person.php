<?php

    class Person {

        // propriétés
        protected string $_firstName;
        protected string $_lastName;
        protected string $_gender;
        protected DateTime $_birthDate;

        // Constructeur
        public function __construct(string $firstName, string $lastName, string $gender, DateTime $birthDate) {
            $this->_firstName = $firstName;
            $this->_lastName = $lastName;
            $this->_gender = $gender;
            $this->_birthDate = $birthDate;
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


    }

    // 
    class Homme {

    }

    class Femme {

    }