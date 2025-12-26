-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 26 déc. 2025 à 14:23
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
  `id_carte` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`id_carte`, `nom`, `description`) VALUES
(1, 'Carte Bollywood Massala', 'Cuisine indienne traditionnelle');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `id_carte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `description`, `id_carte`) VALUES
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
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  `description` varchar(200) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id_item`, `nom`, `prix`, `description`, `id_categorie`) VALUES
(1, 'Raita', 4.5, 'Yaourt aux légumes et épices', 1),
(2, 'Salade crevettes', 7, 'Crevettes, légumes, citron vert', 1),
(3, 'Salade chicken', 7, 'Poulet tikka et crudités', 1),
(4, 'Papadum (2 pcs)', 4, 'Galettes croustillantes avec sauces', 2),
(5, 'Mix Pakora', 6.5, 'Beignets de légumes', 2),
(6, 'Samosa légumes (2 pcs)', 6, 'Beignets de légumes épicés', 2),
(7, 'Samosa chicken (2 pcs)', 7, 'Samosa au poulet', 2),
(8, 'Frites', 4.5, 'Frites maison', 2),
(9, 'Chicken Tandoori', 7, 'Cuisse de poulet grillée', 3),
(10, 'Chicken Tikka Tandoori', 8, 'Blanc de poulet grillé', 3),
(11, 'Seekh Kebab', 9.5, 'Brochette d’agneau haché', 3),
(12, 'Naan nature', 3, 'Pain indien nature', 4),
(13, 'Naan fromage', 4.5, 'Pain indien au fromage', 4),
(14, 'Naan garlic', 4, 'Pain indien à l’ail', 4),
(15, 'Naan garlic fromage', 5, 'Pain indien ail et fromage', 4),
(16, 'Naan légumes', 5, 'Pain indien aux légumes', 4),
(17, 'Naan keema', 6.5, 'Pain indien à la viande hachée', 4),
(18, 'Aloo Chana', 15.9, 'Pommes de terre et pois chiches au curry', 5),
(19, 'Mix légumes Korma', 16.9, 'Légumes à la crème et noix de cajou', 5),
(20, 'Palak Paneer', 16.9, 'Épinards et fromage indien', 5),
(21, 'Dal', 15.9, 'Mélange de lentilles au curry', 5),
(22, 'Chicken Curry', 14.5, 'Curry de poulet traditionnel', 6),
(23, 'Poulet Korma', 16.5, 'Poulet à la crème et noix de cajou', 6),
(24, 'Chicken Madras', 16.5, 'Poulet sauce madras épicée', 6),
(25, 'Chicken Tikka Massala', 17.5, 'Poulet grillé sauce massala', 6),
(26, 'Butter Chicken', 17.5, 'Poulet grillé sauce beurre', 6),
(27, 'Agneau Curry', 18.5, 'Curry d’agneau traditionnel', 7),
(28, 'Agneau Madras', 19.5, 'Agneau sauce madras épicée', 7),
(29, 'Agneau Korma', 19.5, 'Agneau à la crème et fruits secs', 7),
(30, 'Fish Curry', 17.5, 'Curry de poisson', 8),
(31, 'Fish Madras', 18.5, 'Poisson sauce madras', 8),
(32, 'Crevettes Massala', 18.5, 'Crevettes sauce massala', 8),
(33, 'Biryani végétarien', 14.9, 'Riz épicé aux légumes', 9),
(34, 'Biryani poulet', 15.9, 'Riz épicé au poulet', 9),
(35, 'Biryani mixte', 18.5, 'Riz épicé viandes et crevettes', 9),
(36, 'Riz au lait', 4.9, 'Riz au lait maison', 11),
(37, 'Suji Halwa', 5.9, 'Gâteau de semoule indien', 11),
(38, 'Gulab Jamun', 6.9, 'Beignets au sirop de cardamome', 11),
(39, 'Dessert gourmand', 6.9, 'Assortiment de desserts', 11),
(40, 'Eau Cristaline 50cl', 1.5, 'Eau plate', 15),
(41, 'Eau Vittel 50cl', 2.5, 'Eau plate', 15),
(42, 'San Pellegrino 50cl', 3.5, 'Eau pétillante', 15),
(43, 'Canette soda', 3.5, 'Coca, Ice Tea, Oasis, Sprite', 15),
(44, 'Jus exotique bouteille', 4.5, 'Mangue, litchi, goyave, ananas', 15),
(45, 'Lassi nature', 4, 'Boisson au yaourt', 15),
(46, 'Lassi mangue', 4.9, 'Boisson au yaourt à la mangue', 15),
(47, 'Thé Chaï', 5, 'Thé indien au lait et épices', 15),
(48, 'Café', 2.3, 'Café ou décaféiné', 15),
(49, 'Saint Nicolas de Bourgueil 37cl', 12, 'Vin rouge', 16),
(50, 'Saint Nicolas de Bourgueil 75cl', 19, 'Vin rouge', 16),
(51, 'Saumur Champigny 37cl', 12, 'Vin rouge', 16),
(52, 'Saumur Champigny 75cl', 18, 'Vin rouge', 16),
(53, 'Saint-Emilion 37cl', 14, 'Vin rouge', 16),
(54, 'Saint-Emilion 75cl', 23, 'Vin rouge', 16),
(55, 'Muscadet 37cl', 11, 'Vin blanc', 16),
(56, 'Muscadet 75cl', 18, 'Vin blanc', 16),
(57, 'Côte de Provence 37cl', 11, 'Vin rosé', 16),
(58, 'Côte de Provence 75cl', 18, 'Vin rosé', 16),
(59, 'Rosé de Loire 37cl', 10, 'Vin rosé', 16),
(60, 'Rosé de Loire 75cl', 16, 'Vin rosé', 16);

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
-- Structure de la table `menu_categorie`
--

