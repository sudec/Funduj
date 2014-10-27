-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2014 at 06:16 AM
-- Server version: 5.1.71-rel14.9-log
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `2ea9gjqr`
--

-- --------------------------------------------------------

--
-- Table structure for table `df45s_admins`
--

CREATE TABLE IF NOT EXISTS `df45s_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET latin1 NOT NULL,
  `password` char(128) CHARACTER SET latin1 NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `e_mail` varchar(40) CHARACTER SET latin1 NOT NULL,
  `access_level` int(10) NOT NULL,
  `last_login` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `member_since` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `salt` char(128) CHARACTER SET latin1 NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs AUTO_INCREMENT=128 ;

--
-- Dumping data for table `df45s_admins`
--

INSERT INTO `df45s_admins` (`id`, `username`, `password`, `name`, `last_name`, `e_mail`, `access_level`, `last_login`, `member_since`, `salt`, `last_modified`) VALUES
(43, 'demo', '3267795a7d0171b2db4bfed9460a7c3eb3566c7d1578e2b7f6349ce54012c5d0d9dd9b7c7be6865186d3e0d2b66ef818e1f2c32b60fd467092020f80c0e5ed01', NULL, NULL, 'info@info.net', 0, '2013-09-10 10:35:53', '2013-09-05 18:06:31', 'e5441f5f81c6eb318fdf56c9dc6baafb2a4edc954a335bc2924932af0a09537d502c25c7804ae394e49751fa779f1cedc944cf86b2d432be664e74c3547c1a83', '2013-09-10 10:35:53'),
(54, 'sudec', '345648fa1e5dec3cd82b8920952f99dd6d1cca67133a23a0f4c9af54b4450045448e184b6ae5c48e50bf2af28859ccf882478a063abe439c77cb372d9abdaafd', NULL, NULL, 'viktor.sudicky@gmail.com', 0, '2013-11-12 16:16:44', '2013-09-10 10:35:49', 'cae270fe24f34a55d15032794a320a6529b7cb1989a7faeaf4ba873bd6ff3e0669326dc43354a521e964137e3ac110327d151b00a92d03047d73757ebe0e6a72', '2013-11-12 16:16:44'),
(94, 'sudec1', 'e69398909850ca74ccc24010bb3d50c1cb23d2fc6b1602d3249e652fb099d55023963b42815e208b0675ea7b36ac0be4a3049ba9c911a57e8c49a1b4536c5dc2', NULL, NULL, '', 0, '0000-00-00 00:00:00', '2013-09-10 15:17:22', 'c781e1e67d5f836c85baf6c9d5df62a64abd6e030cc180915b7b947280bfcb9d00f319e8c38b8100ce22d6012dc39f533ec892f82c64248397ab5685ab05eac3', '2013-09-10 15:17:22'),
(124, 'sudec2', 'ae916023c532a0664e4027dadde231116339b6fa0a9c878af7ce091ece82b0e1684fc53d81df354fdbb9c2515ac37a0898925eeb5b709af9fb4eb27ccf5aa906', 'hsdjkhdfjkh', 'djksfhsdkjh', 'sudec@centrum.sk', 0, '2013-09-23 13:14:07', '2013-09-23 13:13:17', '100f4a93d6cceb1d1433b378119357988332a433f7619a3b58f2d22445946f871e333abcf1a65b2a2ff836d9d108dd4836c00596bf349326bd9b8c16ec01c71e', '2013-09-23 13:14:07'),
(125, 'demo12', '9787ba708c206f27011004b6a257d4472f08edb5dbe87439ca6e9f6ebadb4326cedcfd5bc5ad1a2bc5718dd7512bdf31c04d6f76b67bed4ed1882a6f9256910f', '321321', '321321', '321321', 0, '0000-00-00 00:00:00', '2013-09-23 13:17:39', 'd4fd1ee72b05b41d0c61a2393a3bd2cdbad87b536aba15475b7909541707ac017352b6ac36b303b97f7e4bf0beb83c604f5763014effdc35cb52c3f378205b48', '2013-09-23 13:17:39'),
(126, 'saddasdd', 'e38be3e8b3538109d71938ea15f7c64c42c7272946030b8203ef6b5bfe85868c6b749ea878464c46e80acaa5d520c296c3f8d3d662649027ba01d629c258c824', '', '', '', 0, '0000-00-00 00:00:00', '2013-09-23 13:44:59', '696bc9dc47dab4d1e0b2746a52825a03b0b287391e1a82f48e3302c46489c1eba60317c3c89168a725561d05138232a0f0578d7ca9a216507f959aef28917009', '2013-09-23 13:44:59'),
(127, 'viktor.sudicky@gmail.com', 'f52f2580c0a6257798074b4f3ca942ea350906051737df922830217b1a2720eb3f65d90e99b96e900743fed7c22e945e4c788bc121688cbf9778a5c5de2e4b89', 'hsdjkhdfjkh', 'djksfhsdkjh', 'sudec@centrum.sk', 0, '0000-00-00 00:00:00', '2013-09-25 13:25:48', 'c8036125a01e122d3c703698b904b5fc4e5a5986b6b8b2aba2d9a3db899e9e36d069a5ac345b28d45ba8e69ae86fbce61847d04b717f39baf209aebd24da72af', '2013-09-25 13:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_admin_login_attempts`
--

CREATE TABLE IF NOT EXISTS `df45s_admin_login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `df45s_admin_login_attempts`
--

INSERT INTO `df45s_admin_login_attempts` (`user_id`, `time`) VALUES
(94, '1394454207');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_awards`
--

