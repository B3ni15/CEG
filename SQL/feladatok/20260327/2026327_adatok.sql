-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 27, 2026 at 10:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `20260327`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(4, 'Asztali számítógépek'),
(6, 'Billentyűzetek és egerek'),
(7, 'Fülhallgatók és fejhallgatók'),
(10, 'Játék konzolok és kiegészítők'),
(2, 'Laptopok'),
(5, 'Monitorok'),
(8, 'Okosórák és fitneszkarkötők'),
(1, 'Okostelefonok'),
(3, 'Táblagépek'),
(9, 'TV és házimozi rendszerek');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` mediumint(8) UNSIGNED DEFAULT NULL,
  `quantity` tinyint(3) UNSIGNED DEFAULT NULL,
  `category` tinyint(3) UNSIGNED DEFAULT NULL,
  `addDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `quantity`, `category`, `addDate`) VALUES
(1, 'Samsung Galaxy S9', 89990, 75, 1, '2018-03-12'),
(2, 'iPhone X', 99990, 60, 1, '2019-05-21'),
(3, 'Huawei P30', 75990, 82, 1, '2019-07-14'),
(4, 'Xiaomi Redmi Note 8', 59990, 95, 1, '2020-02-19'),
(5, 'OnePlus 7T', 84990, 67, 1, '2019-11-05'),
(6, 'Dell XPS 13', 99990, 53, 2, '2018-10-10'),
(7, 'MacBook Air 2019', 95000, 78, 2, '2019-09-23'),
(8, 'Lenovo ThinkPad T490', 89990, 64, 2, '2020-01-15'),
(9, 'Asus ZenBook 14', 79990, 70, 2, '2018-06-18'),
(10, 'HP Spectre x360', 98000, 58, 2, '2019-04-09'),
(11, 'iPad Pro 11', 95000, 72, 3, '2018-11-20'),
(12, 'Samsung Galaxy Tab S6', 89990, 66, 3, '2019-08-01'),
(13, 'Lenovo Tab P10', 65990, 90, 3, '2020-03-30'),
(14, 'Huawei MediaPad M5', 74990, 55, 3, '2017-12-14'),
(15, 'Amazon Fire HD 10', 49990, 97, 3, '2019-07-27'),
(16, 'Acer Predator Orion 5000', 99990, 54, 4, '2018-05-15'),
(17, 'HP Omen Desktop', 95000, 65, 4, '2019-09-07'),
(18, 'Lenovo Legion T530', 89990, 77, 4, '2020-01-29'),
(19, 'Dell Alienware Aurora', 100000, 59, 4, '2017-10-21'),
(20, 'Asus ROG Strix G15', 97000, 61, 4, '2019-12-05'),
(21, 'LG UltraFine 4K Monitor', 89990, 68, 5, '2018-02-11'),
(22, 'Dell Ultrasharp U2719D', 79990, 80, 5, '2019-06-03'),
(23, 'Samsung Odyssey G7', 99990, 52, 5, '2020-02-12'),
(24, 'BenQ EX3501R', 88990, 63, 5, '2018-08-16'),
(25, 'AOC 27G2U', 69990, 96, 5, '2019-10-24'),
(26, 'Logitech MX Master 3', 39990, 100, 6, '2020-04-01'),
(27, 'Razer DeathAdder Elite', 24990, 88, 6, '2019-09-14'),
(28, 'Corsair K70 Keyboard', 49990, 74, 6, '2018-07-07'),
(29, 'SteelSeries Rival 600', 29990, 91, 6, '2017-11-18'),
(30, 'Microsoft Sculpt Keyboard', 34990, 86, 6, '2019-05-27'),
(31, 'Sony WH-1000XM3', 89990, 79, 7, '2018-12-10'),
(32, 'Bose QuietComfort 35 II', 95000, 66, 7, '2019-03-02'),
(33, 'Apple AirPods Pro', 99990, 55, 7, '2020-01-20'),
(34, 'JBL Tune 750BTNC', 59990, 92, 7, '2019-09-28'),
(35, 'Sennheiser HD 450BT', 79990, 61, 7, '2018-06-19'),
(36, 'Apple Watch Series 5', 99990, 57, 8, '2019-11-30'),
(37, 'Samsung Galaxy Watch Active 2', 84990, 74, 8, '2020-03-14'),
(38, 'Fitbit Versa 2', 69990, 88, 8, '2019-10-10'),
(39, 'Garmin Forerunner 245', 79990, 65, 8, '2018-04-09'),
(40, 'Xiaomi Mi Band 4', 24990, 97, 8, '2019-07-06'),
(41, 'LG OLED55C9 TV', 99990, 58, 9, '2019-08-12'),
(42, 'Samsung QLED Q70R', 95000, 60, 9, '2018-09-17'),
(43, 'Sony Bravia X950G', 98000, 71, 9, '2019-02-05'),
(44, 'Panasonic GX800', 87990, 64, 9, '2017-12-29'),
(45, 'Philips Ambilight 58PUS', 79990, 87, 9, '2020-01-09'),
(46, 'PlayStation 4 Pro', 99990, 73, 10, '2018-11-13'),
(47, 'Xbox One X', 95000, 69, 10, '2019-05-15'),
(48, 'Nintendo Switch', 89990, 95, 10, '2020-03-22'),
(49, 'Sony DualShock 4 Controller', 24990, 100, 10, '2017-10-01'),
(50, 'Xbox Elite Wireless Controller', 49990, 82, 10, '2019-07-19'),
(51, 'Samsung Galaxy S10', 94990, 71, 1, '2019-04-22'),
(52, 'iPhone 11', 99990, 68, 1, '2020-02-14'),
(53, 'Huawei Mate 20 Pro', 89990, 84, 1, '2018-11-19'),
(54, 'Xiaomi Mi 9', 74990, 92, 1, '2019-06-27'),
(55, 'Nokia 8.1', 59990, 77, 1, '2018-01-11'),
(56, 'Asus ROG Zephyrus G14', 99990, 56, 2, '2020-03-04'),
(57, 'Dell Inspiron 15', 79990, 88, 2, '2019-08-30'),
(58, 'MacBook Pro 13', 100000, 61, 2, '2018-05-12'),
(59, 'HP Pavilion 14', 69990, 73, 2, '2017-10-09'),
(60, 'Lenovo IdeaPad 5', 65990, 97, 2, '2020-02-17'),
(61, 'iPad Mini 5', 69990, 90, 3, '2019-04-07'),
(62, 'Samsung Galaxy Tab A10', 54990, 81, 3, '2018-06-21'),
(63, 'Huawei MatePad Pro', 89990, 62, 3, '2020-01-29'),
(64, 'Microsoft Surface Go', 79990, 55, 3, '2018-09-15'),
(65, 'Lenovo Yoga Smart Tab', 65990, 86, 3, '2019-12-18'),
(66, 'MSI Trident 3', 87990, 64, 4, '2019-01-13'),
(67, 'Acer Nitro 50', 76990, 75, 4, '2018-07-05'),
(68, 'Asus TUF Gaming Desktop', 82990, 88, 4, '2020-02-11'),
(69, 'HP Envy Desktop', 69990, 92, 4, '2017-11-23'),
(70, 'Dell G5 Gaming Desktop', 94990, 57, 4, '2019-09-09'),
(71, 'Samsung Curved Monitor 27\"', 74990, 80, 5, '2018-03-20'),
(72, 'LG 29UM69 Ultrawide', 68990, 94, 5, '2019-06-01'),
(73, 'BenQ Zowie XL2546', 89990, 60, 5, '2020-01-15'),
(74, 'AOC CQ32G1', 84990, 69, 5, '2018-09-08'),
(75, 'Philips 243V7QDSB', 49990, 96, 5, '2017-12-02'),
(76, 'Razer BlackWidow Elite', 59990, 82, 6, '2019-02-14'),
(77, 'Logitech G Pro Mouse', 34990, 76, 6, '2020-04-12'),
(78, 'Corsair M65 Elite', 29990, 84, 6, '2018-07-25'),
(79, 'HyperX Alloy FPS Keyboard', 45990, 71, 6, '2019-08-05'),
(80, 'SteelSeries Apex Pro', 99990, 55, 6, '2020-03-28'),
(81, 'Sony WF-1000XM3', 89990, 58, 7, '2019-07-09'),
(82, 'JBL Live 650BTNC', 64990, 85, 7, '2018-10-02'),
(83, 'Beats Studio 3', 99990, 63, 7, '2019-12-15'),
(84, 'AKG N700NC', 79990, 92, 7, '2018-08-28'),
(85, 'Marshall Major III', 55990, 88, 7, '2020-02-09'),
(86, 'Garmin Venu', 89990, 77, 8, '2019-09-20'),
(87, 'Huawei Watch GT 2', 74990, 96, 8, '2020-01-03'),
(88, 'Fossil Gen 5 Carlyle', 89990, 72, 8, '2018-10-30'),
(89, 'Suunto 7', 95000, 61, 8, '2019-11-25'),
(90, 'Polar Vantage M', 69990, 83, 8, '2017-11-17'),
(91, 'LG NanoCell 55SM8500', 95000, 70, 9, '2019-07-21'),
(92, 'Sony Bravia X800G', 89990, 92, 9, '2018-06-09'),
(93, 'Samsung UHD 4K TV 50\"', 79990, 87, 9, '2017-12-29'),
(94, 'Panasonic TX-50GX700', 86990, 66, 9, '2020-01-10'),
(95, 'Philips 50PUS7304', 91990, 79, 9, '2019-03-14'),
(96, 'PlayStation 5', 100000, 58, 10, '2020-11-19'),
(97, 'Xbox Series X', 100000, 60, 10, '2020-11-22'),
(98, 'Nintendo Switch Lite', 69990, 94, 10, '2019-09-20'),
(99, 'PlayStation VR', 89990, 72, 10, '2018-10-05'),
(100, 'Xbox Wireless Controller', 25990, 99, 10, '2017-09-18');

