-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2022 at 03:54 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parcijalni_ispit_tretji`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prosjek_Plaća_Zaposlenika` ()  BEGIN
SELECT
AVG(placa) `Prosjek plaća svih zaposlenih`
FROM place;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `odjel`
--

CREATE TABLE `odjel` (
  `odjeliID` int UNSIGNED NOT NULL,
  `imeOdjela` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjel`
--

INSERT INTO `odjel` (`odjeliID`, `imeOdjela`) VALUES
(1, 'Računovodstvo'),
(2, 'Marketing'),
(3, 'Ljudski Resusursi');

-- --------------------------------------------------------

--
-- Table structure for table `odjelOdZaposlenika`
--

CREATE TABLE `odjelOdZaposlenika` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `pocetniDatum` date NOT NULL,
  `zavrsniDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjelOdZaposlenika`
--

INSERT INTO `odjelOdZaposlenika` (`zaposlenikID`, `odjeliID`, `pocetniDatum`, `zavrsniDatum`) VALUES
(1, 3, '2018-01-25', '2022-05-23'),
(2, 2, '2019-01-21', '2021-08-13'),
(3, 1, '2020-05-18', '2023-07-05');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `placa` int UNSIGNED NOT NULL,
  `pocetniDatum` date NOT NULL,
  `zavrsniDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`zaposlenikID`, `placa`, `pocetniDatum`, `zavrsniDatum`) VALUES
(1, 5500, '2020-01-01', '2021-01-05'),
(1, 9000, '2020-05-03', '2022-01-07'),
(1, 7500, '2020-08-01', '2020-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `radnoMjesto`
--

CREATE TABLE `radnoMjesto` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `mjestoRada` varchar(255) DEFAULT NULL,
  `pocetniDatum` date NOT NULL,
  `zavrsniDatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `radnoMjesto`
--

INSERT INTO `radnoMjesto` (`zaposlenikID`, `mjestoRada`, `pocetniDatum`, `zavrsniDatum`) VALUES
(1, 'Tajnik', '2018-05-03', '2020-01-11'),
(2, 'Čistačica', '2015-09-22', '2019-02-03'),
(3, 'Programer', '2019-01-03', '2022-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `voditeljOdjela`
--

CREATE TABLE `voditeljOdjela` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `pocetniDatum` date NOT NULL,
  `zavrsniDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voditeljOdjela`
--

INSERT INTO `voditeljOdjela` (`zaposlenikID`, `odjeliID`, `pocetniDatum`, `zavrsniDatum`) VALUES
(1, 2, '2001-01-02', '2022-09-15'),
(2, 1, '2004-05-12', '2019-07-08'),
(3, 3, '2003-07-08', '2017-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `datumRodjenja` date NOT NULL,
  `ime` varchar(255) DEFAULT NULL,
  `prezime` varchar(255) DEFAULT NULL,
  `spol` varchar(255) DEFAULT NULL,
  `datumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`zaposlenikID`, `datumRodjenja`, `ime`, `prezime`, `spol`, `datumZaposlenja`) VALUES
(1, '1999-01-01', 'Pero', 'Perić', 'Muški', '2019-09-01'),
(2, '1994-07-01', 'Mirko', 'Mirkić', 'Muški', '2020-03-17'),
(3, '1991-01-19', 'Lana', 'Lanić', 'Ženski', '2020-05-14'),
(4, '1998-05-15', 'Anita', 'Pelić', 'Ženski', '2021-03-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odjel`
--
ALTER TABLE `odjel`
  ADD PRIMARY KEY (`odjeliID`);

--
-- Indexes for table `odjelOdZaposlenika`
--
ALTER TABLE `odjelOdZaposlenika`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`zaposlenikID`,`pocetniDatum`);

--
-- Indexes for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD PRIMARY KEY (`zaposlenikID`,`pocetniDatum`,`zavrsniDatum`);

--
-- Indexes for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD PRIMARY KEY (`zaposlenikID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`zaposlenikID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `odjelOdZaposlenika`
--
ALTER TABLE `odjelOdZaposlenika`
  ADD CONSTRAINT `odjelOdZaposlenika_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `odjelOdZaposlenika_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjel` (`odjeliID`) ON DELETE CASCADE;

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD CONSTRAINT `radnoMjesto_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD CONSTRAINT `voditeljOdjela_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voditeljOdjela_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjel` (`odjeliID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
