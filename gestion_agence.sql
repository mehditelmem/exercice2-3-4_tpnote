-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 13 nov. 2023 à 15:56
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_agence`
--

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `Id_agence` int(11) NOT NULL,
  `Nom_agence` varchar(25) DEFAULT NULL,
  `Tel_agence` varchar(15) DEFAULT NULL,
  `Adresse_agence` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`Id_agence`, `Nom_agence`, `Tel_agence`, `Adresse_agence`) VALUES
(1, 'Agence Paris', '0123456789', '123 Rue de Rivoli, Paris'),
(2, 'Agence Lyon', '0234567890', '456 Rue de la République,'),
(3, 'Agence Marseille', '0345678901', '789 Avenue du Prado, Mars');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(25) DEFAULT NULL,
  `prenom_client` varchar(25) DEFAULT NULL,
  `adresse_client` varchar(25) DEFAULT NULL,
  `tel_client` varchar(15) DEFAULT NULL,
  `date_naissance_client` date DEFAULT NULL,
  `id_conseiller` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `adresse_client`, `tel_client`, `date_naissance_client`, `id_conseiller`) VALUES
(1, 'Doe', 'Adam', '123 Rue de Rivoli, Paris', '0123456789', '1985-05-10', 1),
(2, 'Smith', 'Julie', '456 Rue de la République,', '0234567890', '1990-08-25', 2),
(3, 'Drinkwater', 'Jadon', '789 Avenue du Prado, Mars', '0345678901', '1988-02-15', 3);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id_compte` int(11) NOT NULL,
  `type_compte` varchar(25) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_agence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id_compte`, `type_compte`, `id_client`, `id_agence`) VALUES
(1, 'Épargne', 1, 1),
(2, 'Courant', 2, 2),
(3, 'Épargne', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `conseiller`
--

CREATE TABLE `conseiller` (
  `Id_conseiller` int(11) NOT NULL,
  `Nom_conseiller` varchar(25) DEFAULT NULL,
  `Prenom_conseiller` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `conseiller`
--

INSERT INTO `conseiller` (`Id_conseiller`, `Nom_conseiller`, `Prenom_conseiller`) VALUES
(1, 'Doe', 'John'),
(2, 'Smith', 'Jane'),
(3, 'Johnson', 'James');

-- --------------------------------------------------------

--
-- Structure de la table `lignecompte`
--

CREATE TABLE `lignecompte` (
  `Id_ligneCompte` int(11) NOT NULL,
  `dateOuv_ligneCompte` date DEFAULT NULL,
  `solde_ligneCompte` float DEFAULT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lignecompte`
--

INSERT INTO `lignecompte` (`Id_ligneCompte`, `dateOuv_ligneCompte`, `solde_ligneCompte`, `id_compte`) VALUES
(1, '2022-01-15', 1000.5, 1),
(2, '2022-02-20', 2500.75, 2),
(3, '2022-03-10', 500.2, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`Id_agence`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_conseiller` (`id_conseiller`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id_compte`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_agence` (`id_agence`);

--
-- Index pour la table `conseiller`
--
ALTER TABLE `conseiller`
  ADD PRIMARY KEY (`Id_conseiller`);

--
-- Index pour la table `lignecompte`
--
ALTER TABLE `lignecompte`
  ADD PRIMARY KEY (`Id_ligneCompte`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_conseiller`) REFERENCES `conseiller` (`Id_conseiller`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`id_agence`) REFERENCES `agence` (`Id_agence`);

--
-- Contraintes pour la table `lignecompte`
--
ALTER TABLE `lignecompte`
  ADD CONSTRAINT `lignecompte_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