-- --------------------------------------------------------

--
-- Table structure for table `transactionInfo`
--

CREATE TABLE `transactionInfo` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `paymentDate` date NOT NULL,
  `isSuccesful` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionInfo`
--

INSERT INTO `transactionInfo` (`id`, `paymentMethod`, `paymentDate`, `isSuccesful`) VALUES
(1, 'debit', '2025-01-15', 1),
(2, 'debit', '2025-01-16', 1),
(3, 'debit', '2025-01-19', 1),
(4, 'debit', '2025-01-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactionItems`
--

CREATE TABLE `transactionItems` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `transactionId` tinyint(3) UNSIGNED DEFAULT NULL,
  `itemId` tinyint(3) UNSIGNED DEFAULT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionItems`
--

INSERT INTO `transactionItems` (`id`, `transactionId`, `itemId`, `quantity`) VALUES
(1, 1, 96, 2),
(2, 2, 89, 1),
(3, 3, 1, 3),
(4, 4, 100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `userId` tinyint(3) UNSIGNED DEFAULT NULL,
  `fullPrice` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `userId`, `fullPrice`) VALUES
(1, 49, 200000),
(2, 3, 95000),
(3, 5, 269970),
(4, 9, 51980);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `addDate` date NOT NULL,
  `sex` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `dob`, `addDate`, `sex`) VALUES
(1, 'Kiss Péter', 'peter.kiss@example.com', '+36201234567', 'Budapest, Kossuth Lajos utca 12.', '1978-05-14', '2020-03-22', 'M'),
(2, 'Nagy Anna', 'anna.nagy@example.com', '+36301239876', 'Debrecen, Piac utca 45.', '1985-11-02', '2021-07-15', 'F'),
(3, 'Szabó Gábor', 'gabor.szabo@example.com', '+36701237654', 'Szeged, Tisza Lajos körút 88.', '1972-09-19', '2022-01-05', 'M'),
(4, 'Tóth Eszter', 'eszter.toth@example.com', '+36209876543', 'Miskolc, Szent István tér 3.', '1990-02-25', '2023-02-11', 'F'),
(5, 'Varga Zoltán', 'zoltan.varga@example.com', '+36203456789', 'Győr, Baross Gábor út 67.', '1976-12-08', '2021-09-18', 'M'),
(6, 'Kovács Katalin', 'katalin.kovacs@example.com', '+36705551234', 'Pécs, Jókai tér 22.', '1988-07-16', '2020-04-27', 'F'),
(7, 'Molnár László', 'laszlo.molnar@example.com', '+36304569871', 'Budapest, Andrássy út 102.', '1982-03-10', '2022-05-03', 'M'),
(8, 'Balogh Éva', 'eva.balogh@example.com', '+36205559876', 'Nyíregyháza, Kossuth tér 14.', '1979-10-22', '2021-08-09', 'F'),
(9, 'Farkas Dávid', 'david.farkas@example.com', '+36306543210', 'Székesfehérvár, Budai út 56.', '1995-01-30', '2020-11-17', 'M'),
(10, 'Horváth Zsófia', 'zsofia.horvath@example.com', '+36207778899', 'Kecskemét, Rákóczi út 7.', '1983-06-12', '2022-06-14', 'F'),
(11, 'Kiss László', 'laszlo.kiss@example.com', '+36201233456', 'Budapest, Váci út 15.', '1971-04-21', '2020-08-30', 'M'),
(12, 'Tóth Mária', 'maria.toth@example.com', '+36305556677', 'Szeged, Petőfi Sándor sugárút 9.', '1999-11-03', '2021-12-01', 'F'),
(13, 'Szabó István', 'istvan.szabo@example.com', '+36208889900', 'Debrecen, Csapó utca 72.', '1974-07-29', '2023-01-08', 'M'),
(14, 'Varga Erzsébet', 'erzsebet.varga@example.com', '+36307775544', 'Győr, Szent István út 41.', '1987-03-05', '2020-05-25', 'F'),
(15, 'Kovács Dávid', 'david.kovacs@example.com', '+36701231234', 'Miskolc, Petőfi tér 18.', '1992-09-16', '2022-07-11', 'M'),
(16, 'Balogh Andrea', 'andrea.balogh@example.com', '+36206667777', 'Szombathely, Fő tér 4.', '1981-02-08', '2021-10-02', 'F'),
(17, 'Molnár Tamás', 'tamas.molnar@example.com', '+36303334455', 'Eger, Dobó tér 6.', '1975-08-12', '2020-12-19', 'M'),
(18, 'Nagy Viktória', 'viktoria.nagy@example.com', '+36207773322', 'Veszprém, Óváros tér 9.', '1997-04-03', '2023-04-07', 'F'),
(19, 'Farkas József', 'jozsef.farkas@example.com', '+36304445566', 'Tatabánya, Béla király út 88.', '1980-10-28', '2022-09-15', 'M'),
(20, 'Horváth Anikó', 'aniko.horvath@example.com', '+36208889911', 'Zalaegerszeg, Kossuth Lajos utca 3.', '1973-01-18', '2021-02-22', 'F'),
(21, 'Lakatos Imre', 'imre.lakatos@example.com', '+36703337777', 'Sopron, Várkerület 22.', '1977-06-14', '2021-06-30', 'M'),
(22, 'Papp Júlia', 'julia.papp@example.com', '+36205553344', 'Szolnok, Kossuth tér 10.', '1989-08-05', '2020-03-09', 'F'),
(23, 'Takács Bence', 'bence.takacs@example.com', '+36302221133', 'Hódmezővásárhely, Andrássy út 55.', '1996-12-17', '2023-01-21', 'M'),
(24, 'Oláh Klára', 'klara.olah@example.com', '+36208889922', 'Békéscsaba, Andrássy út 3.', '1982-04-08', '2021-09-13', 'F'),
(25, 'Szűcs Norbert', 'norbert.szucs@example.com', '+36303335599', 'Salgótarján, Rákóczi út 78.', '1970-11-27', '2022-11-01', 'M'),
(26, 'Juhász Ildikó', 'ildiko.juhasz@example.com', '+36204442211', 'Dunaújváros, Vasmű út 32.', '1986-07-23', '2020-06-07', 'F'),
(27, 'Kiss András', 'andras.kiss@example.com', '+36302224455', 'Budapest, Bartók Béla út 17.', '1993-01-19', '2021-05-14', 'M'),
(28, 'Németh Krisztina', 'krisztina.nemeth@example.com', '+36706661122', 'Győr, Kazinczy utca 11.', '1979-09-15', '2023-02-03', 'F'),
(29, 'Fekete Zoltán', 'zoltan.fekete@example.com', '+36203338888', 'Pécs, Rákóczi út 88.', '1981-12-02', '2020-09-19', 'M'),
(30, 'Kovács Edit', 'edit.kovacs@example.com', '+36305557788', 'Debrecen, Nagyerdei körút 20.', '1994-06-29', '2022-04-15', 'F'),
(31, 'Orbán Gergely', 'gergely.orban@example.com', '+36207774455', 'Budapest, Üllői út 33.', '1987-03-04', '2023-06-21', 'M'),
(32, 'Vass Andrea', 'andrea.vass@example.com', '+36304443322', 'Miskolc, Kazinczy utca 8.', '1975-10-12', '2020-07-11', 'F'),
(33, 'Gulyás Tamás', 'tamas.gulyas@example.com', '+36703334411', 'Székesfehérvár, Fő utca 12.', '1983-02-21', '2022-12-07', 'M'),
(34, 'Kelemen Ágnes', 'agnes.kelemen@example.com', '+36201119999', 'Szeged, Kálvária sugárút 77.', '1991-08-10', '2021-03-29', 'F'),
(35, 'Kocsis Lajos', 'lajos.kocsis@example.com', '+36302227777', 'Nyíregyháza, Vasvári Pál utca 14.', '1972-05-09', '2020-02-20', 'M'),
(36, 'Sipos Zsuzsanna', 'zsuzsanna.sipos@example.com', '+36203336666', 'Eger, Kossuth Lajos utca 5.', '1989-11-25', '2021-07-08', 'F'),
(37, 'Török Balázs', 'balazs.torok@example.com', '+36705554433', 'Tatabánya, Fő tér 19.', '1974-07-13', '2022-10-18', 'M'),
(38, 'Oláh Gabriella', 'gabriella.olah@example.com', '+36306665544', 'Szombathely, Thököly utca 6.', '1984-01-07', '2020-12-27', 'F'),
(39, 'Bognár Péter', 'peter.bognar@example.com', '+36209998877', 'Pécs, Király utca 42.', '1990-09-01', '2023-05-12', 'M'),
(40, 'Fodor Katalin', 'katalin.fodor@example.com', '+36302225566', 'Budapest, Rákóczi út 101.', '1978-06-19', '2021-01-16', 'F'),
(41, 'Lukács Attila', 'attila.lukacs@example.com', '+36201114455', 'Kecskemét, Szabadság tér 7.', '1985-12-11', '2022-08-24', 'M'),
(42, 'Simon Mónika', 'monika.simon@example.com', '+36707778866', 'Zalaegerszeg, Kossuth tér 2.', '1971-02-03', '2020-04-02', 'F'),
(43, 'Nagy Csaba', 'csaba.nagy@example.com', '+36303337744', 'Sopron, Deák tér 8.', '1976-05-06', '2023-03-03', 'M'),
(44, 'Bíró Judit', 'judit.biro@example.com', '+36204449988', 'Debrecen, Arany János utca 55.', '1992-07-27', '2021-11-09', 'F'),
(45, 'Kiss Ferenc', 'ferenc.kiss@example.com', '+36302221177', 'Budapest, Szent István körút 66.', '1980-03-22', '2020-05-28', 'M'),
(46, 'Horváth Erika', 'erika.horvath@example.com', '+36205556611', 'Győr, Baross út 5.', '1996-09-30', '2022-07-14', 'F'),
(47, 'Szűcs Attila', 'attila.szucs@example.com', '+36701112233', 'Miskolc, Dózsa György út 23.', '1973-11-16', '2021-09-25', 'M'),
(48, 'Németh Ágnes', 'agnes.nemeth@example.com', '+36203339977', 'Szeged, Felső Tisza-part 19.', '1988-04-12', '2023-02-15', 'F'),
(49, 'Molnár Gábor', 'gabor.molnar@example.com', '+36305559922', 'Pécs, Ferencesek utcája 3.', '1977-12-05', '2020-10-03', 'M'),
(50, 'Farkas Edit', 'edit.farkas@example.com', '+36207776655', 'Nyíregyháza, Szarvas utca 9.', '1982-08-20', '2021-06-19', 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `transactionInfo`
--
ALTER TABLE `transactionInfo`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `transactionItems`
--
ALTER TABLE `transactionItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactionId` (`transactionId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `transactionInfo`
--
ALTER TABLE `transactionInfo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactionItems`
--
ALTER TABLE `transactionItems`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactionInfo`
--
ALTER TABLE `transactionInfo`
  ADD CONSTRAINT `fk_transactionInfo_transaction` FOREIGN KEY (`id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `transactionItems`
--
ALTER TABLE `transactionItems`
  ADD CONSTRAINT `transactionItems_ibfk_1` FOREIGN KEY (`transactionId`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transactionItems_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;