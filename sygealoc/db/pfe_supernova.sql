-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2023 at 03:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pfe.supernova`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ID` int(9) NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `NOMCOMPLET` varchar(255) NOT NULL,
  `SEXE` enum('MASCULIN','FEMININ','INDETERMINÉ') NOT NULL,
  `ADRESSE` varchar(255) NOT NULL,
  `NATIONALITE` varchar(255) NOT NULL,
  `CIN` varchar(255) NOT NULL,
  `PASSEPORT` varchar(255) NOT NULL,
  `TELEPHONE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PERMIS` varchar(255) NOT NULL,
  `DATEDEXPIRATION` varchar(255) NOT NULL,
  `PATENTE` varchar(255) NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ID`, `TYPE`, `NOMCOMPLET`, `SEXE`, `ADRESSE`, `NATIONALITE`, `CIN`, `PASSEPORT`, `TELEPHONE`, `EMAIL`, `PERMIS`, `DATEDEXPIRATION`, `PATENTE`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(256812, 'Personne physique', 'Luckencia Jean', 'MASCULIN', 'P26-E, Village Ecam', 'Haitïenne', '484848484848484', 'N/A', '50949491', 'jeanluckencia@gmail.com', '5849589EE4334', '12/12/2023', 'N/A', 1, '12-10-2023 17:38:55', 1, '12-10-2023 17:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `ID` int(9) NOT NULL,
  `COMPANYNAME` varchar(255) NOT NULL,
  `CONTACTPERSON` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `STATE` varchar(255) NOT NULL,
  `POSTALCODE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PHONENUMBER` varchar(255) NOT NULL,
  `MOBILENUMBER` varchar(255) NOT NULL,
  `FAX` varchar(255) NOT NULL,
  `WEBSITEURL` varchar(255) NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`ID`, `COMPANYNAME`, `CONTACTPERSON`, `ADDRESS`, `COUNTRY`, `CITY`, `STATE`, `POSTALCODE`, `EMAIL`, `PHONENUMBER`, `MOBILENUMBER`, `FAX`, `WEBSITEURL`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(1, 'SYGEALOC', 'Monhel Maudoony Pierre', 'Rua Santa Edwirges #35', 'Brésil', 'Uberlândia', 'Minas Gerais', '38408732', 'monhelmaudoonypierre@gmail.com', '34999425030', '34999425030', 'not defined', 'not defined', 1, '2023-10-12 14:51:23', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `ID` int(9) NOT NULL,
  `NOMCOMPLET` varchar(255) NOT NULL,
  `SEXE` enum('MASCULIN','FEMININ','INDETERMINÉ') NOT NULL,
  `DATENAISSANCE` varchar(10) NOT NULL,
  `ADRESSE` varchar(255) NOT NULL,
  `NIF` varchar(50) NOT NULL,
  `POSTE` varchar(255) NOT NULL,
  `TELEPHONE` varchar(30) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PSEUDO` varchar(255) NOT NULL,
  `MOTDEPASSE` varchar(255) NOT NULL,
  `ETAT` enum('ACTIF','INACTIF') NOT NULL DEFAULT 'ACTIF',
  `USERCREATED` int(7) NOT NULL,
  `DATECREATED` varchar(25) NOT NULL,
  `USERUPDATED` int(7) DEFAULT NULL,
  `DATEUPDATED` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`ID`, `NOMCOMPLET`, `SEXE`, `DATENAISSANCE`, `ADRESSE`, `NIF`, `POSTE`, `TELEPHONE`, `EMAIL`, `PSEUDO`, `MOTDEPASSE`, `ETAT`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(1, 'Monhel Maudoony Pierre', 'MASCULIN', '1994-10-24', 'Rua Santa Edvirges #35', '000-000-000-0', 'Administrateur', '56457893', 'monhelmaudoonypierre@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ACTIF', 0, '12-10-2023 13:49:47', 1, '13-10-2023 10:20:54'),
