-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for devmanage-fiesta
CREATE DATABASE IF NOT EXISTS `devmanage-fiesta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `devmanage-fiesta`;

-- Dumping structure for table devmanage-fiesta.appsysusers
CREATE TABLE IF NOT EXISTS `appsysusers` (
  `PK_appsysUsers` int NOT NULL AUTO_INCREMENT COMMENT 'AUTO GENERATED ID PER USER',
  `user_email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'HASHED EMAIL',
  `user_password` longtext COLLATE utf8mb4_general_ci COMMENT 'HASHED PASSWORD',
  `user_empId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'USER EMPLOYEE ID',
  `user_recoveryCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'HASHED RECOVERY CODE',
  `user_activationCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'HASHED ACTIVATION CODE',
  `user_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isSecret` bit(1) DEFAULT NULL,
  `isActivated` bit(1) DEFAULT NULL,
  `isDisabled` bit(1) DEFAULT NULL,
  `isDeactivated` bit(1) DEFAULT NULL,
  `isAdmin` bit(1) DEFAULT NULL,
  `isCustomer` bit(1) DEFAULT NULL,
  `isBranchManager` bit(1) DEFAULT NULL,
  `isCreditInvestigator` bit(1) DEFAULT NULL,
  `isCreditCoordinator` bit(1) DEFAULT NULL,
  `isCashier` bit(1) DEFAULT NULL,
  `userLastname` longtext COLLATE utf8mb4_general_ci,
  `userFirstName` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userMiddleName` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userNickName` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userGender` int DEFAULT NULL,
  `userCivilStatus` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userNationality` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userAge` int DEFAULT NULL,
  `userDateofBirth` date DEFAULT NULL,
  `userPlaceofBirth` longtext COLLATE utf8mb4_general_ci,
  `userContactNumber` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userAddress` longtext COLLATE utf8mb4_general_ci,
  `userRegionCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userRegion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userProvinceCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userProvince` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userCityCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userCity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userBarangayCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userBarangay` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userFullName` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isProfileFilled` bit(1) DEFAULT NULL,
  `isSpouseFilled` bit(1) DEFAULT NULL,
  `isHomeOwnershipFilled` bit(1) DEFAULT NULL,
  `isEmploymentFilled` bit(1) DEFAULT NULL,
  `isPersonalPrefFilled` bit(1) DEFAULT NULL,
  `isChildrenFilled` bit(1) DEFAULT NULL,
  `isRelativesFilled` bit(1) DEFAULT NULL,
  `isNeighborFilled` bit(1) DEFAULT NULL,
  `isNew` int DEFAULT NULL,
  `isCiApproved` int DEFAULT NULL,
  `isCoordinatorApproved` int DEFAULT NULL,
  `lat` longtext COLLATE utf8mb4_general_ci,
  `long` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`PK_appsysUsers`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~14 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `user_secret`, `isSecret`, `isActivated`, `isDisabled`, `isDeactivated`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userRegionCode`, `userRegion`, `userProvinceCode`, `userProvince`, `userCityCode`, `userCity`, `userBarangayCode`, `userBarangay`, `userFullName`, `isProfileFilled`, `isSpouseFilled`, `isHomeOwnershipFilled`, `isEmploymentFilled`, `isPersonalPrefFilled`, `isChildrenFilled`, `isRelativesFilled`, `isNeighborFilled`, `isNew`, `isCiApproved`, `isCoordinatorApproved`, `lat`, `long`) VALUES
	(1, 'administrator@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 'RMZDIUD2N3S6SDML', NULL, b'1', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 'sachikoyalbelda@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'W20H6jwLDC', 'XCOogxurYElqMBpwHaIVbf2G5tkdD6', 'QHP3QBEOYHCPNUJ4', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'ALBELDA', 'SACHI', '', 'SACHIKOY', 0, 'SINGLE', 'FILIPINO', 26, '1998-09-25', 'TAGUM CTIY', '946-3571-540', 'PRK 2 SALVACION LOPEZ VILLE', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315028', 'SALVACION', 'ALBELDA, SACHI', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1', NULL, 1, 1, '7.318658', '125.6689865'),
	(67, 'christiantampad09@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'N1FnK5V6GB', 'wtjJYIKF4Pk2QpUyfin9ODEsmZTHx5', '7X2XOFEI33QEOURM', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'TAMPAD', 'CHRISTIAN', 'PANUGALING', 'ITCHAN', 0, 'SINGLE', 'FILIPINO', 24, '2000-12-04', 'DAVAO CITY', '916-2667-578', 'PUROK 2 ANIBONGAN ', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112303', 'CARMEN', '112303002', 'ANIBONGAN', 'TAMPAD, CHRISTIAN PANUGALING', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1', NULL, NULL, NULL, '', ''),
	(68, 'jpgubalani21@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'vrXPec2WB4', '0DIEaiJ3hfle4WgvpBVOyGTdU7ZMF8', 'HCJ54AMEJJS23QDN', NULL, b'1', NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, 'GUBALANI', 'JAYPEE', '', 'JP', 0, 'SINGLE', 'FILIPINO', 24, '2000-08-13', 'PANABO CITY', '946-3587-154', 'PRK 4B CACAO', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315004', 'CACAO', 'GUBALANI, JAYPEE', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 'kerwinadrian1998@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'Z8VYdkh54R', '9aADW8jqZN4BhSp0JUHLTeQybEKYCP', 'IHRUIEHPHB3PEGIA', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, 'ALBELDA', 'KERWIN', '', 'EBOY', 0, 'SINGLE', 'FILIPINO', 26, '1998-09-25', 'TAGUM CITY', '946-3571-540', 'PRK 2B SALVACION', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '', '', 'ALBELDA, KERWIN', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 'alejo.debbie12@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'WT71Cf6FZj', 'F0ksKjvpE3ArG4todcJ5giUeyaDYx9', 'JBMAVEU4UZUYXXDR', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', 'ALEJO', 'DEBBIE', '', 'DEB', 1, 'SINGLE', 'FILIPINO', 24, '1998-09-12', 'PANABO CITY', '946-3571-540', 'UPPER LICANAN PRK 4', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '', '', 'ALEJO, DEBBIE', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 'jonalynjayme76@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, '5ErHzCSmqv', 'zOwvQt5XJnhZjNoVucRa9yfrFYACId', 'C6UPOJH6U4KQYFOH', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'JAYME', 'MICHAEL', 'GAMOT', 'DONG', 0, 'SINGLE', 'FILIPINO', 25, '1999-09-30', 'PUROK 1 UPPER LICANAN PANABO CITY', '953-8404-384', 'PUROK 1 UPPER LICANAN PANABO CITY', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315039', 'UPPER LICANAN', 'JAYME, MICHAEL GAMOT', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1', NULL, NULL, NULL, '', ''),
	(72, 'kim.jissoo456@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, '4uQBDwKcXe', '9bw5fqPBuscFIMkWEH3n4rAl208UX6', 'GP52SXQLHWAGIMJV', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'ALEJO', 'DEBBIE', 'N/A', 'DEB', 1, 'SINGLE', 'FILIPINO', 24, '2000-09-12', 'TAGPORE PANABO CITY', '000-0000-000', 'TAGPORE PANABO CITY', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315037', 'TAGPORE', 'ALEJO, DEBBIE N/A', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', NULL, NULL, NULL, '7.313648', '125.672103'),
	(75, 'supp.eservices@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'Lq4rep1JDw', 'NR2Vju1woShdzyxGXLmO8bZcEpfaiM', 'HBFUB5HP6U5CA6EA', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7.309617', '125.6860616'),
	(76, 'alburojessamae8@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'yuXneYOgd3', 'ubg9aGl8OJD24fVFsEPXC7rLnNphdK', 'FDWW36VL2R3UYPBX', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'ALBURO', 'JESSA MAE', '', 'SAMSAMI', 1, 'SINGLE', 'FILIPINO', 18, '2006-05-02', 'PANABO CITY', '915-2205-871', 'PUROK 1 DURIAN ', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315026', 'NEW VISAYAS', 'ALBURO, JESSA MAE', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1', NULL, NULL, NULL, '7.2968613', '125.6752296'),
	(77, 'essamie214@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'JgDNmMeT7k', 'BOsQyRL5j6evJnGH4Wbu3xmqdF1IzT', 'DFJIODEVKQJAPYNZ', NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7.2968613', '125.6752296'),
	(78, 'jonescute21xd@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, '0GcpyVYD3h', '10cikALmf8xgTtRo94pSBMQvNHdrah', 'NHQ3ZW4Z4DW6PTFH', NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7.3099892', '125.6638721'),
	(79, 'jonescute626@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'HAJwlDfEg1', 'e5HLpryjtkUgFQTA4GC0fbRo1BJwEn', 'YOAAIYEO2V3NK6DL', NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7.3099949', '125.6638715'),
	(80, 'shanesalutan77@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'Nd2eS8DAEO', 'lywUqQJLP21jGHCNExZr3bzWFIot0s', 'OXOXXSZDOGZGVQI7', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'SALUTAN', 'SHANE ANGEL', 'RIOFERIO', 'ANGEL', 1, 'SINGLE', 'FILIPINO', 18, '2006-01-12', 'CARMEN', '981-7171-717', 'PUROK 7 ANIBONGAN CARMEN', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112303', 'CARMEN', '112303002', 'ANIBONGAN', 'SALUTAN, SHANE ANGEL RIOFERIO', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1', NULL, NULL, NULL, '7.393648', '125.7182469');

-- Dumping structure for table devmanage-fiesta.appsysusers_children
CREATE TABLE IF NOT EXISTS `appsysusers_children` (
  `PK_appsysusers_children` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `cname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `graduateYear` int DEFAULT NULL,
  `school` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_children`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_children: ~75 rows (approximately)
INSERT INTO `appsysusers_children` (`PK_appsysusers_children`, `FK_appsysUsers`, `order`, `cname`, `age`, `graduateYear`, `school`) VALUES
	(41, 60, 1, NULL, NULL, NULL, NULL),
	(42, 60, 2, NULL, NULL, NULL, NULL),
	(43, 60, 3, NULL, NULL, NULL, NULL),
	(44, 60, 4, NULL, NULL, NULL, NULL),
	(45, 60, 5, NULL, NULL, NULL, NULL),
	(46, 61, 1, NULL, NULL, NULL, NULL),
	(47, 61, 2, NULL, NULL, NULL, NULL),
	(48, 61, 3, NULL, NULL, NULL, NULL),
	(49, 61, 4, NULL, NULL, NULL, NULL),
	(50, 61, 5, NULL, NULL, NULL, NULL),
	(51, 62, 1, NULL, NULL, NULL, NULL),
	(52, 62, 2, NULL, NULL, NULL, NULL),
	(53, 62, 3, NULL, NULL, NULL, NULL),
	(54, 62, 4, NULL, NULL, NULL, NULL),
	(55, 62, 5, NULL, NULL, NULL, NULL),
	(56, 63, 1, NULL, NULL, NULL, NULL),
	(57, 63, 2, NULL, NULL, NULL, NULL),
	(58, 63, 3, NULL, NULL, NULL, NULL),
	(59, 63, 4, NULL, NULL, NULL, NULL),
	(60, 63, 5, NULL, NULL, NULL, NULL),
	(61, 64, 1, NULL, NULL, NULL, NULL),
	(62, 64, 2, NULL, NULL, NULL, NULL),
	(63, 64, 3, NULL, NULL, NULL, NULL),
	(64, 64, 4, NULL, NULL, NULL, NULL),
	(65, 64, 5, NULL, NULL, NULL, NULL),
	(66, 65, 1, NULL, NULL, NULL, NULL),
	(67, 65, 2, NULL, NULL, NULL, NULL),
	(68, 65, 3, NULL, NULL, NULL, NULL),
	(69, 65, 4, NULL, NULL, NULL, NULL),
	(70, 65, 5, NULL, NULL, NULL, NULL),
	(71, 66, 1, NULL, NULL, NULL, NULL),
	(72, 66, 2, NULL, NULL, NULL, NULL),
	(73, 66, 3, NULL, NULL, NULL, NULL),
	(74, 66, 4, NULL, NULL, NULL, NULL),
	(75, 66, 5, NULL, NULL, NULL, NULL),
	(76, 67, 1, NULL, NULL, NULL, NULL),
	(77, 67, 2, NULL, NULL, NULL, NULL),
	(78, 67, 3, NULL, NULL, NULL, NULL),
	(79, 67, 4, NULL, NULL, NULL, NULL),
	(80, 67, 5, NULL, NULL, NULL, NULL),
	(81, 68, 1, NULL, NULL, NULL, NULL),
	(82, 68, 2, NULL, NULL, NULL, NULL),
	(83, 68, 3, NULL, NULL, NULL, NULL),
	(84, 68, 4, NULL, NULL, NULL, NULL),
	(85, 68, 5, NULL, NULL, NULL, NULL),
	(86, 69, 1, NULL, NULL, NULL, NULL),
	(87, 69, 2, NULL, NULL, NULL, NULL),
	(88, 69, 3, NULL, NULL, NULL, NULL),
	(89, 69, 4, NULL, NULL, NULL, NULL),
	(90, 69, 5, NULL, NULL, NULL, NULL),
	(91, 70, 1, NULL, NULL, NULL, NULL),
	(92, 70, 2, NULL, NULL, NULL, NULL),
	(93, 70, 3, NULL, NULL, NULL, NULL),
	(94, 70, 4, NULL, NULL, NULL, NULL),
	(95, 70, 5, NULL, NULL, NULL, NULL),
	(96, 71, 1, NULL, NULL, NULL, NULL),
	(97, 71, 2, NULL, NULL, NULL, NULL),
	(98, 71, 3, NULL, NULL, NULL, NULL),
	(99, 71, 4, NULL, NULL, NULL, NULL),
	(100, 71, 5, NULL, NULL, NULL, NULL),
	(101, 72, 1, NULL, NULL, NULL, NULL),
	(102, 72, 2, NULL, NULL, NULL, NULL),
	(103, 72, 3, NULL, NULL, NULL, NULL),
	(104, 72, 4, NULL, NULL, NULL, NULL),
	(105, 72, 5, NULL, NULL, NULL, NULL),
	(106, 76, 1, NULL, NULL, NULL, NULL),
	(107, 76, 2, NULL, NULL, NULL, NULL),
	(108, 76, 3, NULL, NULL, NULL, NULL),
	(109, 76, 4, NULL, NULL, NULL, NULL),
	(110, 76, 5, NULL, NULL, NULL, NULL),
	(111, 80, 1, NULL, NULL, NULL, NULL),
	(112, 80, 2, NULL, NULL, NULL, NULL),
	(113, 80, 3, NULL, NULL, NULL, NULL),
	(114, 80, 4, NULL, NULL, NULL, NULL),
	(115, 80, 5, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.appsysusers_employment
CREATE TABLE IF NOT EXISTS `appsysusers_employment` (
  `PK_appsysusers_employment` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `employerName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephoneNumber` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `yearsEmployed` int DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_employment`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_employment: ~30 rows (approximately)
