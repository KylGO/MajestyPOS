-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 15 jan. 2026 à 15:43
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

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `nbrClients`, `numTable`, `date`, `heure`, `total`, `actif`) VALUES
(1, 50, 1, '2026-01-03', '17:24:27', 59.50, 0),
(2, 1, 2, '2026-01-03', '17:27:15', 65.80, 0),
(3, 1, 5, '2026-01-03', '20:24:50', 126.00, 0),
(4, 2, 2, '2026-01-03', '20:25:18', 17.50, 0),
(5, 1, 1, '2026-01-04', '16:27:43', 19.50, 0),
(6, 2, 3, '2026-01-04', '16:32:54', 15.00, 0),
(7, 1, 5, '2026-01-04', '16:37:33', 30.80, 0),
(8, 1, 1, '2026-01-04', '16:39:11', 7.00, 0),
(9, 2, 1, '2026-01-04', '16:45:37', 45.70, 0),
(10, 1, 5, '2026-01-04', '17:02:11', 38.90, 0),
(11, 5, 6, '2026-01-04', '17:03:53', 29.50, 0),
(12, 1, 1, '2026-01-04', '17:04:44', 12.00, 0),
(13, 1, 2, '2026-01-04', '17:22:00', 38.50, 0),
(14, 1, 2, '2026-01-04', '17:22:03', 38.50, 0),
(15, 1, 2, '2026-01-04', '17:26:12', 30.30, 0),
(16, 1, 1, '2026-01-04', '17:27:56', 44.00, 0),
(17, 11, 1, '2026-01-04', '17:55:16', 45.00, 0),
(18, 5, 5, '2026-01-04', '18:35:01', 110.90, 0),
(19, 2, 5, '2026-01-04', '18:41:47', 28.00, 0),
(20, 3, 4, '2026-01-04', '18:47:12', 39.00, 0),
(21, 3, 2, '2026-01-04', '18:51:09', 21.00, 0),
(22, 1, 5, '2026-01-04', '18:59:11', 107.00, 0),
(23, 45, 6, '2026-01-04', '19:05:47', 202.50, 0),
(24, 1, 5, '2026-01-04', '19:09:04', 158.50, 0),
(25, 5, 8, '2026-01-04', '19:12:33', 57.90, 0),
(26, 6, 2, '2026-01-04', '20:31:37', 125.20, 0),
(27, 6, 4, '2026-01-04', '20:34:46', 123.00, 0),
(28, 1, 1, '2026-01-04', '20:38:05', 106.50, 0),
(29, 1, 1, '2026-01-04', '20:38:09', 106.50, 0),
(30, 1, 1, '2026-01-04', '20:38:10', 106.50, 0),
(31, 1, 1, '2026-01-04', '20:38:11', 106.50, 0),
(32, 5, 6, '2026-01-04', '20:39:58', 123.00, 0),
(33, 1, 1, '2026-01-04', '20:41:07', 56.50, 0),
(34, 3, 2, '2026-01-04', '20:54:56', 20.50, 0),
(35, 1, 9, '2026-01-09', '16:12:37', 11.50, 0),
(36, 1, 1, '2026-01-09', '17:50:15', 150.00, 0),
(37, 2, 1, '2026-01-09', '18:00:46', 44.80, 0),
(38, 1, 1, '2026-01-13', '16:30:26', 6.50, 0),
(39, 3, 1, '2026-01-13', '17:51:52', 120.40, 1),
(40, 1, 5, '2026-01-13', '19:31:46', 262.90, 1);

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

--
-- Déchargement des données de la table `commandeitem`
--

