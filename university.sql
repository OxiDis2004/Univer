-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Apr 2024 um 22:16
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `university`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `academic_degree`
--

CREATE TABLE `academic_degree` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `academic_title`
--

CREATE TABLE `academic_title` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `department`
--

CREATE TABLE `department` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `position`
--

CREATE TABLE `position` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `id` int(5) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `year_of_birthday` date NOT NULL,
  `year_of_empoyment` date NOT NULL,
  `department_id` int(5) NOT NULL,
  `position_id` int(5) NOT NULL,
  `academic_degree_id` int(5) NOT NULL,
  `academic_title_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `academic_degree`
--
ALTER TABLE `academic_degree`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `academic_title`
--
ALTER TABLE `academic_title`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Department` (`department_id`),
  ADD KEY `FK_Position` (`position_id`),
  ADD KEY `FK_Academic_degree` (`academic_degree_id`),
  ADD KEY `FK_Academic_title` (`academic_title_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `FK_Academic_degree` FOREIGN KEY (`academic_degree_id`) REFERENCES `academic_degree` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Academic_title` FOREIGN KEY (`academic_title_id`) REFERENCES `academic_title` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Position` FOREIGN KEY (`position_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
