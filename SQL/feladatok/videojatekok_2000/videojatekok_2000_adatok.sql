-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: node.devbeni.lol
-- Generation Time: Mar 27, 2026 at 12:43 PM
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
-- Database: `videojatekok_2000`
--

-- --------------------------------------------------------

--
-- Table structure for table `fejlesztok`
--

CREATE TABLE `fejlesztok` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nev` varchar(100) NOT NULL,
  `orszag` varchar(50) DEFAULT NULL,
  `alapitas_eve` year(4) DEFAULT NULL,
  `aktiv` tinyint(1) DEFAULT 1,
  `weboldal` varchar(255) DEFAULT NULL,
  `megjegyzes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fejlesztok`
--

INSERT INTO `fejlesztok` (`id`, `nev`, `orszag`, `alapitas_eve`, `aktiv`, `weboldal`, `megjegyzes`) VALUES
(1, 'Rockstar North', 'Egyesült Királyság', '1988', 1, 'https://www.rockstargames.com', 'A GTA sorozat egyik fő fejlesztője.'),
(2, 'Valve', 'USA', '1996', 1, 'https://www.valvesoftware.com', 'A Steam platform és számos innovatív játék készítője.'),
(3, 'Blizzard Entertainment', 'USA', '1991', 1, 'https://www.blizzard.com', 'Híres online és stratégiai játékairól, például WoW és StarCraft.'),
(4, 'Bethesda Game Studios', 'USA', '2001', 1, 'https://bethesda.net', 'Nyílt világú RPG játékok fejlesztésére specializálódott.'),
(5, 'Infinity Ward', 'USA', '2002', 1, 'https://www.infinityward.com', 'A Call of Duty sorozat egyik alapító fejlesztője.'),
(6, 'Ubisoft Montreal', 'Kanada', '1997', 1, 'https://www.ubisoft.com', 'Az egyik legnagyobb Ubisoft stúdió, sok sikeres játékkal.');

-- --------------------------------------------------------

--
-- Table structure for table `jatekok`
--

CREATE TABLE `jatekok` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `cim` varchar(100) NOT NULL,
  `megjelenes_datuma` date DEFAULT NULL,
  `mufaj` varchar(50) DEFAULT NULL,
  `ar_usd` decimal(10,2) DEFAULT NULL,
  `ertekeles` decimal(3,1) DEFAULT NULL,
  `tobbjatekos` tinyint(1) DEFAULT 0,
  `leiras` text DEFAULT NULL,
  `fejleszto_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jatekok`
--

INSERT INTO `jatekok` (`id`, `cim`, `megjelenes_datuma`, `mufaj`, `ar_usd`, `ertekeles`, `tobbjatekos`, `leiras`, `fejleszto_id`) VALUES
(1, 'Grand Theft Auto: San Andreas', '2004-10-26', 'Akció-kaland', 49.99, 9.5, 1, 'Nyílt világú bűnözős játék Kalifornia ihlette városokkal.', 1),
(2, 'Half-Life 2', '2004-11-16', 'FPS', 39.99, 9.6, 0, 'Forradalmi lövöldözős játék fejlett fizikával.', 2),
(3, 'World of Warcraft', '2004-11-23', 'MMORPG', 49.99, 9.3, 1, 'Hatalmas online szerepjáték világ több millió játékossal.', 3),
(4, 'The Elder Scrolls IV: Oblivion', '2006-03-20', 'RPG', 59.99, 9.2, 0, 'Fantasy nyílt világú szerepjáték rengeteg küldetéssel.', 4),
(5, 'Call of Duty 4: Modern Warfare', '2007-11-05', 'FPS', 59.99, 9.4, 1, 'Modern hadviselésen alapuló akciójáték.', 5),
(6, 'Assassin’s Creed', '2007-11-13', 'Akció-kaland', 49.99, 8.5, 0, 'Történelmi lopakodós játék egy orgyilkos szemszögéből.', 6),
(7, 'Portal', '2007-10-10', 'Puzzle', 19.99, 9.0, 0, 'Egyedi logikai játék portál mechanikával.', 2),
(8, 'StarCraft II', '2010-07-27', 'RTS', 59.99, 9.5, 1, 'Valós idejű stratégiai játék kompetitív játékmenettel.', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fejlesztok`
--
ALTER TABLE `fejlesztok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`),
  ADD UNIQUE KEY `weboldal` (`weboldal`);

--
-- Indexes for table `jatekok`
--
ALTER TABLE `jatekok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cim` (`cim`),
  ADD KEY `fejleszto_id` (`fejleszto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fejlesztok`
--
ALTER TABLE `fejlesztok`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jatekok`
--
ALTER TABLE `jatekok`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jatekok`
--
ALTER TABLE `jatekok`
  ADD CONSTRAINT `jatekok_ibfk_1` FOREIGN KEY (`fejleszto_id`) REFERENCES `fejlesztok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