INSERT INTO `commandeitem` (`idCommandeItem`, `idCommande`, `idItem`, `quantite`, `prixItemUnite`) VALUES
(1, 1, 1, 2, 4.50),
(2, 1, 54, 1, 23.00),
(3, 1, 27, 1, 18.50),
(4, 1, 13, 2, 4.50),
(5, 2, 20, 1, 16.90),
(6, 2, 37, 1, 5.90),
(7, 2, 54, 1, 23.00),
(8, 2, 55, 1, 11.00),
(9, 2, 12, 3, 3.00),
(10, 3, 4, 1, 4.00),
(11, 3, 5, 16, 6.50),
(12, 3, 8, 4, 4.50),
(13, 4, 10, 1, 8.00),
(14, 4, 11, 1, 9.50),
(15, 5, 17, 3, 6.50),
(16, 6, 9, 1, 7.00),
(17, 6, 10, 1, 8.00),
(18, 7, 2, 1, 7.00),
(19, 7, 20, 1, 16.90),
(20, 7, 39, 1, 6.90),
(21, 8, 3, 1, 7.00),
(22, 9, 48, 1, 2.30),
(23, 9, 36, 1, 4.90),
(24, 9, 9, 3, 7.00),
(25, 9, 30, 1, 17.50),
(26, 10, 21, 1, 15.90),
(27, 10, 44, 1, 4.50),
(28, 10, 31, 1, 18.50),
(29, 11, 7, 1, 7.00),
(30, 11, 26, 1, 17.50),
(31, 11, 47, 1, 5.00),
(32, 12, 1, 1, 4.50),
(33, 12, 12, 1, 3.00),
(34, 12, 13, 1, 4.50),
(35, 13, 2, 2, 7.00),
(36, 13, 12, 1, 3.00),
(37, 13, 45, 1, 4.00),
(38, 13, 30, 1, 17.50),
(39, 14, 2, 2, 7.00),
(40, 14, 12, 1, 3.00),
(41, 14, 45, 1, 4.00),
(42, 14, 30, 1, 17.50),
(43, 15, 1, 1, 4.50),
(44, 15, 49, 1, 12.00),
(45, 15, 36, 1, 4.90),
(46, 15, 37, 1, 5.90),
(47, 15, 12, 1, 3.00),
(48, 16, 17, 2, 6.50),
(49, 16, 49, 1, 12.00),
(50, 16, 50, 1, 19.00),
(51, 17, 16, 1, 5.00),
(52, 17, 49, 1, 12.00),
(53, 17, 54, 1, 23.00),
(54, 17, 15, 1, 5.00),
(55, 18, 49, 1, 12.00),
(56, 18, 17, 1, 6.50),
(57, 18, 50, 1, 19.00),
(58, 18, 35, 1, 18.50),
(59, 18, 3, 1, 7.00),
(60, 18, 21, 1, 15.90),
(61, 18, 40, 2, 1.50),
(62, 18, 10, 2, 8.00),
(63, 18, 43, 1, 3.50),
(64, 18, 13, 1, 4.50),
(65, 18, 15, 1, 5.00),
(66, 19, 16, 2, 5.00),
(67, 19, 13, 2, 4.50),
(68, 19, 14, 1, 4.00),
(69, 19, 15, 1, 5.00),
(70, 20, 16, 2, 5.00),
(71, 20, 17, 1, 6.50),
(72, 20, 13, 3, 4.50),
(73, 20, 14, 1, 4.00),
(74, 20, 15, 1, 5.00),
(75, 21, 16, 2, 5.00),
(76, 21, 12, 2, 3.00),
(77, 21, 15, 1, 5.00),
(78, 22, 49, 2, 12.00),
(79, 22, 50, 1, 19.00),
(80, 22, 51, 1, 12.00),
(81, 22, 52, 1, 18.00),
(82, 22, 54, 1, 23.00),
(83, 22, 57, 1, 11.00),
(84, 23, 13, 45, 4.50),
(85, 24, 32, 1, 18.50),
(86, 24, 4, 1, 4.00),
(87, 24, 5, 1, 6.50),
(88, 24, 6, 1, 6.00),
(89, 24, 7, 1, 7.00),
(90, 24, 8, 1, 4.50),
(91, 24, 49, 1, 12.00),
(92, 24, 50, 1, 19.00),
(93, 24, 51, 2, 12.00),
(94, 24, 57, 1, 11.00),
(95, 24, 59, 1, 10.00),
(96, 24, 30, 1, 17.50),
(97, 24, 31, 1, 18.50),
(98, 25, 40, 1, 1.50),
(99, 25, 9, 1, 7.00),
(100, 25, 41, 1, 2.50),
(101, 25, 10, 1, 8.00),
(102, 25, 11, 1, 9.50),
(103, 25, 43, 2, 3.50),
(104, 25, 44, 1, 4.50),
(105, 25, 12, 1, 3.00),
(106, 25, 46, 1, 4.90),
(107, 25, 47, 1, 5.00),
(108, 25, 15, 1, 5.00),
(109, 26, 1, 3, 4.50),
(110, 26, 49, 1, 12.00),
(111, 26, 2, 2, 7.00),
(112, 26, 18, 3, 15.90),
(113, 26, 50, 1, 19.00),
(114, 26, 12, 1, 3.00),
(115, 26, 60, 1, 16.00),
(116, 27, 49, 1, 12.00),
(117, 27, 51, 1, 12.00),
(118, 27, 55, 1, 11.00),
(119, 27, 57, 1, 11.00),
(120, 27, 27, 1, 18.50),
(121, 27, 28, 1, 19.50),
(122, 27, 29, 2, 19.50),
(123, 28, 32, 2, 18.50),
(124, 28, 9, 1, 7.00),
(125, 28, 10, 2, 8.00),
(126, 28, 11, 1, 9.50),
(127, 28, 31, 2, 18.50),
(128, 29, 32, 2, 18.50),
(129, 29, 9, 1, 7.00),
(130, 29, 10, 2, 8.00),
(131, 29, 11, 1, 9.50),
(132, 29, 31, 2, 18.50),
(133, 30, 32, 2, 18.50),
(134, 30, 9, 1, 7.00),
(135, 30, 10, 2, 8.00),
(136, 30, 11, 1, 9.50),
(137, 30, 31, 2, 18.50),
(138, 31, 32, 2, 18.50),
(139, 31, 9, 1, 7.00),
(140, 31, 10, 2, 8.00),
(141, 31, 11, 1, 9.50),
(142, 31, 31, 2, 18.50),
(143, 32, 32, 1, 18.50),
(144, 32, 49, 1, 12.00),
(145, 32, 51, 1, 12.00),
(146, 32, 53, 1, 14.00),
(147, 32, 9, 3, 7.00),
(148, 32, 57, 1, 11.00),
(149, 32, 10, 2, 8.00),
(150, 32, 31, 1, 18.50),
(151, 33, 16, 1, 5.00),
(152, 33, 9, 1, 7.00),
(153, 33, 10, 2, 8.00),
(154, 33, 11, 2, 9.50),
(155, 33, 13, 1, 4.50),
(156, 33, 15, 1, 5.00),
(157, 34, 16, 2, 5.00),
(158, 34, 12, 2, 3.00),
(159, 34, 13, 1, 4.50),
(160, 35, 1, 1, 4.50),
(161, 35, 2, 1, 7.00),
(162, 36, 2, 2, 7.00),
(163, 36, 50, 4, 19.00),
(164, 36, 44, 1, 4.50),
(165, 36, 31, 3, 18.50),
(166, 37, 1, 1, 4.50),
(167, 37, 36, 1, 4.90),
(168, 37, 21, 1, 15.90),
(169, 37, 29, 1, 19.50),
(170, 38, 5, 1, 6.50),
(171, 39, 49, 1, 12.00),
(172, 39, 2, 1, 7.00),
(173, 39, 36, 1, 4.90),
(174, 39, 40, 1, 1.50),
(175, 39, 10, 1, 8.00),
(176, 39, 42, 1, 3.50),
(177, 39, 11, 1, 9.50),
(178, 39, 31, 4, 18.50),
(179, 40, 16, 1, 5.00),
(180, 40, 2, 11, 7.00),
(181, 40, 54, 2, 23.00),
(182, 40, 39, 1, 6.90),
(183, 40, 57, 4, 11.00),
(184, 40, 59, 2, 10.00),
(185, 40, 60, 4, 16.00);

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
(1, 'Raita', 4.50, 'Yaourt aux légumes et épices', 1),
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
('azeaze', '123', '123546879');
-----------------------------------------------------------------------

--
-- Structure de la table `tableclient`
--


CREATE TABLE tableclient (
	numTable  int(20) NOT NULL PRIMARY KEY,
    etatTable int(3)
)
  
--
-- AUTO_INCREMENT pour la table `tableclient`
--



--
-- ajouter les tables pour la table 'tableclient' 
--
INSERT INTO tableclient (numTable, etatTable) VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0)

  
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
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `commandeitem`
--
ALTER TABLE `commandeitem`
  MODIFY `idCommandeItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`idCarte`) REFERENCES `carte` (`idCarte`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Foreign Key de numTable sur 'tableclient' a 'commande'
--

ALTER TABLE commande 
ADD CONSTRAINT commande_ibfk_1 FOREIGN KEY (numTable) REFERENCES tableclient (numTable) ON DELETE CASCADE ON UPDATE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
