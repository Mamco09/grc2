-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 08 juil. 2019 à 23:10
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `grc2`
--

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

DROP TABLE IF EXISTS `agence`;
CREATE TABLE IF NOT EXISTS `agence` (
  `ID_AG` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_AG` char(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  `ADRESSE_AG` varchar(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`ID_AG`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`ID_AG`, `NOM_AG`, `ADRESSE_AG`) VALUES
(1, 'Kaedie', 'GRD-999'),
(2, 'CENTRAL', 'MKP68');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `ID_ETAT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_ETAT` char(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`ID_ETAT`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`ID_ETAT`, `NOM_ETAT`) VALUES
(1, 'En attente de reponse'),
(2, 'Repondus'),
(3, 'Reponse Confirme');

-- --------------------------------------------------------

--
-- Structure de la table `piece_jointe`
--

DROP TABLE IF EXISTS `piece_jointe`;
CREATE TABLE IF NOT EXISTS `piece_jointe` (
  `ID_PJ` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_PJ` varchar(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  `ID_U` int(11) DEFAULT NULL,
  `DATE_AJOUT_PJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PJ`),
  KEY `ID_U` (`ID_U`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `piece_jointe`
--

INSERT INTO `piece_jointe` (`ID_PJ`, `NOM_PJ`, `ID_U`, `DATE_AJOUT_PJ`) VALUES
(1, 'Aucune piece jointe', NULL, NULL),
(2, 'Annalyse gestion ecole.docx', 1, '2019-07-02 09:40:39'),
(3, 'Annalyse gestion ecole.docx', 1, '2019-07-02 10:48:15'),
(4, 'Annalyse gestion ecole.docx', 1, '2019-07-02 15:41:55'),
(5, 'Annalyse gestion ecole.docx', 1, '2019-07-04 16:08:37'),
(6, 'Document.docx', 1, '2019-07-08 14:27:38'),
(7, 'Document.docx', 1, '2019-07-08 14:28:11'),
(8, 'Annalyse gestion ecole.docx', 1, '2019-07-08 14:28:42'),
(9, 'Annalyse gestion ecole.docx', 1, '2019-07-08 15:02:23');

-- --------------------------------------------------------

--
-- Structure de la table `priorite`
--

DROP TABLE IF EXISTS `priorite`;
CREATE TABLE IF NOT EXISTS `priorite` (
  `ID_PRI` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_PRI` char(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`ID_PRI`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `priorite`
--

INSERT INTO `priorite` (`ID_PRI`, `NOM_PRI`) VALUES
(1, 'TRES URGENT'),
(2, 'URGENT'),
(3, 'PAS TRES URGENT'),
(4, '');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `ID_PROFIL` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_PROFIL` char(40) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  PRIMARY KEY (`ID_PROFIL`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`ID_PROFIL`, `NOM_PROFIL`) VALUES
(1, 'CHARGER CLIENTELLE'),
(2, 'ADERANT'),
(3, 'ADMINISTRATEUR');

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `ID_REC` int(11) NOT NULL AUTO_INCREMENT,
  `ID_U` int(11) NOT NULL,
  `ID_TYPE` int(11) NOT NULL,
  `ID_ETAT` int(11) NOT NULL,
  `ID_PRI` int(11) NOT NULL,
  `ID_PJ` int(11) DEFAULT NULL,
  `DESCRIPTION_REC` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `INFO_COMP_REC` text COLLATE utf8_general_mysql500_ci,
  `DATE_REC` datetime DEFAULT NULL,
  `NUM_CLI` varchar(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  `TEL_CLI` int(11) NOT NULL,
  PRIMARY KEY (`ID_REC`),
  KEY `FK_AVOIR` (`ID_TYPE`),
  KEY `FK_COMPORTER` (`ID_ETAT`),
  KEY `FK_ENVOYER` (`ID_U`),
  KEY `FK_ETRE` (`ID_PRI`),
  KEY `ID_PJ` (`ID_PJ`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `reclamation`
--

INSERT INTO `reclamation` (`ID_REC`, `ID_U`, `ID_TYPE`, `ID_ETAT`, `ID_PRI`, `ID_PJ`, `DESCRIPTION_REC`, `INFO_COMP_REC`, `DATE_REC`, `NUM_CLI`, `TEL_CLI`) VALUES
(1, 1, 1, 3, 4, 9, 'ghfgh gfhhfh htry', 'tryr', '2019-07-08 15:02:23', '12457858', 46460607),
(2, 2, 1, 1, 1, 1, 'Ã¨', 'AUCUNNE', '2019-07-08 15:07:34', '12457858', 46460607);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `ID_REP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_REC` int(11) NOT NULL,
  `ID_U` int(11) NOT NULL,
  `ID_PJ` int(11) NOT NULL,
  `DATE_REP` datetime NOT NULL,
  `REP` text COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`ID_REP`),
  KEY `ID_REC` (`ID_REC`,`ID_U`,`ID_PJ`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`ID_REP`, `ID_REC`, `ID_U`, `ID_PJ`, `DATE_REP`, `REP`) VALUES
(1, 3, 2, 1, '2019-07-07 23:59:30', 'k'),
(2, 3, 2, 1, '2019-07-08 00:01:11', 'ok oihrh riutorituero iuroetiuroitu oiutoritur iuoiuoirt oiuoiutret iuortuoirt Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos et totam tempora odio nulla corporis, quaerat eum, est ipsa, rerum delectus nam voluptatum accusantium eveniet rem dolore ad asperiores quis.'),
(3, 2, 2, 1, '2019-07-08 00:01:54', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos et totam tempora odio nulla corporis, quaerat eum, est ipsa, rerum delectus nam voluptatum accusantium eveniet rem dolore ad asperiores quis.'),
(4, 1, 1, 1, '2019-07-08 13:00:53', 'vv'),
(5, 6, 1, 1, '2019-07-08 14:29:09', 'xvsdopugsdf Ã Ã§ uÃ ptÃ§ Ã Ã§rtu )Ã§uret Ã§)erÃ§t'),
(6, 6, 1, 1, '2019-07-08 14:29:23', 'rthipoiut iÃ§uptyÃ§u utyr\r\ntuyiouop Ã§it$y\r\ntÃ§pyu pty_ \r\n tyuprtyu ty\r\n yr'),
(7, 1, 1, 1, '2019-07-08 15:11:35', 'ghjhgj');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `ID_TYPE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_TYPE` char(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`ID_TYPE`, `NOM_TYPE`) VALUES
(1, 'VIREMENT'),
(3, 'CARTE COINCE');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_U` int(11) NOT NULL AUTO_INCREMENT,
  `ID_AG` int(11) NOT NULL,
  `ID_PROFIL` int(11) NOT NULL,
  `ID_ADMIN` int(11) DEFAULT NULL,
  `PRENOM_U` char(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  `NOM_U` char(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  `TEL_U` int(11) NOT NULL,
  `GENRE_U` char(1) COLLATE utf8_general_mysql500_ci NOT NULL,
  `DATE_AJOUT_U` datetime NOT NULL,
  `DATE_NAISS_U` date NOT NULL,
  `IDENTIFIANT_U` varchar(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  `MDP_U` varchar(40) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`ID_U`),
  KEY `FK_AJOUTER` (`ID_ADMIN`),
  KEY `FK_APPARTENIR` (`ID_AG`),
  KEY `FK_AVOIR_2` (`ID_PROFIL`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_U`, `ID_AG`, `ID_PROFIL`, `ID_ADMIN`, `PRENOM_U`, `NOM_U`, `TEL_U`, `GENRE_U`, `DATE_AJOUT_U`, `DATE_NAISS_U`, `IDENTIFIANT_U`, `MDP_U`) VALUES
(1, 2, 3, 1, 'Mamadou', 'Aly Sy', 37768999, 'M', '2019-07-04 16:59:19', '1997-11-20', 'mo', '1122'),
(2, 2, 2, 1, 'Mouhamed', 'Fall', 46460607, 'M', '2019-07-07 23:52:29', '1996-05-24', 'fall', '0000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
