-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 09 juin 2020 à 17:01
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `user_manage`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `number` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `box` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `postcode` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_pays` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `street`, `number`, `box`, `postcode`, `city`, `id_user`, `id_pays`) VALUES
(3, 'Avenue de la Bourgogne', '111', '', '7700', 'Mouscron', 56, NULL),
(4, 'avenue de la liberté', '123', 'A', '7500', 'Tournai', 57, NULL),
(6, 'rue de la grotte', '127', '02/003', '59690', 'Comines', 59, NULL),
(8, 'rue de la citadelle', '154', '3', '7608', 'Wiers', 61, NULL),
(9, 'rue de la citadelle', '154', '3', '7608', 'Wiers', 62, NULL),
(10, 'rue de la santé', '123', 'A', '59690', 'Comines', 63, NULL),
(12, 'rue de Ploegsteert', '129', '', '7782', 'Ploegsteert', 65, NULL),
(17, 'bkiqirlgz=sm', '8969', '', '7800', 'Tournai', 70, NULL),
(21, 'rue de la paix', '13', '', '59200', 'Tourcoing', 74, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cursus`
--

CREATE TABLE `cursus` (
  `id` int(11) NOT NULL,
  `class` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subclass` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `option` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `language_1` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `language_2` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `language_3` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `cursus`
--

INSERT INTO `cursus` (`id`, `class`, `subclass`, `option`, `language_1`, `language_2`, `language_3`, `id_user`) VALUES
(5, '1C', 'C', 'sport', 'anglais', 'néerlandais', '', 56),
(6, '2C', 'B', 'LATIN', 'anglais', 'néerlandais', 'espagnole', 57),
(8, '1C', 'B', 'math', 'anglais', 'néerlandais', '', 59),
(10, '2C', 'A', 'Sciences', 'néerlandais', 'anglais', '', 61),
(11, '2C', 'B', 'math', 'anglais', 'néerlandais', '', 62),
(12, '1C', 'A', 'sport', 'anglais', 'néerlandais', '', 63),
(14, '2C', 'A', 'math', 'néerlandais', 'anglais', 'espagnole', 65),
(19, '1C', 'B', 'sport', 'anglais', 'néerlandais', '', 70),
(23, '1C', '', '', '', '', '', 74);

-- --------------------------------------------------------

--
-- Structure de la table `educ_institute`
--

CREATE TABLE `educ_institute` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `establishment` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `id_uder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_parents`
--

CREATE TABLE `link_parents` (
  `id_parent` int(11) NOT NULL,
  `id_enfant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) UNSIGNED NOT NULL,
  `abbreviation_2` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pays_fr` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `abbreviation_2`, `pays_fr`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albanie'),
(3, 'AQ', 'Antarctique'),
(4, 'DZ', 'Algérie'),
(5, 'AS', 'Samoa Américaines'),
(6, 'AD', 'Andorre'),
(7, 'AO', 'Angola'),
(8, 'AG', 'Antigua-et-Barbuda'),
(9, 'AZ', 'Azerbaïdjan'),
(10, 'AR', 'Argentine'),
(11, 'AU', 'Australie'),
(12, 'AT', 'Autriche'),
(13, 'BS', 'Bahamas'),
(14, 'BH', 'Bahreïn'),
(15, 'BD', 'Bangladesh'),
(16, 'AM', 'Arménie'),
(17, 'BB', 'Barbade'),
(18, 'BE', 'Belgique'),
(19, 'BM', 'Bermudes'),
(20, 'BT', 'Bhoutan'),
(21, 'BO', 'Bolivie'),
(22, 'BA', 'Bosnie-Herzégovine'),
(23, 'BW', 'Botswana'),
(24, 'BV', 'Île Bouvet'),
(25, 'BR', 'Brésil'),
(26, 'BZ', 'Belize'),
(27, 'IO', 'Territoire Britannique de l\'Océan Indien'),
(28, 'SB', 'Îles Salomon'),
(29, 'VG', 'Îles Vierges Britanniques'),
(30, 'BN', 'Brunéi Darussalam'),
(31, 'BG', 'Bulgarie'),
(32, 'MM', 'Myanmar'),
(33, 'BI', 'Burundi'),
(34, 'BY', 'Bélarus'),
(35, 'KH', 'Cambodge'),
(36, 'CM', 'Cameroun'),
(37, 'CA', 'Canada'),
(38, 'CV', 'Cap-vert'),
(39, 'KY', 'Îles Caïmanes'),
(40, 'CF', 'République Centrafricaine'),
(41, 'LK', 'Sri Lanka'),
(42, 'TD', 'Tchad'),
(43, 'CL', 'Chili'),
(44, 'CN', 'Chine'),
(45, 'TW', 'Taïwan'),
(46, 'CX', 'Île Christmas'),
(47, 'CC', 'Îles Cocos (Keeling)'),
(48, 'CO', 'Colombie'),
(49, 'KM', 'Comores'),
(50, 'YT', 'Mayotte'),
(51, 'CG', 'République du Congo'),
(52, 'CD', 'République Démocratique du Congo'),
(53, 'CK', 'Îles Cook'),
(54, 'CR', 'Costa Rica'),
(55, 'HR', 'Croatie'),
(56, 'CU', 'Cuba'),
(57, 'CY', 'Chypre'),
(58, 'CZ', 'République Tchèque'),
(59, 'BJ', 'Bénin'),
(60, 'DK', 'Danemark'),
(61, 'DM', 'Dominique'),
(62, 'DO', 'République Dominicaine'),
(63, 'EC', 'Équateur'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Guinée Équatoriale'),
(66, 'ET', 'Éthiopie'),
(67, 'ER', 'Érythrée'),
(68, 'EE', 'Estonie'),
(69, 'FO', 'Îles Féroé'),
(70, 'FK', 'Îles (malvinas) Falkland'),
(71, 'GS', 'Géorgie du Sud et les Îles Sandwich du Sud'),
(72, 'FJ', 'Fidji'),
(73, 'FI', 'Finlande'),
(74, 'AX', 'Îles Åland'),
(75, 'FR', 'France'),
(76, 'GF', 'Guyane Française'),
(77, 'PF', 'Polynésie Française'),
(78, 'TF', 'Terres Australes Françaises'),
(79, 'DJ', 'Djibouti'),
(80, 'GA', 'Gabon'),
(81, 'GE', 'Géorgie'),
(82, 'GM', 'Gambie'),
(83, 'PS', 'Territoire Palestinien Occupé'),
(84, 'DE', 'Allemagne'),
(85, 'GH', 'Ghana'),
(86, 'GI', 'Gibraltar'),
(87, 'KI', 'Kiribati'),
(88, 'GR', 'Grèce'),
(89, 'GL', 'Groenland'),
(90, 'GD', 'Grenade'),
(91, 'GP', 'Guadeloupe'),
(92, 'GU', 'Guam'),
(93, 'GT', 'Guatemala'),
(94, 'GN', 'Guinée'),
(95, 'GY', 'Guyana'),
(96, 'HT', 'Haïti'),
(97, 'HM', 'Îles Heard et Mcdonald'),
(98, 'VA', 'Saint-Siège (état de la Cité du Vatican)'),
(99, 'HN', 'Honduras'),
(100, 'HK', 'Hong-Kong'),
(101, 'HU', 'Hongrie'),
(102, 'IS', 'Islande'),
(103, 'IN', 'Inde'),
(104, 'ID', 'Indonésie'),
(105, 'IR', 'République Islamique d\'Iran'),
(106, 'IQ', 'Iraq'),
(107, 'IE', 'Irlande'),
(108, 'IL', 'Israël'),
(109, 'IT', 'Italie'),
(110, 'CI', 'Côte d\'Ivoire'),
(111, 'JM', 'Jamaïque'),
(112, 'JP', 'Japon'),
(113, 'KZ', 'Kazakhstan'),
(114, 'JO', 'Jordanie'),
(115, 'KE', 'Kenya'),
(116, 'KP', 'République Populaire Démocratique de Corée'),
(117, 'KR', 'République de Corée'),
(118, 'KW', 'Koweït'),
(119, 'KG', 'Kirghizistan'),
(120, 'LA', 'République Démocratique Populaire Lao'),
(121, 'LB', 'Liban'),
(122, 'LS', 'Lesotho'),
(123, 'LV', 'Lettonie'),
(124, 'LR', 'Libéria'),
(125, 'LY', 'Jamahiriya Arabe Libyenne'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lituanie'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macao'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaisie'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malte'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritanie'),
(138, 'MU', 'Maurice'),
(139, 'MX', 'Mexique'),
(140, 'MC', 'Monaco'),
(141, 'MN', 'Mongolie'),
(142, 'MD', 'République de Moldova'),
(143, 'MS', 'Montserrat'),
(144, 'MA', 'Maroc'),
(145, 'MZ', 'Mozambique'),
(146, 'OM', 'Oman'),
(147, 'NA', 'Namibie'),
(148, 'NR', 'Nauru'),
(149, 'NP', 'Népal'),
(150, 'NL', 'Pays-Bas'),
(151, 'AN', 'Antilles Néerlandaises'),
(152, 'AW', 'Aruba'),
(153, 'NC', 'Nouvelle-Calédonie'),
(154, 'VU', 'Vanuatu'),
(155, 'NZ', 'Nouvelle-Zélande'),
(156, 'NI', 'Nicaragua'),
(157, 'NE', 'Niger'),
(158, 'NG', 'Nigéria'),
(159, 'NU', 'Niué'),
(160, 'NF', 'Île Norfolk'),
(161, 'NO', 'Norvège'),
(162, 'MP', 'Îles Mariannes du Nord'),
(163, 'UM', 'Îles Mineures Éloignées des États-Unis'),
(164, 'FM', 'États Fédérés de Micronésie'),
(165, 'MH', 'Îles Marshall'),
(166, 'PW', 'Palaos'),
(167, 'PK', 'Pakistan'),
(168, 'PA', 'Panama'),
(169, 'PG', 'Papouasie-Nouvelle-Guinée'),
(170, 'PY', 'Paraguay'),
(171, 'PE', 'Pérou'),
(172, 'PH', 'Philippines'),
(173, 'PN', 'Pitcairn'),
(174, 'PL', 'Pologne'),
(175, 'PT', 'Portugal'),
(176, 'GW', 'Guinée-Bissau'),
(177, 'TL', 'Timor-Leste'),
(178, 'PR', 'Porto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Réunion'),
(181, 'RO', 'Roumanie'),
(182, 'RU', 'Fédération de Russie'),
(183, 'RW', 'Rwanda'),
(184, 'SH', 'Sainte-Hélène'),
(185, 'KN', 'Saint-Kitts-et-Nevis'),
(186, 'AI', 'Anguilla'),
(187, 'LC', 'Sainte-Lucie'),
(188, 'PM', 'Saint-Pierre-et-Miquelon'),
(189, 'VC', 'Saint-Vincent-et-les Grenadines'),
(190, 'SM', 'Saint-Marin'),
(191, 'ST', 'Sao Tomé-et-Principe'),
(192, 'SA', 'Arabie Saoudite'),
(193, 'SN', 'Sénégal'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapour'),
(197, 'SK', 'Slovaquie'),
(198, 'VN', 'Viet Nam'),
(199, 'SI', 'Slovénie'),
(200, 'SO', 'Somalie'),
(201, 'ZA', 'Afrique du Sud'),
(202, 'ZW', 'Zimbabwe'),
(203, 'ES', 'Espagne'),
(204, 'EH', 'Sahara Occidental'),
(205, 'SD', 'Soudan'),
(206, 'SR', 'Suriname'),
(207, 'SJ', 'Svalbard etÎle Jan Mayen'),
(208, 'SZ', 'Swaziland'),
(209, 'SE', 'Suède'),
(210, 'CH', 'Suisse'),
(211, 'SY', 'République Arabe Syrienne'),
(212, 'TJ', 'Tadjikistan'),
(213, 'TH', 'Thaïlande'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinité-et-Tobago'),
(218, 'AE', 'Émirats Arabes Unis'),
(219, 'TN', 'Tunisie'),
(220, 'TR', 'Turquie'),
(221, 'TM', 'Turkménistan'),
(222, 'TC', 'Îles Turks et Caïques'),
(223, 'TV', 'Tuvalu'),
(224, 'UG', 'Ouganda'),
(225, 'UA', 'Ukraine'),
(226, 'MK', 'L\'ex-République Yougoslave de Macédoine'),
(227, 'EG', 'Égypte'),
(228, 'GB', 'Royaume-Uni'),
(229, 'IM', 'Île de Man'),
(230, 'TZ', 'République-Unie de Tanzanie'),
(231, 'US', 'États-Unis'),
(232, 'VI', 'Îles Vierges des États-Unis'),
(233, 'BF', 'Burkina Faso'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Ouzbékistan'),
(236, 'VE', 'Venezuela'),
(237, 'WF', 'Wallis et Futuna'),
(238, 'WS', 'Samoa'),
(239, 'YE', 'Yémen'),
(240, 'CS', 'Serbie-et-Monténégro'),
(241, 'ZM', 'Zambie');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `birthday`, `email`, `password`) VALUES
(43, 'Laurent', 'Delannoy', '1973-08-24', 'laurent.delannoy@outlook.com', 'e10adc3949ba59abbe56e057f20f883e'),
(44, 'Manon', 'Delannoy', '2000-12-19', 'manondelannoy1912@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `birthday` date NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `birth_country` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `birth_city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `birthday`, `nationality`, `birth_country`, `birth_city`, `phone`, `mobile`, `email`) VALUES
(56, 'Laurent', 'Delannoy', 'M', '1973-08-24', 'FR', 'France', 'Mouscron', '056/34.46.13', '0497/64.06.93', 'laurent.delannoy@outlook.com'),
(57, 'Manon', 'Delannoy', 'F', '2000-12-19', 'BE', 'Belgique', 'Tournai', '056/34.46.13', '0497/64.06.93', 'manondelannoy1912@gmail.com'),
(59, 'Jean', 'Dubois', 'M', '1985-06-14', 'FR', 'France', 'Tourcoing', '0033/3.20.14.87.45', '00336/89.56.12.90', 'jean.dub@free.fr'),
(61, 'Arnaud', 'Dupont', 'M', '1980-04-27', 'BE', 'Belgique', 'Tournai', '069/17.09.67', '0473/78.23.56', 'a.dupont@gmail.com'),
(62, 'Justine', 'Dupont', 'F', '1980-04-27', 'BE', 'Belgique', 'Tournai', '069/17.09.67', '0473/18.54.63', 'justine.dupont@gmail.com'),
(63, 'Guillaume', 'Durand', 'M', '1984-06-23', 'FR', 'France', 'Valenciennes', '00333/20.08.09.45', '00336/78.65.09.12', 'g.durand@hotmail.fr'),
(65, 'Lise', 'Moerman', 'F', '1969-05-01', 'BE', 'Belgique', 'Ypres', '056/34.46.13', '0497/64.06.93', 'lise.moerman@atheneecomines.be'),
(70, 'Guna', 'Sunaj', 'F', '1986-12-12', 'BE', 'Belgique', 'Tournai', '056/34.46.13', '0497/64.06.93', 'laurent.delannoy@outlook.com'),
(74, 'jules', 'verne', 'M', '1912-12-12', 'CG', 'République Démocratique du Congo', 'Kinshasa', '78641751451', '07876452040', 'j.verne@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_address_idx` (`id_user`),
  ADD KEY `fk_pays_address_idx` (`id_pays`);
ALTER TABLE `address` ADD FULLTEXT KEY `index3` (`street`,`number`,`box`,`postcode`,`city`);

--
-- Index pour la table `cursus`
--
ALTER TABLE `cursus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_cursus_idx` (`id_user`);
ALTER TABLE `cursus` ADD FULLTEXT KEY `index4` (`class`,`subclass`,`option`,`language_1`,`language_2`,`language_3`);

--
-- Index pour la table `educ_institute`
--
ALTER TABLE `educ_institute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_educ_institue_idx` (`id_uder`);

--
-- Index pour la table `link_parents`
--
ALTER TABLE `link_parents`
  ADD PRIMARY KEY (`id_parent`,`id_enfant`),
  ADD KEY `fk_id_enfant_idx` (`id_enfant`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `users` ADD FULLTEXT KEY `index2` (`first_name`,`last_name`,`gender`,`nationality`,`birth_country`,`birth_city`,`phone`,`mobile`,`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `cursus`
--
ALTER TABLE `cursus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_pays_address` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_address` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cursus`
--
ALTER TABLE `cursus`
  ADD CONSTRAINT `FK_user_cursus` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `educ_institute`
--
ALTER TABLE `educ_institute`
  ADD CONSTRAINT `FK_user_educ_institue` FOREIGN KEY (`id_uder`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_parents`
--
ALTER TABLE `link_parents`
  ADD CONSTRAINT `fk_id_enfant` FOREIGN KEY (`id_enfant`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