(393562, 'Robertha Aurelien', 'FEMININ', '27/04/1994', '60 bis, Bienac 23, K-Soley', '777-777-777-7', 'Comptable', '50949491', 'aurelienrobertha@gmail.com', 'robbie', 'fa774183ab00517107b0a5bf61f91e97', 'ACTIF', 1, '12-10-2023 17:25:48', NULL, '12-10-2023 19:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `ID` int(9) NOT NULL,
  `NOMENTREPRISE` varchar(255) NOT NULL,
  `SIEGESOCIAL` varchar(255) NOT NULL,
  `TELEPHONE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ADRESSE` varchar(255) NOT NULL,
  `REPRESENTANT` varchar(255) NOT NULL,
  `NUMEROPASSPORT` varchar(255) NOT NULL,
  `CIN` varchar(255) NOT NULL,
  `PATENTE` varchar(255) NOT NULL,
  `SITEWEB` varchar(255) NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`ID`, `NOMENTREPRISE`, `SIEGESOCIAL`, `TELEPHONE`, `EMAIL`, `ADRESSE`, `REPRESENTANT`, `NUMEROPASSPORT`, `CIN`, `PATENTE`, `SITEWEB`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(408686, 'TOYOTA', 'JAPON', '76878767', 'toyota@gmail.com', 'Yhuhuujj', 'Liu Jing', 'GV584958', '87-69-80-8767-87-97965', '897645678976543', 'https://toyota.com', 1, '13-10-2023 10:22:47', NULL, NULL),
(761248, 'MAZDA', 'USA', '17894349', 'mazda@gmail.com', 'gtrfedkjfrmkefdjs', 'Bill Moron', 'GV8789494', '48-93-85-9384-93-84343', '8798989889', '', 1, '12-10-2023 17:41:56', 1, '12-10-2023 17:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `localization`
--

CREATE TABLE `localization` (
  `ID` int(9) NOT NULL,
  `DEFAULTCOUNTRY` varchar(255) NOT NULL,
  `DATEFORMAT` int(255) NOT NULL,
  `TIMEZONE` int(255) NOT NULL,
  `DEFAULTLANGUAGE` int(255) NOT NULL,
  `CURRENCYCODE` int(255) NOT NULL,
  `CURRENCYSYMBOL` int(255) NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `ID` int(9) NOT NULL,
  `CLIENT` int(9) NOT NULL,
  `VEHICULE` int(9) NOT NULL,
  `DATEDEBUT` varchar(255) NOT NULL,
  `HEUREDEBUT` time NOT NULL,
  `NBJOUR` int(9) NOT NULL,
  `VEHICULERETOURNE` enum('OUI','NON') NOT NULL,
  `DETTE` float NOT NULL,
  `ETAT` enum('ACTIF','TERMINÉ') NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(11) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL,
  `COMMENTAIRE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ID`, `CLIENT`, `VEHICULE`, `DATEDEBUT`, `HEUREDEBUT`, `NBJOUR`, `VEHICULERETOURNE`, `DETTE`, `ETAT`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`, `COMMENTAIRE`) VALUES
(284922, 256812, 9248, '12-10-2023', '18:24:28', 90, 'NON', 0, 'ACTIF', 1, '12-10-2023 18:26:11', 1, '12-10-2023 19:38:06', '');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ID` int(9) NOT NULL,
  `NOM` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ID`, `NOM`) VALUES
(1, 'dashboard'),
(2, 'client'),
(3, 'reservation'),
(4, 'location'),
(5, 'vehicule'),
(6, 'fournisseur'),
(7, 'parametre'),
(8, 'employe');

-- --------------------------------------------------------

--
-- Table structure for table `permissioncategory`
--

CREATE TABLE `permissioncategory` (
  `ID` int(9) NOT NULL,
  `MODULE` int(9) NOT NULL,
  `CAN_VIEW` enum('0','1') DEFAULT NULL,
  `CAN_ADD` enum('0','1') DEFAULT NULL,
  `CAN_EDIT` enum('0','1') DEFAULT NULL,
  `CAN_DELETE` enum('0','1') DEFAULT NULL,
  `CAN_PRINT` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissioncategory`
--

INSERT INTO `permissioncategory` (`ID`, `MODULE`, `CAN_VIEW`, `CAN_ADD`, `CAN_EDIT`, `CAN_DELETE`, `CAN_PRINT`) VALUES
(2, 2, '1', '1', '1', '1', '1'),
(3, 1, '1', '0', '0', '0', '0'),
(4, 8, '1', '1', '1', '1', '1'),
(5, 6, '1', '1', '1', '1', '1'),
(6, 4, '1', '1', '1', '1', '1'),
(7, 7, '1', '0', '1', '0', '1'),
(8, 3, '1', '1', '1', '1', '1'),
(9, 5, '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ID` int(9) NOT NULL,
  `CLIENT` int(9) NOT NULL,
  `VEHICULE` int(9) NOT NULL,
  `DATEDEBUT` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `NBJOUR` int(9) NOT NULL,
  `VERSEMENT` float NOT NULL,
  `BALANCE` float NOT NULL,
  `LIVRE` enum('OUI','NON') NOT NULL,
  `ETAT` enum('ACTIF','ANNULÉ','TERMINÉ') NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ID`, `CLIENT`, `VEHICULE`, `DATEDEBUT`, `NBJOUR`, `VERSEMENT`, `BALANCE`, `LIVRE`, `ETAT`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(927434, 256812, 870632, '12-10-2023', 80, 2000, 2000, 'NON', 'ACTIF', 1, '12-10-2023 18:01:29', NULL, '13-10-2023 10:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `MAC` varchar(9) NOT NULL,
  `USER` int(9) NOT NULL,
  `LASTLOCATION` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  `HOST` varchar(255) NOT NULL,
  `DATE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `ID` int(9) NOT NULL,
  `LOGO` varchar(255) NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`ID`, `LOGO`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(1, 'assets/sygealoc.PNG', 1, '2023-10-12 14:49:06', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userpermission`
--

CREATE TABLE `userpermission` (
  `ID` int(9) NOT NULL,
  `USER` int(9) NOT NULL,
  `MODULE` int(9) NOT NULL,
  `CAN_VIEW` enum('0','1') DEFAULT NULL,
  `CAN_ADD` enum('0','1') DEFAULT NULL,
  `CAN_EDIT` enum('0','1') DEFAULT NULL,
  `CAN_DELETE` enum('0','1') DEFAULT NULL,
  `CAN_PRINT` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userpermission`
--

INSERT INTO `userpermission` (`ID`, `USER`, `MODULE`, `CAN_VIEW`, `CAN_ADD`, `CAN_EDIT`, `CAN_DELETE`, `CAN_PRINT`) VALUES
(1, 1, 1, '1', '1', '1', '1', '1'),
(7, 1, 2, '1', '1', '1', '1', '1'),
(8, 1, 3, '1', '1', '1', '1', '1'),
(9, 1, 4, '1', '1', '1', '1', '1'),
(10, 1, 5, '1', '1', '1', '1', '1'),
(11, 1, 6, '1', '1', '1', '1', '1'),
(12, 1, 7, '1', '1', '1', '1', '1'),
(13, 1, 8, '1', '1', '1', '1', '1'),
(14, 393562, 1, '1', '0', '0', '0', '0'),
(15, 393562, 2, '1', '0', '0', '0', '0'),
(16, 393562, 3, '1', '0', '0', '0', '0'),
(17, 393562, 4, '1', '0', '0', '0', '0'),
(18, 393562, 5, '1', '0', '0', '0', '0'),
(19, 393562, 6, '1', '0', '0', '0', '0'),
(20, 393562, 7, '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

CREATE TABLE `vehicule` (
  `ID` int(9) NOT NULL,
  `FOURNISSEUR` int(9) NOT NULL,
  `TYPE` varchar(15) NOT NULL,
  `COULEUR` varchar(15) NOT NULL,
  `MARQUE` varchar(15) NOT NULL,
  `MODEL` varchar(15) NOT NULL,
  `ANNEE` varchar(4) NOT NULL,
  `TRANSMISSION` enum('MANUEL','AUTOMATIQUE') NOT NULL,
  `NUMMOTEUR` varchar(15) NOT NULL,
  `NUMPLAQUE` varchar(15) NOT NULL,
  `TYPEMOTEUR` enum('DIESEL','GASOLINE') NOT NULL,
  `PRIXPARJOUR` varchar(10) NOT NULL,
  `ETAT` enum('LOUÉ','LIBRE','EN RETARD','EN REPARATION','RESERVÉ') NOT NULL,
  `IMAGE` varchar(255) NOT NULL,
  `USERCREATED` int(9) NOT NULL,
  `DATECREATED` varchar(255) NOT NULL,
  `USERUPDATED` int(9) DEFAULT NULL,
  `DATEUPDATED` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`ID`, `FOURNISSEUR`, `TYPE`, `COULEUR`, `MARQUE`, `MODEL`, `ANNEE`, `TRANSMISSION`, `NUMMOTEUR`, `NUMPLAQUE`, `TYPEMOTEUR`, `PRIXPARJOUR`, `ETAT`, `IMAGE`, `USERCREATED`, `DATECREATED`, `USERUPDATED`, `DATEUPDATED`) VALUES
(9248, 761248, '4Ã4', 'Noire', 'Jams', 'AZ#$RF', '2020', 'AUTOMATIQUE', 'DAFSADD$898', 'LO-46564', 'GASOLINE', '70', 'LOUÉ', 'assets/uploads/vehicule/image497892vehicule.jpeg', 1, '12-10-2023 18:05:48', NULL, '12-10-2023 18:28:29'),
(53818, 408686, '4×4', 'Jaune', 'Swift', 'HJ89090', '2017', 'AUTOMATIQUE', '8956454', 'LO-32435', 'GASOLINE', '25', 'LIBRE', 'assets/uploads/vehicule/image702311vehicule.jpeg', 1, '13-10-2023 10:41:12', 1, '13-10-2023 10:43:02'),
(560944, 408686, 'Cabriolet', 'Grise', 'Jams', '54676878764', '2020', 'MANUEL', '098763456789', 'LO-56789', 'DIESEL', '98', 'LIBRE', 'assets/uploads/vehicule/image889164vehicule.jpeg', 1, '13-10-2023 10:39:22', NULL, NULL),
(870632, 761248, 'Coupe', 'Bleu', 'Cooper', 'AZT67', '2022', 'MANUEL', 'X45UHJKOO', 'LO-49494', 'DIESEL', '50', 'RESERVÉ', 'assets/uploads/vehicule/image109804vehicule.jpeg', 1, '12-10-2023 17:45:32', NULL, '12-10-2023 18:01:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__cli_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__cli_employe_id_updated` (`USERUPDATED`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__com_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__com_employe_id_updated` (`USERUPDATED`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__fou_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__fou_employe_id_updated` (`USERUPDATED`);

--
-- Indexes for table `localization`
--
ALTER TABLE `localization`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__loc_client_id` (`CLIENT`),
  ADD KEY `fk__loc_vehicule_id` (`VEHICULE`),
  ADD KEY `fk__loc_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__loc_employe_id_updated` (`USERUPDATED`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `permissioncategory`
--
ALTER TABLE `permissioncategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__per_module_id` (`MODULE`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__res_client_id` (`CLIENT`),
  ADD KEY `fk__res_vehicule_id` (`VEHICULE`),
  ADD KEY `fk__res_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__res_employe_id_updated` (`USERUPDATED`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`MAC`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__the_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__the_employe_id_updated` (`USERUPDATED`);

--
-- Indexes for table `userpermission`
--
ALTER TABLE `userpermission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__use_module_id` (`MODULE`),
  ADD KEY `fk__use_employe_id` (`USER`);

--
-- Indexes for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk__veh_employe_id_created` (`USERCREATED`),
  ADD KEY `fk__veh_employe_id_updated` (`USERUPDATED`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256813;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393563;

--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=761249;

--
-- AUTO_INCREMENT for table `localization`
--
ALTER TABLE `localization`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284923;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissioncategory`
--
ALTER TABLE `permissioncategory`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=927435;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userpermission`
--
ALTER TABLE `userpermission`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=892418;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk__cli_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__cli_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `fk__com_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__com_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`);

--
-- Constraints for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fk__fou_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__fou_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk__loc_client_id` FOREIGN KEY (`CLIENT`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `fk__loc_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__loc_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__loc_vehicule_id` FOREIGN KEY (`VEHICULE`) REFERENCES `vehicule` (`ID`);

--
-- Constraints for table `permissioncategory`
--
ALTER TABLE `permissioncategory`
  ADD CONSTRAINT `fk__per_module_id` FOREIGN KEY (`MODULE`) REFERENCES `module` (`ID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk__res_client_id` FOREIGN KEY (`CLIENT`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `fk__res_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__res_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__res_vehicule_id` FOREIGN KEY (`VEHICULE`) REFERENCES `vehicule` (`ID`);

--
-- Constraints for table `theme`
--
ALTER TABLE `theme`
  ADD CONSTRAINT `fk__the_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__the_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`);

--
-- Constraints for table `userpermission`
--
ALTER TABLE `userpermission`
  ADD CONSTRAINT `fk__use_employe_id` FOREIGN KEY (`USER`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__use_module_id` FOREIGN KEY (`MODULE`) REFERENCES `module` (`ID`);

--
-- Constraints for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `fk__veh_employe_id_created` FOREIGN KEY (`USERCREATED`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `fk__veh_employe_id_updated` FOREIGN KEY (`USERUPDATED`) REFERENCES `employe` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
