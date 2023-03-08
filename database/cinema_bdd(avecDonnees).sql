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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.actor : ~0 rows (environ)
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` (`actor_id`, `person_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 6),
	(5, 7),
	(7, 11),
	(8, 12);
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `movie_id` (`movie_id`),
  KEY `actor_id` (`actor_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `FK_casting_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`),
  CONSTRAINT `FK_casting_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FK_casting_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.casting : ~0 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
INSERT INTO `casting` (`movie_id`, `actor_id`, `role_id`) VALUES
	(1, 1, 2),
	(1, 2, 3),
	(1, 7, 3),
	(3, 1, 4),
	(4, 8, 7),
	(4, 1, 5);
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. director
CREATE TABLE IF NOT EXISTS `director` (
  `director_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `FK_director_person` (`person_id`),
  CONSTRAINT `FK_director_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.director : ~0 rows (environ)
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` (`director_id`, `person_id`) VALUES
	(1, 4),
	(2, 5),
	(3, 9),
	(4, 10);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.movie : ~1 rows (environ)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`movie_id`, `movie_title`, `movie_frenchPublishDate`, `movie_length`, `movie_synopsis`, `movie_rating`, `movie_imgUrl`, `director_id`) VALUES
	(1, 'Titanic', '1997-12-05', 195, 'En septembre 1996, Brock Lovett est le coordinateur d\'une équipe qui fouille méticuleusement l\'épave du célèbre Titanic, paquebot géant réputé insubmersible qui connut pourtant un destin tragique. Lovett espère mettre la main sur le Cœur de l\'Océan, un collier de diamants unique à la valeur inestimable, porté par Louis XVI, dont la découverte lui apporterait la gloire (ce bijou, en réalité fictif, est inspiré du diamant bleu de la Couronne). Lors de sa sixième plongée en sous-marin, il remonte des profondeurs un coffre-fort dont il espère qu\'il contient le précieux objet. Mais il n\'y trouve que quelques vieux billets de banque et un dessin représentant une jeune femme nue portant le fameux bijou en pendentif.', 4, 'titanic.png', 2),
	(2, 'Full Metal Jacket', '1987-06-10', 116, 'Le film est centré sur le personnage de J.T. Davis, surnommé « Joker » (« Guignol » dans la version française), un jeune engagé volontaire incorporant le corps des Marines des États-Unis à la fin des années 1960, à l\'époque de la guerre du Viêt Nam.', 5, 'fullMetalJacket.png', 1),
	(3, 'La Plage', '2000-01-01', 115, 'Richard est un jeune Américain parti en Thaïlande pour vivre une expérience en marge des circuits touristiques. Il est vite déçu de ne trouver que des Occidentaux en mal de sensations dans le quartier des routards de Kaosan. Une nuit, à l\'hôtel, il rencontre Daffy, un homme fou qui lui parle d\'une île légendaire et paradisiaque où vivrait une communauté repliée sur elle-même, en communion avec la nature.', 3, 'laPlage.png', 4),
	(4, 'Shutter Island', '2010-02-01', 130, 'Shutter Island est un thriller psychologique américain réalisé par Martin Scorsese et sorti en 2010. C\'est l\'adaptation du roman du même nom de l\'écrivain Dennis Lehane publié en 2003.', 4, 'shutterIsland.png', 3);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. moviegenrelist
CREATE TABLE IF NOT EXISTS `moviegenrelist` (
  `movie_id` int(11) NOT NULL DEFAULT '0',
  `movieGenre_id` int(11) NOT NULL DEFAULT '0',
  KEY `FK_moviegenrelist_movie` (`movie_id`),
  KEY `FK_moviegenrelist_movie_genre` (`movieGenre_id`),
  CONSTRAINT `FK_moviegenrelist_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FK_moviegenrelist_movie_genre` FOREIGN KEY (`movieGenre_id`) REFERENCES `movie_genre` (`movieGenre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.moviegenrelist : ~0 rows (environ)
/*!40000 ALTER TABLE `moviegenrelist` DISABLE KEYS */;
INSERT INTO `moviegenrelist` (`movie_id`, `movieGenre_id`) VALUES
	(1, 2),
	(1, 1),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(3, 1),
	(3, 5),
	(4, 4),
	(4, 5);
/*!40000 ALTER TABLE `moviegenrelist` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. movie_genre
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `movieGenre_id` int(11) NOT NULL AUTO_INCREMENT,
  `movieGenre_label` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movieGenre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.movie_genre : ~0 rows (environ)
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` (`movieGenre_id`, `movieGenre_label`) VALUES
	(1, 'drame'),
	(2, 'romance'),
	(3, 'action'),
	(4, 'horreur'),
	(5, 'psychologique'),
	(6, 'guerre');
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. person
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_firstName` varchar(150) NOT NULL,
  `person_lastName` varchar(150) NOT NULL,
  `person_gender` varchar(10) DEFAULT NULL,
  `person_birthDate` date DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.person : ~3 rows (environ)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`person_id`, `person_firstName`, `person_lastName`, `person_gender`, `person_birthDate`) VALUES
	(1, 'Leonardo', 'Di Caprio', 'homme', '1980-05-25'),
	(2, 'Kate', 'Winslet', 'femme', '1975-08-05'),
	(3, 'Billy', 'Zane', 'homme', '1925-08-05'),
	(4, 'Stanley', 'Kubrik', 'homme', '1928-06-26'),
	(5, 'James', 'Cameron', 'homme', '1954-05-16'),
	(6, 'Matthew', 'Modine', 'homme', '1959-03-29'),
	(7, 'Adam', 'Baldwin', 'homme', '1962-02-27'),
	(9, 'Martin', 'Scorsese', 'homme', '1942-09-17'),
	(10, 'Danny', 'Boyle', 'homme', '1956-08-20'),
	(11, 'Gloria', 'Stuart', 'femme', '1910-04-05'),
	(12, 'Ben', 'Kingsley', 'homme', '1971-02-02');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Listage de la structure de la table basile_cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Listage des données de la table basile_cinema.role : ~0 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role_name`) VALUES
	(1, 'James Bond'),
	(2, 'Jack Dawson'),
	(3, 'Rose DeWitt Bukater'),
	(4, 'Richard'),
	(5, 'Teddy Daniels'),
	(7, 'Docteur Cawley');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
