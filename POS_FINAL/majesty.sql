-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 19 jan. 2026 à 06:22
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `majesty`
--

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

CREATE TABLE `carte` (
  `idCarte` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`idCarte`, `nom`, `description`) VALUES
(1, 'Carte Bollywood Massala', 'Cuisine indienne traditionnelle');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `idCarte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nom`, `description`, `idCarte`) VALUES
(1, 'Entrées froides', 'Entrées froides indiennes', 1),
(2, 'Entrées chaudes', 'Entrées chaudes et fritures', 1),
(3, 'Entrées grillades', 'Grillades tandoori', 1),
(4, 'Naans', 'Pains indiens', 1),
(5, 'Plats végétariens', 'Plats végétariens servis avec riz', 1),
(6, 'Poulets', 'Plats de poulet servis avec riz', 1),
(7, 'Agneaux', 'Plats d’agneau servis avec riz', 1),
(8, 'Poissons & Crevettes', 'Plats de la mer servis avec riz', 1),
(9, 'Biryani', 'Riz épicé avec viande ou légumes', 1),
(10, 'Sandwichs', 'Sandwichs indiens', 1),
(11, 'Desserts', 'Desserts indiens maison', 1),
(12, 'Boissons', 'Boissons chaudes et froides', 1),
(13, 'Bières', 'Bières indiennes et classiques', 1),
(14, 'Vins', 'Vins rouges, blancs et rosés', 1),
(15, 'Boissons', 'Boissons chaudes et froides', 1),
(16, 'Vins', 'Vins rouges, blancs et rosés', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(11) NOT NULL,
  `nbrClients` int(200) NOT NULL,
  `numTable` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `actif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandeitem`
--

CREATE TABLE `commandeitem` (
  `idCommandeItem` int(11) NOT NULL,
  `idCommande` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantite` int(200) NOT NULL,
  `prixItemUnite` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `idItem` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` double(10,2) NOT NULL,
  `description` varchar(200) NOT NULL,
  `idCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`idItem`, `nom`, `prix`, `description`, `idCategorie`) VALUES
(1, 'Raita', 4.50, 'Yaourt aux legumes et epices', 1),
(2, 'Salade crevettes', 7.00, 'Crevettes, légumes, citron vert', 1),
(3, 'Salade chicken', 7.00, 'Poulet tikka et crudités', 1),
(4, 'Papadum (2 pcs)', 4.00, 'Galettes croustillantes avec sauces', 2),
(5, 'Mix Pakora', 6.50, 'Beignets de légumes', 2),
(6, 'Samosa légumes (2 pcs)', 6.00, 'Beignets de légumes épicés', 2),
(7, 'Samosa chicken (2 pcs)', 7.00, 'Samosa au poulet', 2),
(8, 'Frites', 4.50, 'Frites maison', 2),
(9, 'Chicken Tandoori', 7.00, 'Cuisse de poulet grillée', 3),
(10, 'Chicken Tikka Tandoori', 8.00, 'Blanc de poulet grillé', 3),
(11, 'Seekh Kebab', 9.50, 'Brochette d’agneau haché', 3),
(12, 'Naan nature', 3.00, 'Pain indien nature', 4),
(13, 'Naan fromage', 4.50, 'Pain indien au fromage', 4),
(14, 'Naan garlic', 4.00, 'Pain indien à l’ail', 4),
(15, 'Naan garlic fromage', 5.00, 'Pain indien ail et fromage', 4),
(16, 'Naan légumes', 5.00, 'Pain indien aux légumes', 4),
(17, 'Naan keema', 6.50, 'Pain indien à la viande hachée', 4),
(18, 'Aloo Chana', 15.90, 'Pommes de terre et pois chiches au curry', 5),
(19, 'Mix légumes Korma', 16.90, 'Légumes à la crème et noix de cajou', 5),
(20, 'Palak Paneer', 16.90, 'Épinards et fromage indien', 5),
(21, 'Dal', 15.90, 'Mélange de lentilles au curry', 5),
(22, 'Chicken Curry', 14.50, 'Curry de poulet traditionnel', 6),
(23, 'Poulet Korma', 16.50, 'Poulet à la crème et noix de cajou', 6),
(24, 'Chicken Madras', 16.50, 'Poulet sauce madras épicée', 6),
(25, 'Chicken Tikka Massala', 17.50, 'Poulet grillé sauce massala', 6),
(26, 'Butter Chicken', 17.50, 'Poulet grillé sauce beurre', 6),
(27, 'Agneau Curry', 18.50, 'Curry d’agneau traditionnel', 7),
(28, 'Agneau Madras', 19.50, 'Agneau sauce madras épicée', 7),
(29, 'Agneau Korma', 19.50, 'Agneau à la crème et fruits secs', 7),
(30, 'Fish Curry', 17.50, 'Curry de poisson', 8),
(31, 'Fish Madras', 18.50, 'Poisson sauce madras', 8),
(32, 'Crevettes Massala', 18.50, 'Crevettes sauce massala', 8),
(33, 'Biryani végétarien', 14.90, 'Riz épicé aux légumes', 9),
(34, 'Biryani poulet', 15.90, 'Riz épicé au poulet', 9),
(35, 'Biryani mixte', 18.50, 'Riz épicé viandes et crevettes', 9),
(36, 'Riz au lait', 4.90, 'Riz au lait maison', 11),
(37, 'Suji Halwa', 5.90, 'Gâteau de semoule indien', 11),
(38, 'Gulab Jamun', 6.90, 'Beignets au sirop de cardamome', 11),
(39, 'Dessert gourmand', 6.90, 'Assortiment de desserts', 11),
(40, 'Eau Cristaline 50cl', 1.50, 'Eau plate', 15),
(41, 'Eau Vittel 50cl', 2.50, 'Eau plate', 15),
(42, 'San Pellegrino 50cl', 3.50, 'Eau pétillante', 15),
(43, 'Canette soda', 3.50, 'Coca, Ice Tea, Oasis, Sprite', 15),
(44, 'Jus exotique bouteille', 4.50, 'Mangue, litchi, goyave, ananas', 15),
(45, 'Lassi nature', 4.00, 'Boisson au yaourt', 15),
(46, 'Lassi mangue', 4.90, 'Boisson au yaourt à la mangue', 15),
(47, 'Thé Chaï', 5.00, 'Thé indien au lait et épices', 15),
(48, 'Café', 2.30, 'Café ou décaféiné', 15),
(49, 'Saint Nicolas de Bourgueil 37cl', 12.00, 'Vin rouge', 16),
(50, 'Saint Nicolas de Bourgueil 75cl', 19.00, 'Vin rouge', 16),
(51, 'Saumur Champigny 37cl', 12.00, 'Vin rouge', 16),
(52, 'Saumur Champigny 75cl', 18.00, 'Vin rouge', 16),
(53, 'Saint-Emilion 37cl', 14.00, 'Vin rouge', 16),
(54, 'Saint-Emilion 75cl', 23.00, 'Vin rouge', 16),
(55, 'Muscadet 37cl', 11.00, 'Vin blanc', 16),
(56, 'Muscadet 75cl', 18.00, 'Vin blanc', 16),
(57, 'Côte de Provence 37cl', 11.00, 'Vin rosé', 16),
(58, 'Côte de Provence 75cl', 18.00, 'Vin rosé', 16),
(59, 'Rosé de Loire 37cl', 10.00, 'Vin rosé', 16),
(60, 'Rosé de Loire 75cl', 16.00, 'Vin rosé', 16);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `prix` float NOT NULL,
  `actif` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id_menu`, `nom`, `description`, `prix`, `actif`) VALUES
(1, 'Thali Végétarien', 'Menu végétarien complet', 15.5, 1),
(2, 'Thali Poulet', 'Menu poulet complet', 16.5, 1),
(3, 'Menu Midi', 'Menu midi (hors week-end)', 14.9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`nom`, `adresse`, `telephone`) VALUES
('', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `tableclient`
--

CREATE TABLE `tableclient` (
  `numTable` int(20) NOT NULL,
  `etatTable` int(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tableclient`
--

INSERT INTO `tableclient` (`numTable`, `etatTable`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carte`
--
ALTER TABLE `carte`
  ADD PRIMARY KEY (`idCarte`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`),
  ADD KEY `id_carte` (`idCarte`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `numTable` (`numTable`);

--
-- Index pour la table `commandeitem`
--
ALTER TABLE `commandeitem`
  ADD PRIMARY KEY (`idCommandeItem`),
  ADD KEY `idCommande` (`idCommande`),
  ADD KEY `idItem` (`idItem`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`),
  ADD KEY `id_categorie` (`idCategorie`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Index pour la table `tableclient`
--
ALTER TABLE `tableclient`
  ADD PRIMARY KEY (`numTable`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carte`
--
ALTER TABLE `carte`
  MODIFY `idCarte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `commandeitem`
--
ALTER TABLE `commandeitem`
  MODIFY `idCommandeItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tableclient`
--
ALTER TABLE `tableclient`
  MODIFY `numTable` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`idCarte`) REFERENCES `carte` (`idCarte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`numTable`) REFERENCES `tableclient` (`numTable`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commandeitem`
--
ALTER TABLE `commandeitem`
  ADD CONSTRAINT `commandeitem_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commandeitem_ibfk_2` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
