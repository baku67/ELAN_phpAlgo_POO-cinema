-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour basile_cinema
CREATE DATABASE IF NOT EXISTS `basile_cinema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `basile_cinema`;

-- Listage de la structure de la table basile_cinema. actor
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `FK_actor_person` (`person_id`),
  CONSTRAINT `FK_actor_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.actor : ~0 rows (environ)
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `casting_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`casting_id`),
  KEY `movie_id` (`movie_id`),
  KEY `actor_id` (`actor_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `FK_casting_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`),
  CONSTRAINT `FK_casting_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FK_casting_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.casting : ~0 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. director
CREATE TABLE IF NOT EXISTS `director` (
  `director_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `FK_director_person` (`person_id`),
  CONSTRAINT `FK_director_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.director : ~0 rows (environ)
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. movie
CREATE TABLE IF NOT EXISTS `movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_title` varchar(255) NOT NULL,
  `movie_frenchPublishDate` date DEFAULT NULL,
  `movie_length` int(11) NOT NULL DEFAULT '0',
  `movie_synopsis` text,
  `movie_rating` tinyint(4) DEFAULT NULL,
  `movie_imgUrl` varchar(255) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `movie_director` (`director_id`),
  CONSTRAINT `movie` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.movie : ~0 rows (environ)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. moviegenrelist
CREATE TABLE IF NOT EXISTS `moviegenrelist` (
  `movieGenreList_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT '0',
  `movieGenre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movieGenreList_id`),
  KEY `FK_moviegenrelist_movie` (`movie_id`),
  KEY `FK_moviegenrelist_movie_genre` (`movieGenre_id`),
  CONSTRAINT `FK_moviegenrelist_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FK_moviegenrelist_movie_genre` FOREIGN KEY (`movieGenre_id`) REFERENCES `movie_genre` (`movieGenre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.moviegenrelist : ~0 rows (environ)
/*!40000 ALTER TABLE `moviegenrelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `moviegenrelist` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. movie_genre
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `movieGenre_id` int(11) NOT NULL AUTO_INCREMENT,
  `movieGenre_label` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movieGenre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.movie_genre : ~0 rows (environ)
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. person
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_firstName` varchar(150) NOT NULL,
  `person_lastName` varchar(150) NOT NULL,
  `person_gender` varchar(10) DEFAULT NULL,
  `person_birthDate` date DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.person : ~0 rows (environ)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.role : ~0 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
