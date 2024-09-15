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
  `FK_geolocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'GEOLOCATION REFERENCE CODE',
  `FK_mscinfoChildrens` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'TABLE MSCINFOCHILDRENS',
  `FK_mscinfoRelatives` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'TABLE MSCINFORELATIVES',
  `FK_mscinfoNeighbors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'TABLE MSCINFONEIGHBORS',
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
  `userFullName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysUsers`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~3 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `user_secret`, `isSecret`, `isActivated`, `isDisabled`, `isDeactivated`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `FK_geolocation`, `FK_mscinfoChildrens`, `FK_mscinfoRelatives`, `FK_mscinfoNeighbors`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userFullName`) VALUES
	(1, 'administrator@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 'RMZDIUD2N3S6SDML', b'1', b'1', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FLORO', 'JECO', 'ESCOTO', 'COCO', 0, 'SINGLE', 'FILIPINO', 25, '1999-05-11', 'TAGUM CITY', '938-9206-940', 'DNSC COMPOUND, NEW VISAYAS, PANABO CITY', 'FLORO, JECO ESCOTO'),
	(24, 'jec.floro@gmail.com', 'TzJUUVhzaFdqR0p6K3F6SE53L3FPdz09', NULL, 'ynAPLw04lT', '8uPRGasS9ZzFAq5IUmCjQ7btKg60B1', 'IQVCR7QBOUZ3ZHYM', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 'hmo.rmci@gmail.com', 'Q2dVVnFWdC81OW1PNHdEYkl0MWQ0QT09', NULL, 'oZsCbziIO9', 'WQhijgapkLdEB4SwqseYNPR2HJxDI8', NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.msc_categories
CREATE TABLE IF NOT EXISTS `msc_categories` (
  `PK_mscCategories` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscCategories`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_details: ~11 rows (approximately)
INSERT INTO `msc_details` (`PK_mscDetails`, `order`, `detailsId`, `title`, `description`) VALUES
	(34, 1, 'T1y9Aj', 'Refrigerator Type', 'Bottom Freezer, Two Door'),
	(35, 2, 'T1y9Aj', 'Capacity', '14.8 cu.ft. / 420 liters'),
	(36, 3, 'T1y9Aj', 'CSPF Rating', '479'),
	(37, 4, 'T1y9Aj', 'Rated Power Input', '83 W'),
	(38, 5, 'T1y9Aj', 'Color', 'Glossy Silver Steel'),
	(39, 6, 'T1y9Aj', 'Gross Weight', '74.0 kg'),
	(40, 7, 'T1y9Aj', 'Net Weight', '67.0 kg'),
	(41, 8, 'T1y9Aj', 'Unit Dimension (WxHxD)', '686 x 1790 x 695 mm'),
	(42, 9, 'T1y9Aj', 'Warranty', '1 Year on Parts and Labor | 12 Years on Compressor'),
	(43, 1, 'p5Ww89', 'Refrigerator Type', 'Top Freezer, Two Door'),
	(44, 2, 'p5Ww89', 'Capacity', '6.0 cu.ft.');

-- Dumping structure for table devmanage-fiesta.msc_products
CREATE TABLE IF NOT EXISTS `msc_products` (
  `PK_mscProducts` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) DEFAULT NULL,
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
INSERT INTO `msc_products` (`PK_mscProducts`, `productName`, `productSKU`, `FK_mscCategories`, `productDescription`, `FK_detailsId`, `quantity`, `regularPrice`, `salePrice`, `repoPrice`, `stockMinimum`, `stockMaximum`, `isRegular`, `isSale`, `isRepo`, `productStatus`) VALUES
	(27, 'Panasonic NRBX471CPSP', '000000000', 25, 'Prime Fresh\nAg Clean\nAI Econavi with 4 Sensors\nInverter Compressor\nElectrostatic Touch Control Panel\nFresh Safe\nDoor Pockets\nHeight Adjustable Shelves\nTempered Glass Shelves\nLED Light\nPower Control\nTwist Ice Tray\nQuick Freezing\nQuick Ice Making\nR600a Refrigerant', 'T1y9Aj', 10, 42699.00, 40699.00, 38699.00, 0, 0, b'1', NULL, NULL, 'Active'),
	(28, 'Fujidenzo RDD60S', '000000000', 25, 'Direct Cool\nManual Defrost\nEnergy Efficient Compressor\nR600a Refrigerant\nClean Back Design\nSpace Saver\nBig Freezer Space\nStainless Look\nReversible Door\nAdjustable Wire Shelves\nHardtop Design', 'p5Ww89', 5, 11900.00, 9900.00, 7900.00, 0, 0, NULL, b'1', NULL, 'Active'),
	(30, 'Fujidenzo RDD61S', '000000000', 25, 'Direct Cool\nManual Defrost\nEnergy Efficient Compressor\nR600a Refrigerant\nClean Back Design\nSpace Saver\nBig Freezer Space\nStainless Look\nReversible Door\nAdjustable Wire Shelves\nHardtop Design', 'p5Ww89', 5, 8000.00, 7000.00, 4900.00, 0, 0, NULL, NULL, b'1', 'Active');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
