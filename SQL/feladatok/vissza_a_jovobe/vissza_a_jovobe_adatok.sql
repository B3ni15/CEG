-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: node.devbeni.lol
-- Generation Time: Mar 27, 2026 at 11:55 AM
-- Server version: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vissza_a_jovobe`
--

-- --------------------------------------------------------

--
-- Table structure for table `filmek`
--

CREATE TABLE `filmek` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `cim` varchar(100) NOT NULL,
  `megjelenes_datuma` date DEFAULT NULL,
  `rendezo` varchar(100) NOT NULL,
  `jatekido_perc` tinyint(3) UNSIGNED DEFAULT NULL,
  `koltsegvetes_millio` decimal(10,2) UNSIGNED DEFAULT NULL,
  `ertekeles` decimal(3,1) UNSIGNED DEFAULT NULL,
  `idosutazas_van` tinyint(1) DEFAULT 1,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filmek`
--

INSERT INTO `filmek` (`id`, `cim`, `megjelenes_datuma`, `rendezo`, `jatekido_perc`, `koltsegvetes_millio`, `ertekeles`, `idosutazas_van`, `leiras`) VALUES
(1, 'Vissza a jövőbe', '1985-07-03', 'Robert Zemeckis', 116, 19.00, 8.5, 1, 'Egy tinédzser visszautazik az időben, és véletlenül megzavarja szülei találkozását.'),
(2, 'Vissza a jövőbe II.', '1989-11-22', 'Robert Zemeckis', 108, 40.00, 7.8, 1, 'Marty a jövőbe utazik, hogy megmentse családját egy alternatív idővonalon.'),
(3, 'Vissza a jövőbe III.', '1990-05-25', 'Robert Zemeckis', 118, 40.00, 7.4, 1, 'Marty a vadnyugaton reked, és Doc Brown segítségével próbál visszatérni a saját idejébe.'),
(4, 'Tesztfilm', '2000-01-01', 'Teszt Rendező', 90, 10.00, 5.0, 0, 'Ez egy tesztfilm adat a gyakorláshoz.');

-- --------------------------------------------------------

--
-- Table structure for table `szereplok`
--

CREATE TABLE `szereplok` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nev` varchar(100) NOT NULL,
  `szinesz` varchar(100) NOT NULL,
  `elso_megjelenes` date DEFAULT NULL,
  `fontos_szereplo` tinyint(1) DEFAULT 0,
  `megjegyzes` text DEFAULT NULL,
  `film_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `szereplok`
--

INSERT INTO `szereplok` (`id`, `nev`, `szinesz`, `elso_megjelenes`, `fontos_szereplo`, `megjegyzes`, `film_id`) VALUES
(1, 'Marty McFly', 'Michael J. Fox', '1985-07-03', 1, NULL, 1),
(2, 'Doc Brown', 'Christopher Lloyd', '1985-07-03', 1, 'A DeLorean feltalálója', 1),
(3, 'Biff Tannen', 'Thomas F. Wilson', '1985-07-03', 1, NULL, 1),
(4, 'Lorraine Baines', 'Lea Thompson', '1985-07-03', 0, NULL, 1),
(5, 'George McFly', 'Crispin Glover', '1985-07-03', 0, NULL, 1),
(6, 'Jennifer Parker', 'Claudia Wells', '1985-07-03', 0, NULL, 1),
(7, 'Clara Clayton', 'Mary Steenburgen', '1990-05-25', 1, NULL, 3),
(8, 'Buford \"Mad Dog\" Tannen', 'Thomas F. Wilson', '1990-05-25', 1, 'Western alter ego', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filmek`
--
ALTER TABLE `filmek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cim` (`cim`);

--
-- Indexes for table `szereplok`
--
ALTER TABLE `szereplok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filmek`
--
ALTER TABLE `filmek`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `szereplok`
--
ALTER TABLE `szereplok`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `szereplok`
--
ALTER TABLE `szereplok`
  ADD CONSTRAINT `szereplok_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `filmek` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
