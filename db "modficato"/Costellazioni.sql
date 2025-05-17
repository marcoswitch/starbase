-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Mag 17, 2025 alle 11:50
-- Versione del server: 8.0.35
-- Versione PHP: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CostellazioniDB`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Costellazioni`
--

CREATE TABLE `Costellazioni` (
  `ID` int NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Descrizione` text NOT NULL,
  `Latitudine_Minima` float NOT NULL,
  `Latitudine_Massima` float NOT NULL,
  `Longitudine_Minima` float NOT NULL,
  `Longitudine_Massima` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Costellazioni`
--

INSERT INTO `Costellazioni` (`ID`, `Nome`, `Descrizione`, `Latitudine_Minima`, `Latitudine_Massima`, `Longitudine_Minima`, `Longitudine_Massima`) VALUES
(1, 'Aquila', 'Rappresenta un\'aquila', 2.5, 17.3, 287, 308),
(2, 'Ariete', 'Rappresenta un ariete', 10.5, 25.2, 25, 41),
(3, 'Auriga', 'Rappresenta un auriga o cocchiere', 27.9, 56.1, 74, 102),
(4, 'Balena', 'Rappresenta una balena', 0.3, 24.7, 8, 41),
(5, 'Bootes', 'Rappresenta un bovaro o pastore', 19.1, 48.8, 204, 247),
(6, 'Cancro', 'Rappresenta un granchio', 6.5, 33.8, 124, 135),
(7, 'Capricorno', 'Rappresenta una creatura mitologica metà capra metà pesce', -28.6, -5.3, 290, 320),
(8, 'Carena', 'Rappresenta la chiglia di una nave', -62.9, -50.7, 96, 116),
(9, 'Cassiopea', 'Rappresenta una regina mitologica', 42.6, 70.5, 2, 63),
(10, 'Castori e Polluce', 'Rappresenta i gemelli mitologici Castore e Polluce', 10.3, 35.3, 98, 118),
(11, 'Cefeo', 'Rappresenta un re mitologico', 41.6, 77.3, 1, 69),
(12, 'Camelopardalis', 'Rappresenta una giraffa', 52.6, 86.1, 58, 194),
(13, 'Cigno', 'Rappresenta un cigno', 28.6, 61.1, 287, 337),
(14, 'Chioma di Berenice', 'Rappresenta i capelli di Berenice', 22.4, 38.1, 180, 210),
(15, 'Colomba', 'Rappresenta una colomba', -43.3, -27.9, 84, 95),
(16, 'Corona Australe', 'Rappresenta una corona', -51.1, -36.1, 275, 291),
(17, 'Corona Boreale', 'Rappresenta una corona', 27.2, 40.9, 230, 246),
(18, 'Corvo', 'Rappresenta un corvo', -25.1, -11.7, 180, 200),
(19, 'Cratere', 'Rappresenta una coppa o calice', -24.3, -9.2, 163, 187),
(20, 'Crocifisso', 'Rappresenta una croce', -62, -55.9, 180, 191),
(21, 'Coda del Serpente', 'Rappresenta la parte finale di un serpente', -16.4, 5.4, 240, 260),
(22, 'Coda dell\'Idra', 'Rappresenta la parte finale di un serpente marino', -35.3, -13.6, 190, 230),
(23, 'Collo dell\'Idra', 'Rappresenta la parte iniziale di un serpente marino', -10.6, 2.5, 110, 140),
(24, 'Delfino', 'Rappresenta un delfino', 5.4, 20.2, 307, 318),
(25, 'Dragone', 'Rappresenta un drago', 30.3, 86.4, 1, 275),
(26, 'Equuleus', 'Rappresenta un piccolo cavallo', 3.8, 11.3, 309, 320),
(27, 'Ercole', 'Rappresenta l\'eroe mitologico Ercole', 4.6, 46.8, 220, 275),
(28, 'Fornace', 'Rappresenta una fornace', -40.1, -24.8, 45, 60),
(29, 'Freccia', 'Rappresenta una freccia', 15.6, 21.2, 279, 289),
(30, 'Giraffa', 'Rappresenta una giraffa', 20.6, 86.1, 1, 194),
(31, 'Gru', 'Rappresenta una gru', -56.6, -35.1, 330, 360),
(32, 'Idra Maschio', 'Rappresenta un serpente d\'acqua', -20.1, 8.1, 80, 120),
(33, 'Indiano', 'Rappresenta un nativo americano', -75.4, -43.8, 305, 350),
(34, 'Lepre', 'Rappresenta una lepre', -32.2, -10.9, 72, 87),
(35, 'Leone', 'Rappresenta un leone', 5.6, 33.6, 140, 180),
(36, 'Leone Minore', 'Rappresenta un piccolo leone', 22.8, 41.1, 140, 170),
(37, 'Lira', 'Rappresenta una lira', 25.2, 41.3, 276, 297),
(38, 'Lucertola', 'Rappresenta una lucertola', 35.6, 49.3, 320, 352),
(39, 'Lupo', 'Rappresenta un lupo', -51.6, -29.5, 220, 250),
(40, 'Macchina Pneumatica', 'Rappresenta uno strumento scientifico', -27.8, -16.4, 140, 170),
(41, 'Microscopio', 'Rappresenta uno strumento scientifico', -47.3, -26.2, 297, 320),
(42, 'Orsa Maggiore', 'Rappresenta un\'orsa', 40.1, 73.1, 1, 10),
(43, 'Orsa Minore', 'Rappresenta un\'orsa', 40, 89, 0, 100),
(44, 'Orione', 'Rappresenta un cacciatore mitologico', -10.6, 10.2, 78, 95),
(45, 'Orologio', 'Rappresenta un orologio', -68.1, -50.2, 35, 60),
(46, 'Pavone', 'Rappresenta un pavone', -75.3, -56.5, 290, 330),
(47, 'Pegaso', 'Rappresenta un cavallo alato', 2.1, 36.2, 320, 360),
(48, 'Perseo', 'Rappresenta un eroe mitologico', 30.5, 59.1, 30, 65),
(49, 'Pesce Australe', 'Rappresenta un pesce', -36.6, -17.4, 340, 360),
(50, 'Pesci', 'Rappresenta due pesci legati insieme', 0.1, 33.4, 330, 360),
(51, 'Poppa', 'Rappresenta la parte posteriore di una nave', -56.5, -30.3, 110, 140),
(52, 'Reticolo', 'Rappresenta un reticolo di coordinate', -67.2, -53.6, 50, 70),
(53, 'Sagittario', 'Rappresenta un arciere mitologico', -45.2, -11.1, 265, 295),
(54, 'Scorpione', 'Rappresenta uno scorpione', -45.6, -8.5, 230, 265),
(55, 'Scudo', 'Rappresenta uno scudo', -16.2, -4.5, 275, 290),
(56, 'Sestante', 'Rappresenta uno strumento scientifico', -43.3, -23.3, 145, 165),
(57, 'Serpente', 'Rappresenta un serpente', -10.4, 24.2, 220, 250),
(58, 'Telescopio', 'Rappresenta uno strumento ottico', -58.2, -43.2, 300, 330),
(59, 'Tavola', 'Rappresenta un piano di lavoro', -78.6, -59.7, 0, 30),
(60, 'Tigre', 'Rappresenta una tigre', -30.1, -18.5, 240, 270),
(61, 'Toro', 'Rappresenta un toro', 5, 31.5, 50, 90),
(62, 'Triangolo', 'Rappresenta un triangolo', 20.8, 36.7, 25, 40),
(63, 'Triangolo Australe', 'Rappresenta un triangolo', -71.1, -59.2, 240, 270),
(64, 'Tucano', 'Rappresenta un tucano', -75.1, -56, 310, 345),
(65, 'Unicorno', 'Rappresenta un unicorno', -8.3, 13.4, 100, 120),
(66, 'Vela', 'Rappresenta la vela di una nave', -58.1, -40.2, 125, 140),
(67, 'Vergine', 'Rappresenta una vergine', -12.3, 19.4, 180, 220),
(68, 'Volpetta', 'Rappresenta una piccola volpe', 20.2, 29.5, 292, 314),
(69, 'Zodiaco', 'Rappresenta la fascia zodiacale', -10, 10, 0, 360);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Costellazioni`
--
ALTER TABLE `Costellazioni`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