CREATE TABLE IF NOT EXISTS `df45s_awards` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `awardID` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `available` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `backers` int(11) NOT NULL,
  PRIMARY KEY (`entryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=308 ;

--
-- Dumping data for table `df45s_awards`
--

INSERT INTO `df45s_awards` (`entryID`, `projectID`, `awardID`, `title`, `amount`, `description`, `available`, `delivery_date`, `backers`) VALUES
(133, 110, 5, '5', 0, '', 0, '0000-00-00', 0),
(134, 111, 1, '', 0, '', 0, '0000-00-00', 0),
(135, 111, 2, '', 0, '', 0, '0000-00-00', 0),
(136, 119, 1, '', 0, '', 0, '0000-00-00', 0),
(141, 121, 2, '', 0, '', 0, '0000-00-00', 0),
(131, 110, 3, '3', 0, '', 0, '0000-00-00', 0),
(132, 110, 4, '4', 0, '', 0, '0000-00-00', 0),
(28, 106, 1, 'nazov 1', 0, '', 0, '0000-00-00', 0),
(29, 106, 2, 'nazov 2', 0, '', 0, '0000-00-00', 0),
(130, 110, 2, '2', 0, '', 0, '0000-00-00', 0),
(129, 110, 1, '1', 0, '', 0, '2012-03-20', 0),
(128, 109, 3, 'Nova odmena', 0, '', 0, '0000-00-00', 0),
(127, 109, 2, 'toto bola odmena 3', 0, '', 0, '2019-03-20', 0),
(126, 109, 1, 'odmena 1', 0, '', 0, '2001-03-20', 0),
(104, 105, 2, 'Odmena 5', 0, '', 0, '0000-00-00', 0),
(103, 105, 1, 'Odmena 1', 5, 'Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 0, '2019-03-20', 0),
(140, 121, 1, 'Viktor Sudicky', 5, '', 15, '2012-03-20', 0),
(142, 121, 3, '', 0, '', 0, '0000-00-00', 0),
(148, 111, 1, 'Na zaciatok z lahka', 8, 'Not ready to get a LifePrint quite yet? This is the pledge for you. Keep up to date on all things LifePrint for details on availability, exclusive updates, and more. We''re excited you''re excited!', 0, '2002-05-20', 0),
(165, 132, 3, '', 0, '', 0, '0000-00-00', 0),
(164, 132, 2, '', 0, '', 0, '0000-00-00', 0),
(152, 129, 1, 'sdfsdfsdfs', 0, '', 0, '0000-00-00', 0),
(153, 129, 2, 'fdsddfdf', 0, '', 0, '0000-00-00', 0),
(154, 129, 3, 'sdffdd', 0, '', 0, '0000-00-00', 0),
(155, 130, 1, '', 0, '', 0, '0000-00-00', 0),
(156, 130, 2, '', 0, '', 0, '0000-00-00', 0),
(157, 131, 1, '', 0, '', 0, '0000-00-00', 0),
(158, 131, 2, '', 0, '', 0, '0000-00-00', 0),
(159, 125, 1, '', 0, '', 0, '0000-00-00', 0),
(163, 132, 1, '', 0, '', 0, '0000-00-00', 0),
(166, 134, 1, '', 0, '', 0, '0000-00-00', 0),
(167, 134, 2, '', 0, '', 0, '0000-00-00', 0),
(168, 134, 3, '', 0, '', 0, '0000-00-00', 0),
(170, 135, 1, '', 0, '', 0, '0000-00-00', 0),
(171, 137, 1, 'Nazijv', 15, 'Potrebujete poradiť?\nPozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 15, '2028-03-20', 0),
(172, 137, 2, '', 30, 'Potrebujete poradiť?\nPozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 15, '2008-03-20', 0),
(185, 140, 4, 'Nazov 4', 500, 'Sem by mal prist kratky popis projektu. Potrebujete poradiť? Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.\nSem by mal prist kratky popis projektu. Potrebujete poradiť? Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.\nSem by mal prist kratky popis projektu. Potrebujete poradiť? Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 15, '2017-03-20', 1),
(184, 140, 3, 'Nazov 3', 25, 'Sem by mal prist kratky popis projektu. Potrebujete poradiť? Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 20, '2031-03-20', 3),
(181, 141, 1, '', 0, '', 0, '0000-00-00', 1),
(183, 140, 2, 'Nazov 2', 5, 'Sem by mal prist kratky popis projektu. Potrebujete poradiť? Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 15, '2020-06-20', 15),
(182, 140, 1, 'Nazov 1', 1, 'Sem by mal prist kratky popis projektu. Potrebujete poradiť? Pozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', 0, '2014-03-20', 0),
(188, 140, 5, 'Navov 2 2', 10, 'Tu je dalsia odmena', 0, '2019-03-20', 0),
(189, 147, 2, '', 15, 'da sd asd as a', 0, '0000-00-00', 0),
(190, 155, 1, '', 0, '', 0, '0000-00-00', 0),
(191, 156, 1, '', 0, '', 0, '0000-00-00', 0),
(194, 157, 1, '', 0, '', 0, '0000-00-00', 0),
(195, 158, 1, '', 0, '', 0, '0000-00-00', 0),
(201, 161, 3, '', 500, '', 1, '2006-06-20', 0),
(200, 161, 2, '', 25, '', 15, '2022-04-20', 0),
(199, 161, 1, '', 15, '', 0, '2009-04-20', 0),
(202, 163, 1, '', 0, '', 0, '0000-00-00', 0),
(203, 163, 2, '', 0, '', 0, '0000-00-00', 0),
(204, 164, 1, '', 0, '', 0, '0000-00-00', 0),
(205, 162, 1, '', 0, '', 0, '0000-00-00', 0),
(215, 165, 2, '', 15, 'dsfdsfsdfs', 15, '2004-04-20', 0),
(214, 165, 1, '', 1651, '651651651', 0, '2017-04-20', 0),
(220, 169, 1, '', 23, 'fasdfasdfas', 0, '2017-04-20', 0),
(225, 126, 1, 'fddfdf', 322, 'fdffd', 0, '2009-04-20', 0),
(233, 171, 1, 'fdgdfs', 15, 'sdfgsdfgsdfg', 15, '2009-04-20', 0),
(236, 173, 1, '', 0, '', 0, '0000-00-00', 0),
(237, 175, 1, '', 0, '', 0, '0000-00-00', 0),
(238, 172, 1, '', 0, '', 0, '0000-00-00', 0),
(240, 176, 1, '', 0, '', 0, '0000-00-00', 0),
(248, 177, 1, 'dfsdfdsfsdf', 25, 'fsdfsdfs', 15, '2010-07-20', 0),
(249, 177, 2, 'fuzzy toolbox pre PLC', 20, 'sdfsdfsdf', 0, '2011-07-20', 0),
(273, 179, 8, 'Ultimatne nic', 5000, 'Morbi a elementum est. Maecenas quam velit, blandit eget sapien in, volutpat tristique sapien. Quisque id nibh diam. Pellentesque at tincidunt odio, ut scelerisque arcu. Vestibulum euismod tincidunt varius. Donec tristique eros at fermentum posuere. Mauris rutrum nunc nec ultrices venenatis. Duis at nulla malesuada, porta odio aliquam, suscipit nibh. Nunc vehicula lorem tristique dui sollicitudin dignissim.', 5, '2028-02-20', 1),
(272, 179, 7, 'A uz naozaj neviem co sem', 500, 'Morbi a elementum est. Maecenas quam velit, blandit eget sapien in, volutpat tristique sapien. Quisque id nibh diam. Pellentesque at tincidunt odio, ut scelerisque arcu. Vestibulum euismod tincidunt varius. Donec tristique eros at fermentum posuere. Mauris rutrum nunc nec ultrices venenatis. Duis at nulla malesuada, porta odio aliquam, suscipit nibh. Nunc vehicula lorem tristique dui sollicitudin dignissim.', 50, '2031-10-20', 0),
(266, 179, 1, 'Podakovanie', 1, 'Za tuto odmenu Vam poslem osobne podakovanie za podporenie mojho projektu', 0, '0000-00-00', 4),
(267, 179, 2, 'Velke podakovanie ', 5, 'Za tuto odmenu Vam poslem osobne podakovanie za podporenie mojho projektu', 0, '0000-00-00', 1),
(268, 179, 3, 'Nieco uzitocne', 15, 'ZA tuto odmenu dostanete nieco strasne uzitocne co vam bude nanic', 0, '2031-08-20', 0),
(269, 179, 4, 'Nieco uzitocne 2', 30, 'ZA tuto odmenu dostanete nieco strasne uzitocne co vam bude aj na nieco. Mozno.', 0, '2030-09-20', 2),
(270, 179, 5, 'Pokracujeme', 50, 'Morbi a elementum est. Maecenas quam velit, blandit eget sapien in, volutpat tristique sapien. Quisque id nibh diam. Pellentesque at tincidunt odio, ut scelerisque arcu. Vestibulum euismod tincidunt varius. Donec tristique eros at fermentum posuere. Mauris rutrum nunc nec ultrices venenatis. Duis at nulla malesuada, porta odio aliquam, suscipit nibh. Nunc vehicula lorem tristique dui sollicitudin dignissim.', 150, '2006-09-20', 1),
(271, 179, 6, 'V neposlednom rade', 150, 'Morbi a elementum est. Maecenas quam velit, blandit eget sapien in, volutpat tristique sapien. Quisque id nibh diam. Pellentesque at tincidunt odio, ut scelerisque arcu. Vestibulum euismod tincidunt varius. Donec tristique eros at fermentum posuere. Mauris rutrum nunc nec ultrices venenatis. Duis at nulla malesuada, porta odio aliquam, suscipit nibh. Nunc vehicula lorem tristique dui sollicitudin dignissim.', 100, '2031-07-20', 9),
(284, 180, 2, 'picardove zelene', 25, 'picardov spenat je vynikajuca delikatesa', 0, '2024-09-20', 0),
(283, 180, 1, 'klingonske hnede', 10, 'klingonske hnede vino patri k tym najlepsim v galaxii', 15, '2010-07-20', 3),
(289, 182, 1, '', 4465, '', 0, '0000-00-00', 0),
(290, 184, 1, '', 0, '', 0, '0000-00-00', 0),
(291, 186, 1, '', 0, '', 0, '0000-00-00', 0),
(292, 187, 1, '', 0, '', 0, '0000-00-00', 1),
(302, 189, 2, 'cxcxvcvcx', 200, '42242424', 0, '2020-08-20', 0),
(301, 189, 1, 'fuzzy toolbox pre PLC', 25, '2542424', 0, '2014-08-20', 0),
(303, 189, 3, '', 0, '', 0, '0000-00-00', 0),
(307, 191, 1, 'svfdf', 1, 'fsdfsdf', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `df45s_backing`
--

CREATE TABLE IF NOT EXISTS `df45s_backing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL COMMENT 'ID of the project to which the donation belongs to',
  `backer_ID` int(11) NOT NULL COMMENT 'ID of the user backing the project specified in the project_ID collumns\n',
  `award_ID` int(11) NOT NULL COMMENT 'ID of the award for the selected projectID',
  `amount` double NOT NULL COMMENT 'amount of money ',
  `confirmed` tinyint(1) DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL,
  `paypal_invoice` varchar(150) NOT NULL,
  `invoice` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24950 ;

--
-- Dumping data for table `df45s_backing`
--

INSERT INTO `df45s_backing` (`ID`, `projectID`, `backer_ID`, `award_ID`, `amount`, `confirmed`, `time`, `type`, `paypal_invoice`, `invoice`) VALUES
(37, 179, 250, 266, 1, 1, '2014-07-23 08:40:20', 'paypal', '58R99848422753918', 0),
(38, 180, 250, 283, 10, 1, '2014-07-23 12:27:02', 'paypal', '7XH88154JH2079522', 0),
(39, 1790, 0, 273, 5000, 0, '2014-07-29 14:36:06', 'paypal', '5UT84565T95065614', 0),
(24863, 140, 250, 184, 26, 1, '2014-07-23 07:48:36', 'paypal', '6AU98549AU461530H', 0),
(24881, 179, 250, 267, 1000, 0, '2014-07-30 14:27:44', 'wire_trans', '', 0),
(24884, 179, 250, 267, 500, 0, '2014-07-30 14:29:23', 'wire_trans', '', 0),
(24885, 179, 250, 267, 500, 1, '2014-07-30 14:29:30', 'wire_trans', '', 0),
(24903, 179, 250, 267, 5, 0, '2014-07-30 14:47:05', 'wire_trans', '', 0),
(24904, 179, 250, 267, 5, 1, '2014-07-30 14:47:54', 'wire_trans', '', 0),
(24905, 179, 250, 267, 5, 0, '2014-07-30 14:48:06', 'wire_trans', '', 0),
(24906, 179, 250, 267, 5, 0, '2014-07-30 14:48:17', 'wire_trans', '', 0),
(24907, 179, 250, 267, 5, 0, '2014-07-30 14:50:48', 'wire_trans', '', 2147483647),
(24908, 179, 250, 267, 5, 0, '2014-07-30 14:51:46', 'wire_trans', '', 2147483647),
(24909, 179, 250, 267, 5, 0, '2014-07-30 14:52:14', 'wire_trans', '', 24909),
(24924, 179, 250, 266, 1.87, 1, '2014-08-01 08:11:56', 'wire_trans', '', 24924),
(24925, 179, 250, 266, 1.86, 0, '2014-08-01 08:12:24', 'wire_trans', '', 24925),
(24926, 179, 250, 266, 1.86, 0, '2014-08-01 08:13:23', 'wire_trans', '', 24926),
(24927, 179, 250, 271, 150, 1, '2014-08-02 17:18:05', 'wire_trans', '', 24927),
(24928, 179, 261, 270, 50, 1, '2014-08-04 13:58:55', 'wire_trans', '', 24928),
(24929, 179, 250, 273, 5000, 0, '2014-08-04 14:58:54', 'wire_trans', '', 24929),
(24930, 179, 250, 0, 1, 0, '2014-08-04 15:00:13', 'wire_trans', '', 24930),
(24931, 179, 250, 45444, 1, 0, '2014-08-04 15:00:27', 'wire_trans', '', 24931),
(24932, 179, 250, 77, 1, 0, '2014-08-04 15:00:33', 'wire_trans', '', 24932),
(24933, 179, 250, 77, 2278, 0, '2014-08-04 15:03:29', 'wire_trans', '', 24933),
(24934, 179, 250, 77, 2278.01, 0, '2014-08-04 15:03:42', 'wire_trans', '', 24934),
(24935, 179, 250, 271, 150, 0, '2014-08-05 06:23:20', 'wire_trans', '', 24935),
(24936, 179, 250, 271, 150, 0, '2014-08-05 06:23:24', 'wire_trans', '', 24936),
(24937, 179, 250, 271, 150, 0, '2014-08-05 06:23:27', 'wire_trans', '', 24937),
(24938, 179, 250, 271, 150, 0, '2014-08-05 06:24:40', 'wire_trans', '', 24938),
(24939, 179, 250, 271, 150, 0, '2014-08-05 06:25:55', 'wire_trans', '', 24939),
(24940, 179, 250, 271, 150, 0, '2014-08-05 06:28:23', 'wire_trans', '', 24940),
(24941, 179, 250, 271, 150, 0, '2014-08-05 06:28:37', 'wire_trans', '', 24941),
(24942, 180, 250, 283, 10, 0, '2014-08-07 16:35:32', 'wire_trans', '', 24942),
(24943, 180, 250, 283, 10, 0, '2014-08-14 05:35:57', 'wire_trans', '', 24943),
(24944, 179, 250, 269, 30, 0, '2014-08-19 16:46:22', 'wire_trans', '', 24944),
(24945, 179, 250, 267, 30, 0, '2014-08-19 16:46:59', 'wire_trans', '', 24945),
(24946, 187, 265, 292, 1, 0, '2014-09-07 14:07:51', 'wire_trans', '', 24946),
(24947, 141, 265, 181, 10, 0, '2014-09-27 08:54:41', 'wire_trans', '', 24947),
(24948, 140, 267, 0, 1, 0, '2014-10-06 08:50:15', 'wire_trans', '', 24948),
(24949, 140, 267, 0, 1.5, 0, '2014-10-06 08:52:39', 'wire_trans', '', 24949);

-- --------------------------------------------------------

--
-- Table structure for table `df45s_categories`
--

CREATE TABLE IF NOT EXISTS `df45s_categories` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `parent_ID` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `class` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `df45s_categories`
--

INSERT INTO `df45s_categories` (`ID`, `parent_ID`, `level`, `name`, `class`) VALUES
(1, 0, 1, 'Všetko', 'fa fa-globe'),
(34, 0, 1, 'Umenie', 'fa fa-tachometer'),
(35, 0, 1, 'Film', 'fa fa-video-camera'),
(36, 0, 1, 'Hudba', 'fa fa-music'),
(37, 0, 1, 'Technológie', 'fa fa-laptop'),
(38, 0, 1, 'Fotografia', 'fa fa-camera'),
(39, 0, 1, 'Literatúra', 'fa fa-book'),
(40, 0, 1, 'Šport', 'fa fa-trophy'),
(41, 0, 1, 'Hry', 'fa fa-gamepad'),
(42, 0, 1, 'Design', 'fa fa-eye'),
(43, 0, 1, 'Jedlo', 'fa fa-cutlery'),
(44, 0, 1, 'Móda', 'fa fa-suitcase');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_comments`
--

CREATE TABLE IF NOT EXISTS `df45s_comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_to` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` mediumtext CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46 ;

--
-- Dumping data for table `df45s_comments`
--

INSERT INTO `df45s_comments` (`ID`, `project_id`, `user_id`, `reply_to`, `created`, `comment`) VALUES
(30, 140, 250, NULL, '2014-06-26 10:24:29', 'fsdfasdfadsf\nsda\n\nasd'),
(31, 140, 250, NULL, '2014-06-26 10:28:12', 'My new comment\n\nAnd a new line\n\nAnd another two will follow\n\n\nVS'),
(32, 140, 250, NULL, '2014-06-26 10:36:27', '                     dlkjflfk dldfk jldkfj ldkjf lsdf sdf s'),
(33, 140, 250, NULL, '2014-06-27 06:58:15', 'dsfasdf g fdg sdfg'),
(34, 140, 250, NULL, '2014-07-21 09:34:24', 'gfhhd fgh dfgh dgh df h'),
(35, 140, 250, NULL, '2014-07-21 09:34:33', 'wwwwwwwwwwwwwwwwwwwwwwwwwwww'),
(36, 140, 259, NULL, '2014-07-23 09:58:12', 'sdjfnskdjfnsdf sd fklsld fks'),
(37, 140, 259, NULL, '2014-07-23 09:58:34', 'salsalaslasl'),
(38, 140, 259, NULL, '2014-07-23 09:58:42', 'asdasd'),
(39, 180, 250, NULL, '2014-07-23 12:27:58', 'Dam si jedno klingonske hnede'),
(40, 179, 250, NULL, '2014-08-01 08:19:51', 'Pridavam prvy komentar'),
(41, 179, 250, NULL, '2014-08-01 08:36:16', 'Dalsia novinka'),
(42, 180, 267, NULL, '2014-10-06 08:32:19', 'fafgsdfasdf'),
(43, 180, 267, NULL, '2014-10-06 08:32:28', 'asdasd'),
(44, 180, 267, NULL, '2014-10-06 08:32:30', 'asd'),
(45, 180, 267, NULL, '2014-10-06 08:32:32', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_login_attempts`
--

CREATE TABLE IF NOT EXISTS `df45s_login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `df45s_messages`
--

CREATE TABLE IF NOT EXISTS `df45s_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `subject` text COLLATE utf8_bin NOT NULL,
  `message` mediumtext COLLATE utf8_bin NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `sent_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sent_ip` varchar(45) COLLATE utf8_bin NOT NULL,
  `read_ip` varchar(45) COLLATE utf8_bin NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `thread` int(11) NOT NULL,
  `reaply_to` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=70 ;

--
-- Dumping data for table `df45s_messages`
--

INSERT INTO `df45s_messages` (`id`, `from_user`, `to_user`, `subject`, `message`, `read_status`, `sent_time`, `read_time`, `sent_ip`, `read_ip`, `deleted`, `thread`, `reaply_to`) VALUES
(4, 250, 250, 'dsffdadsffdas', 'dfsfdsddfsdfsdfs', 1, '2014-06-27 12:42:39', '2014-08-19 17:27:38', '159.157.209.2', '78.129.168.247', 0, 2, 0),
(5, 252, 250, 'fdfdfds', 'fdsdfsdfsd', 1, '2014-06-27 12:45:07', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(6, 252, 250, 'Pocuvaj ma sem', 'Toto je sprva blalbal ophladom projektu blablabla', 1, '2014-06-30 06:47:27', '2014-09-09 11:30:20', '159.157.209.2', '159.157.209.2', 0, 4, 0),
(7, 250, 252, 'Hollaaa', 'Posielam spravu', 1, '2014-06-30 09:25:00', '2014-06-30 19:04:19', '159.157.209.2', '85.135.175.204', 0, 5, 0),
(8, 250, 252, 'Hollaaa', 'dfdfsasdafsf adsf dsaf asd', 1, '2014-06-30 09:26:01', '2014-09-09 11:29:25', '159.157.209.2', '159.157.209.2', 0, 6, 0),
(9, 250, 252, 'sdjdshkjsdh', 'fdkjhdfdfkjdfshdfskj fjk  fskj hfkdsf', 1, '2014-06-30 09:47:16', '2014-09-09 11:29:24', '159.157.209.2', '159.157.209.2', 0, 7, 0),
(10, 250, 252, 'fdsdfgsfdgdsf', 'dsdffsd fadsfasdf zsd fadfas', 1, '2014-06-30 09:57:17', '2014-06-30 19:04:21', '159.157.209.2', '85.135.175.204', 0, 8, 0),
(11, 252, 250, 'kossfidshkl', '	djk hks dkjhf ksjfh dskjfh sdkj sdf sdf sd', 1, '2014-06-30 12:45:41', '2014-09-09 11:30:19', '159.157.209.2', '159.157.209.2', 0, 9, 0),
(12, 252, 250, 'dsadasd', 'Sed mollis, arcu non laoreet pellentesque, diam neque gravida felis, ut accumsan mi orci ac nunc. Nullam porta sodales mauris, quis feugiat purus ultrices rutrum. Proin mattis dolor sit amet justo interdum adipiscing. Aliquam ac velit ultrices, molestie augue a, sollicitudin erat. Morbi vel orci lobortis felis ullamcorper placerat. Duis eu purus eu augue vestibulum egestas. Fusce id leo mauris. Vestibulum at fermentum nulla. Donec id mollis ligula, a pellentesque ipsum. Nunc mauris elit, rhoncus id tincidunt iaculis, tempus eu nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac lacinia magna. Curabitur hendrerit scelerisque tellus. Curabitur sed metus fringilla, aliquam nisl et, vestibulum odio. Phasellus suscipit risus faucibus leo vestibulum ultrices.\n\nQuisque ullamcorper nulla sit amet libero dapibus luctus. Praesent dignissim quam a eros bibendum, vitae ultrices arcu interdum. Morbi malesuada nulla turpis, eu elementum urna consequat sit amet. Suspendisse potenti. Phasellus lobortis purus interdum risus dictum consequat. Curabitur mollis neque a erat pulvinar commodo. Morbi tellus orci, placerat sed faucibus vitae, bibendum nec elit. Sed imperdiet justo hendrerit tellus venenatis, congue malesuada ante sodales. Ut feugiat leo at dolor consequat fermentum. Quisque a felis vel neque malesuada pellentesque.\n\nSed dapibus bibendum risus. Ut lobortis purus orci, sed posuere neque iaculis vitae. Aliquam suscipit mi fermentum neque porttitor, eu porta lacus sollicitudin. Vivamus a eros eu ante tristique feugiat et et justo. Morbi eu ipsum convallis, interdum felis vitae, elementum dui. Praesent luctus a est ut semper. Aenean ut condimentum augue, molestie vulputate metus. Vestibulum ullamcorper leo lectus, vitae dictum nunc hendrerit quis. Maecenas pellentesque est vel sollicitudin aliquam.\n\nCurabitur in convallis massa, non ornare odio. Aliquam massa lectus, commodo a tortor sed, convallis ultricies erat. Nulla eget tellus vel odio lobortis tempus. Aliquam pulvinar elit quis augue mollis commodo. Morbi tempor sagittis lorem, sed iaculis elit. Aenean interdum turpis dolor, ut dignissim est laoreet id. Aliquam et cursus nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam erat volutpat. Nam pulvinar a purus nec interdum.\n\nInteger commodo, massa ac faucibus malesuada, nunc enim tincidunt lacus, vitae congue massa enim vitae odio. Fusce vitae consequat tellus. Aenean feugiat, dui ut consectetur pulvinar, arcu tortor luctus quam, vita', 1, '2014-06-30 12:46:06', '2014-09-09 11:30:14', '159.157.209.2', '159.157.209.2', 0, 10, 0),
(13, 252, 250, 'fdsfdadafsdfasfad a fss adf adfs fads', 'Sed mollis, arcu non laoreet pellentesque, diam neque gravida felis, ut accumsan mi orci ac nunc. Nullam porta sodales mauris, quis feugiat purus ultrices rutrum. Proin mattis dolor sit amet justo interdum adipiscing. Aliquam ac velit ultrices, molestie augue a, sollicitudin erat. Morbi vel orci lobortis felis ullamcorper placerat. Duis eu purus eu augue vestibulum egestas. Fusce id leo mauris. Vestibulum at fermentum nulla. Donec id mollis ligula, a pellentesque ipsum. Nunc mauris elit, rhoncus id tincidunt iaculis, tempus eu nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac lacinia magna. Curabitur hendrerit scelerisque tellus. Curabitur sed metus fringilla, aliquam nisl et, vestibulum odio. Phasellus suscipit risus faucibus leo vestibulum ultrices.\n\nQuisque ullamcorper nulla sit amet libero dapibus luctus. Praesent dignissim quam a eros bibendum, vitae ultrices arcu interdum. Morbi malesuada nulla turpis, eu elementum urna consequat sit amet. Suspendisse potenti. Phasellus lobortis purus interdum risus dictum consequat. Curabitur mollis neque a erat pulvinar commodo. Morbi tellus orci, placerat sed faucibus vitae, bibendum nec elit. Sed imperdiet justo hendrerit tellus venenatis, congue malesuada ante sodales. Ut feugiat leo at dolor consequat fermentum. Quisque a felis vel neque malesuada pellentesque.\n\nSed dapibus bibendum risus. Ut lobortis purus orci, sed posuere neque iaculis vitae. Aliquam suscipit mi fermentum neque porttitor, eu porta lacus sollicitudin. Vivamus a eros eu ante tristique feugiat et et justo. Morbi eu ipsum convallis, interdum felis vitae, elementum dui. Praesent luctus a est ut semper. Aenean ut condimentum augue, molestie vulputate metus. Vestibulum ullamcorper leo lectus, vitae dictum nunc hendrerit quis. Maecenas pellentesque est vel sollicitudin aliquam.\n\nCurabitur in convallis massa, non ornare odio. Aliquam massa lectus, commodo a tortor sed, convallis ultricies erat. Nulla eget tellus vel odio lobortis tempus. Aliquam pulvinar elit quis augue mollis commodo. Morbi tempor sagittis lorem, sed iaculis elit. Aenean interdum turpis dolor, ut dignissim est laoreet id. Aliquam et cursus nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam erat volutpat. Nam pulvinar a purus nec interdum.\n\nInteger commodo, massa ac faucibus malesuada, nunc enim tincidunt lacus, vitae congue massa enim vitae odio. Fusce vitae consequat tellus. Aenean feugiat, dui ut consectetur pulvinar, arcu tortor luctus quam, vita', 1, '2014-06-30 12:46:13', '2014-09-09 11:30:13', '159.157.209.2', '159.157.209.2', 0, 11, 0),
(14, 252, 250, 'fasdfadsf asdf asdfadf adsf ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam leo, consequat quis tortor pulvinar, sagittis venenatis enim. Sed mollis, arcu non laoreet pellentesque, diam neque gravida felis, ut accumsan mi orci ac nunc. Nullam porta sodales mauris, quis feugiat purus ultrices rutrum. Proin mattis dolor sit amet justo interdum adipiscing. Aliquam ac velit ultrices, molestie augue a, sollicitudin erat. Morbi vel orci lobortis felis ullamcorper placerat. Duis eu purus eu augue vestibulum egestas. Fusce id leo mauris. Vestibulum at fermentum nulla. Donec id mollis ligula, a pellentesque ipsum. Nunc mauris elit, rhoncus id tincidunt iaculis, tempus eu nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac lacinia magna. Curabitur hendrerit scelerisque tellus. Curabitur sed metus fringilla, aliquam nisl et, vestibulum odio. Phasellus suscipit risus faucibus leo vestibulum ultrices.\n\nQuisque ullamcorper nulla sit amet libero dapibus luctus. Praesent dignissim quam a eros bibendum, vitae ultrices arcu interdum. Morbi malesuada nulla turpis, eu elementum urna consequat sit amet. Suspendisse potenti. Phasellus lobortis purus interdum risus dictum consequat. Curabitur mollis neque a erat pulvinar commodo. Morbi tellus orci, placerat sed faucibus vitae, bibendum nec elit. Sed imperdiet justo hendrerit tellus venenatis, congue malesuada ante sodales. Ut feugiat leo at dolor consequat fermentum. Quisque a felis vel neque malesuada pellentesque.\n\nSed dapibus bibendum risus. Ut lobortis purus orci, sed posuere neque iaculis vitae. Aliquam suscipit mi fermentum neque porttitor, eu porta lacus sollicitudin. Vivamus a eros eu ante tristique feugiat et et justo. Morbi eu ipsum convallis, interdum felis vitae, elementum dui. Praesent luctus a est ut semper. Aenean ut condimentum augue, molestie vulputate metus. Vestibulum ullamcorper leo lectus, vitae dictum nunc hendrerit quis. Maecenas pellentesque est vel sollicitudin aliquam.\n\nCurabitur in convallis massa, non ornare odio. Aliquam massa lectus, commodo a tortor sed, convallis ultricies erat. Nulla eget tellus vel odio lobortis tempus. Aliquam pulvinar elit quis augue mollis commodo. Morbi tempor sagittis lorem, sed iaculis elit. Aenean interdum turpis dolor, ut dignissim est laoreet id. Aliquam et cursus nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam erat volutpat. Nam pulvinar a purus nec interdum.\n\nInteger commodo, massa ac faucibus malesuada, nunc enim tincidunt lacus, vitae congue massa enim vitae odio. Fusce vitae consequat tellus. Aenean feugiat, dui ut consectetur pulvinar, arcu tortor luctus quam, vitae adipiscing elit magna vel velit. Nullam dui enim, vehicula a malesuada eu, auctor ut leo. Etiam et turpis eget neque imperdiet vehicula. Ut id luctus lacus. Vestibulum iaculis enim porttitor leo varius, at dapibus mauris vulputate. Vestibulum porta tincidunt convallis. Vestibulum pulvinar ornare lectus sed fermentum. Fusce adipiscing, enim in vulputate convallis, nunc turpis rutrum libero, imperdiet auctor eros eros sit amet neque. Maecenas eu massa eget nisl tincidunt fringilla sit amet in urna. Duis mattis, erat vitae euismod congue, turpis nisi lacinia nulla, in sollicitudin justo justo in enim. Nulla quis viverra massa, in dictum erat. Fusce aliquam est at blandit auctor. Mauris vitae viverra magna. Pellentesque justo ante, interdum vitae tellus nec, ultrices facilisis neque.\n\nVygenerovaných bolo 5 odstavcov, 502 slov, 3', 1, '2014-06-30 12:46:22', '2014-09-09 11:30:12', '159.157.209.2', '159.157.209.2', 0, 12, 0),
(15, 252, 250, 'fdsfdsfa sdf dsfasdf ', 'Proin luctus, sapien et ullamcorper sagittis, felis enim ultricies sapien, et condimentum magna ante vel massa. Mauris gravida purus id hendrerit tristique. Sed et scelerisque felis. Integer in purus eu enim posuere malesuada vel ultrices neque. Maecenas lobortis interdum enim ut cursus. Proin condimentum felis ut mi consectetur consectetur. Donec adipiscing varius volutpat. Nulla nibh tellus, convallis et vulputate in, ullamcorper nec nulla. Sed viverra ornare quam, at euismod nibh lacinia in. Aliquam at risus quis metus pellentesque hendrerit rutrum id arcu. Donec in neque ornare, rutrum velit non, iaculis augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin ullamcorper, lacus sed auctor auctor, enim nunc rutrum velit, quis porta enim velit eget erat. Ut non nisl vel quam sodales commodo. Maecenas fringilla leo tortor.\n\nPraesent ultrices pharetra mi, id porttitor risus tristique ac. Sed mattis tortor vitae sapien faucibus, et elementum sem facilisis. Nunc interdum faucibus commodo. Mauris viverra mollis orci eu tincidunt. Praesent nec viverra tortor. Donec euismod lectus sed accumsan laoreet. Quisque porttitor nisi nec risus tincidunt, egestas hendrerit leo porta.\n\nNam blandit elit id risus sollicitudin, sit amet interdum velit mollis. Nulla tempus felis at nunc suscipit, vitae malesuada velit euismod. Phasellus eros risus, interdum vel est eu, condimentum tempus lacus. Vestibulum blandit mattis eros, et pulvinar ante placerat vel. Duis rutrum tortor at ullamcorper consectetur. Etiam lobortis condimentum felis, ac varius quam mollis eu. Duis nibh eros, tempus sed tempus sed, scelerisque eget risus. Proin eleifend ornare lectus, porta aliquam ipsum tempor sed. Vivamus vel placerat velit, nec euismod dolor. Quisque non dui ut nibh eleifend euismod. Phasellus et blandit tortor, nec faucibus tortor. Proin tempus mi egestas, condimentum leo vitae, pretium orci. Aliquam mattis enim a erat vulputate, eu ultricies sem aliquam.\n\nQuisque porta est vel turpis dignissim imperdiet. Sed pulvinar lectus lacus. Etiam lacus tellus, molestie id suscipit nec, bibendum et risus. Quisque quis pulvinar quam. Ut mattis ornare lorem, mattis.', 1, '2014-06-30 12:46:47', '2014-09-09 11:30:11', '159.157.209.2', '159.157.209.2', 0, 13, 0),
(16, 257, 250, 'Predmet...', 'Proin luctus, sapien et ullamcorper sagittis, felis enim ultricies sapien, et condimentum magna ante vel massa. Mauris gravida purus id hendrerit tristique. Sed et scelerisque felis. Integer in purus eu enim posuere malesuada vel ultrices neque. Maecenas lobortis interdum enim ut cursus. Proin condimentum felis ut mi consectetur consectetur. Donec adipiscing varius volutpat. Nulla nibh tellus, convallis et vulputate in, ullamcorper nec nulla. Sed viverra ornare quam, at euismod nibh lacinia in. Aliquam at risus quis metus pellentesque hendrerit rutrum id arcu. Donec in neque ornare, rutrum velit non, iaculis augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin ullamcorper, lacus sed auctor auctor, enim nunc rutrum velit, quis porta enim velit eget erat. Ut non nisl vel quam sodales commodo. Maecenas fringilla leo tortor.\n\nPraesent ultrices pharetra mi, id porttitor risus tristique ac. Sed mattis tortor vitae sapien faucibus, et elementum sem facilisis. Nunc interdum faucibus commodo. Mauris viverra mollis orci eu tincidunt. Praesent nec viverra tortor. Donec euismod lectus sed accumsan laoreet. Quisque porttitor nisi nec risus tincidunt, egestas hendrerit leo porta.\n\nNam blandit elit id risus sollicitudin, sit amet interdum velit mollis. Nulla tempus felis at nunc suscipit, vitae malesuada velit euismod. Phasellus eros risus, interdum vel est eu, condimentum tempus lacus. Vestibulum blandit mattis eros, et pulvinar ante placerat vel. Duis rutrum tortor at ullamcorper consectetur. Etiam lobortis condimentum felis, ac varius quam mollis eu. Duis nibh eros, tempus sed tempus sed, scelerisque eget risus. Proin eleifend ornare lectus, porta aliquam ipsum tempor sed. Vivamus vel placerat velit, nec euismod dolor. Quisque non dui ut nibh eleifend euismod. Phasellus et blandit tortor, nec faucibus tortor. Proin tempus mi egestas, condimentum leo vitae, pretium orci. Aliquam mattis enim a erat vulputate, eu ultricies sem aliquam.\n\nQuisque porta est vel turpis dignissim imperdiet. Sed pulvinar lectus lacus. Etiam lacus tellus, molestie id suscipit nec, bibendum et risus. Quisque quis pulvinar quam. Ut mattis ornare lorem, mattis.', 1, '2014-06-30 12:46:54', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(17, 252, 250, 'dfsfds', 'ds Proin luctus, sapien et ullamcorper sagittis, felis enim ultricies sapien, et condimentum magna ante vel massa. Mauris gravida purus id hendrerit tristique. Sed et scelerisque felis. Integer in purus eu enim posuere malesuada vel ultrices neque. Maecenas lobortis interdum enim ut cursus. Proin condimentum felis ut mi consectetur consectetur. Donec adipiscing varius volutpat. Nulla nibh tellus, convallis et vulputate in, ullamcorper nec nulla. Sed viverra ornare quam, at euismod nibh lacinia in. Aliquam at risus quis metus pellentesque hendrerit rutrum id arcu. Donec in neque ornare, rutrum velit non, iaculis augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin ullamcorper, lacus sed auctor auctor, enim nunc rutrum velit, quis porta enim velit eget erat. Ut non nisl vel quam sodales commodo. Maecenas fringilla leo tortor.\n\nPraesent ultrices pharetra mi, id porttitor risus tristique ac. Sed mattis tortor vitae sapien faucibus, et elementum sem facilisis. Nunc interdum faucibus commodo. Mauris viverra mollis orci eu tincidunt. Praesent nec viverra tortor. Donec euismod lectus sed accumsan laoreet. Quisque porttitor nisi nec risus tincidunt, egestas hendrerit leo porta.\n\nNam blandit elit id risus sollicitudin, sit amet interdum velit mollis. Nulla tempus felis at nunc suscipit, vitae malesuada velit euismod. Phasellus eros risus, interdum vel est eu, condimentum tempus lacus. Vestibulum blandit mattis eros, et pulvinar ante placerat vel. Duis rutrum tortor at ullamcorper consectetur. Etiam lobortis condimentum felis, ac varius quam mollis eu. Duis nibh eros, tempus sed tempus sed, scelerisque eget risus. Proin eleifend ornare lectus, porta aliquam ipsum tempor sed. Vivamus vel placerat velit, nec euismod dolor. Quisque non dui ut nibh eleifend euismod. Phasellus et blandit tortor, nec faucibus tortor. Proin tempus mi egestas, condimentum leo vitae, pretium orci. Aliquam mattis enim a erat vulputate, eu ultricies sem aliquam.\n\nQuisque porta est vel turpis dignissim imperdiet. Sed pulvinar lectus lacus. Etiam lacus tellus, molestie id suscipit nec, bibendum et risus. Quisque quis pulvinar quam. Ut mattis ornare lorem, mattis.', 1, '2014-06-30 12:46:59', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(18, 252, 250, 'Predmet...', 'Proin luctus, sapien et ullamcorper sagittis, felis enim ultricies sapien, et condimentum magna ante vel massa. Mauris gravida purus id hendrerit tristique. Sed et scelerisque felis. Integer in purus eu enim posuere malesuada vel ultrices neque. Maecenas lobortis interdum enim ut cursus. Proin condimentum felis ut mi consectetur consectetur. Donec adipiscing varius volutpat. Nulla nibh tellus, convallis et vulputate in, ullamcorper nec nulla. Sed viverra ornare quam, at euismod nibh lacinia in. Aliquam at risus quis metus pellentesque hendrerit rutrum id arcu. Donec in neque ornare, rutrum velit non, iaculis augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin ullamcorper, lacus sed auctor auctor, enim nunc rutrum velit, quis porta enim velit eget erat. Ut non nisl vel quam sodales commodo. Maecenas fringilla leo tortor.\n\nPraesent ultrices pharetra mi, id porttitor risus tristique ac. Sed mattis tortor vitae sapien faucibus, et elementum sem facilisis. Nunc interdum faucibus commodo. Mauris viverra mollis orci eu tincidunt. Praesent nec viverra tortor. Donec euismod lectus sed accumsan laoreet. Quisque porttitor nisi nec risus tincidunt, egestas hendrerit leo porta.\n\nNam blandit elit id risus sollicitudin, sit amet interdum velit mollis. Nulla tempus felis at nunc suscipit, vitae malesuada velit euismod. Phasellus eros risus, interdum vel est eu, condimentum tempus lacus. Vestibulum blandit mattis eros, et pulvinar ante placerat vel. Duis rutrum tortor at ullamcorper consectetur. Etiam lobortis condimentum felis, ac varius quam mollis eu. Duis nibh eros, tempus sed tempus sed, scelerisque eget risus. Proin eleifend ornare lectus, porta aliquam ipsum tempor sed. Vivamus vel placerat velit, nec euismod dolor. Quisque non dui ut nibh eleifend euismod. Phasellus et blandit tortor, nec faucibus tortor. Proin tempus mi egestas, condimentum leo vitae, pretium orci. Aliquam mattis enim a erat vulputate, eu ultricies sem aliquam.\n\nQuisque porta est vel turpis dignissim imperdiet. Sed pulvinar lectus lacus. Etiam lacus tellus, molestie id suscipit nec, bibendum et risus. Quisque quis pulvinar quam. Ut mattis ornare lorem, mattis.', 1, '2014-06-30 12:47:06', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(19, 250, 252, 'Hola nyomi', 'balbdsladlsjil asdilf jalksdfjas', 1, '2014-06-30 19:03:48', '2014-09-09 11:29:23', '85.135.175.204', '159.157.209.2', 0, 16, 0),
(20, 250, 252, 'dfsfds', 'This is the first reply', 1, '2014-07-01 07:21:46', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(21, 250, 252, 'dsadasd', 'Trjndlk fdsf asfdsdf sdf sadf sd fa', 1, '2014-07-01 07:23:51', '2014-09-09 11:30:14', '159.157.209.2', '159.157.209.2', 0, 10, 0),
(22, 250, 257, 'Predmet...', 'nieconieco', 1, '2014-07-15 07:25:50', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(23, 250, 252, 'Pocuvaj ma sem', 'dfdg g f fgdsf gsdf g dfgds', 1, '2014-07-21 09:35:48', '2014-09-09 11:30:20', '159.157.209.2', '159.157.209.2', 0, 4, 0),
(24, 250, 252, 'Pocuvaj ma sem', 'dfdg g f fgdsf gsdf g dfgds', 1, '2014-07-21 09:35:52', '2014-09-09 11:30:20', '159.157.209.2', '159.157.209.2', 0, 4, 0),
(25, 259, 250, 'sdfsdfsdf', 'asdasdasdasdasd', 1, '2014-07-23 09:57:49', '2014-08-19 17:27:32', '217.118.110.123', '78.129.168.247', 0, 17, 0),
(26, 250, 259, 'asdf', 'asdfasdf picardov spenat asdfasdf', 0, '2014-07-23 12:36:37', '0000-00-00 00:00:00', '159.157.209.2', '', 0, 18, 0),
(27, 250, 259, 'sdfsdfsdf', 'kurva teraz tak pozeram ze mozno by bolo dobre vediet k akemu projektu ta sprava prisla lebo tu mam len kedy a od koho.', 1, '2014-07-23 12:37:26', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(28, 250, 259, 'sdfsdfsdf', 'inak spravy su tiez este under construction', 1, '2014-07-23 12:38:03', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(29, 250, 252, 'xcvcxvxcv', 'xcvxcvxcvc ccxv vcxvv ', 1, '2014-07-28 19:36:16', '2014-09-09 11:29:22', '85.135.159.161', '159.157.209.2', 0, 19, 0),
(30, 250, 259, 'sdfsdfsdf', 'Odpoved', 1, '2014-07-31 12:14:51', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(31, 250, 259, 'sdfsdfsdf', 'dalsia odpoved', 1, '2014-07-31 12:18:10', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(32, 250, 259, 'sdfsdfsdf', 'dalsia odpoved', 1, '2014-07-31 12:20:26', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(33, 250, 257, 'Predmet...', '123456', 1, '2014-07-31 12:36:27', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(34, 250, 257, 'Predmet...', '123456', 1, '2014-07-31 12:37:28', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(35, 250, 257, 'Predmet...', '123456', 1, '2014-07-31 12:37:45', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(36, 250, 257, 'Predmet...', '123456', 1, '2014-07-31 12:37:59', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(37, 250, 257, 'Predmet...', '123456', 1, '2014-07-31 12:38:55', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(38, 250, 257, '', '123456', 1, '2014-07-31 12:39:13', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(39, 250, 257, '', '123456', 1, '2014-07-31 12:39:26', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(40, 250, 257, '', '123456//*', 1, '2014-07-31 12:39:35', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(41, 250, 252, '', 'gdgfgd', 1, '2014-07-31 12:40:59', '2014-09-09 11:30:12', '159.157.209.2', '159.157.209.2', 0, 12, 0),
(42, 250, 252, '', 'lkjfd sdlkfjg skfdg jslkfdjg ', 1, '2014-07-31 12:41:11', '2014-09-09 11:30:12', '159.157.209.2', '159.157.209.2', 0, 12, 0),
(43, 250, 259, '', 'lkjfd sdlkfjg skfdg jslkfdjg ', 1, '2014-07-31 12:44:18', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(44, 250, 259, '', 'lkjfd sdlkfjg skfdg jslkfdjg ', 1, '2014-07-31 12:44:24', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(45, 250, 259, '', 'lkjfd sdlkfjg skfdg jslkfdjg ', 1, '2014-07-31 12:44:26', '2014-08-19 17:27:32', '159.157.209.2', '78.129.168.247', 0, 17, 0),
(46, 250, 257, 'Predmet...', 'bbvcbvcvb', 1, '2014-07-31 12:46:28', '2014-08-19 16:50:09', '159.157.209.2', '85.135.223.168', 0, 15, 0),
(47, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:40', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(48, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:44', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(49, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:44', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(50, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:45', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(51, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:47', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(52, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:50', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(53, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:51', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(54, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:51', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(55, 250, 252, 'fdfdfds', 'bbvcbvcvb', 1, '2014-07-31 12:47:53', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(56, 250, 252, '', 'bbvcbvcvb', 1, '2014-07-31 12:47:58', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(57, 250, 252, '', 'bbvcbvcvb', 1, '2014-07-31 12:48:00', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(58, 250, 252, '', 'bbvcbvcvb', 1, '2014-07-31 12:48:02', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(59, 250, 252, '', 'bbvcbvcvb', 1, '2014-07-31 12:48:07', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(60, 250, 252, '', 'bbvcbvcvb', 1, '2014-07-31 12:48:13', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(61, 250, 252, 'fasdfadsf asdf asdfadf adsf', 'hgfdhg hfg hdf ghfgh ', 1, '2014-07-31 12:50:35', '2014-09-09 11:30:12', '159.157.209.2', '159.157.209.2', 0, 12, 0),
(62, 250, 252, 'fasdfadsf asdf asdfadf adsf', 'ytrye ytyr  trt yyrte', 1, '2014-07-31 12:50:51', '2014-09-09 11:30:12', '159.157.209.2', '159.157.209.2', 0, 12, 0),
(63, 252, 250, 'fdfdfds', 'sdhcx kvjhdfkjgdfgd fg ', 1, '2014-08-19 16:48:51', '2014-09-09 11:30:21', '85.135.223.168', '159.157.209.2', 0, 3, 0),
(64, 252, 250, 'fdfdfds', 'fdfg fdgdf g', 1, '2014-08-19 16:48:55', '2014-09-09 11:30:21', '85.135.223.168', '159.157.209.2', 0, 3, 0),
(65, 252, 250, 'fdfdfds', '321321321321321', 1, '2014-08-19 16:49:03', '2014-09-09 11:30:21', '85.135.223.168', '159.157.209.2', 0, 3, 0),
(66, 252, 252, 'Pocuvaj ma sem', 'xzkjh kfdjsh kfjhsdkjfh ksdjfh sdf sdf ', 1, '2014-08-19 16:49:43', '2014-09-09 11:30:20', '85.135.223.168', '159.157.209.2', 0, 4, 0),
(67, 252, 252, 'fdfdfds', 'fdgs fdg sfdg sdf gsdf gsfdgsdgf sdfg sdf g', 1, '2014-09-09 11:29:40', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(68, 252, 252, 'fdfdfds', '+++++++++++++++++++++++++++++++++++++++++++++  ++++++++++++++++++++++++++++', 1, '2014-09-09 11:29:47', '2014-09-09 11:30:21', '159.157.209.2', '159.157.209.2', 0, 3, 0),
(69, 267, 250, 'sdfsadf', 'sdffffff', 0, '2014-10-06 08:33:24', '0000-00-00 00:00:00', '78.141.105.244', '', 0, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `df45s_notifications`
--

CREATE TABLE IF NOT EXISTS `df45s_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `new_pr_added` tinyint(1) NOT NULL COMMENT 'Pridanie nového projektu',
  `best_of_the_week` tinyint(1) NOT NULL COMMENT 'Najelšie projekty za uplynulý týždeň ',
  `news_added` tinyint(1) NOT NULL COMMENT 'Pridaná novinka k podporenému projektu',
  `project_backed` tinyint(1) NOT NULL COMMENT 'Príspevok na Váš projekt',
  `comment_added` tinyint(1) NOT NULL COMMENT 'Komentár na Váš projekt',
  `new_message` tinyint(1) NOT NULL COMMENT 'Nová správa',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `df45s_notifications`
--

INSERT INTO `df45s_notifications` (`id`, `user_id`, `new_pr_added`, `best_of_the_week`, `news_added`, `project_backed`, `comment_added`, `new_message`) VALUES
(1, 250, 1, 0, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `df45s_projects`
--

CREATE TABLE IF NOT EXISTS `df45s_projects` (
  `projectID` int(11) NOT NULL AUTO_INCREMENT,
  `project_image` varchar(1000) COLLATE utf8_bin NOT NULL,
  `project_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `project_category` int(10) NOT NULL,
  `project_location` varchar(255) COLLATE utf8_bin NOT NULL,
  `project_duration` datetime NOT NULL,
  `pledge_amount` int(10) NOT NULL,
  `short_description` varchar(2000) COLLATE utf8_bin NOT NULL,
  `project_video` varchar(1500) COLLATE utf8_bin NOT NULL,
  `project_description` mediumtext COLLATE utf8_bin NOT NULL,
  `project_chalanges` mediumtext COLLATE utf8_bin NOT NULL,
  `project_faq` mediumtext COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL,
  `user_type` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  `finish_date` date NOT NULL,
  `views` int(11) NOT NULL,
  `coments` text COLLATE utf8_bin NOT NULL,
  `news` text COLLATE utf8_bin NOT NULL,
  `terms_accepted` tinyint(1) NOT NULL,
  `last_page_filled` int(11) NOT NULL,
  `award_count` int(11) NOT NULL,
  `submited` int(11) DEFAULT '0',
  PRIMARY KEY (`projectID`),
  UNIQUE KEY `ID` (`projectID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=192 ;

--
-- Dumping data for table `df45s_projects`
--

INSERT INTO `df45s_projects` (`projectID`, `project_image`, `project_title`, `project_category`, `project_location`, `project_duration`, `pledge_amount`, `short_description`, `project_video`, `project_description`, `project_chalanges`, `project_faq`, `userID`, `approved`, `create_date`, `status`, `user_type`, `statusID`, `finish_date`, `views`, `coments`, `news`, `terms_accepted`, `last_page_filled`, `award_count`, `submited`) VALUES
(125, 'Penguins.jpg', 'Dalsi prijekt', 34, '', '2014-05-15 11:11:28', 1000, 'Aenean metus lacus, porta at ligula a, feugiat hendrerit augue. Praesent nibh augue, rhoncus vitae elementum eu, dignissim sed nulla. Duis condimentum vitae massa non tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc euismod amet.\n', '', '', '', '', 250, 0, '2014-03-18 06:48:17', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(126, 'Hydrangeas.jpg', 'Ked tak uz', 44, '', '2014-05-29 14:51:38', 7500, 'Ut enim urna, ullamcorper at rutrum vitae, dictum eu velit. Integer auctor dui ac mauris mattis, a tincidunt quam convallis. Integer venenatis dolor erat, sit amet scelerisque sapien ultricies at. Nam eu posuere nisi, rutrum vestibulum enim. Vivamus eu lacus a leo egestas massa nunc.\n', '', '', '', '', 250, 0, '2014-03-18 07:09:47', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(140, 'Desert.jpg', 'Test projekt', 34, '', '2015-05-06 11:11:28', 5000, 'Sem by mal prist kratky popis projektu. Potrebujete poradiť?\nPozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', '', '&lt;h1&gt;&lt;strong&gt;What is the Kyub? &amp;nbsp;&lt;/strong&gt;&lt;/h1&gt;\n\n&lt;p&gt;The Kyub is a maker friendly, open source MIDI keyboard that provides a new window to musical performance. Capacitive sensing gives the Kyub extremely sensitive action and an internal accelerometer allows the volume of each note to be precisely controlled for versatile musical expression. You can attach multiple Kyubs to a computer synthesizer or digital audio workstation for solo play, jamming with friends, or composition. &lt;strong&gt;A computer with a synthesizer program is required to make music, &amp;nbsp;&lt;/strong&gt;Almost any computer-based synthesizer can be used--we provide information on connecting the Kyub to the free version of Propellerhead Reason. &amp;nbsp;Check the hardware requirements here:&amp;nbsp;&lt;a href=&quot;http://www.propellerheads.se/products/reason/new/faq/&quot; target=&quot;_blank&quot;&gt;http://www.propellerheads.se/products/reason/new/faq/&lt;/a&gt;&lt;/p&gt;\n\n&lt;h1&gt;Note on the Kits&lt;/h1&gt;\n\n&lt;p&gt;&lt;strong&gt;The kits require soldering and some assembly skills&lt;/strong&gt;. &amp;nbsp;You can see what is involved at this link&amp;nbsp;&lt;a href=&quot;http://www.servoelectricguitar.com/Kyub_build_log.pdf&quot; target=&quot;_blank&quot;&gt;http://www.servoelectricguitar.com/Kyub_build_log.pdf&lt;/a&gt;. &amp;nbsp;The kits are probably not a good choice if you have never worked in electronics or programming unless you have some local support. &amp;nbsp;The entire assembly takes around 5 hours plus the time it takes you take to decorate the housing. All the parts are included in the full kits, a Teensy 2.0, a printed circuit board with a surface mount accelerometer, all of the electronic components, pads, laser cut housing, and bolts &amp;amp; screws. &amp;nbsp;&lt;/p&gt;\n\n&lt;ul&gt;\n	&lt;li&gt;&lt;strong&gt;What tools and materials are needed to build a Kyub?&lt;/strong&gt; A soldering iron and solder, a wire stripper, screw drivers, needle nose pliers, wood glue.&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n\n&lt;div class=&quot;template asset&quot; contenteditable=&quot;false&quot; data-edit_url=&quot;/projects/kyub/the-kyub-a-three-dimensional-feather-touch-midi-ke/assets/1696521/edit&quot; data-id=&quot;1696521&quot;&gt;&lt;img alt=&quot;Fully Assembled Kyubs in Rotwood, Sangria, and Green Tea&quot; class=&quot;fit&quot; src=&quot;https://s3.amazonaws.com/ksr/assets/001/696/521/01d25c844cc4d33be5396295aecc3433_large.jpg?1393782151&quot; /&gt;\n&lt;p&gt;Fully Assembled Kyubs in Rotwood, Sangria, and Green Tea&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;h1&gt;How did the Kyub come about?&lt;/h1&gt;\n\n&lt;p&gt;I&amp;#39;ve been working on electronic musical devices for about 10 years. My servoelectric guitar was featured in Popular Science here: &lt;a href=&quot;http://www.popsci.com/entertainment-amp-gaming/article/2009-03/homemade-guitar-hero?page=0%2C1&quot; target=&quot;_blank&quot;&gt;http://www.popsci.com/entertainment-amp-gaming/article/2009-03/homemade-guitar-hero?page=0%2C1&lt;/a&gt;&amp;nbsp; &amp;nbsp; Since then I&amp;#39;ve been working on providing a more intimate and performance friendly interface to electronic synthesizers and digital audio workstations. In particular, I wanted an open source platform constructed of standard components anyone could tailor to particular demands. I teamed up with Petyr Stretz a hacker and electronic music expert and Peggy Brown an industrial designer to see if I couldn&amp;#39;t create a design that was functional, innovative and beautiful. We&amp;#39;ve been working in the last four months to perfect this vision and bring it out in an easy to use kit form.&lt;/p&gt;\n\n&lt;h1&gt;&amp;nbsp;What are the features of the Kyub?&amp;nbsp;&lt;/h1&gt;\n\n&lt;ul&gt;\n	&lt;li&gt;11 fully programmable feather touch keypads on five surfaces of a 3 inch wooden cube. &amp;middot;&lt;/li&gt;\n	&lt;li&gt;Three axis 3G accelerometer usable to control note volume, after touch or pitch bending &amp;middot;&lt;/li&gt;\n	&lt;li&gt;A Teensy AVR microcontroller with native USB MIDI support programmable with the Arduino tool chain. &amp;middot;&lt;/li&gt;\n	&lt;li&gt;Three open source programs for immediate experimentation and playing providing major minor scales pentatonic, blues scale and Japanese scales, chord mode playing, string mode playing and percussion mode playing. &amp;middot;&lt;/li&gt;\n	&lt;li&gt;Compatible with most software synthesizers including the free download of Propellerhead Reason Essentials providing access to hundreds of high quality synthesized instruments. Works with iPad-based synthesizers as well using the camera adapter accessory &amp;middot;&lt;/li&gt;\n	&lt;li&gt;Easy to assemble laser cut wood housing that will accept a variety of finishes. &amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n\n&lt;h1&gt;How does the Kyub work?&lt;/h1&gt;\n\n&lt;p&gt;The internal circuitry monitors each of the keypads to immediately detect even the lightest finger touch reflected in a capacitive disturbance. Acceleration of the Kyub housing associated with a finger touch is converted to a note loudness which together with a pitch determined by the keypad is transmitted over a USB cable in standard MIDI format. The Kyub has low latency on the order of 3 ms providing a highly responsive musical experience.&lt;/p&gt;\n\n&lt;h1&gt;Rewards&amp;nbsp;&lt;/h1&gt;\n\n&lt;div class=&quot;template asset&quot; contenteditable=&quot;false&quot; data-edit_url=&quot;/projects/kyub/the-kyub-a-three-dimensional-feather-touch-midi-ke/assets/1754592/edit&quot; data-id=&quot;1754592&quot;&gt;&lt;img alt=&quot;Reward level 1 ($5): Complete electronic documentation&quot; class=&quot;fit&quot; src=&quot;https://s3.amazonaws.com/ksr/assets/001/754/592/931c81b1ad2fbca02d656aa56da842d5_large.jpg?1394906966&quot; /&gt;\n&lt;p&gt;Reward level 1 ($5): Complete electronic documentation&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;p&gt;&lt;strong&gt;Reward Level 1&lt;/strong&gt;: Pledge $5 or more and get all the documentation you need to build your own Kyub. Save days of design work with the Eagle files needed to create the printed circuit board, SVG files compatible with Ponoko to laser cut a housing; source code files, a complete build log, instruction manual and more.&lt;/p&gt;\n\n&lt;div class=&quot;template asset&quot; contenteditable=&quot;false&quot; data-edit_url=&quot;/projects/kyub/the-kyub-a-three-dimensional-feather-touch-midi-ke/assets/1754628/edit&quot; data-id=&quot;1754628&quot;&gt;&lt;img alt=&quot;Reward level 2 ($26) small kit&quot; class=&quot;fit&quot; src=&quot;https://s3.amazonaws.com/ksr/assets/001/754/628/3bff2785b4fafafb75b052732a37e6ef_large.jpg?1394907560&quot; /&gt;\n&lt;p&gt;Reward level 2 ($26) small kit&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;p&gt;&lt;strong&gt;Reward Level 2&lt;/strong&gt;: Pledge $26 or more and get all of the above plus a printed circuit board with a professionally installed three axis accelerometer, a reusable Teensy and printed circuit board parts. Add some pads, switches, and wires (oh yeah, and a housing) and you&amp;#39;re in business. Thinking dried gourds? Go for it! &amp;nbsp;&amp;nbsp;&lt;/p&gt;\n\n&lt;div class=&quot;template asset&quot; contenteditable=&quot;false&quot; data-edit_url=&quot;/projects/kyub/the-kyub-a-three-dimensional-feather-touch-midi-ke/assets/1754630/edit&quot; data-id=&quot;1754630&quot;&gt;&lt;img alt=&quot;Reward level 3 ($65): full kit&quot; class=&quot;fit&quot; src=&quot;https://s3.amazonaws.com/ksr/assets/001/754/630/2538d48e26d9a63bdc4013e9ac8333d5_large.jpg?1394907582&quot; /&gt;\n&lt;p&gt;Reward level 3 ($65): full kit&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;p&gt;&lt;strong&gt;Reward Level 3&lt;/strong&gt;: Pledge $65 or more and get all of the above plus the rest of the parts and housing and USB cable needed to build a complete Kyub as shown on this page. Assemble and finish the housing (try crazy paisley) and you can have a one-of-a-kind musical parallelpiped.&amp;nbsp;&lt;/p&gt;\n\n&lt;div class=&quot;template asset&quot; contenteditable=&quot;false&quot; data-edit_url=&quot;/projects/kyub/the-kyub-a-three-dimensional-feather-touch-midi-ke/assets/1754633/edit&quot; data-id=&quot;1754633&quot;&gt;&lt;img alt=&quot;Reward levels 4 &amp;amp; 5 ($199 early, $250): fully assembled Kyub&quot; class=&quot;fit&quot; src=&quot;https://s3.amazonaws.com/ksr/assets/001/754/633/6efc73788c209b7872a2921e903e62b9_large.jpg?1394907600&quot; /&gt;\n&lt;p&gt;Reward levels 4 &amp;amp; 5 ($199 early, $250): fully assembled Kyub&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;p&gt;&lt;strong&gt;Reward Levels&amp;nbsp;4 &amp;amp; 5&lt;/strong&gt;: Pledge $250 or more ($199 for early buyers) and get all of the above but assembled for you. You can be jamming on your USB using synthesizer before you&amp;#39;ve even unpacked it. Select a color from Sangria, Green Tea, Rotwood, or Natural finish with smoke accents. Fully tested and musically infused.&amp;nbsp;&lt;/p&gt;\n\n&lt;h1&gt;&lt;strong&gt;How are we going to use the money?&lt;/strong&gt;&lt;/h1&gt;\n\n&lt;p&gt;The money from this campaign will let us get volume pricing on the various parts so we can offer the kits for a price far below what it would cost an individual to purchase the necessary components. &amp;nbsp;We will also purchase an Eagle license that lets us provide printed circuit Eagle files on a commercial basis. Hopefully we will have some left over to start a web site for more info for Kyub users.&lt;/p&gt;\n\n&lt;h1&gt;&lt;strong&gt;What&amp;#39;s the status of the design?&lt;/strong&gt;&lt;/h1&gt;\n\n&lt;p&gt;We are now on our fifth iteration on the design and have final PC board artwork, final laser cutting artwork and a full tested bill of materials. All that&amp;#39;s needed is to make a bulk order for parts, and, in the case of the fully constructed Kyubs, fabricate the Kyubs themselves. We have made and tested about six of the final design already and don&amp;#39;t see any problem in making the offered 70.&lt;/p&gt;\n\n&lt;div class=&quot;template asset&quot; contenteditable=&quot;false&quot; data-edit_url=&quot;/projects/kyub/the-kyub-a-three-dimensional-feather-touch-midi-ke/assets/1696571/edit&quot; data-id=&quot;1696571&quot;&gt;&lt;img alt=&quot;more than 6 months of prototypes and testing&quot; class=&quot;fit&quot; src=&quot;https://s3.amazonaws.com/ksr/assets/001/696/571/29ecde9f25cb51824f76c23791a03f5c_large.bmp?1393783075&quot; /&gt;\n&lt;p&gt;more than 6 months of prototypes and testing&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;p&gt;Here is our anticipated fullfillment schedule. &amp;nbsp;We have considerable experience in assembling the completed Kyubs and the driving factor of the schedule is the time taken to receive the parts from the vendors. Because these are not large quantities of parts and are indicated to be in stock ,we do not anticipate any substantial delays.&lt;/p&gt;\n\n&lt;ul&gt;\n	&lt;li&gt;Completion of Kickstarter campaign (anticipated): May 1, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Release of Funds: May 15, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Order Parts from Current BOM: May 16, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Release of Documentation for Level 1-5: May 25, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Receipt of All Parts: June 16, 2014 (30 days)&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Begin Assembly of Full Products (Levels 4, 5): June 20, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Begin Mailing out Kits: (Levels 2, 3): June 20, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Complete Assembly of Full Products (Levels 4, 5): July 15, 2014&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Complete Mailing out Kits (Levels 2, 3): July 30, 2014&amp;nbsp;&lt;/li&gt;\n	&lt;li&gt;&amp;nbsp;Complete Mailing out of Full Product (Levels, 4, 5): &amp;nbsp;July 30, 2014&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n', '', '', 250, 1, '2014-06-26 12:13:00', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(141, '9_PH12_TZP.jpg', 'Replika Mount Everest 1:1', 38, '', '2014-10-04 11:11:28', 800, 'Quisque bibendum nibh libero, quis commodo lacus posuere eget. Nunc pellentesque eleifend ligula, nec egestas risus ultricies at. Nulla massa enim, pellentesque id cursus eu, elementum vel lacus. Nullam feugiat eu nulla vitae eleifend. Nullam massa risus, bibendum ac nunc ac, dapibus venenatis eros. Sed laoreet nullam.\n', '', '', '', '', 252, 1, '2014-06-28 13:13:26', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(142, 'Chrysanthemum.jpg', 'Atomova Ponorka', 36, '', '2014-04-16 11:11:28', 900, 'Aenean metus lacus, porta at ligula a, feugiat hendrerit augue. Praesent nibh augue, rhoncus vitae elementum eu, dignissim sed nulla. Duis condimentum vitae massa non tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc euismod amet.\n', '', '', '', '', 252, 1, '2014-03-26 14:18:11', 0, 0, 0, '0000-00-00', 0, '', '', 1, 1, 0, 0),
(143, 'Lighthouse.jpg', 'Stahovanie Cinskeho muru', 41, '', '2014-03-14 11:11:28', 2400, 'Ut enim urna, ullamcorper at rutrum vitae, dictum eu velit. Integer auctor dui ac mauris mattis, a tincidunt quam convallis. Integer venenatis dolor erat, sit amet scelerisque sapien ultricies at. Nam eu posuere nisi, rutrum vestibulum enim. Vivamus eu lacus a leo egestas massa nunc.\n', '', '', '', '', 252, 1, '2014-03-26 14:34:11', 0, 0, 0, '0000-00-00', 0, '', '', 1, 1, 0, 0),
(145, 'Koala.jpg', 'Dalasia hovadina', 40, '', '2014-08-31 11:11:28', 25000, 'Sem by mal prist kratky popis projektu. Potrebujet...\n', '', '', '', '', 252, 1, '2014-07-21 08:55:30', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(146, '', '', 0, '', '2014-04-03 11:11:28', 0, '', '', '', '', '', 250, 0, '2014-03-27 13:29:12', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(147, 'Hydrangeas.jpg', 'aksjdfhaks', 1, '', '2014-05-03 11:11:28', 0, 'asjfdbnaksdf aslkdj blask d', '', '&lt;p&gt;&lt;strong&gt;54554544&lt;/strong&gt;&lt;/p&gt;\n', '', '', 252, 1, '2014-03-28 12:58:18', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(148, '', '', 1, '', '2014-03-05 11:11:28', 0, '', '', '', '', '', 252, 0, '2014-03-28 13:36:04', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(149, '', 'gdgdg', 4, '', '2014-05-01 11:11:28', 3453453, 'dggfdgf', '', '', '', '', 250, 0, '2014-03-31 09:01:14', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(150, '', '', 1, '', '2015-01-31 12:17:20', 0, '', '', '', '', '', 250, 0, '2014-03-31 09:06:13', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(151, '', '', 1, '', '2014-05-15 11:11:15', 0, '', '', '', '', '', 250, 0, '2014-03-31 09:08:55', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(152, '', '', 1, '', '2014-05-15 11:11:28', 0, '', '', '', '', '', 250, 0, '2014-03-31 09:11:26', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(153, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 252, 0, '2014-03-31 09:38:23', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(154, '0451-140314.jpg', '', 0, '', '2014-05-15 14:15:01', 0, '', '', '', '', '', 250, 0, '2014-08-30 11:39:36', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(155, '', '', 0, '', '2014-05-15 14:39:37', 0, '', '', '', '', '', 250, 0, '2014-03-31 12:39:30', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(156, '', '', 0, '', '2014-05-15 20:15:16', 0, '', '', '', '', '', 250, 0, '2014-03-31 18:15:13', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(157, 'Jellyfish.jpg', 'kokohkjfhgd', 0, '', '2014-05-16 09:30:42', 0, '', '', '&lt;p&gt;\n&lt;div class=&quot;slideshowPlugin&quot; contenteditable=&quot;false&quot; data-animspeedid=&quot;500&quot; data-autostartid=&quot;true&quot; data-openonclickid=&quot;true&quot; data-pictheightid=&quot;300&quot; data-showcontrolid=&quot;true&quot; data-showthumbid=&quot;true&quot; data-showtitleid=&quot;true&quot; data-slideshowid=&quot;cke_lt4s6p92_slideShow&quot; data-speedid=&quot;5&quot; data-transitiontypeid=&quot;resize&quot; id=&quot;cke_lt4s6p92_slideShow&quot;&gt;\n&lt;div class=&quot;ad-gallery&quot; contenteditable=&quot;false&quot; id=&quot;ad-gallery_cke_lt4s6p92_slideShow&quot;&gt;\n&lt;div class=&quot;ad-image-wrapper&quot; contenteditable=&quot;false&quot;&gt;&amp;nbsp;&lt;/div&gt;\n\n&lt;div class=&quot;ad-controls&quot; contenteditable=&quot;false&quot; style=&quot;display: block;&quot;&gt;&amp;nbsp;&lt;/div&gt;\n\n&lt;div class=&quot;ad-nav&quot; contenteditable=&quot;false&quot; style=&quot;display: block;&quot;&gt;\n&lt;div class=&quot;ad-thumbs&quot; contenteditable=&quot;false&quot;&gt;\n&lt;ul class=&quot;ad-thumb-list&quot; contenteditable=&quot;false&quot;&gt;\n	&lt;li contenteditable=&quot;false&quot;&gt;&lt;a contenteditable=&quot;false&quot; href=&quot;/files/157/img/Hydrangeas.jpg&quot;&gt;&lt;img alt=&quot;&quot; contenteditable=&quot;false&quot; src=&quot;/files/157/img/Hydrangeas.jpg&quot; style=&quot;height:38px; width:50px&quot; title=&quot;&quot; /&gt;&lt;/a&gt;&lt;/li&gt;\n	&lt;li contenteditable=&quot;false&quot;&gt;&lt;a contenteditable=&quot;false&quot; href=&quot;/files/157/img/Chrysanthemum.jpg&quot;&gt;&lt;img alt=&quot;&quot; contenteditable=&quot;false&quot; src=&quot;/files/157/img/Chrysanthemum.jpg&quot; style=&quot;height:38px; width:50px&quot; title=&quot;&quot; /&gt;&lt;/a&gt;&lt;/li&gt;\n	&lt;li contenteditable=&quot;false&quot;&gt;&lt;a contenteditable=&quot;false&quot; href=&quot;/files/157/img/Penguins.jpg&quot;&gt;&lt;img alt=&quot;&quot; contenteditable=&quot;false&quot; src=&quot;/files/157/img/Penguins.jpg&quot; style=&quot;height:38px; width:50px&quot; title=&quot;&quot; /&gt;&lt;/a&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/div&gt;\n&lt;/div&gt;\n&lt;script src=&quot;/ckeditor/plugins/slideshow/3rdParty/ad-gallery/jquery.ad-gallery.min.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;(function($) { $(&#039;head&#039;).append(&#039;&lt;link rel=&quot;stylesheet&quot; href=&quot;/ckeditor/plugins/slideshow/3rdParty/fancybox2/jquery.fancybox.css?v=2.1.5&quot; type=&quot;text/css&quot; /&gt;&#039;); })(jQuery);&lt;/script&gt;\n&lt;script src=&quot;/ckeditor/plugins/slideshow/3rdParty/fancybox2/jquery.fancybox.pack.js?v=2.1.5&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;(function($) {$(function() {$(&quot;#ad-gallery_cke_lt4s6p92_slideShow&quot;).on(&quot;click&quot;,&quot;.ad-image&quot;,function(){var imgObj =$(this).find(&quot;img&quot;);var isrc=imgObj.attr(&quot;src&quot;);var ititle=null;var idesc=null;var iname=isrc.split(&#039;/&#039;);iname=iname[iname.length-1];var imgdescid=$(this).find(&quot;.ad-image-description&quot;);if(imgdescid){ititle=$(this).find(&quot;.ad-description-title&quot;);if(ititle)ititle=ititle.text();if(ititle!=&#039;&#039;)ititle=&#039;&lt;big&gt;&#039;+ititle+&#039;&lt;/big&gt;&#039;;idesc=$(this).find(&quot;span&quot;);if(idesc)idesc=idesc.text();if(idesc!=&#039;&#039;){if(ititle!=&#039;&#039;)ititle=ititle+&#039;&lt;br&gt;&#039;;idesc=&#039;&lt;i&gt;&#039;+idesc+&#039;&lt;/i&gt;&#039;;}}$.fancybox.open({href:isrc,beforeLoad:function(){this.title=ititle+idesc;},});});});})(jQuery);&lt;/script&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;(function($) { $(&#039;head&#039;).append(&#039;&lt;link rel=&quot;stylesheet&quot; href=&quot;/ckeditor/plugins/slideshow/3rdParty/ad-gallery/jquery.ad-gallery.css&quot; type=&quot;text/css&quot; /&gt;&#039;); })(jQuery);&lt;/script&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;(function($) {$(function() {   var galleries = $(&#039;#ad-gallery_cke_lt4s6p92_slideShow&#039;).adGallery({loader_image: &#039;/ckeditor/plugins/slideshow/3rdParty/ad-gallery/loader.gif&#039;, width:false, height:300, start_at_index: 0, animation_speed: 500, update_window_hash: false, effect: &#039;resize&#039;, slideshow: { enable: true, autostart: true, speed: 5000,},});});})(jQuery);&lt;/script&gt;\n&lt;/div&gt;\n&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec sem eros. Aenean aliquam dolor in neque tristique semper. Donec id dolor purus. Etiam at felis quis nibh ultrices venenatis. Fusce tortor arcu, commodo at lacinia eget, cursus sit amet mi. Aliquam vel lacus ut diam gravida porttitor. Vestibulum aliquet leo ut placerat elementum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam erat volutpat.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;In malesuada odio a convallis adipiscing. Duis risus arcu, tristique in erat quis, vulputate interdum quam. Praesent pharetra sodales magna, at dictum enim semper at. Nam lobortis varius orci id interdum. Etiam lacinia ipsum non arcu dictum rutrum. Nam faucibus justo non sagittis mattis. Curabitur elit massa, aliquam vitae ullamcorper a, hendrerit non lacus.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Cras bibendum, ante eget egestas viverra, est tellus scelerisque turpis, id fermentum diam tortor in leo. Nullam vitae scelerisque tortor. Nullam nec nisl consectetur, egestas metus vitae, dignissim turpis. Quisque tempus, lacus vel placerat molestie, sapien ipsum pulvinar magna, eu faucibus justo neque vehicula tortor. Pellentesque aliquet semper mattis. Donec ante elit, tristique sit amet erat a, aliquam adipiscing massa. Curabitur molestie sagittis semper. Praesent at luctus diam. Mauris vel purus lacus. Nulla sapien leo, varius et luctus eget, iaculis vitae ligula. Sed ornare dui faucibus blandit convallis.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Donec semper commodo quam eu vehicula. Donec lorem erat, sollicitudin eget mauris quis, mollis imperdiet ligula. Quisque sit amet volutpat mi. Fusce a est ante. Vestibulum fermentum nulla a condimentum imperdiet. Nulla pulvinar pellentesque ultricies. Fusce tempus sem eget orci feugiat consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam vel est in velit euismod dapibus. Integer adipiscing, metus at posuere tristique, nibh dui porta ligula, a consectetur nisi est quis neque.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Aliquam feugiat ligula et augue suscipit, a tristique metus congue. Etiam tincidunt adipiscing quam, nec dignissim sem scelerisque porttitor. Sed sed urna et ante semper fermentum. Vivamus laoreet rutrum commodo. Ut porta nisi tortor, vel vehicula nisl interdum sollicitudin. Nunc sagittis pellentesque leo a euismod. Donec lobortis diam nisl, et porta purus porttitor quis. Proin a augue eleifend, feugiat diam eu, euismod orci. Curabitur libero erat, porttitor porta ultricies a, volutpat sed lorem. Aliquam ultrices euismod sodales. Praesent rutrum odio nec ante varius, eget molestie libero feugiat. Proin sagittis urna id sem pretium, at vestibulum turpis congue. Nunc vitae tristique magna.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Aenean aliquam luctus lacinia. Cras accumsan iaculis euismod. Quisque at ipsum fringilla, interdum risus id, volutpat nunc. Donec congue volutpat leo, vel ullamcorper augue. Nunc euismod feugiat hendrerit. Fusce bibendum faucibus lectus eleifend tempus. In cursus, orci sagittis ornare fringilla, neque elit aliquet arcu, eu pellentesque nunc nisl nec augue. Nam facilisis ante ut congue ullamcorper. Fusce pellentesque vitae nibh vitae consequat. Ut sit amet nunc felis.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Ut dictum, arcu at pulvinar consequat, quam enim blandit elit, ac rutrum odio risus scelerisque metus. Quisque malesuada tincidunt metus et viverra. Proin non tempor odio. Curabitur nisi neque, varius eget congue eget, vehicula nec odio. Donec eleifend augue et ante mollis imperdiet. Morbi at lectus quis metus sollicitudin iaculis. Cras id mattis leo.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Nulla viverra tempor elementum. Donec dignissim nulla quis lacus rhoncus, at malesuada justo blandit. Nam vitae lorem id elit hendrerit fermentum vitae id ipsum. Nullam auctor luctus blandit. Nulla ut nibh libero. Praesent luctus tincidunt magna quis porttitor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc tristique semper nunc vel imperdiet. Fusce sit amet massa non dui varius pulvinar. Fusce malesuada lectus arcu, eget condimentum augue posuere ac. Maecenas placerat enim a porta adipiscing. Vestibulum pellentesque, mi sit amet accumsan facilisis, ligula odio elementum ligula, sit amet molestie mauris massa eget elit. Mauris quis condimentum ipsum, id varius turpis.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Vivamus ultrices mattis rhoncus. Ut at elit tempor, porttitor lorem scelerisque, pretium nibh. Nulla facilisi. Praesent dictum, enim id posuere sagittis, tellus erat tempus lectus, posuere cursus dui erat ac enim. Duis molestie dolor eget congue semper. Donec risus dolor, ultrices sit amet adipiscing sed, mollis eu libero. Vestibulum malesuada neque tortor, eget facilisis dui cursus eu. Sed laoreet metus eu pharetra volutpat. Nullam egestas tristique justo pretium rhoncus. Quisque volutpat nulla neque, ac dapibus justo sagittis nec. Donec odio mauris, faucibus ac ullamcorper at, tincidunt id leo. Vivamus vulputate tortor eget ligula sodales sollicitudin. Vestibulum vel velit in nunc consequat varius ut ut mauris.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Praesent ipsum nulla, viverra non congue eget, porta sit amet urna. Donec sit amet lectus commodo, scelerisque odio scelerisque, elementum nibh. Quisque vel sodales odio, ac interdum magna. In tincidunt mauris est, blandit sollicitudin velit placerat in. Donec ut pulvinar mi, vel mattis nulla. Maecenas rhoncus nibh lectus, eget pellentesque ipsum pretium eu. Donec leo quam, ullamcorper sit amet lacus a, imperdiet mollis ligula.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Phasellus ac neque at felis consequat ultricies. Maecenas et erat quam. Vivamus sapien nisi, rhoncus quis commodo in, cursus a nisi. Praesent malesuada sapien ullamcorper velit consequat auctor. Donec faucibus, justo id molestie eleifend, orci massa tincidunt nunc, et sollicitudin libero ante ut dui. In id laoreet leo. Sed mollis adipiscing purus at venenatis. Donec sit amet rutrum elit. Aliquam non velit consequat diam iaculis euismod.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Quisque at leo molestie enim vulputate ullamcorper. Morbi ac lorem velit. In tempor, dui nec ornare dignissim, magna nulla egestas lorem, a ornare ante justo sed nunc. Praesent ac auctor lacus. Suspendisse pulvinar congue luctus. Vivamus nisi mauris, hendrerit sed dapibus id, condimentum vel odio. Morbi mauris quam, pretium sed eleifend at, molestie et dolor. Praesent elementum, erat vel scelerisque scelerisque, tellus nibh sagittis diam, ut tempor tellus est id ligula. Donec facilisis sodales ornare. Aliquam a ultrices arcu, quis pretium mauris. Pellentesque interdum, mi ac tempor vehicula, tortor ante consequat leo, a dapibus massa dolor at sapien. Nunc vel gravida odio. Maecenas tempor nibh ut risus sagittis tincidunt ac ut nisl.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Suspendisse quis interdum magna, a molestie turpis. Donec vehicula massa sed dolor fermentum hendrerit. Donec volutpat lacus vel pulvinar posuere. Duis hendrerit turpis sapien, sit amet porttitor massa dignissim a. Etiam quis arcu eros. Curabitur arcu justo, vehicula sed luctus vitae, egestas in nunc. Fusce commodo, dolor mattis tempus vestibulum, sem ante facilisis orci, ac suscipit quam felis nec dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec porta mattis nisl in tempus.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;In ullamcorper velit lorem, eu convallis quam faucibus non. Suspendisse elit enim, sollicitudin sed suscipit sed, hendrerit ac ipsum. Aenean vitae viverra nibh. Suspendisse potenti. Maecenas malesuada velit enim, eget viverra lorem rhoncus in. Nunc sagittis ipsum sem, a euismod dui rutrum ac. Mauris suscipit condimentum dolor et cursus. Sed dictum erat id hendrerit consequat. Nulla vestibulum tortor non lectus tincidunt, ut sollicitudin mi fermentum. Ut auctor, mi a condimentum laoreet, elit erat tempor orci, et scelerisque magna sapien in nulla. Mauris nec mauris urna. Phasellus ultrices tempus malesuada.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Duis ac arcu nec nisl fermentum viverra. Donec sed venenatis arcu, sit amet placerat ligula. Morbi volutpat, justo ut mollis congue, arcu metus malesuada leo, sed dapibus eros odio et nisl. Maecenas dictum erat non lorem pretium, nec tristique neque tempus. Morbi nulla quam, ornare convallis aliquet et, convallis in augue. Donec vestibulum id metus ac consectetur. Suspendisse tincidunt molestie tellus non sagittis.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Suspendisse eget urna ut mauris fermentum gravida eu sed arcu. Quisque scelerisque mattis quam vel mattis. Duis eget vulputate est. Suspendisse sed nisl accumsan, rhoncus tellus sit amet, consectetur quam. Donec non justo nec tellus placerat tristique. Morbi condimentum euismod dignissim. Praesent vel metus quam. Pellentesque nec aliquet neque. Etiam at porttitor nisi. Nam a velit rhoncus, cursus sem a, tincidunt mi. Praesent convallis at nunc sed egestas. Morbi consectetur tellus quis luctus hendrerit. Etiam at dictum justo. Nam pellentesque turpis eu urna accumsan, eget euismod justo scelerisque.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Suspendisse potenti. Nullam sodales sit amet magna sed eleifend. Suspendisse id ligula et est luctus tincidunt ac a nisi. Duis eu dui dui. Vestibulum pellentesque erat vel semper interdum. Nullam commodo tellus et neque convallis, ut rutrum massa tempor. Nam sollicitudin imperdiet nibh ut auctor. Sed vel luctus lectus, ac accumsan est. Sed commodo suscipit mauris a rutrum. Morbi tincidunt lobortis orci sit amet feugiat. Maecenas erat leo, sodales sit amet dui vitae, vestibulum blandit orci. Vivamus id dui molestie, facilisis erat a, eleifend justo. Vivamus urna tellus, condimentum vel massa in, pretium aliquet ligula. Pellentesque dignissim enim viverra justo pretium, non posuere ante laoreet. Morbi mollis porta sapien, vitae porta arcu euismod quis.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Donec faucibus purus nisi. Vivamus pellentesque in dolor vitae luctus. Sed porta dolor sapien, eget facilisis eros aliquet quis. Donec posuere orci at quam fermentum pretium. Donec risus nisl, commodo eget odio non, consequat vulputate quam. Etiam ultricies sed nisl at fringilla. Aliquam nec lectus a leo auctor auctor eget congue lorem. Aliquam vulputate elit at aliquet laoreet.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Etiam tempor neque eu risus dignissim, ut cursus enim porttitor. Maecenas sed varius turpis. Ut convallis, erat dignissim tristique consectetur, metus ante tincidunt mauris, laoreet imperdiet risus dolor at libero. Duis pharetra nulla orci, vitae faucibus odio dapibus condimentum. Aenean orci sem, iaculis et lorem a, accumsan fermentum diam. Praesent velit arcu, tempor elementum tellus et, dignissim hendrerit libero. Etiam gravida arcu sit amet ullamcorper lacinia. Suspendisse id lacus sed elit dictum facilisis quis sed lorem. Vestibulum iaculis scelerisque cursus.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Fusce ac fermentum mauris. Morbi aliquet vitae justo at interdum. Duis in lectus mattis, vestibulum est vitae, scelerisque libero. Nunc vel semper velit. Vestibulum dictum pulvinar tempor. Donec viverra dolor eu turpis condimentum malesuada. Donec malesuada magna at tellus dignissim fermentum. Proin fringilla tincidunt mollis. Curabitur id posuere libero, et tincidunt magna. Nulla semper tincidunt nisi, vel sodales augue. Mauris in tortor in justo tincidunt ultrices. Donec massa felis, luctus non congue vitae, sagittis sed quam. Nullam pellentesque volutpat quam.&lt;/p&gt;\n', '', '', 250, 0, '2014-09-06 06:29:23', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(158, '', '', 0, '', '2014-05-16 10:20:34', 0, '', '', '', '', '', 250, 0, '2014-04-01 08:05:27', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(159, 'Tulips.jpg', '', 0, '', '2014-05-16 10:23:01', 0, '', '', '', '', '', 250, 1, '2014-04-01 08:20:50', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(160, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-08-14 08:36:57', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(161, 'Desert.jpg', 'adajte názov Vášho projektu', 38, '', '2014-05-16 11:08:57', 1500, 'Potrebujete poradiť?\nPozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.', '', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/files/161/img/Desert.jpg&quot; style=&quot;height:600px; width:800px&quot; /&gt;&lt;/p&gt;\n', '', '', 250, 1, '2014-07-03 09:01:20', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(162, 'Koala.jpg', 'Moj projekt', 0, '', '2014-05-18 11:39:14', 15, 'dsddssdsdsdwwwww', '', '', '', '', 250, 1, '2014-06-25 09:39:26', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(163, 'IMG_3914.jpg', '', 0, '', '2014-05-16 20:53:23', 0, '', '', '&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;/files/163/img/IMG_4138.jpg&quot; style=&quot;height:300px; width:200px&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;ewrqwerqwerqwer dfsffdsfsdf sdfsd fsd fsd fs dfsdf&amp;nbsp;ewrqwerqwerqwer dfsffdsfsdf sdfsd fsd fsd fs dfsdfewrqwerqwerqwer dfsffdsfsdf sdfsd fsd fsd fs dfsdfewrqwerqwerqwer dfsffdsfsdf sdfsd fsd fsd fs dfsdfewrqwerqwerqwer dfsffdsfsdf sdfsd fsd fsd fs dfsdfewrqwerqwerqwer dfsffdsfsdf sdfsd fsd fsd fs dfsdf&lt;/strong&gt;&lt;/p&gt;\n', '', '', 250, 1, '2014-06-13 18:51:49', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(164, '', '', 0, '', '2014-05-18 11:37:50', 0, '', '', '', '', '', 250, 0, '2014-04-03 09:30:13', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(165, 'Koala.jpg', 'dfdsdsgfggfd', 37, '', '2014-08-04 08:52:43', 165, 'fdsdfdsfsdfsPotrebujete poradiť?\nPozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.Potrebujete poradiť?\nPozrite si časť Typy pri vytváraní projektov . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.dfsdfsdfsdf', '', '&lt;p&gt;sdfafadf&lt;/p&gt;\n', '', '', 250, 0, '2014-04-03 09:43:22', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 1),
(166, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-04-03 12:02:39', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(167, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-04-03 12:14:26', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(168, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-04-03 12:22:06', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(169, 'Jellyfish.jpg', 'Potrebujete poradiť?', 39, '', '2014-05-18 16:50:03', 1655, 'dggfdsgsdfgsdgs', '', '&lt;p&gt;fasdfasdfsdfa&lt;/p&gt;\n', '', '', 250, 0, '2014-04-03 13:14:04', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 1),
(170, '', '', 0, '', '2014-05-29 11:50:05', 0, '', '', '', '', '', 250, 0, '2014-04-14 09:50:00', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(171, 'Lighthouse.jpg', 'Novy projekt', 39, '', '2014-07-03 10:36:42', 15, 'gdsfgsdfgsdfgsdfg', '', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/files/171/img/Tulips.jpg&quot; style=&quot;height:375px; width:500px&quot; /&gt;&lt;/p&gt;\n', '', '', 250, 0, '2014-04-22 10:47:04', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(172, 'Koala.jpg', 'Nazov mojho noveho projektu', 38, '', '2014-07-18 15:47:13', 1655, 'dskljfsld ljksdj fdalskj fadskjfh asdjfkasdhfkj askldfjh aklsdfjh aklsjdfh aksjdfh aksdjhf kajsdh fskdjh fkasdjhf ajskdfh ', '', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/files/172/img/Koala.jpg&quot; style=&quot;float:left; height:768px; width:1024px&quot; /&gt;&lt;/p&gt;\n', '', '', 250, 0, '2014-06-03 13:45:48', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 1),
(173, '', '', 37, '', '2014-07-22 12:07:57', 0, '', '', '', '', '', 250, 0, '2014-06-07 10:07:52', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(174, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-06-14 15:53:34', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(175, 'photo1.jpg', '', 38, '', '2014-07-29 17:54:49', 0, '', '', '&lt;p&gt;&amp;rsquo;&lt;/p&gt;\n', '', '', 250, 0, '2014-06-14 15:54:30', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(176, '', '', 0, '', '2014-08-15 14:41:45', 0, '', '', '', '', '', 250, 0, '2014-07-01 12:41:14', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(177, '', '', 0, '', '2014-09-05 11:55:21', 0, '', '', '&lt;p&gt;gfd gsdf gs dfg dsfg&lt;/p&gt;\n', '', '', 250, 0, '2014-07-22 09:43:23', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(178, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 259, 0, '2014-07-22 11:52:18', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0);
INSERT INTO `df45s_projects` (`projectID`, `project_image`, `project_title`, `project_category`, `project_location`, `project_duration`, `pledge_amount`, `short_description`, `project_video`, `project_description`, `project_chalanges`, `project_faq`, `userID`, `approved`, `create_date`, `status`, `user_type`, `statusID`, `finish_date`, `views`, `coments`, `news`, `terms_accepted`, `last_page_filled`, `award_count`, `submited`) VALUES
(179, 'jelmezbal.jpg', 'Complete test project', 34, '', '2014-09-06 10:24:03', 5500, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus mi et justo cursus tempus. Sed eu dui hendrerit, cursus tellus non, volutpat lorem. Nam consequat ligula nec elit mollis commodo. In lacus turpis, viverra at tincidunt vel, ultricies ut sem. Maecenas eget eros tellus. Cras et mauris egestas, facilisis lorem quis, sodales augue. Donec ultrices massa vitae magna porttitor, et posuere nisi fringilla. Quisque in tellus erat.', '', '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;iframe allowfullscreen=&quot;&quot; frameborder=&quot;0&quot; height=&quot;360&quot; src=&quot;//www.youtube.com/embed/0lpuJM147o0&quot; width=&quot;640&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fringilla, orci eget condimentum ultricies, lacus massa pharetra magna, non hendrerit arcu dui nec nulla. Aenean et nibh a est placerat tempus sit amet vitae ipsum. Praesent magna arcu, aliquet vel ligula non, dictum suscipit nibh. Vestibulum purus dui, pretium non vehicula vel, venenatis eu lacus. Aliquam ultrices felis ante, et ultricies nisi convallis quis. Morbi aliquam ultrices porta. Ut feugiat non odio vitae molestie. Etiam in ipsum mauris. Aliquam vehicula felis a elit faucibus, eu aliquam risus commodo. Aliquam ac nisl a augue pulvinar condimentum. Phasellus porta enim ut purus malesuada, vitae laoreet nulla malesuada. Suspendisse sit amet tellus vel eros adipiscing volutpat. Suspendisse congue blandit libero, nec elementum risus fermentum quis. Donec et dapibus arcu.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/files/179/img/jelmezbal.jpg&quot; style=&quot;height:392px; width:640px&quot; /&gt;&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Pellentesque rhoncus justo nec cursus mattis. Vestibulum quis felis magna. Pellentesque consequat mattis urna. Nam fermentum justo a quam consequat posuere. Vivamus vel porttitor velit. In interdum rutrum ipsum eget lobortis. Etiam commodo eleifend urna, sit amet elementum mauris lobortis ut. Vestibulum euismod nisl sed lobortis suscipit. Duis pretium eros sed elementum feugiat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque a sollicitudin ante. In vel nisi nec odio scelerisque adipiscing.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Ut urna urna, gravida vel adipiscing et, sodales et felis. Pellentesque sem elit, ornare vel porta at, varius sit amet metus. Proin urna neque, suscipit sit amet commodo eu, sagittis vitae lacus. Cras eu elit dolor. Nullam gravida sapien erat, sed semper lorem tincidunt ac. Curabitur accumsan ipsum vel elementum semper. Praesent non eros nulla. Proin sit amet mi placerat, aliquam lorem commodo, sodales odio. Vivamus viverra nisi vitae nunc semper, non mattis libero luctus. Nam molestie lacus non quam interdum suscipit. In vitae ultrices felis, sed dictum urna. Nam facilisis felis non mollis congue. Quisque sit amet turpis id libero fringilla luctus. Nulla a felis justo. Donec laoreet metus quis mi tincidunt commodo.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Suspendisse potenti. Suspendisse imperdiet eu erat vitae consectetur. Nunc aliquet fermentum nulla. Etiam porttitor, felis non interdum malesuada, dui mi bibendum felis, at placerat ipsum sapien consectetur sapien. Integer tortor felis, pharetra at velit ut, tincidunt posuere enim. Donec nec ante at elit pulvinar vehicula. Donec sit amet nisl sem. Pellentesque velit turpis, aliquam congue felis a, luctus mollis orci. Proin venenatis, elit id eleifend convallis, risus velit varius nibh, nec interdum lacus odio in metus. Praesent vel adipiscing neque. Ut suscipit, ipsum vel consectetur tristique, massa nibh mattis odio, quis cursus odio augue quis nunc. Donec quis tincidunt neque. Duis consectetur lorem ac magna commodo vestibulum. Etiam velit ipsum, bibendum eget iaculis non, egestas accumsan nisi.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.solarviews.com/raw/jup/jupwsmap.gif&quot; style=&quot;height:640px; width:640px&quot; /&gt;&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Maecenas condimentum semper elit vitae mollis. Nulla nec molestie mi. Vestibulum luctus luctus erat a elementum. Curabitur ornare odio eget arcu mattis, non viverra tortor venenatis. Proin nec dui sit amet est euismod sagittis. Praesent ligula nibh, auctor vel iaculis egestas, ultrices in erat. Morbi vitae lacus id lorem tincidunt molestie vitae vel mi. Suspendisse potenti. Etiam quis cursus dolor. Nullam aliquet interdum condimentum. Integer vestibulum tortor quis neque auctor suscipit.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Vivamus pharetra ante at nisl bibendum, sit amet sollicitudin dolor rutrum. Mauris egestas dui ac magna accumsan, fringilla dictum magna sollicitudin. Praesent vitae congue sem. Cras accumsan mattis felis, sed eleifend diam elementum in. Integer tincidunt justo faucibus nunc tempus semper. Morbi quis odio ultricies, tincidunt nibh sed, fringilla erat. Quisque malesuada fermentum elit, vel bibendum nisi pellentesque sit amet.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Suspendisse in diam faucibus, posuere felis non, commodo sem. Cras quis aliquam elit, nec rhoncus ante. Maecenas ante ligula, eleifend a enim nec, aliquet suscipit augue. Suspendisse potenti. In ullamcorper facilisis ultricies. Nulla molestie diam ut justo convallis luctus. Donec non elementum neque. Aliquam eget mauris vitae dui fermentum ornare quis ac justo. Cras vitae viverra odio. Morbi sodales erat erat, ultrices condimentum ligula varius ut. Fusce tristique dui metus, non consectetur leo tempor quis. Donec nibh lorem, iaculis rutrum tristique quis, elementum ut mi. Sed elementum lectus aliquet odio condimentum, ut aliquam ligula interdum.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla convallis tincidunt arcu sed rutrum. Phasellus adipiscing placerat dolor ac faucibus. Vestibulum justo arcu, vestibulum sit amet scelerisque eget, sagittis vitae nulla. Etiam eros ante, adipiscing id viverra eu, tincidunt dictum risus. Etiam eu nisi at ante consequat pretium sed ac justo. Cras venenatis lectus dui, id gravida leo pretium in. Quisque facilisis mi quam, vel luctus libero ullamcorper vel. Curabitur nec mollis tortor, in cursus felis. Nulla bibendum vestibulum justo nec eleifend. Proin ut enim mauris. Aliquam auctor quam at mi posuere porttitor.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Proin aliquet orci nec convallis interdum. Donec massa nulla, cursus eu scelerisque id, iaculis non felis. Praesent accumsan suscipit sapien sit amet pellentesque. Etiam eu semper ligula. Donec ornare placerat metus, sit amet semper risus. Maecenas tempor eget nunc ultricies suscipit. Aliquam nec arcu nisl. Maecenas velit sem, porta eu eleifend non, placerat et sem. Sed a rutrum felis. Duis laoreet justo vel nibh dictum, sodales pulvinar diam laoreet. Ut dictum, felis vitae dictum pellentesque, velit nibh tempor leo, sit amet semper mi quam et velit. Morbi mattis turpis a tristique convallis. Maecenas eu dapibus eros, non rhoncus tortor. Aliquam sollicitudin diam at sem ullamcorper, et faucibus ante eleifend. Ut scelerisque molestie mi, ac euismod orci scelerisque a.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Mauris nec pretium nulla. Donec ullamcorper velit dignissim, commodo nisl ac, pellentesque odio. Etiam venenatis rutrum sapien, at sollicitudin mi luctus at. Vivamus eu lectus sit amet nisi eleifend fringilla. Suspendisse sollicitudin posuere nisi ullamcorper sollicitudin. Sed sit amet pretium nunc, scelerisque gravida orci. Phasellus ut neque gravida, commodo lectus sit amet, cursus enim. Morbi lorem massa, faucibus nec ullamcorper in, mattis et massa. Etiam in sapien nisi. Maecenas leo lacus, pellentesque non augue ut, placerat tincidunt tortor. Curabitur viverra fringilla ante. Sed tincidunt, lacus dapibus placerat feugiat, mi justo blandit lectus, eget gravida est orci eget dolor. Morbi ut est tristique, tincidunt velit ac, scelerisque ante. Morbi est magna, iaculis id odio in, dictum suscipit eros. Phasellus ornare eu eros sed accumsan. Duis porttitor purus id aliquam ornare.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Aenean enim leo, tristique laoreet metus id, malesuada iaculis sem. Mauris gravida, est ut volutpat rutrum, turpis lorem rutrum massa, vitae sagittis dolor quam nec dui. Aliquam fringilla mauris condimentum felis viverra gravida. In semper posuere scelerisque. Quisque vitae vulputate ante, at imperdiet arcu. Nam eget faucibus neque. Quisque id mattis augue.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Nulla facilisi. Integer quam lacus, pulvinar sed euismod lacinia, dignissim sit amet nulla. Curabitur a massa lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a commodo magna, non lacinia velit. Mauris condimentum purus sit amet tortor lobortis congue. Nulla facilisi. Ut at ligula ipsum. Proin venenatis ultrices lorem, quis consequat urna iaculis a. Nunc scelerisque rutrum urna, ut malesuada nisi malesuada sed. Curabitur sodales, nisl vel hendrerit consectetur, quam sem venenatis augue, quis aliquet turpis dolor eget metus. Morbi iaculis consequat tellus, vitae pellentesque turpis.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Donec ullamcorper ornare ultricies. Duis nec aliquet elit. Vivamus laoreet magna ac urna ullamcorper, non eleifend dui elementum. Proin in velit et turpis tristique gravida eu ut leo. Maecenas id neque fermentum odio euismod gravida. Nam malesuada elit ac cursus sodales. Duis vel nibh sit amet libero malesuada dapibus. Praesent id elit vel sem tempus sodales. Nullam volutpat vulputate lorem luctus commodo. Aliquam leo sem, vehicula eu blandit ac, tempus laoreet neque. Etiam malesuada rutrum dui sit amet vehicula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus condimentum blandit purus in varius. Phasellus mollis ante orci, sit amet pellentesque magna rhoncus a. Quisque vel erat varius, pretium arcu at, molestie velit. Quisque dignissim sagittis augue eu condimentum.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Nunc quis sem volutpat, cursus ipsum ut, tincidunt est. Etiam eu ullamcorper lorem. Cras eu purus risus. Pellentesque placerat quis nibh non malesuada. Nulla sit amet magna quis mi faucibus iaculis sit amet quis risus. Integer eget sagittis sem. Pellentesque fringilla sit amet nisi quis venenatis. Suspendisse potenti. Donec at ipsum sem. Integer porta luctus turpis vel semper. Nunc ac porta lacus. Aliquam sed mi neque.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Fusce ac blandit sem. Donec ut quam tincidunt, consequat nulla eget, vehicula purus. Duis ante lacus, suscipit ut eleifend nec, placerat adipiscing dui. Cras at tempus lacus, venenatis vehicula risus. Pellentesque justo risus, ultricies non ipsum vehicula, tincidunt laoreet lectus. Vivamus venenatis eget tortor in aliquet. Ut ante enim, viverra eu laoreet viverra, facilisis vitae sem. Donec id nunc vel lorem placerat rhoncus. Nullam consectetur, orci a volutpat scelerisque, neque odio vestibulum est, venenatis cursus ipsum mauris vel est. Integer ac dapibus mauris.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Mauris tincidunt facilisis nulla. Vivamus semper, elit id placerat pellentesque, nunc elit pellentesque purus, molestie ultricies eros nulla venenatis ipsum. Vestibulum in faucibus ligula. Aenean pellentesque vulputate lacus, ac varius est tempor sed. Nam volutpat condimentum neque, interdum molestie mi dapibus vitae. Quisque at lectus adipiscing, iaculis erat vitae, pharetra nisl. Proin tristique magna et lobortis sagittis. Morbi nec convallis ligula. Nunc et fringilla magna, ultrices consectetur erat. Duis velit mi, pharetra sed sapien eget, pulvinar tristique enim.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Pellentesque ultricies volutpat lectus vitae ultrices. Donec ultricies diam ac turpis tempus venenatis. Donec mattis, lectus id congue dapibus, eros felis elementum mauris, in rhoncus nisl ligula eget mi. Aliquam elementum massa dui, non fermentum ipsum hendrerit et. Aenean mi augue, tincidunt sed ullamcorper id, dictum quis tellus. Maecenas interdum gravida massa id dictum. Integer venenatis rhoncus augue et tincidunt.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Mauris pulvinar leo eu mauris tempor dictum. Ut ornare, metus nec lacinia laoreet, leo neque interdum sapien, eget auctor augue magna et leo. Cras luctus feugiat enim. Suspendisse non sodales sem, id mattis ipsum. Aliquam vulputate rhoncus egestas. Proin nulla mi, accumsan a sodales quis, ultricies at enim. Sed interdum ante eget mauris imperdiet, sed lobortis neque gravida. Aliquam adipiscing consequat arcu non viverra. Curabitur orci nibh, interdum a aliquam sed, commodo in sem. Aliquam eu felis vel augue auctor cursus.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Integer rutrum lacus quam, vitae sodales lorem mollis id. Pellentesque sed diam nisi. Donec fringilla justo arcu, ut porttitor nisl scelerisque et. Suspendisse eu nisi tortor. Vivamus fringilla quam nec pretium porttitor. Phasellus rhoncus arcu mauris, sed congue ligula aliquam id. Curabitur quis sem eros. Sed odio risus, scelerisque vitae dolor vestibulum, ullamcorper feugiat orci.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Morbi sed convallis tortor, euismod rhoncus diam. Pellentesque a diam et nunc fermentum suscipit. Sed hendrerit elit quis justo fringilla commodo. Nunc a tortor aliquet mi scelerisque eleifend porta id magna. Nam sagittis nulla felis, at iaculis nulla auctor et. Phasellus semper ipsum quis lobortis pretium. Cras mattis ultrices lectus. Suspendisse nulla erat, faucibus sed posuere vel, tincidunt in mauris.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Vivamus porttitor diam eget blandit sollicitudin. Ut sit amet molestie odio, et condimentum arcu. Nunc vehicula ac ligula eu dapibus. Maecenas at ante vitae diam placerat pellentesque. Nullam dui sapien, fringilla in leo in, dapibus convallis enim. Sed ut imperdiet purus. Proin elementum, tortor vitae consectetur cursus, eros tellus volutpat justo, id ornare sapien sem in augue. Sed tempus nec felis at scelerisque. Morbi volutpat hendrerit nibh eget rutrum.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean porttitor sapien id leo varius, vel hendrerit elit tempor. Maecenas mattis, massa in hendrerit imperdiet, mauris nibh luctus metus, in hendrerit sem massa id nibh. Phasellus luctus turpis risus, eget condimentum nulla ullamcorper nec. Integer lacinia ligula non nisl condimentum euismod elementum in eros. In fermentum adipiscing ipsum, a tempor ligula elementum ut. Suspendisse vehicula massa a sapien suscipit, ut tempus erat pellentesque. Nullam purus metus, fringilla nec dignissim id, bibendum id velit. Mauris interdum semper risus, et semper sapien consequat a. Mauris sagittis suscipit ligula ut accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin scelerisque luctus magna vitae cursus. Pellentesque hendrerit ante vel elit vehicula, et viverra libero vestibulum. Praesent in hendrerit eros.&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;Aliquam ac pretium purus. Sed eleifend justo nec orci euismod condimentum. Aliquam aliquam at neque eu viverra. Proin et purus lacus. Fusce nec eleifend dolor, ut commodo turpis. Mauris quis nisl sed orci tempor dignissim. In turpis purus, scelerisque vel vehicula nec, eleifend eget eros. Fusce aliquet, nulla sed tempor tristique, massa nibh eleifend orci, eu accumsan metus mi non dui. Duis auctor sagittis purus. Curabitur eu ornare enim. Mauris quis nulla porttitor purus eleifend gravida a quis mauris.&lt;/p&gt;\n', '', '', 250, 1, '2014-07-23 08:13:01', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 1),
(180, 'startrek.jpg', 'Star Trek', 35, '', '2014-09-06 12:28:48', 666, 'Star Trek (z angl.: „Hviezdne putovanie“) je spoločné pomenovanie pre šesť sci-fi seriálov, jedenásť filmov, desiatok kníh a počítačových hier, ktoré sa odohrávajú v sci-fi prostredí.\n\nStar Trek a názvy seriálov sú registrované ochranné známky CBS Corporation, dcérskej spoločnosti Paramount Pictures.\n\nTvorcom prvých sérii a filmov bol Gene Roddenberry, ktorý sa snažil ukázať optimistickú budúcnosť ľudstva, v ktorej sú prekonané choroby, chudoba, rasizmus, intolerancia, neustále vojnové konflikty a hlavnou myšlienkou ľudstva sa stáva snaha o poznávanie nových svetov a civilizácií.', '', '&lt;h3&gt;Star Trek&lt;/h3&gt;\n\n&lt;p&gt;Prv&amp;yacute; &lt;em&gt;&lt;a href=&quot;http://sk.wikipedia.org/w/index.php?title=Star_Trek_%28seri%C3%A1l%29&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Star Trek&lt;/a&gt;&lt;/em&gt; bol odvysielan&amp;yacute; v roku &lt;a href=&quot;http://sk.wikipedia.org/wiki/1966&quot;&gt;1966&lt;/a&gt; ako hran&amp;yacute; seri&amp;aacute;l. Dnes sa z rozli&amp;scaron;ovac&amp;iacute;ch d&amp;ocirc;vodov ozna&Auml;', '', '', 259, 1, '2014-07-23 10:06:40', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 1),
(181, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-07-23 12:28:39', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(182, 'avatar_default.jpg', '', 0, '', '2014-09-15 11:33:45', 778, '', '', '', '', '', 250, 0, '2014-08-01 08:50:22', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(183, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-08-01 09:38:59', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(184, '', '', 0, '', '2014-09-16 19:16:26', 23, '', '', '', '', '', 250, 0, '2014-08-02 17:15:36', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 0),
(185, 'favicon.png', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 250, 0, '2014-08-05 07:40:06', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(186, '', '', 0, '', '2014-09-20 13:45:08', 0, '', '', '', '', '', 250, 0, '2014-08-06 11:45:04', 0, 0, 0, '0000-00-00', 0, '', '', 1, 3, 0, 1),
(187, 'Desert.jpg', 'First HTTPS project', 35, '', '2014-09-20 16:11:46', 5000, 'Kratky popis projektu', '', '', '', '', 250, 1, '2014-08-06 13:55:55', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(188, 'dots.jpg', '', 0, '', '2014-09-21 18:36:47', 0, '', '', '', '', '', 250, 0, '2014-08-07 16:36:25', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(189, 'jelmezbal.jpg', 'dhfskj hdfkj hdskj fhsd', 36, '', '2014-09-27 08:09:57', 15, 'jjjjjjj', '', '', '', '', 250, 0, '2014-08-11 09:35:46', 0, 0, 0, '0000-00-00', 0, '', '', 1, 4, 0, 0),
(190, '', '', 0, '', '0000-00-00 00:00:00', 0, '', '', '', '', '', 265, 0, '2014-08-26 07:54:21', 0, 0, 0, '0000-00-00', 0, '', '', 1, 2, 0, 0),
(191, 'GardenED.jpg', 'vsdvbsdv', 34, '', '2014-11-20 10:39:03', 5, 'Hieronimus Bosh', '', '&lt;div style=&quot;color: rgb(0, 0, 0); font-family: Arial, Tahoma, Helvetica, FreeSans, sans-serif; font-size: 14px; line-height: 21.7350006103516px; text-align: justify; background-color: rgb(185, 181, 204);&quot;&gt;Ja nech&amp;aacute;pem ako niekto (&amp;Aring;&amp;frac34;e, mil&amp;aacute;&amp;Auml;&lt;/div&gt;\n', '', '', 267, 0, '2014-10-06 08:34:59', 0, 0, 0, '0000-00-00', 0, '', '', 1, 5, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `df45s_project_news`
--

CREATE TABLE IF NOT EXISTS `df45s_project_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited` datetime NOT NULL,
  `title` varchar(500) COLLATE utf8_bin NOT NULL,
  `news` longtext COLLATE utf8_bin NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `hiden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `df45s_project_news`
--

INSERT INTO `df45s_project_news` (`id`, `created`, `edited`, `title`, `news`, `project_id`, `user_id`, `deleted`, `hiden`) VALUES
(1, '2014-06-26 11:19:18', '2014-06-26 07:32:33', 'Pridana prva novynka k prujektu', 'Lorem Ipsum je fiktívny text, používaný pri návrhu tlačovín a typografie. Lorem Ipsum je štandardným výplňovým textom už od 16. storočia, keď neznámy tlačiar zobral sadzobnicu plnú tlačových znakov a pomiešal ich, aby tak vytvoril vzorkovú knihu. Prežil nielen päť storočí, ale aj skok do elektronickej sadzby, a pritom zostal v podstate nezmenený. Spopularizovaný bol v 60-tych rokoch 20.storočia, vydaním hárkov Letraset, ktoré obsahovali pasáže Lorem Ipsum, a neskôr aj publikačným softvérom ako Aldus PageMaker, ktorý obsahoval verzie Lorem Ipsum.\n\n\n\nJe dávno známe, že ak je zrozumiteľný obsah stránky, na ktorej rozloženie sa čitateľ díva, jeho pozornosť je rozptýlená. Dôv\n\n\nodom použitia Lorem Ipsum je fakt, že má viacmenej normálne rozloženie písmen, takže oproti použitiu ''Sem príde text, sem príde text'' sa obsah vypĺňanej oblasti na stránke viac podobá na skutočný text. Mnohé balíky publikačného softvéru a editorov webových stránok už používajú Lorem Ipsum ako predvolený výplňový text a keď dáte na internete vyhľadávať ''lorem ipsum'', objavíte mnoho webových stránok v rannom štádiu ich vzniku. V minulých rokoch sa objavilo mnoho verzií tohto textu, niekedy náhodou, niekedy úmyselne (pridaný humor a podobne).\n\n \nNapriek všeobecnému presvedčeniu nie je Lorem Ipsum len náhodný text. Jeho korene sú v časti klasickej latinskej literatúry z roku 45 pred n.l., takže má viac ako 2000 rokov. Richard McClintock, profesor latinčiny na Hampden-Sydney College vo Virgínii, hľadal jedno z menej určitých latinských slov, consectetur, z pasáže Lorem Ipsum, a ako vyhľadával výskyt tohto slova v klasickej literatúre, objavil jeho nepochybný zdroj. Lorem Ipsum pochádza z odsekov 1.10.32 a 1.10.33 Cicerovho diela "De finibus bonorum et malorum" (O najvyššom dobre a zle), napísaného v roku 45 pred n.l. Táto kniha je pojednaním o teórii etiky, a bola veľmi populárna v renesancii. Prvý riadok Lorem Ipsum, "Lorem ipsum dolor sit amet..", je z riadku v odseku 1.10.32.', 140, 250, 0, 0),
(2, '2014-06-26 11:39:23', '0000-00-00 00:00:00', 'gs  gfssssdfdfg sdfg sd fg', 'sdf gsd fgsdfg s dfg d g sdfs\\nfsf g dfg sdg sdfg sf sdf', 140, 250, 1, 0),
(3, '2014-06-26 12:19:46', '0000-00-00 00:00:00', 'fdsgfgs', 'dfg df sgdd', 140, 250, 1, 0),
(4, '2014-06-26 12:20:11', '0000-00-00 00:00:00', 'Druha novinka pridaná cez formulár', 'ľ\nš\nč\nť\nž\ný\ná\ní\né\n', 140, 250, 1, 0),
(5, '2014-06-26 12:24:04', '0000-00-00 00:00:00', 'Toto by ma,o byt vymazane', 'asdasdasdasdasd', 140, 250, 1, 0),
(6, '2014-06-26 13:05:33', '0000-00-00 00:00:00', 'gdsfgsd', 'Lorem Ipsum je fiktívny text, používaný pri návrhu tlačovín a typografie. Lorem Ipsum je štandardným výplňovým textom už od 16. storočia, keď neznámy tlačiar zobral sadzobnicu plnú tlačových znakov a pomiešal ich, aby tak vytvoril vzorkovú knihu. Prežil nielen päť storočí, ale aj skok do elektronickej sadzby, a pritom zostal v podstate nezmenený. Spopularizovaný bol v 60-tych rokoch 20.storočia, vydaním hárkov Letraset, ktoré obsahovali pasáže Lorem Ipsum, a neskôr aj publikačným softvérom ako Aldus PageMaker, ktorý obsahoval verzie Lorem Ipsum.\n\n\n\nJe dávno známe, že ak je zrozumiteľný obsah stránky, na ktorej rozloženie sa čitateľ díva, jeho pozornosť je rozptýlená. Dôv', 140, 250, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `df45s_project_status`
--

CREATE TABLE IF NOT EXISTS `df45s_project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `df45s_sessions`
--

CREATE TABLE IF NOT EXISTS `df45s_sessions` (
  `id` char(128) NOT NULL,
  `set_time` char(10) NOT NULL,
  `data` text NOT NULL,
  `session_key` char(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `df45s_users`
--

CREATE TABLE IF NOT EXISTS `df45s_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` char(128) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `e_mail` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_since` datetime NOT NULL,
  `salt` char(128) NOT NULL,
  `img` text NOT NULL,
  `about` mediumtext NOT NULL,
  `FB_id` bigint(20) unsigned NOT NULL,
  `url` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=268 ;

--
-- Dumping data for table `df45s_users`
--

INSERT INTO `df45s_users` (`id`, `username`, `password`, `name`, `last_name`, `e_mail`, `last_login`, `member_since`, `salt`, `img`, `about`, `FB_id`, `url`, `phone`) VALUES
(250, 'sudecc', '7fee311acbb44fd9799dc11f53cb68844b5554952e9a09218b07f99cae5c3d5044f6d2968f14d79285c76a49735c9e55c69a0d8ca1d03f17dffd822aadf55d59', 'Viktor ', 'Sudicky', 'viktor.sudicky@gmail.com', '2014-03-10 12:25:26', '2014-03-10 13:25:26', '77a19f4e73075daed88cc22a416fe61c74b81a3e6295db1f1fc5bcc3883bb289ce83b778c81a81bd85f97140be39041f46451c5cd6c56f616d2df1031b3b48d3', 'DSC00021.JPG', 'Tu je nieco kratke o mne. Davam to sem aby sa nic nepovedalo. Nananana. Bla', 0, 'sudec.net', '4219034693487'),
(252, 'nusi00', '0879820f35d2b85ab2a32015b5b2bb3d3bf63a336aeaee9bdccf7c05b9690b6762fc0787720f49a83f79b2e57590a84d27d26f04a8716e2fc96e93832dd5dc0e', NULL, NULL, 'hdfkjh@fdfd.sl', '2014-03-10 19:09:10', '2014-03-10 20:09:10', '29a186eed07645b138e2676c0a785d6403a56030ed71a7f96bf27d22f0475567f78080eb7922c3221a748ad76c616e7b9e8600cfc2786caedf58be3e80db091d', '', '', 0, '', '0'),
(254, 'sudec', 'ff9365a09cc1b2b8a881ebef61249e110a3b4b1e898fe0abd3bdeac32277064cffaa2493fe728662bf70b9779425273a80316d748b6a7c016d06f1f02cdd45a8', NULL, NULL, 'dkjdfkljdflk@dslkjdsl.sl', '2014-03-31 14:00:50', '2014-03-31 16:00:50', 'a0f844a3cba23a12ef8a5ddae89618a40562cd8a148dde95e1b01cf84d1943dd9fad6f5b71cd0f1b410d8c12570af0d8946f33f149589f9777df24638d28dad5', '', '', 0, '', '0'),
(255, 'sudec1', '53e14447c7b528d30135576cea66672257a2606f6d07dca21e5a1d9e95d48e37a5155a3855b3fef28e174b68c811da851b01c27085f3e5a151d8f7c37024bc7c', NULL, NULL, 'no@no.no', '2014-03-31 14:01:43', '2014-03-31 16:01:43', '46f18814aadbb55aadb5e303a18a002a1f41e47cde385632f1210ea37c5b667ddf6c059b07704011459cb4965332f631907ee7a2a7bcb8bc6c3b02ef305ce29a', '', '', 0, '', '0'),
(257, 'sakramentsky_dlhe_prihlasovaci', 'd3216f1f001f5372582e0a8b939bae40359f3f4feac5c063785010e7e48984c4abe89dcb247c5b396dc89da7a188421f87b6af3c0f3c21e2acb4f3db62fb6f09', NULL, NULL, 'dssd@dsjkdsjk.sl', '2014-06-26 11:52:08', '2014-06-26 13:52:08', '72b3c9a6c2eacaee7c95dbbca8bafdadb2db115620d6e31a03550134cd7960e3acd79dc559c191453640dcd5263762bcdb2f830b16f22379dc9ad061b5c3ebd2', '', '', 0, '', '0'),
(258, '1111111', '5a828e7045529c9186876bf02bf6b51bfec14e552ee5ea811b64dd3b2df5d4c884803be1ae2b78eeada5f0b1e7d6ec5c37412b3bf87ea5154d19b7387367bdc5', NULL, NULL, '123456@dsdssd321.sl', '2014-06-26 11:53:23', '2014-06-26 13:53:23', 'c6dbbf4845b2ae40f37a77d4c3faff7ac6f39ac71f33ec4e1947aeb0bb3cee30530d4e5313c533d5c7310bc0a65346e5dc8ef4be4be40cb13c89f2f0648371c6', '', '', 0, '', '0'),
(259, 'Demoslav', '2f0ecca8a24b0e604596bfecdd08df07637c1d2de1d562f5aa91250e3a848acb32bfde78ce670ec1f3f534ca7a36030e6b95c3f7ba09db8bd25584019d1dfe93', NULL, NULL, 'dusanori@gmail.com', '2014-07-22 11:51:49', '2014-07-22 13:51:49', 'd921e7ee0e3445c27bfecec28cb558397d28c3005225c9c741d61106554d7822e9b180a3ff08eddd91c1a08156eb2398a621846524342169f12933d040efe74c', '', '', 0, '', '0'),
(260, 'jhvjhjhfgjhfdh', 'aa010ddbe32e7f7ca7a4953abfb8767f81db2ca61dfe263d4854c18b21cd4b1ef38f0cc3d8457439bef6df06b7534ea59dc8cf69c8bf8c9a88ba768f5750a9d1', NULL, NULL, 'viktor.sudicky@gmail.com', '2014-08-04 13:55:53', '2014-08-04 15:23:55', '57e1776609d0880108f6b2aa160da30dea61d56c6c546f795f005dd7f535bf0f6130ffc003ed81ccd69161a076e5f1376b3db8c6af2e70dab3467ad376d0f046', '', '', 0, '', '0'),
(261, 'sudec987', 'b0af369457ed1eb4c4476b01e141660e3fd06105ece2945bee72ab6f0580868638cf39646429673295f0a5b33cc4ce068bab2fdef5ea9a76fa02ed89a41132a6', NULL, NULL, 'viktor.sudicky@gmail.com', '2014-08-04 13:57:57', '2014-08-04 15:57:21', '1a56c52887641dfd60dd03c699ae160c6854e1dfd9eaf0f303a9ae5ab82e85e060e7d00ae00b68f5d408693c002362124442daccb9493307c493d7af72030808', '', '', 0, '', '0'),
(262, 'sudec11', 'c89504d214d589c3f901ef631e44dd9f2d5a2244ea70dccd818f3cccd03798af8563e64d857630ae0544f42dbdfbfdcd924c9409799fec9548de1ead5c74de33', 'erwtwertwertwet', '', 'sudec@centrum.sk', '2014-08-07 11:09:18', '2014-08-07 13:08:56', '46127fd343675463bf8045ea9e3892794aa542df88e73854fa222d9152bdc801f47248cdbf0db13ef9d440865edc0fc3e7dc42eea421b3a581ec7f82ac655fa8', 'Penguins.jpg', '', 0, '', ''),
(265, '', '', 'Viktor', 'Sudicky', 'viktor.sudicky@gmail.com', '2014-08-21 07:41:08', '2014-08-21 09:41:08', '', '', '', 10152518241650050, '', ''),
(266, 'sudec12', 'a3c4a07b1dc74ac68ec283bc8241c00e2e3ed48e4dfacfcf7a47bc39980560121b01333ddfc18e1eef9999fcbf2882d77d7883cdaca41754f24ec457cd36646f', NULL, NULL, 'sudec@centrum.sk', '2014-09-09 11:43:03', '2014-09-09 13:40:15', 'a9f68cb5cf000fe283df16aff4b1e898ed78cde3bc55c5e61c4685afd94343e63cd82032b20ab72ffe31b96cfcdf302e3603b2860faacefde8a18949bed09833', '', '', 0, '', ''),
(267, 'asdfg', '398b0da0ec0ea0572ffef7c16783d8a573e35822c1844aae37385b3509d5612059f1dbb6199db7ab0a7d3cd76481b985019d7e1b261df02ef3e0bfa36a6aa293', '', '', 'dusanori@gmail.com', '2014-10-06 08:10:40', '2014-10-06 10:09:14', 'fe7c7791c926e85abcac960c5348fce6435fa6348d329e6c991a2611da02597058e3346f87238394a45ff318fb56c08e694e46bfa1a877b418fa1981ba92e857', 'GardenED.jpg', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_users_login_attempts`
--

CREATE TABLE IF NOT EXISTS `df45s_users_login_attempts` (
  `entry_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`entry_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `df45s_users_login_attempts`
--

INSERT INTO `df45s_users_login_attempts` (`entry_ID`, `user_id`, `time`) VALUES
(12, 254, '1397467308'),
(13, 254, '1401303040'),
(18, 255, '1403783832'),
(16, 254, '1403783255'),
(19, 254, '1403854319'),
(29, 255, '1410262269'),
(30, 255, '1410262792');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_users_not_confirmed`
--

CREATE TABLE IF NOT EXISTS `df45s_users_not_confirmed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` char(128) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `e_mail` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_since` datetime NOT NULL,
  `salt` char(128) NOT NULL,
  `img` text NOT NULL,
  `about` mediumtext NOT NULL,
  `confirm_hash` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=276 ;

--
-- Dumping data for table `df45s_users_not_confirmed`
--

INSERT INTO `df45s_users_not_confirmed` (`id`, `username`, `password`, `name`, `last_name`, `e_mail`, `last_login`, `member_since`, `salt`, `img`, `about`, `confirm_hash`) VALUES
(260, 'sudo123', '1e74d6b39583ce0faa622bc5e1e137606655084b3802700a0b06c1cf823fe091f6550da8dcffff2241032eff305ebed13ae07585f9c82454db1036bcc765a0ec', NULL, NULL, 'sudec@centrum.sk', '2014-08-04 12:36:14', '2014-08-04 14:36:14', '4be58422b1b53bd4108f69031f7ecab1f564ade627129b38f19179319ccc79b05f1e593d5bee3c5a3471d51d952af5e202318be05e48619065d012d23e332eff', '', '', '0'),
(261, '132456', '80fd4d543b913333fe0c6c63c6d72cad01ffdafbbab18f2e668feb9ce7626fa353adb77361ff2c4129b72f29891ba286c1d10f515844bedacc18ae2cc2c68329', NULL, NULL, '123@123.123', '2014-08-04 12:41:07', '2014-08-04 14:41:07', '0f6f678e2660012f65ecc0e40de93a6f4c0c3e84b14b1f8c79921af424de4d412fbfe41885318293b40242244b1050337c29f68188cd0a9ef5559ee96fd49ede', '', '', '9cfee3196305b685ba8bdcae8250388dad4e972af6df27957ca47ed79fb51e2ac10405cb906013966d2db439b9eab55f06933dc07a9023947eb4aa3ec03f167b'),
(263, '1324567', '3f5dfe184aa3a77651642150b332e264545f6fa8e7fa3b29f312819bd115f4786880f8592e9701a1d4d18b4e4445d4d357eb7eda8953b489b9defc8d64c39ae5', NULL, NULL, '123@123.123', '2014-08-04 12:41:53', '2014-08-04 14:41:53', 'ace37a7c72d2e74b517e160e04663daeddf000aecc56408b5621c6925614b0f929edb52a682f2b69797327b4fd1e833e7bfb2a43566908719740ca583c74cc2e', '', '', '8fb247f6def2dfe412ce96f71e05f9cc162e67e94978e41c6facb9467b3e6ee82999b8669ef3873151c175542d96cc7cb222afca974dd6207711f511cd776fa8'),
(264, 'hfkjdhkjsfhds', '70995467200107842d349cecfae1203f902fd2076c8bc9b8c9ef57bb27beb74389e4cb2649dbb3ddc0e2c50e36cf8a30afb10564103f3673f28454bb2c191558', NULL, NULL, 'viktor.sudicky@gmail.com', '2014-08-04 12:56:45', '2014-08-04 14:56:45', '839b655d7e40382a4e153f0107bc3338eb45493c7347a345b22ee6b79bf4873f74390b06137a8c4fd6dab171d9ddcf0a1c437829c7dd65a6df4d11b28c0e6f27', '', '', 'c5a24f99208b6dffe8627c4c6abe27fa4f59b6edaf16c8b9acccd18258a52f89d2dbdeb876e691fd09f6dda45f81208f6b3aa1b00d0a34e6fb999bbca172edfe'),
(265, 'jhvjhjhfgjhfdh', 'aa010ddbe32e7f7ca7a4953abfb8767f81db2ca61dfe263d4854c18b21cd4b1ef38f0cc3d8457439bef6df06b7534ea59dc8cf69c8bf8c9a88ba768f5750a9d1', NULL, NULL, 'viktor.sudicky@gmail.com', '2014-08-04 13:23:55', '2014-08-04 15:23:55', '57e1776609d0880108f6b2aa160da30dea61d56c6c546f795f005dd7f535bf0f6130ffc003ed81ccd69161a076e5f1376b3db8c6af2e70dab3467ad376d0f046', '', '', '30519786bd5d91f33b3d75f4d96c691c6a92e829f39afe30b64d5825e9ff83c9d41381aacd679dec3389fe101bdd7cef0da50c8f7d31787c8f0f6a4d6cfa9d78'),
(266, 'sudec987', 'b0af369457ed1eb4c4476b01e141660e3fd06105ece2945bee72ab6f0580868638cf39646429673295f0a5b33cc4ce068bab2fdef5ea9a76fa02ed89a41132a6', NULL, NULL, 'viktor.sudicky@gmail.com', '2014-08-04 13:57:21', '2014-08-04 15:57:21', '1a56c52887641dfd60dd03c699ae160c6854e1dfd9eaf0f303a9ae5ab82e85e060e7d00ae00b68f5d408693c002362124442daccb9493307c493d7af72030808', '', '', '606bea77b6d613789f9932882afd313f2c1e0010ab3dfd6122952544f8cf54b9918d37e97be2bdec908c4d566dd509212d9f402a6bd3817f28b7a6569eaf481f'),
(267, 'lkgfjdsh', 'e49c9fcfca685d280535c53c2fb2abe577110f11eaadc27196a3c96d3072cce3013d891a8485ec75eee4ebf5063b6cf737ff09b4084fa379b1f74ce3c52d394a', NULL, NULL, 'hlkjh@lkjhlkhj.sl', '2014-08-07 11:05:12', '2014-08-07 13:05:12', '45985bd81d1f475e14b3f7e55eb076a5201dc51e294a46a102b5b2beab97360cf77ca7c040218fd4ab196e6ba8f84057cc0689e40d4dc67c76004b34831f3b15', '', '', '2781f7de320a290fb5bb3aa6a9648db42c3633c0092076cd363ce113a19cc189519f626f7ba71d615227bfa3af7125ab7826a955244b932a19719fd8c5e7692c'),
(268, 'sudec2', '78f3607327b759aaff1b4f6a26414982b89b766c971fc50027ff125fd6a89568b0d70c66256362ef5a1fb4386748daeb762f7ab2a5b2f97a46fde58f2daa8e11', NULL, NULL, 'sudec@centrum.sk', '2014-08-07 11:07:36', '2014-08-07 13:07:36', 'e06118274f0f02dfedc208c12a48fa9942604801d1646405decf09898eedc9a934cb615df46917f033f5e6df9555b529ff067f4b459c3e11f376bc0eae8a9637', '', '', '3cb8046fc2e2197547726ae759757070ce063de16474c4431649b79eb426edd0fa9e82489681fbb94941fd1ca182d4cd8dd33b2e33e7e4f87aad459b81294b33');

-- --------------------------------------------------------

--
-- Table structure for table `df45s_user_details`
--

CREATE TABLE IF NOT EXISTS `df45s_user_details` (
  `entry_ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `company` varchar(150) NOT NULL,
  `ICO` int(11) NOT NULL,
  `DIC` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `lastname` varchar(300) NOT NULL,
  `street_adress` varchar(300) NOT NULL,
  `street_number` varchar(300) NOT NULL,
  `city` varchar(300) NOT NULL,
  `PSC` varchar(300) NOT NULL,
  `phone` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `IBAN` varchar(300) NOT NULL,
  `SWIFT` varchar(300) NOT NULL,
  `account_number` int(11) NOT NULL,
  `bank_number` int(11) NOT NULL,
  `web_page` text NOT NULL,
  `FB_account` text NOT NULL,
  PRIMARY KEY (`entry_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `df45s_user_details`
--

INSERT INTO `df45s_user_details` (`entry_ID`, `userID`, `projectID`, `type`, `company`, `ICO`, `DIC`, `name`, `lastname`, `street_adress`, `street_number`, `city`, `PSC`, `phone`, `email`, `IBAN`, `SWIFT`, `account_number`, `bank_number`, `web_page`, `FB_account`) VALUES
(47, 250, 120, 1, '55555', 5555, '5555555', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '555', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '1PVXD6GbFRz47qnpFuFQGAX8NuycTusXxQ', '55555555', 0, 0, '', ''),
(46, 250, 132, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '551651651651651', '651651', 0, 0, '', ''),
(45, 250, 129, 1, 'WebVibes s.r.o.', 2147483647, 'SK154312315', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', 'Ljkldfjklfj', '45465456464', 0, 0, '', ''),
(44, 250, 127, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', 'SK14521287459631', '456456', 0, 0, '', ''),
(48, 250, 140, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '42', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '1PVXD6GbFRz47qnpFuFQGAX8NuycTusXxQ', '1651651', 651651651, 651651651, 'www.sudec.net', 'https://www.facebook.com/viktor.sudicky?ref=tn_tnmn'),
(49, 250, 161, 1, 'Sudicky', 0, 'Sudicky', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', 'dfdsfsdfsfds', 'dsfsdfsdf', 0, 0, '', ''),
(50, 250, 164, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', 'ľš', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', 'dddsfdfs', 'fdsdsffdssdf', 0, 0, '', ''),
(51, 250, 162, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '53', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', 'fdfdfsdf', 'fdssfdsfdd', 0, 0, '', ''),
(52, 250, 165, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '1561651', '651651', 0, 0, '', ''),
(53, 250, 169, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '1PVXD6GbFRz47qnpFuFQGAX8NuycTusXxQ', 'fddfsds', 0, 0, '', ''),
(54, 250, 172, 0, '', 0, '', 'Viktor', 'Sudicky', 'Sidlisko 128', 'fgfd', 'fddf', 'dfdfdf', '421908307604', 'dfdfdfdf', 'dssdsdsd', 'sddssdsdsd', 0, 0, '', ''),
(55, 250, 179, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '15', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '651651651', '651651651', 651651651, 651651651, '', ''),
(56, 259, 180, 0, '', 0, '', 'Dusan', 'Ori', 'Dolná', '33', 'Kolarovo', '94603', '0908803604', 'dusanor@gmail.com', 'SK6546546546545646546464', 'TATSKBXSEsadasd', 989874988, 1100, '', ''),
(57, 250, 186, 0, '', 0, '', 'Viktor ', 'Sudicky', 'Sidlisko 128/17', '45', 'Zlate Klasy', '93039', '421908370604', 'viktor.sudicky@gmail.com', '33333333333333333', '33333333', 0, 0, '', ''),
(58, 267, 191, 0, '', 0, '', 'Dusan', 'Ori', 'Dolna', '33', 'Kolarovo', '94603', '56498416354', 'dusanori@gmail.com', 'asdasd', 'asdasdas', 2147483647, 200, '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
