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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~2 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `user_secret`, `isSecret`, `isActivated`, `isDisabled`, `isDeactivated`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `FK_geolocation`, `FK_mscinfoChildrens`, `FK_mscinfoRelatives`, `FK_mscinfoNeighbors`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userFullName`) VALUES
	(1, 'administrator@gmail.com', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 'RMZDIUD2N3S6SDML', b'1', b'1', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bk9ydjNYeS9zWVM1R3k0VVU2am5ZZz09', 'TXdnVFlYbUVWYnBZdVk2aHRKTHlaZz09', 'SHd5SDEvcm5ybFVEWS9oVXk5d2srZz09', 'dzFZbWtFNDd6STFjS1A3L0pOc3NUZz09', 0, 'NTdYalptTFptVEFQbWcvd1AwaDFadz09', 'Vm40eENxcHpDNWlHY294QndTdEVxdz09', 25, '1999-05-11', 'QjFENitrTzdoY1ROREpyWWxMNGM3dz09', 'RlBQVGdqSG1PYUpXRzRSaXlpaTVqQT09', 'bDByTTlvSE1FU3lxTkxZejhERnV0WW1Nd3FrT1FYbk91dEwrNUtoOVF3eWxHR2V3cGJrYmtwdTQ4eHZreDNDWQ==', 'enVKT2doWjRJZW5RVVZxR2xPWGt6czRVV01SZkQ0cjJWZ0RvaCtpd3Avaz0='),
	(24, 'jec.floro@gmail.com', 'TzJUUVhzaFdqR0p6K3F6SE53L3FPdz09', NULL, 'ynAPLw04lT', '8uPRGasS9ZzFAq5IUmCjQ7btKg60B1', 'IQVCR7QBOUZ3ZHYM', NULL, b'1', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table devmanage-fiesta.msc_categories
CREATE TABLE IF NOT EXISTS `msc_categories` (
  `PK_mscCategories` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscCategories`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_categories: ~11 rows (approximately)
INSERT INTO `msc_categories` (`PK_mscCategories`, `description`) VALUES
	(16, 'aVlWRjNvNzFJRlRmY1FncjE4V1Z6QT09'),
	(23, 'd2xCb3hBYTN4dWY2OTRIRG1SaTlCUT09'),
	(22, 'eEF5MkkrOGhDZjkxRTYreWFLVjJqQT09'),
	(21, 'ejNXUmM1a210bUFFcE1zRWVUZEE5UT09'),
	(20, 'eVAwWVE4UUw1eWRrUXRTdzBPem5CUT09'),
	(18, 'K0YyR2FyOTI0V3NHSEd1TjJqcWd3Zz09'),
	(19, 'N1B1b2xwNnAwa3NRaUpmTlRvamVqUT09'),
	(15, 'RCtZOHIwcEU2VWwvOWo0OGJpT01Hdz09'),
	(17, 'RUlKOEFod0hYN1M0QjBFdCt4aFFmQT09'),
	(13, 'RWl3Rm5RSVpaYW1EOE02M0U2ZlRYZz09'),
	(14, 'ZEp3MmRNNEFuZGFXbU5HNDZzWWsxUT09');

