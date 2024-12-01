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
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'HASHED EMAIL',
  `user_password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'HASHED PASSWORD',
  `user_empId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'USER EMPLOYEE ID',
  `user_recoveryCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'HASHED RECOVERY CODE',
  `user_activationCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'HASHED ACTIVATION CODE',
  `user_secret` varchar(255) DEFAULT NULL,
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
  `userLastname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userFirstName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userMiddleName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userNickName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userGender` int DEFAULT NULL,
  `userCivilStatus` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userNationality` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userAge` int DEFAULT NULL,
  `userDateofBirth` date DEFAULT NULL,
  `userPlaceofBirth` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userContactNumber` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userAddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userRegionCode` varchar(50) DEFAULT NULL,
  `userRegion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userProvinceCode` varchar(50) DEFAULT NULL,
  `userProvince` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userCityCode` varchar(50) DEFAULT NULL,
  `userCity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userBarangayCode` varchar(50) DEFAULT NULL,
  `userBarangay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userFullName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
  PRIMARY KEY (`PK_appsysUsers`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~6 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `user_secret`, `isSecret`, `isActivated`, `isDisabled`, `isDeactivated`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userRegionCode`, `userRegion`, `userProvinceCode`, `userProvince`, `userCityCode`, `userCity`, `userBarangayCode`, `userBarangay`, `userFullName`, `isProfileFilled`, `isSpouseFilled`, `isHomeOwnershipFilled`, `isEmploymentFilled`, `isPersonalPrefFilled`, `isChildrenFilled`, `isRelativesFilled`, `isNeighborFilled`, `isNew`, `isCiApproved`, `isCoordinatorApproved`) VALUES
	(1, 'administrator@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 'RMZDIUD2N3S6SDML', NULL, b'1', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 'jpgubalani@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'ZbdsglM2YS', 'BtAv902JaQNOnk3eVrg8cmo7GLf1IW', 'QQFYLHAXSOZAAH3E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 'kerwinadrian1998@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, '3uRf27b0CL', 'ofcOpbmF1YuVEtNT6DKiHrJwXGlBLW', 'D3GFOFNFHV2DNILR', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, 'ALBELDA', 'KERWIN ADRIAN', 'BACONGUIS', 'EBOY', 0, 'SINGLE', 'FILIPINO', 26, '1998-09-25', 'TAGUM CITY', '946-3571-540', 'PRK 2B LOPEZ VILLE BLK 1 LOT 3', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315028', 'SALVACION', 'ALBELDA, KERWIN ADRIAN BACONGUIS', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, 'jpgubalani21@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'vNajAglyFu', 'bS3Uk795ozLEBKFtxjYCh8MpmfDgaW', '4S4RJE43M4ANAV6U', NULL, b'1', NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, 'GUBALANI', 'JP', 'NA', 'JAYPE', 0, 'SINGLE', 'FILIPINO', 25, '1999-11-17', 'TAGUM CITY', '946-3571-540', 'SOUTHERN DAVAO PRK 1', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315028', 'SALVACION', 'GUBALANI, JP NA', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 'alejo.debbie12@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'jWKOLqdRUA', 'wBNnqWQAYp8yo6afsOCLxlvjktJPuG', 'VN4FE74ZSVULSROM', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', 'ALEJO', 'DEBBIE', 'JAYME', 'DEB', 1, 'MARRIED', 'FILIPINO', 24, '2000-08-17', 'TAGUM CITY', '946-3571-540', 'UPPER LICANAN', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315028', 'SALVACION', 'ALEJO, DEBBIE JAYME', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 'sachikoyalbelda@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'elPUJH1L4u', 'ZOhdeYjRgc0mCxz6Q47ouEiISlsTDJ', 'CLVJ65QH7CEIV3QM', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'ALBLEDA', 'SACHI', 'JAYME', 'SACHIKOY', 0, 'SINGLE', 'FILIPINO', 1999, '1999-09-23', 'TAGUM CITY', '946-3571-540', 'PRK 4A', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '', 'CHOOSE BARANGAY', 'ALBLEDA, SACHI JAYME', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', 1, 1, 1);

-- Dumping structure for table devmanage-fiesta.appsysusers_children
CREATE TABLE IF NOT EXISTS `appsysusers_children` (
  `PK_appsysusers_children` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `graduateYear` int DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_children`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_children: ~30 rows (approximately)
INSERT INTO `appsysusers_children` (`PK_appsysusers_children`, `FK_appsysUsers`, `order`, `cname`, `age`, `graduateYear`, `school`) VALUES
	(1, 42, 1, NULL, NULL, NULL, NULL),
	(2, 42, 2, NULL, NULL, NULL, NULL),
	(3, 42, 3, NULL, NULL, NULL, NULL),
	(4, 42, 4, NULL, NULL, NULL, NULL),
	(5, 42, 5, NULL, NULL, NULL, NULL),
	(6, 44, 1, NULL, NULL, NULL, NULL),
	(7, 44, 2, NULL, NULL, NULL, NULL),
	(8, 44, 3, NULL, NULL, NULL, NULL),
	(9, 44, 4, NULL, NULL, NULL, NULL),
	(10, 44, 5, NULL, NULL, NULL, NULL),
	(11, 46, 1, NULL, NULL, NULL, NULL),
	(12, 46, 2, NULL, NULL, NULL, NULL),
	(13, 46, 3, NULL, NULL, NULL, NULL),
	(14, 46, 4, NULL, NULL, NULL, NULL),
	(15, 46, 5, NULL, NULL, NULL, NULL),
	(16, 47, 1, NULL, NULL, NULL, NULL),
	(17, 47, 2, NULL, NULL, NULL, NULL),
	(18, 47, 3, NULL, NULL, NULL, NULL),
	(19, 47, 4, NULL, NULL, NULL, NULL),
	(20, 47, 5, NULL, NULL, NULL, NULL),
	(21, 48, 1, NULL, NULL, NULL, NULL),
	(22, 48, 2, NULL, NULL, NULL, NULL),
	(23, 48, 3, NULL, NULL, NULL, NULL),
	(24, 48, 4, NULL, NULL, NULL, NULL),
	(25, 48, 5, NULL, NULL, NULL, NULL),
	(26, 49, 1, NULL, NULL, NULL, NULL),
	(27, 49, 2, NULL, NULL, NULL, NULL),
	(28, 49, 3, NULL, NULL, NULL, NULL),
	(29, 49, 4, NULL, NULL, NULL, NULL),
	(30, 49, 5, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.appsysusers_employment
CREATE TABLE IF NOT EXISTS `appsysusers_employment` (
  `PK_appsysusers_employment` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `employerName` varchar(255) DEFAULT NULL,
  `telephoneNumber` varchar(50) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `yearsEmployed` int DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_employment`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_employment: ~12 rows (approximately)
INSERT INTO `appsysusers_employment` (`PK_appsysusers_employment`, `FK_appsysUsers`, `order`, `employerName`, `telephoneNumber`, `position`, `yearsEmployed`) VALUES
	(1, 42, 1, NULL, NULL, NULL, NULL),
	(2, 42, 2, NULL, NULL, NULL, NULL),
	(3, 44, 1, NULL, NULL, NULL, NULL),
	(4, 44, 2, NULL, NULL, NULL, NULL),
	(5, 46, 1, NULL, NULL, NULL, NULL),
	(6, 46, 2, NULL, NULL, NULL, NULL),
	(7, 47, 1, NULL, NULL, NULL, NULL),
	(8, 47, 2, NULL, NULL, NULL, NULL),
	(9, 48, 1, NULL, NULL, NULL, NULL),
	(10, 48, 2, NULL, NULL, NULL, NULL),
	(11, 49, 1, 'OZMIK', 'na', 'ELECTRICIAN', 9),
	(12, 49, 2, 'OZMIK', 'na', 'ELECTRICIAN', 9);

-- Dumping structure for table devmanage-fiesta.appsysusers_homeownership
CREATE TABLE IF NOT EXISTS `appsysusers_homeownership` (
  `PK_appsysusers_homeownership` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `selectedOption` varchar(50) DEFAULT NULL,
  `monthlyAmortization` decimal(10,2) DEFAULT NULL,
  `monthlyRental` decimal(10,2) DEFAULT NULL,
  `landLord` varchar(255) DEFAULT NULL,
  `yearsStay` int DEFAULT NULL,
  `previousAddress` longtext,
  PRIMARY KEY (`PK_appsysusers_homeownership`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_homeownership: ~1 rows (approximately)
INSERT INTO `appsysusers_homeownership` (`PK_appsysusers_homeownership`, `FK_appsysUsers`, `selectedOption`, `monthlyAmortization`, `monthlyRental`, `landLord`, `yearsStay`, `previousAddress`) VALUES
	(1, 49, 'Owned', 1.00, 1.00, '1', 1, '1');

-- Dumping structure for table devmanage-fiesta.appsysusers_neighbors
CREATE TABLE IF NOT EXISTS `appsysusers_neighbors` (
  `PK_appsysusers_neighbors` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `raddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cellphoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_neighbors`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_neighbors: ~12 rows (approximately)
INSERT INTO `appsysusers_neighbors` (`PK_appsysusers_neighbors`, `FK_appsysUsers`, `order`, `rname`, `raddress`, `cellphoneNumber`) VALUES
	(1, 42, 1, NULL, NULL, NULL),
	(2, 42, 2, NULL, NULL, NULL),
	(3, 44, 1, NULL, NULL, NULL),
	(4, 44, 2, NULL, NULL, NULL),
	(5, 46, 1, NULL, NULL, NULL),
	(6, 46, 2, NULL, NULL, NULL),
	(7, 47, 1, NULL, NULL, NULL),
	(8, 47, 2, NULL, NULL, NULL),
	(9, 48, 1, NULL, NULL, NULL),
	(10, 48, 2, NULL, NULL, NULL),
	(11, 49, 1, 'BRIAN', 'GAMAO PHASE 1', '000-0000-000'),
	(12, 49, 2, 'NEKO', 'GAMAO PHASE 5', '000-0000-000');

-- Dumping structure for table devmanage-fiesta.appsysusers_personalpref
CREATE TABLE IF NOT EXISTS `appsysusers_personalpref` (
  `PK_appsysusers_personalpref` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `pname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `homeAddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `employer` varchar(255) DEFAULT NULL,
  `employerAddress` longtext,
  PRIMARY KEY (`PK_appsysusers_personalpref`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_personalpref: ~12 rows (approximately)
INSERT INTO `appsysusers_personalpref` (`PK_appsysusers_personalpref`, `FK_appsysUsers`, `order`, `pname`, `age`, `homeAddress`, `employer`, `employerAddress`) VALUES
	(1, 42, 1, NULL, NULL, NULL, NULL, NULL),
	(2, 42, 2, NULL, NULL, NULL, NULL, NULL),
	(3, 44, 1, NULL, NULL, NULL, NULL, NULL),
	(4, 44, 2, NULL, NULL, NULL, NULL, NULL),
	(5, 46, 1, NULL, NULL, NULL, NULL, NULL),
	(6, 46, 2, NULL, NULL, NULL, NULL, NULL),
	(7, 47, 1, NULL, NULL, NULL, NULL, NULL),
	(8, 47, 2, NULL, NULL, NULL, NULL, NULL),
	(9, 48, 1, NULL, NULL, NULL, NULL, NULL),
	(10, 48, 2, NULL, NULL, NULL, NULL, NULL),
	(11, 49, 1, 'EDDIE', 58, 'PRK 4A SAVLACATION, DAVAO DEL NORTE, PANABO CITY', 'NA', 'NA'),
	(12, 49, 2, 'ANNIE ALBLELDA', 58, 'PRK 4A SALVACATION, DAVAO DEL NORTE, PANABOY CITY', 'NA', 'NA');

-- Dumping structure for table devmanage-fiesta.appsysusers_relatives
CREATE TABLE IF NOT EXISTS `appsysusers_relatives` (
  `PK_appsysusers_relatives` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) DEFAULT NULL,
  `raddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cellphoneNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_relatives`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_relatives: ~12 rows (approximately)
INSERT INTO `appsysusers_relatives` (`PK_appsysusers_relatives`, `FK_appsysUsers`, `order`, `rname`, `raddress`, `cellphoneNumber`) VALUES
	(1, 42, 1, NULL, NULL, NULL),
	(2, 42, 2, NULL, NULL, NULL),
	(3, 44, 1, NULL, NULL, NULL),
	(4, 44, 2, NULL, NULL, NULL),
	(5, 46, 1, NULL, NULL, NULL),
	(6, 46, 2, NULL, NULL, NULL),
	(7, 47, 1, NULL, NULL, NULL),
	(8, 47, 2, NULL, NULL, NULL),
	(9, 48, 1, NULL, NULL, NULL),
	(10, 48, 2, NULL, NULL, NULL),
	(11, 49, 1, 'BRIAN ALICANDO', 'GAMAO PHASE 1', '946-3571-540'),
	(12, 49, 2, 'NEKO PORTUITO', 'GAMAO PHASE 4', '946-3571-540');

-- Dumping structure for table devmanage-fiesta.appsysusers_spouse
CREATE TABLE IF NOT EXISTS `appsysusers_spouse` (
  `PK_appsysusers_spouse` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `civilStatus` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `placeofBirth` longtext,
  `contactNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_spouse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_spouse: ~1 rows (approximately)
INSERT INTO `appsysusers_spouse` (`PK_appsysusers_spouse`, `FK_appsysUsers`, `lastName`, `firstName`, `middleName`, `nickName`, `fullName`, `gender`, `civilStatus`, `nationality`, `age`, `birthdate`, `placeofBirth`, `contactNumber`) VALUES
	(2, 49, 'NA', 'NA', 'NA', 'NA', 'NA, NA NA', 0, 'SINGLE', 'NA', 0, '2024-11-14', 'NA', '000-0000-000');

-- Dumping structure for table devmanage-fiesta.mm_attachments
CREATE TABLE IF NOT EXISTS `mm_attachments` (
  `PK_mm_attachments` int NOT NULL AUTO_INCREMENT,
  `FK_mn_installments` int DEFAULT NULL,
  `attachmentCode` varchar(50) DEFAULT NULL,
  `attachmentName` varchar(50) DEFAULT NULL,
  `attachmentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mm_attachments`),
  UNIQUE KEY `attachmentCode` (`attachmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_attachments: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mm_location
CREATE TABLE IF NOT EXISTS `mm_location` (
  `PK_mm_location` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  `isDefault` bit(1) DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL,
  `addressNoteDescription` longtext,
  PRIMARY KEY (`PK_mm_location`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_location: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mm_payments
CREATE TABLE IF NOT EXISTS `mm_payments` (
  `PK_mm_payments` int NOT NULL AUTO_INCREMENT,
  `receiptNo` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `processBy` int DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `daysInterval` int DEFAULT NULL,
  `FK_appsysUsers` int DEFAULT NULL,
  PRIMARY KEY (`PK_mm_payments`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_payments: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mm_schedule
CREATE TABLE IF NOT EXISTS `mm_schedule` (
  `PK_mm_schedule` int NOT NULL AUTO_INCREMENT,
  `order` int DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `FK_appsysUsers` int DEFAULT NULL,
  `dateSchedule` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remaining` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `fullyPaidDate` datetime DEFAULT NULL,
  `evaluation` varchar(50) DEFAULT NULL,
  `processedBy` int DEFAULT NULL,
  `receiptNo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_mm_schedule`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_schedule: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mn_installments
CREATE TABLE IF NOT EXISTS `mn_installments` (
  `PK_mn_installments` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `FK_mscProducts` int DEFAULT NULL,
  `installmentCode` varchar(50) DEFAULT NULL,
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
  `rejectReason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `reviewBy` int DEFAULT NULL,
  `reviewDate` datetime DEFAULT NULL,
  `cancelledDate` datetime DEFAULT NULL,
  `completedDate` datetime DEFAULT NULL,
  `installmentStatus` varchar(50) DEFAULT NULL,
  `schedulePayment` int DEFAULT NULL,
  PRIMARY KEY (`PK_mn_installments`),
  UNIQUE KEY `installmentCode` (`installmentCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mn_installments: ~3 rows (approximately)
INSERT INTO `mn_installments` (`PK_mn_installments`, `FK_appsysUsers`, `FK_mscProducts`, `installmentCode`, `approvedMonths`, `productPrice`, `productDownpayment`, `productPercent`, `requestedDate`, `approvedDate`, `approvedBy`, `approvedPaymentSched`, `rejectedBy`, `rejectedDate`, `rejectReason`, `reviewBy`, `reviewDate`, `cancelledDate`, `completedDate`, `installmentStatus`, `schedulePayment`) VALUES
	(4, 49, 27, 'CGZIODHB8P3J710VM96L', 12, 42699.00, 10000.00, NULL, '2024-11-28 16:14:57', '2024-11-28 16:15:29', 46, '2024-12-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'APPROVED', NULL),
	(5, 50, 28, 'KPZQBY1L3OAEMHWJXRV2', NULL, 9900.00, NULL, NULL, '2024-11-30 07:06:17', NULL, NULL, NULL, 46, '2024-11-30 07:07:34', 'WRONG DETAILS', NULL, NULL, NULL, NULL, 'REJECTED', NULL),
	(6, 50, 27, 'O3B9N1ATLSM6YECWPZK8', 12, 42699.00, 20000.00, NULL, '2024-11-30 07:07:06', '2024-11-30 07:08:22', 46, '2024-12-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'APPROVED', NULL);

-- Dumping structure for table devmanage-fiesta.msc_brands
CREATE TABLE IF NOT EXISTS `msc_brands` (
  `PK_mscBrands` int NOT NULL AUTO_INCREMENT,
  `FK_mscCategories` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscBrands`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_brands: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.msc_categories
CREATE TABLE IF NOT EXISTS `msc_categories` (
  `PK_mscCategories` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscCategories`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `detailsId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscDetails`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_details: ~4 rows (approximately)

-- Dumping structure for table devmanage-fiesta.msc_images
CREATE TABLE IF NOT EXISTS `msc_images` (
  `PK_mscUploads` int NOT NULL AUTO_INCREMENT,
  `FK_mscProducts` int DEFAULT NULL,
  `fileCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fileExtension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fileUploaded` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mscUploads`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.msc_images: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.msc_models
CREATE TABLE IF NOT EXISTS `msc_models` (
  `PK_mscModels` int NOT NULL AUTO_INCREMENT,
  `FK_mscBrands` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscModels`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_models: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.msc_products
CREATE TABLE IF NOT EXISTS `msc_products` (
  `PK_mscProducts` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) DEFAULT NULL,
  `productUnit` varchar(255) DEFAULT NULL,
  `productBrandID` int DEFAULT NULL,
  `productBrand` varchar(255) DEFAULT NULL,
  `productModelID` int DEFAULT NULL,
  `productModel` varchar(255) DEFAULT NULL,
  `productSKU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FK_mscCategories` int DEFAULT NULL COMMENT 'TABLE MSCCATEGORIES',
  `productDescription` longtext,
  `FK_detailsId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'TABLE MSCPRODUCTS',
  `quantity` int DEFAULT NULL,
  `regularPrice` decimal(10,2) DEFAULT '0.00',
  `salePrice` decimal(10,2) DEFAULT '0.00',
  `repoPrice` decimal(10,2) DEFAULT '0.00',
  `stockMinimum` int DEFAULT NULL,
  `stockMaximum` int DEFAULT NULL,
  `isRegular` bit(1) DEFAULT NULL,
  `isSale` bit(1) DEFAULT NULL,
  `isRepo` bit(1) DEFAULT NULL,
  `productStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_mscProducts`),
  UNIQUE KEY `productName` (`productName`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_products: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.msc_properties
CREATE TABLE IF NOT EXISTS `msc_properties` (
  `PK_mscProperties` int NOT NULL AUTO_INCREMENT,
  `FK_mscCategories` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscProperties`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_properties: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.msc_uploads
CREATE TABLE IF NOT EXISTS `msc_uploads` (
  `PK_mscUploads` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `fileCode` varchar(50) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fileExtension` varchar(50) DEFAULT NULL,
  `fileUploaded` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mscUploads`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_uploads: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.vv_changelog
CREATE TABLE IF NOT EXISTS `vv_changelog` (
  `PK_vv_changelog` int NOT NULL AUTO_INCREMENT,
  `changeLogVersion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_vv_changelog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.vv_changelog: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
