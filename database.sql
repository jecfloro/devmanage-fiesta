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
  PRIMARY KEY (`PK_appsysUsers`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~4 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `user_secret`, `isSecret`, `isActivated`, `isDisabled`, `isDeactivated`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userRegionCode`, `userRegion`, `userProvinceCode`, `userProvince`, `userCityCode`, `userCity`, `userBarangayCode`, `userBarangay`, `userFullName`, `isProfileFilled`, `isSpouseFilled`, `isHomeOwnershipFilled`, `isEmploymentFilled`, `isPersonalPrefFilled`, `isChildrenFilled`, `isRelativesFilled`, `isNeighborFilled`) VALUES
	(1, 'administrator@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 'RMZDIUD2N3S6SDML', NULL, b'1', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, 'FLORO', 'JECO', 'ESCOTO', 'COCO', 0, 'SINGLE', 'FILIPINO', 25, '1999-05-11', 'TAGUM CITY', '938-9206-940', 'DNSC COMPOUND, NEW VISAYAS, PANABO CITY', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315027', 'QUEZON', 'FLORO, JECO ESCOTO', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 'jec.floro@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'ynAPLw04lT', '8uPRGasS9ZzFAq5IUmCjQ7btKg60B1', 'IQVCR7QBOUZ3ZHYM', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, 'FLORO', 'JECO', 'ESCOTO', 'COCO', 0, 'SINGLE', 'FILIPINO', 25, '1999-05-11', 'TAGUM CITY', '938-9206-940', 'DNSC COMPOUND', '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315026', 'NEW VISAYAS', 'FLORO, JECO ESCOTO', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1'),
	(32, 'cmu.rmci@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'MWvVjlSgYw', 'kUrVsvw0bGpzC8AXtqW1g5dlFTMHZQ', 'IQVCR7QBOUZ3ZHYA', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, 'FLORO', 'JECO', 'ESCOTO', 'COCO', 0, 'SINGLE', 'FILIPINO', 24, '2024-10-13', 'PANABO CITY', '938-9206-940', NULL, '11', 'REGION XI (DAVAO REGION)', '1123', 'DAVAO DEL NORTE', '112315', 'CITY OF PANABO', '112315009', 'GREDU (POB.)', 'FLORO, JECO ESCOTO', b'1', NULL, b'1', b'1', b'1', NULL, b'1', b'1'),
	(36, 'cashier.fa@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', NULL, 'p3tdjUywE9', 'GmF73U0P1IgvMXAkqNyre6OZVYTslC', 'NO4MC3TPBCUOOMYO', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', 'FLORO', 'JECO', 'ESCOTO', 'COCO', 0, 'MARRIED', 'AA', 25, '2024-11-06', 'BB', '938-9206-940', 'DNSC', '01', 'REGION I (ILOCOS REGION)', '0128', 'ILOCOS NORTE', '012804', 'BANGUI', '012804003', 'BANBAN', 'FLORO, JECO ESCOTO', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_children: ~15 rows (approximately)
INSERT INTO `appsysusers_children` (`PK_appsysusers_children`, `FK_appsysUsers`, `order`, `cname`, `age`, `graduateYear`, `school`) VALUES
	(8, 24, 1, '1', 1, 1, '1'),
	(9, 24, 2, '2', 2, 2, '2'),
	(10, 24, 3, '3', 3, 3, '3'),
	(11, 24, 4, '4', 4, 4, '4'),
	(12, 24, 5, '5', 5, 5, '5'),
	(13, 32, 1, '1', 1, 1, '1'),
	(14, 32, 2, '2', 2, 2, '2'),
	(15, 32, 3, '3', 3, 3, '3'),
	(16, 32, 4, '4', 4, 4, '4'),
	(17, 32, 5, '5', 5, 5, '5'),
	(18, 36, 1, NULL, NULL, NULL, NULL),
	(19, 36, 2, NULL, NULL, NULL, NULL),
	(20, 36, 3, NULL, NULL, NULL, NULL),
	(21, 36, 4, NULL, NULL, NULL, NULL),
	(22, 36, 5, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_employment: ~6 rows (approximately)
INSERT INTO `appsysusers_employment` (`PK_appsysusers_employment`, `FK_appsysUsers`, `order`, `employerName`, `telephoneNumber`, `position`, `yearsEmployed`) VALUES
	(3, 24, 1, 'RIVERA MEDICAL CENTER, INC.', '09389206940', 'MIS STAFF', 2),
	(4, 24, 2, 'RIVERA MEDICAL CENTER, INC.', '09389206940', 'CONCIERGE', 1),
	(5, 32, 1, 'RIVERA MEDICAL CENTER, INC.', '09389206940', 'STAFF NURSE', 1),
	(6, 32, 2, NULL, NULL, NULL, NULL),
	(7, 36, 1, NULL, NULL, NULL, NULL),
	(8, 36, 2, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_homeownership: ~2 rows (approximately)
INSERT INTO `appsysusers_homeownership` (`PK_appsysusers_homeownership`, `FK_appsysUsers`, `selectedOption`, `monthlyAmortization`, `monthlyRental`, `landLord`, `yearsStay`, `previousAddress`) VALUES
	(2, 24, 'Living with Parents', 1000.00, 1000.00, 'JECO E. FLORO', 10, 'B'),
	(3, 32, 'Owned', 100.00, 100.00, 'JECO E. FLORO', 10, 'Isabela Homes, Panabo City, Davao del Norte');

-- Dumping structure for table devmanage-fiesta.appsysusers_neighbors
CREATE TABLE IF NOT EXISTS `appsysusers_neighbors` (
  `PK_appsysusers_neighbors` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `raddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cellphoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_neighbors`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_neighbors: ~6 rows (approximately)
INSERT INTO `appsysusers_neighbors` (`PK_appsysusers_neighbors`, `FK_appsysUsers`, `order`, `rname`, `raddress`, `cellphoneNumber`) VALUES
	(10, 24, 1, '1', '1', '123-1231-232'),
	(11, 24, 2, '2', '2', '123-1231-233'),
	(12, 32, 1, '1', '1', '938-9206-940'),
	(13, 32, 2, '2', '2', '938-9206-940'),
	(14, 36, 1, NULL, NULL, NULL),
	(15, 36, 2, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_personalpref: ~6 rows (approximately)
INSERT INTO `appsysusers_personalpref` (`PK_appsysusers_personalpref`, `FK_appsysUsers`, `order`, `pname`, `age`, `homeAddress`, `employer`, `employerAddress`) VALUES
	(5, 24, 1, '1', 1, '1', '1', '1'),
	(6, 24, 2, '2', 2, '2', '2', '2'),
	(7, 32, 1, '1', 1, '1', '1', '1'),
	(8, 32, 2, '1', 1, '1', '1', '1'),
	(9, 36, 1, NULL, NULL, NULL, NULL, NULL),
	(10, 36, 2, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.appsysusers_relatives
CREATE TABLE IF NOT EXISTS `appsysusers_relatives` (
  `PK_appsysusers_relatives` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) DEFAULT NULL,
  `raddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cellphoneNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_relatives`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_relatives: ~6 rows (approximately)
INSERT INTO `appsysusers_relatives` (`PK_appsysusers_relatives`, `FK_appsysUsers`, `order`, `rname`, `raddress`, `cellphoneNumber`) VALUES
	(15, 24, 1, '1', '1', '123-1231-231'),
	(16, 24, 2, '2', '2', '123-1231-231'),
	(17, 32, 1, '1', '1', '938-9206-940'),
	(18, 32, 2, NULL, NULL, NULL),
	(19, 36, 1, NULL, NULL, NULL),
	(20, 36, 2, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_spouse: ~0 rows (approximately)

-- Dumping structure for table devmanage-fiesta.mm_attachments
CREATE TABLE IF NOT EXISTS `mm_attachments` (
  `PK_mm_attachments` int NOT NULL AUTO_INCREMENT,
  `FK_mn_installments` int DEFAULT NULL,
  `attachmentCode` varchar(50) DEFAULT NULL,
  `attachmentName` varchar(50) DEFAULT NULL,
  `attachmentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_mm_attachments`),
  UNIQUE KEY `attachmentCode` (`attachmentCode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_attachments: ~3 rows (approximately)
INSERT INTO `mm_attachments` (`PK_mm_attachments`, `FK_mn_installments`, `attachmentCode`, `attachmentName`, `attachmentDate`) VALUES
	(1, 7, 'ZYZMCD57HLAFO09QPWSA', 'CAMERA', '2024-10-10 18:16:44'),
	(3, 7, 'ZYZMCD57HLAFO09QPWSB', 'CHECK', '2024-10-10 18:17:28'),
	(4, 7, 'ZYZMCD57HLAFO09QPWSC', 'MESSAGES', '2024-10-10 18:17:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_location: ~3 rows (approximately)
INSERT INTO `mm_location` (`PK_mm_location`, `FK_appsysUsers`, `lat`, `long`, `isDefault`, `addedBy`, `dateAdded`, `addressNoteDescription`) VALUES
	(1, 24, '7.313583485979848', '125.68549869949479', b'1', 1, '2024-10-17 15:15:40', 'NOTE 1'),
	(2, 24, '7.3103072719008315', '125.66818748409582', NULL, 1, '2024-10-18 15:16:41', 'NOTE 2'),
	(3, 24, '7.2985980539759785', '125.66856573962038', NULL, 1, '2024-10-19 15:10:42', 'NOTE 3');

-- Dumping structure for table devmanage-fiesta.mm_payments
CREATE TABLE IF NOT EXISTS `mm_payments` (
  `PK_mm_payments` int NOT NULL AUTO_INCREMENT,
  `receiptNo` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `processBy` int DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `FK_mn_installments` int DEFAULT NULL,
  `FK_appsysUsers` int DEFAULT NULL,
  PRIMARY KEY (`PK_mm_payments`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_payments: ~0 rows (approximately)
INSERT INTO `mm_payments` (`PK_mm_payments`, `receiptNo`, `amount`, `processBy`, `processDate`, `FK_mn_installments`, `FK_appsysUsers`) VALUES
	(2, '0000', 2724.60, 36, '2024-11-18 22:42:02', 25, 24);

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

-- Dumping data for table devmanage-fiesta.mm_schedule: ~12 rows (approximately)
INSERT INTO `mm_schedule` (`PK_mm_schedule`, `order`, `FK_mn_installments`, `FK_appsysUsers`, `dateSchedule`, `amount`, `remaining`, `status`, `fullyPaidDate`, `evaluation`, `processedBy`, `receiptNo`) VALUES
	(37, 1, 25, 24, '2025-01-17', 2724.92, 0.00, 'FULL', '2024-11-18 00:00:00', 'PAID', 36, '0000'),
	(38, 2, 25, 24, '2025-02-16', 2724.92, 0.00, 'FULL', '2024-11-18 00:00:00', 'PAID', 36, '0000'),
	(39, 3, 25, 24, '2025-03-18', 2724.92, 0.00, 'FULL', '2024-11-18 00:00:00', 'PAID', 36, '0000'),
	(40, 4, 25, 24, '2025-04-17', 2724.92, 0.00, 'FULL', '2024-11-18 00:00:00', 'PAID', 36, '0000'),
	(41, 5, 25, 24, '2025-05-17', 2724.92, 0.40, 'BALANCE', NULL, 'PAID', 36, '0000'),
	(42, 6, 25, 24, '2025-06-16', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 7, 25, 24, '2025-07-16', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, 8, 25, 24, '2025-08-15', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 9, 25, 24, '2025-09-14', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 10, 25, 24, '2025-10-14', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, 11, 25, 24, '2025-11-13', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 12, 25, 24, '2025-12-13', 2724.92, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mn_installments: ~2 rows (approximately)
INSERT INTO `mn_installments` (`PK_mn_installments`, `FK_appsysUsers`, `FK_mscProducts`, `installmentCode`, `approvedMonths`, `productPrice`, `productDownpayment`, `productPercent`, `requestedDate`, `approvedDate`, `approvedBy`, `approvedPaymentSched`, `rejectedBy`, `rejectedDate`, `rejectReason`, `reviewBy`, `reviewDate`, `cancelledDate`, `completedDate`, `installmentStatus`, `schedulePayment`) VALUES
	(23, 24, 27, '3NBAGFDC8Y1UL4VTMI52', 12, 42699.00, 20000.00, NULL, '2024-10-15 11:05:44', '2024-10-15 11:06:12', 24, NULL, 32, '2024-11-18 00:11:02', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. \n\nTempore suscipit atque quasi minus praesentium, soluta odit, est laudantium dicta dolor quisquam molestias nam iure. Laborum nulla libero at consequatur fuga.', NULL, NULL, '2024-10-16 04:51:49', '2024-10-15 11:17:48', 'REJECTED', NULL),
	(24, 24, 28, 'B1PT20DIHELO5SFC8XMK', 12, 9900.00, 2000.00, NULL, '2024-10-18 08:17:14', '2024-11-18 01:48:58', 32, '2024-12-18', 24, '2024-10-18 08:18:05', 'NONE', NULL, NULL, '2024-11-12 06:47:35', '2024-10-18 08:19:21', 'PENDING', NULL),
	(25, 24, 27, '5ICKBXJPWS0YEF6GO49Q', 12, 42699.00, 10000.00, NULL, '2024-11-18 18:01:53', '2024-11-18 22:40:37', 32, '2024-12-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'APPROVED', NULL);

-- Dumping structure for table devmanage-fiesta.msc_categories
CREATE TABLE IF NOT EXISTS `msc_categories` (
  `PK_mscCategories` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscCategories`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_categories: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_details: ~0 rows (approximately)
INSERT INTO `msc_details` (`PK_mscDetails`, `order`, `detailsId`, `title`, `description`) VALUES
	(63, 1, 'p5Ww89', 'Refrigerator Type', 'Top Freezer, Two Door'),
	(64, 2, 'p5Ww89', 'Capacity', '6.0 cu.ft.'),
	(65, 3, 'p5Ww89', '1', '1'),
	(66, 1, 'p5Ww90', '1', '1');

-- Dumping structure for table devmanage-fiesta.msc_products
CREATE TABLE IF NOT EXISTS `msc_products` (
  `PK_mscProducts` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) DEFAULT NULL,
  `productUnit` varchar(255) DEFAULT NULL,
  `productBrand` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_products: ~0 rows (approximately)
INSERT INTO `msc_products` (`PK_mscProducts`, `productName`, `productUnit`, `productBrand`, `productModel`, `productSKU`, `FK_mscCategories`, `productDescription`, `FK_detailsId`, `quantity`, `regularPrice`, `salePrice`, `repoPrice`, `stockMinimum`, `stockMaximum`, `isRegular`, `isSale`, `isRepo`, `productStatus`) VALUES
	(27, 'Panasonic NRBX471CPSP', 'Ex', 'Panasonic', 'NRBX471CPSP', '000000001', 25, 'Prime Fresh\nAg Clean\nAI Econavi with 4 Sensors\nInverter Compressor\nElectrostatic Touch Control Panel\nFresh Safe\nDoor Pockets\nHeight Adjustable Shelves\nTempered Glass Shelves\nLED Light\nPower Control\nTwist Ice Tray\nQuick Freezing\nQuick Ice Making\nR600a Refrigerant', 'T1y9Aj', 10, 42699.00, 40699.00, 37699.00, 0, 0, b'1', NULL, NULL, 'Active'),
	(28, 'Fujidenzo RDD60S', '4', '4', '4', '000000000', 25, 'Direct Cool\nManual Defrost\nEnergy Efficient Compressor\nR600a Refrigerant\nClean Back Design\nSpace Saver\nBig Freezer Space\nStainless Look\nReversible Door\nAdjustable Wire Shelves\nHardtop Design', 'p5Ww89', 5, 11900.00, 9900.00, 7900.00, 0, 0, NULL, b'1', b'1', 'Active'),
	(30, 'Fujidenzo RDD61S', '1', '1', '1', '000000000', 25, 'Direct Cool\nManual Defrost\nEnergy Efficient Compressor\nR600a Refrigerant\nClean Back Design\nSpace Saver\nBig Freezer Space\nStainless Look\nReversible Door\nAdjustable Wire Shelves\nHardtop Design', 'p5Ww90', 5, 8000.00, 7000.00, 4900.00, 0, 0, NULL, b'1', b'1', 'Active');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_uploads: ~0 rows (approximately)
INSERT INTO `msc_uploads` (`PK_mscUploads`, `FK_appsysUsers`, `FK_mn_installments`, `fileCode`, `fileName`, `fileExtension`, `fileUploaded`) VALUES
	(13, 24, 23, '673a074a5cfef-1731856202.pdf', 'RFQ-BT420-8GB-DDR4-10292024.pdf', 'pdf', '2024-11-17 23:10:02'),
	(14, 24, 23, '673a074a5d5a5-1731856202.pdf', 'RFQ-lenovo-MINI-DESKTOP-10212024.pdf', 'pdf', '2024-11-17 23:10:02'),
	(15, 24, 24, '673a270a80767-1731864330.pdf', 'RFQ-BT420-8GB-DDR4-10292024.pdf', 'pdf', '2024-11-18 01:25:30'),
	(16, 24, 24, '673a270a81273-1731864330.pdf', 'RFQ-lenovo-MINI-DESKTOP-10212024.pdf', 'pdf', '2024-11-18 01:25:30'),
	(19, 24, 25, '673b1372187e5-1731924850.pdf', '673a270a80767-1731864330.pdf', 'pdf', '2024-11-18 18:14:10'),
	(20, 24, 25, '673b137219c7b-1731924850.pdf', '673a270a81273-1731864330.pdf', 'pdf', '2024-11-18 18:14:10');

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