INSERT INTO `appsysusers_employment` (`PK_appsysusers_employment`, `FK_appsysUsers`, `order`, `employerName`, `telephoneNumber`, `position`, `yearsEmployed`) VALUES
	(17, 60, 1, NULL, NULL, NULL, NULL),
	(18, 60, 2, NULL, NULL, NULL, NULL),
	(19, 61, 1, NULL, NULL, NULL, NULL),
	(20, 61, 2, NULL, NULL, NULL, NULL),
	(21, 62, 1, NULL, NULL, NULL, NULL),
	(22, 62, 2, NULL, NULL, NULL, NULL),
	(23, 63, 1, 'OZMIK', '142554782', 'MANAGER', 8),
	(24, 63, 2, NULL, NULL, NULL, NULL),
	(25, 64, 1, 'NA', 'NA', 'NA', 0),
	(26, 64, 2, NULL, NULL, NULL, NULL),
	(27, 65, 1, NULL, NULL, NULL, NULL),
	(28, 65, 2, NULL, NULL, NULL, NULL),
	(29, 66, 1, 'OZMIK', '15466562565', 'MANAGER', 9),
	(30, 66, 2, NULL, NULL, NULL, NULL),
	(31, 67, 1, 'NA', 'na', 'NA', 0),
	(32, 67, 2, NULL, NULL, NULL, NULL),
	(33, 68, 1, NULL, NULL, NULL, NULL),
	(34, 68, 2, NULL, NULL, NULL, NULL),
	(35, 69, 1, NULL, NULL, NULL, NULL),
	(36, 69, 2, NULL, NULL, NULL, NULL),
	(37, 70, 1, NULL, NULL, NULL, NULL),
	(38, 70, 2, NULL, NULL, NULL, NULL),
	(39, 71, 1, 'ROMNEVALIM BANANA FARM', '09538404384', 'LABORER', 3),
	(40, 71, 2, 'ROMNEVALIM BANANA FARM', '09538404384', 'LABORER', 3),
	(41, 72, 1, 'DAVAO DEL NORTE STATE COLLEGE', 'N/A', 'STAFF', 1),
	(42, 72, 2, 'N/A', 'N/A', 'N/A', 0),
	(43, 76, 1, 'N/A', 'N/A', 'N/A', 3),
	(44, 76, 2, 'N/A', 'N/A', 'N/A', 6),
	(45, 80, 1, 'NA', 'na', 'NA', 0),
	(46, 80, 2, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.appsysusers_homeownership
CREATE TABLE IF NOT EXISTS `appsysusers_homeownership` (
  `PK_appsysusers_homeownership` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `selectedOption` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `monthlyAmortization` decimal(10,2) DEFAULT NULL,
  `monthlyRental` decimal(10,2) DEFAULT NULL,
  `landLord` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `yearsStay` int DEFAULT NULL,
  `previousAddress` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`PK_appsysusers_homeownership`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_homeownership: ~9 rows (approximately)
INSERT INTO `appsysusers_homeownership` (`PK_appsysusers_homeownership`, `FK_appsysUsers`, `selectedOption`, `monthlyAmortization`, `monthlyRental`, `landLord`, `yearsStay`, `previousAddress`) VALUES
	(4, 63, 'Owned', 15000.00, 0.00, 'SACHI', 9, 'little panay prk 2'),
	(5, 64, 'Living with Parents', 0.00, 0.00, 'CORNELIO RIOFERIO', 13, 'Purok 2 anibongan carmen'),
	(6, 65, 'Living with Parents', 0.00, 0.00, 'ROSITA TAMPAD', 10, 'purok 2 anibongan'),
	(7, 66, 'Owned', 15000.00, 0.00, 'SACHI', 9, 'prk 2b lopez ville'),
	(8, 67, 'Living with Parents', 0.00, 0.00, 'ROSITA TAMPAD', 10, 'Purok 1 new visayas panabo'),
	(9, 71, 'Owned', 0.00, 0.00, 'JAYME', 3, 'Purok 1 Upper Licanan Panabo City Davao Del Norte'),
	(10, 72, 'Owned', 5000.00, 0.00, 'FELOMINA', 24, 'N/A'),
	(11, 76, 'Living with Parents', 500.00, 1000.00, 'MARIA ALBURO', 18, 'Purok 1 Durian'),
	(12, 80, 'Living with Parents', 0.00, 0.00, 'RUEL SALUTAN', 13, 'NA');

-- Dumping structure for table devmanage-fiesta.appsysusers_neighbors
CREATE TABLE IF NOT EXISTS `appsysusers_neighbors` (
  `PK_appsysusers_neighbors` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `raddress` longtext COLLATE utf8mb4_general_ci,
  `cellphoneNumber` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_neighbors`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_neighbors: ~30 rows (approximately)
INSERT INTO `appsysusers_neighbors` (`PK_appsysusers_neighbors`, `FK_appsysUsers`, `order`, `rname`, `raddress`, `cellphoneNumber`) VALUES
	(17, 60, 1, NULL, NULL, NULL),
	(18, 60, 2, NULL, NULL, NULL),
	(19, 61, 1, NULL, NULL, NULL),
	(20, 61, 2, NULL, NULL, NULL),
	(21, 62, 1, NULL, NULL, NULL),
	(22, 62, 2, NULL, NULL, NULL),
	(23, 63, 1, 'EDENE', 'PRK 2B SALVACION LOPEZ VILLE BLK 1 LOT 3', '946-3571-540'),
	(24, 63, 2, 'JAN ED', 'PRK 2B SALVACION LOPEZ VILLE BLK 1 LOT 3', '946-3571-540'),
	(25, 64, 1, 'KRIS LORICAN', 'PUROK 2 ANIBONGAN', '091-2345-677'),
	(26, 64, 2, NULL, NULL, NULL),
	(27, 65, 1, 'KRIS LORICAN', 'PUROK 2 ANIBONGAN', '111-1111-111'),
	(28, 65, 2, NULL, NULL, NULL),
	(29, 66, 1, 'BEBOY', 'LOPEZ VILLE BLK 1 LOT 3', '262-2626-262'),
	(30, 66, 2, 'GEORGE', 'LOPEZ VILLE BLK 1 LOT 3', '659-5955-555'),
	(31, 67, 1, 'KRIS LORICAN', 'PUROK 2 ANIBONGAN', '927-3635-188'),
	(32, 67, 2, NULL, NULL, NULL),
	(33, 68, 1, NULL, NULL, NULL),
	(34, 68, 2, NULL, NULL, NULL),
	(35, 69, 1, NULL, NULL, NULL),
	(36, 69, 2, NULL, NULL, NULL),
	(37, 70, 1, NULL, NULL, NULL),
	(38, 70, 2, NULL, NULL, NULL),
	(39, 71, 1, 'JAIME DINGDING', 'PUROK 1 UPPER LICANAN', '953-8404-384'),
	(40, 71, 2, NULL, NULL, NULL),
	(41, 72, 1, 'JENNEY MAT', 'TAGPORE PANABO CITY', '000-0000-000'),
	(42, 72, 2, 'MARIE OJA', 'TAGPORE PANABO CITY', '000-0000-000'),
	(43, 76, 1, 'ELVIE GALENO', 'PUROK 1 DURIAN', '999-2639-103'),
	(44, 76, 2, NULL, NULL, NULL),
	(45, 80, 1, 'KRIS LORICAN', 'PUROK 7 ANIBONGAN', '918-7161-615'),
	(46, 80, 2, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.appsysusers_personalpref
CREATE TABLE IF NOT EXISTS `appsysusers_personalpref` (
  `PK_appsysusers_personalpref` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `pname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `homeAddress` longtext COLLATE utf8mb4_general_ci,
  `employer` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employerAddress` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`PK_appsysusers_personalpref`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_personalpref: ~30 rows (approximately)
INSERT INTO `appsysusers_personalpref` (`PK_appsysusers_personalpref`, `FK_appsysUsers`, `order`, `pname`, `age`, `homeAddress`, `employer`, `employerAddress`) VALUES
	(17, 60, 1, NULL, NULL, NULL, NULL, NULL),
	(18, 60, 2, NULL, NULL, NULL, NULL, NULL),
	(19, 61, 1, NULL, NULL, NULL, NULL, NULL),
	(20, 61, 2, NULL, NULL, NULL, NULL, NULL),
	(21, 62, 1, NULL, NULL, NULL, NULL, NULL),
	(22, 62, 2, NULL, NULL, NULL, NULL, NULL),
	(23, 63, 1, 'EDDIE', 50, 'LITTLE PANAY 2B PANABO CITY DAVAO DEL NORTE', 'NA', 'NA'),
	(24, 63, 2, 'ANNIE', 50, 'LITTER PANAY 2B PANABO CITY DAVAO DEL NORTE', 'NA', 'NA'),
	(25, 64, 1, 'LOLOY BALISACAN', 38, 'PUROK 5 TUGANAY CARMEN', 'NA', 'NA'),
	(26, 64, 2, 'LOURDES SALUTAN', 48, 'PUROK 7 ANIBONGAN', 'NA', 'NA'),
	(27, 65, 1, 'AQUILIO TAMPAD', 53, 'PUROK 2 ANIBONGAN', 'NA', 'NA'),
	(28, 65, 2, 'ROSITA TAMPAD', 54, 'PUROK 2 ANIBONGAN', 'NA', 'NA'),
	(29, 66, 1, 'EDDIE', 50, 'PRK 2B LOPEZ VILLE', 'NA', 'NA'),
	(30, 66, 2, 'ANNIE', 50, 'PRK 2B LOPEZ VILLE', 'NA', 'NA'),
	(31, 67, 1, 'AQUILIO TAMPAD', 53, 'PUROK 2 ANIBONGAN', 'NA', 'NA'),
	(32, 67, 2, 'ROSITA TAMPAD', 54, 'PUROK 2 ANIBONGAN', 'NA', 'NA'),
	(33, 68, 1, NULL, NULL, NULL, NULL, NULL),
	(34, 68, 2, NULL, NULL, NULL, NULL, NULL),
	(35, 69, 1, NULL, NULL, NULL, NULL, NULL),
	(36, 69, 2, NULL, NULL, NULL, NULL, NULL),
	(37, 70, 1, NULL, NULL, NULL, NULL, NULL),
	(38, 70, 2, NULL, NULL, NULL, NULL, NULL),
	(39, 71, 1, 'LORETO N. JAYME', 65, 'PUROK 1 UPPER LICANAN PANABO CITY', 'ROMNIVALIM', 'PUROK 1 UPPER LICANAN PANABO CITY'),
	(40, 71, 2, 'MERNA G. JAYME', 52, 'PUROK 1 UPPER LICANAN PANABO CITY', 'ROMNIVALIM', 'PUROK 1 UPPER LICANAN PANABO CITY'),
	(41, 72, 1, 'N/A', 1, 'N/A', 'N/A', 'N/A'),
	(42, 72, 2, 'BETH A.', 67, 'TAGPORE PANABO CITY', 'N/A', 'N/A'),
	(43, 76, 1, 'RICARDO ALBURO', 42, 'PUROK 1 DURIAN', 'NONE', 'NONE'),
	(44, 76, 2, 'MARIA ALBURO', 52, 'PUROK 1 DURIAN', 'NONE', 'NONE'),
	(45, 80, 1, 'RUEL SALUTAN', 38, 'PUROK 7 ANIBONGAN', 'CHRIS', 'NEW VISAYAS'),
	(46, 80, 2, 'LOURDES SALUTAN', 43, 'PUROK 7 ANIBONGAN', 'NA', 'NA');

-- Dumping structure for table devmanage-fiesta.appsysusers_relatives
CREATE TABLE IF NOT EXISTS `appsysusers_relatives` (
  `PK_appsysusers_relatives` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `raddress` longtext COLLATE utf8mb4_general_ci,
  `cellphoneNumber` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_relatives`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_relatives: ~30 rows (approximately)
INSERT INTO `appsysusers_relatives` (`PK_appsysusers_relatives`, `FK_appsysUsers`, `order`, `rname`, `raddress`, `cellphoneNumber`) VALUES
	(17, 60, 1, NULL, NULL, NULL),
	(18, 60, 2, NULL, NULL, NULL),
	(19, 61, 1, NULL, NULL, NULL),
	(20, 61, 2, NULL, NULL, NULL),
	(21, 62, 1, NULL, NULL, NULL),
	(22, 62, 2, NULL, NULL, NULL),
	(23, 63, 1, 'JIVALYN', 'NEW  VISAYAS PANAB CITY', '946-3571-540'),
	(24, 63, 2, 'CHARLOTTE', 'MATINA APLAYA DAVAO CITY', '946-3571-540'),
	(25, 64, 1, 'HELEN BULAIR', 'PUROK 8 ISING', '092-7262-517'),
	(26, 64, 2, NULL, NULL, NULL),
	(27, 65, 1, 'MARIA ALBURO', 'PUROK 1 NEW VISAYAS PANABO', '122-2211-122'),
	(28, 65, 2, NULL, NULL, NULL),
	(29, 66, 1, 'JIVALYN', 'NEW VISAYAS PRK 2', '946-3571-540'),
	(30, 66, 2, 'CHARLLOTE', 'MATINA APLAYA DAVAO CITY', '946-3571-540'),
	(31, 67, 1, 'MARIA ALBURO', 'PUROK 1 NEW VISAYAS PANABO', '918-6265-151'),
	(32, 67, 2, NULL, NULL, NULL),
	(33, 68, 1, NULL, NULL, NULL),
	(34, 68, 2, NULL, NULL, NULL),
	(35, 69, 1, NULL, NULL, NULL),
	(36, 69, 2, NULL, NULL, NULL),
	(37, 70, 1, NULL, NULL, NULL),
	(38, 70, 2, NULL, NULL, NULL),
	(39, 71, 1, 'SANTIAGO JAYME', 'TUGANAY CARMEN', '953-8404-384'),
	(40, 71, 2, NULL, NULL, NULL),
	(41, 72, 1, 'CHARISSE ANN CON', 'DAVAO CITY', '000-0000-000'),
	(42, 72, 2, 'JOSH ORD', 'DAVAO CITY', '000-0000-000'),
	(43, 76, 1, 'CHRISTIAN TAMPAD', 'CARMEN', '909-2775-095'),
	(44, 76, 2, NULL, NULL, NULL),
	(45, 80, 1, 'RICHARD RIOFERIO', 'TAGUM', '917-1716-511'),
	(46, 80, 2, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.appsysusers_spouse
CREATE TABLE IF NOT EXISTS `appsysusers_spouse` (
  `PK_appsysusers_spouse` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `middleName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nickName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `civilStatus` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nationality` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `placeofBirth` longtext COLLATE utf8mb4_general_ci,
  `contactNumber` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_spouse`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_spouse: ~0 rows (approximately)
INSERT INTO `appsysusers_spouse` (`PK_appsysusers_spouse`, `FK_appsysUsers`, `lastName`, `firstName`, `middleName`, `nickName`, `fullName`, `gender`, `civilStatus`, `nationality`, `age`, `birthdate`, `placeofBirth`, `contactNumber`) VALUES
	(3, 72, 'N/A', 'N/A', 'N/A', 'N/A', 'N/A, N/A N/A', 0, 'SINGLE', 'N/A', 0, '2024-12-16', 'N/A', '000-0000-000');

-- Dumping structure for table devmanage-fiesta.mm_attachments
CREATE TABLE IF NOT EXISTS `mm_attachments` (
  `PK_mm_attachments` int NOT NULL AUTO_INCREMENT,
  `FK_mn_installments` int DEFAULT NULL,
  `attachmentCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attachmentName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attachmentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mm_attachments`),
  UNIQUE KEY `attachmentCode` (`attachmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.mm_attachments: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mm_location
CREATE TABLE IF NOT EXISTS `mm_location` (
  `PK_mm_location` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `lat` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `long` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isDefault` bit(1) DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL,
  `addressNoteDescription` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`PK_mm_location`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.mm_location: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mm_payments
CREATE TABLE IF NOT EXISTS `mm_payments` (
  `PK_mm_payments` int NOT NULL AUTO_INCREMENT,
  `receiptNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `processBy` int DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `daysInterval` int DEFAULT NULL,
  `FK_appsysUsers` int DEFAULT NULL,
  PRIMARY KEY (`PK_mm_payments`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.mm_payments: ~2 rows (approximately)
INSERT INTO `mm_payments` (`PK_mm_payments`, `receiptNo`, `amount`, `processBy`, `processDate`, `FK_mn_installments`, `daysInterval`, `FK_appsysUsers`) VALUES
	(63, '0', 1000.00, 70, '2024-12-08 16:51:30', 11, NULL, 66),
	(64, '1', 1000.00, 70, '2024-12-08 16:53:23', 11, NULL, 66);

-- Dumping structure for table devmanage-fiesta.mm_schedule
CREATE TABLE IF NOT EXISTS `mm_schedule` (
  `PK_mm_schedule` int NOT NULL AUTO_INCREMENT,
  `order` int DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `FK_appsysUsers` int DEFAULT NULL,
  `dateSchedule` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `rebate` decimal(10,2) DEFAULT NULL,
  `isRebated` int DEFAULT NULL,
  `remaining` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fullyPaidDate` datetime DEFAULT NULL,
  `evaluation` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `processedBy` int DEFAULT NULL,
  `receiptNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mm_schedule`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.mm_schedule: ~12 rows (approximately)
INSERT INTO `mm_schedule` (`PK_mm_schedule`, `order`, `FK_mn_installments`, `FK_appsysUsers`, `dateSchedule`, `amount`, `rebate`, `isRebated`, `remaining`, `status`, `fullyPaidDate`, `evaluation`, `processedBy`, `receiptNo`) VALUES
	(85, 1, 11, 66, '2025-02-06', 1667.00, 50.00, NULL, 0.00, 'FULL', '2024-12-08 00:00:00', 'PAID', 70, '1'),
	(86, 2, 11, 66, '2025-03-08', 1667.00, 50.00, NULL, 1334.00, 'BALANCE', NULL, 'PAID', 70, '1'),
	(87, 3, 11, 66, '2025-04-07', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, 4, 11, 66, '2025-05-07', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(89, 5, 11, 66, '2025-06-06', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(90, 6, 11, 66, '2025-07-06', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, 7, 11, 66, '2025-08-05', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(92, 8, 11, 66, '2025-09-04', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(93, 9, 11, 66, '2025-10-04', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(94, 10, 11, 66, '2025-11-03', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, 11, 11, 66, '2025-12-03', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(96, 12, 11, 66, '2026-01-02', 1667.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.mn_installments
CREATE TABLE IF NOT EXISTS `mn_installments` (
  `PK_mn_installments` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `FK_mscProducts` int DEFAULT NULL,
  `installmentCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approvedMonths` int DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productDownpayment` decimal(10,2) DEFAULT NULL,
  `productPercent` int DEFAULT NULL,
  `requestedDate` datetime DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `approvedBy` int DEFAULT NULL,
  `approvedPaymentSched` date DEFAULT NULL,
  `rejectedBy` int DEFAULT NULL,
  `rejectedDate` datetime DEFAULT NULL,
  `rejectReason` longtext COLLATE utf8mb4_general_ci,
  `reviewBy` int DEFAULT NULL,
  `reviewDate` datetime DEFAULT NULL,
  `cancelledDate` datetime DEFAULT NULL,
  `completedDate` datetime DEFAULT NULL,
  `installmentStatus` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `schedulePayment` int DEFAULT NULL,
  `isUpdated` int DEFAULT NULL,
  PRIMARY KEY (`PK_mn_installments`),
  UNIQUE KEY `installmentCode` (`installmentCode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.mn_installments: ~4 rows (approximately)
INSERT INTO `mn_installments` (`PK_mn_installments`, `FK_appsysUsers`, `FK_mscProducts`, `installmentCode`, `approvedMonths`, `productPrice`, `productDownpayment`, `productPercent`, `requestedDate`, `approvedDate`, `approvedBy`, `approvedPaymentSched`, `rejectedBy`, `rejectedDate`, `rejectReason`, `reviewBy`, `reviewDate`, `cancelledDate`, `completedDate`, `installmentStatus`, `schedulePayment`, `isUpdated`) VALUES
	(9, 63, 40, '8D63NXU0FOQVP9BMKAS7', NULL, 30000.00, NULL, NULL, '2024-12-05 12:41:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', NULL, NULL),
	(10, 64, 41, '6NU3OB4SZATGK2870DRX', NULL, 30000.00, NULL, NULL, '2024-12-05 13:05:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', NULL, NULL),
	(11, 66, 40, 'UAMBDRVCP1KXO2ZN8YLF', 12, 30000.00, 10000.00, NULL, '2024-12-05 13:55:18', '2024-12-08 16:02:57', 69, '2025-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'APPROVED', NULL, 1),
	(12, 67, 40, 'AQ6TF7HJVE85SLYP3GIN', NULL, 30000.00, NULL, NULL, '2024-12-05 14:04:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', NULL, NULL);

-- Dumping structure for table devmanage-fiesta.msc_brands
CREATE TABLE IF NOT EXISTS `msc_brands` (
  `PK_mscBrands` int NOT NULL AUTO_INCREMENT,
  `FK_mscCategories` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mscBrands`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_brands: ~46 rows (approximately)
INSERT INTO `msc_brands` (`PK_mscBrands`, `FK_mscCategories`, `description`) VALUES
	(8, 25, 'PANASONIC'),
	(9, 33, 'LG'),
	(10, 34, 'SAMSUNG'),
	(11, 34, 'PANASONIC'),
	(12, 34, 'LG'),
	(13, 34, 'TCL'),
	(14, 34, 'HITACHI'),
	(15, 34, 'FUJITSU'),
	(16, 34, 'HAIER'),
	(17, 28, 'PANASONIC'),
	(18, 28, 'FUJITSU'),
	(20, 28, 'HAIER'),
	(21, 28, 'VOLTAS'),
	(22, 28, 'XTREME'),
	(23, 32, 'ASUS'),
	(24, 32, 'LENOVO'),
	(25, 32, 'ACER'),
	(26, 32, 'HP'),
	(27, 32, 'DELL'),
	(28, 31, 'PANASONIC'),
	(29, 31, 'FUJITSU'),
	(30, 31, 'LG'),
	(31, 31, 'SAMSUNG'),
	(32, 31, 'ANKO'),
	(33, 25, 'LG'),
	(34, 25, 'FUJITSU'),
	(35, 25, 'SAMSUNG'),
	(36, 25, 'SHARP'),
	(37, 25, 'WHIRLPOOL'),
	(38, 25, 'EVEREST'),
	(39, 30, 'JBL'),
	(40, 30, 'SONY'),
	(41, 30, 'PANASONIC'),
	(42, 30, 'BOSSTON'),
	(44, 29, 'SOFAS'),
	(45, 29, 'LOVESEATS'),
	(46, 29, 'SLEEPER SOFAS'),
	(47, 26, 'WHIRLPOOL'),
	(48, 26, 'FRIGIDAIRE'),
	(49, 26, 'LG'),
	(50, 26, 'GE'),
	(51, 33, 'PANASONIC'),
	(52, 33, 'SAMSUNG'),
	(53, 33, 'TCL'),
	(54, 33, 'SONY'),
	(55, 32, 'TOSHIBA');

-- Dumping structure for table devmanage-fiesta.msc_categories
CREATE TABLE IF NOT EXISTS `msc_categories` (
  `PK_mscCategories` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mscCategories`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_categories: ~11 rows (approximately)
INSERT INTO `msc_categories` (`PK_mscCategories`, `description`) VALUES
	(34, 'AIR CONDITIONER'),
	(28, 'FREEZER'),
	(32, 'LAPTOP'),
	(31, 'MICROWAVE OVEN'),
	(27, 'MOTORCYCLE'),
	(25, 'REFRIGERATORS'),
	(24, 'SMARTPHONE'),
	(29, 'SOFA'),
	(30, 'SPEAKERS'),
	(26, 'STOVE'),
	(33, 'TELEVISION');

-- Dumping structure for table devmanage-fiesta.msc_details
CREATE TABLE IF NOT EXISTS `msc_details` (
  `PK_mscDetails` int NOT NULL AUTO_INCREMENT,
  `order` int DEFAULT NULL,
  `detailsId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mscDetails`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_details: ~0 rows (approximately)
INSERT INTO `msc_details` (`PK_mscDetails`, `order`, `detailsId`, `title`, `description`) VALUES
	(230, 1, 'KSo3VE', '1', '1'),
	(232, 1, '8n1BpK', '1', '1'),
	(240, 1, 'JhgMIc', 'REFRIGERATOR TYPE', 'Inverter'),
	(241, 2, 'JhgMIc', 'Gross Capacity:', '308L (10.8 cu. ft.)'),
	(242, 3, 'JhgMIc', 'Net Capacity:', '89L (10.2 cu. ft.)'),
	(243, 4, 'JhgMIc', 'Package Weight:', '60kg.'),
	(244, 5, 'JhgMIc', 'Unit Weight:', '54kg.'),
	(245, 6, 'JhgMIc', 'Warranty Compressor;', '12yrs.'),
	(246, 7, 'JhgMIc', 'Color:', 'Ceramic Gray'),
	(247, 1, '6JLjNC', 'Display Type', '4K OLED'),
	(248, 2, '6JLjNC', 'Wide Color Gamut', 'OLED Color'),
	(249, 3, '6JLjNC', 'Refresh Rate', '120Hz Native'),
	(250, 4, '6JLjNC', 'HDR (High Dynamic Range)', 'Dolby Vision / HDR10 / HLG'),
	(251, 5, '6JLjNC', 'Picture Processor', 'ÃŽÂ±9 AI Processor 4K Gen7'),
	(252, 6, '6JLjNC', 'TV Dimensions without Stand (WxHxD, mm)', '932 x 540 x 41.1'),
	(253, 7, '6JLjNC', 'TV Weight without Stand (kg)', '9.8'),
	(254, 1, 'aTEUtK', 'Color', 'White'),
	(255, 2, 'aTEUtK', 'Cooling Capacity', '12,661 Kj/h'),
	(256, 3, 'aTEUtK', 'EER', '11.8'),
	(257, 4, 'aTEUtK', 'Power Input', '1,070 Watts'),
	(258, 5, 'aTEUtK', 'Warranty', '1 Year for Parts & Service 5 Years on Compressor'),
	(259, 1, 'msPNrg', 'werwrwerew', 'werwrwerwer'),
	(260, 2, 'msPNrg', '4234242', 'wefwfwe');

-- Dumping structure for table devmanage-fiesta.msc_images
CREATE TABLE IF NOT EXISTS `msc_images` (
  `PK_mscUploads` int NOT NULL AUTO_INCREMENT,
  `FK_mscProducts` int DEFAULT NULL,
  `fileCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileExtension` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileUploaded` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mscUploads`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.msc_images: ~0 rows (approximately)
INSERT INTO `msc_images` (`PK_mscUploads`, `FK_mscProducts`, `fileCode`, `fileName`, `fileExtension`, `fileUploaded`) VALUES
	(35, 39, '675128aace9b7-1733372074.jpg', '22.jpg', 'jpg', '2024-12-05 12:14:34'),
	(36, 39, '675128aacec00-1733372074.jpg', '24.jpg', 'jpg', '2024-12-05 12:14:34'),
	(37, 39, '675128aaced77-1733372074.png', '23.png', 'png', '2024-12-05 12:14:34'),
	(38, 40, '675128ff0a65d-1733372159.jpg', '31.jpg', 'jpg', '2024-12-05 12:15:59'),
	(39, 40, '675128ff0a9d1-1733372159.jpg', '32.jpg', 'jpg', '2024-12-05 12:15:59'),
	(40, 40, '675128ff0ae8e-1733372159.jpg', '33.jpg', 'jpg', '2024-12-05 12:15:59'),
	(41, 40, '675128ff0b0d6-1733372159.jpg', '34.jpg', 'jpg', '2024-12-05 12:15:59'),
	(42, 41, '6751291f640a7-1733372191.jpg', 'tcl.jpg', 'jpg', '2024-12-05 12:16:31'),
	(43, 41, '6751291f6431d-1733372191.jpg', 'tcl1.jpg', 'jpg', '2024-12-05 12:16:31'),
	(44, 41, '6751291f64580-1733372191.jpg', 'TCL-TAC-12CSA-BEI-1-5hp-Split-Type-Inverter-Aircon.jpg', 'jpg', '2024-12-05 12:16:31');

-- Dumping structure for table devmanage-fiesta.msc_models
CREATE TABLE IF NOT EXISTS `msc_models` (
  `PK_mscModels` int NOT NULL AUTO_INCREMENT,
  `FK_mscBrands` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mscModels`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_models: ~0 rows (approximately)
INSERT INTO `msc_models` (`PK_mscModels`, `FK_mscBrands`, `description`) VALUES
	(9, 4, 'MODEL 1'),
	(10, 5, 'PANASONIC NR QR301FB'),
	(11, 6, 'PANASONIC NR QR301FB'),
	(12, 8, 'PANASONIC NR QR301FB'),
	(13, 9, '42 INCH LG OLED EVO AI'),
	(14, 10, 'AIR CONDITIONER FLOOR STANDING AC048BNPDKC/TC DIGITAL INVERTER TECHNOLOGY 6.0 HP'),
	(15, 10, '1.0 HP AIR CONDITIONER WALL-MOUNT AI AUTO COOLING'),
	(16, 10, '2-YEAR WINDOW-TYPE AIR CONDITIONER PREMIUM CARE'),
	(17, 10, '2-YEAR SPLIT-TYPE AIR CONDITIONER PREMIUM CARE'),
	(18, 10, '0.75 HP AIR CONDITIONER WINDOW-TYPE COMPACT FAST COOLING'),
	(19, 10, '10.0 HP FLOOR STANDING INVERTER'),
	(20, 11, 'PANASONIC CW-XN920JPH'),
	(21, 11, 'CW-N920JPH PANASONIC 1HP WINDOW AIRCON'),
	(22, 11, 'PANASONIC 2.5HP AERO SERIES STANDARD INVERTER SPLIT TYPE AIRCON CS/CU-PU24XKQ'),
	(23, 11, 'PANASONIC CW-N820JPH 0.8HP WINDOW TYPE AIRCON'),
	(24, 11, 'PANASONIC CS/CU-XU9AKQ 1.0 HP SPLIT-TYPE AIRCONDITIONER'),
	(25, 12, 'LG 14,000 BTU 115-VOLT WINDOW AIR CONDITIONER WITH WI-FI AND REMOTE'),
	(26, 12, 'LG DUAL INVERTER SMART WINDOW AIR CONDITIONER, ULTRA QUIET OPERATION'),
	(27, 12, 'LG ZPNQ36GT3E0 4HP FLOOR MOUNTED AIRCON'),
	(28, 12, 'LG DUAL INVERTER WINDOW 1.3 HP LA130GC2TYPE'),
	(29, 12, 'LG HSN12ISY SPLIT-TYPE WALL MOUNTED 1.5 HP AIRCONDITIONER'),
	(30, 13, 'TCL TAC-06CWM/F 0.6 HP WINDOW TYPE AIRCONDITIONER'),
	(31, 13, 'TCL TAC-09CSA/KEI 1.0HP INVERTER WALL SPLIT TYPE AIRCON'),
	(32, 13, 'TCL 1.0HP AIRCON WINDOW TYPE - TAC-09CWM/U (R32 REFRIGERANT, AUTO-RESTART, 3 FAN SPEEDS, 8-WAY AIR-'),
	(33, 13, 'TCL TAC-18CWI/UJE 2.0 HP WINDOW TYPE AIRCONDITIONER'),
	(34, 13, 'TCL 9000BTU DAIRRY COOLING SPLIT AIR CONDITIONERS R32 AIR PURIFIER SPLIT INVERTER 2023'),
	(35, 14, 'HITACHI RA-10HVQ 1.0 HP WINDOW TYPE AIRCON INVERTER'),
	(36, 14, 'HITACHI 0.6HP COMPACT WINDOW TYPE FULL DC INVERTER AIRCON RA06HSV'),
	(37, 14, 'HITACHI 1.5 TON CASSETTE AC'),
	(38, 14, 'HITACHI 2HP DELUXE WINDOW TYPE NON-INVERTER AIRCON RA-20SR'),
	(39, 14, 'HITACHI 0.8HP ROYAL WALL MOUNTED SPLIT TYPE FULL DC INVERTER AIRCON RAS/RAC-08HT/HTP'),
	(40, 15, 'FUJIDENZO WAM632IGT 0.6HP MANUAL WINDOW TYPE AIR CONDITIONER WITH ENERGY EFFICIENT DEHUMIDIFIER'),
	(41, 15, 'FUJITSU 3.5KW AIR CONDITIONING ASYG12KPCE AOYG12KPCA INKL. FREE SHIPPING'),
	(42, 15, 'FUJIDENZO 2.5 HP SUPREME HD INVERTER SPLIT TYPE AIRCON HIS-253AG IN'),
	(43, 15, 'FUJIDENZO WAR-100IGT 1.0 HP WINDOW TYPE AIRCONDITIONER'),
	(44, 15, 'FUJIDENZO 2.0 HP WINDOW TYPE AIRCON WITH REMOTE WAR-203AIG'),
	(45, 15, 'FUJIDENZO 1.5 HP AIRCON REMOTE WAR-150IGT'),
	(46, 16, 'HAIER THERMOCOOL SPLIT AIR CONDITIONER (1.5HP)'),
	(47, 16, 'HAIER HW-05MCQ32 0.5HP WINDOW TYPE AIRCON'),
	(48, 16, 'HAIER HSU-13XSV32 1.5HP UV COOL SERIES SPLIT TYPE INVERTER AIRCON'),
	(49, 16, 'HAIER HW 09MCQ13 / WINDOW AIR CONDITIONER / MANUAL WINDOW AIRCON / 1 HP AIR CONDITIONER'),
	(50, 16, 'HAIER 8.3 CUFT MAGIC COOLING NO FROST TWIN INVERTER TWO DOOR (HRF-IV230VN)'),
	(51, 17, 'PANASONIC MDF-237-PJ BIOMEDICAL FREEZER (221L, -30 TO -20OC)'),
	(52, 17, 'PANASONIC SF-L6111W -20 REFRIGERATOR FREEZER'),
	(53, 17, 'PANASONIC 295 LITER NET CAPACITY PCM SHEET WITH HARDTOP (SCR-CH300H7B)'),
	(54, 17, 'PANASONIC HEALTHCARE MPR-715F-PJ MEDICAL COOLER WITH FREEZER (COOLING UNIT/415L, FREEZER UNIT/176L, 2-14OC'),
	(55, 18, 'FUJIDENZO FC 29 ADF2 29 CU.FT CHEST FREEZER WITH DUAL FUNCTION'),
	(56, 18, 'FUJIDENZO FBS 970ADF 9 CU.FT SUBZERO CHEST FREEZER WITH DUAL FUNCTION'),
	(57, 18, 'FUJIDENZO IFRC-100G 10 CU FT. HD INVERTER DUAL COMPARTMENT FREEZER AND CHILLER'),
	(58, 18, 'FUJIDENZO IFC-20ADF2 20 CU. FT. HD INVERTER SOLID TOP CHEST FREEZER/CHILLER'),
	(59, 18, 'FUJIDENZO IFCG75PDFSL 7.0CUFT HD INVERTER, DUAL FUNCTION CHEST FREEZER'),
	(60, 18, 'FUJIDENZO FD 07 ADF2 7.0 CU.FT. DUAL FUNCTION CHEST FREEZER'),
	(61, 20, 'HAIER 13.6 CU.FT. STEEL TOP DOOR CHEST FREEZER BD-379HDV6'),
	(62, 20, 'HAIER DEEP FREEZER 780 LTR'),
	(63, 20, 'HAIER HCF-480 480L CHEST FREEZER'),
	(64, 21, 'VOLTAS 600 LTRS DEEP FREEZER'),
	(65, 21, 'VOLTAS CHEST FREEZER 320 LTR'),
	(66, 21, 'VOLTAS 405 LITRE GLASS TOP CHEST DEEP FREEZER'),
	(67, 22, 'XTREME COOL 1.8CU FT. SINGLE DOOR REFRIGERATOR NON-INVERTER MANUAL DEFROST XCOOL-SD50ME'),
	(68, 23, 'ASUS GAMING LAPTOP BRAND NEW 2024 INTEL CORE I7 10TH 16GB DDR4 RAM 512GB SSD 15.6INCH NOTEBOOK'),
	(69, 23, 'ASUS FACTORY 2024 NEW LAPTOP OFFICE USE 15.6-INCH FHD INTEL CORE I7 LAPTOP RAM 16GB 512GB SSD'),
	(70, 23, 'ASUS GAMING LAPTOP NEW 2024 INTEL CORE I7 10TH 16GB DDR4 RAM 512GB SSD 15.6INCH'),
	(71, 23, 'ASUS FACTORY VIVIBOOK 14.1 INCH J4105 RAM6GB 256GB SSD'),
	(72, 23, 'ASUS 14 INCH LAPTOP INTEL CORE I5 10400H SSD 8GB/256GB ROG BACKLIGHT FINGERPRINT UNLOCK'),
	(73, 24, '2024 LENOVO BRAND NEW LAPTOP INTER CORE I7 16G RAM 512G SSD HD 15.6 INCHES GAMING OFFICE LAPTOP'),
	(74, 24, 'LENOVO GAMING LAPTOP I7 WINDOWS 11 15.6-INCH FINGERPRINT UNLOCK APPLICABLE TO STUDENTS DESIGN/GAMING'),
	(75, 24, 'B/N LENOVO V14 / V15 GEN 4 LAPTOP'),
	(76, 24, 'LENOVO FACTORY BRAND NEW INTEL CORE I5 8265U LAPTOP 14 INCH'),
	(77, 24, 'LENOVO T480 LAPTOP CORE I5 8TH GEN'),
	(78, 25, 'ACER ASPIRE LITE 12TH GEN INTEL CORE I3-1215U LAPTOP'),
	(79, 25, 'ACER CORE I7 LAPTOP BRAND NEW ORIGINAL'),
	(80, 25, 'ACER RYZEN 7 4700U GAME LAPTOP'),
	(81, 25, 'ACER ONE 14 AMD RYZEN 3 3250U PROCESSOR LAPTOP'),
	(82, 27, 'DELL LATITUDE 5510 BUSINESS LAPTOP, 15.6 FHD 1920 X 1080, INTEL CORE I5-10210U'),
	(83, 27, 'DELL LAPTOP BRAND NEW ORIGINAL INTEL CORE I5/I7 6TH GEN 8G'),
	(84, 27, 'DELL PRECISION 7710 17.3 FHD LAPTOP, CORE I7-6920HQ'),
	(85, 26, 'HP LAPTOP HP 15-FD0228TU INTEL 13TH GENERATION INTEL CORE I5-1334U'),
	(86, 26, 'HP BRAND NEW LAPTOP 450 G1 CORE I3/I5/I7'),
	(87, 26, 'HP LAPTOP BRAND NEW PC INTEL CORE I3/I5/I7 SSD ULTRA-THIN COMPUTER 15.6 INCH'),
	(88, 26, 'HP ELITEBOOK 840 G1 14 LAPTOP, WINDOWS 10 HOME, INTEL CORE I5-4300U PROCESSOR'),
	(89, 26, 'HP 14S-DQ3096TU NATURAL SILVER NOTEBOOK   WINDOWS 11'),
	(90, 28, 'PANASONIC HOMECHEF 4-IN-1 MICROWAVE OVEN WITH AIR FRYER,'),
	(91, 28, 'PANASONIC 2.2 CU FT COUNTERTOP MICROWAVE OVEN IN STAINLESS STEEL'),
	(92, 28, 'PANASONIC NN-GT35NBLPW'),
	(93, 28, 'PANASONIC COMMERCIAL MICROWAVE OVEN 22L 900W ALL STAINLESS STEEL 50HZ'),
	(94, 28, 'PANASONIC BISTRO STEAM MICROWAVE OVEN 26L LCD TOUCH PANEL BLACK NE-BS658-K'),
	(95, 29, 'FUJIDENZO ME-20SL 20L DIGITAL MICROWAVE OVEN'),
	(96, 29, 'FUJIDENZO MM-22BL 20 L MICROWAVE OVEN'),
	(97, 29, 'FUJIDENZO 20L DIGITAL MICROWAVE OVEN ME-20 SL'),
	(98, 30, 'LG MICROWAVE OVEN 42LT NEOCHEF GRILL MH8265DIS'),
	(99, 30, 'LG 25 LITERS SMART INVERTER NEOCHEF MICROWAVE OVEN (MH6565DIS)'),
	(100, 30, 'CLICK TO OPEN EXPANDED VIEW LG 20 L GRILL MICROWAVE OVEN, MH2044DB'),
	(101, 30, 'LG 25L NEOCHEF SMART INVERTER MICROWAVE OVEN'),
	(102, 31, 'SAMSUNG MC32DG7646CKTC 32L MICROWAVE'),
	(103, 31, 'SAMSUNG MICROWAVE OVEN MS23K3515AS'),
	(104, 31, 'SAMSUNG  21 LITER CONVECTION MICROWAVE OVEN'),
	(105, 31, 'SAMSUNG MG23K3513GK/SM'),
	(106, 31, 'SAMSUNG 23 L SOLO MICROWAVE OVEN, MS23A3513AK/TL'),
	(107, 31, 'SAMSUNG 32L MICROWAVE OVEN (MS32DG4504AGTC)'),
	(108, 32, 'ANKO MICROWAVE OVEN P70B20AP-ST'),
	(109, 32, 'ANKO 28L MICROWAVE OVEN P90J30AP-F1'),
	(110, 8, 'PANASONIC NR-CW530XMMP'),
	(111, 8, 'PANASONIC NR-AQ151NS'),
	(112, 8, 'PANASONIC NR-BX421GPKP'),
	(113, 8, 'NR-BV320GKPH 10.2CUFT PANASONIC REF'),
	(114, 8, 'PANASONIC NR-BV280XSPH'),
	(115, 33, 'LG 25 CU. FT. FRENCH DOOR REFRIGERATOR'),
	(116, 33, 'LG RVF-X208MC REFRIGERATOR'),
	(117, 33, 'GR-B202SQBB 7.2CUFT DARK GRAPHITE LG REF'),
	(118, 33, 'LG REFRIGERATOR SIDE BY SIDE 24.5 CU.FT. RVS-D245DG'),
	(119, 33, 'LG 242 L 2 STAR FROST-FREE SMART INVERTER DOUBLE DOOR REFRIGERATOR'),
	(120, 34, 'FUJIDENZO ISR20SS 20 CU.FT SIDE BY SIDE REFRIGERATOR NO FROST HD INVERTER'),
	(121, 34, 'FUJIDENZO 8.CU.FT. HD INVERTER 2 DOOR NO FROST REFRIGERATOR INR-83HS'),
	(122, 34, 'FUJIDENZO 19 CU.FT. HD INVERTER NO FROST MULTI DOOR REFRIGERATOR IFR 19 GD'),
	(123, 34, 'FUJIDENZO 9 CU. FT HD INVERTER BOTTOM MOUNT NO FROST REFRIGERATOR IBM-90SS'),
	(124, 34, 'FUJIDENZO ISR-22WD 22.0 CU.FT SIDE BY SIDE REFRIGERATOR'),
	(125, 34, 'RDD-35T 3.5CUFT FUJIDENZO REF'),
	(126, 35, 'SAMSUNG RB33T307026/TC BESPOKE REFRIGERATOR'),
	(127, 35, 'SAMSUNG BESPOKE RF29BB8600QL'),
	(128, 35, 'SAMSUNG RS63R5591B4 24.3 CU.FT. SIDE BY SIDE REFRIGERATOR'),
	(129, 35, 'SAMSUNG 236 L, 3 STAR, DIGITAL INVERTER DOUBLE DOOR REFRIGERATOR'),
	(130, 35, 'SAMSUNG RF27T5501SR 36 INCH SMART FRENCH DOOR REFRIGERATOR'),
	(131, 36, 'SHARP SJ-BLS20BVP-SL'),
	(132, 36, 'SHARP SJ-FTS07BVS-DS'),
	(133, 36, 'SHARP SJ-FTS11BVS-DS'),
	(134, 36, 'SHARP 15.1CU.FT. NO FROST, INVERTER, TWO DOOR REFRIGERATOR SJFTG15BVP'),
	(135, 36, 'SHARP SJ-PL10AS-GY 3.5 CU.FT. MINIBAR REFRIGERATOR'),
	(136, 36, 'SHARP SJ-ML70AS-SL 6.3 CU.FT. 2 DOOR REFRIGERATOR'),
	(137, 37, 'WHIRLPOOL 6WIN105U BS 10.5 CU.FT TWO DOOR REFRIGERATOR INVERTER'),
	(138, 37, 'WHIRLPOOL 9.5 CU.FT. TOP MOUNT INVERTER NO-FROST REFRIGERATOR WF2T255'),
	(139, 37, 'WHIRLPOOL 16 CU. FT. INVERTER MULTI-DOOR REFRIGERATOR 6WM16NIHGG'),
	(140, 37, 'WHIRLPOOL 6WS21NIHGG 21 CU.FT. SIDE BY SIDE REFRIGERATOR'),
	(141, 37, 'WHIRLPOOL WRF555SDFZ 25 CU. FT. STAINLESS STEEL'),
	(142, 38, 'EVEREST REFRIGERATION EMGR24C'),
	(143, 38, 'EVEREST 3.2 CU.FT. TWO-DOOR PERSONAL REFRIGERATOR (ET2R90L/H)'),
	(144, 38, 'EVEREST ET2R 213L 7.5 CU.FT TWO DOOR REFRIGERATOR'),
	(145, 38, 'EVEREST 7.5 CU.FT INVERTER TWO DOOR REFRIGERATOR/ MANUAL DEFROSTING/ ODOR CONTOL FILTER/ 152L'),
	(146, 38, 'EVEREST ETRSN608IV/C 22 CU.FT. SIDE BY SIDE REFRIGERATOR'),
	(147, 39, 'JBL PARTYBOX1000 300 310 ON THE GO K SONG BLUETOOTH'),
	(148, 39, 'JBL STAGE2 280F 2.5-WAY FLOOR STANDING LOUDSPEAKER'),
	(149, 39, 'JBL CINEMA510 5.1 CHANNEL HOME THEATER SURROUND SOUND SPEAKER SYSTEM W SUBWOOFER'),
	(150, 39, 'JBL CONTROL 25 28 5-INCH 8-INCH PROFESSIONAL AUDIO CONFERENCE HOME'),
	(151, 39, 'JBL PROFESSIONAL SPEAKER SRX715 SRX725 SRX712'),
	(152, 40, 'SONY GTK-XB5 ONE BOX PARTY SOUND SYSTEM'),
	(153, 40, 'SONY SHAKE-X10D HIGH-POWER HOME AUDIO SYSTEM WITH DVD'),
	(154, 40, 'SONY SRSX33 BLUETOOTH SPEAKER'),
	(155, 40, 'MHC-V13 SONY ONE BOX AUDIO SYSTEM'),
	(156, 40, 'SONY MHC-V41D BLUETOOTH SPEAKER MUSIC SYSTEM'),
	(157, 40, 'SONY D5 SRS-D5 ACTIVE SPEAKER SYSTEM'),
	(158, 41, 'PANASONIC SC-UA90 AUDIO'),
	(159, 41, 'PANASONIC SC-UA7E-K URBAN AUDIO BLUETOOTH WIRELESS SPEAKER SYSTEM WITH KARAOKE'),
	(160, 41, 'PANASONIC SMART SPEAKER SC-GA1-K'),
	(161, 41, 'PANASONIC SC-AKX710 MINI SYSTEM AUDIO'),
	(162, 42, 'BOSSTON EK9998 PARTY DUAL SPEAKER 6 LIGHTMODES BLUETOOTH'),
	(163, 42, 'BOSSTON EK8880 MULTIMEDIA 2.1 SPEAKER'),
	(164, 42, 'BOSSTON EK9999 PARTY DUAL SPEAKER 7 LIGHTMODES'),
	(165, 42, 'BOSSTON EK-TM6000U MULTIMIDEA SPEAKER FOR LAPTOP AND PC WITH BLUETOOTH'),
	(166, 42, 'BOSSTON EK7770 SOUNDBAR SPEAKER BLUETOOTH 5.0'),
	(167, 42, 'BOSSTON EK8881 2.1 MULTIMEDIA SPEAKER'),
	(168, 44, 'RENO 3 SEATER SOFA'),
	(169, 44, 'STARK L-SHAPE MODERN SOFA'),
	(170, 44, 'LEATHERETTE SOFA (L-SHAPE, 2 SEATERS AND 3 SEATERS)'),
	(171, 44, 'WALNUT ALL SOLID WOOD SOFA COMBINATION SET CORNER MODERN CHINESE FURNITURE'),
	(172, 46, 'SOFA BED SINGLE/DOUBLE/KING 90/120/150/200CM GREY SOLID WOODFOLDABLE SOFA CHAIR'),
	(173, 46, 'SAINT VILLA LUXURY FABRIC FOLDING SOFA BED FOLDABLE MULTIFUNCTIONAL SOFA'),
	(174, 46, 'MODERN WHITE COMPRESSION SOFA BED CORDUROY SLEEPER COUCH'),
	(175, 47, 'WHIRLPOOL 5-BURNER 5.1-CU FT FREESTANDING GAS RANGE (BLACK)'),
	(176, 47, 'WHIRLPOOL WFE505W0J 30 WIDE 5.3 CU. FT. FREE STANDING ELECTRIC RANGE'),
	(177, 48, 'FRIGIDAIRE 30 GAS RANGE'),
	(178, 48, 'FRIGIDAIRE GCRG3038AF'),
	(179, 49, 'LG 30 FREE STANDING GAS RANGE LRGL5823S'),
	(180, 49, 'LG LUTD4919SN 7.3 CU. FT. DUAL FUEL - DOUBLE OVEN RANGE WITH PROBAKE CONVECTION'),
	(181, 49, 'LG STOVE 3163ST'),
	(182, 50, 'GE CAFE CGB500P2MS1 30 INCH GAS FREESTANDING RANGE IN STAINLESS STEEL'),
	(183, 50, 'GE JS645SLSS SLIDE IN ELECTRIC RANGE'),
	(184, 50, 'GE APPLIANCES JS760FPDS'),
	(185, 9, 'LG OLED65CX 65 4K UHD SMART OLED TV 2021NEW'),
	(186, 9, 'LG 50IN 4K UHD SMART TV 50UT8050PSB 2024 MODEL'),
	(187, 9, 'LG 55INCH SUPER UHD 4K HDR SMART LED TV SJ8000'),
	(188, 9, '43 INCH LG UHD AI UT80 4K SMART TV 2024'),
	(189, 51, 'PANASONIC TH-43MS600X 43 FULL HD ANDROID LED TV'),
	(190, 51, 'TH-32J201DX (HD) LED TV PANASONIC 23302'),
	(191, 51, 'PANASONIC 42 PLASMA TV BLACK 42X50'),
	(192, 51, 'PANASONIC TH-55VF2HW 54.6 LED LCDFULL HD'),
	(193, 52, 'SAMSUNG SAMSUNG 65 INCH CLASS S90D OLED SMART TV QN65S90DAFXZA 2024'),
	(194, 52, '98 NEO QLED 4K QN90D TIZEN OS SMART TV (2024)'),
	(195, 52, 'SAMSUNG SMART TV 43 INCH SCREEN SAMSUNG SMART TV'),
	(196, 52, 'SAMSUNG UA75CU7000GXXP 75IN 4K UHD SMART TV'),
	(197, 52, '32INCH SAMSUNG HD T4300 SMART TV'),
	(198, 53, 'TCL 40S5400 GOOGLE TV'),
	(199, 53, 'TCL 50-INCH 4K UHD GOOGLE TV (50P755)'),
	(200, 53, 'TCL T635 43-INCH 4K-GOOGLE SMART LED TV'),
	(201, 53, 'TCL 65R635 65&034 4K UHD MINI LED QLED'),
	(202, 53, 'TCL LED-98C655 98INCH 4K QLED GOOGLE TV'),
	(203, 53, 'TCL 32S5400 GOOGLE TV'),
	(204, 54, 'SONY BRAVIA 43-INCH X75K / 4K HDR LED / GOOGLE TV'),
	(205, 54, 'SONY XR55A90J MASTER SERIES 55-INCH OLED 4K UHD SMART TV'),
	(206, 54, 'SONY BRAVIA 32-INCH W830L / HDR LED / GOOGLE TV');

-- Dumping structure for table devmanage-fiesta.msc_products
CREATE TABLE IF NOT EXISTS `msc_products` (
  `PK_mscProducts` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productUnit` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productBrandID` int DEFAULT NULL,
  `productBrand` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productModelID` int DEFAULT NULL,
  `productModel` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productSKU` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FK_mscCategories` int DEFAULT NULL COMMENT 'TABLE MSCCATEGORIES',
  `productDescription` longtext COLLATE utf8mb4_general_ci,
  `FK_detailsId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'TABLE MSCPRODUCTS',
  `quantity` int DEFAULT NULL,
  `regularPrice` decimal(10,2) DEFAULT '0.00',
  `salePrice` decimal(10,2) DEFAULT '0.00',
  `repoPrice` decimal(10,2) DEFAULT '0.00',
  `stockMinimum` int DEFAULT NULL,
  `stockMaximum` int DEFAULT NULL,
  `isRegular` bit(1) DEFAULT NULL,
  `isSale` bit(1) DEFAULT NULL,
  `isRepo` bit(1) DEFAULT NULL,
  `productStatus` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mscProducts`),
  UNIQUE KEY `productName` (`productName`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_products: ~0 rows (approximately)
INSERT INTO `msc_products` (`PK_mscProducts`, `productName`, `productUnit`, `productBrandID`, `productBrand`, `productModelID`, `productModel`, `productSKU`, `FK_mscCategories`, `productDescription`, `FK_detailsId`, `quantity`, `regularPrice`, `salePrice`, `repoPrice`, `stockMinimum`, `stockMaximum`, `isRegular`, `isSale`, `isRepo`, `productStatus`) VALUES
	(39, 'PANASONIC NR QR301FB', 'RT31CB564422', 8, 'PANASONIC', 12, 'PANASONIC NR QR301FB', 'AQ31001B', 25, 'Inverter single door tasted by meralco', 'JhgMIc', 30, 35000.00, 30000.00, 25000.00, 20, 20, b'1', NULL, NULL, 'Active'),
	(40, '42 INCH LG OLED EVO AI', 'Televesion', 9, 'LG', 13, '42 INCH LG OLED EVO AI', 'OLED42C4PSA', 33, 'Smart tv oled evo 42inch.', '6JLjNC', 30, 30000.00, 25000.00, 20000.00, 20, 20, b'1', NULL, NULL, 'Active'),
	(41, 'TCL TAC-09CSA/KEI 1.0HP INVERTER WALL SPLIT TYPE AIRCON', 'RT31CB564422', 13, 'TCL', 31, 'TCL TAC-09CSA/KEI 1.0HP INVERTER WALL SPLIT TYPE AIRCON', 'AQ31001B', 34, '1.5 HP, Inverter Split Type Aircon	\nAuto Protection	\nAuto Restart	\nTimer	\nDehumidifier	\nExtra-Low Noise	\nQuiet Operation	\nAnti-Mildew', 'aTEUtK', 20, 30000.00, 27000.00, 22000.00, 15, 15, b'1', NULL, NULL, 'Active');

-- Dumping structure for table devmanage-fiesta.msc_properties
CREATE TABLE IF NOT EXISTS `msc_properties` (
  `PK_mscProperties` int NOT NULL AUTO_INCREMENT,
  `FK_mscCategories` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_mscProperties`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_properties: ~0 rows (approximately)
INSERT INTO `msc_properties` (`PK_mscProperties`, `FK_mscCategories`, `description`) VALUES
	(18, 25, 'REFRIGERATOR TYPE');

-- Dumping structure for table devmanage-fiesta.msc_uploads
CREATE TABLE IF NOT EXISTS `msc_uploads` (
  `PK_mscUploads` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `fileCode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileExtension` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileUploaded` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mscUploads`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.msc_uploads: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.vv_changelog
CREATE TABLE IF NOT EXISTS `vv_changelog` (
  `PK_vv_changelog` int NOT NULL AUTO_INCREMENT,
  `changeLogVersion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PK_vv_changelog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table devmanage-fiesta.vv_changelog: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
