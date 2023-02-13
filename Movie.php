<?php 

    class Movie {

            // Propriétés
            private string $_title;
            private DateTime $_frenchPublishDate;
            private float $_length;
            private Director $_director;
            private string $_synopsys;
            private Movietype $_movieType;

            // Constructeur
            public function __construct(string $title, string $frenchPublishDate, float $length, Director $director, string $synopsys, Movietype $movieType) {
                $this->_title = $title;
                $this->_frenchPublishDate = new DateTime($frenchPublishDate);
                $this->_length = $length;
                $this->_director = $director;
                $this->_synopsys = $synopsys;

                $this->_movieType = $movieType;
                $this->_movieType->addMovieToTypeList($this);
            }

            // Accesseurs/Mutateurs
            public function setTitle(string $title) {
                $this->_title = $title;
            }
            public function setFrenchPublishDate(DateTime $frenchPublishDate) {
                $this->_frenchPublishDate = $frenchPublishDate;
            }
            public function setLength(float $length) {
                $this->_length = $length;
            }
            public function setDirector(string $director) {
                $this->_director = $director;
            }
            public function setSynopsys(string $synopsys) {
                $this->_synopsys = $synopsys;
            }
            public function setMovieType(Movietype $movieType) {
                $this->_movieType = $movieType;
            }

            public function getTitle():string {
                return $this->_title;
            }
            public function getFrenchPublishDate():DateTime {
                return $this->_frenchPublishDate;
            }
            public function getLength():float {
                return $this->_length;
            }
            public function getDirector():Director {
                return $this->_director;
            }
            public function getSynopsys():string {
                // Maximum de 25 chars affichés
                return mb_strimwidth($this->_synopsys, 0, 25, "...");
            }
            public function getMovieType():Movietype {
                return $this->_movieType;
            }


            // Méthodes:
            public function __toString() {
                return "Film: " . $this->getTitle() . "(sorti le " . $this->getFrenchPublishDate()->format('Y-m-d') . "): Durée: " . $this->getLength() . ", Type: " . $this->getMovieType() . ", Réalisateur: " . $this->getDirector() . "Résumé: " . $this->getSynopsys() . "<br>";
            }


    }

