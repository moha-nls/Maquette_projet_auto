-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : jeu. 14 jan. 2021 à 10:16
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_expertauto`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

DROP TABLE IF EXISTS `rendez_vous`;
CREATE TABLE IF NOT EXISTS `rendez_vous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix_rdv` double NOT NULL,
  `date_rdv` date NOT NULL,
  `immatriculation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carte_grise` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `heure_rdv` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_65E8AA0AED5CA9E6` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_service` double NOT NULL,
  `description_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duree_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `nom_service`, `prix_service`, `description_service`, `duree_service`, `created_at`, `update_at`) VALUES
(1, 'Vidange', 6900, NULL, '1 HEURE', '2021-01-14 09:53:09', NULL),
(2, 'Recharge de climatisation', 4900, NULL, '1 HEURE', '2021-01-14 09:58:37', NULL),
(3, 'Révision complète', 12900, NULL, '2 HEURES', '2021-01-14 10:01:15', '2021-01-14 10:02:24'),
(4, 'Décalaminage', 5900, NULL, '2 HEURES', '2021-01-14 10:01:57', NULL),
(5, 'Parallélisme pneus', 3900, NULL, '30 MINUTES', '2021-01-14 10:04:40', '2021-01-14 10:04:52'),
(6, 'Montage pneus (par 4)', 4900, NULL, '30 MINUTES', '2021-01-14 10:07:18', NULL),
(7, 'Changement plaque d\'immatriculation', 500, NULL, '10 MINUTES', '2021-01-14 10:09:06', NULL),
(8, 'Nettoyage injecteurs', 5900, NULL, '2 HEURES', '2021-01-14 10:10:06', NULL),
(9, 'Changement plaquettes de freins', 5900, NULL, '1 HEURE', '2021-01-14 10:12:53', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portable` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `prenom`, `nom`, `email`, `portable`, `password`, `roles`, `created_at`, `updated_at`) VALUES
(8, 'Loenel', 'Rosales', 'leonel@email.fr', NULL, '$argon2id$v=19$m=65536,t=4,p=1$MXJ6RU5Db1duTTlzbFdiUw$f0h/5yWG/vM5HUAuA8PsQeF7wVL9TBVVfVAjSmd9Ro4', '[\"ROLE_USER\"]', '2021-01-14 09:11:46', NULL),
(9, 'Mohamed', 'Jemoui', 'mohamed@email.fr', NULL, '$argon2id$v=19$m=65536,t=4,p=1$RUhoQUl2NjlWWDdhVEd5Qw$q+HgV0E0+QR4QrnuZeO6Y74MNRVOSycrZRoWVgU3Hfs', '[\"ROLE_ADMIN\"]', '2021-01-14 09:11:46', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `FK_65E8AA0AED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