CREATE TABLE `menu_categorie` (
  `id_menu_categorie` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menu_categorie`
--

INSERT INTO `menu_categorie` (`id_menu_categorie`, `id_menu`, `id_categorie`, `quantite`) VALUES
(1, 1, 1, 1),
(2, 1, 5, 1),
(3, 1, 11, 1),
(4, 2, 1, 1),
(5, 2, 6, 1),
(6, 2, 11, 1),
(7, 3, 2, 1),
(8, 3, 6, 1),
(9, 3, 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `menu_item`
--

CREATE TABLE `menu_item` (
  `id_menu_item` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menu_item`
--

INSERT INTO `menu_item` (`id_menu_item`, `id_menu`, `id_item`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 18),
(5, 1, 19),
(6, 1, 20),
(7, 1, 21),
(8, 1, 36),
(9, 1, 37),
(10, 1, 38),
(11, 1, 39),
(16, 2, 1),
(17, 2, 2),
(18, 2, 3),
(19, 2, 22),
(20, 2, 23),
(21, 2, 24),
(22, 2, 25),
(23, 2, 26),
(24, 2, 36),
(25, 2, 37),
(26, 2, 38),
(27, 2, 39),
(31, 3, 4),
(32, 3, 5),
(33, 3, 6),
(34, 3, 7),
(35, 3, 8),
(36, 3, 22),
(37, 3, 23),
(38, 3, 24),
(39, 3, 25),
(40, 3, 26),
(41, 3, 36),
(42, 3, 37),
(43, 3, 38),
(44, 3, 39);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carte`
--
ALTER TABLE `carte`
  ADD PRIMARY KEY (`id_carte`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`),
  ADD KEY `id_carte` (`id_carte`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Index pour la table `menu_categorie`
--
ALTER TABLE `menu_categorie`
  ADD PRIMARY KEY (`id_menu_categorie`),
  ADD KEY `fk_menu_cat_menu` (`id_menu`),
  ADD KEY `fk_menu_cat_categorie` (`id_categorie`);

--
-- Index pour la table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`id_menu_item`),
  ADD KEY `fk_menu_item_menu` (`id_menu`),
  ADD KEY `fk_menu_item_item` (`id_item`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carte`
--
ALTER TABLE `carte`
  MODIFY `id_carte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `menu_categorie`
--
ALTER TABLE `menu_categorie`
  MODIFY `id_menu_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `id_menu_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id_carte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_categorie`
--
ALTER TABLE `menu_categorie`
  ADD CONSTRAINT `fk_menu_cat_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_menu_cat_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE;

--
-- Contraintes pour la table `menu_item`
--
ALTER TABLE `menu_item`
  ADD CONSTRAINT `fk_menu_item_item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_menu_item_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
