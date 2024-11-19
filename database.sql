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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~1 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `user_secret`, `isSecret`, `isActivated`, `isDisabled`, `isDeactivated`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userRegionCode`, `userRegion`, `userProvinceCode`, `userProvince`, `userCityCode`, `userCity`, `userBarangayCode`, `userBarangay`, `userFullName`, `isProfileFilled`, `isSpouseFilled`, `isHomeOwnershipFilled`, `isEmploymentFilled`, `isPersonalPrefFilled`, `isChildrenFilled`, `isRelativesFilled`, `isNeighborFilled`) VALUES
	(1, 'administrator@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 'RMZDIUD2N3S6SDML', NULL, b'1', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_children: ~0 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_employment: ~8 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.appsysusers_homeownership: ~2 rows (approximately)

-- Dumping structure for table devmanage-fiesta.appsysusers_neighbors
CREATE TABLE IF NOT EXISTS `appsysusers_neighbors` (
  `PK_appsysusers_neighbors` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `raddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cellphoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_neighbors`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_neighbors: ~8 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_personalpref: ~8 rows (approximately)

-- Dumping structure for table devmanage-fiesta.appsysusers_relatives
CREATE TABLE IF NOT EXISTS `appsysusers_relatives` (
  `PK_appsysusers_relatives` int NOT NULL AUTO_INCREMENT,
  `FK_appsysUsers` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `rname` varchar(255) DEFAULT NULL,
  `raddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cellphoneNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PK_appsysusers_relatives`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers_relatives: ~8 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_attachments: ~3 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_location: ~1 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_payments: ~6 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mm_schedule: ~24 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.mn_installments: ~3 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_details: ~4 rows (approximately)
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

-- Dumping data for table devmanage-fiesta.msc_products: ~3 rows (approximately)
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