-- Dumping structure for table devmanage-fiesta.msc_details
CREATE TABLE IF NOT EXISTS `msc_details` (
  `PK_mscDetails` int NOT NULL AUTO_INCREMENT,
  `order` int DEFAULT NULL,
  `detailsId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_mscDetails`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_details: ~28 rows (approximately)
INSERT INTO `msc_details` (`PK_mscDetails`, `order`, `detailsId`, `title`, `description`) VALUES
	(2, 1, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Refrigerator Type', 'Top Freezer, Two Door'),
	(3, 2, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Capacity', '12.7 cu.ft.'),
	(4, 3, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'CSPF Rating', '377'),
	(5, 4, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Door Material', 'PCM'),
	(6, 5, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Door Finish', 'Nature Beige'),
	(7, 6, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Handle Type', 'Horizontal Packet'),
	(8, 7, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Package Weight', '66.0 kg'),
	(9, 8, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Unit Weight', '60.0 kg'),
	(10, 9, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Unit Dimension (WxHxD)', '600 x 1720 x 710 mm'),
	(11, 10, 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 'Warranty', '2 Years on Parts and Labor | 10 Years on Compressor'),
	(12, 1, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Refrigerator Type', 'Bottom Freezer, Two Door'),
	(13, 2, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Capacity', '14.8 cu.ft. / 420 liters'),
	(14, 3, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'CSPF Rating', '479'),
	(15, 4, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Rated Power Input', '83 W'),
	(16, 5, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Color', 'Glossy Silver Steel'),
	(17, 6, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Gross Weight', '74.0 kg'),
	(18, 8, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Net Weight', '67.0 kg'),
	(19, 9, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Unit Dimension (WxHxD)', '686 x 1790 x 695 mm'),
	(20, 10, 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 'Warranty', '1 Year on Parts and Labor | 12 Years on Compressor'),
	(21, 1, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Refrigerator Type', 'Side by Side'),
	(22, 2, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Gross Capacity', '24.7 cu.ft.'),
	(23, 3, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Net Capacity', '22.9 cu.ft.'),
	(24, 4, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Color', 'Gentle Silver Matt'),
	(25, 5, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Package Weight', '108.0 kg'),
	(26, 6, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Net Weight', '101.0 kg'),
	(27, 7, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Package Dimension (WxHxD)', '974 x 1909 x 776 mm'),
	(28, 8, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Net Dimension (WxHxD)', '912 x 1780 x 716 mm'),
	(29, 9, 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 'Warranty', '1 Year on Parts and Labor | 20 Years on Compressor'),
	(30, 1, 'NC8waENyWjhOaDdCN3U4NUdzWS9NZz09', 'Freezer Type', 'Chest'),
	(31, 2, 'NC8waENyWjhOaDdCN3U4NUdzWS9NZz09', 'Capacity', '14.0 cu.ft.'),
	(32, 3, 'NC8waENyWjhOaDdCN3U4NUdzWS9NZz09', 'Dimension (WxHxD)', '1300 x 850 x 705 mm'),
	(33, 4, 'NC8waENyWjhOaDdCN3U4NUdzWS9NZz09', 'Warranty', '1 Year on Labor | 2 Years on Parts | 5 Years on Compressor');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devmanage-fiesta.msc_products: ~4 rows (approximately)
INSERT INTO `msc_products` (`PK_mscProducts`, `productName`, `productSKU`, `FK_mscCategories`, `productDescription`, `FK_detailsId`, `quantity`, `regularPrice`, `salePrice`, `repoPrice`, `stockMinimum`, `stockMaximum`, `isRegular`, `isSale`, `isRepo`, `productStatus`) VALUES
	(21, 'MndPek9kSXkyK0t4aG9ucU1ad3Bxdz09', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', 23, 'STF5cS90VElsNjUreURNSEhHY1RzYzFnV0JMekhqLzVyc2c1VktDNVRMTGFFdkRHNHh1aThGVzhPKzlrc3lIRXdpZEkvMEl1RnpkTkt6QmFrVldjYlFEcW9QREIxQkFvT0ZZZ0FEcjhIWmtnR0dqR3lxRHNBRXcwSVhnWEhTa014RFFaa1RVbkJIMzh5endhbm85U0tjeXJhN1JQa1Y0dEJTOHcxRG1CODl6aVRSTnYxQTBkNzR3MDVHa05laWtmeFQvdkMzeCtvTWdVamVyR1ZFTFVhQT09', 'bFowQ1VhT1JIQldaWCt5NnBtandtdz09', 2, 31495.00, 0.00, 0.00, 0, 0, b'1', NULL, NULL, 'Active'),
	(22, 'QVZTWWcwVy9BeE56M2I4b2Z0eitiNW83RjRaVGlMdnVqYUFVWXpHdWc5az0=', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', 23, 'b0pkZisxTFNVejJoZDFiK2NZdXVkNlE3NWM2K1AzSk9JcWgxcStDWDIwVG1FT3hucjUwRTU2NVBZb0NueVJhQkRIbUVIR1Y2d3RxVXJsS2RsNmYxamZHMExrb3hkS2lrQ0tia3ZZMWlFdFg3dUpGUGtNOFhoWnBiTGt1U1FHTXBacHhEaUFCaXR0bG5KNXgxYXRnK1J1ZW8yVHdOZkZHeTMxZnhBcU1yUWQvY3BiUXFaYWlFeVpuUzJCVWc4WW5mWllxam4ybUpyRmV6bk1uYjk2QS9BK2xhdGlxUGhMRzZSU3dJTDQ3OEpvZW1lRkdRY1hNSHh5bHUrNzRORFFXbDBuSVVWRG5lUVpNK1FYV1pJVWtBVnVSa3BIdmptd2pmRXgzWlpzQ3FlQjRFWXg0bVNwMm1lZmlRamdnbE1GenF0Z1NZQUptMU9TWXZTVzhTMFhyTzZtSzAxVCtZU29vQVBzaFRXY1dOVGRzPQ==', 'ejZIS3N2emdmcUdzdzdjTnNnVmtFUT09', 5, 42699.00, 0.00, 0.00, 0, 0, b'1', NULL, NULL, 'Inactive'),
	(25, 'VmhsU2V6aE8vRXM3ZjVxdGIrbnNBSGJwUEZ3OFVvVEd2OHR4S21PWmt0ND0=', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', 23, 'ZmtIUHdDOWp3dW1rTk1iaEFLekFKYmJLQVFNeTNCcGxINE9OcjZBaW1CY3dSOGowTjFnWjFIaFcrV2VFMkFKQUFoTStGN1A4UXQvQVNaMkFDbmtsTDFvVWluOGZ5RnFpL2JFZ3hwcXkvNEhubmlIejByRjdBK3BQand4UVdNVHNOUktSbjhiakJ0eVhnOGJrZEc3R05DVTI5TnMrK3cxWU5VL1JTUDI2K0RINS9vRW5FbC8zV21wcXI1enJTUG5Rdkh5S3gwY3k5dE5IanhtNEFHVkpWNTlWUUJzZWQzUEQrVEdLNU8wbG9weURLdFFkczg4MUgzT0prUVFVZzJuZllvaDg0T3k5eExwUlkzeTdTdzloY284QWxIeW9hMVRwcm94aXJwWUYza2trbFB3Mzc0QnBLK2o4a1RtNDFyTWZGWE9halRLQU5wdmk5VXNKVitleTdBPT0=', 'Qlowc3NWb1R4TGxYT2RBRFZOQlBhZz09', 2, 56376.00, 0.00, 0.00, 0, 0, b'1', NULL, NULL, 'Draft'),
	(26, 'cC9ld0hFWk1JV1hJc09kN3BYZmJ4aHdUM3MyMWNyYTFDTkZ6MWZVTGozOD0=', 'ZVd4QlN0a3JXalN6NXZGUW1oQzFmQT09', 20, 'UzFNQ3pMZ2JENUVHMm9rbzgxdWRRbUhtVVZ2U2dDenNvU0owVi9kcDBxaWhBd1N5YmtoZUhMZ0ZKYVM4TjN4M0Z1U0xKbzJNZ2xORjc1TFJHZERVSktTNDJYekRJdUdnVnVqdnhNZW5pTXpWa2NXYXUwaGI3RDJtZEtIeXNSNHhKQkFmc09rdE1YaUxmSGF4NlZqaGJnPT0=', 'NC8waENyWjhOaDdCN3U4NUdzWS9NZz09', 3, 23900.00, 0.00, 0.00, 0, 0, b'1', NULL, NULL, 'Active');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
