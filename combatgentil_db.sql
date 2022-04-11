-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : maria_db:3306
-- Généré le : Dim 10 avr. 2022 à 10:25
-- Version du serveur :  10.7.3-MariaDB-1:10.7.3+maria~focal
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `combatgentil_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `Arme`
--

CREATE TABLE `Arme` (
  `ID` tinyint(1) NOT NULL,
  `HerosID` tinyint(1) DEFAULT NULL,
  `Nom` varchar(50) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Degat` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Arme`
--

INSERT INTO `Arme` (`ID`, `HerosID`, `Nom`, `Type`, `Degat`) VALUES
(1, 4, 'Batte', 'Mousse', 0),
(99, 7, 'Blague nul', 'Tranchant', 99);

-- --------------------------------------------------------

--
-- Structure de la table `Competence`
--

CREATE TABLE `Competence` (
  `ID` tinyint(1) NOT NULL,
  `Type` enum('Statut','PV','Defense','Bonus','ArmeEnMain','Immunite') DEFAULT NULL,
  `Effet` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Competence`
--

INSERT INTO `Competence` (`ID`, `Type`, `Effet`) VALUES
(1, 'PV', '-50'),
(2, 'ArmeEnMain', NULL),
(3, 'Immunite', 'Tranchant'),
(4, 'Defense', '50');

-- --------------------------------------------------------

--
-- Structure de la table `CompetenceHeros`
--

CREATE TABLE `CompetenceHeros` (
  `CompetenceID` tinyint(1) NOT NULL,
  `HerosID` tinyint(1) NOT NULL,
  `Nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `CompetenceHeros`
--

INSERT INTO `CompetenceHeros` (`CompetenceID`, `HerosID`, `Nom`) VALUES
(1, 1, 'Reboot your brain'),
(3, 2, 'Bouclier Mac'),
(1, 3, 'Vanne divine'),
(2, 3, 'Vanne surprenante'),
(4, 2, 'Reboot your brain'),
(2, 2, 'DDOS your weapon');

-- --------------------------------------------------------

--
-- Structure de la table `Heros`
--

CREATE TABLE `Heros` (
  `ID` tinyint(1) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `PV` tinyint(2) NOT NULL,
  `Bonus` tinyint(2) NOT NULL,
  `Defense` tinyint(2) NOT NULL,
  `ArmeEnMain` tinyint(2) DEFAULT NULL,
  `Statut` varchar(100) NOT NULL,
  `Immunite` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Heros`
--

INSERT INTO `Heros` (`ID`, `Nom`, `PV`, `Bonus`, `Defense`, `ArmeEnMain`, `Statut`, `Immunite`) VALUES
(1, 'Comar', 40, 8, 7, 0, 'Joyeux', 'Tranchant'),
(2, 'Kirderf', 40, 5, 10, 0, 'Combatif', 'Contondant'),
(3, 'Liujen', 40, 10, 5, 0, 'Flegme', 'Perçant'),
(4, 'Jeanne-Cunégonde-Sophie', 50, 20, 0, 1, 'Nonchalente', 'Abusé'),
(5, 'Xéna', 45, 10, 10, 0, 'Furieuse', 'Aucun'),
(6, 'Toto', 5, 0, 25, 0, 'Hébété', 'Abusé');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Arme`
--
ALTER TABLE `Arme`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Arme.Nom` (`Nom`),
  ADD KEY `HerosID` (`HerosID`);

--
-- Index pour la table `Competence`
--
ALTER TABLE `Competence`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `CompetenceHeros`
--
ALTER TABLE `CompetenceHeros`
  ADD KEY `HerosID` (`HerosID`),
  ADD KEY `CompetenceID` (`CompetenceID`);

--
-- Index pour la table `Heros`
--
ALTER TABLE `Heros`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Heros.Nom` (`Nom`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Arme`
--
ALTER TABLE `Arme`
  MODIFY `ID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `Competence`
--
ALTER TABLE `Competence`
  MODIFY `ID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Heros`
--
ALTER TABLE `Heros`
  MODIFY `ID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Arme`
--
ALTER TABLE `Arme`
  ADD CONSTRAINT `FK_Heros_Arme` FOREIGN KEY (`HerosID`) REFERENCES `Heros` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `CompetenceHeros`
--
ALTER TABLE `CompetenceHeros`
  ADD CONSTRAINT `FK_Competence` FOREIGN KEY (`CompetenceID`) REFERENCES `Competence` (`ID`),
  ADD CONSTRAINT `FK_Heros` FOREIGN KEY (`HerosID`) REFERENCES `Heros` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
