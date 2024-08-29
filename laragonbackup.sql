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


-- Dumping database structure for agrivisinventory
CREATE DATABASE IF NOT EXISTS `agrivisinventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agrivisinventory`;

-- Dumping structure for table agrivisinventory.tb_auth
CREATE TABLE IF NOT EXISTS `tb_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isAdministrator` int DEFAULT NULL,
  `isCashier` int DEFAULT NULL,
  `isCustomer` int DEFAULT NULL,
  `usercode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` longtext COLLATE utf8mb4_general_ci,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isVerified` int DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recovery_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_auth: ~12 rows (approximately)
INSERT INTO `tb_auth` (`id`, `sys_id`, `isAdministrator`, `isCashier`, `isCustomer`, `usercode`, `password`, `email`, `email_token`, `isVerified`, `remember_token`, `recovery_code`, `timestamp`) VALUES
	(5, '3-R1O3ALW4PM', 1, NULL, NULL, '0000', '$2y$10$.m8ptE/Lj6HItt1HNUS0YOBRj1cW8JH7sh3WCgIxdvPfLckm0snIO', 'jec.floro@gmail.com', NULL, NULL, 'QNCek0SghtbAwMd', 'jUImoKASVz', '2023-08-31 15:07:50'),
	(38, '0G3HVMNTJ2', NULL, 1, NULL, '0002', '$2y$10$BIz6/ZIcZRQuOHFFTpvlou4tlK01aAIsGrKS75.3A.BIkX7ZfxGeu', NULL, NULL, NULL, 'sDeB5XEvzTy8x2t', 'Yzu1qyLj3M', '2024-03-04 14:01:04'),
	(39, '1-6QSGK4XY0B', NULL, NULL, 1, 'kyle', '$2y$10$SjAwpXbe7RkArIKf47a0g.czbx5lAZYXVDNZ3/rDyVhBA8F7T3zea', 'kylecomendador42@gmail.com', 'Y8Jp5jO4CDeW971TZamSQkMv6BsqUw', 1, 'wyOenFh0i6LVgN3', 'aGxwKqo1XW', '2024-03-04 14:07:19'),
	(53, '1-HTCN39GRKV', NULL, NULL, 1, 'jayrson', '$2y$10$Mxt8BhldsOopZlV2I7W.FOdt5ZMP.phl1OIjhHsTK6NKAlSqbOpNa', 'sonagbas19@gmail.com', 'PXr7QzxlaZcvGgm24Ky5BfdFVNMoSi', 1, 'dPDOJoEsLv0efW2', 'gboXRpCHlc', '2024-05-13 08:42:23'),
	(54, '1-4E9O2XW61S', NULL, NULL, 1, 'akari', '$2y$10$XrjwNH7Vm7UDASjNmaTKl.2yjgJYEDI1unelDQJ8CCR3qIO4uLYly', 'janemcvey1016@gmail.com', 'g4BVOY7pAuSE1aWZhGv2FJlbPMNKrc', 1, 'COm4heMuycYK7f1', 'kcGngYXVyf', '2024-05-13 15:03:51'),
	(55, '1-9VME2GQ0TB', NULL, NULL, 1, 'djsimon4', '$2y$10$4suAGxlMvNkHRWJ0gXXcVOT3J0uQZuuk7pVjp7RuhNnRjX.QCSxti', 'facelessdaniel@gmail.com', '0EOnt5iuBvlAKS6qrjgLYNTxMWZbcI', 1, 'HbgrLXhVdQ7JiIT', '54lcV1QYWt', '2024-05-13 15:25:18'),
	(56, '1-R3P9F6LHUZ', NULL, NULL, 1, 'jlo', '$2y$10$z6kcC8ga1bkX0NoG3vkpN.cF47okVopcKRYLu7qbzkZcW7.Kgf0xm', 'lopezjvluzcielanneb@gmail.com', 'j1Rtol4wKCphAn23Da7OvuMY58IePN', 1, 'Ep0dH4yWUGJNXLt', 'Hqd8ztYXhy', '2024-05-13 17:16:14'),
	(57, '1-8EW06TZ43Y', NULL, NULL, 1, 'jols', '$2y$10$v3ohChgD.UlvHAifIe6ciOyROEr8XnVIBXzdYIPOJoS6Sp5oBcIFm', 'juliedondoy711@gmail.com', 'hxDkZY7qbJl012UcFIB4agMoATsmt9', 1, 'qev8iTJS3NodgcK', '8UsbFl7nJp', '2024-05-14 01:18:52'),
	(58, '1-CBZ18EKAH2', NULL, NULL, 1, 'jeanrd', '$2y$10$XyKDuFw/zV1RO7jkzUeACu9ETdXKL9WtKSUc6Jn7RMcKNitRbNjwK', 'jeannejeand@gmail.com', 'xvoERTwr3XOeDWGfSc1piP086huH4n', 1, 'NHtCFiMDRlZY4fT', 'rkclTwKFRX', '2024-05-14 16:34:05'),
	(59, '1-9ZXNYCJ1V3', NULL, NULL, 1, 'hanna', '$2y$10$6wWc0AzOSSSRZ0Qszg7ZRuECTOUgaUoEoJT8XGza4eWYTb1tvNZQ6', 'stephaniehannaharo7@gmail.com', 'M6HXn0c1aeOSxbp5TCNlJhirRkyKzV', 1, '9Y5SL6H2DAvQZnk', 'eOSL39fYqn', '2024-05-16 18:14:26'),
	(60, '1-S6ZKJBUAL2', NULL, NULL, 1, 'gev', '$2y$10$AcgiRbiTkZZwGMlA8X8LsOGNu7rSIPLlpLFHm5NhuFImf0ibPf4I6', 'rachogevelyn@gmail.com', 'nMNLAyaKz1EOjxqYmZTuwkvQS2H4UD', 1, '2UXpBqEo0evb4Nm', 'iwIysN4zPl', '2024-05-16 18:32:46'),
	(61, '1-4M0KINX7A9', NULL, NULL, 1, 'john', '$2y$10$K.2nCmx7M1bMoiahAayNVunlR/6966wRnFXiaXFPMCIDC7lllwPc6', 'johnmonteposo271@gmail.com', 'j1agRf4G0DvyQXLOqpCeUklAEVcBK3', 1, 'YyOBkKHcC5fj47J', 'IdZKRjc5Fq', '2024-05-16 19:32:49');

-- Dumping structure for table agrivisinventory.tb_cashier_lt
CREATE TABLE IF NOT EXISTS `tb_cashier_lt` (
  `item_inc` int NOT NULL AUTO_INCREMENT,
  `usercode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `variant_barcode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_price` decimal(10,2) DEFAULT NULL,
  `variant_discount` int DEFAULT NULL,
  `variant_quantity` int DEFAULT NULL,
  PRIMARY KEY (`item_inc`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_cashier_lt: ~0 rows (approximately)

-- Dumping structure for table agrivisinventory.tb_mainlogs
CREATE TABLE IF NOT EXISTS `tb_mainlogs` (
  `logs_inc` int NOT NULL AUTO_INCREMENT,
  `log_user` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reservation_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_description` longtext COLLATE utf8mb4_general_ci,
  `log_item` int DEFAULT NULL,
  `log_quantity` int DEFAULT NULL,
  `log_price` decimal(10,2) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`logs_inc`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_mainlogs: ~23 rows (approximately)
INSERT INTO `tb_mainlogs` (`logs_inc`, `log_user`, `reservation_code`, `log_code`, `log_description`, `log_item`, `log_quantity`, `log_price`, `timestamp`) VALUES
	(1, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 9, 1, NULL, '2024-03-22 13:10:32'),
	(2, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 17, 45, NULL, '2024-03-22 13:24:26'),
	(3, '0000', '', 'PADJ', 'Price is adjusted', 9, NULL, 13.00, '2024-03-22 13:44:34'),
	(4, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 22, 300, NULL, '2024-03-26 22:05:48'),
	(5, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 23, 90, NULL, '2024-03-26 22:18:44'),
	(6, '0000', '', 'SMINUS', 'Quantity is adjusted to negative', 22, 90, NULL, '2024-03-26 22:18:57'),
	(7, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 24, 36, NULL, '2024-03-26 22:37:23'),
	(8, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 24, 1, NULL, '2024-03-26 22:37:29'),
	(9, '0000', '', 'SMINUS', 'Quantity is adjusted to negative', 24, 1, NULL, '2024-03-26 22:37:34'),
	(10, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 24, 4, NULL, '2024-03-26 22:37:52'),
	(11, '0000', '', 'SMINUS', 'Quantity is adjusted to negative', 24, 4, NULL, '2024-03-26 22:37:57'),
	(12, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 8, 1, NULL, '2024-03-26 22:38:42'),
	(13, '0000', '', 'SMINUS', 'Quantity is adjusted to negative', 8, 1, NULL, '2024-03-26 22:38:46'),
	(14, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 7, 1, NULL, '2024-03-26 23:13:18'),
	(15, '0000', '', 'PADJ', 'Price is adjusted', 7, NULL, 13.00, '2024-03-26 23:13:25'),
	(16, '0000', '', 'SMINUS', 'Quantity is adjusted to negative', 7, 1, NULL, '2024-03-26 23:13:25'),
	(17, '0000', '', 'PADJ', 'Price is adjusted', 7, NULL, 12.00, '2024-03-26 23:13:32'),
	(18, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 25, 10, NULL, '2024-03-27 01:50:51'),
	(19, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 26, 10, NULL, '2024-03-27 01:52:46'),
	(20, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 26, 155, NULL, '2024-03-27 01:54:48'),
	(21, '0000', '', 'SPLUS', 'Quantity is adjusted to positive', 23, 450, NULL, '2024-03-27 01:56:33'),
	(22, '0000', '', 'PADJ', 'Price is adjusted', 23, NULL, 216.00, '2024-04-19 13:27:54'),
	(23, NULL, '', 'OOS', 'Product is out of stock', 1, NULL, NULL, '2024-05-18 08:52:41');

-- Dumping structure for table agrivisinventory.tb_price_adjustments
CREATE TABLE IF NOT EXISTS `tb_price_adjustments` (
  `pad_inc` int NOT NULL AUTO_INCREMENT,
  `variant_id` int DEFAULT NULL,
  `variant_price` decimal(10,2) DEFAULT NULL,
  `variant_discount` int DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`pad_inc`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_price_adjustments: ~4 rows (approximately)
INSERT INTO `tb_price_adjustments` (`pad_inc`, `variant_id`, `variant_price`, `variant_discount`, `date_updated`, `timestamp`) VALUES
	(48, 9, 12.00, 0, '2024-03-22 13:44:34', '2024-03-22 13:44:34'),
	(49, 7, 12.00, 0, '2024-03-26 23:13:25', '2024-03-26 23:13:25'),
	(50, 7, 13.00, 0, '2024-03-26 23:13:32', '2024-03-26 23:13:32'),
	(51, 23, 200.00, 0, '2024-04-19 13:27:54', '2024-04-19 13:27:54');

-- Dumping structure for table agrivisinventory.tb_product
CREATE TABLE IF NOT EXISTS `tb_product` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assigned_area` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_product: ~20 rows (approximately)
INSERT INTO `tb_product` (`brand_id`, `brand_name`, `assigned_area`, `timestamp`) VALUES
	(1, 'MEGA', NULL, '2024-03-22 12:53:31'),
	(2, 'DOWNY', NULL, '2024-03-22 12:55:05'),
	(3, 'ARIEL', NULL, '2024-03-22 12:56:03'),
	(4, 'SURF', NULL, '2024-03-22 12:57:27'),
	(5, 'CHEESEMISS', NULL, '2024-03-22 12:58:45'),
	(6, 'STRAW', NULL, '2024-03-22 13:00:43'),
	(7, 'JOY DISHWASHING', NULL, '2024-03-22 13:02:21'),
	(8, 'MAFRAN', NULL, '2024-03-22 13:04:40'),
	(10, 'MOSQUITO COIL', NULL, '2024-03-22 13:08:36'),
	(11, 'BELLE', NULL, '2024-03-22 13:13:01'),
	(12, 'MANG JUAN', NULL, '2024-03-22 13:15:50'),
	(13, 'SILVER SWAN', NULL, '2024-03-22 13:18:53'),
	(14, 'JERSEY', NULL, '2024-03-22 13:21:04'),
	(16, 'ALASKA', NULL, '2024-03-22 13:25:56'),
	(17, 'MOUNTAIN DEW', NULL, '2024-03-22 13:38:32'),
	(18, 'EGG', NULL, '2024-03-22 13:59:18'),
	(20, 'COKE', NULL, '2024-04-19 13:31:29'),
	(21, 'PEPSI', NULL, '2024-04-19 13:34:45'),
	(22, 'PALM OIL', NULL, '2024-04-19 13:47:43'),
	(23, 'NATURE SPRING', NULL, '2024-04-19 13:57:42');

-- Dumping structure for table agrivisinventory.tb_product_variant
CREATE TABLE IF NOT EXISTS `tb_product_variant` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `variant_barcode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_quantity` int DEFAULT NULL,
  `variant_conversion` int NOT NULL,
  `variant_price` decimal(10,2) DEFAULT NULL,
  `variant_discount` int DEFAULT NULL,
  `variant_size` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_ounce` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_weight` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_weight_ext` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_expiry` date DEFAULT NULL,
  `isOutOfStock` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`variant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_product_variant: ~30 rows (approximately)
INSERT INTO `tb_product_variant` (`variant_id`, `variant_barcode`, `brand_id`, `variant_name`, `variant_quantity`, `variant_conversion`, `variant_price`, `variant_discount`, `variant_size`, `variant_ounce`, `variant_weight`, `variant_weight_ext`, `variant_expiry`, `isOutOfStock`, `timestamp`) VALUES
	(1, '4806504710911', '1', 'CORNED SARDINES', 0, 1, 18.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 12:54:45'),
	(2, '4902430846455', '2', 'GARDEN BLOOM', 5, 1, 9.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 12:55:43'),
	(3, '4902430583169', '3', 'SUNRISE FRESH TWIN JUMBO PACK', 5, 1, 15.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 12:57:10'),
	(4, '4800888189806', '4', 'CHERRY BLOSSOM ACTIVE CLEAN', 18, 1, 9.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 12:58:18'),
	(5, '4806533700075', '5', 'CHEESE POWDER', 29, 1, 7.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 12:59:57'),
	(6, '4816521849013', '6', 'DONWELL STRAW', 21, 1, 25.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:01:34'),
	(7, '4902430790185', '7', 'CALAMANSI', 6, 1, 12.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:03:08'),
	(8, '4902430790208', '7', 'SAFEGUARD', 6, 1, 12.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:03:43'),
	(9, '4902430789974', '7', 'LEMON', 7, 1, 13.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:04:20'),
	(10, '4801668606865', '8', 'ALL-PURPOSE DRESSING', 17, 1, 18.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:05:21'),
	(11, '6924012040523', '10', 'KINGMA', 2, 1, 20.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:09:05'),
	(12, '710535987829', '11', 'SPOON AND FORK MEDIUM', 46, 1, 25.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:15:24'),
	(13, '4800016110542', '12', 'SPECIAL SUKAT SILI', 9, 1, 9.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:17:31'),
	(14, '4800016110535', '12', 'SUKANG PA UMBONG', 13, 1, 9.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-22 13:18:24'),
	(15, '4800344004421', '13', 'SUKANG PUTI', 8, 1, 25.00, 0, '', '', '385', 'ml', NULL, 'false', '2024-03-22 13:19:42'),
	(16, '4800344001949', '13', 'POUCH SOY SAUCE', 17, 1, 12.00, 0, '', '', '200', 'ml', NULL, 'false', '2024-03-22 13:20:28'),
	(17, '4806516764537', '14', 'CREAMYSADA', 51, 1, 55.00, 0, '', '', '370', 'ml', NULL, 'false', '2024-03-22 13:21:45'),
	(18, '9555513203017', '14', 'EVAPORADA', 33, 1, 53.00, 0, '', '', '370', 'ml', NULL, 'false', '2024-03-22 13:25:34'),
	(19, '4800575130166', '16', 'CONDENSADA', 8, 1, 39.00, 0, '', '', '206', 'grams', NULL, 'false', '2024-03-22 13:27:08'),
	(20, '4806516761888', '14', 'SWEETENED CONDENSE CREAMER', 25, 1, 45.00, 0, '', '', '390', 'grams', NULL, 'false', '2024-03-22 13:29:56'),
	(21, '4803925130328', '17', 'MD', 24, 1, 20.00, 0, '', '', '290', 'ml', NULL, 'false', '2024-03-22 13:40:37'),
	(22, '2024032601', '18', 'EGG (PIECES)', 204, 1, 10.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-26 21:58:03'),
	(23, '2024032602', '18', 'EGG LARGE (TRAY)', 240, 30, 216.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-26 21:58:27'),
	(24, '2024032603', '18', 'EGG (DOZEN)', 24, 12, 120.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-26 21:59:05'),
	(25, '2024032604', '18', 'EGG (HALF DOZEN)', 10, 6, 60.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-26 21:59:23'),
	(26, '2024032605', '18', 'EGG (HALF TRAY)', 135, 15, 100.00, 0, '', '', '', 'ml', NULL, 'false', '2024-03-26 21:59:35'),
	(27, NULL, '20', '1.5', 31, 1, 65.00, 0, '', '', '1.5', 'L', NULL, 'false', '2024-04-19 13:32:31'),
	(28, NULL, '21', 'BOTTLE', 8, 1, 15.00, 0, '', '12', '', 'ml', NULL, 'false', '2024-04-19 13:36:37'),
	(29, NULL, '22', '1/4', 2, 1, 20.00, 0, '', '', '', 'kls', NULL, 'false', '2024-04-19 13:49:50'),
	(30, NULL, '23', 'BOTTLE', 13, 1, 20.00, 0, '', '', '1', 'L', NULL, 'false', '2024-04-19 13:58:42');

-- Dumping structure for table agrivisinventory.tb_profile
CREATE TABLE IF NOT EXISTS `tb_profile` (
  `sys_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `info_firstname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info_middlename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info_lastname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info_suffixname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info_customname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info_birthdate` date DEFAULT NULL,
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_profile: ~8 rows (approximately)
INSERT INTO `tb_profile` (`sys_id`, `info_firstname`, `info_middlename`, `info_lastname`, `info_suffixname`, `info_customname`, `info_birthdate`) VALUES
	('0G3HVMNTJ2', 'QUEENY', 'LOU', 'ANTIPORTA', '', 'QUEENY LOU ANTIPORTA', '2024-04-05'),
	('1-4E9O2XW61S', 'CRISLYN JANE', '', 'ROMERO', NULL, 'CRISLYN JANE  ROMERO', NULL),
	('1-4M0KINX7A9', 'JOHN', '', 'MONTEPOSO', NULL, 'JOHN  MONTEPOSO', NULL),
	('1-6QSGK4XY0B', 'KYLE', 'D', 'COMENDADOR', NULL, 'KYLE D COMENDADOR', NULL),
	('1-9ZXNYCJ1V3', 'HANNA', 'CASIALDO', 'HARO', NULL, 'HANNA CASIALDO HARO', NULL),
	('1-CBZ18EKAH2', 'JEANNE', 'GUDIN', 'DOLORES', NULL, 'JEANNE GUDIN DOLORES', NULL),
	('1-R3P9F6LHUZ', 'JV LUZCIEL ANNE', 'BIGCAS', 'LOPEZ', NULL, 'JV LUZCIEL ANNE BIGCAS LOPEZ', NULL),
	('3-R1O3ALW4PM', 'QUEENY', 'LOU', 'ANTIPORTA', NULL, 'QUEENY LOU ANTIPORTA', '2023-12-01');

-- Dumping structure for table agrivisinventory.tb_reservations
CREATE TABLE IF NOT EXISTS `tb_reservations` (
  `reservation_inc` int NOT NULL AUTO_INCREMENT,
  `usercode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reservation_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reservation_name` longtext COLLATE utf8mb4_general_ci,
  `status` int DEFAULT NULL,
  `isCanceled` int DEFAULT NULL,
  `isServed` int DEFAULT NULL,
  `isServedBy` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reservation_datepickup` datetime DEFAULT NULL,
  `reservation_userphone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `transaction_total` decimal(10,2) DEFAULT NULL,
  `transaction_amount` decimal(10,2) DEFAULT NULL,
  `transaction_change` decimal(10,2) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_inc`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_reservations: ~9 rows (approximately)
INSERT INTO `tb_reservations` (`reservation_inc`, `usercode`, `reservation_code`, `reservation_name`, `status`, `isCanceled`, `isServed`, `isServedBy`, `reservation_datepickup`, `reservation_userphone`, `transaction_time`, `transaction_total`, `transaction_amount`, `transaction_change`, `timestamp`) VALUES
	(1, 'kyle', '716148907114478', 'Kyle', 1, NULL, 1, '0002', '2024-03-23 15:55:26', '09936663678', '2024-03-22 13:53:00', 45.00, 50.00, 5.00, '2024-03-22 13:51:38'),
	(2, 'jayrson', '753663712385447', 'Jayrson Garcia', 1, NULL, 1, '0002', '2024-05-16 12:00:00', '09912008676', '2024-05-18 08:53:10', 236.00, 500.00, 264.00, '2024-05-13 08:47:40'),
	(3, 'akari', '847320084828470', 'Crislyn', 1, NULL, 1, '0002', '2024-05-14 09:30:34', '09362031034', '2024-05-14 09:30:20', 15.00, 100.00, 85.00, '2024-05-13 15:10:07'),
	(4, 'djsimon4', '891951598363260', 'DANIEL JAMES SIMON', 1, NULL, NULL, NULL, '2024-05-20 15:00:00', '09991450121', NULL, NULL, NULL, NULL, '2024-05-13 15:32:55'),
	(5, 'jlo', '709960899877508', 'jv', 1, NULL, 1, '0002', '2024-05-17 17:30:29', '09207409006', '2024-05-18 08:50:19', 27.00, 100.00, 73.00, '2024-05-13 17:24:29'),
	(6, 'jols', '731808074028057', 'Mark', 1, NULL, 1, '0002', '2024-05-15 14:28:20', '09504044941', '2024-05-14 01:38:08', 266.00, 500.00, 234.00, '2024-05-14 01:28:50'),
	(7, 'jeanrd', '513797199399059', 'Jeanne', 1, NULL, NULL, NULL, '2024-05-19 10:47:06', '09999274823', NULL, NULL, NULL, NULL, '2024-05-14 16:47:39'),
	(8, 'kyle', '502627374879885', 'kyle', 1, 1, 1, '0002', '2024-05-17 11:58:03', '09936663678', '2024-05-18 08:52:41', 18.00, 50.00, 32.00, '2024-05-16 21:58:07'),
	(9, 'kyle', '674346112188806', 'kyle', NULL, NULL, NULL, NULL, '2024-05-18 11:59:10', '09936663678', NULL, NULL, NULL, NULL, '2024-05-16 21:59:52');

-- Dumping structure for table agrivisinventory.tb_reservation_items
CREATE TABLE IF NOT EXISTS `tb_reservation_items` (
  `reservation_inc` int NOT NULL AUTO_INCREMENT,
  `reservation_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `variant_barcode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_price` decimal(10,2) DEFAULT NULL,
  `variant_discount` int DEFAULT NULL,
  `variant_quantity` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_inc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table agrivisinventory.tb_reservation_items: ~17 rows (approximately)
INSERT INTO `tb_reservation_items` (`reservation_inc`, `reservation_code`, `variant_id`, `variant_barcode`, `variant_price`, `variant_discount`, `variant_quantity`, `timestamp`) VALUES
	(1, '716148907114478', 1, '4806504710911', 18.00, 0, 2, NULL),
	(2, '716148907114478', 2, '4902430846455', 9.00, 0, 1, NULL),
	(3, '753663712385447', 23, '2024032602', 216.00, 0, 1, NULL),
	(4, '753663712385447', 29, '', 20.00, 0, 1, NULL),
	(5, '847320084828470', 28, '', 15.00, 0, 1, NULL),
	(6, '891951598363260', 2, '4902430846455', 9.00, 0, 1, NULL),
	(7, '891951598363260', 4, '4800888189806', 9.00, 0, 1, NULL),
	(8, '709960899877508', 1, '4806504710911', 18.00, 0, 1, NULL),
	(9, '709960899877508', 2, '4902430846455', 9.00, 0, 1, NULL),
	(10, '731808074028057', 1, '4806504710911', 18.00, 0, 4, NULL),
	(11, '731808074028057', 16, '4800344001949', 12.00, 0, 2, NULL),
	(12, '731808074028057', 27, '', 65.00, 0, 2, NULL),
	(14, '731808074028057', 22, '2024032601', 10.00, 0, 4, NULL),
	(15, '513797199399059', 8, '4902430790208', 12.00, 0, 1, NULL),
	(16, '513797199399059', 1, '4806504710911', 18.00, 0, 1, NULL),
	(17, '513797199399059', 2, '4902430846455', 9.00, 0, 1, NULL),
	(18, '502627374879885', 1, '4806504710911', 18.00, 0, 1, NULL);

-- Dumping structure for table agrivisinventory.tb_transactions
CREATE TABLE IF NOT EXISTS `tb_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usercode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isCashier` int DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `transaction_total` decimal(10,2) DEFAULT NULL,
  `transaction_amount` decimal(10,2) DEFAULT NULL,
  `transaction_change` decimal(10,2) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_transactions: ~21 rows (approximately)
INSERT INTO `tb_transactions` (`transaction_id`, `transaction_code`, `usercode`, `isCashier`, `transaction_time`, `transaction_total`, `transaction_amount`, `transaction_change`, `timestamp`) VALUES
	(1, '9616051538655404982', '0002', 1, '2024-03-22 13:46:54', 18.00, 20.00, 2.00, '2024-03-22 13:46:54'),
	(3, '7768400984295627591', '0002', 1, '2024-03-27 01:43:44', 600.00, 600.00, 0.00, '2024-03-27 01:43:44'),
	(5, '1208399471835486598', '0002', 1, '2024-03-27 01:46:23', 10.00, 20.00, 10.00, '2024-03-27 01:46:23'),
	(7, '9189346323314437788', '0002', 1, '2024-03-27 01:47:26', 10.00, 20.00, 10.00, '2024-03-27 01:47:26'),
	(9, '8292573895945467036', '0002', 1, '2024-03-27 01:48:28', 120.00, 150.00, 30.00, '2024-03-27 01:48:28'),
	(11, '8978380401859924507', '0002', 1, '2024-03-27 01:53:30', 100.00, 150.00, 50.00, '2024-03-27 01:53:30'),
	(13, '4916834718722356422', '0002', 1, '2024-03-27 01:55:43', 100.00, 200.00, 100.00, '2024-03-27 01:55:43'),
	(15, '9989006886393274283', '0002', 1, '2024-03-27 01:57:11', 200.00, 200.00, 0.00, '2024-03-27 01:57:11'),
	(17, '2585716295183534808', '0002', 1, '2024-04-19 13:29:03', 648.00, 648.00, 0.00, '2024-04-19 13:29:03'),
	(19, '6321669632177292559', '0002', 1, '2024-04-19 13:33:34', 65.00, 100.00, 35.00, '2024-04-19 13:33:34'),
	(21, '5936445299140445604', '0002', 1, '2024-04-19 13:37:06', 15.00, 15.00, 0.00, '2024-04-19 13:37:06'),
	(23, '4368002230846255032', '0002', 1, '2024-04-19 13:56:31', 20.00, 500.00, 480.00, '2024-04-19 13:56:31'),
	(25, '4107180389656903526', '0002', 1, '2024-04-19 13:59:36', 20.00, 50.00, 30.00, '2024-04-19 13:59:36'),
	(27, '8305878347346021230', '0002', 1, '2024-04-19 14:00:28', 20.00, 50.00, 30.00, '2024-04-19 14:00:28'),
	(29, '8670573534425231846', '0002', 1, '2024-04-19 14:10:46', 216.00, 1000.00, 784.00, '2024-04-19 14:10:46'),
	(31, '2700696639453312159', '0002', 1, '2024-05-01 14:30:40', 30.00, 50.00, 20.00, '2024-05-01 14:30:40'),
	(33, '6348363470531692949', '0002', 1, '2024-05-01 14:40:52', 20.00, 20.00, 0.00, '2024-05-01 14:40:52'),
	(35, '3394140370687637781', '0002', 1, '2024-05-01 15:52:26', 216.00, 220.00, 4.00, '2024-05-01 15:52:26'),
	(37, '5819590109490427380', '0002', 1, '2024-05-01 16:46:09', 65.00, 100.00, 35.00, '2024-05-01 16:46:09'),
	(39, '1177505548454396287', '0002', 1, '2024-05-11 17:32:43', 27.00, 50.00, 23.00, '2024-05-11 17:32:43'),
	(41, '8062114182529184127', '0002', 1, '2024-05-16 21:56:58', 27.00, 30.00, 3.00, '2024-05-16 21:56:58');

-- Dumping structure for table agrivisinventory.tb_transaction_items
CREATE TABLE IF NOT EXISTS `tb_transaction_items` (
  `transaction_inc` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usercode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `variant_barcode` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variant_price` decimal(10,2) DEFAULT NULL,
  `variant_discount` int DEFAULT NULL,
  `variant_quantity` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_inc`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_transaction_items: ~23 rows (approximately)
INSERT INTO `tb_transaction_items` (`transaction_inc`, `transaction_code`, `usercode`, `variant_id`, `variant_barcode`, `variant_price`, `variant_discount`, `variant_quantity`, `timestamp`) VALUES
	(1, '9616051538655404982', '0002', 1, '4806504710911', 18.00, 0, 1, '2024-03-22 13:46:54'),
	(2, '7768400984295627591', '0002', 23, '2024032602', 200.00, 0, 3, '2024-03-27 01:43:44'),
	(3, '1208399471835486598', '0002', 22, '2024032601', 10.00, 0, 1, '2024-03-27 01:46:23'),
	(4, '9189346323314437788', '0002', 22, '2024032601', 10.00, 0, 1, '2024-03-27 01:47:26'),
	(5, '8292573895945467036', '0002', 24, '2024032603', 120.00, 0, 1, '2024-03-27 01:48:28'),
	(6, '8978380401859924507', '0002', 26, '2024032605', 100.00, 0, 1, '2024-03-27 01:53:30'),
	(7, '4916834718722356422', '0002', 26, '2024032605', 100.00, 0, 1, '2024-03-27 01:55:43'),
	(8, '9989006886393274283', '0002', 23, '2024032602', 200.00, 0, 1, '2024-03-27 01:57:11'),
	(9, '2585716295183534808', '0002', 23, '2024032602', 200.00, 0, 3, '2024-04-19 13:29:03'),
	(10, '6321669632177292559', '0002', 27, '', 65.00, 0, 1, '2024-04-19 13:33:34'),
	(11, '5936445299140445604', '0002', 28, '', 15.00, 0, 1, '2024-04-19 13:37:06'),
	(12, '4368002230846255032', '0002', 29, '', 20.00, 0, 1, '2024-04-19 13:56:31'),
	(13, '4107180389656903526', '0002', 30, '', 20.00, 0, 1, '2024-04-19 13:59:36'),
	(14, '8305878347346021230', '0002', 30, '', 20.00, 0, 1, '2024-04-19 14:00:28'),
	(15, '8670573534425231846', '0002', 23, '2024032602', 216.00, 0, 1, '2024-04-19 14:10:46'),
	(16, '2700696639453312159', '0002', 28, '', 15.00, 0, 2, '2024-05-01 14:30:40'),
	(17, '6348363470531692949', '0002', 21, '4803925130328', 20.00, 0, 1, '2024-05-01 14:40:52'),
	(18, '3394140370687637781', '0002', 23, '2024032602', 216.00, 0, 1, '2024-05-01 15:52:26'),
	(19, '5819590109490427380', '0002', 27, '', 65.00, 0, 1, '2024-05-01 16:46:09'),
	(20, '1177505548454396287', '0002', 1, '4806504710911', 18.00, 0, 1, '2024-05-11 17:32:43'),
	(21, '1177505548454396287', '0002', 2, '4902430846455', 9.00, 0, 1, '2024-05-11 17:32:43'),
	(22, '8062114182529184127', '0002', 1, '4806504710911', 18.00, 0, 1, '2024-05-16 21:56:58'),
	(23, '8062114182529184127', '0002', 2, '4902430846455', 9.00, 0, 1, '2024-05-16 21:56:58');

-- Dumping structure for table agrivisinventory.tb_updatelogs
CREATE TABLE IF NOT EXISTS `tb_updatelogs` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table agrivisinventory.tb_updatelogs: ~0 rows (approximately)

-- Dumping structure for table agrivisinventory.tb_updatelogs_items
CREATE TABLE IF NOT EXISTS `tb_updatelogs_items` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_content` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`update_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table agrivisinventory.tb_updatelogs_items: ~0 rows (approximately)


-- Dumping database structure for api
CREATE DATABASE IF NOT EXISTS `api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `api`;

-- Dumping structure for table api.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` longtext,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table api.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `username`, `email`, `password`, `timestamp`) VALUES
	(1, 'jecfloro', 'jec.floro@gmail.com', '1234', '2023-09-27 22:36:13');


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
  `isActivated` bit(1) DEFAULT NULL,
  `isDisabled` bit(1) DEFAULT NULL,
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
  `userLastname` varchar(255) DEFAULT NULL,
  `userFirstName` varchar(255) DEFAULT NULL,
  `userMiddleName` varchar(255) DEFAULT NULL,
  `userNickName` varchar(255) DEFAULT NULL,
  `userGender` bit(1) DEFAULT NULL,
  `userCivilStatus` varchar(255) DEFAULT NULL,
  `userNationality` varchar(255) DEFAULT NULL,
  `userAge` int DEFAULT NULL,
  `userDateofBirth` date DEFAULT NULL,
  `userPlaceofBirth` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userContactNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userAddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userFullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PK_appsysUsers`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devmanage-fiesta.appsysusers: ~0 rows (approximately)
INSERT INTO `appsysusers` (`PK_appsysUsers`, `user_email`, `user_password`, `user_empId`, `user_recoveryCode`, `user_activationCode`, `isActivated`, `isDisabled`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `FK_geolocation`, `FK_mscinfoChildrens`, `FK_mscinfoRelatives`, `FK_mscinfoNeighbors`, `userLastname`, `userFirstName`, `userMiddleName`, `userNickName`, `userGender`, `userCivilStatus`, `userNationality`, `userAge`, `userDateofBirth`, `userPlaceofBirth`, `userContactNumber`, `userAddress`, `userFullName`) VALUES
	(1, 'administrator@gmail.com', '$2y$10$lyvhvUFJMyXKMlWJnQboz.jhPJhTigzKJ/tvrMD1lKGI5f9Qq1WM.', '230704', 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', b'1', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FLORO', 'JECO', 'ESCOTO', 'COCO', b'0', 'SINGLE', 'FILIPINO', 25, '1999-05-11', 'TAGUM CITY', '09389206940', 'DAVAO DEL NORTE COLLEGE COMPOUND, NEW VISAYAS, PANABO CITY', NULL);


-- Dumping database structure for devproject
CREATE DATABASE IF NOT EXISTS `devproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `devproject`;

-- Dumping structure for table devproject.appsys_users
CREATE TABLE IF NOT EXISTS `appsys_users` (
  `PK_UserID` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` longtext,
  `user_employeeID` varchar(255) DEFAULT NULL,
  `user_PK_Geolocation` varchar(255) DEFAULT NULL,
  `user_recoveryCode` varchar(255) DEFAULT NULL,
  `user_activationCode` varchar(255) DEFAULT NULL,
  `isActivated` int DEFAULT NULL,
  `isDisabled` int DEFAULT NULL,
  `isAdmin` int DEFAULT NULL,
  `isCustomer` int DEFAULT NULL,
  `isBranchManager` int DEFAULT NULL,
  `isCreditInvestigator` int DEFAULT NULL,
  `isCreditCoordinator` int DEFAULT NULL,
  `isCashier` int DEFAULT NULL,
  `personalpref_PK_Childrens` varchar(255) DEFAULT NULL,
  `personalpref_ChildrenisAdded` int DEFAULT NULL,
  `personalpref_PK_Relatives` varchar(255) DEFAULT NULL,
  `personalpref_RelativeisAdded` int DEFAULT NULL,
  `personalpref_PK_Neighbors` varchar(255) DEFAULT NULL,
  `personalpref_NeighborisAdded` int DEFAULT NULL,
  PRIMARY KEY (`PK_UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.appsys_users: ~7 rows (approximately)
INSERT INTO `appsys_users` (`PK_UserID`, `user_email`, `user_password`, `user_employeeID`, `user_PK_Geolocation`, `user_recoveryCode`, `user_activationCode`, `isActivated`, `isDisabled`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCreditCoordinator`, `isCashier`, `personalpref_PK_Childrens`, `personalpref_ChildrenisAdded`, `personalpref_PK_Relatives`, `personalpref_RelativeisAdded`, `personalpref_PK_Neighbors`, `personalpref_NeighborisAdded`) VALUES
	(13, 'customer@gmail.com', '$2y$10$lyvhvUFJMyXKMlWJnQboz.jhPJhTigzKJ/tvrMD1lKGI5f9Qq1WM.', NULL, '7.312586968292354, 125.6719424214113', 'qcIR71kZfE', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2y', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, 1),
	(14, 'administrator@gmail.com', '$2y$10$lyvhvUFJMyXKMlWJnQboz.jhPJhTigzKJ/tvrMD1lKGI5f9Qq1WM.', NULL, NULL, 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2z', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'credit.coordinator@gmail.com', '$2y$10$lyvhvUFJMyXKMlWJnQboz.jhPJhTigzKJ/tvrMD1lKGI5f9Qq1WM.', NULL, NULL, 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2z', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'cashier@gmail.com', '$2y$10$lyvhvUFJMyXKMlWJnQboz.jhPJhTigzKJ/tvrMD1lKGI5f9Qq1WM.', NULL, NULL, 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2z', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'credit.investigator@gmail.com', '$2y$10$lyvhvUFJMyXKMlWJnQboz.jhPJhTigzKJ/tvrMD1lKGI5f9Qq1WM.', NULL, NULL, 'qkIR62zAoY', 'bPXOrCk0jW3EdsoDBKpuGzHt8iRq2z', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'hostaccagrivis@gmail.com', '$2y$10$8OiSw3dgApaedjr54g525.myiSvre96tjrYIuDNbgLKb8/3G6Bnaa', NULL, '7.321719904262095, 125.68274145500132', '1Qm2lFObWo', 'IhfxmgP8UGdnFj2WzBOCerDo0ysc5Y', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'iwNdD8zycJMTkrG', 1, 'iwNdD8zycJMTkrG', 1, 'iwNdD8zycJMTkrG', 1),
	(24, 'kerwinadrian199@gmail.com', '$2y$10$ayevfknn53F2j1i31ZKLl.1gAfQnl60Q5MpttlimpsTL215x6oToi', NULL, NULL, 'tThRCvB1iG', '2mpRKJWjutcTYIDvekSFsNV3z96EMH', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'MySe7jfoU82YbtL', NULL, 'MySe7jfoU82YbtL', NULL, 'MySe7jfoU82YbtL', NULL);

-- Dumping structure for table devproject.mscinfo_applicant
CREATE TABLE IF NOT EXISTS `mscinfo_applicant` (
  `FK_UserID` int NOT NULL,
  `applicant_lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_middleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_gender` int DEFAULT NULL,
  `applicant_civilstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_age` int DEFAULT NULL,
  `applicant_birthdate` date DEFAULT NULL,
  `applicant_birthplace` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `applicant_contactNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `applicant_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_regionID` varchar(50) DEFAULT NULL,
  `applicant_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_provinceID` varchar(50) DEFAULT NULL,
  `applicant_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_cityID` varchar(50) DEFAULT NULL,
  `applicant_barangay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_barangayID` varchar(50) DEFAULT NULL,
  `applicant_fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicant_isCompleted` int DEFAULT NULL,
  PRIMARY KEY (`FK_UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.mscinfo_applicant: ~3 rows (approximately)
INSERT INTO `mscinfo_applicant` (`FK_UserID`, `applicant_lastName`, `applicant_firstName`, `applicant_middleName`, `applicant_nickname`, `applicant_gender`, `applicant_civilstatus`, `applicant_nationality`, `applicant_age`, `applicant_birthdate`, `applicant_birthplace`, `applicant_contactNumber`, `applicant_address`, `applicant_region`, `applicant_regionID`, `applicant_province`, `applicant_provinceID`, `applicant_city`, `applicant_cityID`, `applicant_barangay`, `applicant_barangayID`, `applicant_fullName`, `applicant_isCompleted`) VALUES
	(13, 'FIESTA APPLIANCES', 'CUSTOMER', 'AA', 'AA', 1, 'MARRIED', 'FILIPINO', 25, '1999-05-11', 'TAGUM CITY', '09389206940', 'VILLAROSA SUBDIVISION, BEHIND DAVAO DEL NORTE STATE COLLEGE, BLOCK 5 LOT 9', 'REGION XI (DAVAO REGION)', '11', 'DAVAO DEL NORTE', '1123', 'CITY OF PANABO', '112315', 'SALVACION', '112315028', 'CUSTOMER AA FIESTA APPLIANCES', 1),
	(15, 'FIESTA APPLIANCES', 'CREDIT COORDINATOR', 'AA', 'AA', 1, 'SINGLE', 'FILIPINO', 25, '1999-05-11', 'PANABO CITY', '09389202490', 'FEDER ROAD 2', 'REGION XI (DAVAO REGION)', '11', 'DAVAO DEL NORTE', '1123', 'SANTO TOMAS', '112318', 'TIBAL-OG (POB.)', '112318011', 'CREDIT COORDINATOR AA FIESTA APPLIANCES', 1),
	(23, 'KERWIN ADRIAN', 'ALBELDA', 'BACONGUIS', 'KAWKAW', 2, 'SINGLE', 'FILIPINO', 25, '0005-02-09', 'TAGUM CITY', '09463571540', 'LOPEZ VILLE, SUBD. PANABO CITY BLOCK 1 LOT 3 - LAND MARK NEAR AT GAMBRIEL', 'REGION XI (DAVAO REGION)', '11', 'DAVAO DEL NORTE', '1123', 'CITY OF PANABO', '112315', 'SALVACION', '112315028', 'ALBELDA BACONGUIS KERWIN ADRIAN', 1);

-- Dumping structure for table devproject.mscinfo_childrens
CREATE TABLE IF NOT EXISTS `mscinfo_childrens` (
  `PK_ChildrenItem` int NOT NULL AUTO_INCREMENT,
  `PK_ChildrenID` int DEFAULT NULL,
  `FK_UserID` int DEFAULT NULL,
  `children_name` varchar(255) DEFAULT NULL,
  `children_age` int DEFAULT NULL,
  `children_graduateYear` varchar(255) DEFAULT NULL,
  `children_school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PK_ChildrenItem`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- Dumping data for table devproject.mscinfo_childrens: ~5 rows (approximately)
INSERT INTO `mscinfo_childrens` (`PK_ChildrenItem`, `PK_ChildrenID`, `FK_UserID`, `children_name`, `children_age`, `children_graduateYear`, `children_school`) VALUES
	(77, 1, 23, NULL, 0, NULL, NULL),
	(78, 2, 23, NULL, 0, NULL, NULL),
	(79, 3, 23, NULL, 0, NULL, NULL),
	(80, 4, 23, NULL, 0, NULL, NULL),
	(81, 5, 23, NULL, 0, NULL, NULL);

-- Dumping structure for table devproject.mscinfo_homeownership
CREATE TABLE IF NOT EXISTS `mscinfo_homeownership` (
  `FK_UserID` int NOT NULL,
  `homeownership_option` int DEFAULT NULL,
  `homeownership_monthlyAmortization` decimal(10,2) DEFAULT NULL,
  `homeownership_monthlyRental` decimal(10,2) DEFAULT NULL,
  `homeownership_landLord` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_yearsStay` int DEFAULT NULL,
  `homeownership_prevAddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `homeownership_employerBusiness1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_contactNumber1` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_position1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_yearsEmployed1` int DEFAULT NULL,
  `homeownership_employmentStatus1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_employerBusiness2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_contactNumber2` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_position2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_yearsEmployed2` int DEFAULT NULL,
  `homeownership_employmentStatus2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `homeownership_isCompleted` int DEFAULT NULL,
  PRIMARY KEY (`FK_UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.mscinfo_homeownership: ~0 rows (approximately)
INSERT INTO `mscinfo_homeownership` (`FK_UserID`, `homeownership_option`, `homeownership_monthlyAmortization`, `homeownership_monthlyRental`, `homeownership_landLord`, `homeownership_yearsStay`, `homeownership_prevAddress`, `homeownership_employerBusiness1`, `homeownership_contactNumber1`, `homeownership_position1`, `homeownership_yearsEmployed1`, `homeownership_employmentStatus1`, `homeownership_employerBusiness2`, `homeownership_contactNumber2`, `homeownership_position2`, `homeownership_yearsEmployed2`, `homeownership_employmentStatus2`, `homeownership_isCompleted`) VALUES
	(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 1, 1.00, 1.00, '1', 1, 'LOPEZ VILLE SUBDIVISION, BLOCK 1LOT 3 - LAND MARK NEAR AT GAMBRIEL', '1', '12314151515', 'MANAGER', 5, 'GOOD', 'TAMPAD', '12312321312', 'MANAGER', 6, 'GOOD', 1);

-- Dumping structure for table devproject.mscinfo_income
CREATE TABLE IF NOT EXISTS `mscinfo_income` (
  `FK_UserID` int NOT NULL,
  `income_own` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_spouse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_properties` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_otherincome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_expenses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_necessities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_householdamortization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_schoolexpenses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_otherexpenses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_totalexpenses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_netdisposalincome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `income_isCompleted` int DEFAULT NULL,
  PRIMARY KEY (`FK_UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.mscinfo_income: ~0 rows (approximately)
INSERT INTO `mscinfo_income` (`FK_UserID`, `income_own`, `income_spouse`, `income_properties`, `income_otherincome`, `income_total`, `income_expenses`, `income_necessities`, `income_householdamortization`, `income_schoolexpenses`, `income_otherexpenses`, `income_totalexpenses`, `income_netdisposalincome`, `income_isCompleted`) VALUES
	(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table devproject.mscinfo_neighbors
CREATE TABLE IF NOT EXISTS `mscinfo_neighbors` (
  `PK_NeighborsItem` int NOT NULL AUTO_INCREMENT,
  `PK_NeighborsID` int DEFAULT NULL,
  `FK_UserID` int DEFAULT NULL,
  `neighbors_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `neighbors_address` int DEFAULT NULL,
  `neighbors_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`PK_NeighborsItem`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table devproject.mscinfo_neighbors: ~2 rows (approximately)
INSERT INTO `mscinfo_neighbors` (`PK_NeighborsItem`, `PK_NeighborsID`, `FK_UserID`, `neighbors_name`, `neighbors_address`, `neighbors_number`) VALUES
	(1, 1, 23, '1', 2, '3'),
	(2, 2, 23, '4', 5, '6');

-- Dumping structure for table devproject.mscinfo_personalpref
CREATE TABLE IF NOT EXISTS `mscinfo_personalpref` (
  `FK_UserID` int NOT NULL,
  `personalpref_fathersName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_fathersAge` int DEFAULT NULL,
  `personalpref_fathersAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_fathersEmployer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_fatherEmployerAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_mothersName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_mothersAge` int DEFAULT NULL,
  `personalpref_mothersAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_mothersEmployer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_motherEmployerAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personalpref_isCompleted` int DEFAULT NULL,
  PRIMARY KEY (`FK_UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.mscinfo_personalpref: ~0 rows (approximately)
INSERT INTO `mscinfo_personalpref` (`FK_UserID`, `personalpref_fathersName`, `personalpref_fathersAge`, `personalpref_fathersAddress`, `personalpref_fathersEmployer`, `personalpref_fatherEmployerAddress`, `personalpref_mothersName`, `personalpref_mothersAge`, `personalpref_mothersAddress`, `personalpref_mothersEmployer`, `personalpref_motherEmployerAddress`, `personalpref_isCompleted`) VALUES
	(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'BUTTER', 50, 'LOPEZ VILLE, SUBD. PANABO CITY BLOCK 1 LOT 3 - LAND MARK NEAR AT GAMBRIEL', 'NONE', '1', 'SACCHI', 59, 'LOPEZ VILLE SUBDIVISION, BLOCK 1LOT 3 - LAND MARK NEAR AT GAMBRIEL', 'NONE', '1', 1);

-- Dumping structure for table devproject.mscinfo_relatives
CREATE TABLE IF NOT EXISTS `mscinfo_relatives` (
  `PK_RelativesItem` int NOT NULL AUTO_INCREMENT,
  `PK_RelativesID` int DEFAULT NULL,
  `FK_UserID` int DEFAULT NULL,
  `relative_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `relative_address` varchar(255) DEFAULT NULL,
  `relative_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`PK_RelativesItem`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table devproject.mscinfo_relatives: ~2 rows (approximately)
INSERT INTO `mscinfo_relatives` (`PK_RelativesItem`, `PK_RelativesID`, `FK_UserID`, `relative_name`, `relative_address`, `relative_number`) VALUES
	(1, 1, 23, 'EDDIE', 'LOPEZ VILLE SUBDIVISION, BLOCK 1LOT 3 - LAND MARK NEAR AT GAMBRIEL', '09123131312'),
	(2, 2, 23, 'WAKWAK', 'LOPEZ VILLE SUBDIVISION, BLOCK 1LOT 3 - LAND MARK NEAR AT GAMBRIEL', '09515151251');

-- Dumping structure for table devproject.mscinfo_spouse
CREATE TABLE IF NOT EXISTS `mscinfo_spouse` (
  `FK_UserID` int NOT NULL,
  `spouse_lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_middleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_gender` int DEFAULT NULL,
  `spouse_civilstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_age` int DEFAULT NULL,
  `spouse_birthdate` date DEFAULT NULL,
  `spouse_birthplace` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `spouse_contactNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouse_isCompleted` int DEFAULT NULL,
  PRIMARY KEY (`FK_UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.mscinfo_spouse: ~0 rows (approximately)
INSERT INTO `mscinfo_spouse` (`FK_UserID`, `spouse_lastName`, `spouse_firstName`, `spouse_middleName`, `spouse_nickname`, `spouse_gender`, `spouse_civilstatus`, `spouse_nationality`, `spouse_age`, `spouse_birthdate`, `spouse_birthplace`, `spouse_contactNumber`, `spouse_isCompleted`) VALUES
	(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table devproject.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `PK_CategoryID` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_icon` longtext,
  PRIMARY KEY (`PK_CategoryID`) USING BTREE,
  UNIQUE KEY `ctName` (`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devproject.product_categories: ~10 rows (approximately)
INSERT INTO `product_categories` (`PK_CategoryID`, `category_name`, `category_icon`) VALUES
	(16, 'TELEVISION', '<xml version="1.0" encoding="utf-8">\n<svg width="60" height="60" version="1.1" id="Layer_1"\nxmlns="http://www.w3.org/2000/svg"\nxmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"\nviewBox="0 0 122.88 83.06"\nstyle="enable-background:new 0 0 122.88 83.06" xml:space="preserve">\n<g>\n<path\nd="M2.08,0H120.8h2.08v2.08v69.2v2.08h-2.08H77.57v4.55h16.61v5.15H28.55v-5.15h16.61v-4.55H2.08H0v-2.08V2.08V0H2.08L2.08,0z M118.73,4.15H4.15v65.05h114.57V4.15L118.73,4.15z" />\n</g>\n</svg>\n</xml>'),
	(18, 'AIR CONDITIONER', '<xml version="1.0" encoding="utf-8"?><svg  width="60" height="60"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 67.41" style="enable-background:new 0 0 122.88 67.41" xml:space="preserve"><g><path d="M79.93,51.37c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32 c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32 C81.22,56.36,82.7,54,79.93,51.37L79.93,51.37z M14.57,28.11h73.65c0.96,0,1.74,0.78,1.74,1.74v12.26h24.13 c1.46,0,2.79-0.6,3.75-1.56c0.96-0.96,1.56-2.29,1.56-3.75V8.8c0-1.46-0.6-2.79-1.56-3.75c-0.96-0.96-2.29-1.56-3.75-1.56H8.8 c-1.46,0-2.79,0.6-3.75,1.56C4.08,6.01,3.48,7.34,3.48,8.8V36.8c0,1.46,0.6,2.79,1.56,3.75c0.96,0.96,2.29,1.56,3.75,1.56h4.03 V29.85C12.83,28.89,13.61,28.11,14.57,28.11L14.57,28.11z M86.48,31.59H16.31v10.09h70.17V31.59L86.48,31.59z M15.21,13.64 c-0.96,0-1.74-0.78-1.74-1.74c0-0.96,0.78-1.74,1.74-1.74h93.74c0.96,0,1.74,0.78,1.74,1.74c0,0.96-0.78,1.74-1.74,1.74H15.21 L15.21,13.64z M98.58,31.99c1.36,0,2.46,1.1,2.46,2.46s-1.1,2.46-2.46,2.46s-2.46-1.1-2.46-2.46S97.23,31.99,98.58,31.99 L98.58,31.99z M108.85,31.99c1.36,0,2.46,1.1,2.46,2.46s-1.1,2.46-2.46,2.46c-1.36,0-2.46-1.1-2.46-2.46S107.49,31.99,108.85,31.99 L108.85,31.99z M8.8,0h105.29c2.42,0,4.62,0.99,6.21,2.58c1.59,1.59,2.58,3.79,2.58,6.21V36.8c0,2.42-0.99,4.62-2.58,6.21 c-1.59,1.59-3.79,2.58-6.21,2.58H8.8c-2.42,0-4.62-0.99-6.21-2.58C0.99,41.42,0,39.22,0,36.8V8.8c0-2.42,0.99-4.62,2.58-6.21 C4.18,0.99,6.38,0,8.8,0L8.8,0z M15.21,21.76c-0.96,0-1.74-0.78-1.74-1.74c0-0.96,0.78-1.74,1.74-1.74h93.74 c0.96,0,1.74,0.78,1.74,1.74c0,0.96-0.78,1.74-1.74,1.74H15.21L15.21,21.76z M21.37,51.37c-0.53-0.51-0.32-1.2,0.48-1.54 c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55 c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32C22.66,56.36,24.13,54,21.37,51.37L21.37,51.37z M36.01,51.37 c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32c-1.32,2.12-2.59,4.15-0.25,6.19 c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32C37.3,56.36,38.77,54,36.01,51.37 L36.01,51.37z M50.65,51.37c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32 c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32 C51.94,56.36,53.42,54,50.65,51.37L50.65,51.37z M65.29,51.37c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3 c3.78,3.6,1.96,6.52,0.21,9.32c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24 c-3.47-3.03-1.85-5.62-0.17-8.32C66.58,56.36,68.06,54,65.29,51.37L65.29,51.37z"/></g></svg>\n</xml>'),
	(20, 'MICROWAVE OVEN', '<xml version="1.0" encoding="utf-8"?><svg  width="60" height="60"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 77.77" style="enable-background:new 0 0 122.88 77.77" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M95.45,13.68h3.94c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89h-3.94c-0.49,0-0.89-0.4-0.89-0.89 v-3C94.56,14.08,94.96,13.68,95.45,13.68L95.45,13.68z M24.22,75.44v1.14c0,0.65-0.53,1.18-1.18,1.18H17.2 c-0.65,0-1.18-0.53-1.18-1.18v-1.15H4.7c-1.29,0-2.47-0.53-3.32-1.38C0.53,73.21,0,72.04,0,70.74V4.7c0-1.29,0.53-2.47,1.38-3.32 C2.23,0.53,3.41,0,4.7,0h113.48c1.29,0,2.47,0.53,3.32,1.38c0.85,0.85,1.38,2.03,1.38,3.32v66.04c0,1.29-0.53,2.47-1.38,3.32 c-0.85,0.85-2.03,1.38-3.32,1.38h-10.06v1.14c0,0.65-0.53,1.18-1.18,1.18h-5.84c-0.65,0-1.18-0.53-1.18-1.18v-1.15H24.22 L24.22,75.44z M101.62,50.08c0.24,0,0.43,0.19,0.43,0.43c0,0.24-0.19,0.43-0.43,0.43c-0.24,0-0.43-0.19-0.43-0.43 C101.19,50.27,101.38,50.08,101.62,50.08L101.62,50.08z M99.43,50.34c0.23-0.06,0.47,0.08,0.53,0.31c0.06,0.23-0.08,0.47-0.31,0.53 c-0.23,0.06-0.47-0.08-0.53-0.31C99.07,50.64,99.2,50.4,99.43,50.34L99.43,50.34z M97.39,51.16c0.21-0.12,0.47-0.05,0.59,0.16 c0.12,0.21,0.05,0.47-0.16,0.59c-0.21,0.12-0.47,0.05-0.59-0.16C97.11,51.54,97.18,51.28,97.39,51.16L97.39,51.16z M95.63,52.48 c0.17-0.17,0.44-0.17,0.61,0c0.17,0.17,0.17,0.44,0,0.61c-0.17,0.17-0.44,0.17-0.61,0C95.46,52.93,95.46,52.65,95.63,52.48 L95.63,52.48z M94.27,54.21c0.12-0.21,0.38-0.28,0.59-0.16c0.21,0.12,0.28,0.39,0.16,0.59c-0.12,0.21-0.38,0.28-0.59,0.16 C94.22,54.69,94.14,54.42,94.27,54.21L94.27,54.21z M93.4,56.24c0.06-0.23,0.3-0.37,0.53-0.31c0.23,0.06,0.37,0.3,0.31,0.53 c-0.06,0.23-0.3,0.37-0.53,0.31C93.47,56.71,93.34,56.47,93.4,56.24L93.4,56.24z M109.71,56.42c0.06,0.23-0.08,0.47-0.31,0.53 c-0.23,0.06-0.47-0.08-0.53-0.31c-0.06-0.23,0.08-0.47,0.31-0.53C109.41,56.05,109.64,56.19,109.71,56.42L109.71,56.42z M108.89,54.38c0.12,0.21,0.05,0.47-0.16,0.59c-0.21,0.12-0.47,0.05-0.59-0.16c-0.12-0.21-0.05-0.47,0.16-0.59 C108.5,54.1,108.77,54.17,108.89,54.38L108.89,54.38z M107.56,52.61c0.17,0.17,0.17,0.44,0,0.61c-0.17,0.17-0.44,0.17-0.61,0 c-0.17-0.17-0.17-0.44,0-0.61C107.12,52.44,107.39,52.44,107.56,52.61L107.56,52.61z M105.83,51.25c0.21,0.12,0.28,0.38,0.16,0.59 c-0.12,0.21-0.38,0.28-0.59,0.16c-0.21-0.12-0.28-0.38-0.16-0.59C105.36,51.2,105.62,51.13,105.83,51.25L105.83,51.25z M103.8,50.39c0.23,0.06,0.37,0.3,0.31,0.53c-0.06,0.23-0.3,0.37-0.53,0.31c-0.23-0.06-0.37-0.3-0.31-0.53 C103.33,50.46,103.57,50.33,103.8,50.39L103.8,50.39z M16.4,32.11c-0.2,0.63-0.87,0.98-1.5,0.78c-0.63-0.2-0.98-0.87-0.78-1.5 c0.57-1.79,1.91-4.46,3.64-6.74c1.38-1.81,3.02-3.42,4.77-4.24c0.59-0.28,1.3-0.02,1.58,0.57c0.28,0.59,0.02,1.3-0.57,1.58 c-1.35,0.63-2.7,1.98-3.87,3.52C18.1,28.15,16.9,30.53,16.4,32.11L16.4,32.11z M90.11,6.82h23.07c0.79,0,1.5,0.32,2.02,0.84 c0.52,0.52,0.84,1.23,0.84,2.02v55.7c0,0.79-0.32,1.5-0.84,2.02c-0.52,0.52-1.23,0.84-2.02,0.84H90.11c-0.79,0-1.5-0.32-2.02-0.84 h0c-0.52-0.52-0.84-1.23-0.84-2.02V9.69c0-0.79,0.32-1.5,0.84-2.02C88.6,7.15,89.32,6.82,90.11,6.82L90.11,6.82z M113.18,9.21 H90.11c-0.13,0-0.25,0.05-0.34,0.14c-0.09,0.09-0.14,0.21-0.14,0.34v55.7c0,0.13,0.05,0.25,0.14,0.34l0,0 c0.09,0.09,0.21,0.14,0.34,0.14h23.07c0.13,0,0.25-0.05,0.34-0.14c0.09-0.09,0.14-0.21,0.14-0.34V9.69c0-0.13-0.05-0.25-0.14-0.34 C113.42,9.26,113.31,9.21,113.18,9.21L113.18,9.21z M10.49,15.11h59.88c0.66,0,1.25,0.27,1.69,0.7c0.43,0.43,0.7,1.03,0.7,1.69 v40.46c0,0.66-0.27,1.25-0.7,1.69c-0.43,0.43-1.03,0.7-1.69,0.7H10.49c-0.66,0-1.25-0.27-1.69-0.7c-0.43-0.43-0.7-1.03-0.7-1.69 V17.49c0-0.66,0.27-1.25,0.7-1.69h0C9.24,15.37,9.83,15.11,10.49,15.11L10.49,15.11z M70.37,17.49H10.49h0l0,0c0,0,0,0,0,0v40.46 c0,0,0,0,0,0c0,0,0,0,0,0h59.88c0,0,0,0,0,0c0,0,0,0,0,0L70.37,17.49C70.37,17.49,70.37,17.49,70.37,17.49 C70.37,17.49,70.37,17.49,70.37,17.49L70.37,17.49z M82.59,2.39v70.67h35.59c0.63,0,1.21-0.26,1.63-0.68 c0.42-0.42,0.68-1,0.68-1.63V4.7c0-0.64-0.26-1.21-0.68-1.63c-0.42-0.42-1-0.68-1.63-0.68H82.59L82.59,2.39z M77.79,73.06V2.39H4.7 c-0.64,0-1.21,0.26-1.63,0.68c-0.42,0.42-0.68,1-0.68,1.63v66.04c0,0.63,0.26,1.21,0.68,1.63c0.42,0.42,1,0.68,1.63,0.68H77.79 L77.79,73.06z M101.62,53c3.04,0,5.51,2.47,5.51,5.51c0,3.04-2.47,5.51-5.51,5.51c-3.04,0-5.51-2.46-5.51-5.51 C96.12,55.46,98.58,53,101.62,53L101.62,53z M95.26,33.67h12.97c0.92,0,1.67,0.75,1.67,1.67v9.02c0,0.92-0.75,1.67-1.67,1.67H95.26 c-0.92,0-1.67-0.75-1.67-1.67v-9.02C93.59,34.43,94.34,33.67,95.26,33.67L95.26,33.67z M104.1,22.45h3.94 c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89h-3.94c-0.49,0-0.89-0.4-0.89-0.89v-3 C103.22,22.85,103.62,22.45,104.1,22.45L104.1,22.45z M95.45,22.45h3.94c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89 h-3.94c-0.49,0-0.89-0.4-0.89-0.89v-3C94.56,22.85,94.96,22.45,95.45,22.45L95.45,22.45z M104.1,13.68h3.94 c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89h-3.94c-0.49,0-0.89-0.4-0.89-0.89v-3 C103.22,14.08,103.62,13.68,104.1,13.68L104.1,13.68z"/></g></svg></xml>'),
	(22, 'SMARTPHONE', '<xml version="1.0" encoding="utf-8"?><svg  width="60" height="60"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 71.31 122.88" style="enable-background:new 0 0 71.31 122.88" xml:space="preserve"><g><path d="M12.47,0h46.36c3.43,0,6.55,1.4,8.81,3.66c2.26,2.26,3.66,5.38,3.66,8.81v97.94c0,3.43-1.4,6.55-3.66,8.81 c-2.26,2.26-5.38,3.66-8.81,3.66H12.47c-3.43,0-6.55-1.4-8.81-3.66C1.4,116.96,0,113.84,0,110.41V12.47c0-3.43,1.4-6.55,3.66-8.81 C5.92,1.4,9.04,0,12.47,0L12.47,0z M28.93,113c-0.83,0-1.5-0.67-1.5-1.5c0-0.83,0.67-1.5,1.5-1.5h13.72c0.83,0,1.5,0.67,1.5,1.5 c0,0.83-0.67,1.5-1.5,1.5H28.93L28.93,113z M27.65,7.16c1.31,0,2.38,1.07,2.38,2.38c0,1.31-1.07,2.38-2.38,2.38 c-1.31,0-2.38-1.07-2.38-2.38C25.27,8.23,26.34,7.16,27.65,7.16L27.65,7.16z M35.65,7.16c1.31,0,2.38,1.07,2.38,2.38 c0,1.31-1.07,2.38-2.38,2.38c-1.32,0-2.38-1.07-2.38-2.38C33.27,8.23,34.34,7.16,35.65,7.16L35.65,7.16z M43.65,7.16 c1.31,0,2.38,1.07,2.38,2.38c0,1.31-1.07,2.38-2.38,2.38c-1.32,0-2.38-1.07-2.38-2.38C41.27,8.23,42.34,7.16,43.65,7.16L43.65,7.16 z M3,99.29h65.31V19.21H3V99.29L3,99.29z M68.31,102.29H3v8.12c0,2.6,1.07,4.97,2.78,6.69c1.72,1.72,4.09,2.78,6.69,2.78h46.36 c2.6,0,4.97-1.07,6.69-2.78c1.72-1.72,2.78-4.09,2.78-6.69V102.29L68.31,102.29z M3,16.21h65.31v-3.74c0-2.6-1.07-4.97-2.78-6.69 C63.81,4.06,61.44,3,58.83,3H12.47C9.87,3,7.5,4.06,5.78,5.78C4.06,7.5,3,9.87,3,12.47V16.21L3,16.21z"/></g></svg></xml>'),
	(24, 'LAPTOP', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 70.51" style="enable-background:new 0 0 122.88 70.51" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M2.54,65.44h12.59c-0.93-0.24-1.63-1.1-1.63-2.1V2.17C13.5,0.98,14.48,0,15.67,0h90.97 c1.19,0,2.17,0.98,2.17,2.17v61.16c0,1.01-0.69,1.86-1.63,2.1h13.16c1.4,0,2.54,1.14,2.54,2.54v0c0,1.4-1.14,2.54-2.54,2.54H2.54 c-1.4,0-2.54-1.14-2.54-2.54v0C0,66.58,1.14,65.44,2.54,65.44L2.54,65.44z M17.21,3.4h88.19v59.32H17.21V3.4L17.21,3.4z M57.87,66.39h7.14c0.67,0,1.22,0.55,1.22,1.22l0,0c0,0.67-0.55,1.22-1.22,1.22h-7.14c-0.67,0-1.22-0.55-1.22-1.22l0,0 C56.65,66.93,57.2,66.39,57.87,66.39L57.87,66.39z"/></g></svg>'),
	(26, 'SOFA', '<svg width="60" height="60" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 65.28"><title>couch-sofa</title><path d="M14,58.73A1.94,1.94,0,0,0,13.17,57c-1.1-.89-2.29-1.87-2.29-5.34,0-1.92.14-3.62.28-5.22.3-3.52.55-6.51-1.1-10.27a14.07,14.07,0,0,1-1.92.06A8.41,8.41,0,0,1,2.57,34,8.22,8.22,0,0,1,.15,29.35,10,10,0,0,1,0,27.16,8.3,8.3,0,0,1,1.93,22,9,9,0,0,1,7,19.12a11.87,11.87,0,0,1,3.17-.21V16a16.08,16.08,0,0,1,16-16h70a16.08,16.08,0,0,1,16,16V18.9a12.51,12.51,0,0,1,1.49-.08,9.82,9.82,0,0,1,6.13,1.92A7.78,7.78,0,0,1,122,23.42a8.78,8.78,0,0,1,.67,5.65,9.52,9.52,0,0,1-1.56,3.61,8.5,8.5,0,0,1-3.1,2.65,9,9,0,0,1-5.38.77c-1.66,3.77-1.41,6.76-1.11,10.29.14,1.6.28,3.3.28,5.22,0,3.47-1.19,4.45-2.29,5.34a1.94,1.94,0,0,0-.87,1.78,1.42,1.42,0,0,1-1.43,1.42h-5.11s0,.08,0,.11v3.48a1.54,1.54,0,0,1-1.54,1.54H90.94a1.54,1.54,0,0,1-1.53-1.54V60.15H33.47v3.59a1.54,1.54,0,0,1-1.53,1.54H22.29a1.54,1.54,0,0,1-1.53-1.54V60.15H15.47A1.42,1.42,0,0,1,14,58.73Zm87-25.51a1.58,1.58,0,0,1,0,.38v9.14a1.43,1.43,0,0,1-1.43,1.43H23.32a1.43,1.43,0,0,1-1.43-1.43V33.83a42.1,42.1,0,0,0-1.73-4.16,23.39,23.39,0,0,0-2-3.38,10.93,10.93,0,0,0-5.79-4.12,10,10,0,0,0-4.8-.26A6.15,6.15,0,0,0,4.1,23.85a5.52,5.52,0,0,0-1.25,3.43A7.67,7.67,0,0,0,3,28.86a5.48,5.48,0,0,0,1.57,3.06,5.59,5.59,0,0,0,3.74,1.42,11.53,11.53,0,0,0,2.39-.18,1.43,1.43,0,0,1,1.51.76c2.5,4.94,2.2,8.47,1.84,12.7-.14,1.53-.27,3.16-.27,5,0,2.12.64,2.65,1.24,3.14a4.19,4.19,0,0,1,1.78,2.55H106a4.19,4.19,0,0,1,1.78-2.55c.6-.49,1.24-1,1.24-3.14,0-1.83-.13-3.46-.27-5-.35-4.21-.65-7.73,1.8-12.63a1.45,1.45,0,0,1,1.41-.85l.5,0,.18,0a6.43,6.43,0,0,0,4.19-.43,5.63,5.63,0,0,0,2-1.76,6.61,6.61,0,0,0,1.08-2.51,6,6,0,0,0-.44-3.83,4.86,4.86,0,0,0-1.38-1.7,7.08,7.08,0,0,0-4.38-1.33,12,12,0,0,0-5.26,1.28A10.13,10.13,0,0,0,105,25.66a22.13,22.13,0,0,0-2.22,3.58,38.3,38.3,0,0,0-1.73,4ZM24.74,35v6.28H98.23V35c-11.86.17-23.75.23-35.6.55l-1.28,0h0l-3.18-.08L24.74,35ZM59.93,2.91V2.85H26.22A13.21,13.21,0,0,0,13.05,16V19.4l.16.05a13.79,13.79,0,0,1,7.29,5.19,26.91,26.91,0,0,1,2.22,3.78c.55,1.14,1.09,2.39,1.6,3.77,11.86.18,23.77.23,35.62.55a1.55,1.55,0,0,1,0-.22V2.91Zm2.84-.06V32.52a1.5,1.5,0,0,1,0,.22c11.85-.32,23.76-.37,35.62-.55A40.78,40.78,0,0,1,100.22,28a23.9,23.9,0,0,1,2.53-4,13,13,0,0,1,4.44-3.53,15.28,15.28,0,0,1,2.18-.88V16A13.21,13.21,0,0,0,96.2,2.85Z"/></svg>'),
	(28, 'SPEAKERS', '<svg width="60" height="60" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 92.87"><defs><style>.cls-1{fill-rule:evenodd;}</style></defs><title>television-cabinet-stereo</title><path class="cls-1" d="M5.19,23.81H17.62a.79.79,0,0,1,.78.79V46.85H42.63v-2.3h9.5V42H26.31V0H96.57V42H70.66v2.6h9.5v2.3h24.32V24.6a.78.78,0,0,1,.78-.79h12.43a.79.79,0,0,1,.78.79V46.85h2.86a1.54,1.54,0,0,1,1.55,1.55v30a5.38,5.38,0,0,1-1.58,3.8l-.09.09a5.37,5.37,0,0,1-3.71,1.5H106.87l1.86,9.06H99.39l0-9.06H23.53l0,9.06H14.15L16,83.81H5.38a5.38,5.38,0,0,1-3.8-1.59l-.08-.09A5.35,5.35,0,0,1,0,78.42v-30a1.54,1.54,0,0,1,1.55-1.55H4.41V24.6a.78.78,0,0,1,.78-.79Zm89-21.44H28.68v37.2H94.19V2.37Zm17.28,24.22a3,3,0,0,1,2.17.9,3.08,3.08,0,0,1-2.17,5.26,3.11,3.11,0,0,1-2.18-.9,3.08,3.08,0,0,1,2.18-5.26Zm1.67,1.4a2.38,2.38,0,0,0-3.35,0,2.37,2.37,0,0,0,0,3.36,2.4,2.4,0,0,0,1.68.69A2.37,2.37,0,0,0,113.15,28Zm-1.67.81a.87.87,0,1,1-.87.87.86.86,0,0,1,.87-.87Zm0,6.72a5.14,5.14,0,1,1-3.62,1.5,5.09,5.09,0,0,1,3.62-1.5Zm2.7,2.44a3.81,3.81,0,1,0,1.11,2.69A3.81,3.81,0,0,0,114.17,38Zm-2.7,1.21A1.48,1.48,0,1,1,110,40.65a1.48,1.48,0,0,1,1.47-1.48ZM99.16,72.61c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23-5.75-.55-5.75-1.23,2.58-1.22,5.75-1.22Zm0-17.54c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23-5.75-.55-5.75-1.23,2.58-1.22,5.75-1.22ZM81.54,63.76h38.24V50H81.54V63.76Zm38.24,2H81.54V80.71h36a2.25,2.25,0,0,0,1.55-.61l.06-.06a2.32,2.32,0,0,0,.67-1.62V65.79ZM79.54,80.71V50H43.34V80.71Zm-55.83-8.1c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23S18,74.51,18,73.83s2.58-1.22,5.75-1.22Zm0-17.54c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23S18,57,18,56.29s2.58-1.22,5.75-1.22ZM3.1,63.76H41.34V50H3.1V63.76Zm38.24,2H3.1V78.42A2.29,2.29,0,0,0,3.71,80l.06.06a2.31,2.31,0,0,0,1.61.67h36V65.79ZM11.41,39.17a1.48,1.48,0,1,1-1.48,1.48,1.48,1.48,0,0,1,1.48-1.48Zm0-12.58a3,3,0,0,1,2.17.9l0,0a3.08,3.08,0,0,1-2.19,5.24,3.11,3.11,0,0,1-2.18-.9,3.08,3.08,0,0,1,2.18-5.26ZM13.08,28A2.38,2.38,0,0,0,9,29.67,2.38,2.38,0,1,0,13.1,28Zm-1.67.81a.87.87,0,1,1-.87.87.87.87,0,0,1,.87-.87Zm0,6.72A5.14,5.14,0,1,1,7.78,37a5.08,5.08,0,0,1,3.63-1.5ZM14.1,38a3.81,3.81,0,1,0,1.11,2.69A3.8,3.8,0,0,0,14.1,38Z"/></svg>'),
	(30, 'FREEZER', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 74.48 122.88" style="enable-background:new 0 0 74.48 122.88" xml:space="preserve"><g><path d="M6.39,0h61.69c1.76,0,3.36,0.72,4.52,1.87c1.16,1.16,1.88,2.76,1.88,4.52v25.83v76.76c0,1.76-0.72,3.36-1.88,4.52 c-1.16,1.16-2.76,1.87-4.52,1.87H63v2.83c0,2.57-2.1,4.68-4.67,4.68l0,0c-2.57,0-4.67-2.1-4.67-4.68v-2.83H21v2.83 c0,2.57-2.1,4.68-4.67,4.68l0,0c-2.57,0-4.67-2.1-4.67-4.68v-2.83H6.39c-1.76,0-3.36-0.72-4.52-1.87C0.72,112.34,0,110.74,0,108.98 V32.22V6.39c0-1.76,0.72-3.36,1.87-4.52C3.03,0.72,4.63,0,6.39,0L6.39,0L6.39,0z M38.75,65.12c5.83-5.53,6.38-1.8,0,4.26v6.68 l5.84-3.37c2.04-8.51,5.54-9.83,3.69-2.13c5.94-3.43,7.41-0.7,1.51,2.7c7.7,2.28,4.76,4.63-3.69,2.13l-5.77,3.33l5.83,3.36 c8.39-2.48,11.29-0.12,3.69,2.13c5.94,3.43,4.32,6.07-1.58,2.66c1.88,7.82-1.63,6.42-3.69-2.13l-5.83-3.36v6.71 c6.38,6.06,5.83,9.79,0,4.26c0,6.86-3.1,6.96-3.1,0.04c-5.74,5.46-6.35,1.77,0-4.26v-6.71l-5.75,3.32 c-2.06,8.55-5.57,9.95-3.69,2.13c-5.93,3.43-7.57,0.8-1.58-2.66c-7.59-2.25-4.71-4.62,3.69-2.13l5.83-3.36l-5.77-3.33 c-8.44,2.5-11.39,0.15-3.69-2.13c-5.94-3.43-4.47-6.16,1.51-2.7c-1.85-7.71,1.64-6.38,3.69,2.13l5.77,3.33v-6.68 c-6.35-6.03-5.75-9.71,0-4.26C35.66,58.22,38.75,58.31,38.75,65.12L38.75,65.12z M10.62,41.68c0-1.4,1.13-2.53,2.53-2.53 s2.53,1.13,2.53,2.53v16.18c0,1.4-1.13,2.53-2.53,2.53s-2.53-1.13-2.53-2.53V41.68L10.62,41.68L10.62,41.68z M10.62,10.82 c0-1.4,1.13-2.53,2.53-2.53s2.53,1.13,2.53,2.53v10.71c0,1.4-1.13,2.53-2.53,2.53s-2.53-1.13-2.53-2.53V10.82L10.62,10.82 L10.62,10.82z M5.07,29.68h64.35V6.39c0-0.36-0.15-0.7-0.4-0.94c-0.24-0.24-0.57-0.4-0.94-0.4H6.39c-0.36,0-0.7,0.15-0.94,0.4 c-0.24,0.24-0.4,0.57-0.4,0.94v23.29H5.07L5.07,29.68z M69.41,34.75H5.07v74.22c0,0.36,0.15,0.7,0.4,0.94 c0.24,0.24,0.57,0.4,0.94,0.4h61.68c0.36,0,0.7-0.15,0.94-0.4c0.24-0.24,0.4-0.57,0.4-0.94V34.75H69.41L69.41,34.75z"/></g></svg>'),
	(32, 'MOTORCYCLE', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 82.71" style="enable-background:new 0 0 122.88 82.71" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M50.7,36.7l-0.16-0.68c-2.39,0.65-4.79,0.86-7.21,0.78c-2.76-0.09-5.52-0.56-8.28-1.19 c-1.35-0.31-2.53-0.64-3.65-0.96c-2.52-0.71-4.74-1.33-7.8-1.36c-0.03,0-0.05,0-0.08,0l0,0l-11.07-0.94l-2.18,3.14 c6.36,2.46,14.26,4.18,21.86,4.85c7.17,0.63,14.04,0.34,19.05-1.14L50.7,36.7L50.7,36.7z M104.65,46.26 c10.07,0,18.23,8.16,18.23,18.23c0,10.07-8.16,18.23-18.23,18.23c-10.07,0-18.23-8.16-18.23-18.23c0-6.08,2.97-11.46,7.54-14.77 l-5.29-10.4l-9.71,29.2h-4.29c0,0.12,0,0.24-0.02,0.35c-0.36,1.98-0.97,3.58-1.83,4.78c-0.96,1.34-2.21,2.2-3.76,2.57 c-1.89,0.45-7.19-0.4-10.65-0.95c-0.92-0.15-1.71-0.27-2.22-0.34l-11.41-1.53l-0.05,0.18c-0.27,1.08-1.32,1.79-2.44,1.61 l-7.08-1.16c-0.76,1.2-1.66,2.3-2.67,3.29c-3.35,3.28-7.99,5.31-13.1,5.31c-5.11,0-9.74-2.03-13.1-5.31 c-3.36-3.29-5.44-7.83-5.44-12.84c0-5.01,2.08-9.55,5.44-12.84c3.35-3.28,7.99-5.31,13.1-5.31c5.11,0,9.74,2.03,13.1,5.31 c3.36,3.29,5.44,7.83,5.44,12.84c0,0.56-0.03,1.11-0.08,1.65l6.17,1.71c1.06,0.29,1.72,1.34,1.56,2.4l10.97,1.47 c0.57,0.08,1.37,0.2,2.31,0.35c3.2,0.51,8.11,1.29,9.4,0.99c0.76-0.18,1.38-0.62,1.87-1.3c0.56-0.78,0.97-1.87,1.24-3.25H45.37 C37.45,41.52,17.65,37.82,6.29,47.48L0,47.4c1.88-4.56,6.3-7.52,11.67-9.11c-1.19-0.41-2.33-0.84-3.43-1.3 c-0.09-0.03-0.17-0.07-0.25-0.13c-0.49-0.34-0.61-1.01-0.27-1.5l3.29-4.74c0.21-0.32,0.59-0.52,1-0.49l11.69,0.99v0 c3.33,0.05,5.65,0.7,8.29,1.44c1.1,0.31,2.26,0.63,3.55,0.93c2.64,0.61,5.27,1.06,7.86,1.14c2.49,0.08,4.97-0.17,7.42-0.96 c0.8-0.71,1.61-1.39,2.45-2.04c0.87-0.68,1.79-1.34,2.77-1.99c2.61-1.74,5.29-3.13,8.12-4.08c2.85-0.95,5.84-1.45,9.07-1.39 c1.99,0.04,3.92,0.34,5.75,0.97c1.26,0.44,2.48,1.03,3.64,1.79c0.01-0.2,0.08-0.4,0.2-0.56l-5.77-4.33h-9.02 c-1.05,0-1.89-0.85-1.89-1.89c0-1.05,0.85-1.89,1.89-1.89h8.31v-7.54h0.01l0-0.04c0.01-0.25,0-0.48-0.03-0.68 c-0.02-0.17-0.06-0.33-0.11-0.49c-0.16-0.49-0.5-0.7-0.96-0.98c-0.03-0.01-0.05-0.03-0.08-0.04c-0.05-0.03-0.1-0.06-0.22-0.13 l-0.08,1.3c-0.05,0.77-0.71,1.36-1.49,1.31c-0.77-0.05-1.36-0.71-1.31-1.49l0.52-8.19c0.05-0.77,0.71-1.36,1.49-1.31 c0.77,0.05,1.36,0.71,1.31,1.49l-0.24,3.73l1.05,0.64l0.39,0.23c0.03,0.01,0.05,0.03,0.07,0.05c1,0.58,1.73,1.04,2.22,2.53 c0.1,0.3,0.17,0.63,0.22,1c0.04,0.33,0.06,0.69,0.05,1.07h0v8.19l3.66,2.74l0.33-0.38l-0.86-0.62c-0.48-0.35-0.59-1.03-0.24-1.51 c0.03-0.04,0.06-0.08,0.09-0.11l3.37-3.93c0.39-0.45,1.07-0.51,1.52-0.12l0.02,0.02l3.15,2.59c0.46,0.38,0.53,1.06,0.15,1.52 l-0.02,0.03h0l-3.29,3.75c-0.13,0.15-0.29,0.25-0.46,0.31l0,0l-1.17,0.4l1.07,0.8l0.03,0.03l0.32-0.16 c0.53-0.26,1.18-0.04,1.45,0.49l0.02,0.03l1.54,2.94c0.74-1.66,2.39-2.8,3.83-3.8c0.3-0.21,0.6-0.42,0.86-0.61 c1.13-0.84,2.18-1.38,3.13-1.62c1.05-0.27,2-0.19,2.81,0.21c0.81,0.41,1.44,1.12,1.85,2.13c0.37,0.91,0.57,2.06,0.57,3.44v3.98 c0,0.05,0,0.11-0.01,0.16c-0.11,1.76-0.51,3.03-1.14,3.89c-0.39,0.53-0.85,0.9-1.38,1.14c-0.53,0.24-1.1,0.33-1.7,0.3 c-1.29-0.07-2.74-0.74-4.24-1.85l-1.15-0.85l6.79,12.58C101.51,46.46,103.06,46.26,104.65,46.26L104.65,46.26z M95.81,48.54 c0.69-0.39,1.41-0.73,2.16-1.02L86.95,26.9c-0.03,0.05-0.06,0.1-0.1,0.15c-0.45,0.28-1.01,0.63-1.55,0.75L95.81,48.54L95.81,48.54z M12.84,59.22l4.52,1.25c0.33-0.16,0.67-0.28,1.04-0.36l0.28-7.2l-0.05,0l-0.09,0.01c-0.08,0.01-0.16,0.01-0.24,0.02l-0.03,0 l-0.01,0c-0.09,0.01-0.17,0.02-0.26,0.03l-0.09,0.01c-0.06,0.01-0.12,0.02-0.17,0.02l-0.1,0.02c-0.06,0.01-0.12,0.02-0.17,0.03 l-0.09,0.02c-0.07,0.01-0.14,0.03-0.21,0.04l-0.05,0.01c-0.09,0.02-0.17,0.04-0.26,0.06l-0.08,0.02c-0.06,0.01-0.12,0.03-0.18,0.04 l-0.1,0.03l-0.17,0.05l-0.09,0.02c-0.07,0.02-0.14,0.04-0.2,0.06l-0.05,0.01c-0.08,0.03-0.16,0.05-0.24,0.08l-0.09,0.03 c-0.05,0.02-0.11,0.04-0.16,0.06l-0.1,0.04l-0.15,0.06l-0.1,0.04c-0.05,0.02-0.1,0.04-0.15,0.06l-0.09,0.04 c-0.07,0.03-0.15,0.06-0.22,0.1l-0.09,0.04l-0.14,0.07l-0.11,0.05l-0.12,0.06l-0.11,0.06L14,54.24l-0.1,0.05l-0.01,0 c-0.07,0.04-0.13,0.07-0.2,0.11l0,0l-0.12,0.07l-0.09,0.05c-0.04,0.02-0.08,0.05-0.12,0.08l-0.09,0.06l-0.12,0.08l-0.09,0.06 l-0.13,0.08l-0.03,0.02c-0.1,0.07-0.2,0.14-0.3,0.21l-0.06,0.04l-0.13,0.1l-0.07,0.06c-0.04,0.03-0.08,0.06-0.12,0.1l-0.06,0.05 c-0.15,0.12-0.3,0.25-0.45,0.38l-0.03,0.02c-0.04,0.04-0.09,0.08-0.13,0.12l-0.05,0.05c-0.04,0.04-0.08,0.08-0.13,0.12l-0.05,0.05 c-0.04,0.04-0.08,0.08-0.12,0.12l-0.02,0.02c-0.15,0.15-0.29,0.3-0.42,0.45l-0.03,0.03c-0.04,0.05-0.08,0.1-0.13,0.15L10.59,57 c-0.15,0.17-0.29,0.35-0.43,0.54L12.84,59.22L12.84,59.22z M25.06,62.6l6,1.66c-0.03-1.53-0.36-3-0.93-4.33L25.06,62.6L25.06,62.6z M27.57,72.79l-7.26-1.19l-0.11,4.48l0.12-0.01l0.05,0c0.09-0.01,0.17-0.01,0.26-0.02l0.06-0.01c0.08-0.01,0.15-0.02,0.23-0.03 l0.04,0c0.08-0.01,0.16-0.02,0.24-0.03l0.08-0.01c0.08-0.01,0.16-0.03,0.25-0.04l0.01,0c0.08-0.01,0.16-0.03,0.24-0.05l0.06-0.01 c0.08-0.02,0.16-0.03,0.24-0.05l0.04-0.01c0.07-0.02,0.14-0.03,0.21-0.05l0.06-0.02c0.08-0.02,0.16-0.04,0.23-0.06l0.06-0.02 c0.07-0.02,0.15-0.04,0.22-0.07l0.02-0.01l0.01,0c0.07-0.02,0.15-0.05,0.22-0.07l0.08-0.03c0.07-0.02,0.14-0.05,0.21-0.08 l0.06-0.02c0.06-0.02,0.11-0.04,0.17-0.07l0.08-0.03c0.07-0.03,0.13-0.05,0.2-0.08l0.09-0.04l0.14-0.06l0.08-0.04 c0.06-0.03,0.12-0.06,0.18-0.09l0.11-0.05l0.12-0.06c0.05-0.03,0.1-0.05,0.15-0.08l0.11-0.06l0.11-0.06 c0.05-0.03,0.1-0.05,0.15-0.08c0.04-0.02,0.08-0.05,0.13-0.07l0.1-0.06l0.11-0.07c0.05-0.03,0.1-0.06,0.15-0.09l0,0l0.12-0.08 l0.07-0.04c0.07-0.05,0.14-0.09,0.2-0.14L26.11,74l0.12-0.09l0.05-0.03c0.08-0.06,0.15-0.11,0.23-0.17l0.03-0.03 c0.04-0.03,0.08-0.07,0.13-0.1l0.02-0.01c0.08-0.06,0.16-0.13,0.24-0.19l0.05-0.04c0.13-0.11,0.25-0.22,0.37-0.33l0,0 C27.42,72.94,27.49,72.87,27.57,72.79L27.57,72.79z M18.16,71.25l-6.88-1.13l-1.49,0.81l0.01,0.02c0.03,0.04,0.06,0.08,0.09,0.13 l0.06,0.09l0.09,0.12l0.06,0.09c0.03,0.04,0.06,0.08,0.09,0.12l0.06,0.08l0.09,0.12l0.07,0.08c0.03,0.04,0.06,0.08,0.1,0.12 c0.03,0.03,0.05,0.06,0.08,0.1c0.03,0.03,0.05,0.06,0.08,0.1l0,0c0.05,0.06,0.11,0.12,0.16,0.18l0.1,0.11l0.08,0.08 c0.03,0.03,0.06,0.06,0.09,0.1l0.09,0.1l0.09,0.08l0.1,0.1l0.09,0.09l0.09,0.09l0.1,0.09l0.09,0.08l0.1,0.08l0.11,0.09 c0.03,0.03,0.06,0.05,0.09,0.08c0.06,0.05,0.13,0.1,0.19,0.15l0,0l0.08,0.06c0.04,0.03,0.08,0.06,0.13,0.1l0.1,0.08l0.1,0.08 l0.11,0.08l0.11,0.08l0.11,0.08l0.11,0.07l0.11,0.07c0.04,0.03,0.08,0.05,0.12,0.08l0.1,0.06c0.05,0.03,0.1,0.06,0.15,0.09 l0.08,0.05c0.08,0.04,0.15,0.09,0.23,0.13l0.08,0.04c0.05,0.03,0.1,0.06,0.16,0.08l0.1,0.05l0.14,0.07l0.1,0.05l0.14,0.07 l0.11,0.05c0.05,0.02,0.09,0.04,0.14,0.06l0.1,0.04c0.05,0.02,0.11,0.04,0.16,0.07l0.09,0.04c0.07,0.03,0.15,0.06,0.22,0.08 l0.03,0.01l0.01,0c0.08,0.03,0.16,0.06,0.25,0.09l0.08,0.03c0.06,0.02,0.11,0.04,0.17,0.06l0.09,0.03 c0.06,0.02,0.12,0.03,0.17,0.05l0.09,0.03l0.16,0.04l0.11,0.03c0.06,0.01,0.12,0.03,0.17,0.04l0.09,0.02 c0.06,0.01,0.12,0.03,0.19,0.04l0.09,0.02c0.08,0.02,0.15,0.03,0.23,0.04l0.03,0.01l0,0c0.09,0.02,0.18,0.03,0.26,0.04l0.11,0.02 c0.05,0.01,0.11,0.02,0.16,0.02l0.11,0.01L18.16,71.25L18.16,71.25z M10.99,60.95l-2.59-0.05l-2.3-0.04L5.07,64.7l4.01,2.88 l9.76,1.6l1.53,0.25l6.97,1.14l0,0l1.82,0.3l7.16,1.17v0l6.15,1.01c0.31-0.52,0.81-2.59,1.04-3.07l0.01-0.04l-7.83-2.16l-4.79-1.32 l-15.48-4.27l-3.46-0.96L10.99,60.95L10.99,60.95z M95.07,26c-1.29,0.9-2.8,1.94-3.08,3.11c-0.13,0.54-0.16,0.82-0.08,0.96 c0.09,0.18,0.41,0.42,0.9,0.78l3.06,2.25c1.12,0.82,2.13,1.32,2.9,1.37c0.21,0.01,0.39-0.01,0.54-0.08 c0.14-0.06,0.27-0.18,0.39-0.34c0.35-0.48,0.59-1.31,0.66-2.56l0-0.01V27.5c0-1.07-0.13-1.9-0.37-2.49 c-0.17-0.42-0.4-0.7-0.66-0.83c-0.26-0.13-0.62-0.14-1.07-0.03c-0.64,0.16-1.4,0.56-2.26,1.2C95.71,25.56,95.4,25.77,95.07,26 L95.07,26z M82.56,32l-0.11-2.51c-1.3-1.04-2.7-1.79-4.18-2.29c-1.63-0.56-3.33-0.83-5.09-0.86c-2.97-0.06-5.73,0.4-8.35,1.28 c-2.64,0.88-5.15,2.19-7.6,3.83c-0.89,0.59-1.77,1.23-2.64,1.91c-0.7,0.54-1.37,1.09-2.01,1.66l0.22,1.14l0.65,2.74l24.76,0.09 c0.03,0,0.07,0,0.1,0v0c0.66,0.06,1.23,0.02,1.72-0.11c0.44-0.13,0.82-0.34,1.13-0.62c1.6-1.46,1.5-3.96,1.41-6.14L82.56,32 L82.56,32z M45.76,46.19l9.51-0.13c0.69-0.01,1.34,0.58,1.26,1.26l-0.71,6.13c-0.08,0.69-0.57,1.26-1.26,1.26h-6.01 c-0.69,0-0.97-0.63-1.26-1.26l-2.8-6C44.2,46.82,45.06,46.2,45.76,46.19L45.76,46.19z M68.06,45.43h8.6c0.69,0,1.42,0.59,1.26,1.26 l-1.82,7.74c-0.16,0.67-0.57,1.26-1.26,1.26h-6.01c-0.69,0-1.19-0.57-1.26-1.26l-0.78-7.74C66.73,46,67.37,45.43,68.06,45.43 L68.06,45.43z M14.37,68.44l-3.09,1.68L14.37,68.44L14.37,68.44z M18.06,69.05l0.78,0.13L18.06,69.05L18.06,69.05z M29.1,58.03 c-1.84-2.74-4.82-4.65-8.26-5.06l-0.27,7.19c0.81,0.21,1.53,0.63,2.1,1.2l0,0l0.04,0.04L29.1,58.03L29.1,58.03z M11.98,73.38 c0.03,0.03,0.06,0.05,0.09,0.08L11.98,73.38L11.98,73.38z M104.11,60.01l0.28-7.3c-3.63,0.08-6.85,1.8-8.96,4.45l6.45,4.06 C102.48,60.62,103.25,60.2,104.11,60.01L104.11,60.01z M106.54,52.85l-0.27,7.2c0.8,0.21,1.53,0.63,2.1,1.2l0,0l0,0l0,0l0.04,0.04 l6.12-3.23C112.76,55.34,109.89,53.39,106.54,52.85L106.54,52.85z M115.54,59.98l-6.02,3.18c0.13,0.43,0.21,0.89,0.21,1.36 c0,0.42-0.05,0.82-0.16,1.2l5.8,3.65c0.68-1.49,1.06-3.15,1.06-4.89C116.43,62.89,116.12,61.37,115.54,59.98L115.54,59.98z M114.29,71.25l-5.76-3.63c-0.05,0.06-0.11,0.11-0.16,0.17c-0.62,0.62-1.4,1.06-2.28,1.25l-0.18,7.15 C109.37,75.83,112.39,73.96,114.29,71.25L114.29,71.25z M103.75,76.22l0.18-7.23c-0.8-0.21-1.52-0.63-2.09-1.2 c-0.08-0.09-0.17-0.17-0.24-0.26l-6.65,3.62C96.9,74,100.09,75.95,103.75,76.22L103.75,76.22z M93.89,69.26l6.72-3.66 c-0.08-0.35-0.13-0.71-0.13-1.08c0-0.52,0.09-1.02,0.24-1.48l-6.48-4.08c-0.88,1.65-1.37,3.52-1.37,5.52 C92.88,66.18,93.24,67.8,93.89,69.26L93.89,69.26z M106.96,62.66c-0.47-0.47-1.13-0.76-1.86-0.76c-0.73,0-1.38,0.29-1.86,0.77 c-0.12,0.12-0.23,0.25-0.32,0.39c-0.01,0.02-0.02,0.04-0.04,0.06c-0.01,0.02-0.03,0.04-0.04,0.06c-0.23,0.39-0.36,0.85-0.36,1.33 c0,0.73,0.29,1.38,0.77,1.86c0.47,0.47,1.13,0.77,1.86,0.77c0.72,0,1.38-0.29,1.86-0.77c0.14-0.14,0.26-0.29,0.36-0.45 c0.03-0.09,0.07-0.18,0.12-0.27c0.02-0.04,0.05-0.07,0.07-0.1c0.14-0.32,0.21-0.67,0.21-1.04 C107.73,63.79,107.44,63.14,106.96,62.66L106.96,62.66L106.96,62.66z"/></g></svg>'),
	(36, 'STOVE', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 50.8" style="enable-background:new 0 0 122.88 50.8" xml:space="preserve"><g><path d="M31.01,18.14c2.61,0,4.98,1.06,6.69,2.77c1.71,1.71,2.77,4.08,2.77,6.69s-1.06,4.98-2.77,6.69 c-1.71,1.71-4.08,2.77-6.69,2.77c-2.61,0-4.98-1.06-6.69-2.77c-1.71-1.71-2.77-4.08-2.77-6.69s1.06-4.98,2.77-6.69 C26.04,19.2,28.4,18.14,31.01,18.14L31.01,18.14z M13.02,44.36v4.73c0,0.5-0.26,0.94-0.67,1.25c-0.37,0.28-0.88,0.46-1.43,0.46 c-0.55,0-1.06-0.18-1.43-0.46c-0.41-0.31-0.67-0.76-0.67-1.26v-4.73h-3.3c-0.74,0-1.45-0.15-2.1-0.42 c-0.65-0.27-1.25-0.67-1.75-1.16l-0.05-0.04c-0.51-0.51-0.92-1.11-1.2-1.79C0.15,40.3,0,39.59,0,38.84V16.78 c0-0.74,0.15-1.45,0.42-2.11c0.28-0.68,0.69-1.28,1.2-1.79s1.12-0.92,1.79-1.2c0.65-0.27,1.36-0.42,2.11-0.42h5.59 c-0.02-1.15-0.04-2.08-0.07-2.88l0-0.08c-0.1-3.45-0.15-5.18,1.03-6.51c1.29-1.45,2.94-1.39,6.25-1.28l0.06,0 c1.02,0.03,2.26,0.08,4.09,0.08c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.62,0.9,0.62,1.48c0,0.58-0.24,1.1-0.62,1.48 c-0.38,0.38-0.91,0.62-1.48,0.62c-1.49,0-3-0.05-4.25-0.09l-0.06,0c-1.98-0.07-2.95-0.13-2.96-0.11l0,0 c-0.02,0.04-0.03,0.32-0.03,0.82c-0.01,0.64,0.02,1.58,0.06,2.82l0,0.08c0.03,0.88,0.06,1.88,0.07,2.96h14.15V2.1 c0-0.58,0.24-1.1,0.62-1.48C30.45,0.23,30.97,0,31.55,0c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.62,0.91,0.62,1.48v9.17h13.41 l0.03-1.37l0.05-1.67c0.04-1.24,0.06-2.18,0.06-2.82c-0.01-0.53-0.02-0.81-0.04-0.83c-0.01-0.01-0.99,0.05-2.99,0.11l-0.06,0 c-1.24,0.04-2.74,0.09-4.22,0.09c-0.58,0-1.1-0.24-1.48-0.62c-0.38-0.38-0.61-0.91-0.61-1.48c0-0.58,0.23-1.1,0.61-1.48 c0.38-0.38,0.9-0.61,1.48-0.61c1.84,0,3.08-0.04,4.1-0.08l0.03,0c1.61-0.06,2.81-0.1,3.78,0.04l0.02,0 c1.04,0.15,1.81,0.5,2.46,1.23c1.18,1.33,1.13,3.07,1.03,6.53l0,0.06c-0.02,0.81-0.05,1.74-0.07,2.88h20.37 c-0.02-1.15-0.04-2.08-0.07-2.89l0-0.08c-0.1-3.45-0.15-5.18,1.03-6.51c0.66-0.74,1.43-1.09,2.48-1.24 c0.97-0.14,2.18-0.1,3.79-0.04l0.03,0c1.02,0.03,2.27,0.08,4.1,0.08c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.61,0.9,0.61,1.48 c0,0.58-0.24,1.1-0.61,1.48s-0.9,0.62-1.48,0.62c-1.49,0-3-0.05-4.25-0.09l-0.06,0c-1.98-0.07-2.95-0.13-2.96-0.11 c-0.02,0.02-0.03,0.3-0.04,0.83c-0.01,0.64,0.02,1.58,0.06,2.82l0,0.08c0.03,0.88,0.06,1.89,0.07,2.96h14.15V2.1 c0-0.58,0.24-1.1,0.61-1.48C90.97,0.23,91.49,0,92.07,0c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.61,0.91,0.61,1.48v9.17h13.41 l0.03-1.37l0.05-1.67c0.04-1.24,0.06-2.18,0.06-2.82c-0.01-0.53-0.02-0.81-0.03-0.83c-0.01-0.01-0.99,0.05-2.99,0.11l-0.04,0 c-0.6,0.02-1.26,0.04-1.98,0.06c-0.76,0.02-1.53,0.03-2.25,0.03c-0.58,0-1.1-0.24-1.48-0.62c-0.38-0.38-0.62-0.91-0.62-1.48 c0-0.58,0.24-1.1,0.62-1.48c0.38-0.38,0.91-0.61,1.48-0.61c1.84,0,3.08-0.04,4.11-0.08l0.07,0c3.29-0.11,4.94-0.16,6.23,1.28 c1.18,1.33,1.13,3.07,1.03,6.54l0,0.06c-0.02,0.81-0.05,1.74-0.07,2.88h5.59c0.74,0,1.45,0.15,2.1,0.42 c0.68,0.28,1.28,0.69,1.79,1.2c0.51,0.51,0.92,1.12,1.2,1.79c0.27,0.65,0.42,1.36,0.42,2.1v22.06c0,0.74-0.15,1.45-0.42,2.1 c-0.28,0.68-0.69,1.28-1.2,1.79l-0.12,0.11c-0.5,0.48-1.1,0.86-1.75,1.12c-0.63,0.25-1.32,0.39-2.03,0.39h-3.3v4.73 c0,0.5-0.26,0.94-0.67,1.25c-0.37,0.28-0.88,0.46-1.43,0.46c-0.55,0-1.06-0.18-1.43-0.46c-0.41-0.31-0.67-0.76-0.67-1.25v-4.73 H13.02L13.02,44.36z M92.56,18.14c2.61,0,4.98,1.06,6.69,2.77c1.71,1.71,2.77,4.08,2.77,6.69s-1.06,4.98-2.77,6.69 c-1.71,1.71-4.08,2.77-6.69,2.77c-2.61,0-4.98-1.06-6.69-2.77c-1.71-1.71-2.77-4.08-2.77-6.69s1.06-4.98,2.77-6.69 C87.58,19.2,89.95,18.14,92.56,18.14L92.56,18.14z M95.13,25.03c-0.66-0.66-1.57-1.06-2.57-1.06c-1,0-1.91,0.41-2.57,1.06 c-0.66,0.66-1.06,1.56-1.06,2.57c0,1,0.41,1.91,1.06,2.57c0.66,0.66,1.57,1.06,2.57,1.06c0.99,0,1.89-0.4,2.54-1.04l0.02-0.02 c0.66-0.66,1.06-1.57,1.06-2.57C96.19,26.6,95.79,25.69,95.13,25.03L95.13,25.03z M50.32,23.1h20.81c0.58,0,1.11,0.24,1.49,0.62 c0.38,0.38,0.62,0.91,0.62,1.49v5.17c0,0.58-0.24,1.11-0.62,1.49l-0.03,0.03c-0.38,0.37-0.9,0.59-1.46,0.59H50.32 c-0.58,0-1.11-0.24-1.49-0.62c-0.38-0.38-0.62-0.91-0.62-1.49v-5.17c0-0.58,0.24-1.11,0.62-1.49C49.21,23.33,49.74,23.1,50.32,23.1 L50.32,23.1z M117.36,15.46H5.52c-0.18,0-0.35,0.04-0.5,0.1c-0.16,0.07-0.31,0.17-0.43,0.29c-0.24,0.24-0.39,0.57-0.39,0.93v22.06 c0,0.18,0.04,0.35,0.1,0.5c0.07,0.16,0.17,0.31,0.29,0.43l0.03,0.03c0.12,0.11,0.25,0.2,0.39,0.25c0.15,0.06,0.32,0.1,0.5,0.1 h111.85c0.17,0,0.33-0.03,0.48-0.09c0.15-0.06,0.29-0.14,0.4-0.25l0.05-0.05c0.12-0.12,0.22-0.27,0.29-0.43 c0.06-0.15,0.1-0.32,0.1-0.5V16.78c0-0.18-0.04-0.35-0.1-0.5c-0.07-0.16-0.17-0.31-0.29-0.43 C118.05,15.61,117.72,15.46,117.36,15.46L117.36,15.46z M33.58,25.03c-0.66-0.66-1.56-1.06-2.57-1.06c-1,0-1.91,0.41-2.57,1.06 c-0.66,0.66-1.06,1.56-1.06,2.57c0,0.99,0.4,1.89,1.04,2.54l0.02,0.02c0.66,0.66,1.57,1.06,2.57,1.06c1,0,1.91-0.41,2.57-1.06 c0.66-0.66,1.06-1.57,1.06-2.57C34.65,26.59,34.24,25.69,33.58,25.03L33.58,25.03z"/></g></svg>');

-- Dumping structure for table devproject.product_list
CREATE TABLE IF NOT EXISTS `product_list` (
  `PK_ProductID` int NOT NULL AUTO_INCREMENT,
  `FK_CategoryID` int DEFAULT NULL,
  `prprod_name` varchar(255) DEFAULT NULL,
  `prprod_description` longtext,
  `prprod_code` varchar(50) DEFAULT NULL,
  `prprod_sku` varchar(50) DEFAULT NULL,
  `prprod_regprice` decimal(10,2) DEFAULT NULL,
  `prprod_saleprice` decimal(10,2) DEFAULT NULL,
  `inStock` int DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  `isSale` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`PK_ProductID`) USING BTREE,
  UNIQUE KEY `prprod_name` (`prprod_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table devproject.product_list: ~4 rows (approximately)
INSERT INTO `product_list` (`PK_ProductID`, `FK_CategoryID`, `prprod_name`, `prprod_description`, `prprod_code`, `prprod_sku`, `prprod_regprice`, `prprod_saleprice`, `inStock`, `isActive`, `isSale`, `date_created`) VALUES
	(3, 16, 'SAMSUNG 65â€³ CRYSTAL UHD 4K SMART TV UA65DU7000GXXP', '<p><strong style="color: rgb(51, 51, 51);">Display</strong></p><p><span style="color: rgb(51, 51, 51);">â€¢ Screen Size: 65â€³</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ Refresh Rate: 60Hz</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ Resolution: 4K (3,840 x 2,160)</span></p><p><br></p><p><strong>Video</strong></p><p>â€¢ Picture Engine: Crystal Processor 4K</p><p>â€¢ HDR (High Dynamic Range): HDR</p><p>â€¢ HDR 10+: Support</p><p>â€¢ Contrast: Mega Contrast</p><p>â€¢ Micro Dimming: UHD Dimming</p><p>â€¢ Contrast Enhancer: Yes</p><p>â€¢ Motion Technology: Motion Xcelerator</p><p>â€¢ AI Upscale: 4K Upscaling</p><p>â€¢ Filmmaker Mode (FMM): Yes</p><p><br></p><p><strong>Audio</strong></p><p>â€¢ Adaptive Sound: Adaptive Sound</p><p>â€¢ Object Tracking Sound: OTS Lite</p><p>â€¢ Q-Symphony: Yes</p><p>â€¢ Sound Output (RMS): 20W</p><p>â€¢ Speaker Type: 2CH</p><p><br></p><p><strong>Smart Service</strong></p><p>â€¢ Operating System: Tizenâ„¢ Smart TV</p><p>â€¢ Bixby: Yes (Voice Ready)</p><p>â€¢ Web Browser: Yes</p><p>â€¢ SmartThings: Yes</p><p><br></p><p><strong>Smart Feature</strong></p><p>â€¢ Multi Device Experience: Mobile to TV, Sound Mirroring, Wireless TV On</p><p>â€¢ NFT: Nifty Gateway</p><p>â€¢ Apple AirPlay: Yes</p><p>â€¢ Daily+: Yes</p><p>Tuner/Broadcasting</p><p>â€¢ Digital Broadcasting: ISDB-T</p><p>â€¢ Analog Tuner: Yes</p><p>â€¢ TV Key Support: Yes</p><p>Connectivity</p><p>â€¢ Wi-Fi: Yes (Wi-Fi 5)</p><p>â€¢ Bluetooth: Yes (BT5.2)</p><p>â€¢ HDMI: 3</p><p>â€¢ HDMI (High Frame Rate): 4K 60Hz (for HDMI 1/2/3)</p><p>â€¢ HDMI Audio Return Channel: eARC/ARC</p><p>â€¢ Anynet+ (HDMI-CEC): Yes</p><p>â€¢ USB: 1 x USB-A</p><p>â€¢ Ethernet (LAN): 1</p><p>â€¢ RF In (Terrestrial / Cable input): 1/1(Common Use for Terrestrial)/0</p><p><br></p><p><strong>Design</strong></p><p>â€¢ Design: Slim Look</p><p>â€¢ Bezel Type: 3 Bezel-less</p><p>â€¢ Slim Type: Slim look</p><p>â€¢ Front Color: BLACK</p><p>â€¢ Stand Type: FLAT FEET</p><p>â€¢ Stand Color: BLACK</p><p>Power &amp; Eco Solution</p><p>â€¢ Power Supply</p><p>â€¢ AC100-240V~ 50/60Hz</p><p>â€¢ Power Consumption (Max): 170 W</p><p>â€¢ Eco Sensor: Yes</p><p>â€¢ Auto Power Off: Yes</p><p>â€¢ Auto Power Saving: Yes</p><p><br></p><p><strong>Dimension</strong></p><p>â€¢ Package Size (WxHxD): 1606 x 950 x 179 mm</p><p>â€¢ Set Size with Stand (WxHxD): 1452.9 x 879.5 x 267.4 mm</p><p>â€¢ Set Size without Stand (WxHxD): 1452.9 x 834.0 x 60.6 mm</p><p>â€¢ Stand (Basic) (WxD): 1025.5 x 267.4 mm</p><p>â€¢ Stand (Minimum) (WxD): 303.9 x 267.4 mm</p><p>â€¢ VESA Spec: 400 x 300 mm</p><p><br></p><p><strong>Weight</strong></p><p>â€¢ Package Weight: 23.0 kg</p><p>â€¢ Set Weight with Stand: 16.4 kg</p><p>â€¢ Set Weight without Stand: 15.9 kg</p>', 'UA65DU7000GXXP', NULL, 53999.00, 48599.00, 1, 1, 1, '2024-05-17 13:23:20'),
	(5, 20, 'LG 25L SMART INVERTER MICROWAVE OVEN MS2535GIB', '<p><strong>Basic Spec</strong></p><p>â€¢ Brand: LG</p><p>â€¢ Type: Solo</p><p>â€¢ Installation Type: Countertop</p><p>â€¢ Door Design: Divided</p><p>â€¢ Outcase Color: Black</p><p>â€¢ Door Color: Black</p><p>â€¢ EasyClean: Yes</p><p>â€¢ Oven Capacity (L): 25</p><p><br></p><p><strong>Microwave Oven Features</strong></p><p>â€¢ Microwave Power Output (W): 1000</p><p>â€¢ Microwave Power Levels: 5</p><p>â€¢ Total Power Consumption (W): 1150</p><p>â€¢ Microwave Power Consumption (W): 1150</p><p>â€¢ Oven Capacity (L): 25</p><p>â€¢ Cavity Light Type: LED</p><p>â€¢ Turntable Size (mm): 292</p><p>â€¢ Smart Inverter: Yes</p><p><br></p><p><strong>Power / Ratings</strong></p><p>â€¢ Power Output (W): 1000</p><p>â€¢ Required Power Supply (V/Hz): 230V / 60Hz</p><p>Control Features</p><p>â€¢ Control Type: Panel Touch</p><p>â€¢ Control Display: LED</p><p>â€¢ Control Location: Right Side</p><p><br></p><p><strong>Convenience Features</strong></p><p>â€¢ Kitchen Timer: No</p><p>â€¢ Time Setting: Yes</p><p>â€¢ Completion Beeper: Yes</p><p>â€¢ Turntable On/Off: No</p><p>â€¢ Add 30 Seconds: Yes</p><p>â€¢ EasyClean: Yes</p><p>â€¢ Child Lock: Yes</p><p><br></p><p><strong>Design/Finish</strong></p><p>â€¢ Exterior Design: WideView Traditional</p><p>â€¢ Cavity Design: Square</p><p>â€¢ Door Glass Design: Clear</p><p>â€¢ Outcase Color: Black</p><p>â€¢ Door Color: Black</p><p>â€¢ Interior Color: Gray</p><p>â€¢ Printproof Finish: No</p><p><br></p><p><strong>Dimensions/Weight</strong></p><p>â€¢ Cavity Dimension (W x H x D)(mm): 322 x 228 x 335</p><p>â€¢ Product Weight (kg): 8.5</p><p>â€¢ Product Dimensions (W x H x D)(mm): 476 x 272 x 369</p><p>â€¢ Packing Dimensions (W x H x D)(mm): 540 x 294 x 417</p><p><br></p><p><strong>Smart Technology</strong></p><p>â€¢ SmartDiagnosis: Yes</p><p>Cooking Modes</p><p>â€¢ Sensor Reheat: No</p><p>â€¢ Sensor Cook: No</p><p>â€¢ Auto Reheat: No</p><p>â€¢ Auto Cook: Yes</p><p>â€¢ Memory Cook: No</p><p>â€¢ Inverter Defrost: Yes</p><p>â€¢ Air Fry: No</p><p>â€¢ Melt: Yes</p><p>â€¢ Soften: Yes</p><p>â€¢ Roast: No</p><p>â€¢ Grill: No</p><p>â€¢ Speed Grill: No</p><p>â€¢ Bake: No</p><p>â€¢ Convection Bake: No</p><p>â€¢ Speed Convection: No</p><p>â€¢ Dehydrate: No</p><p>â€¢ Warm: Yes</p><p>â€¢ Proof: Yes</p><p>â€¢ Stage Cooking: No</p><p>â€¢ Slow Cook: No</p><p>â€¢ Steam Cook: No</p><p><br></p><p><strong>Accessories</strong></p><p>â€¢ Glass Tray (Ea): 1</p><p>â€¢ Rotate Ring (Ea): 1</p><p>â€¢ Rotate Shaft (Ea): 1</p><p>â€¢ User Manual (Ea): 1</p>', 'MS2535GIB', NULL, 7695.00, 6925.00, 1, 1, NULL, '2024-05-17 13:34:00'),
	(7, 36, 'WHITE WESTINGHOUSE GAS RANGE WCG534K', '<p><span style="color: rgb(51, 51, 51);">â€¢ Electronic Push Button Ignition</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ With Oven Lamp</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ Anti-tilt Device</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ Glass Lid</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ 50cm Gas Range</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ 3 Gas Burners Including 1 Wok Burner</span></p><p><span style="color: rgb(51, 51, 51);">â€¢ Oven Capacity: 62L</span></p>', 'WCG534K', NULL, 21495.00, 19345.00, 1, 1, 1, '2024-05-21 13:59:15'),
	(11, 18, 'HSN/U24IPX2 LG 2.5HP PREM INV UV NANO SPLIT AC ION', '<p>Split Type Dual Inverter Premium Aircon</p><p>HSN24IPX</p><ul><li>Dual Inverter</li><li>GOLD FIN</li><li>Fast Cooling</li><li>Low noise</li><li>ThinQâ„¢ (Wi-Fi)</li><li>Plasmaster Ionizer</li></ul><p><br></p><p>CAPACITY</p><ul><li>Cooling (Min ~ Rated ~ Max)1.81 ~ 6.30 ~ 6.98 kW</li><li>6,161 ~ 21,500 ~ 23,800 Btu/h</li><li>6,500 ~ 22,683 ~ 25,109 Btu/hCapacity2.5HP</li></ul><p>POWER INPUT</p><ul><li>Cooling (Min ~ Rated ~ Max)315 ~ 1,850 ~ 2,600 W</li></ul><p>RUNNING CURRENT</p><ul><li>Cooling (Min ~ Rated ~ Max)1.60 ~ 8.50 ~ 12.00 A</li></ul><p>EER</p><ul><li>EER3.41 W/W</li><li>11.62 (Btu/h)/W</li><li>12.26 (kJ/h)/W</li></ul><p>POWER SUPPLY</p><ul><li>Power Supply1, 230, 60 (Ã˜, V, Hz)Available Voltage Range187 ~ 276 V</li><li>Power Factor - Cooling97.2%Moisture Removal2.80 l/h</li></ul><p>INDOOR UNIT</p><ul><li>Air Flow Rate - Cooling, Max/H/M/L20 / 15 / 12.5 / 10.6 mÂ³/minSound Pressure Level - Cooling, Max/H/M/L/SL- / 47 / 41 / 37 / 32 dB(A)</li><li>Dimensions (W Ã— H Ã— D) - Net998 Ã— 345 Ã— 210 mmDimensions (W Ã— H Ã— D) - Shipping1068 Ã— 425 Ã— 279 mm</li><li>Weight - Net11.6kgWeight - Shipping13.4kg</li><li>Exterior Color CodeMunsell 7.5BG 10/2 (RAL 9016)</li></ul><p>OUTDOOR UNIT</p><ul><li>Air Flow Rate - Max49.0 mÂ³/minFan Motor Speed - Cooling, Min ~ Max190 ~ 940 rpm</li><li>Sound Pressure Level - Cooling, Rated55 dB(A)Dimensions (W Ã— H Ã— D) - Net870 Ã— 650 Ã— 330 mm</li><li>Dimensions (W Ã— H Ã— D) - Shipping1040 Ã— 710 Ã— 455 mmWeight - Net42.5kg</li><li>Weight - Shipping45.9kgMax. Fuse Size20A</li><li>Exterior Color CodeMunsell 9.54Y 8.34/1.31 (RAL 9001)Operation Range - Cooling18 ~ 48 Â°C DB</li></ul><p>CIRCUIT BREAKER</p><ul><li>Circuit Breaker30APower Supply Cable3 x 1.5 No. x mmÂ²</li><li>Power Supply to UnitIndoorPower and Communication Cable4 x 1.5 No. x mmÂ²</li></ul><p>PIPING</p><ul><li>Size - LiquidÃ¸ 6.35 mmSize - GasÃ¸ 15.88 mm</li><li>Connections Method - Indoor/OutdoorFlared/FlaredDrain Hose Size - O.D, I.D21.5, 16.0 mm</li></ul><p>BETWEEN INDOOR &amp; OUTDOOR</p><ul><li>Piping Length - Min/Standard/Max3/7.5/30 mPiping Length - No Change12.5 m</li><li>Max. Elevation Difference20mPiping Connection Heat InsulationBoth liquid and gas pipes</li></ul><p>REFRIGERANT</p><ul><li>TypeR32Pre Charge1150g</li><li>Additional Charge20g/mControlElectronic Expansion Valve</li><li>Global Warning Potential675t-COâ‚‚ eq0.776</li></ul><p>COMPRESSOR</p><ul><li>TypeTwin RotaryModelDAT156MAD</li><li>Motor TypeBLDCOil Type / MakerPVE (FW68D) / IDEMITSU</li><li>Oil Charge400ccManufacturer / Country of OriginLG Electronics / China</li></ul><p>FAN(INDOOR)</p><ul><li>TypeCross Flow FanMotor Output30W</li></ul><p>FAN(OUTDOOR)</p><ul><li>TypePropeller FanMotor Output85W</li><li>Motor InsulationClass EMotor Enclosure / Ingress ProtectionTEAO/IPX4</li></ul><p>HEAT EXCHANGER</p><ul><li>Evaporator - Material, Tube / FinCu/AlEvaporator - (Ã¸ x Row x Column x FPI x L) x Qty.(Ã¸7 x 2 x 16 x 20 x 744) x 1</li><li>Evaporator - Corrosion ProtectionPCMEvaporator - Fin TypeSlit</li><li>Condenser - Material, Tube / FinCu/AlCondenser - (Ã¸ x Row x Column x FPI x L) x Qty.(Ã¸7 x 2 x 28 x 18 x 940) x 1</li><li>Condenser - Corrosion ProtectionGoldCondenser - Fin TypeLouver</li></ul><p><br></p><p><strong>Product Overview</strong></p><ul><li>70% Energy Saving</li><li>Dual Inverter Compressor</li><li>Plasmaster (Ionizer)</li><li>LG ThinQ,</li><li>Active Energy Control</li><li>Auto Cleaning</li><li>Auto Operation(AI)</li><li>Prefilter (Washable / Anti-Bacteria)</li><li>Jet Cool</li><li>Sleep Mode</li><li>Dry (Dehumidification) Operation</li><li>Comfort Air</li><li>Smart Diagnosis</li><li>kW Manager</li><li>Freeze Cleaning</li><li>Gold Fin Copper Condenser</li></ul><p><strong>Warranty</strong></p><ul><li>Compressor: 10 years</li><li>Parts &amp; Service: 1 year</li></ul><p><strong>General Specifications</strong></p><ul><li>Nominal: Size</li><li>Remote: Yes</li><li>Timer: 24 On/Off Timer</li><li>Cooling Capacity: 22,366 kj/hr (rated)</li><li>Color: White</li><li>Noise Level (Indoor) - High: 47db</li><li>Noise Level (Indoor) - Low: 37db</li><li>Speed Cooling: 6</li><li>Airflow Direction Control(Up &amp; Down): 6 Steps</li><li>Airflow Direction Control(Left &amp; Right): 5 Steps</li><li>Fan Speed: 6</li><li>Energy Efficiency Ratio / CSPF: 5.1 (5 Star Rating)</li></ul><p><strong>Weight</strong></p><ul><li>Net Weight (kg): 11.2 kg (Indoor) / 36.7 kg (Outdoor)</li><li>Gross Weight (packed): 13.2 kg (Indoor) / 43.3 kg (Outdoor)</li></ul><p><strong>Dimensions</strong></p><ul><li>Net Dimensions (WxHxD): 998 x 345 x 210 mm / 39.29 x 13.58 x 8.26 inches (In) / 870 x 650 x 330 mm / 34.25 x 25.59 x 12.99 inches (Out)</li><li>Gross Dimensions (WxHxD): 1,068 x 425 x 279 mm / 42.04 x 16.73 x 10.98 (inches) (In) / 1,040 x 710 x 455 mm / 40.94 x 27.95 x 17.91 (inches) (Out)</li></ul><p><strong>Others</strong></p><ul><li>Power Requirements: 230V / 60Hz</li><li>Power Consumption: 2,060 watts</li></ul><p><strong>What\'s in the box</strong></p><ul><li>Manual</li><li>Warranty Card</li><li>Remote Control</li></ul><p><br></p>', 'HSN24IPX', NULL, 79590.00, 66990.00, NULL, NULL, NULL, '2024-06-05 02:27:56');

-- Dumping structure for table devproject.vv_installments
CREATE TABLE IF NOT EXISTS `vv_installments` (
  `installment_id` int NOT NULL AUTO_INCREMENT,
  `PK_InstallmentID` varchar(50) DEFAULT NULL,
  `FK_UserID` int DEFAULT NULL,
  `FK_ProductID` int DEFAULT NULL,
  `installment_verification` varchar(50) DEFAULT NULL,
  `installment_reason` varchar(50) DEFAULT NULL,
  `installment_geolocation` varchar(255) DEFAULT NULL,
  `installment_downpayment` decimal(10,2) DEFAULT NULL,
  `installment_monthly` decimal(10,2) DEFAULT NULL,
  `installment_months` int DEFAULT NULL,
  `installment_created` datetime DEFAULT NULL,
  `installment_approved` datetime DEFAULT NULL,
  `installment_approvedBy` int DEFAULT NULL,
  `installment_creditInvestigator` int DEFAULT NULL,
  PRIMARY KEY (`installment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.vv_installments: ~2 rows (approximately)
INSERT INTO `vv_installments` (`installment_id`, `PK_InstallmentID`, `FK_UserID`, `FK_ProductID`, `installment_verification`, `installment_reason`, `installment_geolocation`, `installment_downpayment`, `installment_monthly`, `installment_months`, `installment_created`, `installment_approved`, `installment_approvedBy`, `installment_creditInvestigator`) VALUES
	(1, '8MS3BNTXFYV67HZ', 23, 11, 'APPROVED', NULL, NULL, 5000.00, 1200.00, 12, '2024-06-07 03:41:52', '2024-06-07 03:42:24', 15, NULL),
	(2, 'GQOU67AZYJ1VMKP', 23, 5, 'APPROVED', NULL, NULL, 1500.00, 700.00, 12, '2024-06-07 03:51:32', '2024-06-07 03:52:11', 15, NULL);

-- Dumping structure for table devproject.vv_monthly
CREATE TABLE IF NOT EXISTS `vv_monthly` (
  `monthly_id` int NOT NULL AUTO_INCREMENT,
  `monthly_number` int DEFAULT NULL,
  `monthly_date` date DEFAULT NULL,
  `FK_InstallmentID` varchar(50) DEFAULT NULL,
  `FK_UserID` int DEFAULT NULL,
  PRIMARY KEY (`monthly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.vv_monthly: ~24 rows (approximately)
INSERT INTO `vv_monthly` (`monthly_id`, `monthly_number`, `monthly_date`, `FK_InstallmentID`, `FK_UserID`) VALUES
	(1, 1, '2024-07-07', '8MS3BNTXFYV67HZ', 23),
	(2, 2, '2024-08-06', '8MS3BNTXFYV67HZ', 23),
	(3, 3, '2024-09-05', '8MS3BNTXFYV67HZ', 23),
	(4, 4, '2024-10-05', '8MS3BNTXFYV67HZ', 23),
	(5, 5, '2024-11-04', '8MS3BNTXFYV67HZ', 23),
	(6, 6, '2024-12-04', '8MS3BNTXFYV67HZ', 23),
	(7, 7, '2025-01-03', '8MS3BNTXFYV67HZ', 23),
	(8, 8, '2025-02-02', '8MS3BNTXFYV67HZ', 23),
	(9, 9, '2025-03-04', '8MS3BNTXFYV67HZ', 23),
	(10, 10, '2025-04-03', '8MS3BNTXFYV67HZ', 23),
	(11, 11, '2025-05-03', '8MS3BNTXFYV67HZ', 23),
	(12, 12, '2025-06-02', '8MS3BNTXFYV67HZ', 23),
	(13, 1, '2024-07-07', 'GQOU67AZYJ1VMKP', 23),
	(14, 2, '2024-08-06', 'GQOU67AZYJ1VMKP', 23),
	(15, 3, '2024-09-05', 'GQOU67AZYJ1VMKP', 23),
	(16, 4, '2024-10-05', 'GQOU67AZYJ1VMKP', 23),
	(17, 5, '2024-11-04', 'GQOU67AZYJ1VMKP', 23),
	(18, 6, '2024-12-04', 'GQOU67AZYJ1VMKP', 23),
	(19, 7, '2025-01-03', 'GQOU67AZYJ1VMKP', 23),
	(20, 8, '2025-02-02', 'GQOU67AZYJ1VMKP', 23),
	(21, 9, '2025-03-04', 'GQOU67AZYJ1VMKP', 23),
	(22, 10, '2025-04-03', 'GQOU67AZYJ1VMKP', 23),
	(23, 11, '2025-05-03', 'GQOU67AZYJ1VMKP', 23),
	(24, 12, '2025-06-02', 'GQOU67AZYJ1VMKP', 23);

-- Dumping structure for table devproject.vv_payment
CREATE TABLE IF NOT EXISTS `vv_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `FK_InstallmentID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FK_UserID` int DEFAULT NULL,
  `payment_or` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table devproject.vv_payment: ~4 rows (approximately)
INSERT INTO `vv_payment` (`payment_id`, `FK_InstallmentID`, `FK_UserID`, `payment_or`, `payment_date`, `payment_amount`) VALUES
	(1, '8MS3BNTXFYV67HZ', 23, '1223233', '2024-06-07 00:00:00', 1400.00),
	(2, '8MS3BNTXFYV67HZ', 23, '1231233', '2024-06-07 00:00:00', 1000.00),
	(3, 'GQOU67AZYJ1VMKP', 23, '012392', '2024-06-07 00:00:00', 500.00),
	(4, 'GQOU67AZYJ1VMKP', 23, '239283', '2024-06-07 00:00:00', 1000.00);


-- Dumping database structure for dpms
CREATE DATABASE IF NOT EXISTS `dpms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dpms`;

-- Dumping structure for table dpms.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(255) DEFAULT NULL,
  `user_password` longtext,
  `user_firstname` varchar(255) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `user_middleinitial` varchar(255) DEFAULT NULL,
  `user_extensionname` varchar(255) DEFAULT NULL,
  `isAdmin` int DEFAULT NULL,
  `isUserDefault` int DEFAULT NULL,
  `user_registeredDate` datetime DEFAULT NULL,
  `isDisabled` int DEFAULT NULL,
  `user_lastLogin` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dpms.tbl_users: ~1 rows (approximately)
INSERT INTO `tbl_users` (`user_id`, `user_code`, `user_password`, `user_firstname`, `user_lastname`, `user_middleinitial`, `user_extensionname`, `isAdmin`, `isUserDefault`, `user_registeredDate`, `isDisabled`, `user_lastLogin`) VALUES
	(1, 'ADMINISTRATOR', '$2a$04$r0TU9dd2ciY9Q83728RylurN4D2O2IW8ciZk7W7iBXivARMQKmikC', 'JECO', 'FLORO', 'E', NULL, 1, NULL, '2024-01-14 22:02:36', NULL, '2024-01-22 23:42:34');


-- Dumping database structure for fiestaaplliances
CREATE DATABASE IF NOT EXISTS `fiestaaplliances` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fiestaaplliances`;

-- Dumping structure for table fiestaaplliances.appsys_users
CREATE TABLE IF NOT EXISTS `appsys_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userFirstName` varchar(255) DEFAULT NULL,
  `userMiddleName` varchar(255) DEFAULT NULL,
  `userLastName` varchar(255) DEFAULT NULL,
  `userExtensionName` varchar(255) DEFAULT NULL,
  `userFullName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `employeeId` varchar(50) DEFAULT NULL,
  `userPassword` longtext,
  `userCreated` datetime DEFAULT NULL,
  `address` longtext,
  `address_geolocation` longtext,
  `isActivated` int DEFAULT NULL,
  `isDisabled` int DEFAULT NULL,
  `userRecoveryCode` varchar(50) DEFAULT NULL,
  `activationCode` varchar(50) DEFAULT NULL,
  `isAdmin` int DEFAULT NULL,
  `isCustomer` int DEFAULT NULL,
  `isBranchManager` int DEFAULT NULL,
  `isCreditInvestigator` int DEFAULT NULL,
  `isCoMaker` int DEFAULT NULL,
  `isCashier` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fiestaaplliances.appsys_users: ~5 rows (approximately)
INSERT INTO `appsys_users` (`id`, `userFirstName`, `userMiddleName`, `userLastName`, `userExtensionName`, `userFullName`, `userName`, `emailAddress`, `phoneNumber`, `employeeId`, `userPassword`, `userCreated`, `address`, `address_geolocation`, `isActivated`, `isDisabled`, `userRecoveryCode`, `activationCode`, `isAdmin`, `isCustomer`, `isBranchManager`, `isCreditInvestigator`, `isCoMaker`, `isCashier`) VALUES
	(2, 'JAY', 'ESTRELLA', 'RUI', NULL, 'JAY ESTRELLA RUI', 'customer', 'jpaclibar@gmail.com', NULL, NULL, '$2y$10$m8ofJB5/ObboKeF0K4AdpOui0TKf85VSMJsLcrpuWaKhRgbVY4dUi', '2024-05-13 11:29:38', NULL, NULL, 1, NULL, 'XJ92S91A', NULL, NULL, 1, NULL, NULL, NULL, NULL),
	(4, 'JAY', 'ESTRELLA', 'RUI', NULL, 'JAY ESTRELLA RUI', 'administrator', 'jay.estrella', '09382828293', NULL, '$2y$10$m8ofJB5/ObboKeF0K4AdpOui0TKf85VSMJsLcrpuWaKhRgbVY4dUi', '2024-05-13 16:21:05', NULL, NULL, NULL, NULL, 'zoYl4vaT3Q', 'woG9BgHm4IXDhLdMyus1Qqn6VjEZil', 1, NULL, NULL, NULL, NULL, NULL),
	(11, 'JAY', 'ESTRELLA', 'RUI', NULL, 'JAY ESTRELLA RUI', 'cashier', 'jay.estrella', '09382828293', NULL, '$2y$10$m8ofJB5/ObboKeF0K4AdpOui0TKf85VSMJsLcrpuWaKhRgbVY4dUi', '2024-05-13 16:21:05', NULL, NULL, NULL, NULL, 'zoYl4vaT3Q', 'woG9BgHm4IXDhLdMyus1Qqn6VjEZil', NULL, NULL, NULL, NULL, NULL, 1),
	(12, 'JAY', 'ESTRELLA', 'RUI', NULL, 'JAY ESTRELLA RUI', 'creditcoordinator', 'jay.estrella', '09382828293', NULL, '$2y$10$m8ofJB5/ObboKeF0K4AdpOui0TKf85VSMJsLcrpuWaKhRgbVY4dUi', '2024-05-13 16:21:05', NULL, NULL, NULL, NULL, 'zoYl4vaT3Q', 'woG9BgHm4IXDhLdMyus1Qqn6VjEZil', NULL, NULL, NULL, NULL, 1, NULL),
	(13, 'JAY', 'ESTRELLA', 'RUI', NULL, 'JAY ESTRELLA RUI', 'creditinvestigator', 'jay.estrella', '09382828293', NULL, '$2y$10$m8ofJB5/ObboKeF0K4AdpOui0TKf85VSMJsLcrpuWaKhRgbVY4dUi', '2024-05-13 16:21:05', NULL, NULL, NULL, NULL, 'zoYl4vaT3Q', 'woG9BgHm4IXDhLdMyus1Qqn6VjEZil', NULL, NULL, NULL, 1, NULL, NULL);

-- Dumping structure for table fiestaaplliances.msc_loans
CREATE TABLE IF NOT EXISTS `msc_loans` (
  `loan_code` varchar(50) NOT NULL,
  `prprod_code` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `loan_months` int DEFAULT NULL,
  `loan_downpayment` int DEFAULT NULL,
  `payment_month` decimal(10,2) DEFAULT NULL,
  `isInvestigated` int DEFAULT NULL,
  `isApproved` int DEFAULT NULL,
  `file_code` varchar(50) DEFAULT NULL,
  `address_lat` varchar(255) DEFAULT NULL,
  `address_long` varchar(255) DEFAULT NULL,
  `isPublished` int DEFAULT NULL,
  `isFullyPaid` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`loan_code`),
  UNIQUE KEY `loan_code` (`loan_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fiestaaplliances.msc_loans: ~1 rows (approximately)
INSERT INTO `msc_loans` (`loan_code`, `prprod_code`, `customer_id`, `loan_months`, `loan_downpayment`, `payment_month`, `isInvestigated`, `isApproved`, `file_code`, `address_lat`, `address_long`, `isPublished`, `isFullyPaid`, `date_created`) VALUES
	('0NQB1IR95USYK7C', 'WCG534K', 2, 1, 6449, NULL, 1, 1, '9OSFIP3XLCHWZ1AVK8MD', NULL, NULL, NULL, NULL, '2024-05-21 14:03:40'),
	('U5RLY7CIHFDBZG9', 'UA65DU7000GXXP', 2, 1, 12026, NULL, 1, 1, '8S1UI4WH372L5ZQAOGNY', NULL, NULL, NULL, NULL, '2024-05-20 13:48:29');

-- Dumping structure for table fiestaaplliances.msc_loans_payment
CREATE TABLE IF NOT EXISTS `msc_loans_payment` (
  `payment_reference` varchar(50) NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_change` int DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `loan_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prprod_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `processed_by` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_reference`),
  UNIQUE KEY `payment_reference` (`payment_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table fiestaaplliances.msc_loans_payment: ~0 rows (approximately)
INSERT INTO `msc_loans_payment` (`payment_reference`, `payment_amount`, `payment_change`, `payment_status`, `loan_code`, `prprod_code`, `customer_id`, `processed_by`, `date_created`) VALUES
	('ARG9KUQ24LVTY3P7S6ZO', 3340.67, NULL, 1, 'U5RLY7CIHFDBZG9', 'UA65DU7000GXXP', 2, 11, '2024-05-21 14:08:36');

-- Dumping structure for table fiestaaplliances.pr_categories
CREATE TABLE IF NOT EXISTS `pr_categories` (
  `ctId` int NOT NULL AUTO_INCREMENT,
  `ctName` varchar(255) DEFAULT NULL,
  `ctIcon` longtext,
  PRIMARY KEY (`ctId`),
  UNIQUE KEY `ctName` (`ctName`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fiestaaplliances.pr_categories: ~9 rows (approximately)
INSERT INTO `pr_categories` (`ctId`, `ctName`, `ctIcon`) VALUES
	(16, 'TELEVISION', '<xml version="1.0" encoding="utf-8">\n<svg width="60" height="60" version="1.1" id="Layer_1"\nxmlns="http://www.w3.org/2000/svg"\nxmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"\nviewBox="0 0 122.88 83.06"\nstyle="enable-background:new 0 0 122.88 83.06" xml:space="preserve">\n<g>\n<path\nd="M2.08,0H120.8h2.08v2.08v69.2v2.08h-2.08H77.57v4.55h16.61v5.15H28.55v-5.15h16.61v-4.55H2.08H0v-2.08V2.08V0H2.08L2.08,0z M118.73,4.15H4.15v65.05h114.57V4.15L118.73,4.15z" />\n</g>\n</svg>\n</xml>'),
	(18, 'AIR CONDITIONER', '<xml version="1.0" encoding="utf-8"?><svg  width="60" height="60"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 67.41" style="enable-background:new 0 0 122.88 67.41" xml:space="preserve"><g><path d="M79.93,51.37c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32 c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32 C81.22,56.36,82.7,54,79.93,51.37L79.93,51.37z M14.57,28.11h73.65c0.96,0,1.74,0.78,1.74,1.74v12.26h24.13 c1.46,0,2.79-0.6,3.75-1.56c0.96-0.96,1.56-2.29,1.56-3.75V8.8c0-1.46-0.6-2.79-1.56-3.75c-0.96-0.96-2.29-1.56-3.75-1.56H8.8 c-1.46,0-2.79,0.6-3.75,1.56C4.08,6.01,3.48,7.34,3.48,8.8V36.8c0,1.46,0.6,2.79,1.56,3.75c0.96,0.96,2.29,1.56,3.75,1.56h4.03 V29.85C12.83,28.89,13.61,28.11,14.57,28.11L14.57,28.11z M86.48,31.59H16.31v10.09h70.17V31.59L86.48,31.59z M15.21,13.64 c-0.96,0-1.74-0.78-1.74-1.74c0-0.96,0.78-1.74,1.74-1.74h93.74c0.96,0,1.74,0.78,1.74,1.74c0,0.96-0.78,1.74-1.74,1.74H15.21 L15.21,13.64z M98.58,31.99c1.36,0,2.46,1.1,2.46,2.46s-1.1,2.46-2.46,2.46s-2.46-1.1-2.46-2.46S97.23,31.99,98.58,31.99 L98.58,31.99z M108.85,31.99c1.36,0,2.46,1.1,2.46,2.46s-1.1,2.46-2.46,2.46c-1.36,0-2.46-1.1-2.46-2.46S107.49,31.99,108.85,31.99 L108.85,31.99z M8.8,0h105.29c2.42,0,4.62,0.99,6.21,2.58c1.59,1.59,2.58,3.79,2.58,6.21V36.8c0,2.42-0.99,4.62-2.58,6.21 c-1.59,1.59-3.79,2.58-6.21,2.58H8.8c-2.42,0-4.62-0.99-6.21-2.58C0.99,41.42,0,39.22,0,36.8V8.8c0-2.42,0.99-4.62,2.58-6.21 C4.18,0.99,6.38,0,8.8,0L8.8,0z M15.21,21.76c-0.96,0-1.74-0.78-1.74-1.74c0-0.96,0.78-1.74,1.74-1.74h93.74 c0.96,0,1.74,0.78,1.74,1.74c0,0.96-0.78,1.74-1.74,1.74H15.21L15.21,21.76z M21.37,51.37c-0.53-0.51-0.32-1.2,0.48-1.54 c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55 c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32C22.66,56.36,24.13,54,21.37,51.37L21.37,51.37z M36.01,51.37 c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32c-1.32,2.12-2.59,4.15-0.25,6.19 c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32C37.3,56.36,38.77,54,36.01,51.37 L36.01,51.37z M50.65,51.37c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3c3.78,3.6,1.96,6.52,0.21,9.32 c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24c-3.47-3.03-1.86-5.62-0.17-8.32 C51.94,56.36,53.42,54,50.65,51.37L50.65,51.37z M65.29,51.37c-0.53-0.51-0.32-1.2,0.48-1.54c0.8-0.34,1.87-0.2,2.41,0.3 c3.78,3.6,1.96,6.52,0.21,9.32c-1.32,2.12-2.59,4.15-0.25,6.19c0.57,0.5,0.4,1.19-0.37,1.55c-0.77,0.36-1.86,0.26-2.43-0.24 c-3.47-3.03-1.85-5.62-0.17-8.32C66.58,56.36,68.06,54,65.29,51.37L65.29,51.37z"/></g></svg>\n</xml>'),
	(20, 'MICROWAVE OVEN', '<xml version="1.0" encoding="utf-8"?><svg  width="60" height="60"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 77.77" style="enable-background:new 0 0 122.88 77.77" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M95.45,13.68h3.94c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89h-3.94c-0.49,0-0.89-0.4-0.89-0.89 v-3C94.56,14.08,94.96,13.68,95.45,13.68L95.45,13.68z M24.22,75.44v1.14c0,0.65-0.53,1.18-1.18,1.18H17.2 c-0.65,0-1.18-0.53-1.18-1.18v-1.15H4.7c-1.29,0-2.47-0.53-3.32-1.38C0.53,73.21,0,72.04,0,70.74V4.7c0-1.29,0.53-2.47,1.38-3.32 C2.23,0.53,3.41,0,4.7,0h113.48c1.29,0,2.47,0.53,3.32,1.38c0.85,0.85,1.38,2.03,1.38,3.32v66.04c0,1.29-0.53,2.47-1.38,3.32 c-0.85,0.85-2.03,1.38-3.32,1.38h-10.06v1.14c0,0.65-0.53,1.18-1.18,1.18h-5.84c-0.65,0-1.18-0.53-1.18-1.18v-1.15H24.22 L24.22,75.44z M101.62,50.08c0.24,0,0.43,0.19,0.43,0.43c0,0.24-0.19,0.43-0.43,0.43c-0.24,0-0.43-0.19-0.43-0.43 C101.19,50.27,101.38,50.08,101.62,50.08L101.62,50.08z M99.43,50.34c0.23-0.06,0.47,0.08,0.53,0.31c0.06,0.23-0.08,0.47-0.31,0.53 c-0.23,0.06-0.47-0.08-0.53-0.31C99.07,50.64,99.2,50.4,99.43,50.34L99.43,50.34z M97.39,51.16c0.21-0.12,0.47-0.05,0.59,0.16 c0.12,0.21,0.05,0.47-0.16,0.59c-0.21,0.12-0.47,0.05-0.59-0.16C97.11,51.54,97.18,51.28,97.39,51.16L97.39,51.16z M95.63,52.48 c0.17-0.17,0.44-0.17,0.61,0c0.17,0.17,0.17,0.44,0,0.61c-0.17,0.17-0.44,0.17-0.61,0C95.46,52.93,95.46,52.65,95.63,52.48 L95.63,52.48z M94.27,54.21c0.12-0.21,0.38-0.28,0.59-0.16c0.21,0.12,0.28,0.39,0.16,0.59c-0.12,0.21-0.38,0.28-0.59,0.16 C94.22,54.69,94.14,54.42,94.27,54.21L94.27,54.21z M93.4,56.24c0.06-0.23,0.3-0.37,0.53-0.31c0.23,0.06,0.37,0.3,0.31,0.53 c-0.06,0.23-0.3,0.37-0.53,0.31C93.47,56.71,93.34,56.47,93.4,56.24L93.4,56.24z M109.71,56.42c0.06,0.23-0.08,0.47-0.31,0.53 c-0.23,0.06-0.47-0.08-0.53-0.31c-0.06-0.23,0.08-0.47,0.31-0.53C109.41,56.05,109.64,56.19,109.71,56.42L109.71,56.42z M108.89,54.38c0.12,0.21,0.05,0.47-0.16,0.59c-0.21,0.12-0.47,0.05-0.59-0.16c-0.12-0.21-0.05-0.47,0.16-0.59 C108.5,54.1,108.77,54.17,108.89,54.38L108.89,54.38z M107.56,52.61c0.17,0.17,0.17,0.44,0,0.61c-0.17,0.17-0.44,0.17-0.61,0 c-0.17-0.17-0.17-0.44,0-0.61C107.12,52.44,107.39,52.44,107.56,52.61L107.56,52.61z M105.83,51.25c0.21,0.12,0.28,0.38,0.16,0.59 c-0.12,0.21-0.38,0.28-0.59,0.16c-0.21-0.12-0.28-0.38-0.16-0.59C105.36,51.2,105.62,51.13,105.83,51.25L105.83,51.25z M103.8,50.39c0.23,0.06,0.37,0.3,0.31,0.53c-0.06,0.23-0.3,0.37-0.53,0.31c-0.23-0.06-0.37-0.3-0.31-0.53 C103.33,50.46,103.57,50.33,103.8,50.39L103.8,50.39z M16.4,32.11c-0.2,0.63-0.87,0.98-1.5,0.78c-0.63-0.2-0.98-0.87-0.78-1.5 c0.57-1.79,1.91-4.46,3.64-6.74c1.38-1.81,3.02-3.42,4.77-4.24c0.59-0.28,1.3-0.02,1.58,0.57c0.28,0.59,0.02,1.3-0.57,1.58 c-1.35,0.63-2.7,1.98-3.87,3.52C18.1,28.15,16.9,30.53,16.4,32.11L16.4,32.11z M90.11,6.82h23.07c0.79,0,1.5,0.32,2.02,0.84 c0.52,0.52,0.84,1.23,0.84,2.02v55.7c0,0.79-0.32,1.5-0.84,2.02c-0.52,0.52-1.23,0.84-2.02,0.84H90.11c-0.79,0-1.5-0.32-2.02-0.84 h0c-0.52-0.52-0.84-1.23-0.84-2.02V9.69c0-0.79,0.32-1.5,0.84-2.02C88.6,7.15,89.32,6.82,90.11,6.82L90.11,6.82z M113.18,9.21 H90.11c-0.13,0-0.25,0.05-0.34,0.14c-0.09,0.09-0.14,0.21-0.14,0.34v55.7c0,0.13,0.05,0.25,0.14,0.34l0,0 c0.09,0.09,0.21,0.14,0.34,0.14h23.07c0.13,0,0.25-0.05,0.34-0.14c0.09-0.09,0.14-0.21,0.14-0.34V9.69c0-0.13-0.05-0.25-0.14-0.34 C113.42,9.26,113.31,9.21,113.18,9.21L113.18,9.21z M10.49,15.11h59.88c0.66,0,1.25,0.27,1.69,0.7c0.43,0.43,0.7,1.03,0.7,1.69 v40.46c0,0.66-0.27,1.25-0.7,1.69c-0.43,0.43-1.03,0.7-1.69,0.7H10.49c-0.66,0-1.25-0.27-1.69-0.7c-0.43-0.43-0.7-1.03-0.7-1.69 V17.49c0-0.66,0.27-1.25,0.7-1.69h0C9.24,15.37,9.83,15.11,10.49,15.11L10.49,15.11z M70.37,17.49H10.49h0l0,0c0,0,0,0,0,0v40.46 c0,0,0,0,0,0c0,0,0,0,0,0h59.88c0,0,0,0,0,0c0,0,0,0,0,0L70.37,17.49C70.37,17.49,70.37,17.49,70.37,17.49 C70.37,17.49,70.37,17.49,70.37,17.49L70.37,17.49z M82.59,2.39v70.67h35.59c0.63,0,1.21-0.26,1.63-0.68 c0.42-0.42,0.68-1,0.68-1.63V4.7c0-0.64-0.26-1.21-0.68-1.63c-0.42-0.42-1-0.68-1.63-0.68H82.59L82.59,2.39z M77.79,73.06V2.39H4.7 c-0.64,0-1.21,0.26-1.63,0.68c-0.42,0.42-0.68,1-0.68,1.63v66.04c0,0.63,0.26,1.21,0.68,1.63c0.42,0.42,1,0.68,1.63,0.68H77.79 L77.79,73.06z M101.62,53c3.04,0,5.51,2.47,5.51,5.51c0,3.04-2.47,5.51-5.51,5.51c-3.04,0-5.51-2.46-5.51-5.51 C96.12,55.46,98.58,53,101.62,53L101.62,53z M95.26,33.67h12.97c0.92,0,1.67,0.75,1.67,1.67v9.02c0,0.92-0.75,1.67-1.67,1.67H95.26 c-0.92,0-1.67-0.75-1.67-1.67v-9.02C93.59,34.43,94.34,33.67,95.26,33.67L95.26,33.67z M104.1,22.45h3.94 c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89h-3.94c-0.49,0-0.89-0.4-0.89-0.89v-3 C103.22,22.85,103.62,22.45,104.1,22.45L104.1,22.45z M95.45,22.45h3.94c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89 h-3.94c-0.49,0-0.89-0.4-0.89-0.89v-3C94.56,22.85,94.96,22.45,95.45,22.45L95.45,22.45z M104.1,13.68h3.94 c0.49,0,0.89,0.4,0.89,0.89v3c0,0.49-0.4,0.89-0.89,0.89h-3.94c-0.49,0-0.89-0.4-0.89-0.89v-3 C103.22,14.08,103.62,13.68,104.1,13.68L104.1,13.68z"/></g></svg></xml>'),
	(22, 'SMARTPHONE', '<xml version="1.0" encoding="utf-8"?><svg  width="60" height="60"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 71.31 122.88" style="enable-background:new 0 0 71.31 122.88" xml:space="preserve"><g><path d="M12.47,0h46.36c3.43,0,6.55,1.4,8.81,3.66c2.26,2.26,3.66,5.38,3.66,8.81v97.94c0,3.43-1.4,6.55-3.66,8.81 c-2.26,2.26-5.38,3.66-8.81,3.66H12.47c-3.43,0-6.55-1.4-8.81-3.66C1.4,116.96,0,113.84,0,110.41V12.47c0-3.43,1.4-6.55,3.66-8.81 C5.92,1.4,9.04,0,12.47,0L12.47,0z M28.93,113c-0.83,0-1.5-0.67-1.5-1.5c0-0.83,0.67-1.5,1.5-1.5h13.72c0.83,0,1.5,0.67,1.5,1.5 c0,0.83-0.67,1.5-1.5,1.5H28.93L28.93,113z M27.65,7.16c1.31,0,2.38,1.07,2.38,2.38c0,1.31-1.07,2.38-2.38,2.38 c-1.31,0-2.38-1.07-2.38-2.38C25.27,8.23,26.34,7.16,27.65,7.16L27.65,7.16z M35.65,7.16c1.31,0,2.38,1.07,2.38,2.38 c0,1.31-1.07,2.38-2.38,2.38c-1.32,0-2.38-1.07-2.38-2.38C33.27,8.23,34.34,7.16,35.65,7.16L35.65,7.16z M43.65,7.16 c1.31,0,2.38,1.07,2.38,2.38c0,1.31-1.07,2.38-2.38,2.38c-1.32,0-2.38-1.07-2.38-2.38C41.27,8.23,42.34,7.16,43.65,7.16L43.65,7.16 z M3,99.29h65.31V19.21H3V99.29L3,99.29z M68.31,102.29H3v8.12c0,2.6,1.07,4.97,2.78,6.69c1.72,1.72,4.09,2.78,6.69,2.78h46.36 c2.6,0,4.97-1.07,6.69-2.78c1.72-1.72,2.78-4.09,2.78-6.69V102.29L68.31,102.29z M3,16.21h65.31v-3.74c0-2.6-1.07-4.97-2.78-6.69 C63.81,4.06,61.44,3,58.83,3H12.47C9.87,3,7.5,4.06,5.78,5.78C4.06,7.5,3,9.87,3,12.47V16.21L3,16.21z"/></g></svg></xml>'),
	(24, 'LAPTOP', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 70.51" style="enable-background:new 0 0 122.88 70.51" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M2.54,65.44h12.59c-0.93-0.24-1.63-1.1-1.63-2.1V2.17C13.5,0.98,14.48,0,15.67,0h90.97 c1.19,0,2.17,0.98,2.17,2.17v61.16c0,1.01-0.69,1.86-1.63,2.1h13.16c1.4,0,2.54,1.14,2.54,2.54v0c0,1.4-1.14,2.54-2.54,2.54H2.54 c-1.4,0-2.54-1.14-2.54-2.54v0C0,66.58,1.14,65.44,2.54,65.44L2.54,65.44z M17.21,3.4h88.19v59.32H17.21V3.4L17.21,3.4z M57.87,66.39h7.14c0.67,0,1.22,0.55,1.22,1.22l0,0c0,0.67-0.55,1.22-1.22,1.22h-7.14c-0.67,0-1.22-0.55-1.22-1.22l0,0 C56.65,66.93,57.2,66.39,57.87,66.39L57.87,66.39z"/></g></svg>'),
	(26, 'SOFA', '<svg width="60" height="60" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 65.28"><title>couch-sofa</title><path d="M14,58.73A1.94,1.94,0,0,0,13.17,57c-1.1-.89-2.29-1.87-2.29-5.34,0-1.92.14-3.62.28-5.22.3-3.52.55-6.51-1.1-10.27a14.07,14.07,0,0,1-1.92.06A8.41,8.41,0,0,1,2.57,34,8.22,8.22,0,0,1,.15,29.35,10,10,0,0,1,0,27.16,8.3,8.3,0,0,1,1.93,22,9,9,0,0,1,7,19.12a11.87,11.87,0,0,1,3.17-.21V16a16.08,16.08,0,0,1,16-16h70a16.08,16.08,0,0,1,16,16V18.9a12.51,12.51,0,0,1,1.49-.08,9.82,9.82,0,0,1,6.13,1.92A7.78,7.78,0,0,1,122,23.42a8.78,8.78,0,0,1,.67,5.65,9.52,9.52,0,0,1-1.56,3.61,8.5,8.5,0,0,1-3.1,2.65,9,9,0,0,1-5.38.77c-1.66,3.77-1.41,6.76-1.11,10.29.14,1.6.28,3.3.28,5.22,0,3.47-1.19,4.45-2.29,5.34a1.94,1.94,0,0,0-.87,1.78,1.42,1.42,0,0,1-1.43,1.42h-5.11s0,.08,0,.11v3.48a1.54,1.54,0,0,1-1.54,1.54H90.94a1.54,1.54,0,0,1-1.53-1.54V60.15H33.47v3.59a1.54,1.54,0,0,1-1.53,1.54H22.29a1.54,1.54,0,0,1-1.53-1.54V60.15H15.47A1.42,1.42,0,0,1,14,58.73Zm87-25.51a1.58,1.58,0,0,1,0,.38v9.14a1.43,1.43,0,0,1-1.43,1.43H23.32a1.43,1.43,0,0,1-1.43-1.43V33.83a42.1,42.1,0,0,0-1.73-4.16,23.39,23.39,0,0,0-2-3.38,10.93,10.93,0,0,0-5.79-4.12,10,10,0,0,0-4.8-.26A6.15,6.15,0,0,0,4.1,23.85a5.52,5.52,0,0,0-1.25,3.43A7.67,7.67,0,0,0,3,28.86a5.48,5.48,0,0,0,1.57,3.06,5.59,5.59,0,0,0,3.74,1.42,11.53,11.53,0,0,0,2.39-.18,1.43,1.43,0,0,1,1.51.76c2.5,4.94,2.2,8.47,1.84,12.7-.14,1.53-.27,3.16-.27,5,0,2.12.64,2.65,1.24,3.14a4.19,4.19,0,0,1,1.78,2.55H106a4.19,4.19,0,0,1,1.78-2.55c.6-.49,1.24-1,1.24-3.14,0-1.83-.13-3.46-.27-5-.35-4.21-.65-7.73,1.8-12.63a1.45,1.45,0,0,1,1.41-.85l.5,0,.18,0a6.43,6.43,0,0,0,4.19-.43,5.63,5.63,0,0,0,2-1.76,6.61,6.61,0,0,0,1.08-2.51,6,6,0,0,0-.44-3.83,4.86,4.86,0,0,0-1.38-1.7,7.08,7.08,0,0,0-4.38-1.33,12,12,0,0,0-5.26,1.28A10.13,10.13,0,0,0,105,25.66a22.13,22.13,0,0,0-2.22,3.58,38.3,38.3,0,0,0-1.73,4ZM24.74,35v6.28H98.23V35c-11.86.17-23.75.23-35.6.55l-1.28,0h0l-3.18-.08L24.74,35ZM59.93,2.91V2.85H26.22A13.21,13.21,0,0,0,13.05,16V19.4l.16.05a13.79,13.79,0,0,1,7.29,5.19,26.91,26.91,0,0,1,2.22,3.78c.55,1.14,1.09,2.39,1.6,3.77,11.86.18,23.77.23,35.62.55a1.55,1.55,0,0,1,0-.22V2.91Zm2.84-.06V32.52a1.5,1.5,0,0,1,0,.22c11.85-.32,23.76-.37,35.62-.55A40.78,40.78,0,0,1,100.22,28a23.9,23.9,0,0,1,2.53-4,13,13,0,0,1,4.44-3.53,15.28,15.28,0,0,1,2.18-.88V16A13.21,13.21,0,0,0,96.2,2.85Z"/></svg>'),
	(28, 'SPEAKERS', '<svg width="60" height="60" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 92.87"><defs><style>.cls-1{fill-rule:evenodd;}</style></defs><title>television-cabinet-stereo</title><path class="cls-1" d="M5.19,23.81H17.62a.79.79,0,0,1,.78.79V46.85H42.63v-2.3h9.5V42H26.31V0H96.57V42H70.66v2.6h9.5v2.3h24.32V24.6a.78.78,0,0,1,.78-.79h12.43a.79.79,0,0,1,.78.79V46.85h2.86a1.54,1.54,0,0,1,1.55,1.55v30a5.38,5.38,0,0,1-1.58,3.8l-.09.09a5.37,5.37,0,0,1-3.71,1.5H106.87l1.86,9.06H99.39l0-9.06H23.53l0,9.06H14.15L16,83.81H5.38a5.38,5.38,0,0,1-3.8-1.59l-.08-.09A5.35,5.35,0,0,1,0,78.42v-30a1.54,1.54,0,0,1,1.55-1.55H4.41V24.6a.78.78,0,0,1,.78-.79Zm89-21.44H28.68v37.2H94.19V2.37Zm17.28,24.22a3,3,0,0,1,2.17.9,3.08,3.08,0,0,1-2.17,5.26,3.11,3.11,0,0,1-2.18-.9,3.08,3.08,0,0,1,2.18-5.26Zm1.67,1.4a2.38,2.38,0,0,0-3.35,0,2.37,2.37,0,0,0,0,3.36,2.4,2.4,0,0,0,1.68.69A2.37,2.37,0,0,0,113.15,28Zm-1.67.81a.87.87,0,1,1-.87.87.86.86,0,0,1,.87-.87Zm0,6.72a5.14,5.14,0,1,1-3.62,1.5,5.09,5.09,0,0,1,3.62-1.5Zm2.7,2.44a3.81,3.81,0,1,0,1.11,2.69A3.81,3.81,0,0,0,114.17,38Zm-2.7,1.21A1.48,1.48,0,1,1,110,40.65a1.48,1.48,0,0,1,1.47-1.48ZM99.16,72.61c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23-5.75-.55-5.75-1.23,2.58-1.22,5.75-1.22Zm0-17.54c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23-5.75-.55-5.75-1.23,2.58-1.22,5.75-1.22ZM81.54,63.76h38.24V50H81.54V63.76Zm38.24,2H81.54V80.71h36a2.25,2.25,0,0,0,1.55-.61l.06-.06a2.32,2.32,0,0,0,.67-1.62V65.79ZM79.54,80.71V50H43.34V80.71Zm-55.83-8.1c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23S18,74.51,18,73.83s2.58-1.22,5.75-1.22Zm0-17.54c3.18,0,5.76.55,5.76,1.22s-2.58,1.23-5.76,1.23S18,57,18,56.29s2.58-1.22,5.75-1.22ZM3.1,63.76H41.34V50H3.1V63.76Zm38.24,2H3.1V78.42A2.29,2.29,0,0,0,3.71,80l.06.06a2.31,2.31,0,0,0,1.61.67h36V65.79ZM11.41,39.17a1.48,1.48,0,1,1-1.48,1.48,1.48,1.48,0,0,1,1.48-1.48Zm0-12.58a3,3,0,0,1,2.17.9l0,0a3.08,3.08,0,0,1-2.19,5.24,3.11,3.11,0,0,1-2.18-.9,3.08,3.08,0,0,1,2.18-5.26ZM13.08,28A2.38,2.38,0,0,0,9,29.67,2.38,2.38,0,1,0,13.1,28Zm-1.67.81a.87.87,0,1,1-.87.87.87.87,0,0,1,.87-.87Zm0,6.72A5.14,5.14,0,1,1,7.78,37a5.08,5.08,0,0,1,3.63-1.5ZM14.1,38a3.81,3.81,0,1,0,1.11,2.69A3.8,3.8,0,0,0,14.1,38Z"/></svg>'),
	(30, 'FREEZER', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 74.48 122.88" style="enable-background:new 0 0 74.48 122.88" xml:space="preserve"><g><path d="M6.39,0h61.69c1.76,0,3.36,0.72,4.52,1.87c1.16,1.16,1.88,2.76,1.88,4.52v25.83v76.76c0,1.76-0.72,3.36-1.88,4.52 c-1.16,1.16-2.76,1.87-4.52,1.87H63v2.83c0,2.57-2.1,4.68-4.67,4.68l0,0c-2.57,0-4.67-2.1-4.67-4.68v-2.83H21v2.83 c0,2.57-2.1,4.68-4.67,4.68l0,0c-2.57,0-4.67-2.1-4.67-4.68v-2.83H6.39c-1.76,0-3.36-0.72-4.52-1.87C0.72,112.34,0,110.74,0,108.98 V32.22V6.39c0-1.76,0.72-3.36,1.87-4.52C3.03,0.72,4.63,0,6.39,0L6.39,0L6.39,0z M38.75,65.12c5.83-5.53,6.38-1.8,0,4.26v6.68 l5.84-3.37c2.04-8.51,5.54-9.83,3.69-2.13c5.94-3.43,7.41-0.7,1.51,2.7c7.7,2.28,4.76,4.63-3.69,2.13l-5.77,3.33l5.83,3.36 c8.39-2.48,11.29-0.12,3.69,2.13c5.94,3.43,4.32,6.07-1.58,2.66c1.88,7.82-1.63,6.42-3.69-2.13l-5.83-3.36v6.71 c6.38,6.06,5.83,9.79,0,4.26c0,6.86-3.1,6.96-3.1,0.04c-5.74,5.46-6.35,1.77,0-4.26v-6.71l-5.75,3.32 c-2.06,8.55-5.57,9.95-3.69,2.13c-5.93,3.43-7.57,0.8-1.58-2.66c-7.59-2.25-4.71-4.62,3.69-2.13l5.83-3.36l-5.77-3.33 c-8.44,2.5-11.39,0.15-3.69-2.13c-5.94-3.43-4.47-6.16,1.51-2.7c-1.85-7.71,1.64-6.38,3.69,2.13l5.77,3.33v-6.68 c-6.35-6.03-5.75-9.71,0-4.26C35.66,58.22,38.75,58.31,38.75,65.12L38.75,65.12z M10.62,41.68c0-1.4,1.13-2.53,2.53-2.53 s2.53,1.13,2.53,2.53v16.18c0,1.4-1.13,2.53-2.53,2.53s-2.53-1.13-2.53-2.53V41.68L10.62,41.68L10.62,41.68z M10.62,10.82 c0-1.4,1.13-2.53,2.53-2.53s2.53,1.13,2.53,2.53v10.71c0,1.4-1.13,2.53-2.53,2.53s-2.53-1.13-2.53-2.53V10.82L10.62,10.82 L10.62,10.82z M5.07,29.68h64.35V6.39c0-0.36-0.15-0.7-0.4-0.94c-0.24-0.24-0.57-0.4-0.94-0.4H6.39c-0.36,0-0.7,0.15-0.94,0.4 c-0.24,0.24-0.4,0.57-0.4,0.94v23.29H5.07L5.07,29.68z M69.41,34.75H5.07v74.22c0,0.36,0.15,0.7,0.4,0.94 c0.24,0.24,0.57,0.4,0.94,0.4h61.68c0.36,0,0.7-0.15,0.94-0.4c0.24-0.24,0.4-0.57,0.4-0.94V34.75H69.41L69.41,34.75z"/></g></svg>'),
	(32, 'MOTORCYCLE', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 82.71" style="enable-background:new 0 0 122.88 82.71" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M50.7,36.7l-0.16-0.68c-2.39,0.65-4.79,0.86-7.21,0.78c-2.76-0.09-5.52-0.56-8.28-1.19 c-1.35-0.31-2.53-0.64-3.65-0.96c-2.52-0.71-4.74-1.33-7.8-1.36c-0.03,0-0.05,0-0.08,0l0,0l-11.07-0.94l-2.18,3.14 c6.36,2.46,14.26,4.18,21.86,4.85c7.17,0.63,14.04,0.34,19.05-1.14L50.7,36.7L50.7,36.7z M104.65,46.26 c10.07,0,18.23,8.16,18.23,18.23c0,10.07-8.16,18.23-18.23,18.23c-10.07,0-18.23-8.16-18.23-18.23c0-6.08,2.97-11.46,7.54-14.77 l-5.29-10.4l-9.71,29.2h-4.29c0,0.12,0,0.24-0.02,0.35c-0.36,1.98-0.97,3.58-1.83,4.78c-0.96,1.34-2.21,2.2-3.76,2.57 c-1.89,0.45-7.19-0.4-10.65-0.95c-0.92-0.15-1.71-0.27-2.22-0.34l-11.41-1.53l-0.05,0.18c-0.27,1.08-1.32,1.79-2.44,1.61 l-7.08-1.16c-0.76,1.2-1.66,2.3-2.67,3.29c-3.35,3.28-7.99,5.31-13.1,5.31c-5.11,0-9.74-2.03-13.1-5.31 c-3.36-3.29-5.44-7.83-5.44-12.84c0-5.01,2.08-9.55,5.44-12.84c3.35-3.28,7.99-5.31,13.1-5.31c5.11,0,9.74,2.03,13.1,5.31 c3.36,3.29,5.44,7.83,5.44,12.84c0,0.56-0.03,1.11-0.08,1.65l6.17,1.71c1.06,0.29,1.72,1.34,1.56,2.4l10.97,1.47 c0.57,0.08,1.37,0.2,2.31,0.35c3.2,0.51,8.11,1.29,9.4,0.99c0.76-0.18,1.38-0.62,1.87-1.3c0.56-0.78,0.97-1.87,1.24-3.25H45.37 C37.45,41.52,17.65,37.82,6.29,47.48L0,47.4c1.88-4.56,6.3-7.52,11.67-9.11c-1.19-0.41-2.33-0.84-3.43-1.3 c-0.09-0.03-0.17-0.07-0.25-0.13c-0.49-0.34-0.61-1.01-0.27-1.5l3.29-4.74c0.21-0.32,0.59-0.52,1-0.49l11.69,0.99v0 c3.33,0.05,5.65,0.7,8.29,1.44c1.1,0.31,2.26,0.63,3.55,0.93c2.64,0.61,5.27,1.06,7.86,1.14c2.49,0.08,4.97-0.17,7.42-0.96 c0.8-0.71,1.61-1.39,2.45-2.04c0.87-0.68,1.79-1.34,2.77-1.99c2.61-1.74,5.29-3.13,8.12-4.08c2.85-0.95,5.84-1.45,9.07-1.39 c1.99,0.04,3.92,0.34,5.75,0.97c1.26,0.44,2.48,1.03,3.64,1.79c0.01-0.2,0.08-0.4,0.2-0.56l-5.77-4.33h-9.02 c-1.05,0-1.89-0.85-1.89-1.89c0-1.05,0.85-1.89,1.89-1.89h8.31v-7.54h0.01l0-0.04c0.01-0.25,0-0.48-0.03-0.68 c-0.02-0.17-0.06-0.33-0.11-0.49c-0.16-0.49-0.5-0.7-0.96-0.98c-0.03-0.01-0.05-0.03-0.08-0.04c-0.05-0.03-0.1-0.06-0.22-0.13 l-0.08,1.3c-0.05,0.77-0.71,1.36-1.49,1.31c-0.77-0.05-1.36-0.71-1.31-1.49l0.52-8.19c0.05-0.77,0.71-1.36,1.49-1.31 c0.77,0.05,1.36,0.71,1.31,1.49l-0.24,3.73l1.05,0.64l0.39,0.23c0.03,0.01,0.05,0.03,0.07,0.05c1,0.58,1.73,1.04,2.22,2.53 c0.1,0.3,0.17,0.63,0.22,1c0.04,0.33,0.06,0.69,0.05,1.07h0v8.19l3.66,2.74l0.33-0.38l-0.86-0.62c-0.48-0.35-0.59-1.03-0.24-1.51 c0.03-0.04,0.06-0.08,0.09-0.11l3.37-3.93c0.39-0.45,1.07-0.51,1.52-0.12l0.02,0.02l3.15,2.59c0.46,0.38,0.53,1.06,0.15,1.52 l-0.02,0.03h0l-3.29,3.75c-0.13,0.15-0.29,0.25-0.46,0.31l0,0l-1.17,0.4l1.07,0.8l0.03,0.03l0.32-0.16 c0.53-0.26,1.18-0.04,1.45,0.49l0.02,0.03l1.54,2.94c0.74-1.66,2.39-2.8,3.83-3.8c0.3-0.21,0.6-0.42,0.86-0.61 c1.13-0.84,2.18-1.38,3.13-1.62c1.05-0.27,2-0.19,2.81,0.21c0.81,0.41,1.44,1.12,1.85,2.13c0.37,0.91,0.57,2.06,0.57,3.44v3.98 c0,0.05,0,0.11-0.01,0.16c-0.11,1.76-0.51,3.03-1.14,3.89c-0.39,0.53-0.85,0.9-1.38,1.14c-0.53,0.24-1.1,0.33-1.7,0.3 c-1.29-0.07-2.74-0.74-4.24-1.85l-1.15-0.85l6.79,12.58C101.51,46.46,103.06,46.26,104.65,46.26L104.65,46.26z M95.81,48.54 c0.69-0.39,1.41-0.73,2.16-1.02L86.95,26.9c-0.03,0.05-0.06,0.1-0.1,0.15c-0.45,0.28-1.01,0.63-1.55,0.75L95.81,48.54L95.81,48.54z M12.84,59.22l4.52,1.25c0.33-0.16,0.67-0.28,1.04-0.36l0.28-7.2l-0.05,0l-0.09,0.01c-0.08,0.01-0.16,0.01-0.24,0.02l-0.03,0 l-0.01,0c-0.09,0.01-0.17,0.02-0.26,0.03l-0.09,0.01c-0.06,0.01-0.12,0.02-0.17,0.02l-0.1,0.02c-0.06,0.01-0.12,0.02-0.17,0.03 l-0.09,0.02c-0.07,0.01-0.14,0.03-0.21,0.04l-0.05,0.01c-0.09,0.02-0.17,0.04-0.26,0.06l-0.08,0.02c-0.06,0.01-0.12,0.03-0.18,0.04 l-0.1,0.03l-0.17,0.05l-0.09,0.02c-0.07,0.02-0.14,0.04-0.2,0.06l-0.05,0.01c-0.08,0.03-0.16,0.05-0.24,0.08l-0.09,0.03 c-0.05,0.02-0.11,0.04-0.16,0.06l-0.1,0.04l-0.15,0.06l-0.1,0.04c-0.05,0.02-0.1,0.04-0.15,0.06l-0.09,0.04 c-0.07,0.03-0.15,0.06-0.22,0.1l-0.09,0.04l-0.14,0.07l-0.11,0.05l-0.12,0.06l-0.11,0.06L14,54.24l-0.1,0.05l-0.01,0 c-0.07,0.04-0.13,0.07-0.2,0.11l0,0l-0.12,0.07l-0.09,0.05c-0.04,0.02-0.08,0.05-0.12,0.08l-0.09,0.06l-0.12,0.08l-0.09,0.06 l-0.13,0.08l-0.03,0.02c-0.1,0.07-0.2,0.14-0.3,0.21l-0.06,0.04l-0.13,0.1l-0.07,0.06c-0.04,0.03-0.08,0.06-0.12,0.1l-0.06,0.05 c-0.15,0.12-0.3,0.25-0.45,0.38l-0.03,0.02c-0.04,0.04-0.09,0.08-0.13,0.12l-0.05,0.05c-0.04,0.04-0.08,0.08-0.13,0.12l-0.05,0.05 c-0.04,0.04-0.08,0.08-0.12,0.12l-0.02,0.02c-0.15,0.15-0.29,0.3-0.42,0.45l-0.03,0.03c-0.04,0.05-0.08,0.1-0.13,0.15L10.59,57 c-0.15,0.17-0.29,0.35-0.43,0.54L12.84,59.22L12.84,59.22z M25.06,62.6l6,1.66c-0.03-1.53-0.36-3-0.93-4.33L25.06,62.6L25.06,62.6z M27.57,72.79l-7.26-1.19l-0.11,4.48l0.12-0.01l0.05,0c0.09-0.01,0.17-0.01,0.26-0.02l0.06-0.01c0.08-0.01,0.15-0.02,0.23-0.03 l0.04,0c0.08-0.01,0.16-0.02,0.24-0.03l0.08-0.01c0.08-0.01,0.16-0.03,0.25-0.04l0.01,0c0.08-0.01,0.16-0.03,0.24-0.05l0.06-0.01 c0.08-0.02,0.16-0.03,0.24-0.05l0.04-0.01c0.07-0.02,0.14-0.03,0.21-0.05l0.06-0.02c0.08-0.02,0.16-0.04,0.23-0.06l0.06-0.02 c0.07-0.02,0.15-0.04,0.22-0.07l0.02-0.01l0.01,0c0.07-0.02,0.15-0.05,0.22-0.07l0.08-0.03c0.07-0.02,0.14-0.05,0.21-0.08 l0.06-0.02c0.06-0.02,0.11-0.04,0.17-0.07l0.08-0.03c0.07-0.03,0.13-0.05,0.2-0.08l0.09-0.04l0.14-0.06l0.08-0.04 c0.06-0.03,0.12-0.06,0.18-0.09l0.11-0.05l0.12-0.06c0.05-0.03,0.1-0.05,0.15-0.08l0.11-0.06l0.11-0.06 c0.05-0.03,0.1-0.05,0.15-0.08c0.04-0.02,0.08-0.05,0.13-0.07l0.1-0.06l0.11-0.07c0.05-0.03,0.1-0.06,0.15-0.09l0,0l0.12-0.08 l0.07-0.04c0.07-0.05,0.14-0.09,0.2-0.14L26.11,74l0.12-0.09l0.05-0.03c0.08-0.06,0.15-0.11,0.23-0.17l0.03-0.03 c0.04-0.03,0.08-0.07,0.13-0.1l0.02-0.01c0.08-0.06,0.16-0.13,0.24-0.19l0.05-0.04c0.13-0.11,0.25-0.22,0.37-0.33l0,0 C27.42,72.94,27.49,72.87,27.57,72.79L27.57,72.79z M18.16,71.25l-6.88-1.13l-1.49,0.81l0.01,0.02c0.03,0.04,0.06,0.08,0.09,0.13 l0.06,0.09l0.09,0.12l0.06,0.09c0.03,0.04,0.06,0.08,0.09,0.12l0.06,0.08l0.09,0.12l0.07,0.08c0.03,0.04,0.06,0.08,0.1,0.12 c0.03,0.03,0.05,0.06,0.08,0.1c0.03,0.03,0.05,0.06,0.08,0.1l0,0c0.05,0.06,0.11,0.12,0.16,0.18l0.1,0.11l0.08,0.08 c0.03,0.03,0.06,0.06,0.09,0.1l0.09,0.1l0.09,0.08l0.1,0.1l0.09,0.09l0.09,0.09l0.1,0.09l0.09,0.08l0.1,0.08l0.11,0.09 c0.03,0.03,0.06,0.05,0.09,0.08c0.06,0.05,0.13,0.1,0.19,0.15l0,0l0.08,0.06c0.04,0.03,0.08,0.06,0.13,0.1l0.1,0.08l0.1,0.08 l0.11,0.08l0.11,0.08l0.11,0.08l0.11,0.07l0.11,0.07c0.04,0.03,0.08,0.05,0.12,0.08l0.1,0.06c0.05,0.03,0.1,0.06,0.15,0.09 l0.08,0.05c0.08,0.04,0.15,0.09,0.23,0.13l0.08,0.04c0.05,0.03,0.1,0.06,0.16,0.08l0.1,0.05l0.14,0.07l0.1,0.05l0.14,0.07 l0.11,0.05c0.05,0.02,0.09,0.04,0.14,0.06l0.1,0.04c0.05,0.02,0.11,0.04,0.16,0.07l0.09,0.04c0.07,0.03,0.15,0.06,0.22,0.08 l0.03,0.01l0.01,0c0.08,0.03,0.16,0.06,0.25,0.09l0.08,0.03c0.06,0.02,0.11,0.04,0.17,0.06l0.09,0.03 c0.06,0.02,0.12,0.03,0.17,0.05l0.09,0.03l0.16,0.04l0.11,0.03c0.06,0.01,0.12,0.03,0.17,0.04l0.09,0.02 c0.06,0.01,0.12,0.03,0.19,0.04l0.09,0.02c0.08,0.02,0.15,0.03,0.23,0.04l0.03,0.01l0,0c0.09,0.02,0.18,0.03,0.26,0.04l0.11,0.02 c0.05,0.01,0.11,0.02,0.16,0.02l0.11,0.01L18.16,71.25L18.16,71.25z M10.99,60.95l-2.59-0.05l-2.3-0.04L5.07,64.7l4.01,2.88 l9.76,1.6l1.53,0.25l6.97,1.14l0,0l1.82,0.3l7.16,1.17v0l6.15,1.01c0.31-0.52,0.81-2.59,1.04-3.07l0.01-0.04l-7.83-2.16l-4.79-1.32 l-15.48-4.27l-3.46-0.96L10.99,60.95L10.99,60.95z M95.07,26c-1.29,0.9-2.8,1.94-3.08,3.11c-0.13,0.54-0.16,0.82-0.08,0.96 c0.09,0.18,0.41,0.42,0.9,0.78l3.06,2.25c1.12,0.82,2.13,1.32,2.9,1.37c0.21,0.01,0.39-0.01,0.54-0.08 c0.14-0.06,0.27-0.18,0.39-0.34c0.35-0.48,0.59-1.31,0.66-2.56l0-0.01V27.5c0-1.07-0.13-1.9-0.37-2.49 c-0.17-0.42-0.4-0.7-0.66-0.83c-0.26-0.13-0.62-0.14-1.07-0.03c-0.64,0.16-1.4,0.56-2.26,1.2C95.71,25.56,95.4,25.77,95.07,26 L95.07,26z M82.56,32l-0.11-2.51c-1.3-1.04-2.7-1.79-4.18-2.29c-1.63-0.56-3.33-0.83-5.09-0.86c-2.97-0.06-5.73,0.4-8.35,1.28 c-2.64,0.88-5.15,2.19-7.6,3.83c-0.89,0.59-1.77,1.23-2.64,1.91c-0.7,0.54-1.37,1.09-2.01,1.66l0.22,1.14l0.65,2.74l24.76,0.09 c0.03,0,0.07,0,0.1,0v0c0.66,0.06,1.23,0.02,1.72-0.11c0.44-0.13,0.82-0.34,1.13-0.62c1.6-1.46,1.5-3.96,1.41-6.14L82.56,32 L82.56,32z M45.76,46.19l9.51-0.13c0.69-0.01,1.34,0.58,1.26,1.26l-0.71,6.13c-0.08,0.69-0.57,1.26-1.26,1.26h-6.01 c-0.69,0-0.97-0.63-1.26-1.26l-2.8-6C44.2,46.82,45.06,46.2,45.76,46.19L45.76,46.19z M68.06,45.43h8.6c0.69,0,1.42,0.59,1.26,1.26 l-1.82,7.74c-0.16,0.67-0.57,1.26-1.26,1.26h-6.01c-0.69,0-1.19-0.57-1.26-1.26l-0.78-7.74C66.73,46,67.37,45.43,68.06,45.43 L68.06,45.43z M14.37,68.44l-3.09,1.68L14.37,68.44L14.37,68.44z M18.06,69.05l0.78,0.13L18.06,69.05L18.06,69.05z M29.1,58.03 c-1.84-2.74-4.82-4.65-8.26-5.06l-0.27,7.19c0.81,0.21,1.53,0.63,2.1,1.2l0,0l0.04,0.04L29.1,58.03L29.1,58.03z M11.98,73.38 c0.03,0.03,0.06,0.05,0.09,0.08L11.98,73.38L11.98,73.38z M104.11,60.01l0.28-7.3c-3.63,0.08-6.85,1.8-8.96,4.45l6.45,4.06 C102.48,60.62,103.25,60.2,104.11,60.01L104.11,60.01z M106.54,52.85l-0.27,7.2c0.8,0.21,1.53,0.63,2.1,1.2l0,0l0,0l0,0l0.04,0.04 l6.12-3.23C112.76,55.34,109.89,53.39,106.54,52.85L106.54,52.85z M115.54,59.98l-6.02,3.18c0.13,0.43,0.21,0.89,0.21,1.36 c0,0.42-0.05,0.82-0.16,1.2l5.8,3.65c0.68-1.49,1.06-3.15,1.06-4.89C116.43,62.89,116.12,61.37,115.54,59.98L115.54,59.98z M114.29,71.25l-5.76-3.63c-0.05,0.06-0.11,0.11-0.16,0.17c-0.62,0.62-1.4,1.06-2.28,1.25l-0.18,7.15 C109.37,75.83,112.39,73.96,114.29,71.25L114.29,71.25z M103.75,76.22l0.18-7.23c-0.8-0.21-1.52-0.63-2.09-1.2 c-0.08-0.09-0.17-0.17-0.24-0.26l-6.65,3.62C96.9,74,100.09,75.95,103.75,76.22L103.75,76.22z M93.89,69.26l6.72-3.66 c-0.08-0.35-0.13-0.71-0.13-1.08c0-0.52,0.09-1.02,0.24-1.48l-6.48-4.08c-0.88,1.65-1.37,3.52-1.37,5.52 C92.88,66.18,93.24,67.8,93.89,69.26L93.89,69.26z M106.96,62.66c-0.47-0.47-1.13-0.76-1.86-0.76c-0.73,0-1.38,0.29-1.86,0.77 c-0.12,0.12-0.23,0.25-0.32,0.39c-0.01,0.02-0.02,0.04-0.04,0.06c-0.01,0.02-0.03,0.04-0.04,0.06c-0.23,0.39-0.36,0.85-0.36,1.33 c0,0.73,0.29,1.38,0.77,1.86c0.47,0.47,1.13,0.77,1.86,0.77c0.72,0,1.38-0.29,1.86-0.77c0.14-0.14,0.26-0.29,0.36-0.45 c0.03-0.09,0.07-0.18,0.12-0.27c0.02-0.04,0.05-0.07,0.07-0.1c0.14-0.32,0.21-0.67,0.21-1.04 C107.73,63.79,107.44,63.14,106.96,62.66L106.96,62.66L106.96,62.66z"/></g></svg>'),
	(36, 'STOVE', '<?xml version="1.0" encoding="utf-8"?><svg width="60" height="60" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 50.8" style="enable-background:new 0 0 122.88 50.8" xml:space="preserve"><g><path d="M31.01,18.14c2.61,0,4.98,1.06,6.69,2.77c1.71,1.71,2.77,4.08,2.77,6.69s-1.06,4.98-2.77,6.69 c-1.71,1.71-4.08,2.77-6.69,2.77c-2.61,0-4.98-1.06-6.69-2.77c-1.71-1.71-2.77-4.08-2.77-6.69s1.06-4.98,2.77-6.69 C26.04,19.2,28.4,18.14,31.01,18.14L31.01,18.14z M13.02,44.36v4.73c0,0.5-0.26,0.94-0.67,1.25c-0.37,0.28-0.88,0.46-1.43,0.46 c-0.55,0-1.06-0.18-1.43-0.46c-0.41-0.31-0.67-0.76-0.67-1.26v-4.73h-3.3c-0.74,0-1.45-0.15-2.1-0.42 c-0.65-0.27-1.25-0.67-1.75-1.16l-0.05-0.04c-0.51-0.51-0.92-1.11-1.2-1.79C0.15,40.3,0,39.59,0,38.84V16.78 c0-0.74,0.15-1.45,0.42-2.11c0.28-0.68,0.69-1.28,1.2-1.79s1.12-0.92,1.79-1.2c0.65-0.27,1.36-0.42,2.11-0.42h5.59 c-0.02-1.15-0.04-2.08-0.07-2.88l0-0.08c-0.1-3.45-0.15-5.18,1.03-6.51c1.29-1.45,2.94-1.39,6.25-1.28l0.06,0 c1.02,0.03,2.26,0.08,4.09,0.08c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.62,0.9,0.62,1.48c0,0.58-0.24,1.1-0.62,1.48 c-0.38,0.38-0.91,0.62-1.48,0.62c-1.49,0-3-0.05-4.25-0.09l-0.06,0c-1.98-0.07-2.95-0.13-2.96-0.11l0,0 c-0.02,0.04-0.03,0.32-0.03,0.82c-0.01,0.64,0.02,1.58,0.06,2.82l0,0.08c0.03,0.88,0.06,1.88,0.07,2.96h14.15V2.1 c0-0.58,0.24-1.1,0.62-1.48C30.45,0.23,30.97,0,31.55,0c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.62,0.91,0.62,1.48v9.17h13.41 l0.03-1.37l0.05-1.67c0.04-1.24,0.06-2.18,0.06-2.82c-0.01-0.53-0.02-0.81-0.04-0.83c-0.01-0.01-0.99,0.05-2.99,0.11l-0.06,0 c-1.24,0.04-2.74,0.09-4.22,0.09c-0.58,0-1.1-0.24-1.48-0.62c-0.38-0.38-0.61-0.91-0.61-1.48c0-0.58,0.23-1.1,0.61-1.48 c0.38-0.38,0.9-0.61,1.48-0.61c1.84,0,3.08-0.04,4.1-0.08l0.03,0c1.61-0.06,2.81-0.1,3.78,0.04l0.02,0 c1.04,0.15,1.81,0.5,2.46,1.23c1.18,1.33,1.13,3.07,1.03,6.53l0,0.06c-0.02,0.81-0.05,1.74-0.07,2.88h20.37 c-0.02-1.15-0.04-2.08-0.07-2.89l0-0.08c-0.1-3.45-0.15-5.18,1.03-6.51c0.66-0.74,1.43-1.09,2.48-1.24 c0.97-0.14,2.18-0.1,3.79-0.04l0.03,0c1.02,0.03,2.27,0.08,4.1,0.08c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.61,0.9,0.61,1.48 c0,0.58-0.24,1.1-0.61,1.48s-0.9,0.62-1.48,0.62c-1.49,0-3-0.05-4.25-0.09l-0.06,0c-1.98-0.07-2.95-0.13-2.96-0.11 c-0.02,0.02-0.03,0.3-0.04,0.83c-0.01,0.64,0.02,1.58,0.06,2.82l0,0.08c0.03,0.88,0.06,1.89,0.07,2.96h14.15V2.1 c0-0.58,0.24-1.1,0.61-1.48C90.97,0.23,91.49,0,92.07,0c0.58,0,1.1,0.23,1.48,0.61c0.38,0.38,0.61,0.91,0.61,1.48v9.17h13.41 l0.03-1.37l0.05-1.67c0.04-1.24,0.06-2.18,0.06-2.82c-0.01-0.53-0.02-0.81-0.03-0.83c-0.01-0.01-0.99,0.05-2.99,0.11l-0.04,0 c-0.6,0.02-1.26,0.04-1.98,0.06c-0.76,0.02-1.53,0.03-2.25,0.03c-0.58,0-1.1-0.24-1.48-0.62c-0.38-0.38-0.62-0.91-0.62-1.48 c0-0.58,0.24-1.1,0.62-1.48c0.38-0.38,0.91-0.61,1.48-0.61c1.84,0,3.08-0.04,4.11-0.08l0.07,0c3.29-0.11,4.94-0.16,6.23,1.28 c1.18,1.33,1.13,3.07,1.03,6.54l0,0.06c-0.02,0.81-0.05,1.74-0.07,2.88h5.59c0.74,0,1.45,0.15,2.1,0.42 c0.68,0.28,1.28,0.69,1.79,1.2c0.51,0.51,0.92,1.12,1.2,1.79c0.27,0.65,0.42,1.36,0.42,2.1v22.06c0,0.74-0.15,1.45-0.42,2.1 c-0.28,0.68-0.69,1.28-1.2,1.79l-0.12,0.11c-0.5,0.48-1.1,0.86-1.75,1.12c-0.63,0.25-1.32,0.39-2.03,0.39h-3.3v4.73 c0,0.5-0.26,0.94-0.67,1.25c-0.37,0.28-0.88,0.46-1.43,0.46c-0.55,0-1.06-0.18-1.43-0.46c-0.41-0.31-0.67-0.76-0.67-1.25v-4.73 H13.02L13.02,44.36z M92.56,18.14c2.61,0,4.98,1.06,6.69,2.77c1.71,1.71,2.77,4.08,2.77,6.69s-1.06,4.98-2.77,6.69 c-1.71,1.71-4.08,2.77-6.69,2.77c-2.61,0-4.98-1.06-6.69-2.77c-1.71-1.71-2.77-4.08-2.77-6.69s1.06-4.98,2.77-6.69 C87.58,19.2,89.95,18.14,92.56,18.14L92.56,18.14z M95.13,25.03c-0.66-0.66-1.57-1.06-2.57-1.06c-1,0-1.91,0.41-2.57,1.06 c-0.66,0.66-1.06,1.56-1.06,2.57c0,1,0.41,1.91,1.06,2.57c0.66,0.66,1.57,1.06,2.57,1.06c0.99,0,1.89-0.4,2.54-1.04l0.02-0.02 c0.66-0.66,1.06-1.57,1.06-2.57C96.19,26.6,95.79,25.69,95.13,25.03L95.13,25.03z M50.32,23.1h20.81c0.58,0,1.11,0.24,1.49,0.62 c0.38,0.38,0.62,0.91,0.62,1.49v5.17c0,0.58-0.24,1.11-0.62,1.49l-0.03,0.03c-0.38,0.37-0.9,0.59-1.46,0.59H50.32 c-0.58,0-1.11-0.24-1.49-0.62c-0.38-0.38-0.62-0.91-0.62-1.49v-5.17c0-0.58,0.24-1.11,0.62-1.49C49.21,23.33,49.74,23.1,50.32,23.1 L50.32,23.1z M117.36,15.46H5.52c-0.18,0-0.35,0.04-0.5,0.1c-0.16,0.07-0.31,0.17-0.43,0.29c-0.24,0.24-0.39,0.57-0.39,0.93v22.06 c0,0.18,0.04,0.35,0.1,0.5c0.07,0.16,0.17,0.31,0.29,0.43l0.03,0.03c0.12,0.11,0.25,0.2,0.39,0.25c0.15,0.06,0.32,0.1,0.5,0.1 h111.85c0.17,0,0.33-0.03,0.48-0.09c0.15-0.06,0.29-0.14,0.4-0.25l0.05-0.05c0.12-0.12,0.22-0.27,0.29-0.43 c0.06-0.15,0.1-0.32,0.1-0.5V16.78c0-0.18-0.04-0.35-0.1-0.5c-0.07-0.16-0.17-0.31-0.29-0.43 C118.05,15.61,117.72,15.46,117.36,15.46L117.36,15.46z M33.58,25.03c-0.66-0.66-1.56-1.06-2.57-1.06c-1,0-1.91,0.41-2.57,1.06 c-0.66,0.66-1.06,1.56-1.06,2.57c0,0.99,0.4,1.89,1.04,2.54l0.02,0.02c0.66,0.66,1.57,1.06,2.57,1.06c1,0,1.91-0.41,2.57-1.06 c0.66-0.66,1.06-1.57,1.06-2.57C34.65,26.59,34.24,25.69,33.58,25.03L33.58,25.03z"/></g></svg>');

-- Dumping structure for table fiestaaplliances.pr_products
CREATE TABLE IF NOT EXISTS `pr_products` (
  `prprod_id` int NOT NULL AUTO_INCREMENT,
  `prprod_category` int DEFAULT NULL,
  `prprod_name` varchar(255) DEFAULT NULL,
  `prprod_description` longtext,
  `inStock` int DEFAULT NULL,
  `prprod_code` varchar(50) DEFAULT NULL,
  `prprod_sku` varchar(50) DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  `prprod_regprice` decimal(10,2) DEFAULT NULL,
  `prprod_saleprice` decimal(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`prprod_id`),
  UNIQUE KEY `prprod_name` (`prprod_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fiestaaplliances.pr_products: ~2 rows (approximately)
INSERT INTO `pr_products` (`prprod_id`, `prprod_category`, `prprod_name`, `prprod_description`, `inStock`, `prprod_code`, `prprod_sku`, `isActive`, `prprod_regprice`, `prprod_saleprice`, `date_created`) VALUES
	(3, 16, 'SAMSUNG 65″ CRYSTAL UHD 4K SMART TV UA65DU7000GXXP', '<p><strong style="color: rgb(51, 51, 51);">Display</strong></p><p><span style="color: rgb(51, 51, 51);">• Screen Size: 65″</span></p><p><span style="color: rgb(51, 51, 51);">• Refresh Rate: 60Hz</span></p><p><span style="color: rgb(51, 51, 51);">• Resolution: 4K (3,840 x 2,160)</span></p><p><br></p><p><strong>Video</strong></p><p>• Picture Engine: Crystal Processor 4K</p><p>• HDR (High Dynamic Range): HDR</p><p>• HDR 10+: Support</p><p>• Contrast: Mega Contrast</p><p>• Micro Dimming: UHD Dimming</p><p>• Contrast Enhancer: Yes</p><p>• Motion Technology: Motion Xcelerator</p><p>• AI Upscale: 4K Upscaling</p><p>• Filmmaker Mode (FMM): Yes</p><p><br></p><p><strong>Audio</strong></p><p>• Adaptive Sound: Adaptive Sound</p><p>• Object Tracking Sound: OTS Lite</p><p>• Q-Symphony: Yes</p><p>• Sound Output (RMS): 20W</p><p>• Speaker Type: 2CH</p><p><br></p><p><strong>Smart Service</strong></p><p>• Operating System: Tizen™ Smart TV</p><p>• Bixby: Yes (Voice Ready)</p><p>• Web Browser: Yes</p><p>• SmartThings: Yes</p><p><br></p><p><strong>Smart Feature</strong></p><p>• Multi Device Experience: Mobile to TV, Sound Mirroring, Wireless TV On</p><p>• NFT: Nifty Gateway</p><p>• Apple AirPlay: Yes</p><p>• Daily+: Yes</p><p>Tuner/Broadcasting</p><p>• Digital Broadcasting: ISDB-T</p><p>• Analog Tuner: Yes</p><p>• TV Key Support: Yes</p><p>Connectivity</p><p>• Wi-Fi: Yes (Wi-Fi 5)</p><p>• Bluetooth: Yes (BT5.2)</p><p>• HDMI: 3</p><p>• HDMI (High Frame Rate): 4K 60Hz (for HDMI 1/2/3)</p><p>• HDMI Audio Return Channel: eARC/ARC</p><p>• Anynet+ (HDMI-CEC): Yes</p><p>• USB: 1 x USB-A</p><p>• Ethernet (LAN): 1</p><p>• RF In (Terrestrial / Cable input): 1/1(Common Use for Terrestrial)/0</p><p><br></p><p><strong>Design</strong></p><p>• Design: Slim Look</p><p>• Bezel Type: 3 Bezel-less</p><p>• Slim Type: Slim look</p><p>• Front Color: BLACK</p><p>• Stand Type: FLAT FEET</p><p>• Stand Color: BLACK</p><p>Power &amp; Eco Solution</p><p>• Power Supply</p><p>• AC100-240V~ 50/60Hz</p><p>• Power Consumption (Max): 170 W</p><p>• Eco Sensor: Yes</p><p>• Auto Power Off: Yes</p><p>• Auto Power Saving: Yes</p><p><br></p><p><strong>Dimension</strong></p><p>• Package Size (WxHxD): 1606 x 950 x 179 mm</p><p>• Set Size with Stand (WxHxD): 1452.9 x 879.5 x 267.4 mm</p><p>• Set Size without Stand (WxHxD): 1452.9 x 834.0 x 60.6 mm</p><p>• Stand (Basic) (WxD): 1025.5 x 267.4 mm</p><p>• Stand (Minimum) (WxD): 303.9 x 267.4 mm</p><p>• VESA Spec: 400 x 300 mm</p><p><br></p><p><strong>Weight</strong></p><p>• Package Weight: 23.0 kg</p><p>• Set Weight with Stand: 16.4 kg</p><p>• Set Weight without Stand: 15.9 kg</p>', 1, 'UA65DU7000GXXP', '', 1, 53999.00, 40088.00, '2024-05-17 13:23:20'),
	(5, 20, 'LG 25L SMART INVERTER MICROWAVE OVEN MS2535GIB', '<p><strong>Basic Spec</strong></p><p>• Brand: LG</p><p>• Type: Solo</p><p>• Installation Type: Countertop</p><p>• Door Design: Divided</p><p>• Outcase Color: Black</p><p>• Door Color: Black</p><p>• EasyClean: Yes</p><p>• Oven Capacity (L): 25</p><p><br></p><p><strong>Microwave Oven Features</strong></p><p>• Microwave Power Output (W): 1000</p><p>• Microwave Power Levels: 5</p><p>• Total Power Consumption (W): 1150</p><p>• Microwave Power Consumption (W): 1150</p><p>• Oven Capacity (L): 25</p><p>• Cavity Light Type: LED</p><p>• Turntable Size (mm): 292</p><p>• Smart Inverter: Yes</p><p><br></p><p><strong>Power / Ratings</strong></p><p>• Power Output (W): 1000</p><p>• Required Power Supply (V/Hz): 230V / 60Hz</p><p>Control Features</p><p>• Control Type: Panel Touch</p><p>• Control Display: LED</p><p>• Control Location: Right Side</p><p><br></p><p><strong>Convenience Features</strong></p><p>• Kitchen Timer: No</p><p>• Time Setting: Yes</p><p>• Completion Beeper: Yes</p><p>• Turntable On/Off: No</p><p>• Add 30 Seconds: Yes</p><p>• EasyClean: Yes</p><p>• Child Lock: Yes</p><p><br></p><p><strong>Design/Finish</strong></p><p>• Exterior Design: WideView Traditional</p><p>• Cavity Design: Square</p><p>• Door Glass Design: Clear</p><p>• Outcase Color: Black</p><p>• Door Color: Black</p><p>• Interior Color: Gray</p><p>• Printproof Finish: No</p><p><br></p><p><strong>Dimensions/Weight</strong></p><p>• Cavity Dimension (W x H x D)(mm): 322 x 228 x 335</p><p>• Product Weight (kg): 8.5</p><p>• Product Dimensions (W x H x D)(mm): 476 x 272 x 369</p><p>• Packing Dimensions (W x H x D)(mm): 540 x 294 x 417</p><p><br></p><p><strong>Smart Technology</strong></p><p>• SmartDiagnosis: Yes</p><p>Cooking Modes</p><p>• Sensor Reheat: No</p><p>• Sensor Cook: No</p><p>• Auto Reheat: No</p><p>• Auto Cook: Yes</p><p>• Memory Cook: No</p><p>• Inverter Defrost: Yes</p><p>• Air Fry: No</p><p>• Melt: Yes</p><p>• Soften: Yes</p><p>• Roast: No</p><p>• Grill: No</p><p>• Speed Grill: No</p><p>• Bake: No</p><p>• Convection Bake: No</p><p>• Speed Convection: No</p><p>• Dehydrate: No</p><p>• Warm: Yes</p><p>• Proof: Yes</p><p>• Stage Cooking: No</p><p>• Slow Cook: No</p><p>• Steam Cook: No</p><p><br></p><p><strong>Accessories</strong></p><p>• Glass Tray (Ea): 1</p><p>• Rotate Ring (Ea): 1</p><p>• Rotate Shaft (Ea): 1</p><p>• User Manual (Ea): 1</p>', 1, 'MS2535GIB', '', 1, 7695.00, 6338.00, '2024-05-17 13:34:00'),
	(7, 36, 'WHITE WESTINGHOUSE GAS RANGE WCG534K', '<p><span style="color: rgb(51, 51, 51);">• Electronic Push Button Ignition</span></p><p><span style="color: rgb(51, 51, 51);">• With Oven Lamp</span></p><p><span style="color: rgb(51, 51, 51);">• Anti-tilt Device</span></p><p><span style="color: rgb(51, 51, 51);">• Glass Lid</span></p><p><span style="color: rgb(51, 51, 51);">• 50cm Gas Range</span></p><p><span style="color: rgb(51, 51, 51);">• 3 Gas Burners Including 1 Wok Burner</span></p><p><span style="color: rgb(51, 51, 51);">• Oven Capacity: 62L</span></p>', 1, 'WCG534K', '', 1, 21495.00, 21495.00, '2024-05-21 13:59:15');


-- Dumping database structure for fiestadevproject
CREATE DATABASE IF NOT EXISTS `fiestadevproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fiestadevproject`;

-- Dumping structure for table fiestadevproject.appsysusers
CREATE TABLE IF NOT EXISTS `appsysusers` (
  `PK_appsysUsers` int NOT NULL AUTO_INCREMENT COMMENT 'AUTO GENERATED ID PER USER',
  `user_email` int NOT NULL COMMENT 'HASHED EMAIL',
  `user_password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'HASHED PASSWORD',
  `user_empId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'USER EMPLOYEE ID',
  `user_recoveryCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'HASHED RECOVERY CODE',
  `user_activationCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'HASHED ACTIVATION CODE',
  `isActivated` bit(1) DEFAULT NULL,
  `isDisabled` bit(1) DEFAULT NULL,
  `isAdmin` bit(1) DEFAULT NULL,
  `isCustomer` bit(1) DEFAULT NULL,
  `isBranchManager` bit(1) DEFAULT NULL,
  `isCreditInvestigator` bit(1) DEFAULT NULL,
  `isCreditCoordinator` bit(1) DEFAULT NULL,
  `isCashier` bit(1) DEFAULT NULL,
  `FK_geolocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'GEOLOCATION REFERENCE CODE',
  `FK_mscinfoChildrens` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FK_mscinfoRelatives` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FK_mscinfoNeighbors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`PK_appsysUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fiestadevproject.appsysusers: ~0 rows (approximately)


-- Dumping database structure for fiestappliances
CREATE DATABASE IF NOT EXISTS `fiestappliances` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fiestappliances`;

-- Dumping structure for table fiestappliances.appsysusers
CREATE TABLE IF NOT EXISTS `appsysusers` (
  `PK_appsysUsers` int NOT NULL AUTO_INCREMENT,
  `FK_mscBranches` int NOT NULL DEFAULT '0',
  `FK_mscWarehouse` int NOT NULL DEFAULT '0',
  `FK_mscSections` int NOT NULL DEFAULT '0',
  `FK_mscDivisions` int NOT NULL DEFAULT '0',
  `FK_mscPositions` int NOT NULL DEFAULT '0',
  `FK_appsysUserGroups` int NOT NULL DEFAULT '0',
  `usercode` int NOT NULL DEFAULT '0',
  `userpass` int NOT NULL DEFAULT '0',
  `passchangedate` int NOT NULL DEFAULT '0',
  `usercreatedate` int NOT NULL DEFAULT '0',
  `userlockstatus` int NOT NULL DEFAULT '0',
  `userlockdate` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PK_appsysUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fiestappliances.appsysusers: ~0 rows (approximately)


-- Dumping database structure for food_delivery
CREATE DATABASE IF NOT EXISTS `food_delivery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `food_delivery`;

-- Dumping structure for table food_delivery.user_detail
CREATE TABLE IF NOT EXISTS `user_detail` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1' COMMENT '1 = active, 2 = deleted',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table food_delivery.user_detail: ~0 rows (approximately)
INSERT INTO `user_detail` (`user_id`, `email`, `password`, `created_date`, `update_date`, `status`) VALUES
	(1, 'test@gmail.com', '123456', '2023-06-23 12:04:48', '2023-06-23 12:04:48', 1);


-- Dumping database structure for hrsystem
CREATE DATABASE IF NOT EXISTS `hrsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrsystem`;

-- Dumping structure for table hrsystem.tbl_authentication
CREATE TABLE IF NOT EXISTS `tbl_authentication` (
  `authUserID` int unsigned NOT NULL AUTO_INCREMENT,
  `authEmployeeID` varchar(50) DEFAULT NULL,
  `authUserName` varchar(255) DEFAULT NULL,
  `authUserEmail` varchar(255) DEFAULT NULL,
  `authUserPassword` longtext,
  `authUserFirstname` varchar(255) DEFAULT NULL,
  `authUserMiddleName` varchar(255) DEFAULT NULL,
  `authUserLastname` varchar(255) DEFAULT NULL,
  `authUserAlias` varchar(50) DEFAULT NULL,
  `authUserRecoveryKey` varchar(50) DEFAULT NULL,
  `authUserModified` datetime DEFAULT NULL,
  `authUserDateCreated` datetime DEFAULT NULL,
  `isAdmin` int DEFAULT NULL,
  `isEmployee` int DEFAULT NULL,
  PRIMARY KEY (`authUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hrsystem.tbl_authentication: ~0 rows (approximately)
INSERT INTO `tbl_authentication` (`authUserID`, `authEmployeeID`, `authUserName`, `authUserEmail`, `authUserPassword`, `authUserFirstname`, `authUserMiddleName`, `authUserLastname`, `authUserAlias`, `authUserRecoveryKey`, `authUserModified`, `authUserDateCreated`, `isAdmin`, `isEmployee`) VALUES
	(1, '230704', 'administrator', 'jec.floro@gmail.com', '$2y$10$tosbbovT9K6paAEPV/SLA.WxWRv2Bz1ZO/mV.HKvRcSL5eYcBfsAu', 'JECO', 'E', 'FLORO', NULL, 'shOmyPtwRp', '2024-01-23 01:44:36', '2024-01-23 01:44:37', 1, NULL);


-- Dumping database structure for inventoryms
CREATE DATABASE IF NOT EXISTS `inventoryms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventoryms`;

-- Dumping structure for table inventoryms.authentication
CREATE TABLE IF NOT EXISTS `authentication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isAdministrator` int DEFAULT NULL,
  `isEncoder` int DEFAULT NULL,
  `usercode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isVerified` int DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recovery_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table inventoryms.authentication: ~1 rows (approximately)
INSERT INTO `authentication` (`id`, `sys_id`, `isAdministrator`, `isEncoder`, `usercode`, `password`, `email`, `email_token`, `isVerified`, `remember_token`, `recovery_code`, `timestamp`) VALUES
	(5, '0-00000000', 1, NULL, '0000', '$2y$10$.m8ptE/Lj6HItt1HNUS0YOBRj1cW8JH7sh3WCgIxdvPfLckm0snIO', NULL, NULL, NULL, 'QNCek0SghtbAwMd', 'jUImoKASVz', '2023-08-31 15:07:50');


-- Dumping database structure for laravel_react
CREATE DATABASE IF NOT EXISTS `laravel_react` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel_react`;

-- Dumping structure for table laravel_react.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.cache: ~0 rows (approximately)

-- Dumping structure for table laravel_react.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.cache_locks: ~0 rows (approximately)

-- Dumping structure for table laravel_react.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_react.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_react.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.job_batches: ~0 rows (approximately)

-- Dumping structure for table laravel_react.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1);

-- Dumping structure for table laravel_react.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_react.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('11HBWTtlzYKKGAzOc3G0LTgLtEklrn7GEeZInwj3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRDZ2QlcyMGc0UU9RSUlqd0dsQ25qaEY3amRkZmV4YW00Y0Jzc2JvMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1714115878);

-- Dumping structure for table laravel_react.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_react.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Jeco', 'jec.floro@gmail.com', NULL, '$2y$12$RpOCvcJVU2z/bn/ItYu3y.YYnWkqxDENJBq4z4WSZ4UqZFMdE8gLm', NULL, '2024-04-25 23:07:46', '2024-04-25 23:07:46');


-- Dumping database structure for laravelreactfullstackdemo
CREATE DATABASE IF NOT EXISTS `laravelreactfullstackdemo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravelreactfullstackdemo`;

-- Dumping structure for table laravelreactfullstackdemo.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravelreactfullstackdemo.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravelreactfullstackdemo.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravelreactfullstackdemo.migrations: ~4 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2014_10_12_000000_create_users_table', 1),
	(6, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(7, '2019_08_19_000000_create_failed_jobs_table', 1),
	(8, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Dumping structure for table laravelreactfullstackdemo.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravelreactfullstackdemo.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laravelreactfullstackdemo.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravelreactfullstackdemo.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laravelreactfullstackdemo.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAdmin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDisabled` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravelreactfullstackdemo.users: ~0 rows (approximately)


-- Dumping database structure for nodelogin
CREATE DATABASE IF NOT EXISTS `nodelogin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nodelogin`;

-- Dumping structure for table nodelogin.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table nodelogin.accounts: ~0 rows (approximately)
INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES
	(1, 'test', 'test', 'test@test.com');

-- Dumping structure for table nodelogin.projectims
CREATE TABLE IF NOT EXISTS `projectims` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `password` longtext,
  `isAdmin` int DEFAULT NULL,
  `isUser` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table nodelogin.projectims: ~0 rows (approximately)


-- Dumping database structure for projectims
CREATE DATABASE IF NOT EXISTS `projectims` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectims`;

-- Dumping structure for table projectims.tb_authentication
CREATE TABLE IF NOT EXISTS `tb_authentication` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `isAdministrator` int DEFAULT NULL,
  `isUser` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table projectims.tb_authentication: ~1 rows (approximately)
INSERT INTO `tb_authentication` (`account_id`, `user`, `password`, `isAdministrator`, `isUser`, `timestamp`) VALUES
	(1, 'admin', '$2y$10$3lNQ79Z26n1uMio4kPDXLuNjunBjnMoTtvlW73H/oV.4g7BirK7T2', 1, NULL, '2024-01-09 09:15:17');


-- Dumping database structure for rmci.bio
CREATE DATABASE IF NOT EXISTS `rmci.bio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rmci.bio`;

-- Dumping structure for table rmci.bio.accounts_adminbiodata
CREATE TABLE IF NOT EXISTS `accounts_adminbiodata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `bio_tmp` longtext NOT NULL,
  `bio_no` int DEFAULT NULL,
  `bio_index` int DEFAULT NULL,
  `bio_type` int NOT NULL,
  `major_ver` varchar(30) NOT NULL,
  `minor_ver` varchar(30) DEFAULT NULL,
  `bio_format` int DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `duress` tinyint(1) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_adminbiodata_admin_id_1e6d2d45_fk_auth_user_id` (`admin_id`),
  CONSTRAINT `accounts_adminbiodata_admin_id_1e6d2d45_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.accounts_adminbiodata: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.accounts_usernotification
CREATE TABLE IF NOT EXISTS `accounts_usernotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `read_time` datetime(6) DEFAULT NULL,
  `status` smallint NOT NULL,
  `user_id` int NOT NULL,
  `category` int DEFAULT NULL,
  `event` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_usernotification_user_id_b86755b3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `accounts_usernotification_user_id_b86755b3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.accounts_usernotification: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.acc_acccombination
CREATE TABLE IF NOT EXISTS `acc_acccombination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `combination_no` int NOT NULL,
  `combination_name` varchar(100) NOT NULL,
  `group1` int DEFAULT NULL,
  `group2` int DEFAULT NULL,
  `group3` int DEFAULT NULL,
  `group4` int DEFAULT NULL,
  `group5` int DEFAULT NULL,
  `remark` varchar(999) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_acccombination_area_id_combination_no_619eb4f5_uniq` (`area_id`,`combination_no`),
  KEY `acc_acccombination_area_id_0d22c34e` (`area_id`),
  CONSTRAINT `acc_acccombination_area_id_0d22c34e_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.acc_acccombination: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.acc_accgroups
CREATE TABLE IF NOT EXISTS `acc_accgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `group_no` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `verify_mode` int NOT NULL,
  `timezone1` int DEFAULT NULL,
  `timezone2` int DEFAULT NULL,
  `timezone3` int DEFAULT NULL,
  `is_include_holiday` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_accgroups_area_id_group_no_5130a89c_uniq` (`area_id`,`group_no`),
  KEY `acc_accgroups_area_id_b83745c3` (`area_id`),
  CONSTRAINT `acc_accgroups_area_id_b83745c3_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.acc_accgroups: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.acc_accholiday
CREATE TABLE IF NOT EXISTS `acc_accholiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  `holiday_id` int NOT NULL,
  `timezone_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_accholiday_area_id_holiday_id_6630c2eb_uniq` (`area_id`,`holiday_id`),
  KEY `acc_accholiday_area_id_d15c19da` (`area_id`),
  KEY `acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id` (`holiday_id`),
  KEY `acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id` (`timezone_id`),
  CONSTRAINT `acc_accholiday_area_id_d15c19da_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  CONSTRAINT `acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `att_holiday` (`id`),
  CONSTRAINT `acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id` FOREIGN KEY (`timezone_id`) REFERENCES `acc_acctimezone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.acc_accholiday: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.acc_accprivilege
CREATE TABLE IF NOT EXISTS `acc_accprivilege` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `is_group_timezone` smallint NOT NULL,
  `timezone1` int DEFAULT NULL,
  `timezone2` int DEFAULT NULL,
  `timezone3` int DEFAULT NULL,
  `is_group_verifycode` smallint NOT NULL,
  `verify_mode` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_accprivilege_area_id_employee_id_group_id_f3b297d8_uniq` (`area_id`,`employee_id`,`group_id`),
  KEY `acc_accprivilege_area_id_2123ff6f` (`area_id`),
  KEY `acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id` (`employee_id`),
  KEY `acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id` (`group_id`),
  CONSTRAINT `acc_accprivilege_area_id_2123ff6f_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  CONSTRAINT `acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id` FOREIGN KEY (`group_id`) REFERENCES `acc_accgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.acc_accprivilege: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.acc_accterminal
CREATE TABLE IF NOT EXISTS `acc_accterminal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `door_name` varchar(50) DEFAULT NULL,
  `door_lock_delay` int NOT NULL,
  `door_sensor_delay` int NOT NULL,
  `door_sensor_type` smallint NOT NULL,
  `door_alarm_delay` int NOT NULL,
  `retry_times` smallint NOT NULL,
  `valid_holiday` smallint NOT NULL,
  `nc_time_period` int NOT NULL,
  `no_time_period` int NOT NULL,
  `speaker_alarm` smallint NOT NULL,
  `duress_fun_on` smallint NOT NULL,
  `alarm_1_1` smallint NOT NULL,
  `alarm_1_n` smallint NOT NULL,
  `alarm_password` smallint NOT NULL,
  `duress_alarm_delay` int NOT NULL,
  `anti_passback_mode` smallint NOT NULL,
  `anti_door_direction` smallint NOT NULL,
  `verify_mode_485` smallint NOT NULL,
  `push_time` datetime(6) DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id` (`terminal_id`),
  CONSTRAINT `acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.acc_accterminal: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.acc_acctimezone
CREATE TABLE IF NOT EXISTS `acc_acctimezone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `timezone_no` int NOT NULL,
  `timezone_name` varchar(100) NOT NULL,
  `sun_start` time(6) NOT NULL,
  `sun_end` time(6) NOT NULL,
  `sun_on` smallint DEFAULT NULL,
  `mon_start` time(6) NOT NULL,
  `mon_end` time(6) NOT NULL,
  `mon_on` smallint DEFAULT NULL,
  `tue_start` time(6) NOT NULL,
  `tue_end` time(6) NOT NULL,
  `tue_on` smallint DEFAULT NULL,
  `wed_start` time(6) NOT NULL,
  `wed_end` time(6) NOT NULL,
  `wed_on` smallint DEFAULT NULL,
  `thu_start` time(6) NOT NULL,
  `thu_end` time(6) NOT NULL,
  `thu_on` smallint DEFAULT NULL,
  `fri_start` time(6) NOT NULL,
  `fri_end` time(6) NOT NULL,
  `fri_on` smallint DEFAULT NULL,
  `sat_start` time(6) NOT NULL,
  `sat_end` time(6) NOT NULL,
  `sat_on` smallint DEFAULT NULL,
  `remark` varchar(999) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_acctimezone_area_id_timezone_no_0cb8250f_uniq` (`area_id`,`timezone_no`),
  KEY `acc_acctimezone_area_id_e9ce7a7a` (`area_id`),
  CONSTRAINT `acc_acctimezone_area_id_e9ce7a7a_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.acc_acctimezone: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.attparam
CREATE TABLE IF NOT EXISTS `attparam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paraname` varchar(30) NOT NULL,
  `paratype` varchar(10) DEFAULT NULL,
  `paravalue` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attparam_paraname_paratype_6f176d25_uniq` (`paraname`,`paratype`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.attparam: ~24 rows (approximately)
INSERT INTO `attparam` (`id`, `paraname`, `paratype`, `paravalue`) VALUES
	(1, 'ruleID', 'rule_0', '0'),
	(2, 'DeptID', 'rule_0', '0'),
	(3, 'ApplyName', 'rule_0', 'All'),
	(4, 'ruleName', 'rule_0', 'Default Attendance Rules'),
	(5, 'MinsEarly', 'rule_0', '0'),
	(6, 'MinsLate', 'rule_0', '0'),
	(7, 'MinsNoBreakIn', 'rule_0', '60'),
	(8, 'MinsNoBreakOut', 'rule_0', '60'),
	(9, 'MinsNoIn', 'rule_0', '60'),
	(10, 'MinsNoLeave', 'rule_0', '60'),
	(11, 'MinsNotOverTime', 'rule_0', '60'),
	(12, 'MinsWorkDay', 'rule_0', '480'),
	(13, 'NoBreakIn', 'rule_0', '1012'),
	(14, 'NoBreakOut', 'rule_0', '1012'),
	(15, 'NoIn', 'rule_0', '1001'),
	(16, 'NoLeave', 'rule_0', '1002'),
	(17, 'OutOverTime', 'rule_0', '0'),
	(18, 'TwoDay', 'rule_0', '0'),
	(19, 'CheckInColor', 'rule_0', '16777151'),
	(20, 'CheckOutColor', 'rule_0', '12910591'),
	(21, 'DBVersion', '', '2002'),
	(22, 'InstallDate', '', '495f4A6bK-cEvJLEsGVOJ_Vo7qmdamAqdCP19crHvVPsf2KW3-qg'),
	(23, 'SysDate', '', '495f4A6bK-cEvJLEsGVOJ_Vo7qmdamAqdCP19crHvVPsf2KW3-qg'),
	(24, 'ADMSDBVersion', '', '544;');

-- Dumping structure for table rmci.bio.att_attcalclog
CREATE TABLE IF NOT EXISTS `att_attcalclog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `log_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attcalclog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_attcode
CREATE TABLE IF NOT EXISTS `att_attcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `display_format` smallint NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `round_off` smallint NOT NULL,
  `min_val` decimal(4,1) NOT NULL,
  `symbol_only` tinyint(1) NOT NULL,
  `order` smallint NOT NULL,
  `color_setting` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attcode: ~20 rows (approximately)
INSERT INTO `att_attcode` (`id`, `code`, `alias`, `display_format`, `symbol`, `round_off`, `min_val`, `symbol_only`, `order`, `color_setting`) VALUES
	(1, 'duration', 'Duration', 4, '', 1, 0.1, 0, 1, NULL),
	(2, 'duty_duration', 'Duty Duration', 4, '', 1, 0.1, 0, 2, NULL),
	(3, 'total_hrs', 'Total Hours', 4, '', 1, 0.1, 0, 3, NULL),
	(4, 'worked_hrs', 'Worked Hours', 4, '', 1, 0.1, 0, 4, NULL),
	(5, 'actual_worked', 'Actual Worked Hours', 4, '', 1, 0.1, 0, 5, NULL),
	(6, 'break_duration', 'Break Duration', 4, '', 1, 0.1, 0, 6, NULL),
	(7, 'break_total_hrs', 'Break Total Hours', 4, '', 1, 0.1, 0, 7, NULL),
	(8, 'break_hrs', 'Break Hours', 4, '', 1, 0.1, 0, 8, NULL),
	(9, 'actual_break', 'Actual Break Hours', 4, '', 1, 0.1, 0, 9, NULL),
	(10, 'approval_hrs', 'Approval Hours', 4, '', 1, 0.1, 0, 10, NULL),
	(11, 'early_in', 'Early In', 4, '', 1, 0.1, 0, 11, NULL),
	(12, 'late_out', 'Late Out', 4, '', 1, 0.1, 0, 12, NULL),
	(13, 'unschedule', 'Unscheduled', 4, '', 1, 0.1, 0, 13, NULL),
	(14, 'remaining', 'Remaining', 4, '', 1, 0.1, 0, 14, NULL),
	(15, 'total_ot', 'Total OT', 4, '', 1, 0.1, 0, 15, NULL),
	(16, 'rule_total_ot', 'Rule Total OT', 4, '', 1, 0.1, 0, 16, NULL),
	(17, 'total_leave', 'Total Leaves', 2, '', 1, 0.1, 0, 17, NULL),
	(18, 'day_off', 'Day Off', 0, 'Off', 0, 0.1, 1, 18, NULL),
	(19, 'weekend', 'Weekend', 0, 'W', 0, 0.1, 1, 19, NULL),
	(20, 'holiday', 'Holiday', 0, 'H', 0, 0.1, 1, 20, NULL);

-- Dumping structure for table rmci.bio.att_attemployee
CREATE TABLE IF NOT EXISTS `att_attemployee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `enable_attendance` tinyint(1) NOT NULL,
  `enable_schedule` tinyint(1) NOT NULL,
  `enable_overtime` tinyint(1) NOT NULL,
  `enable_holiday` tinyint(1) NOT NULL,
  `emp_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_id` (`emp_id`),
  KEY `att_attemployee_group_id_18d3954d_fk_att_attgroup_id` (`group_id`),
  CONSTRAINT `att_attemployee_emp_id_52457e3c_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_attemployee_group_id_18d3954d_fk_att_attgroup_id` FOREIGN KEY (`group_id`) REFERENCES `att_attgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attemployee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_attgroup
CREATE TABLE IF NOT EXISTS `att_attgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attgroup: ~0 rows (approximately)
INSERT INTO `att_attgroup` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `code`, `name`) VALUES
	(1, '2024-08-16 15:04:12.465603', NULL, '2024-08-16 15:04:12.465603', NULL, 0, '1', 'default');

-- Dumping structure for table rmci.bio.att_attpolicy
CREATE TABLE IF NOT EXISTS `att_attpolicy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `use_ot` smallint NOT NULL,
  `weekend1` smallint NOT NULL,
  `weekend2` smallint NOT NULL,
  `start_of_week` smallint NOT NULL,
  `max_hrs` decimal(4,1) NOT NULL,
  `day_change` time(6) NOT NULL,
  `paring_rule` smallint NOT NULL,
  `punch_period` smallint NOT NULL,
  `daily_ot` tinyint(1) NOT NULL,
  `daily_ot_rule` char(32) DEFAULT NULL,
  `weekly_ot` tinyint(1) NOT NULL,
  `weekly_ot_rule` char(32) DEFAULT NULL,
  `weekend_ot` tinyint(1) NOT NULL,
  `weekend_ot_rule` char(32) DEFAULT NULL,
  `holiday_ot` tinyint(1) NOT NULL,
  `holiday_ot_rule` char(32) DEFAULT NULL,
  `late_in2absence` int NOT NULL,
  `early_out2absence` int NOT NULL,
  `miss_in` smallint NOT NULL,
  `late_in_hrs` int NOT NULL,
  `miss_out` smallint NOT NULL,
  `early_out_hrs` int NOT NULL,
  `require_capture` tinyint(1) NOT NULL,
  `require_work_code` tinyint(1) NOT NULL,
  `require_punch_state` tinyint(1) NOT NULL,
  `email_send_time` time(6) NOT NULL,
  `global_frequency` smallint NOT NULL,
  `global_send_day` smallint NOT NULL,
  `max_absent` smallint NOT NULL,
  `max_early_out` smallint NOT NULL,
  `max_late_in` smallint NOT NULL,
  `sending_day` smallint NOT NULL,
  `weekend1_color_setting` varchar(30) DEFAULT NULL,
  `weekend2_color_setting` varchar(30) DEFAULT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_attpolicy_ot_pay_code_id_b189b952_fk_att_paycode_id` (`ot_pay_code_id`),
  CONSTRAINT `att_attpolicy_ot_pay_code_id_b189b952_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attpolicy: ~0 rows (approximately)
INSERT INTO `att_attpolicy` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `use_ot`, `weekend1`, `weekend2`, `start_of_week`, `max_hrs`, `day_change`, `paring_rule`, `punch_period`, `daily_ot`, `daily_ot_rule`, `weekly_ot`, `weekly_ot_rule`, `weekend_ot`, `weekend_ot_rule`, `holiday_ot`, `holiday_ot_rule`, `late_in2absence`, `early_out2absence`, `miss_in`, `late_in_hrs`, `miss_out`, `early_out_hrs`, `require_capture`, `require_work_code`, `require_punch_state`, `email_send_time`, `global_frequency`, `global_send_day`, `max_absent`, `max_early_out`, `max_late_in`, `sending_day`, `weekend1_color_setting`, `weekend2_color_setting`, `ot_pay_code_id`, `overtime_policy`, `enable_compensatory`) VALUES
	(1, '2024-08-16 15:04:12.481603', NULL, '2024-08-16 15:04:12.481603', NULL, 0, 1, 7, 7, 0, 12.0, '00:00:00.000000', 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 100, 100, 1, 60, 1, 60, 0, 0, 0, '00:00:00.000000', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, -1, 0);

-- Dumping structure for table rmci.bio.att_attreportsetting
CREATE TABLE IF NOT EXISTS `att_attreportsetting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resign_emp` smallint NOT NULL,
  `short_date` smallint NOT NULL,
  `short_time` smallint NOT NULL,
  `filter_by_hire_date` tinyint(1) NOT NULL,
  `auto_calculate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attreportsetting: ~0 rows (approximately)
INSERT INTO `att_attreportsetting` (`id`, `resign_emp`, `short_date`, `short_time`, `filter_by_hire_date`, `auto_calculate`) VALUES
	(1, 1, 1, 1, 1, 0);

-- Dumping structure for table rmci.bio.att_attrule
CREATE TABLE IF NOT EXISTS `att_attrule` (
  `param_name` varchar(20) NOT NULL,
  `param_value` longtext NOT NULL,
  PRIMARY KEY (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attrule: ~0 rows (approximately)
INSERT INTO `att_attrule` (`param_name`, `param_value`) VALUES
	('global_att_rule', '{"in_rule": 1, "out_rule": 1, "use_ot": 1, "punch_period": 1, "weekend": [], "mins_late_absent": 100, "mins_early_absent": 100, "miss_in": 1, "miss_in_mins": 60, "miss_out": 1, "miss_out_mins": 60, "leave_include_in": 2, "leave_include_out": 2, "training_include_in": 2, "training_include_out": 2, "check_in": "0", "check_out": "1", "break_out": "2", "break_in": "3", "overtime_in": "4", "overtime_out": "5", "enable_capture": 0, "enable_workcode": 0, "enable_funckey": 0}');

-- Dumping structure for table rmci.bio.att_attschedule
CREATE TABLE IF NOT EXISTS `att_attschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` int NOT NULL,
  `shift_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_attschedule_employee_id_caa61686_fk_personnel_employee_id` (`employee_id`),
  KEY `att_attschedule_shift_id_13d2db9a_fk_att_attshift_id` (`shift_id`),
  CONSTRAINT `att_attschedule_employee_id_caa61686_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_attschedule_shift_id_13d2db9a_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_attshift
CREATE TABLE IF NOT EXISTS `att_attshift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `cycle_unit` smallint NOT NULL,
  `shift_cycle` int NOT NULL,
  `work_weekend` tinyint(1) NOT NULL,
  `weekend_type` smallint NOT NULL,
  `work_day_off` tinyint(1) NOT NULL,
  `day_off_type` smallint NOT NULL,
  `auto_shift` smallint NOT NULL,
  `enable_ot_rule` tinyint(1) NOT NULL,
  `frequency` smallint NOT NULL,
  `ot_rule` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_attshift: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_breaktime
CREATE TABLE IF NOT EXISTS `att_breaktime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `period_start` time(6) NOT NULL,
  `duration` int NOT NULL,
  `end_margin` int NOT NULL,
  `func_key` smallint NOT NULL,
  `available_interval_type` smallint NOT NULL,
  `available_interval` int NOT NULL,
  `multiple_punch` smallint NOT NULL,
  `calc_type` smallint NOT NULL,
  `minimum_duration` int DEFAULT NULL,
  `early_in` smallint NOT NULL,
  `late_in` smallint NOT NULL,
  `profit_rule` tinyint(1) NOT NULL,
  `min_early_in` int NOT NULL,
  `loss_rule` tinyint(1) NOT NULL,
  `min_late_in` int NOT NULL,
  `loss_code_id` int DEFAULT NULL,
  `profit_code_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `att_breaktime_alias_6212d9cf_uniq` (`alias`),
  KEY `att_breaktime_loss_code_id_2ffb5432_fk_att_paycode_id` (`loss_code_id`),
  KEY `att_breaktime_profit_code_id_63cdbbcc_fk_att_paycode_id` (`profit_code_id`),
  CONSTRAINT `att_breaktime_loss_code_id_2ffb5432_fk_att_paycode_id` FOREIGN KEY (`loss_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `att_breaktime_profit_code_id_63cdbbcc_fk_att_paycode_id` FOREIGN KEY (`profit_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_breaktime: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_calculatelastdate
CREATE TABLE IF NOT EXISTS `att_calculatelastdate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_calculatelastdate_last_date_1441abdc` (`last_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_calculatelastdate: ~0 rows (approximately)
INSERT INTO `att_calculatelastdate` (`id`, `last_date`) VALUES
	(1, '2024-08-19 00:40:00.980429');

-- Dumping structure for table rmci.bio.att_calculatetask
CREATE TABLE IF NOT EXISTS `att_calculatetask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp` int NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `event` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_calculatetask_start_date_7bbaa889` (`start_date`),
  KEY `att_calculatetask_end_date_75d1d6d2` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_calculatetask: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_changeschedule
CREATE TABLE IF NOT EXISTS `att_changeschedule` (
  `workflowinstance_ptr_id` int NOT NULL,
  `att_date` date NOT NULL,
  `previous_timeinterval` varchar(100) DEFAULT NULL,
  `apply_time` datetime(6) NOT NULL,
  `apply_reason` varchar(200) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `timeinterval_id` int NOT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  KEY `att_changeschedule_timeinterval_id_d41ac077_fk_att_timei` (`timeinterval_id`),
  CONSTRAINT `att_changeschedule_timeinterval_id_d41ac077_fk_att_timei` FOREIGN KEY (`timeinterval_id`) REFERENCES `att_timeinterval` (`id`),
  CONSTRAINT `att_changeschedule_workflowinstance_ptr_cee602bb_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_changeschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_departmentpolicy
CREATE TABLE IF NOT EXISTS `att_departmentpolicy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `use_ot` smallint NOT NULL,
  `weekend1` smallint NOT NULL,
  `weekend2` smallint NOT NULL,
  `start_of_week` smallint NOT NULL,
  `max_hrs` decimal(4,1) NOT NULL,
  `day_change` time(6) NOT NULL,
  `paring_rule` smallint NOT NULL,
  `punch_period` smallint NOT NULL,
  `daily_ot` tinyint(1) NOT NULL,
  `daily_ot_rule` char(32) DEFAULT NULL,
  `weekly_ot` tinyint(1) NOT NULL,
  `weekly_ot_rule` char(32) DEFAULT NULL,
  `weekend_ot` tinyint(1) NOT NULL,
  `weekend_ot_rule` char(32) DEFAULT NULL,
  `holiday_ot` tinyint(1) NOT NULL,
  `holiday_ot_rule` char(32) DEFAULT NULL,
  `late_in2absence` int NOT NULL,
  `early_out2absence` int NOT NULL,
  `miss_in` smallint NOT NULL,
  `late_in_hrs` int NOT NULL,
  `miss_out` smallint NOT NULL,
  `early_out_hrs` int NOT NULL,
  `require_capture` tinyint(1) NOT NULL,
  `require_work_code` tinyint(1) NOT NULL,
  `require_punch_state` tinyint(1) NOT NULL,
  `department_id` int NOT NULL,
  `dept_frequency` smallint NOT NULL,
  `dept_send_day` smallint NOT NULL,
  `email_send_time` time(6) NOT NULL,
  `max_absent` smallint NOT NULL,
  `max_early_out` smallint NOT NULL,
  `max_late_in` smallint NOT NULL,
  `sending_day` smallint NOT NULL,
  `weekend1_color_setting` varchar(30) DEFAULT NULL,
  `weekend2_color_setting` varchar(30) DEFAULT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_departmentpolicy_department_id_77059a9d_fk_personnel` (`department_id`),
  KEY `att_departmentpolicy_ot_pay_code_id_390411dd_fk_att_paycode_id` (`ot_pay_code_id`),
  CONSTRAINT `att_departmentpolicy_department_id_77059a9d_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  CONSTRAINT `att_departmentpolicy_ot_pay_code_id_390411dd_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_departmentpolicy: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_departmentschedule
CREATE TABLE IF NOT EXISTS `att_departmentschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `department_id` int NOT NULL,
  `shift_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_departmentschedu_department_id_c68fca3d_fk_personnel` (`department_id`),
  KEY `att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id` (`shift_id`),
  CONSTRAINT `att_departmentschedu_department_id_c68fca3d_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  CONSTRAINT `att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_departmentschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_deptattrule
CREATE TABLE IF NOT EXISTS `att_deptattrule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `rule` longtext,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_deptattrule_department_id_f333c8f0` (`department_id`),
  CONSTRAINT `att_deptattrule_department_id_f333c8f0_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_deptattrule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_grouppolicy
CREATE TABLE IF NOT EXISTS `att_grouppolicy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `use_ot` smallint NOT NULL,
  `weekend1` smallint NOT NULL,
  `weekend2` smallint NOT NULL,
  `start_of_week` smallint NOT NULL,
  `max_hrs` decimal(4,1) NOT NULL,
  `day_change` time(6) NOT NULL,
  `paring_rule` smallint NOT NULL,
  `punch_period` smallint NOT NULL,
  `daily_ot` tinyint(1) NOT NULL,
  `daily_ot_rule` char(32) DEFAULT NULL,
  `weekly_ot` tinyint(1) NOT NULL,
  `weekly_ot_rule` char(32) DEFAULT NULL,
  `weekend_ot` tinyint(1) NOT NULL,
  `weekend_ot_rule` char(32) DEFAULT NULL,
  `holiday_ot` tinyint(1) NOT NULL,
  `holiday_ot_rule` char(32) DEFAULT NULL,
  `late_in2absence` int NOT NULL,
  `early_out2absence` int NOT NULL,
  `miss_in` smallint NOT NULL,
  `late_in_hrs` int NOT NULL,
  `miss_out` smallint NOT NULL,
  `early_out_hrs` int NOT NULL,
  `require_capture` tinyint(1) NOT NULL,
  `require_work_code` tinyint(1) NOT NULL,
  `require_punch_state` tinyint(1) NOT NULL,
  `group_id` int NOT NULL,
  `email_send_time` time(6) NOT NULL,
  `group_frequency` smallint NOT NULL,
  `group_send_day` smallint NOT NULL,
  `max_absent` smallint NOT NULL,
  `max_early_out` smallint NOT NULL,
  `max_late_in` smallint NOT NULL,
  `sending_day` smallint NOT NULL,
  `weekend1_color_setting` varchar(30) DEFAULT NULL,
  `weekend2_color_setting` varchar(30) DEFAULT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_grouppolicy_group_id_b2e4dfe8_fk_att_attgroup_id` (`group_id`),
  KEY `att_grouppolicy_ot_pay_code_id_1ec83080_fk_att_paycode_id` (`ot_pay_code_id`),
  CONSTRAINT `att_grouppolicy_group_id_b2e4dfe8_fk_att_attgroup_id` FOREIGN KEY (`group_id`) REFERENCES `att_attgroup` (`id`),
  CONSTRAINT `att_grouppolicy_ot_pay_code_id_1ec83080_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_grouppolicy: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_groupschedule
CREATE TABLE IF NOT EXISTS `att_groupschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `group_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_groupschedule_group_id_c341493f_fk_att_attgroup_id` (`group_id`),
  KEY `att_groupschedule_shift_id_287e7fc0_fk_att_attshift_id` (`shift_id`),
  KEY `att_groupschedule_start_date_638b6d85` (`start_date`),
  CONSTRAINT `att_groupschedule_group_id_c341493f_fk_att_attgroup_id` FOREIGN KEY (`group_id`) REFERENCES `att_attgroup` (`id`),
  CONSTRAINT `att_groupschedule_shift_id_287e7fc0_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_groupschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_holiday
CREATE TABLE IF NOT EXISTS `att_holiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `duration_day` smallint NOT NULL,
  `enable_ot_rule` tinyint(1) NOT NULL,
  `ot_rule` char(32) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `att_group_id` int DEFAULT NULL,
  `color_setting` varchar(30) DEFAULT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_holiday_department_id_fbbbd185` (`department_id`),
  KEY `att_holiday_att_group_id_9ddf13ba_fk_att_attgroup_id` (`att_group_id`),
  CONSTRAINT `att_holiday_att_group_id_9ddf13ba_fk_att_attgroup_id` FOREIGN KEY (`att_group_id`) REFERENCES `att_attgroup` (`id`),
  CONSTRAINT `att_holiday_department_id_fbbbd185_fk_personnel_department_id` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_holiday: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_leave
CREATE TABLE IF NOT EXISTS `att_leave` (
  `workflowinstance_ptr_id` int NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  `leave_day` double NOT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  KEY `att_leave_pay_code_id_2fadf493_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `att_leave_pay_code_id_2fadf493_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `att_leave_workflowinstance_ptr_39aaa9d9_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_leave: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_leavegroup
CREATE TABLE IF NOT EXISTS `att_leavegroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_leavegroup: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_leavegroupdetail
CREATE TABLE IF NOT EXISTS `att_leavegroupdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `leave_type` int NOT NULL,
  `allow_leave_day` int NOT NULL,
  `min_leave_day` double NOT NULL,
  `deduct_holiday_day` smallint NOT NULL,
  `leave_entitlement` int DEFAULT NULL,
  `leave_interval` int NOT NULL,
  `leave_distribution_time` int DEFAULT NULL,
  `start_day` varchar(5) NOT NULL,
  `set_hire_day` smallint NOT NULL,
  `allow_exceed_limit` smallint NOT NULL,
  `allow_balance` smallint NOT NULL,
  `max_balance` int DEFAULT NULL,
  `entitlement_detail` varchar(999) DEFAULT NULL,
  `leave_group_id` int NOT NULL,
  `pay_code_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_leavegroupdetail_leave_group_id_28f69ada_fk_att_leave` (`leave_group_id`),
  KEY `att_leavegroupdetail_pay_code_id_5013b373_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `att_leavegroupdetail_leave_group_id_28f69ada_fk_att_leave` FOREIGN KEY (`leave_group_id`) REFERENCES `att_leavegroup` (`id`),
  CONSTRAINT `att_leavegroupdetail_pay_code_id_5013b373_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_leavegroupdetail: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_leaveyearbalance
CREATE TABLE IF NOT EXISTS `att_leaveyearbalance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `leave_type` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `entitlement_days` smallint DEFAULT NULL,
  `leave_day` double DEFAULT NULL,
  `pre_balance` smallint DEFAULT NULL,
  `employee_id` int NOT NULL,
  `pay_code_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `att_leaveyearbalance_employee_id_year_pay_code_id_2ec71517_uniq` (`employee_id`,`year`,`pay_code_id`),
  KEY `att_leaveyearbalance_pay_code_id_82632aca_fk_att_paycode_id` (`pay_code_id`),
  KEY `att_leaveyearbalance_employee_id_14febdb3` (`employee_id`),
  CONSTRAINT `att_leaveyearbalance_employee_id_14febdb3_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_leaveyearbalance_pay_code_id_82632aca_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_leaveyearbalance: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_manuallog
CREATE TABLE IF NOT EXISTS `att_manuallog` (
  `workflowinstance_ptr_id` int NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `work_code` varchar(20) DEFAULT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  CONSTRAINT `att_manuallog_workflowinstance_ptr_22a3fbd0_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_manuallog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_overtime
CREATE TABLE IF NOT EXISTS `att_overtime` (
  `workflowinstance_ptr_id` int NOT NULL,
  `overtime_type` smallint NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  KEY `att_overtime_pay_code_id_05600ee0_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `att_overtime_pay_code_id_05600ee0_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `att_overtime_workflowinstance_ptr_6bd6a6f4_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_overtime: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_overtimepolicy
CREATE TABLE IF NOT EXISTS `att_overtimepolicy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `mode` smallint NOT NULL,
  `hrs_from` decimal(4,1) NOT NULL,
  `hrs_to` decimal(4,1) NOT NULL,
  `master` char(32) NOT NULL,
  `overnight_pay_code_id` int DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_overtimepolicy_overnight_pay_code_i_274ce1b0_fk_att_payco` (`overnight_pay_code_id`),
  KEY `att_overtimepolicy_pay_code_id_285b0a61_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `att_overtimepolicy_overnight_pay_code_i_274ce1b0_fk_att_payco` FOREIGN KEY (`overnight_pay_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `att_overtimepolicy_pay_code_id_285b0a61_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_overtimepolicy: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_paycode
CREATE TABLE IF NOT EXISTS `att_paycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code_type` smallint NOT NULL,
  `tag` smallint DEFAULT NULL,
  `fixed_code` smallint DEFAULT NULL,
  `is_work` tinyint(1) NOT NULL,
  `fixed_hours` decimal(8,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `is_benefit` tinyint(1) NOT NULL,
  `round_off` smallint NOT NULL,
  `min_val` decimal(4,1) NOT NULL,
  `display_format` smallint NOT NULL,
  `symbol` varchar(20) DEFAULT NULL,
  `display_order` smallint NOT NULL,
  `desc` longtext,
  `is_display` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `color_setting` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_paycode: ~18 rows (approximately)
INSERT INTO `att_paycode` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `code`, `name`, `code_type`, `tag`, `fixed_code`, `is_work`, `fixed_hours`, `is_paid`, `is_benefit`, `round_off`, `min_val`, `display_format`, `symbol`, `display_order`, `desc`, `is_display`, `is_default`, `color_setting`) VALUES
	(1, '2024-08-16 15:04:12.355644', NULL, '2024-08-16 15:04:12.355644', NULL, 0, 'REG', 'Regular', 1, NULL, 1, 1, 8.00, 1, 0, 1, 0.1, 2, 'P', 1, NULL, 1, 1, NULL),
	(2, '2024-08-16 15:04:12.358643', NULL, '2024-08-16 15:04:12.358643', NULL, 0, 'L', 'Late In', 4, NULL, 2, 1, 8.00, 1, 0, 1, 1.0, 1, 'L', 2, NULL, 1, 1, NULL),
	(3, '2024-08-16 15:04:12.361644', NULL, '2024-08-16 15:04:12.361644', NULL, 0, 'E', 'Early Out', 4, NULL, 3, 1, 8.00, 1, 0, 1, 1.0, 1, 'E', 3, NULL, 1, 1, NULL),
	(4, '2024-08-16 15:04:12.363673', NULL, '2024-08-16 15:04:12.363673', NULL, 0, 'A', 'Absence', 4, NULL, 4, 1, 8.00, 1, 0, 1, 0.1, 2, 'A', 4, NULL, 1, 1, NULL),
	(5, '2024-08-16 15:04:12.366680', NULL, '2024-08-16 15:04:12.366680', NULL, 0, 'NOT', 'Normal OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 5, NULL, 1, 1, NULL),
	(6, '2024-08-16 15:04:12.368681', NULL, '2024-08-16 15:04:12.368681', NULL, 0, 'WOT', 'Weekend OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 6, NULL, 1, 1, NULL),
	(7, '2024-08-16 15:04:12.371681', NULL, '2024-08-16 15:04:12.371681', NULL, 0, 'HOT', 'Holiday OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 7, NULL, 1, 1, NULL),
	(8, '2024-08-16 15:04:12.374757', NULL, '2024-08-16 15:04:12.374757', NULL, 0, 'OT1', 'OT1', 2, 6, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 8, NULL, 1, 1, NULL),
	(9, '2024-08-16 15:04:12.376782', NULL, '2024-08-16 15:04:12.376782', NULL, 0, 'OT2', 'OT2', 2, 7, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 9, NULL, 1, 1, NULL),
	(10, '2024-08-16 15:04:12.379796', NULL, '2024-08-16 15:04:12.379796', NULL, 0, 'OT3', 'OT3', 2, 8, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 10, NULL, 1, 1, NULL),
	(11, '2024-08-16 15:04:12.381797', NULL, '2024-08-16 15:04:12.381797', NULL, 0, 'AL', 'Annual Leave', 3, NULL, NULL, 0, 8.00, 1, 1, 1, 0.1, 2, '', 11, NULL, 1, 1, NULL),
	(12, '2024-08-16 15:04:12.382797', NULL, '2024-08-16 15:04:12.382797', NULL, 0, 'SL', 'Sick Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 12, NULL, 1, 1, NULL),
	(13, '2024-08-16 15:04:12.384797', NULL, '2024-08-16 15:04:12.384797', NULL, 0, 'CL', 'Casual Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 13, NULL, 1, 1, NULL),
	(14, '2024-08-16 15:04:12.386800', NULL, '2024-08-16 15:04:12.386800', NULL, 0, 'ML', 'Maternity Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 14, NULL, 1, 1, NULL),
	(15, '2024-08-16 15:04:12.388303', NULL, '2024-08-16 15:04:12.388303', NULL, 0, 'COL', 'Compassionate Leave', 3, NULL, NULL, 0, 8.00, 0, 0, 1, 0.1, 2, '', 15, NULL, 1, 1, NULL),
	(16, '2024-08-16 15:04:12.390310', NULL, '2024-08-16 15:04:12.390310', NULL, 0, 'BT', 'Business Trip', 3, NULL, NULL, 0, 8.00, 0, 0, 1, 0.1, 2, '', 16, NULL, 1, 1, NULL),
	(17, '2024-08-16 15:04:12.392309', NULL, '2024-08-16 15:04:12.392309', NULL, 0, 'CP', 'Compensatory', 1, NULL, 5, 0, 8.00, 0, 0, 1, 0.1, 2, '', 17, NULL, 1, 1, NULL),
	(18, '2024-08-16 15:04:12.394309', NULL, '2024-08-16 15:04:12.394309', NULL, 0, 'CPL', 'Compensatory Leave', 3, NULL, 6, 0, 8.00, 0, 0, 1, 0.1, 2, '', 18, NULL, 1, 1, NULL);

-- Dumping structure for table rmci.bio.att_payloadattcode
CREATE TABLE IF NOT EXISTS `att_payloadattcode` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `week` int NOT NULL,
  `weekday` int NOT NULL,
  `att_code_alias` varchar(50) NOT NULL,
  `att_code_symbol` varchar(20) DEFAULT NULL,
  `duration` int NOT NULL,
  `workday` decimal(4,1) NOT NULL,
  `hours` decimal(6,1) NOT NULL,
  `minutes` decimal(8,1) NOT NULL,
  `is_weekly` tinyint(1) NOT NULL,
  `att_code_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  `time_card_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_payloadattcode_att_code_id_0d635efd_fk_att_attcode_id` (`att_code_id`),
  KEY `att_payloadattcode_emp_id_36569f54_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadattcode_shift_id_731faddf_fk_att_attshift_id` (`shift_id`),
  KEY `att_payloadattcode_att_date_19b2621e` (`att_date`),
  KEY `att_payloadattcode_time_card_id_e8a37c7a` (`time_card_id`),
  CONSTRAINT `att_payloadattcode_att_code_id_0d635efd_fk_att_attcode_id` FOREIGN KEY (`att_code_id`) REFERENCES `att_attcode` (`id`),
  CONSTRAINT `att_payloadattcode_emp_id_36569f54_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_payloadattcode_shift_id_731faddf_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadattcode: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadbase
CREATE TABLE IF NOT EXISTS `att_payloadbase` (
  `uuid` varchar(36) NOT NULL,
  `att_date` date DEFAULT NULL,
  `weekday` smallint DEFAULT NULL,
  `check_in` datetime(6) DEFAULT NULL,
  `check_out` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `duty_duration` int DEFAULT NULL,
  `work_day` double NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `total_time` int DEFAULT NULL,
  `duty_worked` int DEFAULT NULL,
  `actual_worked` int DEFAULT NULL,
  `unscheduled` int DEFAULT NULL,
  `remaining` int DEFAULT NULL,
  `total_worked` int DEFAULT NULL,
  `late` int DEFAULT NULL,
  `early_leave` int DEFAULT NULL,
  `short` int DEFAULT NULL,
  `absent` int DEFAULT NULL,
  `leave` int DEFAULT NULL,
  `exception` varchar(50) DEFAULT NULL,
  `day_off` smallint NOT NULL,
  `break_time_id` varchar(36) DEFAULT NULL,
  `emp_id` int NOT NULL,
  `overtime_id` varchar(36) DEFAULT NULL,
  `timetable_id` int DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `break_time_id` (`break_time_id`),
  UNIQUE KEY `overtime_id` (`overtime_id`),
  KEY `att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id` (`timetable_id`),
  CONSTRAINT `att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id` FOREIGN KEY (`timetable_id`) REFERENCES `att_timeinterval` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadbase: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadbreak
CREATE TABLE IF NOT EXISTS `att_payloadbreak` (
  `uuid` varchar(36) NOT NULL,
  `break_out` datetime(6) DEFAULT NULL,
  `break_in` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `taken` int DEFAULT NULL,
  `actual_duration` int DEFAULT NULL,
  `early_in` int DEFAULT NULL,
  `late_in` int DEFAULT NULL,
  `late` int DEFAULT NULL,
  `early_leave` int DEFAULT NULL,
  `absent` int DEFAULT NULL,
  `work_time` int DEFAULT NULL,
  `overtime` int DEFAULT NULL,
  `weekend_ot` int DEFAULT NULL,
  `holiday_ot` int DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadbreak: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadeffectpunch
CREATE TABLE IF NOT EXISTS `att_payloadeffectpunch` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `punch_datetime` datetime(6) NOT NULL,
  `punch_date` date NOT NULL,
  `punch_time` time(6) NOT NULL,
  `week` smallint NOT NULL,
  `weekday` smallint NOT NULL,
  `work_code` varchar(20) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `adjust_state` varchar(5) NOT NULL,
  `emp_id` int NOT NULL,
  `time_card_id` char(32) DEFAULT NULL,
  `trans_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_payloadeffectpunch_emp_id_67e28e01_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadeffectpunch_att_date_1e3de2d4` (`att_date`),
  KEY `att_payloadeffectpunch_time_card_id_52f69aaf` (`time_card_id`),
  KEY `att_payloadeffectpun_trans_id_94affbe6_fk_iclock_tr` (`trans_id`),
  CONSTRAINT `att_payloadeffectpun_trans_id_94affbe6_fk_iclock_tr` FOREIGN KEY (`trans_id`) REFERENCES `iclock_transaction` (`id`),
  CONSTRAINT `att_payloadeffectpunch_emp_id_67e28e01_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadeffectpunch: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadexception
CREATE TABLE IF NOT EXISTS `att_payloadexception` (
  `uuid` varchar(36) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `duration` int DEFAULT NULL,
  `days` double DEFAULT NULL,
  `data_type` smallint NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `skd_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `att_payloadexception_item_id_a08bfe48_fk_att_leave` (`item_id`),
  KEY `att_payloadexception_skd_id_b2e9ecaa` (`skd_id`),
  CONSTRAINT `att_payloadexception_item_id_a08bfe48_fk_att_leave` FOREIGN KEY (`item_id`) REFERENCES `att_leave` (`workflowinstance_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadexception: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadmulpunchset
CREATE TABLE IF NOT EXISTS `att_payloadmulpunchset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `att_date` date NOT NULL,
  `weekday` smallint DEFAULT NULL,
  `data_index` smallint NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `in_id` int DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `out_id` int DEFAULT NULL,
  `total_time` int DEFAULT NULL,
  `worked_time` int DEFAULT NULL,
  `data_type` smallint NOT NULL,
  `emp_id` int NOT NULL,
  `timetable_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadmulpunchset_timetable_id_9a439a09` (`timetable_id`),
  CONSTRAINT `att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadmulpunchset: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadovertime
CREATE TABLE IF NOT EXISTS `att_payloadovertime` (
  `uuid` varchar(36) NOT NULL,
  `normal_wt` int DEFAULT NULL,
  `normal_ot` int DEFAULT NULL,
  `weekend_ot` int DEFAULT NULL,
  `holiday_ot` int DEFAULT NULL,
  `ot_lv1` int DEFAULT NULL,
  `ot_lv2` int DEFAULT NULL,
  `ot_lv3` int DEFAULT NULL,
  `total_ot` int DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadovertime: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadparing
CREATE TABLE IF NOT EXISTS `att_payloadparing` (
  `id` char(32) NOT NULL,
  `stamp` bigint NOT NULL,
  `att_date` date NOT NULL,
  `week` smallint NOT NULL,
  `weekday` smallint NOT NULL,
  `data_type` smallint NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `in_date` date DEFAULT NULL,
  `in_time` time(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `out_date` date DEFAULT NULL,
  `out_time` time(6) DEFAULT NULL,
  `duration` int NOT NULL,
  `worked_duration` int NOT NULL,
  `data_index` int NOT NULL,
  `workday` decimal(4,1) NOT NULL,
  `emp_id` int NOT NULL,
  `in_trans_id` int DEFAULT NULL,
  `out_trans_id` int DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  `time_card_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_payloadparing_emp_id_c5daac4f_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadparing_in_trans_id_50a8040e_fk_iclock_transaction_id` (`in_trans_id`),
  KEY `att_payloadparing_out_trans_id_8b2375b9_fk_iclock_transaction_id` (`out_trans_id`),
  KEY `att_payloadparing_pay_code_id_aa241cca_fk_att_paycode_id` (`pay_code_id`),
  KEY `att_payloadparing_att_date_5daaa45d` (`att_date`),
  KEY `att_payloadparing_time_card_id_3adc3517` (`time_card_id`),
  CONSTRAINT `att_payloadparing_emp_id_c5daac4f_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_payloadparing_in_trans_id_50a8040e_fk_iclock_transaction_id` FOREIGN KEY (`in_trans_id`) REFERENCES `iclock_transaction` (`id`),
  CONSTRAINT `att_payloadparing_out_trans_id_8b2375b9_fk_iclock_transaction_id` FOREIGN KEY (`out_trans_id`) REFERENCES `iclock_transaction` (`id`),
  CONSTRAINT `att_payloadparing_pay_code_id_aa241cca_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadparing: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadpaycode
CREATE TABLE IF NOT EXISTS `att_payloadpaycode` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `week` int NOT NULL,
  `weekday` int NOT NULL,
  `pay_code_alias` varchar(50) NOT NULL,
  `pay_code_symbol` varchar(20) DEFAULT NULL,
  `duration` int NOT NULL,
  `workday` decimal(4,1) NOT NULL,
  `hours` decimal(6,1) NOT NULL,
  `minutes` decimal(8,1) NOT NULL,
  `is_weekly` tinyint(1) NOT NULL,
  `emp_id` int NOT NULL,
  `pay_code_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  `time_card_id` char(32) DEFAULT NULL,
  `is_exception` smallint NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_payloadpaycode_emp_id_78e75279_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadpaycode_pay_code_id_4a096cc7_fk_att_paycode_id` (`pay_code_id`),
  KEY `att_payloadpaycode_shift_id_79a0901e_fk_att_attshift_id` (`shift_id`),
  KEY `att_payloadpaycode_att_date_aa048d7b` (`att_date`),
  KEY `att_payloadpaycode_time_card_id_1696b969` (`time_card_id`),
  CONSTRAINT `att_payloadpaycode_emp_id_78e75279_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_payloadpaycode_pay_code_id_4a096cc7_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `att_payloadpaycode_shift_id_79a0901e_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadpaycode: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadpunch
CREATE TABLE IF NOT EXISTS `att_payloadpunch` (
  `uuid` varchar(36) NOT NULL,
  `att_date` date DEFAULT NULL,
  `correct_state` varchar(3) DEFAULT NULL,
  `emp_id` int NOT NULL,
  `orig_id` int DEFAULT NULL,
  `skd_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id` (`emp_id`),
  KEY `att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id` (`orig_id`),
  KEY `att_payloadpunch_skd_id_17596d82` (`skd_id`),
  CONSTRAINT `att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id` FOREIGN KEY (`orig_id`) REFERENCES `iclock_transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadpunch: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_payloadtimecard
CREATE TABLE IF NOT EXISTS `att_payloadtimecard` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `week` int NOT NULL,
  `weekday` int NOT NULL,
  `date_type` smallint NOT NULL,
  `time_table_alias` varchar(50) NOT NULL,
  `check_in` datetime(6) NOT NULL,
  `check_out` datetime(6) NOT NULL,
  `work_day` decimal(4,1) NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `break_out` datetime(6) DEFAULT NULL,
  `break_in` datetime(6) DEFAULT NULL,
  `lock_down` tinyint(1) NOT NULL,
  `emp_id` int NOT NULL,
  `time_table_id` int DEFAULT NULL,
  `present` smallint NOT NULL,
  `full_attendance` smallint NOT NULL,
  `payload` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `att_payloadtimecard_emp_id_att_date_time_table_id_9df16bc5_uniq` (`emp_id`,`att_date`,`time_table_id`),
  KEY `att_payloadtimecard_att_date_48c1dc00` (`att_date`),
  KEY `att_payloadtimecard_time_table_id_6e0b0137_fk_att_timei` (`time_table_id`),
  CONSTRAINT `att_payloadtimecard_emp_id_47caeab4_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `att_payloadtimecard_time_table_id_6e0b0137_fk_att_timei` FOREIGN KEY (`time_table_id`) REFERENCES `att_timeinterval` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_payloadtimecard: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_reportparam
CREATE TABLE IF NOT EXISTS `att_reportparam` (
  `param_name` varchar(20) NOT NULL,
  `param_value` longtext NOT NULL,
  PRIMARY KEY (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_reportparam: ~0 rows (approximately)
INSERT INTO `att_reportparam` (`param_name`, `param_value`) VALUES
	('report_setting', '{"short_date": 1, "short_time": 1, "filter_emp": 1, "multiple_dept": 0, "funckey0": "Check In", "funckey1": "Check Out", "funckey2": "Break Out", "funckey3": "Break In", "funckey4": "Overtime In", "funckey5": "Overtime Out", "funckey6": "6", "funckey7": "7", "funckey8": "8", "funckey9": "9", "funckey10": "10", "funckey11": "11", "funckey12": "12", "funckey13": "13", "funckey14": "14", "funckey255": "Unknown", "LeaveClass": [{"RemaindCount": 1, "LeaveId": 1000, "Color": 0, "round_off": 1, "report_symbol": " ", "minimum_unit": 0.5, "IsLeave": 1, "LeaveName": "Actual Worked Hours", "unit": 3}, {"RemaindCount": 1, "LeaveId": 1001, "Color": 0, "round_off": 2, "report_symbol": " ", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Duty Duration/Short", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1002, "Color": 0, "round_off": 2, "report_symbol": " ", "minimum_unit": 1.0, "IsLeave": 2, "LeaveName": "Total Time/Total Worked Hours", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1003, "Color": 0, "round_off": 2, "report_symbol": " ", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Break Time/Actual Break Time", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1004, "Color": 0, "round_off": 2, "report_symbol": " ", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Timetable Duration", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1005, "Color": 0, "round_off": 2, "report_symbol": ">", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Late", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1006, "Color": 0, "round_off": 2, "report_symbol": "<", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Early Leave", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1007, "Color": 0, "round_off": 1, "report_symbol": "V", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Leave", "unit": 2}, {"RemaindCount": 1, "LeaveId": 1008, "Color": 0, "round_off": 1, "report_symbol": "A", "minimum_unit": 0.5, "IsLeave": 1, "LeaveName": "Absent", "unit": 3}, {"RemaindCount": 1, "LeaveId": 1009, "Color": 0, "round_off": 1, "report_symbol": "+", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Overtime", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1010, "Color": 0, "round_off": 2, "report_symbol": "[", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "No Clock In", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1011, "Color": 0, "round_off": 2, "report_symbol": "]", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "No Clock Out", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1012, "Color": 0, "round_off": 2, "report_symbol": "P", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Present", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1013, "Color": 0, "round_off": 2, "report_symbol": "D", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Day Off", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1014, "Color": 0, "round_off": 2, "report_symbol": "W", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Weekend", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1015, "Color": 0, "round_off": 2, "report_symbol": "H", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Holiday", "unit": 1}, {"RemaindCount": 0, "LeaveId": 1016, "Color": 0, "round_off": 2, "report_symbol": "T", "minimum_unit": 1.0, "IsLeave": 1, "LeaveName": "Training", "unit": 1}]}');

-- Dumping structure for table rmci.bio.att_reporttemplate
CREATE TABLE IF NOT EXISTS `att_reporttemplate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report` varchar(50) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `template_value` longtext NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `is_auto_export` tinyint(1) NOT NULL,
  `builder_id` int DEFAULT NULL,
  `change_time` datetime(6),
  `change_user` varchar(150) DEFAULT NULL,
  `create_time` datetime(6),
  `create_user` varchar(150) DEFAULT NULL,
  `fixed_date_period` tinyint(1) NOT NULL,
  `language` varchar(10) NOT NULL,
  `status` smallint NOT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_reporttemplate_builder_id_e1bb15c6_fk_auth_user_id` (`builder_id`),
  KEY `att_reporttemplate_employee_id_4f80d866_fk_personnel_employee_id` (`employee_id`),
  CONSTRAINT `att_reporttemplate_builder_id_e1bb15c6_fk_auth_user_id` FOREIGN KEY (`builder_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `att_reporttemplate_employee_id_4f80d866_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_reporttemplate: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_shiftdetail
CREATE TABLE IF NOT EXISTS `att_shiftdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `in_time` time(6) NOT NULL,
  `out_time` time(6) NOT NULL,
  `day_index` int NOT NULL,
  `shift_id` int NOT NULL,
  `time_interval_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `att_shiftdetail_shift_id_7d694501_fk_att_attshift_id` (`shift_id`),
  KEY `att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id` (`time_interval_id`),
  CONSTRAINT `att_shiftdetail_shift_id_7d694501_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`),
  CONSTRAINT `att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id` FOREIGN KEY (`time_interval_id`) REFERENCES `att_timeinterval` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_shiftdetail: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_temporaryschedule
CREATE TABLE IF NOT EXISTS `att_temporaryschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `att_date` date NOT NULL,
  `employee_id` int NOT NULL,
  `time_interval_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_temporaryschedul_employee_id_2b2b94c2_fk_personnel` (`employee_id`),
  KEY `att_temporaryschedule_att_date_8aed8916` (`att_date`),
  KEY `att_temporaryschedule_time_interval_id_2be60ee4` (`time_interval_id`),
  CONSTRAINT `att_temporaryschedul_employee_id_2b2b94c2_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_temporaryschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_tempschedule
CREATE TABLE IF NOT EXISTS `att_tempschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `att_date` date DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `rule_flag` smallint NOT NULL,
  `work_type` smallint NOT NULL,
  `employee_id` int NOT NULL,
  `time_interval_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id` (`employee_id`),
  KEY `att_tempschedule_time_interval_id_08dd8eb3` (`time_interval_id`),
  CONSTRAINT `att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_tempschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_timeinterval
CREATE TABLE IF NOT EXISTS `att_timeinterval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `use_mode` smallint NOT NULL,
  `in_time` time(6) NOT NULL,
  `in_ahead_margin` int NOT NULL,
  `in_above_margin` int NOT NULL,
  `out_ahead_margin` int NOT NULL,
  `out_above_margin` int NOT NULL,
  `duration` int NOT NULL,
  `in_required` smallint NOT NULL,
  `out_required` smallint NOT NULL,
  `allow_late` int NOT NULL,
  `allow_leave_early` int NOT NULL,
  `work_day` double NOT NULL,
  `early_in` smallint NOT NULL,
  `min_early_in` int NOT NULL,
  `late_out` smallint NOT NULL,
  `min_late_out` int NOT NULL,
  `overtime_lv` smallint NOT NULL,
  `overtime_lv1` smallint NOT NULL,
  `overtime_lv2` smallint NOT NULL,
  `overtime_lv3` smallint NOT NULL,
  `multiple_punch` smallint NOT NULL,
  `available_interval_type` smallint NOT NULL,
  `available_interval` int NOT NULL,
  `work_time_duration` int NOT NULL,
  `func_key` smallint NOT NULL,
  `work_type` smallint NOT NULL,
  `day_change` time(6) NOT NULL,
  `enable_early_in` tinyint(1) NOT NULL,
  `enable_late_out` tinyint(1) NOT NULL,
  `enable_overtime` tinyint(1) NOT NULL,
  `ot_rule` char(32) DEFAULT NULL,
  `color_setting` varchar(30) DEFAULT NULL,
  `enable_max_ot_limit` tinyint(1) NOT NULL,
  `max_ot_limit` int NOT NULL,
  `count_early_in_interval` tinyint(1) NOT NULL,
  `count_late_out_interval` tinyint(1) NOT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `att_timeinterval_ot_pay_code_id_17438af8_fk_att_paycode_id` (`ot_pay_code_id`),
  CONSTRAINT `att_timeinterval_ot_pay_code_id_17438af8_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_timeinterval: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_timeinterval_break_time
CREATE TABLE IF NOT EXISTS `att_timeinterval_break_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timeinterval_id` int NOT NULL,
  `breaktime_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `att_timeinterval_break_t_timeinterval_id_breaktim_6e1bfb4e_uniq` (`timeinterval_id`,`breaktime_id`),
  KEY `att_timeinterval_bre_breaktime_id_08462308_fk_att_break` (`breaktime_id`),
  CONSTRAINT `att_timeinterval_bre_breaktime_id_08462308_fk_att_break` FOREIGN KEY (`breaktime_id`) REFERENCES `att_breaktime` (`id`),
  CONSTRAINT `att_timeinterval_bre_timeinterval_id_2287017e_fk_att_timei` FOREIGN KEY (`timeinterval_id`) REFERENCES `att_timeinterval` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_timeinterval_break_time: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_training
CREATE TABLE IF NOT EXISTS `att_training` (
  `workflowinstance_ptr_id` int NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  KEY `att_training_pay_code_id_5790afdd_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `att_training_pay_code_id_5790afdd_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `att_training_workflowinstance_ptr_0aef1508_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_training: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.att_webpunch
CREATE TABLE IF NOT EXISTS `att_webpunch` (
  `workflowinstance_ptr_id` int NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `work_code` varchar(20) DEFAULT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `verify_type` int NOT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  CONSTRAINT `att_webpunch_workflowinstance_ptr_c5f1c02e_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.att_webpunch: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.authtoken_token
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.authtoken_token: ~0 rows (approximately)
INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
	('0bbc78e6f4f92577dd9a6a5bb00bdedf57e57a45', '2024-08-16 15:05:39.567648', 1);

-- Dumping structure for table rmci.bio.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_group: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_group_permissions: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_permission: ~921 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add permission', 1, 'add_permission'),
	(2, 'Can change permission', 1, 'change_permission'),
	(3, 'Can delete permission', 1, 'delete_permission'),
	(4, 'Can add group', 2, 'add_group'),
	(5, 'Can change group', 2, 'change_group'),
	(7, 'Can view permission', 1, 'view_permission'),
	(8, 'Can view group', 2, 'view_group'),
	(9, 'Can GroupDelete group', 2, 'group_delete_group'),
	(10, 'Can view email_template_setting', 3, 'view_email_template_setting'),
	(11, 'Can view ad_server_setting', 3, 'view_ad_server_setting'),
	(12, 'Can view db_migrate', 3, 'view_db_migrate'),
	(13, 'Can view safe_setting', 3, 'view_safe_setting'),
	(14, 'Can view zoom_setting', 3, 'view_zoom_setting'),
	(15, 'Can view twilio_setting', 3, 'view_twilio_setting'),
	(16, 'Can view system_setting', 3, 'view_system_setting'),
	(17, 'Can view device_config', 4, 'view_device_config'),
	(18, 'Can view psnl_config_setting', 5, 'view_psnl_config_setting'),
	(19, 'Can view employeeschedule_report', 6, 'view_employeeschedule_report'),
	(20, 'Can view transaction_report', 7, 'view_transaction_report'),
	(21, 'Can view time_card_report', 7, 'view_time_card_report'),
	(22, 'Can view first_last_report', 7, 'view_first_last_report'),
	(23, 'Can view first_in_last_out_report', 7, 'view_first_in_last_out_report'),
	(24, 'Can view total_time_card_v2', 7, 'view_total_time_card_v2'),
	(25, 'Can view daily_activity', 7, 'view_daily_activity'),
	(26, 'Can view daily_overtime', 7, 'view_daily_overtime'),
	(27, 'Can view daily_leave', 7, 'view_daily_leave'),
	(28, 'Can view daily_late_in', 7, 'view_daily_late_in'),
	(29, 'Can view daily_early_out', 7, 'view_daily_early_out'),
	(30, 'Can view daily_absent', 7, 'view_daily_absent'),
	(31, 'Can view daily_exception', 7, 'view_daily_exception'),
	(32, 'Can view scheduled_punch_report', 7, 'view_scheduled_punch_report'),
	(33, 'Can view punch_paring', 7, 'view_punch_paring'),
	(34, 'Can view daily_multiple_punch_paring', 7, 'view_daily_multiple_punch_paring'),
	(35, 'Can view daily_multiple_break_paring', 7, 'view_daily_multiple_break_paring'),
	(36, 'Can view weekly_worked_hours', 7, 'view_weekly_worked_hours'),
	(37, 'Can view weekly_overtime', 7, 'view_weekly_overtime'),
	(38, 'Can view monthly_status', 7, 'view_monthly_status'),
	(39, 'Can view monthly_work_hours', 7, 'view_monthly_work_hours'),
	(40, 'Can view monthly_punch', 7, 'view_monthly_punch'),
	(41, 'Can view monthly_overtime', 7, 'view_monthly_overtime'),
	(42, 'Can view monthly_absence', 7, 'view_monthly_absence'),
	(43, 'Can view emp_summary_report', 7, 'view_emp_summary_report'),
	(44, 'Can view employee_overtime', 7, 'view_employee_overtime'),
	(45, 'Can view employee_leave', 7, 'view_employee_leave'),
	(46, 'Can view dept_summary_report', 7, 'view_dept_summary_report'),
	(47, 'Can view department_overtime', 7, 'view_department_overtime'),
	(48, 'Can view group_summary_report', 7, 'view_group_summary_report'),
	(49, 'Can view group_overtime', 7, 'view_group_overtime'),
	(50, 'Can view sage_vip', 7, 'view_sage_vip'),
	(51, 'Can view leave_balance_summary_report', 7, 'view_leave_balance_summary_report'),
	(52, 'Can view staff_transaction_report', 8, 'view_staff_transaction_report'),
	(53, 'Can view staff_scheduledlog_report', 8, 'view_staff_scheduledlog_report'),
	(54, 'Can view staff_attdetail_report', 8, 'view_staff_attdetail_report'),
	(55, 'Can view staff_summary_report', 8, 'view_staff_summary_report'),
	(56, 'Can view staff_multipletransaction_report', 8, 'view_staff_multipletransaction_report'),
	(57, 'Can view staff_breaktime_report', 8, 'view_staff_breaktime_report'),
	(58, 'Can view staff_timecard_report', 8, 'view_staff_timecard_report'),
	(59, 'Can view att_rule_page', 9, 'view_att_rule_page'),
	(60, 'Can view report_setting_page', 10, 'view_report_setting_page'),
	(61, 'Can view calculation_view', 10, 'view_calculation_view'),
	(62, 'Can view view_by_personnel', 6, 'view_view_by_personnel'),
	(63, 'Can view payrollincrease_report', 11, 'view_payrollincrease_report'),
	(64, 'Can view payrolldeduction_report', 11, 'view_payrolldeduction_report'),
	(65, 'Can view payrolldetail_report', 11, 'view_payrolldetail_report'),
	(66, 'Can view payrollcalcparam_report', 11, 'view_payrollcalcparam_report'),
	(67, 'Can view salarystructure_report', 11, 'view_salarystructure_report'),
	(68, 'Can view staff_salarystructure_report', 12, 'view_staff_salarystructure_report'),
	(69, 'Can view staff_payrollincrease_report', 12, 'view_staff_payrollincrease_report'),
	(70, 'Can view staff_payrolldeduction_report', 12, 'view_staff_payrolldeduction_report'),
	(71, 'Can view staff_payrolldetail_report', 12, 'view_staff_payrolldetail_report'),
	(72, 'Can view staff_payrollcalcparam_report', 12, 'view_staff_payrollcalcparam_report'),
	(73, 'Can view payroll_reportcalculator', 11, 'view_payroll_reportcalculator'),
	(74, 'Can view meeting_attendance_report', 13, 'view_meeting_attendance_report'),
	(75, 'Can view meeting_room_scheduled', 13, 'view_meeting_room_scheduled'),
	(76, 'Can view ep_dashboard', 14, 'view_ep_dashboard'),
	(77, 'Can view daily_detail_report', 15, 'view_daily_detail_report'),
	(78, 'Can view department_summary_report', 15, 'view_department_summary_report'),
	(79, 'Can view unusual_employees_report', 15, 'view_unusual_employees_report'),
	(80, 'Can view ep_real_time_monitoring', 14, 'view_ep_real_time_monitoring'),
	(81, 'Can add content type', 129, 'add_contenttype'),
	(82, 'Can change content type', 129, 'change_contenttype'),
	(83, 'Can delete content type', 129, 'delete_contenttype'),
	(84, 'Can view contenttype', 129, 'view_contenttype'),
	(85, 'Can add log entry', 130, 'add_logentry'),
	(86, 'Can change log entry', 130, 'change_logentry'),
	(87, 'Can delete log entry', 130, 'delete_logentry'),
	(88, 'Can view logentry', 130, 'view_logentry'),
	(89, 'Can add session', 131, 'add_session'),
	(90, 'Can change session', 131, 'change_session'),
	(91, 'Can delete session', 131, 'delete_session'),
	(92, 'Can view session', 131, 'view_session'),
	(93, 'Can add Token', 132, 'add_token'),
	(94, 'Can change Token', 132, 'change_token'),
	(95, 'Can delete Token', 132, 'delete_token'),
	(96, 'Can view token', 132, 'view_token'),
	(97, 'Can add API Request Log', 17, 'add_apirequestlog'),
	(98, 'Can change API Request Log', 17, 'change_apirequestlog'),
	(99, 'Can delete API Request Log', 17, 'delete_apirequestlog'),
	(100, 'Can view apirequestlog', 17, 'view_apirequestlog'),
	(101, 'Can add group object permission', 133, 'add_groupobjectpermission'),
	(102, 'Can change group object permission', 133, 'change_groupobjectpermission'),
	(103, 'Can delete group object permission', 133, 'delete_groupobjectpermission'),
	(104, 'Can add user object permission', 134, 'add_userobjectpermission'),
	(105, 'Can change user object permission', 134, 'change_userobjectpermission'),
	(106, 'Can delete user object permission', 134, 'delete_userobjectpermission'),
	(107, 'Can view userobjectpermission', 134, 'view_userobjectpermission'),
	(108, 'Can view groupobjectpermission', 133, 'view_groupobjectpermission'),
	(109, 'Can add crontab', 135, 'add_crontabschedule'),
	(110, 'Can change crontab', 135, 'change_crontabschedule'),
	(111, 'Can delete crontab', 135, 'delete_crontabschedule'),
	(112, 'Can add interval', 136, 'add_intervalschedule'),
	(113, 'Can change interval', 136, 'change_intervalschedule'),
	(114, 'Can delete interval', 136, 'delete_intervalschedule'),
	(115, 'Can add periodic task', 137, 'add_periodictask'),
	(116, 'Can change periodic task', 137, 'change_periodictask'),
	(117, 'Can delete periodic task', 137, 'delete_periodictask'),
	(118, 'Can add periodic tasks', 138, 'add_periodictasks'),
	(119, 'Can change periodic tasks', 138, 'change_periodictasks'),
	(120, 'Can delete periodic tasks', 138, 'delete_periodictasks'),
	(121, 'Can add solar event', 139, 'add_solarschedule'),
	(122, 'Can change solar event', 139, 'change_solarschedule'),
	(123, 'Can delete solar event', 139, 'delete_solarschedule'),
	(124, 'Can add clocked', 140, 'add_clockedschedule'),
	(125, 'Can change clocked', 140, 'change_clockedschedule'),
	(126, 'Can delete clocked', 140, 'delete_clockedschedule'),
	(127, 'Can view solarschedule', 139, 'view_solarschedule'),
	(128, 'Can view intervalschedule', 136, 'view_intervalschedule'),
	(129, 'Can view clockedschedule', 140, 'view_clockedschedule'),
	(130, 'Can view crontabschedule', 135, 'view_crontabschedule'),
	(131, 'Can view periodictasks', 138, 'view_periodictasks'),
	(132, 'Can view periodictask', 137, 'view_periodictask'),
	(133, 'Can view base.models.adminLog', 16, 'view_adminlog'),
	(134, 'Can add attendance rule', 141, 'add_attparam'),
	(135, 'Can change attendance rule', 141, 'change_attparam'),
	(136, 'Can delete attendance rule', 141, 'delete_attparam'),
	(137, 'Can add attParamDepts', 142, 'add_attparamdepts'),
	(138, 'Can change attParamDepts', 142, 'change_attparamdepts'),
	(139, 'Can delete attParamDepts', 142, 'delete_attparamdepts'),
	(140, 'Can add base_model_autoAttExportTask', 19, 'add_autoattexporttask'),
	(141, 'Can change base_model_autoAttExportTask', 19, 'change_autoattexporttask'),
	(142, 'Can delete base_model_autoAttExportTask', 19, 'delete_autoattexporttask'),
	(143, 'Can add base_model_autoExportTask', 20, 'add_autoexporttask'),
	(144, 'Can change base_model_autoExportTask', 20, 'change_autoexporttask'),
	(145, 'Can delete base_model_autoExportTask', 20, 'delete_autoexporttask'),
	(146, 'Can delete base_model_bookmark', 22, 'delete_bookmark'),
	(147, 'Can change base_model_bookmark', 22, 'change_bookmark'),
	(148, 'Can add base_model_lineNotifySetting', 26, 'add_linenotifysetting'),
	(149, 'Can change base_model_lineNotifySetting', 26, 'change_linenotifysetting'),
	(150, 'Can delete base_model_lineNotifySetting', 26, 'delete_linenotifysetting'),
	(151, 'Can add base.models.securityPolicy', 31, 'add_securitypolicy'),
	(152, 'Can change base.models.securityPolicy', 31, 'change_securitypolicy'),
	(153, 'Can delete base.models.securityPolicy', 31, 'delete_securitypolicy'),
	(154, 'Can add model_send_email', 143, 'add_sendemail'),
	(155, 'Can change model_send_email', 143, 'change_sendemail'),
	(156, 'Can delete model_send_email', 143, 'delete_sendemail'),
	(157, 'Can add sftp_setting', 32, 'add_sftpsetting'),
	(158, 'Can change sftp_setting', 32, 'change_sftpsetting'),
	(159, 'Can delete sftp_setting', 32, 'delete_sftpsetting'),
	(160, 'Can view base_integrationTable_area', 30, 'view_syncarea'),
	(161, 'Can view base_integrationTable_department', 27, 'view_syncdepartment'),
	(162, 'Can view base_integrationTable_employee', 29, 'view_syncemployee'),
	(163, 'Can view base_integrationTable_position', 28, 'view_syncjob'),
	(164, 'Can add System Rule', 144, 'add_sysparam'),
	(165, 'Can change System Rule', 144, 'change_sysparam'),
	(166, 'Can delete System Rule', 144, 'delete_sysparam'),
	(167, 'Can add System Parameter related to Department', 145, 'add_sysparamdept'),
	(168, 'Can change System Parameter related to Department', 145, 'change_sysparamdept'),
	(169, 'Can delete System Parameter related to Department', 145, 'delete_sysparamdept'),
	(170, 'Can view base.models.systemLog', 33, 'view_systemlog'),
	(171, 'Can add base.model.systemSetting', 146, 'add_systemsetting'),
	(172, 'Can change base.model.systemSetting', 146, 'change_systemsetting'),
	(173, 'Can delete base.model.systemSetting', 146, 'delete_systemsetting'),
	(174, 'Can add Abstract Permission', 1, 'add_abstractpermission'),
	(175, 'Can change Abstract Permission', 1, 'change_abstractpermission'),
	(176, 'Can delete Abstract Permission', 1, 'delete_abstractpermission'),
	(177, 'Can add System Setting Permission', 1, 'add_systemsettingpermission'),
	(178, 'Can change System Setting Permission', 1, 'change_systemsettingpermission'),
	(179, 'Can delete System Setting Permission', 1, 'delete_systemsettingpermission'),
	(180, 'Can add base.model.emailTemplate', 24, 'add_emailtemplate'),
	(181, 'Can change base.model.emailTemplate', 24, 'change_emailtemplate'),
	(182, 'Can delete base.model.emailTemplate', 24, 'delete_emailtemplate'),
	(183, 'Can view base.models.eventAlertSetting', 25, 'view_eventalertsetting'),
	(184, 'Can change base.models.eventAlertSetting', 25, 'change_eventalertsetting'),
	(185, 'Can delete base_model_autoImportTask', 21, 'delete_autoimporttask'),
	(186, 'Can change base_model_autoImportTask', 21, 'change_autoimporttask'),
	(187, 'Can view base_model_autoImportTask', 21, 'view_autoimporttask'),
	(188, 'Can view sendemail', 143, 'view_sendemail'),
	(189, 'Can view sysparam', 144, 'view_sysparam'),
	(190, 'Can view sftpsetting', 32, 'view_sftpsetting'),
	(191, 'Can view linenotifysetting', 26, 'view_linenotifysetting'),
	(192, 'Can view abstractpermission', 147, 'view_abstractpermission'),
	(193, 'Can view systemsettingpermission', 148, 'view_systemsettingpermission'),
	(194, 'Can view sysparamdept', 145, 'view_sysparamdept'),
	(195, 'Can view attparam', 141, 'view_attparam'),
	(196, 'Can view attparamdepts', 142, 'view_attparamdepts'),
	(197, 'Can view systemsetting', 146, 'view_systemsetting'),
	(198, 'Can view autoexporttask', 20, 'view_autoexporttask'),
	(199, 'Can ManualExport autoexporttask', 20, 'manual_export_autoexporttask'),
	(200, 'Can EnableTask autoexporttask', 20, 'enable_task_autoexporttask'),
	(201, 'Can DisableTask autoexporttask', 20, 'disable_task_autoexporttask'),
	(202, 'Can AddDefault autoimporttask', 21, 'add_default_autoimporttask'),
	(203, 'Can AddUserDefine autoimporttask', 21, 'add_user_define_autoimporttask'),
	(204, 'Can ManualImport autoimporttask', 21, 'manual_import_autoimporttask'),
	(205, 'Can EnableTask autoimporttask', 21, 'enable_task_autoimporttask'),
	(206, 'Can DisableTask autoimporttask', 21, 'disable_task_autoimporttask'),
	(207, 'Can view autoattexporttask', 19, 'view_autoattexporttask'),
	(208, 'Can ManualAttExport autoattexporttask', 19, 'manual_att_export_autoattexporttask'),
	(209, 'Can EnableTask autoattexporttask', 19, 'enable_task_autoattexporttask'),
	(210, 'Can DisableTask autoattexporttask', 19, 'disable_task_autoattexporttask'),
	(211, 'Can DBBackupAuto dbbackuplog', 23, 'd_b_backup_auto_dbbackuplog'),
	(212, 'Can DBBackupManually dbbackuplog', 23, 'd_b_backup_manually_dbbackuplog'),
	(213, 'Can DBRestoreManually dbbackuplog', 23, 'd_b_restore_manually_dbbackuplog'),
	(214, 'Can view securitypolicy', 31, 'view_securitypolicy'),
	(215, 'Can view emailtemplate', 24, 'view_emailtemplate'),
	(216, 'Can view bookmark', 22, 'view_bookmark'),
	(217, 'Can add iclock_model_bioData', 50, 'add_biodata'),
	(218, 'Can change iclock_model_bioData', 50, 'change_biodata'),
	(219, 'Can delete iclock_model_bioData', 50, 'delete_biodata'),
	(220, 'Can delete iclock_model_bioPhoto', 55, 'delete_biophoto'),
	(221, 'Can view iclock_model_bioPhoto', 55, 'view_biophoto'),
	(222, 'Can add iclock_model_deviceConfig', 54, 'add_devicemoduleconfig'),
	(223, 'Can change iclock_model_deviceConfig', 54, 'change_devicemoduleconfig'),
	(224, 'Can delete iclock_model_deviceConfig', 54, 'delete_devicemoduleconfig'),
	(225, 'Can delete terminal_model_errorCommandLog', 56, 'delete_errorcommandlog'),
	(226, 'Can view terminal_model_errorCommandLog', 56, 'view_errorcommandlog'),
	(227, 'Can delete iclock_model_privateMessage', 51, 'delete_privatemessage'),
	(228, 'Can change iclock_model_privateMessage', 51, 'change_privatemessage'),
	(229, 'Can view iclock_model_privateMessage', 51, 'view_privatemessage'),
	(230, 'Can delete iclock_model_publicMessage', 52, 'delete_publicmessage'),
	(231, 'Can change iclock_model_publicMessage', 52, 'change_publicmessage'),
	(232, 'Can view iclock_model_publicMessage', 52, 'view_publicmessage'),
	(233, 'Can add terminal.models.shortMessage', 149, 'add_shortmessage'),
	(234, 'Can change terminal.models.shortMessage', 149, 'change_shortmessage'),
	(235, 'Can delete terminal.models.shortMessage', 149, 'delete_shortmessage'),
	(236, 'Can add iclock_model_terminal', 44, 'add_terminal'),
	(237, 'Can change iclock_model_terminal', 44, 'change_terminal'),
	(238, 'Can delete iclock_model_terminal', 44, 'delete_terminal'),
	(239, 'Can delete iclock_model_terminalCommand', 48, 'delete_terminalcommand'),
	(240, 'Can view iclock_model_terminalCommand', 48, 'view_terminalcommand'),
	(241, 'Can add iclock_model_terminalEmployee', 150, 'add_terminalemployee'),
	(242, 'Can change iclock_model_terminalEmployee', 150, 'change_terminalemployee'),
	(243, 'Can delete iclock_model_terminalEmployee', 150, 'delete_terminalemployee'),
	(244, 'Can delete iclock_model_terminalLog', 46, 'delete_terminallog'),
	(245, 'Can view iclock_model_terminalLog', 46, 'view_terminallog'),
	(246, 'Can add iclock_model_terminalParameter', 57, 'add_terminalparameter'),
	(247, 'Can change iclock_model_terminalParameter', 57, 'change_terminalparameter'),
	(248, 'Can delete iclock_model_terminalParameter', 57, 'delete_terminalparameter'),
	(249, 'Can delete iclock_model_terminalUploadLog', 47, 'delete_terminaluploadlog'),
	(250, 'Can view iclock_model_terminalUploadLog', 47, 'view_terminaluploadlog'),
	(251, 'Can add iclock_model_terminalWorkCode', 53, 'add_terminalworkcode'),
	(252, 'Can change iclock_model_terminalWorkCode', 53, 'change_terminalworkcode'),
	(253, 'Can delete iclock_model_terminalWorkCode', 53, 'delete_terminalworkcode'),
	(254, 'Can view iclock_model_transaction', 45, 'view_transaction'),
	(255, 'Can add transaction.proof.command', 151, 'add_transactionproofcmd'),
	(256, 'Can change transaction.proof.command', 151, 'change_transactionproofcmd'),
	(257, 'Can delete transaction.proof.command', 151, 'delete_transactionproofcmd'),
	(258, 'Can delete iclock.models.terminalCommandLog', 49, 'delete_terminalcommandlog'),
	(259, 'Can view iclock.models.terminalCommandLog', 49, 'view_terminalcommandlog'),
	(260, 'Can add Device Setting Permission', 1, 'add_devicesettingpermission'),
	(261, 'Can change Device Setting Permission', 1, 'change_devicesettingpermission'),
	(262, 'Can delete Device Setting Permission', 1, 'delete_devicesettingpermission'),
	(263, 'Can view terminal', 44, 'view_terminal'),
	(264, 'Can TerminalNewArea terminal', 44, 'terminal_new_area_terminal'),
	(265, 'Can TerminalClearCommand terminal', 44, 'terminal_clear_command_terminal'),
	(266, 'Can TerminalClearAttendanceData terminal', 44, 'terminal_clear_attendance_data_terminal'),
	(267, 'Can TerminalDeleteCapture terminal', 44, 'terminal_delete_capture_terminal'),
	(268, 'Can TerminalClearAll terminal', 44, 'terminal_clear_all_terminal'),
	(269, 'Can TerminalReUploadData terminal', 44, 'terminal_re_upload_data_terminal'),
	(270, 'Can TerminalReUploadTransaction terminal', 44, 'terminal_re_upload_transaction_terminal'),
	(271, 'Can TerminalReloadData terminal', 44, 'terminal_reload_data_terminal'),
	(272, 'Can TerminalDataCompare terminal', 44, 'terminal_data_compare_terminal'),
	(273, 'Can TerminalManualSync terminal', 44, 'terminal_manual_sync_terminal'),
	(274, 'Can TerminalReboot terminal', 44, 'terminal_reboot_terminal'),
	(275, 'Can TerminalReadInformation terminal', 44, 'terminal_read_information_terminal'),
	(276, 'Can TerminalEnrollRemotely terminal', 44, 'terminal_enroll_remotely_terminal'),
	(277, 'Can TerminalDuplicatePunchPeriod terminal', 44, 'terminal_duplicate_punch_period_terminal'),
	(278, 'Can TerminalCapture terminal', 44, 'terminal_capture_terminal'),
	(279, 'Can TerminalUpgradeFirmware terminal', 44, 'terminal_upgrade_firmware_terminal'),
	(280, 'Can TerminalDaylightSavingTime terminal', 44, 'terminal_daylight_saving_time_terminal'),
	(281, 'Can TerminalPullFile terminal', 44, 'terminal_pull_file_terminal'),
	(282, 'Can TerminalSetOption terminal', 44, 'terminal_set_option_terminal'),
	(283, 'Can USBDataUpload transaction', 45, 'u_s_b_data_upload_transaction'),
	(284, 'Can AttCaptureDownload transaction', 45, 'att_capture_download_transaction'),
	(285, 'Can TerminalUploadLogBulkDelete terminaluploadlog', 47, 'terminal_upload_log_bulk_delete_terminaluploadlog'),
	(286, 'Can TerminalCommandBulkDelete terminalcommand', 48, 'terminal_command_bulk_delete_terminalcommand'),
	(287, 'Can TerminalCommandLogBulkDelete terminalcommandlog', 49, 'terminal_command_log_bulk_delete_terminalcommandlog'),
	(288, 'Can view terminalparameter', 57, 'view_terminalparameter'),
	(289, 'Can view terminalemployee', 150, 'view_terminalemployee'),
	(290, 'Can view shortmessage', 149, 'view_shortmessage'),
	(291, 'Can AddPublicMessage publicmessage', 52, 'add_public_message_publicmessage'),
	(292, 'Can SendPublicMessage publicmessage', 52, 'send_public_message_publicmessage'),
	(293, 'Can AddPrivateMessage privatemessage', 51, 'add_private_message_privatemessage'),
	(294, 'Can SendPrivateMessage privatemessage', 51, 'send_private_message_privatemessage'),
	(295, 'Can view terminalworkcode', 53, 'view_terminalworkcode'),
	(296, 'Can SendWorkCode terminalworkcode', 53, 'send_work_code_terminalworkcode'),
	(297, 'Can RemoveWorkCode terminalworkcode', 53, 'remove_work_code_terminalworkcode'),
	(298, 'Can view transactionproofcmd', 151, 'view_transactionproofcmd'),
	(299, 'Can view biodata', 50, 'view_biodata'),
	(300, 'Can view devicemoduleconfig', 54, 'view_devicemoduleconfig'),
	(301, 'Can BioPhotoApprove biophoto', 55, 'bio_photo_approve_biophoto'),
	(302, 'Can BioPhotoQRCode biophoto', 55, 'bio_photo_q_r_code_biophoto'),
	(303, 'Can ImportBioPhoto biophoto', 55, 'import_bio_photo_biophoto'),
	(304, 'Can view deviceemployee', 153, 'view_deviceemployee'),
	(305, 'Can change model_deviceemployee', 153, 'change_deviceemployee'),
	(306, 'Can AreaTransfer deviceemployee', 153, 'area_transfer_deviceemployee'),
	(307, 'Can ReSync2Device deviceemployee', 153, 're_sync2_device_deviceemployee'),
	(308, 'Can ReUpload deviceemployee', 153, 're_upload_deviceemployee'),
	(309, 'Can DeleteBioData deviceemployee', 153, 'delete_bio_data_deviceemployee'),
	(310, 'Can EnrollFingerprint deviceemployee', 153, 'enroll_fingerprint_deviceemployee'),
	(311, 'Can EnrollPalm deviceemployee', 153, 'enroll_palm_deviceemployee'),
	(312, 'Can EnrollFacePhoto deviceemployee', 153, 'enroll_face_photo_deviceemployee'),
	(313, 'Can view devicesettingpermission', 152, 'view_devicesettingpermission'),
	(314, 'Can add psnl_model_area', 36, 'add_area'),
	(315, 'Can change psnl_model_area', 36, 'change_area'),
	(316, 'Can delete psnl_model_area', 36, 'delete_area'),
	(317, 'Can add model_assign_area_to_employee', 154, 'add_assignareaemployee'),
	(318, 'Can change model_assign_area_to_employee', 154, 'change_assignareaemployee'),
	(319, 'Can delete model_assign_area_to_employee', 154, 'delete_assignareaemployee'),
	(320, 'Can add psnl_model_certification', 37, 'add_certification'),
	(321, 'Can change psnl_model_certification', 37, 'change_certification'),
	(322, 'Can delete psnl_model_certification', 37, 'delete_certification'),
	(323, 'Can add psnl_model_department', 38, 'add_department'),
	(324, 'Can change psnl_model_department', 38, 'change_department'),
	(325, 'Can delete psnl_model_department', 38, 'delete_department'),
	(326, 'Can add model_employee', 39, 'add_employee'),
	(327, 'Can change model_employee', 39, 'change_employee'),
	(328, 'Can delete model_employee', 39, 'delete_employee'),
	(329, 'Can delete employee certification', 42, 'delete_employeecertification'),
	(330, 'Can change employee certification', 42, 'change_employeecertification'),
	(331, 'Can view employee certification', 42, 'view_employeecertification'),
	(332, 'Can add pnsl_model_empProfile', 155, 'add_employeeprofile'),
	(333, 'Can change pnsl_model_empProfile', 155, 'change_employeeprofile'),
	(334, 'Can delete pnsl_model_empProfile', 155, 'delete_employeeprofile'),
	(335, 'Can add psnl.models.employment', 156, 'add_employment'),
	(336, 'Can change psnl.models.employment', 156, 'change_employment'),
	(337, 'Can delete psnl.models.employment', 156, 'delete_employment'),
	(338, 'Can add psnl_model_position', 40, 'add_position'),
	(339, 'Can change psnl_model_position', 40, 'change_position'),
	(340, 'Can delete psnl_model_position', 40, 'delete_position'),
	(341, 'Can delete psnl_model_resign', 41, 'delete_resign'),
	(342, 'Can change psnl_model_resign', 41, 'change_resign'),
	(343, 'Can view psnl_model_resign', 41, 'view_resign'),
	(344, 'Can add employee calendar', 157, 'add_employeecalendar'),
	(345, 'Can change employee calendar', 157, 'change_employeecalendar'),
	(346, 'Can delete employee calendar', 157, 'delete_employeecalendar'),
	(347, 'Can add personnel.models.employeeCustomAttribute', 43, 'add_employeecustomattribute'),
	(348, 'Can change personnel.models.employeeCustomAttribute', 43, 'change_employeecustomattribute'),
	(349, 'Can delete personnel.models.employeeCustomAttribute', 43, 'delete_employeecustomattribute'),
	(350, 'Can add personnel.models.employeeExtraInfo', 158, 'add_employeeextrainfo'),
	(351, 'Can change personnel.models.employeeExtraInfo', 158, 'change_employeeextrainfo'),
	(352, 'Can delete personnel.models.employeeExtraInfo', 158, 'delete_employeeextrainfo'),
	(353, 'Can add psnl.model.company', 35, 'add_company'),
	(354, 'Can change psnl.model.company', 35, 'change_company'),
	(355, 'Can delete psnl.model.company', 35, 'delete_company'),
	(356, 'Can add Personnel Setting Permission', 1, 'add_personnelsettingpermission'),
	(357, 'Can change Personnel Setting Permission', 1, 'change_personnelsettingpermission'),
	(358, 'Can delete Personnel Setting Permission', 1, 'delete_personnelsettingpermission'),
	(359, 'Can view company', 35, 'view_company'),
	(360, 'Can view department', 38, 'view_department'),
	(361, 'Can Import department', 38, 'import_department'),
	(362, 'Can SetDepartment department', 38, 'set_department_department'),
	(363, 'Can view position', 40, 'view_position'),
	(364, 'Can Import position', 40, 'import_position'),
	(365, 'Can SetPosition position', 40, 'set_position_position'),
	(366, 'Can view area', 36, 'view_area'),
	(367, 'Can Import area', 36, 'import_area'),
	(368, 'Can SetArea area', 36, 'set_area_area'),
	(369, 'Can view certification', 37, 'view_certification'),
	(370, 'Can Import certification', 37, 'import_certification'),
	(371, 'Can view employee', 39, 'view_employee'),
	(372, 'Can ImportEmployee employee', 39, 'import_employee_employee'),
	(373, 'Can ImportDocument employee', 39, 'import_document_employee'),
	(374, 'Can ImportPhoto employee', 39, 'import_photo_employee'),
	(375, 'Can ImportUSBData employee', 39, 'import_u_s_b_data_employee'),
	(376, 'Can AdjustDepartment employee', 39, 'adjust_department_employee'),
	(377, 'Can PositionTransfer employee', 39, 'position_transfer_employee'),
	(378, 'Can AdjustArea employee', 39, 'adjust_area_employee'),
	(379, 'Can PassProbation employee', 39, 'pass_probation_employee'),
	(380, 'Can Resignation employee', 39, 'resignation_employee'),
	(381, 'Can EnableApp employee', 39, 'enable_app_employee'),
	(382, 'Can DisableApp employee', 39, 'disable_app_employee'),
	(383, 'Can ResynchronizeDevice employee', 39, 'resynchronize_device_employee'),
	(384, 'Can ReUploadFromDevice employee', 39, 're_upload_from_device_employee'),
	(385, 'Can DeleteBiometricTemplates employee', 39, 'delete_biometric_templates_employee'),
	(386, 'Can ExportUSBData employee', 39, 'export_u_s_b_data_employee'),
	(387, 'Can view employment', 156, 'view_employment'),
	(388, 'Can view assignareaemployee', 154, 'view_assignareaemployee'),
	(389, 'Can AddEmployeeResign resign', 41, 'add_employee_resign_resign'),
	(390, 'Can Reinstatement resign', 41, 'reinstatement_resign'),
	(391, 'Can Import resign', 41, 'import_resign'),
	(392, 'Can DisableAttendanceFunction resign', 41, 'disable_attendance_function_resign'),
	(393, 'Can AddEmployeeCert employeecertification', 42, 'add_employee_cert_employeecertification'),
	(394, 'Can Import employeecertification', 42, 'import_employeecertification'),
	(395, 'Can view employeeprofile', 155, 'view_employeeprofile'),
	(396, 'Can view employeecalendar', 157, 'view_employeecalendar'),
	(397, 'Can view employeecustomattribute', 43, 'view_employeecustomattribute'),
	(398, 'Can view employeeextrainfo', 158, 'view_employeeextrainfo'),
	(399, 'Can view personnelsettingpermission', 159, 'view_personnelsettingpermission'),
	(400, 'Can add workflow_node_instance', 160, 'add_nodeinstance'),
	(401, 'Can change workflow_node_instance', 160, 'change_nodeinstance'),
	(402, 'Can delete workflow_node_instance', 160, 'delete_nodeinstance'),
	(403, 'Can delete workflow_model_workflowEngine', 59, 'delete_workflowengine'),
	(404, 'Can change workflow_model_workflowEngine', 59, 'change_workflowengine'),
	(405, 'Can view workflow_model_workflowEngine', 59, 'view_workflowengine'),
	(406, 'Can add workflow instance', 161, 'add_workflowinstance'),
	(407, 'Can change workflow instance', 161, 'change_workflowinstance'),
	(408, 'Can delete workflow instance', 161, 'delete_workflowinstance'),
	(409, 'Can add workflow_model_workflowNode', 60, 'add_workflownode'),
	(410, 'Can change workflow_model_workflowNode', 60, 'change_workflownode'),
	(411, 'Can delete workflow_model_workflowNode', 60, 'delete_workflownode'),
	(412, 'Can add workflow_model_workflowRole', 58, 'add_workflowrole'),
	(413, 'Can change workflow_model_workflowRole', 58, 'change_workflowrole'),
	(414, 'Can delete workflow_model_workflowRole', 58, 'delete_workflowrole'),
	(415, 'Can view workflowrole', 58, 'view_workflowrole'),
	(416, 'Can WorkFlowRoleAssignEmployee workflowrole', 58, 'work_flow_role_assign_employee_workflowrole'),
	(417, 'Can WorkFlowSetupForDepartment workflowengine', 59, 'work_flow_setup_for_department_workflowengine'),
	(418, 'Can WorkFlowSetupForPosition workflowengine', 59, 'work_flow_setup_for_position_workflowengine'),
	(419, 'Can WorkFlowSetupForEmployee workflowengine', 59, 'work_flow_setup_for_employee_workflowengine'),
	(420, 'Can view workflownode', 60, 'view_workflownode'),
	(421, 'Can view nodeinstance', 160, 'view_nodeinstance'),
	(422, 'Can view workflowinstance', 161, 'view_workflowinstance'),
	(423, 'Can add att_calc_log', 162, 'add_attcalclog'),
	(424, 'Can change att_calc_log', 162, 'change_attcalclog'),
	(425, 'Can delete att_calc_log', 162, 'delete_attcalclog'),
	(426, 'Can change att.models.attCode', 62, 'change_attcode'),
	(427, 'Can view att.models.attCode', 62, 'view_attcode'),
	(428, 'Can add att.models.attEmployee', 163, 'add_attemployee'),
	(429, 'Can change att.models.attEmployee', 163, 'change_attemployee'),
	(430, 'Can delete att.models.attEmployee', 163, 'delete_attemployee'),
	(431, 'Can add att.models.attGroup', 63, 'add_attgroup'),
	(432, 'Can change att.models.attGroup', 63, 'change_attgroup'),
	(433, 'Can delete att.models.attGroup', 63, 'delete_attgroup'),
	(434, 'Can change att.models.attPolicy', 64, 'change_attpolicy'),
	(435, 'Can view att.models.attPolicy', 64, 'view_attpolicy'),
	(436, 'Can add att.model.calculateItem', 84, 'add_attreportsetting'),
	(437, 'Can change att.model.calculateItem', 84, 'change_attreportsetting'),
	(438, 'Can delete att.model.calculateItem', 84, 'delete_attreportsetting'),
	(439, 'Can add att_model_attRule', 67, 'add_attrule'),
	(440, 'Can change att_model_attRule', 67, 'change_attrule'),
	(441, 'Can delete att_model_attRule', 67, 'delete_attrule'),
	(442, 'Can delete att_model_schedule', 72, 'delete_attschedule'),
	(443, 'Can view att_model_schedule', 72, 'view_attschedule'),
	(444, 'Can add att_model_shift', 71, 'add_attshift'),
	(445, 'Can change att_model_shift', 71, 'change_attshift'),
	(446, 'Can delete att_model_shift', 71, 'delete_attshift'),
	(447, 'Can add att_model_breakTime', 80, 'add_breaktime'),
	(448, 'Can change att_model_breakTime', 80, 'change_breaktime'),
	(449, 'Can delete att_model_breakTime', 80, 'delete_breaktime'),
	(450, 'Can add att_model_changeSchedule', 81, 'add_changeschedule'),
	(451, 'Can change att_model_changeSchedule', 81, 'change_changeschedule'),
	(452, 'Can delete att_model_changeSchedule', 81, 'delete_changeschedule'),
	(453, 'Can delete att.models.departmentPolicy', 65, 'delete_departmentpolicy'),
	(454, 'Can change att.models.departmentPolicy', 65, 'change_departmentpolicy'),
	(455, 'Can view att.models.departmentPolicy', 65, 'view_departmentpolicy'),
	(456, 'Can delete att_model_deptSchedule', 82, 'delete_departmentschedule'),
	(457, 'Can view att_model_deptSchedule', 82, 'view_departmentschedule'),
	(458, 'Can delete att_model_deptAttRule', 79, 'delete_deptattrule'),
	(459, 'Can change att_model_deptAttRule', 79, 'change_deptattrule'),
	(460, 'Can view att_model_deptAttRule', 79, 'view_deptattrule'),
	(461, 'Can delete att.models.groupPolicy', 66, 'delete_grouppolicy'),
	(462, 'Can change att.models.groupPolicy', 66, 'change_grouppolicy'),
	(463, 'Can view att.models.groupPolicy', 66, 'view_grouppolicy'),
	(464, 'Can delete att.models.groupSchedule', 83, 'delete_groupschedule'),
	(465, 'Can view att.models.groupSchedule', 83, 'view_groupschedule'),
	(466, 'Can delete att_model_holiday', 78, 'delete_holiday'),
	(467, 'Can change att_model_holiday', 78, 'change_holiday'),
	(468, 'Can view att_model_holiday', 78, 'view_holiday'),
	(469, 'Can delete att_model_leave', 75, 'delete_leave'),
	(470, 'Can change att_model_leave', 75, 'change_leave'),
	(471, 'Can view att_model_leave', 75, 'view_leave'),
	(472, 'Can delete att_model_manualLog', 69, 'delete_manuallog'),
	(473, 'Can change att_model_manualLog', 69, 'change_manuallog'),
	(474, 'Can view att_model_manualLog', 69, 'view_manuallog'),
	(475, 'Can delete att_model_overtime', 77, 'delete_overtime'),
	(476, 'Can change att_model_overtime', 77, 'change_overtime'),
	(477, 'Can view att_model_overtime', 77, 'view_overtime'),
	(478, 'Can add att.models.overtimePolicy', 164, 'add_overtimepolicy'),
	(479, 'Can change att.models.overtimePolicy', 164, 'change_overtimepolicy'),
	(480, 'Can delete att.models.overtimePolicy', 164, 'delete_overtimepolicy'),
	(481, 'Can add att.models.payCode', 61, 'add_paycode'),
	(482, 'Can change att.models.payCode', 61, 'change_paycode'),
	(483, 'Can delete att.models.payCode', 61, 'delete_paycode'),
	(484, 'Can add payload att code', 165, 'add_payloadattcode'),
	(485, 'Can change payload att code', 165, 'change_payloadattcode'),
	(486, 'Can delete payload att code', 165, 'delete_payloadattcode'),
	(487, 'Can add payload base', 166, 'add_payloadbase'),
	(488, 'Can change payload base', 166, 'change_payloadbase'),
	(489, 'Can delete payload base', 166, 'delete_payloadbase'),
	(490, 'Can add payload break', 167, 'add_payloadbreak'),
	(491, 'Can change payload break', 167, 'change_payloadbreak'),
	(492, 'Can delete payload break', 167, 'delete_payloadbreak'),
	(493, 'Can add payload effect punch', 168, 'add_payloadeffectpunch'),
	(494, 'Can change payload effect punch', 168, 'change_payloadeffectpunch'),
	(495, 'Can delete payload effect punch', 168, 'delete_payloadeffectpunch'),
	(496, 'Can add payload exception', 169, 'add_payloadexception'),
	(497, 'Can change payload exception', 169, 'change_payloadexception'),
	(498, 'Can delete payload exception', 169, 'delete_payloadexception'),
	(499, 'Can add payload mul punch set', 170, 'add_payloadmulpunchset'),
	(500, 'Can change payload mul punch set', 170, 'change_payloadmulpunchset'),
	(501, 'Can delete payload mul punch set', 170, 'delete_payloadmulpunchset'),
	(502, 'Can add payload overtime', 171, 'add_payloadovertime'),
	(503, 'Can change payload overtime', 171, 'change_payloadovertime'),
	(504, 'Can delete payload overtime', 171, 'delete_payloadovertime'),
	(505, 'Can add payload paring', 172, 'add_payloadparing'),
	(506, 'Can change payload paring', 172, 'change_payloadparing'),
	(507, 'Can delete payload paring', 172, 'delete_payloadparing'),
	(508, 'Can add payload pay code', 173, 'add_payloadpaycode'),
	(509, 'Can change payload pay code', 173, 'change_payloadpaycode'),
	(510, 'Can delete payload pay code', 173, 'delete_payloadpaycode'),
	(511, 'Can add payload punch', 174, 'add_payloadpunch'),
	(512, 'Can change payload punch', 174, 'change_payloadpunch'),
	(513, 'Can delete payload punch', 174, 'delete_payloadpunch'),
	(514, 'Can add att.models.payloadTimeCard', 175, 'add_payloadtimecard'),
	(515, 'Can change att.models.payloadTimeCard', 175, 'change_payloadtimecard'),
	(516, 'Can delete att.models.payloadTimeCard', 175, 'delete_payloadtimecard'),
	(517, 'Can add att_model_reportParameter', 68, 'add_reportparam'),
	(518, 'Can change att_model_reportParameter', 68, 'change_reportparam'),
	(519, 'Can delete att_model_reportParameter', 68, 'delete_reportparam'),
	(520, 'Can add att_model_reportTemplate', 176, 'add_reporttemplate'),
	(521, 'Can change att_model_reportTemplate', 176, 'change_reporttemplate'),
	(522, 'Can delete att_model_reportTemplate', 176, 'delete_reporttemplate'),
	(523, 'Can add att_model_shiftDetail', 177, 'add_shiftdetail'),
	(524, 'Can change att_model_shiftDetail', 177, 'change_shiftdetail'),
	(525, 'Can delete att_model_shiftDetail', 177, 'delete_shiftdetail'),
	(526, 'Can delete att.models.temporarySchedule', 74, 'delete_temporaryschedule'),
	(527, 'Can view att.models.temporarySchedule', 74, 'view_temporaryschedule'),
	(528, 'Can delete att_model_tempSchedule', 73, 'delete_tempschedule'),
	(529, 'Can change att_model_tempSchedule', 73, 'change_tempschedule'),
	(530, 'Can view att_model_tempSchedule', 73, 'view_tempschedule'),
	(531, 'Can delete att_model_timeInterval', 70, 'delete_timeinterval'),
	(532, 'Can change att_model_timeInterval', 70, 'change_timeinterval'),
	(533, 'Can view att_model_timeInterval', 70, 'view_timeinterval'),
	(534, 'Can delete att_model_training', 76, 'delete_training'),
	(535, 'Can change att_model_training', 76, 'change_training'),
	(536, 'Can view att_model_training', 76, 'view_training'),
	(537, 'Can add Att Setting Permission', 1, 'add_attsettingpermission'),
	(538, 'Can change Att Setting Permission', 1, 'change_attsettingpermission'),
	(539, 'Can delete Att Setting Permission', 1, 'delete_attsettingpermission'),
	(540, 'Can add Report Permission', 1, 'add_reportpermission'),
	(541, 'Can change Report Permission', 1, 'change_reportpermission'),
	(542, 'Can delete Report Permission', 1, 'delete_reportpermission'),
	(543, 'Can delete menu_att_leavegroup', 85, 'delete_leavegroup'),
	(544, 'Can change menu_att_leavegroup', 85, 'change_leavegroup'),
	(545, 'Can view menu_att_leavegroup', 85, 'view_leavegroup'),
	(546, 'Can add att_model_leavegroupdetail', 86, 'add_leavegroupdetail'),
	(547, 'Can change att_model_leavegroupdetail', 86, 'change_leavegroupdetail'),
	(548, 'Can delete att_model_leavegroupdetail', 86, 'delete_leavegroupdetail'),
	(549, 'Can add att_model_leaveYearBalance', 87, 'add_leaveyearbalance'),
	(550, 'Can change att_model_leaveYearBalance', 87, 'change_leaveyearbalance'),
	(551, 'Can delete att_model_leaveYearBalance', 87, 'delete_leaveyearbalance'),
	(552, 'Can add att.models.webPunch', 178, 'add_webpunch'),
	(553, 'Can change att.models.webPunch', 178, 'change_webpunch'),
	(554, 'Can delete att.models.webPunch', 178, 'delete_webpunch'),
	(555, 'Can add calculate last date', 179, 'add_calculatelastdate'),
	(556, 'Can change calculate last date', 179, 'change_calculatelastdate'),
	(557, 'Can delete calculate last date', 179, 'delete_calculatelastdate'),
	(558, 'Can add calculate task', 180, 'add_calculatetask'),
	(559, 'Can change calculate task', 180, 'change_calculatetask'),
	(560, 'Can delete calculate task', 180, 'delete_calculatetask'),
	(561, 'Can add Att Configurations Permission', 1, 'add_attconfigurationspermission'),
	(562, 'Can change Att Configurations Permission', 1, 'change_attconfigurationspermission'),
	(563, 'Can delete Att Configurations Permission', 1, 'delete_attconfigurationspermission'),
	(564, 'Can add Schedule View Permission', 1, 'add_scheduleviewpermission'),
	(565, 'Can change Schedule View Permission', 1, 'change_scheduleviewpermission'),
	(566, 'Can delete Schedule View Permission', 1, 'delete_scheduleviewpermission'),
	(567, 'Can add Staff Report Permission', 1, 'add_staffreportpermission'),
	(568, 'Can change Staff Report Permission', 1, 'change_staffreportpermission'),
	(569, 'Can delete Staff Report Permission', 1, 'delete_staffreportpermission'),
	(570, 'Can view paycode', 61, 'view_paycode'),
	(571, 'Can view attgroup', 63, 'view_attgroup'),
	(572, 'Can SetGroup attgroup', 63, 'set_group_attgroup'),
	(573, 'Can AddDepartmentPolicy departmentpolicy', 65, 'add_department_policy_departmentpolicy'),
	(574, 'Can AddGroupPolicy grouppolicy', 66, 'add_group_policy_grouppolicy'),
	(575, 'Can view attrule', 67, 'view_attrule'),
	(576, 'Can view attemployee', 163, 'view_attemployee'),
	(577, 'Can view attshift', 71, 'view_attshift'),
	(578, 'Can AddAttSchedule attschedule', 72, 'add_att_schedule_attschedule'),
	(579, 'Can Import attschedule', 72, 'import_attschedule'),
	(580, 'Can view breaktime', 80, 'view_breaktime'),
	(581, 'Can AddDepartmentHoliday holiday', 78, 'add_department_holiday_holiday'),
	(582, 'Can AddLeave leave', 75, 'add_leave_leave'),
	(583, 'Can BulkAddLeave leave', 75, 'bulk_add_leave_leave'),
	(584, 'Can ApproveLeave leave', 75, 'approve_leave_leave'),
	(585, 'Can Reject leave', 75, 'reject_leave'),
	(586, 'Can Revoke leave', 75, 'revoke_leave'),
	(587, 'Can Import leave', 75, 'import_leave'),
	(588, 'Can AddManualLog manuallog', 69, 'add_manual_log_manuallog'),
	(589, 'Can BulkAddManualLog manuallog', 69, 'bulk_add_manual_log_manuallog'),
	(590, 'Can Approve manuallog', 69, 'approve_manuallog'),
	(591, 'Can Reject manuallog', 69, 'reject_manuallog'),
	(592, 'Can Revoke manuallog', 69, 'revoke_manuallog'),
	(593, 'Can Import manuallog', 69, 'import_manuallog'),
	(594, 'Can AddOvertime overtime', 77, 'add_overtime_overtime'),
	(595, 'Can BulkAddOvertime overtime', 77, 'bulk_add_overtime_overtime'),
	(596, 'Can Approve overtime', 77, 'approve_overtime'),
	(597, 'Can Reject overtime', 77, 'reject_overtime'),
	(598, 'Can Revoke overtime', 77, 'revoke_overtime'),
	(599, 'Can Import overtime', 77, 'import_overtime'),
	(600, 'Can view reportparam', 68, 'view_reportparam'),
	(601, 'Can view attreportsetting', 84, 'view_attreportsetting'),
	(602, 'Can AddNormalTimetable timeinterval', 70, 'add_normal_timetable_timeinterval'),
	(603, 'Can AddFlexibleTimetable timeinterval', 70, 'add_flexible_timetable_timeinterval'),
	(604, 'Can view shiftdetail', 177, 'view_shiftdetail'),
	(605, 'Can AddTempSchedule tempschedule', 73, 'add_temp_schedule_tempschedule'),
	(606, 'Can Import tempschedule', 73, 'import_tempschedule'),
	(607, 'Can AddTemporarySchedule temporaryschedule', 74, 'add_temporary_schedule_temporaryschedule'),
	(608, 'Can ImportTemporarySchedule temporaryschedule', 74, 'import_temporary_schedule_temporaryschedule'),
	(609, 'Can AddTraining training', 76, 'add_training_training'),
	(610, 'Can BulkAddTraining training', 76, 'bulk_add_training_training'),
	(611, 'Can Approve training', 76, 'approve_training'),
	(612, 'Can Reject training', 76, 'reject_training'),
	(613, 'Can Revoke training', 76, 'revoke_training'),
	(614, 'Can Import training', 76, 'import_training'),
	(615, 'Can BatchAddDepartmentRule deptattrule', 79, 'batch_add_department_rule_deptattrule'),
	(616, 'Can view changeschedule', 81, 'view_changeschedule'),
	(617, 'Can Approve changeschedule', 81, 'approve_changeschedule'),
	(618, 'Can Reject changeschedule', 81, 'reject_changeschedule'),
	(619, 'Can Revoke changeschedule', 81, 'revoke_changeschedule'),
	(620, 'Can AddDepartmentSchedule departmentschedule', 82, 'add_department_schedule_departmentschedule'),
	(621, 'Can AddGroupSchedule groupschedule', 83, 'add_group_schedule_groupschedule'),
	(622, 'Can view calculatetask', 180, 'view_calculatetask'),
	(623, 'Can view payloadtimecard', 175, 'view_payloadtimecard'),
	(624, 'Can view payloadpaycode', 173, 'view_payloadpaycode'),
	(625, 'Can view payloadattcode', 165, 'view_payloadattcode'),
	(626, 'Can view payloadparing', 172, 'view_payloadparing'),
	(627, 'Can view payloadeffectpunch', 168, 'view_payloadeffectpunch'),
	(628, 'Can view payloadovertime', 171, 'view_payloadovertime'),
	(629, 'Can view payloadbreak', 167, 'view_payloadbreak'),
	(630, 'Can view payloadbase', 166, 'view_payloadbase'),
	(631, 'Can view payloadpunch', 174, 'view_payloadpunch'),
	(632, 'Can view payloadexception', 169, 'view_payloadexception'),
	(633, 'Can view payloadmulpunchset', 170, 'view_payloadmulpunchset'),
	(634, 'Can view overtimepolicy', 164, 'view_overtimepolicy'),
	(635, 'Can view reporttemplate', 176, 'view_reporttemplate'),
	(636, 'Can AssignLeaveGroup leavegroup', 85, 'assign_leave_group_leavegroup'),
	(637, 'Can AddLeaveGroup leavegroup', 85, 'add_leave_group_leavegroup'),
	(638, 'Can view leavegroupdetail', 86, 'view_leavegroupdetail'),
	(639, 'Can view leaveyearbalance', 87, 'view_leaveyearbalance'),
	(640, 'Can view webpunch', 178, 'view_webpunch'),
	(641, 'Can view calculatelastdate', 179, 'view_calculatelastdate'),
	(642, 'Can view staffreportpermission', 185, 'view_staffreportpermission'),
	(643, 'Can view reportpermission', 182, 'view_reportpermission'),
	(644, 'Can view attsettingpermission', 181, 'view_attsettingpermission'),
	(645, 'Can view attconfigurationspermission', 183, 'view_attconfigurationspermission'),
	(646, 'Can view scheduleviewpermission', 184, 'view_scheduleviewpermission'),
	(647, 'Can view attcalclog', 162, 'view_attcalclog'),
	(648, 'Can add base_model_user', 18, 'add_myuser'),
	(649, 'Can change base_model_user', 18, 'change_myuser'),
	(650, 'Can add iclock_model_bioData', 186, 'add_adminbiodata'),
	(651, 'Can change iclock_model_bioData', 186, 'change_adminbiodata'),
	(652, 'Can delete iclock_model_bioData', 186, 'delete_adminbiodata'),
	(653, 'Can add accounts.models.userNotification', 34, 'add_usernotification'),
	(654, 'Can change accounts.models.userNotification', 34, 'change_usernotification'),
	(655, 'Can delete accounts.models.userNotification', 34, 'delete_usernotification'),
	(656, 'can_enter_menu_system_module', 187, 'enter_system_module'),
	(657, 'can_enter_personnel_module', 187, 'enter_personnel_module'),
	(658, 'can_enter_terminal_module', 187, 'enter_terminal_module'),
	(659, 'can_enter_attendance_module', 187, 'enter_attendance_module'),
	(660, 'can_enter_payroll_module', 187, 'enter_payroll_module'),
	(661, 'can_enter_access_module', 187, 'enter_access_module'),
	(662, 'can_enter_visitor_module', 187, 'enter_visitor_module'),
	(663, 'can_enter_meeting_module', 187, 'enter_meeting_module'),
	(664, 'can_enter_ep_module', 187, 'enter_ep_module'),
	(665, 'Can view myuser', 18, 'view_myuser'),
	(666, 'Can ChangePassword myuser', 18, 'change_password_myuser'),
	(667, 'Can UserDelete myuser', 18, 'user_delete_myuser'),
	(668, 'Can view adminbiodata', 186, 'view_adminbiodata'),
	(669, 'Can view usernotification', 34, 'view_usernotification'),
	(670, 'Can MarkerAll usernotification', 34, 'marker_all_usernotification'),
	(671, 'Can add StaffToken', 188, 'add_stafftoken'),
	(672, 'Can change StaffToken', 188, 'change_stafftoken'),
	(673, 'Can delete StaffToken', 188, 'delete_stafftoken'),
	(674, 'Can view stafftoken', 188, 'view_stafftoken'),
	(675, 'Can view pendingleave', 195, 'view_pendingleave'),
	(676, 'Can StaffAddLeave pendingleave', 195, 'staff_add_leave_pendingleave'),
	(677, 'Can Revoke pendingleave', 195, 'revoke_pendingleave'),
	(678, 'Can view pendingovertime', 197, 'view_pendingovertime'),
	(679, 'Can StaffAddOverTime pendingovertime', 197, 'staff_add_over_time_pendingovertime'),
	(680, 'Can Revoke pendingovertime', 197, 'revoke_pendingovertime'),
	(681, 'Can view pendingmanuallog', 196, 'view_pendingmanuallog'),
	(682, 'Can StaffAddManualLog pendingmanuallog', 196, 'staff_add_manual_log_pendingmanuallog'),
	(683, 'Can Revoke pendingmanuallog', 196, 'revoke_pendingmanuallog'),
	(684, 'Can view pendingtraining', 198, 'view_pendingtraining'),
	(685, 'Can StaffAddTraining pendingtraining', 198, 'staff_add_training_pendingtraining'),
	(686, 'Can Revoke pendingtraining', 198, 'revoke_pendingtraining'),
	(687, 'Can view pendingchangeschedule', 194, 'view_pendingchangeschedule'),
	(688, 'Can view approvalleave', 190, 'view_approvalleave'),
	(689, 'Can StaffApproveLeave approvalleave', 190, 'staff_approve_leave_approvalleave'),
	(690, 'Can Reject approvalleave', 190, 'reject_approvalleave'),
	(691, 'Can view approvalovertime', 192, 'view_approvalovertime'),
	(692, 'Can Approve approvalovertime', 192, 'approve_approvalovertime'),
	(693, 'Can Reject approvalovertime', 192, 'reject_approvalovertime'),
	(694, 'Can view approvalmanuallog', 191, 'view_approvalmanuallog'),
	(695, 'Can Approve approvalmanuallog', 191, 'approve_approvalmanuallog'),
	(696, 'Can Reject approvalmanuallog', 191, 'reject_approvalmanuallog'),
	(697, 'Can view approvaltraining', 193, 'view_approvaltraining'),
	(698, 'Can Approve approvaltraining', 193, 'approve_approvaltraining'),
	(699, 'Can Reject approvaltraining', 193, 'reject_approvaltraining'),
	(700, 'Can view approvalchangeschedule', 189, 'view_approvalchangeschedule'),
	(701, 'Can Approve approvalchangeschedule', 189, 'approve_approvalchangeschedule'),
	(702, 'Can Reject approvalchangeschedule', 189, 'reject_approvalchangeschedule'),
	(703, 'Can view pendingreservation', 200, 'view_pendingreservation'),
	(704, 'Can StaffAddReservation pendingreservation', 200, 'staff_add_reservation_pendingreservation'),
	(705, 'Can Revoke pendingreservation', 200, 'revoke_pendingreservation'),
	(706, 'Can view approvalreservation', 199, 'view_approvalreservation'),
	(707, 'Can Approve approvalreservation', 199, 'approve_approvalreservation'),
	(708, 'Can Reject approvalreservation', 199, 'reject_approvalreservation'),
	(709, 'Can view pendingmeetingentity', 203, 'view_pendingmeetingentity'),
	(710, 'Can Revoke pendingmeetingentity', 203, 'revoke_pendingmeetingentity'),
	(711, 'Can AddMeetingAttender pendingmeetingentity', 203, 'add_meeting_attender_pendingmeetingentity'),
	(712, 'Can view pendingmeetingmanuallog', 204, 'view_pendingmeetingmanuallog'),
	(713, 'Can StaffAddMeetingManualLog pendingmeetingmanuallog', 204, 'staff_add_meeting_manual_log_pendingmeetingmanuallog'),
	(714, 'Can Revoke pendingmeetingmanuallog', 204, 'revoke_pendingmeetingmanuallog'),
	(715, 'Can view approvalmeetingentity', 201, 'view_approvalmeetingentity'),
	(716, 'Can Approve approvalmeetingentity', 201, 'approve_approvalmeetingentity'),
	(717, 'Can Reject approvalmeetingentity', 201, 'reject_approvalmeetingentity'),
	(718, 'Can view approvalmeetingmanuallog', 202, 'view_approvalmeetingmanuallog'),
	(719, 'Can Approve approvalmeetingmanuallog', 202, 'approve_approvalmeetingmanuallog'),
	(720, 'Can Reject approvalmeetingmanuallog', 202, 'reject_approvalmeetingmanuallog'),
	(721, 'Can delete app_model_announcement', 91, 'delete_announcement'),
	(722, 'Can delete app_model_actionLog', 94, 'delete_appactionlog'),
	(723, 'Can delete app_model_appList', 92, 'delete_applist'),
	(724, 'Can delete app_model_notification', 93, 'delete_appnotification'),
	(725, 'Can delete mobile_model_gpsForDepartment', 96, 'delete_gpsfordepartment'),
	(726, 'Can change mobile_model_gpsForDepartment', 96, 'change_gpsfordepartment'),
	(727, 'Can view mobile_model_gpsForDepartment', 96, 'view_gpsfordepartment'),
	(728, 'Can delete mobile_model_gpsForEmployee', 95, 'delete_gpsforemployee'),
	(729, 'Can change mobile_model_gpsForEmployee', 95, 'change_gpsforemployee'),
	(730, 'Can view mobile_model_gpsForEmployee', 95, 'view_gpsforemployee'),
	(731, 'Can add mobile_model_gpsLocation', 97, 'add_gpslocation'),
	(732, 'Can change mobile_model_gpsLocation', 97, 'change_gpslocation'),
	(733, 'Can delete mobile_model_gpsLocation', 97, 'delete_gpslocation'),
	(734, 'Can add mobile api request log', 98, 'add_mobileapirequestlog'),
	(735, 'Can change mobile api request log', 98, 'change_mobileapirequestlog'),
	(736, 'Can delete mobile api request log', 98, 'delete_mobileapirequestlog'),
	(737, 'Can view appactionlog', 94, 'view_appactionlog'),
	(738, 'Can view applist', 92, 'view_applist'),
	(739, 'Can PushNotification applist', 92, 'push_notification_applist'),
	(740, 'Can ForceOffline applist', 92, 'force_offline_applist'),
	(741, 'Can Disable applist', 92, 'disable_applist'),
	(742, 'Can Enable applist', 92, 'enable_applist'),
	(743, 'Can view announcement', 91, 'view_announcement'),
	(744, 'Can AddPublicNotice announcement', 91, 'add_public_notice_announcement'),
	(745, 'Can AddPrivateNotice announcement', 91, 'add_private_notice_announcement'),
	(746, 'Can view appnotification', 93, 'view_appnotification'),
	(747, 'Can view gpslocation', 97, 'view_gpslocation'),
	(748, 'Can AddGPSForDepartment gpsfordepartment', 96, 'add_g_p_s_for_department_gpsfordepartment'),
	(749, 'Can AddGPSForEmployee gpsforemployee', 95, 'add_g_p_s_for_employee_gpsforemployee'),
	(750, 'Can view mobileapirequestlog', 98, 'view_mobileapirequestlog'),
	(751, 'Can add payroll_model_deductionFormula', 100, 'add_deductionformula'),
	(752, 'Can change payroll_model_deductionFormula', 100, 'change_deductionformula'),
	(753, 'Can delete payroll_model_deductionFormula', 100, 'delete_deductionformula'),
	(754, 'Can delete payroll_model_empLoan', 105, 'delete_emploan'),
	(755, 'Can change payroll_model_empPayrollProfile', 99, 'change_emppayrollprofile'),
	(756, 'Can view payroll_model_empPayrollProfile', 99, 'view_emppayrollprofile'),
	(757, 'Can add payroll_model_exceptionFormula', 101, 'add_exceptionformula'),
	(758, 'Can change payroll_model_exceptionFormula', 101, 'change_exceptionformula'),
	(759, 'Can delete payroll_model_exceptionFormula', 101, 'delete_exceptionformula'),
	(760, 'Can delete payroll_model_extraDeduction', 110, 'delete_extradeduction'),
	(761, 'Can change payroll_model_extraDeduction', 110, 'change_extradeduction'),
	(762, 'Can view payroll_model_extraDeduction', 110, 'view_extradeduction'),
	(763, 'Can delete payroll_model_extraIncrease', 109, 'delete_extraincrease'),
	(764, 'Can change payroll_model_extraIncrease', 109, 'change_extraincrease'),
	(765, 'Can view payroll_model_extraIncrease', 109, 'view_extraincrease'),
	(766, 'Can add payroll_model_increasementFormula', 102, 'add_increasementformula'),
	(767, 'Can change payroll_model_increasementFormula', 102, 'change_increasementformula'),
	(768, 'Can delete payroll_model_increasementFormula', 102, 'delete_increasementformula'),
	(769, 'Can add payroll_model_leaveFormula', 103, 'add_leaveformula'),
	(770, 'Can change payroll_model_leaveFormula', 103, 'change_leaveformula'),
	(771, 'Can delete payroll_model_leaveFormula', 103, 'delete_leaveformula'),
	(772, 'Can add payroll_model_overtimeFormula', 104, 'add_overtimeformula'),
	(773, 'Can change payroll_model_overtimeFormula', 104, 'change_overtimeformula'),
	(774, 'Can delete payroll_model_overtimeFormula', 104, 'delete_overtimeformula'),
	(775, 'Can add payroll_model_payroll_payload', 205, 'add_payrollpayload'),
	(776, 'Can change payroll_model_payroll_payload', 205, 'change_payrollpayload'),
	(777, 'Can delete payroll_model_payroll_payload', 205, 'delete_payrollpayload'),
	(778, 'Can add payroll payload pay code', 206, 'add_payrollpayloadpaycode'),
	(779, 'Can change payroll payload pay code', 206, 'change_payrollpayloadpaycode'),
	(780, 'Can delete payroll payload pay code', 206, 'delete_payrollpayloadpaycode'),
	(781, 'Can delete payroll_model_Reimbursement', 106, 'delete_reimbursement'),
	(782, 'Can delete payroll_model_SalaryAdvance', 107, 'delete_salaryadvance'),
	(783, 'Can delete payroll_model_salarystructure', 108, 'delete_salarystructure'),
	(784, 'Can change payroll_model_salarystructure', 108, 'change_salarystructure'),
	(785, 'Can view payroll_model_salarystructure', 108, 'view_salarystructure'),
	(786, 'Can add Payroll Report Permission', 1, 'add_payrollreportpermission'),
	(787, 'Can change Payroll Report Permission', 1, 'change_payrollreportpermission'),
	(788, 'Can delete Payroll Report Permission', 1, 'delete_payrollreportpermission'),
	(789, 'Can add Staff Payroll Report Permission', 1, 'add_staffpayrollreportpermission'),
	(790, 'Can change Staff Payroll Report Permission', 1, 'change_staffpayrollreportpermission'),
	(791, 'Can delete Staff Payroll Report Permission', 1, 'delete_staffpayrollreportpermission'),
	(792, 'Can view payrollreportpermission', 207, 'view_payrollreportpermission'),
	(793, 'Can view staffpayrollreportpermission', 208, 'view_staffpayrollreportpermission'),
	(794, 'Can view deductionformula', 100, 'view_deductionformula'),
	(795, 'Can view exceptionformula', 101, 'view_exceptionformula'),
	(796, 'Can view increasementformula', 102, 'view_increasementformula'),
	(797, 'Can view leaveformula', 103, 'view_leaveformula'),
	(798, 'Can view overtimeformula', 104, 'view_overtimeformula'),
	(799, 'Can view emploan', 105, 'view_emploan'),
	(800, 'Can AddEmpLoanAction emploan', 105, 'add_emp_loan_action_emploan'),
	(801, 'Can view reimbursement', 106, 'view_reimbursement'),
	(802, 'Can AddReimbursementAction reimbursement', 106, 'add_reimbursement_action_reimbursement'),
	(803, 'Can view salaryadvance', 107, 'view_salaryadvance'),
	(804, 'Can AddSalaryAdvanceAction salaryadvance', 107, 'add_salary_advance_action_salaryadvance'),
	(805, 'Can AddSalaryStructureAction salarystructure', 108, 'add_salary_structure_action_salarystructure'),
	(806, 'Can AddExtraIncreaseAction extraincrease', 109, 'add_extra_increase_action_extraincrease'),
	(807, 'Can AddExtraDeductionAction extradeduction', 110, 'add_extra_deduction_action_extradeduction'),
	(808, 'Can view payrollpayload', 205, 'view_payrollpayload'),
	(809, 'Can view payrollpayloadpaycode', 206, 'view_payrollpayloadpaycode'),
	(810, 'Can add acc_combination', 114, 'add_acccombination'),
	(811, 'Can change acc_combination', 114, 'change_acccombination'),
	(812, 'Can delete acc_combination', 114, 'delete_acccombination'),
	(813, 'Can add acc_groups', 113, 'add_accgroups'),
	(814, 'Can change acc_groups', 113, 'change_accgroups'),
	(815, 'Can delete acc_groups', 113, 'delete_accgroups'),
	(816, 'Can add acc_holiday', 112, 'add_accholiday'),
	(817, 'Can change acc_holiday', 112, 'change_accholiday'),
	(818, 'Can delete acc_holiday', 112, 'delete_accholiday'),
	(819, 'Can add acc_privilege', 115, 'add_accprivilege'),
	(820, 'Can change acc_privilege', 115, 'change_accprivilege'),
	(821, 'Can delete acc_privilege', 115, 'delete_accprivilege'),
	(822, 'Can change menu_access_terminal', 116, 'change_accterminal'),
	(823, 'Can view menu_access_terminal', 116, 'view_accterminal'),
	(824, 'Can add acc_timezone', 111, 'add_acctimezone'),
	(825, 'Can change acc_timezone', 111, 'change_acctimezone'),
	(826, 'Can delete acc_timezone', 111, 'delete_acctimezone'),
	(827, 'Can view acctimezone', 111, 'view_acctimezone'),
	(828, 'Can CloneToArea acctimezone', 111, 'clone_to_area_acctimezone'),
	(829, 'Can view accholiday', 112, 'view_accholiday'),
	(830, 'Can CloneToArea accholiday', 112, 'clone_to_area_accholiday'),
	(831, 'Can view accgroups', 113, 'view_accgroups'),
	(832, 'Can CloneToArea accgroups', 113, 'clone_to_area_accgroups'),
	(833, 'Can SetEmployeeGroup accgroups', 113, 'set_employee_group_accgroups'),
	(834, 'Can view acccombination', 114, 'view_acccombination'),
	(835, 'Can CloneToArea acccombination', 114, 'clone_to_area_acccombination'),
	(836, 'Can view accprivilege', 115, 'view_accprivilege'),
	(837, 'Can AdjustEmployeePrivilege accprivilege', 115, 'adjust_employee_privilege_accprivilege'),
	(838, 'Can OpenDoor accterminal', 116, 'open_door_accterminal'),
	(839, 'Can CancelAlarm accterminal', 116, 'cancel_alarm_accterminal'),
	(840, 'Can SetParameter accterminal', 116, 'set_parameter_accterminal'),
	(841, 'Can add visitor.field.reason', 118, 'add_reason'),
	(842, 'Can change visitor.field.reason', 118, 'change_reason'),
	(843, 'Can delete visitor.field.reason', 118, 'delete_reason'),
	(844, 'Can change menu.visitor.reservation', 88, 'change_reservation'),
	(845, 'Can delete menu.visitor.reservation', 88, 'delete_reservation'),
	(846, 'Can add menu.visitor', 117, 'add_visitor'),
	(847, 'Can change menu.visitor', 117, 'change_visitor'),
	(848, 'Can delete menu.visitor', 117, 'delete_visitor'),
	(849, 'Can change visitor.model.configuration', 120, 'change_visitorconfig'),
	(850, 'Can view visitor.model.configuration', 120, 'view_visitorconfig'),
	(851, 'Can delete model.visitor.log', 119, 'delete_visitorlog'),
	(852, 'Can view model.visitor.log', 119, 'view_visitorlog'),
	(853, 'Can view visitor.model.VisitorBioData', 122, 'view_visitorbiodata'),
	(854, 'Can delete visitor.model.VisitorBioPhoto', 121, 'delete_visitorbiophoto'),
	(855, 'Can view visitor.model.VisitorBioPhoto', 121, 'view_visitorbiophoto'),
	(856, 'Can add visitor.models.visitorTransaction', 123, 'add_visitortransaction'),
	(857, 'Can change visitor.models.visitorTransaction', 123, 'change_visitortransaction'),
	(858, 'Can delete visitor.models.visitorTransaction', 123, 'delete_visitortransaction'),
	(859, 'Can view reason', 118, 'view_reason'),
	(860, 'Can view visitor', 117, 'view_visitor'),
	(861, 'Can ExitRegistration visitor', 117, 'exit_registration_visitor'),
	(862, 'Can view reservation', 88, 'view_reservation'),
	(863, 'Can AddReservation reservation', 88, 'add_reservation_reservation'),
	(864, 'Can Approve reservation', 88, 'approve_reservation'),
	(865, 'Can Reject reservation', 88, 'reject_reservation'),
	(866, 'Can Revoke reservation', 88, 'revoke_reservation'),
	(867, 'Can ReservationQRCode reservation', 88, 'reservation_q_r_code_reservation'),
	(868, 'Can EnableVisitor visitorlog', 119, 'enable_visitor_visitorlog'),
	(869, 'Can DisableVisitor visitorlog', 119, 'disable_visitor_visitorlog'),
	(870, 'Can VisitorBioPhotoApprove visitorbiophoto', 121, 'visitor_bio_photo_approve_visitorbiophoto'),
	(871, 'Can VisitorBioPhotoQRCode visitorbiophoto', 121, 'visitor_bio_photo_q_r_code_visitorbiophoto'),
	(872, 'Can view visitortransaction', 123, 'view_visitortransaction'),
	(873, 'Can add meeting.models.meetingEntity', 89, 'add_meetingentity'),
	(874, 'Can change meeting.models.meetingEntity', 89, 'change_meetingentity'),
	(875, 'Can delete meeting.models.meetingEntity', 89, 'delete_meetingentity'),
	(876, 'Can delete meeting.models.manualLog', 90, 'delete_meetingmanuallog'),
	(877, 'Can change meeting.models.manualLog', 90, 'change_meetingmanuallog'),
	(878, 'Can view meeting.models.manualLog', 90, 'view_meetingmanuallog'),
	(879, 'Can add meeting.models.meetingPayloadBase', 209, 'add_meetingpayloadbase'),
	(880, 'Can change meeting.models.meetingPayloadBase', 209, 'change_meetingpayloadbase'),
	(881, 'Can delete meeting.models.meetingPayloadBase', 209, 'delete_meetingpayloadbase'),
	(882, 'Can delete meeting.models.meetingRoom', 124, 'delete_meetingroom'),
	(883, 'Can change meeting.models.meetingRoom', 124, 'change_meetingroom'),
	(884, 'Can view meeting.models.meetingRoom', 124, 'view_meetingroom'),
	(885, 'Can add meeting.models.device', 125, 'add_meetingroomdevice'),
	(886, 'Can change meeting.models.device', 125, 'change_meetingroomdevice'),
	(887, 'Can delete meeting.models.device', 125, 'delete_meetingroomdevice'),
	(888, 'Can view meeting.models.transaction', 126, 'view_meetingtransaction'),
	(889, 'Can add Meeting Report Permission', 1, 'add_meetingreportpermission'),
	(890, 'Can change Meeting Report Permission', 1, 'change_meetingreportpermission'),
	(891, 'Can delete Meeting Report Permission', 1, 'delete_meetingreportpermission'),
	(892, 'Can view meetingreportpermission', 210, 'view_meetingreportpermission'),
	(893, 'Can AddMeetingRoom meetingroom', 124, 'add_meeting_room_meetingroom'),
	(894, 'Can view meetingroomdevice', 125, 'view_meetingroomdevice'),
	(895, 'Can view meetingentity', 89, 'view_meetingentity'),
	(896, 'Can MeetingCalculation meetingentity', 89, 'meeting_calculation_meetingentity'),
	(897, 'Can Approve meetingentity', 89, 'approve_meetingentity'),
	(898, 'Can Revoke meetingentity', 89, 'revoke_meetingentity'),
	(899, 'Can Reject meetingentity', 89, 'reject_meetingentity'),
	(900, 'Can AddMeetingAttender meetingentity', 89, 'add_meeting_attender_meetingentity'),
	(901, 'Can SyncMeeting2Device meetingentity', 89, 'sync_meeting2_device_meetingentity'),
	(902, 'Can AddMeetingManualLog meetingmanuallog', 90, 'add_meeting_manual_log_meetingmanuallog'),
	(903, 'Can Approve meetingmanuallog', 90, 'approve_meetingmanuallog'),
	(904, 'Can Reject meetingmanuallog', 90, 'reject_meetingmanuallog'),
	(905, 'Can Revoke meetingmanuallog', 90, 'revoke_meetingmanuallog'),
	(906, 'Can view meetingpayloadbase', 209, 'view_meetingpayloadbase'),
	(907, 'Can add ep.models.epSetup', 127, 'add_epsetup'),
	(908, 'Can change ep.models.epSetup', 127, 'change_epsetup'),
	(909, 'Can delete ep.models.epSetup', 127, 'delete_epsetup'),
	(910, 'Can add ep.models.epTransaction', 128, 'add_eptransaction'),
	(911, 'Can change ep.models.epTransaction', 128, 'change_eptransaction'),
	(912, 'Can delete ep.models.epTransaction', 128, 'delete_eptransaction'),
	(913, 'Can add Ep Dashboard Permission', 1, 'add_epdashboardpermission'),
	(914, 'Can change Ep Dashboard Permission', 1, 'change_epdashboardpermission'),
	(915, 'Can delete Ep Dashboard Permission', 1, 'delete_epdashboardpermission'),
	(916, 'Can add Report Permission', 1, 'add_epreportpermission'),
	(917, 'Can change Report Permission', 1, 'change_epreportpermission'),
	(918, 'Can delete Report Permission', 1, 'delete_epreportpermission'),
	(919, 'Can view epdashboardpermission', 211, 'view_epdashboardpermission'),
	(920, 'Can view epreportpermission', 212, 'view_epreportpermission'),
	(921, 'Can view epsetup', 127, 'view_epsetup'),
	(922, 'Can view eptransaction', 128, 'view_eptransaction');

-- Dumping structure for table rmci.bio.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `emp_pin` varchar(30) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `tele_phone` varchar(30) DEFAULT NULL,
  `auth_time_dept` int DEFAULT NULL,
  `login_id` int DEFAULT NULL,
  `login_type` int DEFAULT NULL,
  `login_count` int DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `can_manage_all_dept` tinyint(1) NOT NULL,
  `del_flag` int DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `session_key` varchar(32) DEFAULT NULL,
  `login_ip` varchar(32) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `assign_company` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_user: ~0 rows (approximately)
INSERT INTO `auth_user` (`id`, `username`, `password`, `update_time`, `first_name`, `last_name`, `emp_pin`, `email`, `tele_phone`, `auth_time_dept`, `login_id`, `login_type`, `login_count`, `is_staff`, `is_active`, `is_superuser`, `is_public`, `can_manage_all_dept`, `del_flag`, `date_joined`, `last_login`, `session_key`, `login_ip`, `photo`, `assign_company`) VALUES
	(1, 'rmci@jeco', 'pbkdf2_sha256$36000$uDn3fEz2u3lW$GLzgosmU3v6km5wfBrBULqo3/bee7i9nSzWX7Q0QLzE=', '2024-08-16 15:05:39.537654', '', '', NULL, 'jec.floro@gmail.com', NULL, 0, 0, 0, 2, 1, 1, 1, 0, 0, 0, '2024-08-16 15:05:39.537654', '2024-08-19 08:38:49.661524', NULL, NULL, 'user/default.gif', NULL);

-- Dumping structure for table rmci.bio.auth_user_auth_area
CREATE TABLE IF NOT EXISTS `auth_user_auth_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_auth_area_myuser_id_area_id_02a19d63_uniq` (`myuser_id`,`area_id`),
  KEY `auth_user_auth_area_area_id_d1e54c70_fk_personnel_area_id` (`area_id`),
  CONSTRAINT `auth_user_auth_area_area_id_d1e54c70_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  CONSTRAINT `auth_user_auth_area_myuser_id_5fb9a803_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_user_auth_area: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.auth_user_auth_dept
CREATE TABLE IF NOT EXISTS `auth_user_auth_dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` int NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_auth_dept_myuser_id_department_id_61d83386_uniq` (`myuser_id`,`department_id`),
  KEY `auth_user_auth_dept_department_id_5866c514_fk_personnel` (`department_id`),
  CONSTRAINT `auth_user_auth_dept_department_id_5866c514_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  CONSTRAINT `auth_user_auth_dept_myuser_id_18a51b27_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_user_auth_dept: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_myuser_id_group_id_664bdfc3_uniq` (`myuser_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_myuser_id_d03e8dcc_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_user_groups: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.auth_user_profile
CREATE TABLE IF NOT EXISTS `auth_user_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_name` varchar(30) NOT NULL,
  `pin_tabs` longtext NOT NULL,
  `disabled_fields` longtext NOT NULL,
  `column_order` longtext NOT NULL,
  `preferences` longtext NOT NULL,
  `pwd_update_time` datetime(6) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_user_profile_user_id_f9aded29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_user_profile: ~0 rows (approximately)
INSERT INTO `auth_user_profile` (`id`, `login_name`, `pin_tabs`, `disabled_fields`, `column_order`, `preferences`, `pwd_update_time`, `user_id`) VALUES
	(1, 'rmci@jeco', '', '', '', '{"need_set_protection_question": false, "questions": {"question_first": "WHO AM I?", "answer_first": "JECO", "question_second": "", "answer_second": "", "question_third": "", "answer_third": ""}}', NULL, 1);

-- Dumping structure for table rmci.bio.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_myuser_id_permission_id_a558717f_uniq` (`myuser_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_myuser_id_679b1527_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.auth_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_adminlog
CREATE TABLE IF NOT EXISTS `base_adminlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `targets` longtext,
  `targets_repr` longtext,
  `action_status` smallint NOT NULL,
  `description` longtext,
  `ip_address` char(39) DEFAULT NULL,
  `can_routable` tinyint(1) NOT NULL,
  `op_time` datetime(6) NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_adminlog_content_type_id_3e553c30_fk_django_content_type_id` (`content_type_id`),
  KEY `base_adminlog_user_id_ecf659f8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `base_adminlog_content_type_id_3e553c30_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `base_adminlog_user_id_ecf659f8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_adminlog: ~7 rows (approximately)
INSERT INTO `base_adminlog` (`id`, `action`, `targets`, `targets_repr`, `action_status`, `description`, `ip_address`, `can_routable`, `op_time`, `content_type_id`, `user_id`) VALUES
	(1, 'Login', '[1]', 'rmci@jeco', 0, '', '127.0.0.1', 0, '2024-08-16 15:06:14.864940', 18, 1),
	(2, 'Add', '[1]', 'AF6P224460435', 0, 'Device IP=185.200.11.10,Serial Number=AF6P224460435,Device Name=ZKTECO,Area=Not Authorized', '127.0.0.1', 0, '2024-08-16 15:09:22.523386', 44, 1),
	(3, 'Read Information', '[1]', 'AF6P224460435', 0, '', '127.0.0.1', 0, '2024-08-16 15:10:18.453767', 44, 1),
	(4, 'Read Information', '[1]', 'AF6P224460435', 0, '', '127.0.0.1', 0, '2024-08-16 15:10:35.518647', 44, 1),
	(5, 'Modify', '[1]', 'AF6P224460435', 0, '', '127.0.0.1', 0, '2024-08-16 15:11:48.458465', 44, 1),
	(6, 'Login', '[1]', 'rmci@jeco', 0, '', '127.0.0.1', 0, '2024-08-19 08:38:49.664527', 18, 1),
	(7, 'Modify', '[1]', 'AF6P224460435', 0, '', '127.0.0.1', 0, '2024-08-19 08:39:12.854832', 44, 1);

-- Dumping structure for table rmci.bio.base_attparamdepts
CREATE TABLE IF NOT EXISTS `base_attparamdepts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rulename` varchar(40) NOT NULL,
  `deptid` int NOT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `optime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rulename` (`rulename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_attparamdepts: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_autoattexporttask
CREATE TABLE IF NOT EXISTS `base_autoattexporttask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `params` longtext,
  `enable` tinyint(1) NOT NULL,
  `process_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_code` (`task_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_autoattexporttask: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_autoexporttask
CREATE TABLE IF NOT EXISTS `base_autoexporttask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `params` longtext,
  `enable` tinyint(1) NOT NULL,
  `process_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_code` (`task_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_autoexporttask: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_autoimporttask
CREATE TABLE IF NOT EXISTS `base_autoimporttask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `params` longtext,
  `enable` tinyint(1) NOT NULL,
  `process_time` datetime(6) DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_code` (`task_code`),
  KEY `base_autoimporttask_company_id_d18431a1` (`company_id`),
  CONSTRAINT `base_autoimporttask_company_id_d18431a1_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_autoimporttask: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_bookmark
CREATE TABLE IF NOT EXISTS `base_bookmark` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `filters` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `time_saved` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id` (`content_type_id`),
  KEY `base_bookmark_user_id_5f2d5ca2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `base_bookmark_user_id_5f2d5ca2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_bookmark: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_dbbackuplog
CREATE TABLE IF NOT EXISTS `base_dbbackuplog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `db_type` varchar(50) NOT NULL,
  `db_name` varchar(50) NOT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `backup_file` varchar(100) NOT NULL,
  `backup_time` datetime(6) NOT NULL,
  `backup_status` smallint NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_dbbackuplog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_emailtemplate
CREATE TABLE IF NOT EXISTS `base_emailtemplate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `category` int NOT NULL,
  `sub_category` int NOT NULL,
  `event` int NOT NULL,
  `receiver` int NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `template` longtext NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_emailtemplate: ~86 rows (approximately)
INSERT INTO `base_emailtemplate` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `category`, `sub_category`, `event`, `receiver`, `subject`, `template`, `enable`) VALUES
	(1, '2024-08-16 15:04:11.223811', NULL, '2024-08-16 15:04:11.223811', NULL, 0, 11, 0, 1, 1, NULL, '', 0),
	(2, '2024-08-16 15:04:11.225844', NULL, '2024-08-16 15:04:11.225844', NULL, 0, 11, 0, 2, 1, NULL, '', 0),
	(3, '2024-08-16 15:04:11.227922', NULL, '2024-08-16 15:04:11.227922', NULL, 0, 11, 0, 3, 1, NULL, '', 0),
	(4, '2024-08-16 15:04:11.229857', NULL, '2024-08-16 15:04:11.229857', NULL, 0, 11, 0, 7, 1, NULL, '', 0),
	(5, '2024-08-16 15:04:11.231851', NULL, '2024-08-16 15:04:11.231851', NULL, 0, 12, 121, 4, 1, NULL, '', 0),
	(6, '2024-08-16 15:04:11.233852', NULL, '2024-08-16 15:04:11.233852', NULL, 0, 12, 121, 5, 1, NULL, '', 0),
	(7, '2024-08-16 15:04:11.234853', NULL, '2024-08-16 15:04:11.234853', NULL, 0, 12, 121, 6, 1, NULL, '', 0),
	(8, '2024-08-16 15:04:11.236854', NULL, '2024-08-16 15:04:11.236854', NULL, 0, 12, 122, 4, 1, NULL, '', 0),
	(9, '2024-08-16 15:04:11.237855', NULL, '2024-08-16 15:04:11.237855', NULL, 0, 12, 122, 5, 1, NULL, '', 0),
	(10, '2024-08-16 15:04:11.239852', NULL, '2024-08-16 15:04:11.239852', NULL, 0, 12, 122, 6, 1, NULL, '', 0),
	(11, '2024-08-16 15:04:11.240859', NULL, '2024-08-16 15:04:11.240859', NULL, 0, 12, 123, 4, 1, NULL, '', 0),
	(12, '2024-08-16 15:04:11.241871', NULL, '2024-08-16 15:04:11.241871', NULL, 0, 12, 123, 5, 1, NULL, '', 0),
	(13, '2024-08-16 15:04:11.243868', NULL, '2024-08-16 15:04:11.243868', NULL, 0, 12, 123, 6, 1, NULL, '', 0),
	(14, '2024-08-16 15:04:11.244867', NULL, '2024-08-16 15:04:11.244867', NULL, 0, 12, 124, 4, 1, NULL, '', 0),
	(15, '2024-08-16 15:04:11.245868', NULL, '2024-08-16 15:04:11.245868', NULL, 0, 12, 124, 5, 1, NULL, '', 0),
	(16, '2024-08-16 15:04:11.247867', NULL, '2024-08-16 15:04:11.247867', NULL, 0, 12, 124, 6, 1, NULL, '', 0),
	(17, '2024-08-16 15:04:11.248867', NULL, '2024-08-16 15:04:11.248867', NULL, 0, 12, 125, 4, 1, NULL, '', 0),
	(18, '2024-08-16 15:04:11.249875', NULL, '2024-08-16 15:04:11.249875', NULL, 0, 12, 125, 5, 1, NULL, '', 0),
	(19, '2024-08-16 15:04:11.251883', NULL, '2024-08-16 15:04:11.251883', NULL, 0, 12, 125, 6, 1, NULL, '', 0),
	(20, '2024-08-16 15:04:11.252884', NULL, '2024-08-16 15:04:11.252884', NULL, 0, 13, 1310, 4, 1, NULL, '', 0),
	(21, '2024-08-16 15:04:11.253887', NULL, '2024-08-16 15:04:11.253887', NULL, 0, 13, 1310, 5, 1, NULL, '', 0),
	(22, '2024-08-16 15:04:11.255883', NULL, '2024-08-16 15:04:11.255883', NULL, 0, 13, 1310, 6, 1, NULL, '', 0),
	(23, '2024-08-16 15:04:11.256883', NULL, '2024-08-16 15:04:11.256883', NULL, 0, 13, 1311, 4, 1, NULL, '', 0),
	(24, '2024-08-16 15:04:11.257885', NULL, '2024-08-16 15:04:11.257885', NULL, 0, 13, 1311, 5, 1, NULL, '', 0),
	(25, '2024-08-16 15:04:11.259884', NULL, '2024-08-16 15:04:11.259884', NULL, 0, 13, 1311, 6, 1, NULL, '', 0),
	(26, '2024-08-16 15:04:11.260889', NULL, '2024-08-16 15:04:11.260889', NULL, 0, 14, 149, 4, 1, NULL, '', 0),
	(27, '2024-08-16 15:04:11.261901', NULL, '2024-08-16 15:04:11.261901', NULL, 0, 14, 149, 5, 1, NULL, '', 0),
	(28, '2024-08-16 15:04:11.263898', NULL, '2024-08-16 15:04:11.263898', NULL, 0, 14, 149, 6, 1, NULL, '', 0),
	(29, '2024-08-16 15:04:11.264898', NULL, '2024-08-16 15:04:11.264898', NULL, 0, 15, 0, 201, 1, NULL, '', 0),
	(30, '2024-08-16 15:04:11.265897', NULL, '2024-08-16 15:04:11.265897', NULL, 0, 16, 0, 202, 1, NULL, '', 0),
	(31, '2024-08-16 15:04:11.267897', NULL, '2024-08-16 15:04:11.267897', NULL, 0, 17, 0, 203, 1, NULL, '', 0),
	(32, '2024-08-16 15:04:11.268899', NULL, '2024-08-16 15:04:11.268899', NULL, 0, 21, 0, 1, 2, NULL, '', 0),
	(33, '2024-08-16 15:04:11.269897', NULL, '2024-08-16 15:04:11.269897', NULL, 0, 21, 0, 2, 2, NULL, '', 0),
	(34, '2024-08-16 15:04:11.271898', NULL, '2024-08-16 15:04:11.271898', NULL, 0, 21, 0, 3, 2, NULL, '', 0),
	(35, '2024-08-16 15:04:11.272898', NULL, '2024-08-16 15:04:11.272898', NULL, 0, 21, 0, 7, 2, NULL, '', 0),
	(36, '2024-08-16 15:04:11.274896', NULL, '2024-08-16 15:04:11.274896', NULL, 0, 22, 0, 201, 2, NULL, '', 0),
	(37, '2024-08-16 15:04:11.275897', NULL, '2024-08-16 15:04:11.275897', NULL, 0, 32, 321, 4, 3, NULL, '', 0),
	(38, '2024-08-16 15:04:11.276896', NULL, '2024-08-16 15:04:11.276896', NULL, 0, 32, 321, 5, 3, NULL, '', 0),
	(39, '2024-08-16 15:04:11.278899', NULL, '2024-08-16 15:04:11.278899', NULL, 0, 32, 321, 6, 3, NULL, '', 0),
	(40, '2024-08-16 15:04:11.279896', NULL, '2024-08-16 15:04:11.279896', NULL, 0, 32, 322, 4, 3, NULL, '', 0),
	(41, '2024-08-16 15:04:11.280896', NULL, '2024-08-16 15:04:11.280896', NULL, 0, 32, 322, 5, 3, NULL, '', 0),
	(42, '2024-08-16 15:04:11.282897', NULL, '2024-08-16 15:04:11.282897', NULL, 0, 32, 322, 6, 3, NULL, '', 0),
	(43, '2024-08-16 15:04:11.283895', NULL, '2024-08-16 15:04:11.283895', NULL, 0, 32, 323, 4, 3, NULL, '', 0),
	(44, '2024-08-16 15:04:11.284904', NULL, '2024-08-16 15:04:11.284904', NULL, 0, 32, 323, 5, 3, NULL, '', 0),
	(45, '2024-08-16 15:04:11.285914', NULL, '2024-08-16 15:04:11.285914', NULL, 0, 32, 323, 6, 3, NULL, '', 0),
	(46, '2024-08-16 15:04:11.287915', NULL, '2024-08-16 15:04:11.287915', NULL, 0, 32, 324, 4, 3, NULL, '', 0),
	(47, '2024-08-16 15:04:11.289914', NULL, '2024-08-16 15:04:11.289914', NULL, 0, 32, 324, 5, 3, NULL, '', 0),
	(48, '2024-08-16 15:04:11.290912', NULL, '2024-08-16 15:04:11.290912', NULL, 0, 32, 324, 6, 3, NULL, '', 0),
	(49, '2024-08-16 15:04:11.291913', NULL, '2024-08-16 15:04:11.291913', NULL, 0, 32, 325, 4, 3, NULL, '', 0),
	(50, '2024-08-16 15:04:11.293914', NULL, '2024-08-16 15:04:11.293914', NULL, 0, 32, 325, 5, 3, NULL, '', 0),
	(51, '2024-08-16 15:04:11.294911', NULL, '2024-08-16 15:04:11.294911', NULL, 0, 32, 325, 6, 3, NULL, '', 0),
	(52, '2024-08-16 15:04:11.295912', NULL, '2024-08-16 15:04:11.295912', NULL, 0, 33, 3310, 4, 3, NULL, '', 0),
	(53, '2024-08-16 15:04:11.297923', NULL, '2024-08-16 15:04:11.297923', NULL, 0, 33, 3310, 5, 3, NULL, '', 0),
	(54, '2024-08-16 15:04:11.299913', NULL, '2024-08-16 15:04:11.299913', NULL, 0, 33, 3310, 6, 3, NULL, '', 0),
	(55, '2024-08-16 15:04:11.301933', NULL, '2024-08-16 15:04:11.301933', NULL, 0, 33, 3311, 4, 3, NULL, '', 0),
	(56, '2024-08-16 15:04:11.303918', NULL, '2024-08-16 15:04:11.303918', NULL, 0, 33, 3311, 5, 3, NULL, '', 0),
	(57, '2024-08-16 15:04:11.305916', NULL, '2024-08-16 15:04:11.305916', NULL, 0, 33, 3311, 6, 3, NULL, '', 0),
	(58, '2024-08-16 15:04:11.306916', NULL, '2024-08-16 15:04:11.306916', NULL, 0, 34, 349, 4, 3, NULL, '', 0),
	(59, '2024-08-16 15:04:11.308917', NULL, '2024-08-16 15:04:11.308917', NULL, 0, 34, 349, 5, 3, NULL, '', 0),
	(60, '2024-08-16 15:04:11.310917', NULL, '2024-08-16 15:04:11.310917', NULL, 0, 34, 349, 6, 3, NULL, '', 0),
	(61, '2024-08-16 15:04:11.312916', NULL, '2024-08-16 15:04:11.312916', NULL, 0, 42, 421, 4, 4, NULL, '', 0),
	(62, '2024-08-16 15:04:11.313919', NULL, '2024-08-16 15:04:11.314917', NULL, 0, 42, 421, 5, 4, NULL, '', 0),
	(63, '2024-08-16 15:04:11.316952', NULL, '2024-08-16 15:04:11.316952', NULL, 0, 42, 421, 6, 4, NULL, '', 0),
	(64, '2024-08-16 15:04:11.317949', NULL, '2024-08-16 15:04:11.317949', NULL, 0, 42, 422, 4, 4, NULL, '', 0),
	(65, '2024-08-16 15:04:11.319952', NULL, '2024-08-16 15:04:11.319952', NULL, 0, 42, 422, 5, 4, NULL, '', 0),
	(66, '2024-08-16 15:04:11.320952', NULL, '2024-08-16 15:04:11.320952', NULL, 0, 42, 422, 6, 4, NULL, '', 0),
	(67, '2024-08-16 15:04:11.322951', NULL, '2024-08-16 15:04:11.322951', NULL, 0, 42, 423, 4, 4, NULL, '', 0),
	(68, '2024-08-16 15:04:11.323951', NULL, '2024-08-16 15:04:11.323951', NULL, 0, 42, 423, 5, 4, NULL, '', 0),
	(69, '2024-08-16 15:04:11.324955', NULL, '2024-08-16 15:04:11.324955', NULL, 0, 42, 423, 6, 4, NULL, '', 0),
	(70, '2024-08-16 15:04:11.325967', NULL, '2024-08-16 15:04:11.325967', NULL, 0, 42, 424, 4, 4, NULL, '', 0),
	(71, '2024-08-16 15:04:11.327965', NULL, '2024-08-16 15:04:11.327965', NULL, 0, 42, 424, 5, 4, NULL, '', 0),
	(72, '2024-08-16 15:04:11.328972', NULL, '2024-08-16 15:04:11.328972', NULL, 0, 42, 424, 6, 4, NULL, '', 0),
	(73, '2024-08-16 15:04:11.329988', NULL, '2024-08-16 15:04:11.329988', NULL, 0, 42, 425, 4, 4, NULL, '', 0),
	(74, '2024-08-16 15:04:11.331995', NULL, '2024-08-16 15:04:11.331995', NULL, 0, 42, 425, 5, 4, NULL, '', 0),
	(75, '2024-08-16 15:04:11.332996', NULL, '2024-08-16 15:04:11.332996', NULL, 0, 42, 425, 6, 4, NULL, '', 0),
	(76, '2024-08-16 15:04:11.333998', NULL, '2024-08-16 15:04:11.333998', NULL, 0, 43, 4310, 4, 4, NULL, '', 0),
	(77, '2024-08-16 15:04:11.335995', NULL, '2024-08-16 15:04:11.335995', NULL, 0, 43, 4310, 5, 4, NULL, '', 0),
	(78, '2024-08-16 15:04:11.336996', NULL, '2024-08-16 15:04:11.336996', NULL, 0, 43, 4310, 6, 4, NULL, '', 0),
	(79, '2024-08-16 15:04:11.338996', NULL, '2024-08-16 15:04:11.338996', NULL, 0, 43, 4311, 4, 4, NULL, '', 0),
	(80, '2024-08-16 15:04:11.339996', NULL, '2024-08-16 15:04:11.339996', NULL, 0, 43, 4311, 5, 4, NULL, '', 0),
	(81, '2024-08-16 15:04:11.340996', NULL, '2024-08-16 15:04:11.340996', NULL, 0, 43, 4311, 6, 4, NULL, '', 0),
	(82, '2024-08-16 15:04:11.342997', NULL, '2024-08-16 15:04:11.342997', NULL, 0, 44, 449, 4, 4, NULL, '', 0),
	(83, '2024-08-16 15:04:11.344995', NULL, '2024-08-16 15:04:11.344995', NULL, 0, 44, 449, 5, 4, NULL, '', 0),
	(84, '2024-08-16 15:04:11.345997', NULL, '2024-08-16 15:04:11.345997', NULL, 0, 44, 449, 6, 4, NULL, '', 0),
	(85, '2024-08-16 15:04:11.347995', NULL, '2024-08-16 15:04:11.347995', NULL, 0, 0, 0, 101, 5, NULL, '', 0),
	(86, '2024-08-16 15:04:11.348996', NULL, '2024-08-16 15:04:11.348996', NULL, 0, 0, 0, 102, 5, NULL, '', 0);

-- Dumping structure for table rmci.bio.base_eventalertsetting
CREATE TABLE IF NOT EXISTS `base_eventalertsetting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `event_id` int NOT NULL,
  `event` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `sub_module` varchar(50) NOT NULL,
  `email_alert` tinyint(1) NOT NULL,
  `app_alert` tinyint(1) NOT NULL,
  `sms_alert` tinyint(1) NOT NULL,
  `whatapp_alert` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_eventalertsetting: ~13 rows (approximately)
INSERT INTO `base_eventalertsetting` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `event_id`, `event`, `module`, `sub_module`, `email_alert`, `app_alert`, `sms_alert`, `whatapp_alert`) VALUES
	(1, '2024-08-16 15:04:11.356000', NULL, '2024-08-16 15:04:11.356000', NULL, 0, 1, 'menu_att_manualLog', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0),
	(2, '2024-08-16 15:04:11.356996', NULL, '2024-08-16 15:04:11.356996', NULL, 0, 2, 'menu_att_leave', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0),
	(3, '2024-08-16 15:04:11.358997', NULL, '2024-08-16 15:04:11.358997', NULL, 0, 3, 'menu_att_overtime', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0),
	(4, '2024-08-16 15:04:11.359995', NULL, '2024-08-16 15:04:11.359995', NULL, 0, 4, 'menu_att_training', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0),
	(5, '2024-08-16 15:04:11.360994', NULL, '2024-08-16 15:04:11.360994', NULL, 0, 5, 'menu_att_adjustSchedule', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0),
	(6, '2024-08-16 15:04:11.361994', NULL, '2024-08-16 15:04:11.362997', NULL, 0, 6, 'payCode.default.lateIn', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0),
	(7, '2024-08-16 15:04:11.363995', NULL, '2024-08-16 15:04:11.363995', NULL, 0, 7, 'payCode.default.earlyOut', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0),
	(8, '2024-08-16 15:04:11.364995', NULL, '2024-08-16 15:04:11.364995', NULL, 0, 8, 'payCode.default.absence', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0),
	(9, '2024-08-16 15:04:11.366997', NULL, '2024-08-16 15:04:11.366997', NULL, 0, 9, 'menu.visitor.registration', 'menu.visitor.registration.visitor', 'menu.visitor.reservation', 1, 0, 0, 0),
	(10, '2024-08-16 15:04:11.367994', NULL, '2024-08-16 15:04:11.367994', NULL, 0, 10, 'meeting.menus.meeting', 'meeting.menus.meeting', 'meeting.menus.meeting', 1, 0, 0, 0),
	(11, '2024-08-16 15:04:11.369995', NULL, '2024-08-16 15:04:11.369995', NULL, 0, 11, 'meeting.menus.manualLog', 'meeting.menus.meeting', 'meeting.menus.manualLog', 1, 0, 0, 0),
	(12, '2024-08-16 15:04:11.370997', NULL, '2024-08-16 15:04:11.370997', NULL, 0, 12, 'menu_device_publicMessage', 'menu_group_device_deviceManagement', 'menu_mobile_announcement', 0, 1, 0, 0),
	(13, '2024-08-16 15:04:11.373041', NULL, '2024-08-16 15:04:11.373041', NULL, 0, 13, 'menu_device_privateMessage', 'menu_group_device_deviceManagement', 'menu_mobile_announcement', 0, 1, 0, 0);

-- Dumping structure for table rmci.bio.base_linenotifysetting
CREATE TABLE IF NOT EXISTS `base_linenotifysetting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `include_sub_department` int DEFAULT NULL,
  `line_notify_token` varchar(200) DEFAULT NULL,
  `message_type` int DEFAULT NULL,
  `message_head` varchar(100) DEFAULT NULL,
  `message_tail` varchar(100) DEFAULT NULL,
  `push_time` time(6) DEFAULT NULL,
  `is_valid` int DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `line_notify_dept_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_linenotifysetting_line_notify_dept_id_line_dd79374f_uniq` (`line_notify_dept_id`,`line_notify_token`,`message_type`),
  KEY `base_linenotifysetting_line_notify_dept_id_0643a5ed` (`line_notify_dept_id`),
  CONSTRAINT `base_linenotifysetti_line_notify_dept_id_0643a5ed_fk_personnel` FOREIGN KEY (`line_notify_dept_id`) REFERENCES `personnel_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_linenotifysetting: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_securitypolicy
CREATE TABLE IF NOT EXISTS `base_securitypolicy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `single_login` tinyint(1) NOT NULL,
  `security_code` tinyint(1) NOT NULL,
  `code_length` int NOT NULL,
  `valid_duration` int NOT NULL,
  `failed_locked` tinyint(1) NOT NULL,
  `lock_failed_count` int NOT NULL,
  `lock_duration` int NOT NULL,
  `enforce_pwd_change` tinyint(1) NOT NULL,
  `enforce_pwd_expiration` tinyint(1) NOT NULL,
  `validity_period` int NOT NULL,
  `password_level` smallint NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `app_single_user_login` tinyint(1) NOT NULL,
  `session_timeout` int NOT NULL,
  `export_encryption` tinyint(1) NOT NULL,
  `export_encryption_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_securitypolicy: ~0 rows (approximately)
INSERT INTO `base_securitypolicy` (`id`, `single_login`, `security_code`, `code_length`, `valid_duration`, `failed_locked`, `lock_failed_count`, `lock_duration`, `enforce_pwd_change`, `enforce_pwd_expiration`, `validity_period`, `password_level`, `is_default`, `app_single_user_login`, `session_timeout`, `export_encryption`, `export_encryption_password`) VALUES
	(1, 0, 0, 5, 1, 0, 5, 60, 0, 0, 90, 2, 1, 0, 60, 0, NULL);

-- Dumping structure for table rmci.bio.base_sendemail
CREATE TABLE IF NOT EXISTS `base_sendemail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purpose` int NOT NULL,
  `email_to` longtext NOT NULL,
  `email_cc` longtext,
  `email_bcc` longtext,
  `email_subject` varchar(40) NOT NULL,
  `email_content` longtext,
  `send_time` datetime(6) DEFAULT NULL,
  `send_status` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_sendemail: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_sftpsetting
CREATE TABLE IF NOT EXISTS `base_sftpsetting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(39) NOT NULL,
  `port` int NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(128) DEFAULT NULL,
  `user_key` longtext,
  `is_sftp` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_sftpsetting: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_sysparam
CREATE TABLE IF NOT EXISTS `base_sysparam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `para_name` varchar(30) NOT NULL,
  `para_type` varchar(10) DEFAULT NULL,
  `para_value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_sysparam_para_name_para_type_3086789a_uniq` (`para_name`,`para_type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_sysparam: ~24 rows (approximately)
INSERT INTO `base_sysparam` (`id`, `para_name`, `para_type`, `para_value`) VALUES
	(1, 'rule_id', 'rule_0', '0'),
	(2, 'dept_id', 'rule_0', '0'),
	(3, 'apply_name', 'rule_0', 'All'),
	(4, 'rule_name', 'rule_0', 'Default Attendance Rules'),
	(5, 'minutes_early', 'rule_0', '0'),
	(6, 'minutes_late', 'rule_0', '0'),
	(7, 'minutes_no_break_in', 'rule_0', '60'),
	(8, 'minutes_no_break_out', 'rule_0', '60'),
	(9, 'minutes_no_in', 'rule_0', '60'),
	(10, 'minutes_no_leave', 'rule_0', '60'),
	(11, 'minutes_not_over_time', 'rule_0', '60'),
	(12, 'minutes_work_day', 'rule_0', '480'),
	(13, 'no_break_in', 'rule_0', '1012'),
	(14, 'no_break_out', 'rule_0', '1012'),
	(15, 'no_in', 'rule_0', '1001'),
	(16, 'no_leave', 'rule_0', '1002'),
	(17, 'out_over_time', 'rule_0', '0'),
	(18, 'two_day', 'rule_0', '0'),
	(19, 'check_in_color', 'rule_0', '16777151'),
	(20, 'check_out_color', 'rule_0', '12910591'),
	(21, 'db_version', '', '2002'),
	(22, 'installdate', '', '9503dxBp0BIZLlofX8uykQheRtK9pGjWnGUObuW5mInERlFYSKgb'),
	(23, 'sys_date', '', '9503dxBp0BIZLlofX8uykQheRtK9pGjWnGUObuW5mInERlFYSKgb'),
	(24, 'ADMSDBVersion', '', '544'),
	(25, 'active_date', '', 'ba23fq-nEUFQkdtmtO5mL_RSF0sx_xj6uYzhMKlWduLGEOeLWZzx');

-- Dumping structure for table rmci.bio.base_sysparamdept
CREATE TABLE IF NOT EXISTS `base_sysparamdept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(40) NOT NULL,
  `dept_id` int NOT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `op_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_name` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_sysparamdept: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.base_systemlog
CREATE TABLE IF NOT EXISTS `base_systemlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `execute_time` datetime(6) NOT NULL,
  `operation` smallint NOT NULL,
  `execute_status` smallint NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_systemlog: ~6 rows (approximately)
INSERT INTO `base_systemlog` (`id`, `execute_time`, `operation`, `execute_status`, `description`) VALUES
	(1, '2024-08-17 00:01:01.915482', 2, 0, 'Active: 0, Inactive: 0'),
	(2, '2024-08-17 00:05:00.993594', 1, 0, 'Success: 0, Failed: 0'),
	(3, '2024-08-18 00:01:01.308258', 2, 0, 'Active: 0, Inactive: 0'),
	(4, '2024-08-18 00:05:00.242307', 1, 0, 'Success: 0, Failed: 0'),
	(5, '2024-08-19 00:01:01.245025', 2, 0, 'Active: 0, Inactive: 0'),
	(6, '2024-08-19 00:05:00.145511', 1, 0, 'Success: 0, Failed: 0');

-- Dumping structure for table rmci.bio.base_systemsetting
CREATE TABLE IF NOT EXISTS `base_systemsetting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.base_systemsetting: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_admin_log: ~2 rows (approximately)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2024-08-16 15:09:22.521388', '1', 'AF6P224460435', 1, 'Device IP=185.200.11.10,Serial Number=AF6P224460435,Device Name=ZKTECO,Area=Not Authorized', 44, 1),
	(2, '2024-08-16 15:11:48.456467', '1', 'AF6P224460435', 2, '', 44, 1),
	(3, '2024-08-19 08:39:12.852827', '1', 'AF6P224460435', 2, '', 44, 1);

-- Dumping structure for table rmci.bio.django_celery_beat_clockedschedule
CREATE TABLE IF NOT EXISTS `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_celery_beat_clockedschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.django_celery_beat_crontabschedule
CREATE TABLE IF NOT EXISTS `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_celery_beat_crontabschedule: ~9 rows (approximately)
INSERT INTO `django_celery_beat_crontabschedule` (`id`, `minute`, `hour`, `day_of_week`, `day_of_month`, `month_of_year`, `timezone`) VALUES
	(1, '0', '4', '*', '*', '*', 'Asia/Singapore'),
	(2, '30', '0', '*', '*', '*', 'Asia/Singapore'),
	(3, '1', '0', '*', '*', '*', 'Asia/Singapore'),
	(4, '5', '0', '*', '*', '*', 'Asia/Singapore'),
	(5, '10', '0', '*', '*', '*', 'Asia/Singapore'),
	(6, '20', '0', '*', '1', '1', 'Asia/Singapore'),
	(7, '0', '2', '*', '*', '*', 'Asia/Singapore'),
	(8, '30', '2', '*', '*', '*', 'Asia/Singapore'),
	(9, '40', '0', '*', '*', '*', 'Asia/Singapore'),
	(10, '15', '0', '*', '*', '*', 'Asia/Singapore'),
	(11, '0', '0', '*', '*', '*', 'Asia/Singapore');

-- Dumping structure for table rmci.bio.django_celery_beat_intervalschedule
CREATE TABLE IF NOT EXISTS `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_celery_beat_intervalschedule: ~4 rows (approximately)
INSERT INTO `django_celery_beat_intervalschedule` (`id`, `every`, `period`) VALUES
	(1, 3, 'seconds'),
	(2, 200, 'seconds'),
	(3, 60, 'seconds'),
	(4, 10, 'seconds');

-- Dumping structure for table rmci.bio.django_celery_beat_periodictask
CREATE TABLE IF NOT EXISTS `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL,
  `clocked_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_celery_beat_periodictask: ~17 rows (approximately)
INSERT INTO `django_celery_beat_periodictask` (`id`, `name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`) VALUES
	(1, 'celery.backend_cleanup', 'celery.backend_cleanup', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 04:01:41.512329', 3, '2024-08-19 04:01:41.512329', '', 1, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(2, 'iclock.tasks.data_sync', 'iclock.tasks.data_sync', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 08:37:51.780716', 78471, '2024-08-19 08:37:51.780716', '', NULL, 1, NULL, 0, NULL, NULL, '{}', NULL),
	(3, 'iclock.tasks.device_online_monitor', 'iclock.tasks.device_online_monitor', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 08:37:51.774718', 1179, '2024-08-19 08:37:51.774718', '', NULL, 2, NULL, 0, NULL, NULL, '{}', NULL),
	(4, 'mobile.task.upload_gps', 'mobile.task.upload_gps', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:31:32.867369', 3, '2024-08-19 00:31:32.867369', '', 2, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(5, 'psnl.tasks.employment_status_monitoring', 'psnl.tasks.employment_status_monitoring', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:01:31.530577', 3, '2024-08-19 00:01:31.530577', '', 3, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(6, 'psnl.tasks.resigned_scanner', 'psnl.tasks.resigned_scanner', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:07:31.861886', 3, '2024-08-19 00:07:31.861886', '', 4, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(7, 'psnl.tasks.document_expired_alert', 'psnl.tasks.document_expired_alert', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:10:31.975020', 3, '2024-08-19 00:10:31.975020', '', 5, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(8, 'meeting.tasks.meeting_monitor', 'meeting.tasks.meeting_monitor', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 08:37:51.768717', 3932, '2024-08-19 08:37:51.768717', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL),
	(9, 'att.tasks.restore_leaveyearbalance_all', 'att.tasks.restore_leaveyearbalance_all', '[]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-08-16 15:04:52.655277', '', 6, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(10, 'base.tasks.daily_licence_verify', 'base.tasks.daily_licence_verify', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 02:01:36.301800', 3, '2024-08-19 02:01:36.301800', '', 7, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(11, 'base.tasks.daily_aof_rewrite', 'base.tasks.daily_aof_rewrite', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 02:31:37.584789', 3, '2024-08-19 02:31:37.584789', '', 8, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(12, 'beat_tasks.run_minute_task', 'beat_tasks.run_minute_task', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 08:37:51.756583', 3932, '2024-08-19 08:37:51.756583', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL),
	(13, 'att.tasks.auto_calculate_daily', 'att.tasks.auto_calculate_daily', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:40:33.271829', 3, '2024-08-19 00:40:33.271829', '', 9, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(14, 'att.tasks.run_calculation', 'att.tasks.run_calculation', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 08:37:51.762667', 23580, '2024-08-19 08:37:51.762667', '', NULL, 4, NULL, 0, NULL, NULL, '{}', NULL),
	(15, 'visitor.tasks.dataClean', 'visitor.tasks.data_clean', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:16:32.269783', 3, '2024-08-19 00:16:32.269783', '', 10, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(16, 'iclock.tasks.data_clean', 'iclock.tasks.data_clean', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:01:31.500441', 3, '2024-08-19 00:01:31.500441', '', 11, NULL, NULL, 0, NULL, NULL, '{}', NULL),
	(17, 'iclock.tasks.zip_clean', 'iclock.tasks.zip_clean', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2024-08-19 00:01:31.480464', 3, '2024-08-19 00:01:31.480464', '', 11, NULL, NULL, 0, NULL, NULL, '{}', NULL);

-- Dumping structure for table rmci.bio.django_celery_beat_periodictasks
CREATE TABLE IF NOT EXISTS `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_celery_beat_periodictasks: ~0 rows (approximately)
INSERT INTO `django_celery_beat_periodictasks` (`ident`, `last_update`) VALUES
	(1, '2024-08-16 15:04:52.746279');

-- Dumping structure for table rmci.bio.django_celery_beat_solarschedule
CREATE TABLE IF NOT EXISTS `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_celery_beat_solarschedule: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_content_type: ~212 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(114, 'acc', 'acccombination'),
	(113, 'acc', 'accgroups'),
	(112, 'acc', 'accholiday'),
	(115, 'acc', 'accprivilege'),
	(116, 'acc', 'accterminal'),
	(111, 'acc', 'acctimezone'),
	(186, 'accounts', 'adminbiodata'),
	(18, 'accounts', 'myuser'),
	(34, 'accounts', 'usernotification'),
	(187, 'accounts', 'userprofile'),
	(130, 'admin', 'logentry'),
	(10, 'att', 'att_configurations_permission'),
	(9, 'att', 'att_setting_permission'),
	(162, 'att', 'attcalclog'),
	(62, 'att', 'attcode'),
	(183, 'att', 'attconfigurationspermission'),
	(163, 'att', 'attemployee'),
	(63, 'att', 'attgroup'),
	(64, 'att', 'attpolicy'),
	(84, 'att', 'attreportsetting'),
	(67, 'att', 'attrule'),
	(72, 'att', 'attschedule'),
	(181, 'att', 'attsettingpermission'),
	(71, 'att', 'attshift'),
	(80, 'att', 'breaktime'),
	(179, 'att', 'calculatelastdate'),
	(180, 'att', 'calculatetask'),
	(81, 'att', 'changeschedule'),
	(65, 'att', 'departmentpolicy'),
	(82, 'att', 'departmentschedule'),
	(79, 'att', 'deptattrule'),
	(66, 'att', 'grouppolicy'),
	(83, 'att', 'groupschedule'),
	(78, 'att', 'holiday'),
	(75, 'att', 'leave'),
	(85, 'att', 'leavegroup'),
	(86, 'att', 'leavegroupdetail'),
	(87, 'att', 'leaveyearbalance'),
	(69, 'att', 'manuallog'),
	(77, 'att', 'overtime'),
	(164, 'att', 'overtimepolicy'),
	(61, 'att', 'paycode'),
	(165, 'att', 'payloadattcode'),
	(166, 'att', 'payloadbase'),
	(167, 'att', 'payloadbreak'),
	(168, 'att', 'payloadeffectpunch'),
	(169, 'att', 'payloadexception'),
	(170, 'att', 'payloadmulpunchset'),
	(171, 'att', 'payloadovertime'),
	(172, 'att', 'payloadparing'),
	(173, 'att', 'payloadpaycode'),
	(174, 'att', 'payloadpunch'),
	(175, 'att', 'payloadtimecard'),
	(7, 'att', 'report_permission'),
	(68, 'att', 'reportparam'),
	(182, 'att', 'reportpermission'),
	(176, 'att', 'reporttemplate'),
	(6, 'att', 'schedule_view_permission'),
	(184, 'att', 'scheduleviewpermission'),
	(177, 'att', 'shiftdetail'),
	(8, 'att', 'staff_report_permission'),
	(185, 'att', 'staffreportpermission'),
	(74, 'att', 'temporaryschedule'),
	(73, 'att', 'tempschedule'),
	(70, 'att', 'timeinterval'),
	(76, 'att', 'training'),
	(178, 'att', 'webpunch'),
	(2, 'auth', 'group'),
	(1, 'auth', 'permission'),
	(132, 'authtoken', 'token'),
	(147, 'base', 'abstractpermission'),
	(16, 'base', 'adminlog'),
	(141, 'base', 'attparam'),
	(142, 'base', 'attparamdepts'),
	(19, 'base', 'autoattexporttask'),
	(20, 'base', 'autoexporttask'),
	(21, 'base', 'autoimporttask'),
	(22, 'base', 'bookmark'),
	(23, 'base', 'dbbackuplog'),
	(24, 'base', 'emailtemplate'),
	(25, 'base', 'eventalertsetting'),
	(26, 'base', 'linenotifysetting'),
	(31, 'base', 'securitypolicy'),
	(143, 'base', 'sendemail'),
	(32, 'base', 'sftpsetting'),
	(30, 'base', 'syncarea'),
	(27, 'base', 'syncdepartment'),
	(29, 'base', 'syncemployee'),
	(28, 'base', 'syncjob'),
	(144, 'base', 'sysparam'),
	(145, 'base', 'sysparamdept'),
	(3, 'base', 'system_setting_permission'),
	(33, 'base', 'systemlog'),
	(146, 'base', 'systemsetting'),
	(148, 'base', 'systemsettingpermission'),
	(129, 'contenttypes', 'contenttype'),
	(140, 'django_celery_beat', 'clockedschedule'),
	(135, 'django_celery_beat', 'crontabschedule'),
	(136, 'django_celery_beat', 'intervalschedule'),
	(137, 'django_celery_beat', 'periodictask'),
	(138, 'django_celery_beat', 'periodictasks'),
	(139, 'django_celery_beat', 'solarschedule'),
	(14, 'ep', 'ep_dashboard_permission'),
	(15, 'ep', 'ep_report_permission'),
	(211, 'ep', 'epdashboardpermission'),
	(212, 'ep', 'epreportpermission'),
	(127, 'ep', 'epsetup'),
	(128, 'ep', 'eptransaction'),
	(133, 'guardian', 'groupobjectpermission'),
	(134, 'guardian', 'userobjectpermission'),
	(50, 'iclock', 'biodata'),
	(55, 'iclock', 'biophoto'),
	(4, 'iclock', 'device_setting_permission'),
	(153, 'iclock', 'deviceemployee'),
	(54, 'iclock', 'devicemoduleconfig'),
	(152, 'iclock', 'devicesettingpermission'),
	(56, 'iclock', 'errorcommandlog'),
	(51, 'iclock', 'privatemessage'),
	(52, 'iclock', 'publicmessage'),
	(149, 'iclock', 'shortmessage'),
	(44, 'iclock', 'terminal'),
	(48, 'iclock', 'terminalcommand'),
	(49, 'iclock', 'terminalcommandlog'),
	(150, 'iclock', 'terminalemployee'),
	(46, 'iclock', 'terminallog'),
	(57, 'iclock', 'terminalparameter'),
	(47, 'iclock', 'terminaluploadlog'),
	(53, 'iclock', 'terminalworkcode'),
	(45, 'iclock', 'transaction'),
	(151, 'iclock', 'transactionproofcmd'),
	(13, 'meeting', 'meeting_report_permission'),
	(89, 'meeting', 'meetingentity'),
	(90, 'meeting', 'meetingmanuallog'),
	(209, 'meeting', 'meetingpayloadbase'),
	(210, 'meeting', 'meetingreportpermission'),
	(124, 'meeting', 'meetingroom'),
	(125, 'meeting', 'meetingroomdevice'),
	(126, 'meeting', 'meetingtransaction'),
	(91, 'mobile', 'announcement'),
	(94, 'mobile', 'appactionlog'),
	(92, 'mobile', 'applist'),
	(93, 'mobile', 'appnotification'),
	(96, 'mobile', 'gpsfordepartment'),
	(95, 'mobile', 'gpsforemployee'),
	(97, 'mobile', 'gpslocation'),
	(98, 'mobile', 'mobileapirequestlog'),
	(100, 'payroll', 'deductionformula'),
	(105, 'payroll', 'emploan'),
	(99, 'payroll', 'emppayrollprofile'),
	(101, 'payroll', 'exceptionformula'),
	(110, 'payroll', 'extradeduction'),
	(109, 'payroll', 'extraincrease'),
	(102, 'payroll', 'increasementformula'),
	(103, 'payroll', 'leaveformula'),
	(104, 'payroll', 'overtimeformula'),
	(11, 'payroll', 'payroll_report_permission'),
	(205, 'payroll', 'payrollpayload'),
	(206, 'payroll', 'payrollpayloadpaycode'),
	(207, 'payroll', 'payrollreportpermission'),
	(106, 'payroll', 'reimbursement'),
	(107, 'payroll', 'salaryadvance'),
	(108, 'payroll', 'salarystructure'),
	(12, 'payroll', 'staff_payroll_report_permission'),
	(208, 'payroll', 'staffpayrollreportpermission'),
	(36, 'personnel', 'area'),
	(154, 'personnel', 'assignareaemployee'),
	(37, 'personnel', 'certification'),
	(35, 'personnel', 'company'),
	(38, 'personnel', 'department'),
	(39, 'personnel', 'employee'),
	(157, 'personnel', 'employeecalendar'),
	(42, 'personnel', 'employeecertification'),
	(43, 'personnel', 'employeecustomattribute'),
	(158, 'personnel', 'employeeextrainfo'),
	(155, 'personnel', 'employeeprofile'),
	(156, 'personnel', 'employment'),
	(5, 'personnel', 'personnel_setting_permission'),
	(159, 'personnel', 'personnelsettingpermission'),
	(40, 'personnel', 'position'),
	(41, 'personnel', 'resign'),
	(17, 'rest_framework_tracking', 'apirequestlog'),
	(131, 'sessions', 'session'),
	(189, 'staff', 'approvalchangeschedule'),
	(190, 'staff', 'approvalleave'),
	(191, 'staff', 'approvalmanuallog'),
	(192, 'staff', 'approvalovertime'),
	(193, 'staff', 'approvaltraining'),
	(194, 'staff', 'pendingchangeschedule'),
	(195, 'staff', 'pendingleave'),
	(196, 'staff', 'pendingmanuallog'),
	(197, 'staff', 'pendingovertime'),
	(198, 'staff', 'pendingtraining'),
	(188, 'staff', 'stafftoken'),
	(201, 'staff_meeting', 'approvalmeetingentity'),
	(202, 'staff_meeting', 'approvalmeetingmanuallog'),
	(203, 'staff_meeting', 'pendingmeetingentity'),
	(204, 'staff_meeting', 'pendingmeetingmanuallog'),
	(199, 'staff_visitor', 'approvalreservation'),
	(200, 'staff_visitor', 'pendingreservation'),
	(118, 'visitor', 'reason'),
	(88, 'visitor', 'reservation'),
	(117, 'visitor', 'visitor'),
	(122, 'visitor', 'visitorbiodata'),
	(121, 'visitor', 'visitorbiophoto'),
	(120, 'visitor', 'visitorconfig'),
	(119, 'visitor', 'visitorlog'),
	(123, 'visitor', 'visitortransaction'),
	(160, 'workflow', 'nodeinstance'),
	(59, 'workflow', 'workflowengine'),
	(161, 'workflow', 'workflowinstance'),
	(60, 'workflow', 'workflownode'),
	(58, 'workflow', 'workflowrole');

-- Dumping structure for table rmci.bio.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_migrations: ~120 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'personnel', '0001_initial', '2024-08-16 15:03:26.885531'),
	(2, 'contenttypes', '0001_initial', '2024-08-16 15:03:26.927258'),
	(3, 'contenttypes', '0002_remove_content_type_name', '2024-08-16 15:03:26.982954'),
	(4, 'workflow', '0001_initial', '2024-08-16 15:03:27.805094'),
	(5, 'iclock', '0001_initial', '2024-08-16 15:03:28.254991'),
	(6, 'auth', '0001_initial', '2024-08-16 15:03:28.481245'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-16 15:03:28.530336'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-08-16 15:03:28.537336'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-08-16 15:03:28.545332'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-08-16 15:03:28.552337'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-08-16 15:03:28.555335'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-16 15:03:28.564383'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-08-16 15:03:28.571380'),
	(14, 'base', '0001_initial', '2024-08-16 15:03:29.263464'),
	(15, 'accounts', '0001_initial', '2024-08-16 15:03:29.522438'),
	(16, 'base', '0002_auto_20200901_1642', '2024-08-16 15:03:29.855826'),
	(17, 'att', '0001_initial', '2024-08-16 15:03:30.138664'),
	(18, 'att', '0002_auto_20200901_1642', '2024-08-16 15:03:35.978858'),
	(19, 'personnel', '0002_auto_20200901_1642', '2024-08-16 15:03:37.790210'),
	(20, 'acc', '0001_initial', '2024-08-16 15:03:37.965557'),
	(21, 'acc', '0002_auto_20200901_1642', '2024-08-16 15:03:38.654253'),
	(22, 'acc', '0003_auto_20200901_1642', '2024-08-16 15:03:39.385505'),
	(23, 'acc', '0004_auto_20210721_1158', '2024-08-16 15:03:39.591496'),
	(24, 'acc', '0005_auto_20210908_1006', '2024-08-16 15:03:39.698708'),
	(25, 'accounts', '0002_auto_20200901_1642', '2024-08-16 15:03:40.394565'),
	(26, 'accounts', '0003_auto_20201021_1551', '2024-08-16 15:03:40.409596'),
	(27, 'accounts', '0004_auto_20201229_0852', '2024-08-16 15:03:40.602646'),
	(28, 'accounts', '0005_auto_20210908_1006', '2024-08-16 15:03:40.619648'),
	(29, 'accounts', '0006_myuser_assign_company', '2024-08-16 15:03:40.664200'),
	(30, 'accounts', '0007_auto_20220106_1103', '2024-08-16 15:03:40.682170'),
	(31, 'admin', '0001_initial', '2024-08-16 15:03:40.804996'),
	(32, 'admin', '0002_logentry_remove_auto_add', '2024-08-16 15:03:40.823109'),
	(33, 'personnel', '0003_auto_20201229_0852', '2024-08-16 15:03:41.147577'),
	(34, 'personnel', '0004_auto_20210908_1006', '2024-08-16 15:03:42.322178'),
	(35, 'base', '0003_auto_20201229_0852', '2024-08-16 15:03:42.563069'),
	(36, 'base', '0004_auto_20210908_1006', '2024-08-16 15:03:43.151017'),
	(37, 'base', '0005_auto_20211201_1434', '2024-08-16 15:03:43.203107'),
	(38, 'personnel', '0005_auto_20211201_1434', '2024-08-16 15:03:43.952639'),
	(39, 'base', '0006_autoimporttask_company', '2024-08-16 15:03:44.025778'),
	(40, 'base', '0007_auto_20221202_1852', '2024-08-16 15:03:44.038778'),
	(41, 'att', '0003_auto_20200909_1810', '2024-08-16 15:03:44.077810'),
	(42, 'att', '0004_auto_20201021_1551', '2024-08-16 15:03:44.148833'),
	(43, 'att', '0005_auto_20201106_1538', '2024-08-16 15:03:44.296659'),
	(44, 'att', '0006_auto_20201116_1052', '2024-08-16 15:03:44.307687'),
	(45, 'att', '0007_auto_20201229_0852', '2024-08-16 15:03:45.791700'),
	(46, 'att', '0008_auto_20210908_1006', '2024-08-16 15:03:47.928176'),
	(47, 'att', '0009_reporttemplate_employee', '2024-08-16 15:03:48.054688'),
	(48, 'att', '0010_auto_20220106_1103', '2024-08-16 15:03:48.446369'),
	(49, 'att', '0011_auto_20220118_1536', '2024-08-16 15:03:48.504344'),
	(50, 'att', '0012_auto_20220419_1516', '2024-08-16 15:03:48.559492'),
	(51, 'att', '0013_auto_20221202_1852', '2024-08-16 15:03:48.692488'),
	(52, 'att', '0014_holiday_end_date', '2024-08-16 15:03:48.733489'),
	(53, 'authtoken', '0001_initial', '2024-08-16 15:03:49.016078'),
	(54, 'authtoken', '0002_auto_20160226_1747', '2024-08-16 15:03:49.157115'),
	(55, 'django_celery_beat', '0001_initial', '2024-08-16 15:03:49.345593'),
	(56, 'django_celery_beat', '0002_auto_20161118_0346', '2024-08-16 15:03:49.422172'),
	(57, 'django_celery_beat', '0003_auto_20161209_0049', '2024-08-16 15:03:49.452190'),
	(58, 'django_celery_beat', '0004_auto_20170221_0000', '2024-08-16 15:03:49.463245'),
	(59, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2024-08-16 15:03:49.474241'),
	(60, 'django_celery_beat', '0006_auto_20180322_0932', '2024-08-16 15:03:49.555356'),
	(61, 'django_celery_beat', '0007_auto_20180521_0826', '2024-08-16 15:03:49.602477'),
	(62, 'django_celery_beat', '0008_auto_20180914_1922', '2024-08-16 15:03:49.636478'),
	(63, 'django_celery_beat', '0006_auto_20180210_1226', '2024-08-16 15:03:49.659665'),
	(64, 'django_celery_beat', '0006_periodictask_priority', '2024-08-16 15:03:49.680777'),
	(65, 'django_celery_beat', '0009_periodictask_headers', '2024-08-16 15:03:49.704776'),
	(66, 'django_celery_beat', '0010_auto_20190429_0326', '2024-08-16 15:03:50.094326'),
	(67, 'django_celery_beat', '0011_auto_20190508_0153', '2024-08-16 15:03:50.174141'),
	(68, 'visitor', '0001_initial', '2024-08-16 15:03:50.199170'),
	(69, 'visitor', '0002_reservation_visitor_visitorconfig_visitorlog', '2024-08-16 15:03:51.349416'),
	(70, 'iclock', '0002_auto_20200901_1642', '2024-08-16 15:03:53.863816'),
	(71, 'ep', '0001_initial', '2024-08-16 15:03:54.132231'),
	(72, 'ep', '0002_auto_20201217_1608', '2024-08-16 15:03:54.455846'),
	(73, 'ep', '0003_auto_20201229_0852', '2024-08-16 15:03:54.465841'),
	(74, 'guardian', '0001_initial', '2024-08-16 15:03:54.929625'),
	(75, 'iclock', '0003_auto_20201229_0852', '2024-08-16 15:03:55.202805'),
	(76, 'iclock', '0004_auto_20210908_1006', '2024-08-16 15:03:56.382794'),
	(77, 'iclock', '0005_terminalworkcode_company', '2024-08-16 15:03:56.445085'),
	(78, 'iclock', '0006_auto_20220419_1516', '2024-08-16 15:03:56.567083'),
	(79, 'iclock', '0007_auto_20221202_1852', '2024-08-16 15:03:56.703107'),
	(80, 'meeting', '0001_initial', '2024-08-16 15:03:57.867280'),
	(81, 'meeting', '0002_meetingroom_enable_room', '2024-08-16 15:03:57.930927'),
	(82, 'meeting', '0003_auto_20210908_1006', '2024-08-16 15:03:59.128620'),
	(83, 'mobile', '0001_initial', '2024-08-16 15:03:59.289892'),
	(84, 'mobile', '0002_auto_20200901_1642', '2024-08-16 15:04:00.285272'),
	(85, 'mobile', '0003_auto_20201229_0852', '2024-08-16 15:04:00.691886'),
	(86, 'mobile', '0004_mobileapirequestlog', '2024-08-16 15:04:00.866272'),
	(87, 'payroll', '0001_initial', '2024-08-16 15:04:01.334518'),
	(88, 'payroll', '0002_auto_20200901_1642', '2024-08-16 15:04:02.435769'),
	(89, 'payroll', '0003_auto_20200901_1642', '2024-08-16 15:04:04.129057'),
	(90, 'payroll', '0004_auto_20210908_1006', '2024-08-16 15:04:04.391594'),
	(91, 'payroll', '0005_auto_20221202_1852', '2024-08-16 15:04:04.450595'),
	(92, 'personnel', '0006_auto_20211201_1516', '2024-08-16 15:04:04.579741'),
	(93, 'personnel', '0007_auto_20211201_1602', '2024-08-16 15:04:06.606712'),
	(94, 'personnel', '0008_auto_20220106_1103', '2024-08-16 15:04:06.794531'),
	(95, 'personnel', '0009_auto_20220419_1516', '2024-08-16 15:04:06.962629'),
	(96, 'personnel', '0010_auto_20221202_1852', '2024-08-16 15:04:07.000628'),
	(97, 'rest_framework_tracking', '0001_initial', '2024-08-16 15:04:07.166833'),
	(98, 'rest_framework_tracking', '0002_auto_20170118_1713', '2024-08-16 15:04:07.251969'),
	(99, 'rest_framework_tracking', '0003_add_errors', '2024-08-16 15:04:07.282991'),
	(100, 'rest_framework_tracking', '0004_add_verbose_name', '2024-08-16 15:04:07.303001'),
	(101, 'rest_framework_tracking', '0005_auto_20171219_1537', '2024-08-16 15:04:07.441867'),
	(102, 'rest_framework_tracking', '0006_view_and_view_method_nullable', '2024-08-16 15:04:07.601051'),
	(103, 'rest_framework_tracking', '0006_auto_20180315_1442', '2024-08-16 15:04:07.962344'),
	(104, 'rest_framework_tracking', '0007_merge_20180419_1646', '2024-08-16 15:04:07.967318'),
	(105, 'rest_framework_tracking', '0008_auto_20200201_2048', '2024-08-16 15:04:08.005363'),
	(106, 'rest_framework_tracking', '0009_view_method_max_length_200', '2024-08-16 15:04:08.085073'),
	(107, 'rest_framework_tracking', '0010_auto_20200609_1404', '2024-08-16 15:04:08.135147'),
	(108, 'rest_framework_tracking', '0011_auto_20201117_2016', '2024-08-16 15:04:08.167157'),
	(109, 'sessions', '0001_initial', '2024-08-16 15:04:08.202202'),
	(110, 'staff', '0001_initial', '2024-08-16 15:04:08.350361'),
	(111, 'staff', '0002_approvalchangeschedule_approvalleave_approvalmanuallog_approvalovertime_approvaltraining_pendingchan', '2024-08-16 15:04:08.400008'),
	(112, 'staff_meeting', '0001_initial', '2024-08-16 15:04:08.420009'),
	(113, 'visitor', '0003_reservation_email', '2024-08-16 15:04:08.463049'),
	(114, 'visitor', '0004_auto_20210908_1006', '2024-08-16 15:04:09.228830'),
	(115, 'visitor', '0005_auto_20211201_1434', '2024-08-16 15:04:09.253829'),
	(116, 'staff_visitor', '0001_initial', '2024-08-16 15:04:09.265845'),
	(117, 'visitor', '0006_auto_20220419_1516', '2024-08-16 15:04:09.327431'),
	(118, 'visitor', '0007_auto_20221202_1852', '2024-08-16 15:04:09.365451'),
	(119, 'workflow', '0002_auto_20211201_1434', '2024-08-16 15:04:09.729629'),
	(120, 'workflow', '0003_auto_20221202_1852', '2024-08-16 15:04:09.777658');

-- Dumping structure for table rmci.bio.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.django_session: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.ep_epsetup
CREATE TABLE IF NOT EXISTS `ep_epsetup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `temp_alarm` tinyint(1) NOT NULL,
  `temp_warning` decimal(4,1) NOT NULL,
  `temp_warning_F` decimal(4,1) DEFAULT NULL,
  `temp_unit` smallint NOT NULL,
  `mask_alarm` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.ep_epsetup: ~0 rows (approximately)
INSERT INTO `ep_epsetup` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `temp_alarm`, `temp_warning`, `temp_warning_F`, `temp_unit`, `mask_alarm`, `is_default`) VALUES
	(1, '2024-08-16 15:04:14.749411', NULL, '2024-08-16 15:04:14.749411', NULL, 0, 1, 37.3, 99.2, 1, 1, 1);

-- Dumping structure for table rmci.bio.ep_eptransaction
CREATE TABLE IF NOT EXISTS `ep_eptransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `area` varchar(30) NOT NULL,
  `check_datetime` datetime(6) DEFAULT NULL,
  `check_date` date NOT NULL,
  `check_time` time(6) NOT NULL,
  `temperature` decimal(4,1) NOT NULL,
  `is_mask` int NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `source` smallint NOT NULL,
  `terminal_sn` varchar(50) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `emp_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ep_eptransaction_emp_code_check_datetime_0b54f31f_uniq` (`emp_code`,`check_datetime`),
  KEY `ep_eptransaction_emp_id_1006883f_fk_personnel_employee_id` (`emp_id`),
  KEY `ep_eptransaction_terminal_id_4490b209_fk_iclock_terminal_id` (`terminal_id`),
  CONSTRAINT `ep_eptransaction_emp_id_1006883f_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `ep_eptransaction_terminal_id_4490b209_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.ep_eptransaction: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.guardian_groupobjectpermission
CREATE TABLE IF NOT EXISTS `guardian_groupobjectpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq` (`group_id`,`permission_id`,`object_pk`),
  KEY `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` (`content_type_id`),
  KEY `guardian_groupobject_permission_id_36572738_fk_auth_perm` (`permission_id`),
  CONSTRAINT `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_groupobject_group_id_4bbbfb62_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `guardian_groupobject_permission_id_36572738_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.guardian_groupobjectpermission: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.guardian_userobjectpermission
CREATE TABLE IF NOT EXISTS `guardian_userobjectpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq` (`user_id`,`permission_id`,`object_pk`),
  KEY `guardian_userobjectp_content_type_id_2e892405_fk_django_co` (`content_type_id`),
  KEY `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` (`permission_id`),
  CONSTRAINT `guardian_userobjectp_content_type_id_2e892405_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.guardian_userobjectpermission: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_biodata
CREATE TABLE IF NOT EXISTS `iclock_biodata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `bio_tmp` longtext NOT NULL,
  `bio_no` int DEFAULT NULL,
  `bio_index` int DEFAULT NULL,
  `bio_type` int NOT NULL,
  `major_ver` varchar(30) NOT NULL,
  `minor_ver` varchar(30) DEFAULT NULL,
  `bio_format` int DEFAULT NULL,
  `valid` int NOT NULL,
  `duress` int NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iclock_biodata_employee_id_bio_no_bio_i_b71b2ca9_uniq` (`employee_id`,`bio_no`,`bio_index`,`bio_type`,`bio_format`,`major_ver`),
  CONSTRAINT `iclock_biodata_employee_id_ff748ea7_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_biodata: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_biophoto
CREATE TABLE IF NOT EXISTS `iclock_biophoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `enroll_sn` varchar(50) DEFAULT NULL,
  `register_photo` varchar(100) NOT NULL,
  `register_time` datetime(6) NOT NULL,
  `approval_photo` varchar(100) DEFAULT NULL,
  `approval_state` smallint NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id` (`employee_id`),
  CONSTRAINT `iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_biophoto: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_devicemoduleconfig
CREATE TABLE IF NOT EXISTS `iclock_devicemoduleconfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `enable_registration` tinyint(1) NOT NULL,
  `enable_resigned_filter` tinyint(1) NOT NULL,
  `enable_auto_add` tinyint(1) NOT NULL,
  `enable_name_upload` tinyint(1) NOT NULL,
  `enable_name_download` tinyint(1) NOT NULL,
  `enable_card_upload` tinyint(1) NOT NULL,
  `encryption` tinyint(1) NOT NULL,
  `timezone` smallint NOT NULL,
  `global_setup` tinyint(1) NOT NULL,
  `heartbeat` int NOT NULL,
  `transfer_mode` smallint NOT NULL,
  `transfer_interval` int NOT NULL,
  `transfer_time` varchar(100) NOT NULL,
  `transaction_retention` int NOT NULL,
  `command_retention` int NOT NULL,
  `dev_log_retention` int NOT NULL,
  `upload_log_retention` int NOT NULL,
  `edit_policy` smallint NOT NULL,
  `import_policy` smallint NOT NULL,
  `mobile_policy` smallint NOT NULL,
  `device_policy` smallint NOT NULL,
  `api_policy` smallint NOT NULL,
  `sync_mode` smallint NOT NULL,
  `sync_time` varchar(100) NOT NULL,
  `visitor_policy` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_devicemoduleconfig: ~0 rows (approximately)
INSERT INTO `iclock_devicemoduleconfig` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `enable_registration`, `enable_resigned_filter`, `enable_auto_add`, `enable_name_upload`, `enable_name_download`, `enable_card_upload`, `encryption`, `timezone`, `global_setup`, `heartbeat`, `transfer_mode`, `transfer_interval`, `transfer_time`, `transaction_retention`, `command_retention`, `dev_log_retention`, `upload_log_retention`, `edit_policy`, `import_policy`, `mobile_policy`, `device_policy`, `api_policy`, `sync_mode`, `sync_time`, `visitor_policy`) VALUES
	(1, '2024-08-16 15:04:11.707740', NULL, '2024-08-16 15:04:11.707740', NULL, 0, 0, 0, 1, 1, 1, 1, 1, 8, 0, 10, 1, 1, '00:00;14:05', 9999, 9999, 9999, 9999, 0, 0, 0, 3, 3, 1, '00:00;12:00', 0);

-- Dumping structure for table rmci.bio.iclock_errorcommandlog
CREATE TABLE IF NOT EXISTS `iclock_errorcommandlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `error_code` varchar(16) DEFAULT NULL,
  `error_msg` varchar(50) DEFAULT NULL,
  `data_origin` longtext,
  `cmd` varchar(50) DEFAULT NULL,
  `additional` longtext,
  `upload_time` datetime(6) NOT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_errorcommandl_terminal_id_3b2d7cbd_fk_iclock_te` (`terminal_id`),
  CONSTRAINT `iclock_errorcommandl_terminal_id_3b2d7cbd_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_errorcommandlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_privatemessage
CREATE TABLE IF NOT EXISTS `iclock_privatemessage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `last_send` datetime(6) DEFAULT NULL,
  `employee_id` int NOT NULL,
  `message_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_privatemessag_employee_id_e84a34c0_fk_personnel` (`employee_id`),
  KEY `iclock_privatemessag_message_id_e3145d3b_fk_iclock_sh` (`message_id`),
  CONSTRAINT `iclock_privatemessag_employee_id_e84a34c0_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `iclock_privatemessag_message_id_e3145d3b_fk_iclock_sh` FOREIGN KEY (`message_id`) REFERENCES `iclock_shortmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_privatemessage: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_publicmessage
CREATE TABLE IF NOT EXISTS `iclock_publicmessage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `last_send` datetime(6) DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_publicmessage_message_id_7d125e28_fk_iclock_sh` (`message_id`),
  KEY `iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id` (`terminal_id`),
  CONSTRAINT `iclock_publicmessage_message_id_7d125e28_fk_iclock_sh` FOREIGN KEY (`message_id`) REFERENCES `iclock_shortmessage` (`id`),
  CONSTRAINT `iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_publicmessage: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_shortmessage
CREATE TABLE IF NOT EXISTS `iclock_shortmessage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `duration` int NOT NULL,
  `msg_type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_shortmessage: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_terminal
CREATE TABLE IF NOT EXISTS `iclock_terminal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `sn` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `ip_address` char(39) NOT NULL,
  `real_ip` char(39) DEFAULT NULL,
  `state` int NOT NULL,
  `terminal_tz` smallint NOT NULL,
  `heartbeat` int NOT NULL,
  `transfer_mode` smallint NOT NULL,
  `transfer_interval` int NOT NULL,
  `transfer_time` varchar(100) NOT NULL,
  `product_type` smallint DEFAULT NULL,
  `is_attendance` smallint NOT NULL,
  `is_registration` smallint NOT NULL,
  `purpose` smallint DEFAULT NULL,
  `controller_type` smallint DEFAULT NULL,
  `authentication` smallint NOT NULL,
  `style` varchar(20) DEFAULT NULL,
  `upload_flag` varchar(10) DEFAULT NULL,
  `fw_ver` varchar(100) DEFAULT NULL,
  `push_protocol` varchar(30) NOT NULL,
  `push_ver` varchar(30) DEFAULT NULL,
  `language` int DEFAULT NULL,
  `is_tft` tinyint(1) NOT NULL,
  `terminal_name` varchar(30) DEFAULT NULL,
  `platform` varchar(30) DEFAULT NULL,
  `oem_vendor` varchar(50) DEFAULT NULL,
  `log_stamp` varchar(30) DEFAULT NULL,
  `op_log_stamp` varchar(30) DEFAULT NULL,
  `capture_stamp` varchar(30) DEFAULT NULL,
  `user_count` int DEFAULT NULL,
  `transaction_count` int DEFAULT NULL,
  `fp_count` int DEFAULT NULL,
  `fp_alg_ver` varchar(10) DEFAULT NULL,
  `face_count` int DEFAULT NULL,
  `face_alg_ver` varchar(10) DEFAULT NULL,
  `fv_count` int DEFAULT NULL,
  `fv_alg_ver` varchar(10) DEFAULT NULL,
  `palm_count` int DEFAULT NULL,
  `palm_alg_ver` varchar(10) DEFAULT NULL,
  `lock_func` smallint NOT NULL,
  `last_activity` datetime(6) DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `push_time` datetime(6) DEFAULT NULL,
  `is_access` smallint NOT NULL,
  `area_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `iclock_terminal_area_id_c019c6f0` (`area_id`),
  CONSTRAINT `iclock_terminal_area_id_c019c6f0_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminal: ~0 rows (approximately)
INSERT INTO `iclock_terminal` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `sn`, `alias`, `ip_address`, `real_ip`, `state`, `terminal_tz`, `heartbeat`, `transfer_mode`, `transfer_interval`, `transfer_time`, `product_type`, `is_attendance`, `is_registration`, `purpose`, `controller_type`, `authentication`, `style`, `upload_flag`, `fw_ver`, `push_protocol`, `push_ver`, `language`, `is_tft`, `terminal_name`, `platform`, `oem_vendor`, `log_stamp`, `op_log_stamp`, `capture_stamp`, `user_count`, `transaction_count`, `fp_count`, `fp_alg_ver`, `face_count`, `face_alg_ver`, `fv_count`, `fv_alg_ver`, `palm_count`, `palm_alg_ver`, `lock_func`, `last_activity`, `upload_time`, `push_time`, `is_access`, `area_id`) VALUES
	(1, '2024-08-16 15:09:22.491393', NULL, '2024-08-19 08:39:12.843783', NULL, 0, 'AF6P224460435', 'ZKTECO', '185.200.11.10', NULL, 1, 8, 10, 1, 1, '00:00;14:05', 9, 1, 0, NULL, 0, 1, NULL, '1111100000', NULL, '', NULL, 84, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1);

-- Dumping structure for table rmci.bio.iclock_terminalcommand
CREATE TABLE IF NOT EXISTS `iclock_terminalcommand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `commit_time` datetime(6) NOT NULL,
  `transfer_time` datetime(6) DEFAULT NULL,
  `return_time` datetime(6) DEFAULT NULL,
  `return_value` int DEFAULT NULL,
  `package` int DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_terminalcomma_terminal_id_3dcf836f_fk_iclock_te` (`terminal_id`),
  CONSTRAINT `iclock_terminalcomma_terminal_id_3dcf836f_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminalcommand: ~0 rows (approximately)
INSERT INTO `iclock_terminalcommand` (`id`, `content`, `commit_time`, `transfer_time`, `return_time`, `return_value`, `package`, `terminal_id`) VALUES
	(1, 'INFO', '2024-08-16 15:10:18.445600', NULL, NULL, NULL, NULL, 1);

-- Dumping structure for table rmci.bio.iclock_terminalcommandlog
CREATE TABLE IF NOT EXISTS `iclock_terminalcommandlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `commit_time` datetime(6) NOT NULL,
  `transfer_time` datetime(6) DEFAULT NULL,
  `return_time` datetime(6) DEFAULT NULL,
  `return_value` int DEFAULT NULL,
  `package` int DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_terminalcomma_terminal_id_35ea8b2b_fk_iclock_te` (`terminal_id`),
  CONSTRAINT `iclock_terminalcomma_terminal_id_35ea8b2b_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminalcommandlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_terminalemployee
CREATE TABLE IF NOT EXISTS `iclock_terminalemployee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `terminal_sn` varchar(50) NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `privilege` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminalemployee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_terminallog
CREATE TABLE IF NOT EXISTS `iclock_terminallog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `terminal_tz` smallint DEFAULT NULL,
  `admin` varchar(50) DEFAULT NULL,
  `action_name` smallint DEFAULT NULL,
  `action_time` datetime(6) DEFAULT NULL,
  `object` varchar(50) DEFAULT NULL,
  `param1` int DEFAULT NULL,
  `param2` int DEFAULT NULL,
  `param3` int DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id` (`terminal_id`),
  CONSTRAINT `iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminallog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_terminalparameter
CREATE TABLE IF NOT EXISTS `iclock_terminalparameter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `param_type` varchar(10) DEFAULT NULL,
  `param_name` varchar(30) NOT NULL,
  `param_value` varchar(100) NOT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iclock_terminalparameter_terminal_id_param_name_8abbb5c0_uniq` (`terminal_id`,`param_name`),
  CONSTRAINT `iclock_terminalparam_terminal_id_443872e3_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminalparameter: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_terminaluploadlog
CREATE TABLE IF NOT EXISTS `iclock_terminaluploadlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(80) NOT NULL,
  `content` varchar(80) NOT NULL,
  `upload_count` int NOT NULL,
  `error_count` int NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_terminaluploa_terminal_id_9c9a7664_fk_iclock_te` (`terminal_id`),
  CONSTRAINT `iclock_terminaluploa_terminal_id_9c9a7664_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminaluploadlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_terminalworkcode
CREATE TABLE IF NOT EXISTS `iclock_terminalworkcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(8) NOT NULL,
  `alias` varchar(24) NOT NULL,
  `last_activity` datetime(6) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `iclock_terminalworkc_company_id_77625f26_fk_personnel` (`company_id`),
  CONSTRAINT `iclock_terminalworkc_company_id_77625f26_fk_personnel` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_terminalworkcode: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_transaction
CREATE TABLE IF NOT EXISTS `iclock_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(20) NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `verify_type` int NOT NULL,
  `work_code` varchar(20) DEFAULT NULL,
  `terminal_sn` varchar(50) DEFAULT NULL,
  `terminal_alias` varchar(50) DEFAULT NULL,
  `area_alias` varchar(30) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `gps_location` longtext,
  `mobile` varchar(50) DEFAULT NULL,
  `source` smallint DEFAULT NULL,
  `purpose` smallint DEFAULT NULL,
  `crc` varchar(100) DEFAULT NULL,
  `is_attendance` smallint DEFAULT NULL,
  `reserved` varchar(100) DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `sync_status` smallint DEFAULT NULL,
  `sync_time` datetime(6) DEFAULT NULL,
  `is_mask` smallint DEFAULT NULL,
  `temperature` decimal(4,1) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `company_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iclock_transaction_company_code_emp_code_pu_2665c3d7_uniq` (`company_code`,`emp_code`,`punch_time`),
  KEY `iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id` (`emp_id`),
  KEY `iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id` (`terminal_id`),
  CONSTRAINT `iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_transaction: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.iclock_transactionproofcmd
CREATE TABLE IF NOT EXISTS `iclock_transactionproofcmd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `terminal_count` int DEFAULT NULL,
  `server_count` int DEFAULT NULL,
  `flag` smallint DEFAULT NULL,
  `reserved_init` int DEFAULT NULL,
  `reserved_float` double DEFAULT NULL,
  `reserved_char` varchar(30) DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_transactionpr_terminal_id_08b81e1e_fk_iclock_te` (`terminal_id`),
  CONSTRAINT `iclock_transactionpr_terminal_id_08b81e1e_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.iclock_transactionproofcmd: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingentity
CREATE TABLE IF NOT EXISTS `meeting_meetingentity` (
  `workflowinstance_ptr_id` int NOT NULL,
  `code` varchar(32) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `meeting_date` date NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `duration` int NOT NULL,
  `in_required` tinyint(1) NOT NULL,
  `in_start` datetime(6) NOT NULL,
  `in_end` datetime(6) NOT NULL,
  `out_required` tinyint(1) NOT NULL,
  `out_start` datetime(6) NOT NULL,
  `out_end` datetime(6) NOT NULL,
  `apply_reason` varchar(200) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `calculation_time` datetime(6) DEFAULT NULL,
  `sync_time` datetime(6) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `auto_recording` varchar(50) NOT NULL,
  `enable_virtual` tinyint(1) NOT NULL,
  `enable_waiting_room` tinyint(1) NOT NULL,
  `host_video` tinyint(1) NOT NULL,
  `jbh_anytime` tinyint(1) NOT NULL,
  `link_data` longtext,
  `mute_upon_entry` tinyint(1) NOT NULL,
  `participant_video` tinyint(1) NOT NULL,
  `preferences` longtext,
  `time_zone` smallint NOT NULL,
  `view_date` date NOT NULL,
  `virutal_uuid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  UNIQUE KEY `code` (`code`),
  KEY `meeting_meetingentity_room_id_bc2c738e_fk_meeting_meetingroom_id` (`room_id`),
  CONSTRAINT `meeting_meetingentit_workflowinstance_ptr_dbd9ab40_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`),
  CONSTRAINT `meeting_meetingentity_room_id_bc2c738e_fk_meeting_meetingroom_id` FOREIGN KEY (`room_id`) REFERENCES `meeting_meetingroom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingentity: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingentity_attender
CREATE TABLE IF NOT EXISTS `meeting_meetingentity_attender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meetingentity_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meeting_meetingentity_at_meetingentity_id_employe_b556fc2d_uniq` (`meetingentity_id`,`employee_id`),
  KEY `meeting_meetingentit_employee_id_ee898064_fk_personnel` (`employee_id`),
  CONSTRAINT `meeting_meetingentit_employee_id_ee898064_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `meeting_meetingentit_meetingentity_id_b96dbc7d_fk_meeting_m` FOREIGN KEY (`meetingentity_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingentity_attender: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingmanuallog
CREATE TABLE IF NOT EXISTS `meeting_meetingmanuallog` (
  `workflowinstance_ptr_id` int NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `apply_reason` varchar(200) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `meeting_id` int DEFAULT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  KEY `meeting_meetingmanua_meeting_id_a672eaaf_fk_meeting_m` (`meeting_id`),
  CONSTRAINT `meeting_meetingmanua_meeting_id_a672eaaf_fk_meeting_m` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`),
  CONSTRAINT `meeting_meetingmanua_workflowinstance_ptr_bd514862_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingmanuallog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingpayloadbase
CREATE TABLE IF NOT EXISTS `meeting_meetingpayloadbase` (
  `id` char(32) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `duration` int NOT NULL,
  `meeting_date` date NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `attended_duration` int NOT NULL,
  `late_in` int NOT NULL,
  `early_out` int NOT NULL,
  `absent` int NOT NULL,
  `emp_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_meetingpaylo_emp_id_ed6ec148_fk_personnel` (`emp_id`),
  KEY `meeting_meetingpaylo_meeting_id_ca9d20cc_fk_meeting_m` (`meeting_id`),
  CONSTRAINT `meeting_meetingpaylo_emp_id_ed6ec148_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `meeting_meetingpaylo_meeting_id_ca9d20cc_fk_meeting_m` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingpayloadbase: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingroom
CREATE TABLE IF NOT EXISTS `meeting_meetingroom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(32) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  `location` varchar(200) NOT NULL,
  `remark` longtext,
  `state` smallint NOT NULL,
  `enable_room` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingroom: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingroomdevice
CREATE TABLE IF NOT EXISTS `meeting_meetingroomdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` int NOT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id` (`device_id`),
  KEY `meeting_meetingroomd_room_id_e000d78d_fk_meeting_m` (`room_id`),
  CONSTRAINT `meeting_meetingroomd_device_id_a09e8a7d_fk_iclock_te` FOREIGN KEY (`device_id`) REFERENCES `iclock_terminal` (`id`),
  CONSTRAINT `meeting_meetingroomd_room_id_e000d78d_fk_meeting_m` FOREIGN KEY (`room_id`) REFERENCES `meeting_meetingroom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingroomdevice: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.meeting_meetingtransaction
CREATE TABLE IF NOT EXISTS `meeting_meetingtransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(50) NOT NULL,
  `punch_datetime` datetime(6) NOT NULL,
  `punch_date` date NOT NULL,
  `punch_time` time(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `source` smallint NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `emp_id` int DEFAULT NULL,
  `meeting_id` int DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meeting_meetingtransaction_emp_id_punch_datetime_65665dce_uniq` (`emp_id`,`punch_datetime`),
  KEY `meeting_meetingtrans_meeting_id_e4e505e5_fk_meeting_m` (`meeting_id`),
  KEY `meeting_meetingtrans_terminal_id_047426f2_fk_iclock_te` (`terminal_id`),
  CONSTRAINT `meeting_meetingtrans_emp_id_fbcdd686_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `meeting_meetingtrans_meeting_id_e4e505e5_fk_meeting_m` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`),
  CONSTRAINT `meeting_meetingtrans_terminal_id_047426f2_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.meeting_meetingtransaction: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_announcement
CREATE TABLE IF NOT EXISTS `mobile_announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `category` smallint NOT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `system_sender` varchar(50) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `init_sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_announcement_admin_id_6af3868c_fk_auth_user_id` (`admin_id`),
  KEY `mobile_announcement_init_sender_id_2f5e35bd_fk_personnel` (`init_sender_id`),
  KEY `mobile_announcement_receiver_id_ddf2a860_fk_personnel` (`receiver_id`),
  CONSTRAINT `mobile_announcement_admin_id_6af3868c_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `mobile_announcement_init_sender_id_2f5e35bd_fk_personnel` FOREIGN KEY (`init_sender_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `mobile_announcement_receiver_id_ddf2a860_fk_personnel` FOREIGN KEY (`receiver_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_announcement: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_appactionlog
CREATE TABLE IF NOT EXISTS `mobile_appactionlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `client` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `params` longtext,
  `describe` longtext,
  `request_status` smallint NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `remote_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_appactionlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_applist
CREATE TABLE IF NOT EXISTS `mobile_applist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `login_time` datetime(6) NOT NULL,
  `last_active` datetime(6) NOT NULL,
  `token` longtext NOT NULL,
  `device_token` longtext NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_category` smallint NOT NULL,
  `active` smallint DEFAULT NULL,
  `enable` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_applist: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_appnotification
CREATE TABLE IF NOT EXISTS `mobile_appnotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) DEFAULT NULL,
  `system_sender` varchar(50) DEFAULT NULL,
  `category` smallint NOT NULL,
  `sub_category` int DEFAULT NULL,
  `content` longtext,
  `payload` longtext,
  `source` int DEFAULT NULL,
  `notification_time` datetime(6) NOT NULL,
  `read_status` smallint NOT NULL,
  `read_time` datetime(6) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `init_sender_id` int DEFAULT NULL,
  `receiver_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_appnotification_admin_id_29c27197_fk_auth_user_id` (`admin_id`),
  KEY `mobile_appnotificati_init_sender_id_d8aff845_fk_personnel` (`init_sender_id`),
  KEY `mobile_appnotificati_receiver_id_90c4a355_fk_personnel` (`receiver_id`),
  CONSTRAINT `mobile_appnotificati_init_sender_id_d8aff845_fk_personnel` FOREIGN KEY (`init_sender_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `mobile_appnotificati_receiver_id_90c4a355_fk_personnel` FOREIGN KEY (`receiver_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `mobile_appnotification_admin_id_29c27197_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_appnotification: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_gpsfordepartment
CREATE TABLE IF NOT EXISTS `mobile_gpsfordepartment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `distance` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_gpsfordepartm_department_id_988ccf22_fk_personnel` (`department_id`),
  CONSTRAINT `mobile_gpsfordepartm_department_id_988ccf22_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_gpsfordepartment: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_gpsfordepartment_location
CREATE TABLE IF NOT EXISTS `mobile_gpsfordepartment_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gpsfordepartment_id` int NOT NULL,
  `gpslocation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_gpsfordepartment__gpsfordepartment_id_gpsl_58226033_uniq` (`gpsfordepartment_id`,`gpslocation_id`),
  KEY `mobile_gpsfordepartm_gpslocation_id_48b82e9e_fk_mobile_gp` (`gpslocation_id`),
  CONSTRAINT `mobile_gpsfordepartm_gpsfordepartment_id_23e9af3a_fk_mobile_gp` FOREIGN KEY (`gpsfordepartment_id`) REFERENCES `mobile_gpsfordepartment` (`id`),
  CONSTRAINT `mobile_gpsfordepartm_gpslocation_id_48b82e9e_fk_mobile_gp` FOREIGN KEY (`gpslocation_id`) REFERENCES `mobile_gpslocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_gpsfordepartment_location: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_gpsforemployee
CREATE TABLE IF NOT EXISTS `mobile_gpsforemployee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `distance` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_gpsforemploye_employee_id_982b7cef_fk_personnel` (`employee_id`),
  CONSTRAINT `mobile_gpsforemploye_employee_id_982b7cef_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_gpsforemployee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_gpsforemployee_location
CREATE TABLE IF NOT EXISTS `mobile_gpsforemployee_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gpsforemployee_id` int NOT NULL,
  `gpslocation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_gpsforemployee_lo_gpsforemployee_id_gpsloc_9ceb93bf_uniq` (`gpsforemployee_id`,`gpslocation_id`),
  KEY `mobile_gpsforemploye_gpslocation_id_497a214f_fk_mobile_gp` (`gpslocation_id`),
  CONSTRAINT `mobile_gpsforemploye_gpsforemployee_id_a52023d5_fk_mobile_gp` FOREIGN KEY (`gpsforemployee_id`) REFERENCES `mobile_gpsforemployee` (`id`),
  CONSTRAINT `mobile_gpsforemploye_gpslocation_id_497a214f_fk_mobile_gp` FOREIGN KEY (`gpslocation_id`) REFERENCES `mobile_gpslocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_gpsforemployee_location: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_gpslocation
CREATE TABLE IF NOT EXISTS `mobile_gpslocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `alias` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_gpslocation: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.mobile_mobileapirequestlog
CREATE TABLE IF NOT EXISTS `mobile_mobileapirequestlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username_persistent` varchar(200) DEFAULT NULL,
  `requested_at` datetime(6) NOT NULL,
  `response_ms` int unsigned NOT NULL,
  `path` varchar(200) NOT NULL,
  `view` varchar(200) DEFAULT NULL,
  `view_method` varchar(200) DEFAULT NULL,
  `remote_addr` char(39) NOT NULL,
  `host` varchar(200) NOT NULL,
  `method` varchar(10) NOT NULL,
  `query_params` longtext,
  `data` longtext,
  `response` longtext,
  `errors` longtext,
  `status_code` int unsigned DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_mobileapirequ_user_id_dfd3ded1_fk_personnel` (`user_id`),
  KEY `mobile_mobileapirequestlog_requested_at_a8c85067` (`requested_at`),
  KEY `mobile_mobileapirequestlog_path_830043b5` (`path`),
  KEY `mobile_mobileapirequestlog_view_50dbf600` (`view`),
  KEY `mobile_mobileapirequestlog_view_method_2e13cf95` (`view_method`),
  KEY `mobile_mobileapirequestlog_status_code_c2de0c48` (`status_code`),
  CONSTRAINT `mobile_mobileapirequ_user_id_dfd3ded1_fk_personnel` FOREIGN KEY (`user_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.mobile_mobileapirequestlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_deductionformula
CREATE TABLE IF NOT EXISTS `payroll_deductionformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_deductionformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_emploan
CREATE TABLE IF NOT EXISTS `payroll_emploan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `loan_amount` double NOT NULL,
  `loan_time` datetime(6) NOT NULL,
  `refund_cycle` smallint NOT NULL,
  `per_cycle_refund` double NOT NULL,
  `loan_clean_time` datetime(6) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id` (`employee_id`),
  CONSTRAINT `payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_emploan: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_emppayrollprofile
CREATE TABLE IF NOT EXISTS `payroll_emppayrollprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_mode` smallint DEFAULT NULL,
  `payment_type` smallint DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_account` varchar(30) DEFAULT NULL,
  `personnel_id` varchar(30) DEFAULT NULL,
  `agent_id` varchar(30) DEFAULT NULL,
  `agent_account` varchar(30) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `payroll_emppayrollpr_employee_id_6c97078c_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_emppayrollprofile: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_exceptionformula
CREATE TABLE IF NOT EXISTS `payroll_exceptionformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `pay_code_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `payroll_exceptionformula_pay_code_id_97609b51_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `payroll_exceptionformula_pay_code_id_97609b51_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_exceptionformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_extradeduction
CREATE TABLE IF NOT EXISTS `payroll_extradeduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `amount` double NOT NULL,
  `issued_time` datetime(6) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_extradeducti_employee_id_53072441_fk_personnel` (`employee_id`),
  CONSTRAINT `payroll_extradeducti_employee_id_53072441_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_extradeduction: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_extraincrease
CREATE TABLE IF NOT EXISTS `payroll_extraincrease` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `amount` double NOT NULL,
  `issued_time` datetime(6) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_extraincreas_employee_id_f902e6bb_fk_personnel` (`employee_id`),
  CONSTRAINT `payroll_extraincreas_employee_id_f902e6bb_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_extraincrease: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_increasementformula
CREATE TABLE IF NOT EXISTS `payroll_increasementformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_increasementformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_leaveformula
CREATE TABLE IF NOT EXISTS `payroll_leaveformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `pay_code_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `payroll_leaveformula_pay_code_id_63c7b4bd_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `payroll_leaveformula_pay_code_id_63c7b4bd_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_leaveformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_overtimeformula
CREATE TABLE IF NOT EXISTS `payroll_overtimeformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `pay_code_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `payroll_overtimeformula_pay_code_id_36d2f10e_fk_att_paycode_id` (`pay_code_id`),
  CONSTRAINT `payroll_overtimeformula_pay_code_id_36d2f10e_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_overtimeformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_payrollpayload
CREATE TABLE IF NOT EXISTS `payroll_payrollpayload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calc_time` date DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `format_dict` longtext,
  `payment_mode` smallint DEFAULT NULL,
  `increase` double DEFAULT NULL,
  `deduction` double DEFAULT NULL,
  `increase_formula` longtext,
  `deduction_formula` longtext,
  `increase_formula_name` longtext,
  `deduction_formula_name` longtext,
  `extra_increase` double DEFAULT NULL,
  `extra_deduction` double DEFAULT NULL,
  `total_loan_amount` double DEFAULT NULL,
  `refund_loan_amount` double DEFAULT NULL,
  `unrefund_loan_amount` double DEFAULT NULL,
  `loan_deduction` double DEFAULT NULL,
  `loan_increase` double DEFAULT NULL,
  `advance_increase` double DEFAULT NULL,
  `advance_deduction` double DEFAULT NULL,
  `reimbursement` double DEFAULT NULL,
  `total_increase_formula` longtext,
  `total_increase_formula_name` longtext,
  `total_increase_expression` longtext,
  `total_increase` double DEFAULT NULL,
  `total_deduction_formula` longtext,
  `total_deduction_formula_name` longtext,
  `total_deduction_expression` longtext,
  `total_deduction` double DEFAULT NULL,
  `total_salary_expression` longtext,
  `total_salary` double DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_payrollpaylo_employee_id_bc868f2b_fk_personnel` (`employee_id`),
  CONSTRAINT `payroll_payrollpaylo_employee_id_bc868f2b_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_payrollpayload: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_payrollpayloadpaycode
CREATE TABLE IF NOT EXISTS `payroll_payrollpayloadpaycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `formula` longtext,
  `formula_name` longtext,
  `pay_code_id` int NOT NULL,
  `payload_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_payrollpaylo_pay_code_id_c057af1f_fk_att_payco` (`pay_code_id`),
  KEY `payroll_payrollpaylo_payload_id_f085c4e8_fk_payroll_p` (`payload_id`),
  CONSTRAINT `payroll_payrollpaylo_pay_code_id_c057af1f_fk_att_payco` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  CONSTRAINT `payroll_payrollpaylo_payload_id_f085c4e8_fk_payroll_p` FOREIGN KEY (`payload_id`) REFERENCES `payroll_payrollpayload` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_payrollpayloadpaycode: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_reimbursement
CREATE TABLE IF NOT EXISTS `payroll_reimbursement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rmb_amount` double NOT NULL,
  `rmb_time` datetime(6) NOT NULL,
  `rmb_file` varchar(200) DEFAULT NULL,
  `rmb_remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_reimbursemen_employee_id_c4bbde36_fk_personnel` (`employee_id`),
  CONSTRAINT `payroll_reimbursemen_employee_id_c4bbde36_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_reimbursement: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salaryadvance
CREATE TABLE IF NOT EXISTS `payroll_salaryadvance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `advance_amount` double NOT NULL,
  `advance_time` datetime(6) NOT NULL,
  `advance_remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_salaryadvanc_employee_id_2abd43e5_fk_personnel` (`employee_id`),
  CONSTRAINT `payroll_salaryadvanc_employee_id_2abd43e5_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salaryadvance: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salarystructure
CREATE TABLE IF NOT EXISTS `payroll_salarystructure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `salary_amount` double NOT NULL,
  `effective_date` date NOT NULL,
  `salary_remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_salarystruct_employee_id_98996e15_fk_personnel` (`employee_id`),
  CONSTRAINT `payroll_salarystruct_employee_id_98996e15_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salarystructure: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salarystructure_deductionformula
CREATE TABLE IF NOT EXISTS `payroll_salarystructure_deductionformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salarystructure_id` int NOT NULL,
  `deductionformula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payroll_salarystructure__salarystructure_id_deduc_794e8449_uniq` (`salarystructure_id`,`deductionformula_id`),
  KEY `payroll_salarystruct_deductionformula_id_b174d5b6_fk_payroll_d` (`deductionformula_id`),
  CONSTRAINT `payroll_salarystruct_deductionformula_id_b174d5b6_fk_payroll_d` FOREIGN KEY (`deductionformula_id`) REFERENCES `payroll_deductionformula` (`id`),
  CONSTRAINT `payroll_salarystruct_salarystructure_id_5ca7cdb5_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salarystructure_deductionformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salarystructure_exceptionformula
CREATE TABLE IF NOT EXISTS `payroll_salarystructure_exceptionformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salarystructure_id` int NOT NULL,
  `exceptionformula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payroll_salarystructure__salarystructure_id_excep_a5e869ff_uniq` (`salarystructure_id`,`exceptionformula_id`),
  KEY `payroll_salarystruct_exceptionformula_id_8f6dadb3_fk_payroll_e` (`exceptionformula_id`),
  CONSTRAINT `payroll_salarystruct_exceptionformula_id_8f6dadb3_fk_payroll_e` FOREIGN KEY (`exceptionformula_id`) REFERENCES `payroll_exceptionformula` (`id`),
  CONSTRAINT `payroll_salarystruct_salarystructure_id_3c087208_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salarystructure_exceptionformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salarystructure_increasementformula
CREATE TABLE IF NOT EXISTS `payroll_salarystructure_increasementformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salarystructure_id` int NOT NULL,
  `increasementformula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payroll_salarystructure__salarystructure_id_incre_749132b3_uniq` (`salarystructure_id`,`increasementformula_id`),
  KEY `payroll_salarystruct_increasementformula__3cd77082_fk_payroll_i` (`increasementformula_id`),
  CONSTRAINT `payroll_salarystruct_increasementformula__3cd77082_fk_payroll_i` FOREIGN KEY (`increasementformula_id`) REFERENCES `payroll_increasementformula` (`id`),
  CONSTRAINT `payroll_salarystruct_salarystructure_id_8752401c_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salarystructure_increasementformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salarystructure_leaveformula
CREATE TABLE IF NOT EXISTS `payroll_salarystructure_leaveformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salarystructure_id` int NOT NULL,
  `leaveformula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payroll_salarystructure__salarystructure_id_leave_4efdce30_uniq` (`salarystructure_id`,`leaveformula_id`),
  KEY `payroll_salarystruct_leaveformula_id_049f9024_fk_payroll_l` (`leaveformula_id`),
  CONSTRAINT `payroll_salarystruct_leaveformula_id_049f9024_fk_payroll_l` FOREIGN KEY (`leaveformula_id`) REFERENCES `payroll_leaveformula` (`id`),
  CONSTRAINT `payroll_salarystruct_salarystructure_id_cf98fdd7_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salarystructure_leaveformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.payroll_salarystructure_overtimeformula
CREATE TABLE IF NOT EXISTS `payroll_salarystructure_overtimeformula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salarystructure_id` int NOT NULL,
  `overtimeformula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payroll_salarystructure__salarystructure_id_overt_0d0a0e81_uniq` (`salarystructure_id`,`overtimeformula_id`),
  KEY `payroll_salarystruct_overtimeformula_id_40ad89ef_fk_payroll_o` (`overtimeformula_id`),
  CONSTRAINT `payroll_salarystruct_overtimeformula_id_40ad89ef_fk_payroll_o` FOREIGN KEY (`overtimeformula_id`) REFERENCES `payroll_overtimeformula` (`id`),
  CONSTRAINT `payroll_salarystruct_salarystructure_id_64f75042_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.payroll_salarystructure_overtimeformula: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_area
CREATE TABLE IF NOT EXISTS `personnel_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_code` varchar(30) NOT NULL,
  `area_name` varchar(30) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `parent_area_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `device_count` int NOT NULL,
  `employee_count` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_area_company_id_area_code_aa39c55c_uniq` (`company_id`,`area_code`),
  KEY `personnel_area_parent_area_id_39028fda_fk_personnel_area_id` (`parent_area_id`),
  KEY `personnel_area_company_id_59750eb5` (`company_id`),
  CONSTRAINT `personnel_area_company_id_59750eb5_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  CONSTRAINT `personnel_area_parent_area_id_39028fda_fk_personnel_area_id` FOREIGN KEY (`parent_area_id`) REFERENCES `personnel_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_area: ~0 rows (approximately)
INSERT INTO `personnel_area` (`id`, `area_code`, `area_name`, `is_default`, `parent_area_id`, `company_id`, `device_count`, `employee_count`) VALUES
	(1, '1', 'Not Authorized', 1, NULL, 1, 1, 0);

-- Dumping structure for table rmci.bio.personnel_assignareaemployee
CREATE TABLE IF NOT EXISTS `personnel_assignareaemployee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assigned_time` datetime(6) NOT NULL,
  `area_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personnel_assignarea_area_id_6f049d6a_fk_personnel` (`area_id`),
  KEY `personnel_assignarea_employee_id_a3d4dd25_fk_personnel` (`employee_id`),
  CONSTRAINT `personnel_assignarea_area_id_6f049d6a_fk_personnel` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  CONSTRAINT `personnel_assignarea_employee_id_a3d4dd25_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_assignareaemployee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_certification
CREATE TABLE IF NOT EXISTS `personnel_certification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cert_code` varchar(20) NOT NULL,
  `cert_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cert_code` (`cert_code`),
  UNIQUE KEY `cert_name` (`cert_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_certification: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_company
CREATE TABLE IF NOT EXISTS `personnel_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_code` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_code` (`company_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_company: ~0 rows (approximately)
INSERT INTO `personnel_company` (`id`, `company_code`, `company_name`, `is_default`) VALUES
	(1, '1', 'company.default', 1);

-- Dumping structure for table rmci.bio.personnel_department
CREATE TABLE IF NOT EXISTS `personnel_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `parent_dept_id` int DEFAULT NULL,
  `dept_manager_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_department_company_id_dept_code_dfa8fff7_uniq` (`company_id`,`dept_code`),
  KEY `personnel_department_parent_dept_id_d0b44024_fk_personnel` (`parent_dept_id`),
  KEY `personnel_department_dept_manager_id_c5124a7d_fk_personnel` (`dept_manager_id`),
  KEY `personnel_department_company_id_00867fd8` (`company_id`),
  CONSTRAINT `personnel_department_company_id_00867fd8_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  CONSTRAINT `personnel_department_dept_manager_id_c5124a7d_fk_personnel` FOREIGN KEY (`dept_manager_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `personnel_department_parent_dept_id_d0b44024_fk_personnel` FOREIGN KEY (`parent_dept_id`) REFERENCES `personnel_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_department: ~0 rows (approximately)
INSERT INTO `personnel_department` (`id`, `dept_code`, `dept_name`, `is_default`, `parent_dept_id`, `dept_manager_id`, `company_id`) VALUES
	(1, '1', 'Department', 1, NULL, NULL, 1);

-- Dumping structure for table rmci.bio.personnel_employee
CREATE TABLE IF NOT EXISTS `personnel_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `nickname` varchar(25) DEFAULT NULL,
  `passport` varchar(30) DEFAULT NULL,
  `driver_license_automobile` varchar(30) DEFAULT NULL,
  `driver_license_motorcycle` varchar(30) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `self_password` varchar(128) DEFAULT NULL,
  `device_password` varchar(20) DEFAULT NULL,
  `dev_privilege` int DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `acc_group` varchar(5) DEFAULT NULL,
  `acc_timezone` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `office_tel` varchar(20) DEFAULT NULL,
  `contact_tel` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `national` varchar(50) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `enroll_sn` varchar(20) DEFAULT NULL,
  `ssn` varchar(20) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `verify_mode` int DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `emp_type` smallint DEFAULT NULL,
  `enable_payroll` tinyint(1) NOT NULL,
  `app_status` smallint DEFAULT NULL,
  `app_role` smallint DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `session_key` varchar(32) DEFAULT NULL,
  `login_ip` varchar(32) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `leave_group` int DEFAULT NULL,
  `emp_code_digit` bigint DEFAULT NULL,
  `superior_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_employee_company_id_emp_code_81daa575_uniq` (`company_id`,`emp_code`),
  KEY `personnel_employee_department_id_068bbd08` (`department_id`),
  KEY `personnel_employee_position_id_c9321343` (`position_id`),
  KEY `personnel_employee_superior_id_ad6e1c47_fk_personnel_employee_id` (`superior_id`),
  KEY `personnel_employee_company_id_95b3fd72` (`company_id`),
  CONSTRAINT `personnel_employee_company_id_95b3fd72_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  CONSTRAINT `personnel_employee_department_id_068bbd08_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  CONSTRAINT `personnel_employee_position_id_c9321343_fk_personnel_position_id` FOREIGN KEY (`position_id`) REFERENCES `personnel_position` (`id`),
  CONSTRAINT `personnel_employee_superior_id_ad6e1c47_fk_personnel_employee_id` FOREIGN KEY (`superior_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employeecalendar
CREATE TABLE IF NOT EXISTS `personnel_employeecalendar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `calendar` varchar(100) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_employeecalendar_employee_id_calendar_10f7278d_uniq` (`employee_id`,`calendar`),
  CONSTRAINT `personnel_employeeca_employee_id_165e0779_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employeecalendar: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employeecertification
CREATE TABLE IF NOT EXISTS `personnel_employeecertification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expire_on` date DEFAULT NULL,
  `email_alert` tinyint(1) NOT NULL,
  `before` int DEFAULT NULL,
  `certification_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `certification_code` varchar(20) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_employeecertif_employee_id_certificatio_7bcf4c7d_uniq` (`employee_id`,`certification_id`),
  KEY `personnel_employeece_certification_id_faabed40_fk_personnel` (`certification_id`),
  CONSTRAINT `personnel_employeece_certification_id_faabed40_fk_personnel` FOREIGN KEY (`certification_id`) REFERENCES `personnel_certification` (`id`),
  CONSTRAINT `personnel_employeece_employee_id_b7bd3867_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employeecertification: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employeecustomattribute
CREATE TABLE IF NOT EXISTS `personnel_employeecustomattribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(50) NOT NULL,
  `attr_type` smallint NOT NULL,
  `attr_value` varchar(200) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_name` (`attr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employeecustomattribute: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employeeextrainfo
CREATE TABLE IF NOT EXISTS `personnel_employeeextrainfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` longtext NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `personnel_employeeex_employee_id_41e2b04d_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employeeextrainfo: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employeeprofile
CREATE TABLE IF NOT EXISTS `personnel_employeeprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `column_order` longtext NOT NULL,
  `preferences` longtext NOT NULL,
  `pwd_update_time` datetime(6) DEFAULT NULL,
  `emp_id` int NOT NULL,
  `disabled_fields` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_id` (`emp_id`),
  CONSTRAINT `personnel_employeepr_emp_id_3a69c313_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employeeprofile: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employee_area
CREATE TABLE IF NOT EXISTS `personnel_employee_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_employee_area_employee_id_area_id_00b3d777_uniq` (`employee_id`,`area_id`),
  KEY `personnel_employee_area_area_id_64c21925_fk_personnel_area_id` (`area_id`),
  CONSTRAINT `personnel_employee_a_employee_id_8e5cec21_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `personnel_employee_area_area_id_64c21925_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employee_area: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employee_flow_role
CREATE TABLE IF NOT EXISTS `personnel_employee_flow_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `workflowrole_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_employee_flow__employee_id_workflowrole_46b0e5e0_uniq` (`employee_id`,`workflowrole_id`),
  KEY `personnel_employee_f_workflowrole_id_4704db32_fk_workflow_` (`workflowrole_id`),
  CONSTRAINT `personnel_employee_f_employee_id_c27f8a56_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `personnel_employee_f_workflowrole_id_4704db32_fk_workflow_` FOREIGN KEY (`workflowrole_id`) REFERENCES `workflow_workflowrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employee_flow_role: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_employment
CREATE TABLE IF NOT EXISTS `personnel_employment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employment_type` smallint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active_time` datetime(6) DEFAULT NULL,
  `inactive_time` datetime(6) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `personnel_employment_employee_id_f797c7d9_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_employment: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.personnel_position
CREATE TABLE IF NOT EXISTS `personnel_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position_code` varchar(50) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `parent_position_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personnel_position_company_id_position_code_4708726e_uniq` (`company_id`,`position_code`),
  KEY `personnel_position_parent_position_id_a496a36b_fk_personnel` (`parent_position_id`),
  KEY `personnel_position_company_id_f06c5d2a` (`company_id`),
  CONSTRAINT `personnel_position_company_id_f06c5d2a_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  CONSTRAINT `personnel_position_parent_position_id_a496a36b_fk_personnel` FOREIGN KEY (`parent_position_id`) REFERENCES `personnel_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_position: ~0 rows (approximately)
INSERT INTO `personnel_position` (`id`, `position_code`, `position_name`, `is_default`, `parent_position_id`, `company_id`) VALUES
	(1, '1', 'Position', 1, NULL, 1);

-- Dumping structure for table rmci.bio.personnel_resign
CREATE TABLE IF NOT EXISTS `personnel_resign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resign_date` date NOT NULL,
  `resign_type` int DEFAULT NULL,
  `disableatt` tinyint(1) NOT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `personnel_resign_employee_id_dd9b7e08_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.personnel_resign: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.rest_framework_tracking_apirequestlog
CREATE TABLE IF NOT EXISTS `rest_framework_tracking_apirequestlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `requested_at` datetime(6) NOT NULL,
  `response_ms` int unsigned NOT NULL,
  `path` varchar(200) NOT NULL,
  `remote_addr` char(39) NOT NULL,
  `host` varchar(200) NOT NULL,
  `method` varchar(10) NOT NULL,
  `query_params` longtext,
  `data` longtext,
  `response` longtext,
  `status_code` int unsigned DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `view` varchar(200) DEFAULT NULL,
  `view_method` varchar(200) DEFAULT NULL,
  `errors` longtext,
  `username_persistent` varchar(200),
  PRIMARY KEY (`id`),
  KEY `rest_framework_tracking_apirequestlog_requested_at_b6f1c2f2` (`requested_at`),
  KEY `rest_framework_tracking_apirequestlog_path_fe81f91b` (`path`),
  KEY `rest_framework_tracking_apirequestlog_view_5bd1e407` (`view`),
  KEY `rest_framework_tracking_apirequestlog_view_method_dd790881` (`view_method`),
  KEY `rest_framework_track_user_id_671b70b7_fk_auth_user` (`user_id`),
  KEY `rest_framework_tracking_apirequestlog_status_code_3c9e2003` (`status_code`),
  CONSTRAINT `rest_framework_track_user_id_671b70b7_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.rest_framework_tracking_apirequestlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.staff_stafftoken
CREATE TABLE IF NOT EXISTS `staff_stafftoken` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `staff_stafftoken_user_id_39c937fa_fk_personnel_employee_id` FOREIGN KEY (`user_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.staff_stafftoken: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.sync_area
CREATE TABLE IF NOT EXISTS `sync_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `area_code` varchar(30) NOT NULL,
  `area_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sync_area_area_code_area_name_200046d1_uniq` (`area_code`,`area_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.sync_area: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.sync_department
CREATE TABLE IF NOT EXISTS `sync_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sync_department_dept_code_dept_name_93923213_uniq` (`dept_code`,`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.sync_department: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.sync_employee
CREATE TABLE IF NOT EXISTS `sync_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `emp_code` varchar(20) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `dept_code` varchar(50) DEFAULT NULL,
  `dept_name` varchar(100) DEFAULT NULL,
  `job_code` varchar(50) DEFAULT NULL,
  `job_name` varchar(100) DEFAULT NULL,
  `area_code` varchar(30) DEFAULT NULL,
  `area_name` varchar(30) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `multi_area` tinyint(1) NOT NULL,
  `hire_date` date DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sync_employee_emp_code_521bf06d_uniq` (`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.sync_employee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.sync_job
CREATE TABLE IF NOT EXISTS `sync_job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `job_code` varchar(50) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sync_job_job_code_job_name_4ec5619e_uniq` (`job_code`,`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.sync_job: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_reason
CREATE TABLE IF NOT EXISTS `visitor_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visit_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_reason: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_reservation
CREATE TABLE IF NOT EXISTS `visitor_reservation` (
  `workflowinstance_ptr_id` int NOT NULL,
  `vis_first_name` varchar(25) DEFAULT NULL,
  `vis_last_name` varchar(25) DEFAULT NULL,
  `cert_no` varchar(50) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `visit_quantity` int NOT NULL,
  `visit_date` datetime(6) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `cert_type_id` int NOT NULL,
  `visit_department_id` int DEFAULT NULL,
  `visit_reason_id` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`workflowinstance_ptr_id`),
  KEY `visitor_reservation_cert_type_id_4f047f2a_fk_personnel` (`cert_type_id`),
  KEY `visitor_reservation_visit_reason_id_c9ac83ac_fk_visitor_r` (`visit_reason_id`),
  KEY `visitor_reservation_visit_department_id_2d293e10` (`visit_department_id`),
  CONSTRAINT `visitor_reservation_cert_type_id_4f047f2a_fk_personnel` FOREIGN KEY (`cert_type_id`) REFERENCES `personnel_certification` (`id`),
  CONSTRAINT `visitor_reservation_visit_department_id_2d293e10_fk_personnel` FOREIGN KEY (`visit_department_id`) REFERENCES `personnel_department` (`id`),
  CONSTRAINT `visitor_reservation_visit_reason_id_c9ac83ac_fk_visitor_r` FOREIGN KEY (`visit_reason_id`) REFERENCES `visitor_reason` (`id`),
  CONSTRAINT `visitor_reservation_workflowinstance_ptr_3787bcd6_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_reservation: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitor
CREATE TABLE IF NOT EXISTS `visitor_visitor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visitor_code` varchar(20) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `cert_no` varchar(50) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `ssn` varchar(20) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `visit_quantity` int NOT NULL,
  `entry_carrying_goods` varchar(200) DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `exit_time` datetime(6) DEFAULT NULL,
  `exit_carrying_goods` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `cert_type_id` int NOT NULL,
  `visit_department_id` int DEFAULT NULL,
  `visit_reason_id` int DEFAULT NULL,
  `visited_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_code` (`visitor_code`),
  KEY `visitor_visitor_cert_type_id_f62ea604_fk_personnel` (`cert_type_id`),
  KEY `visitor_visitor_visit_reason_id_4b9a2d23_fk_visitor_reason_id` (`visit_reason_id`),
  KEY `visitor_visitor_visit_department_id_f7dbdcb4` (`visit_department_id`),
  KEY `visitor_visitor_visited_id_8043a7ea` (`visited_id`),
  CONSTRAINT `visitor_visitor_cert_type_id_f62ea604_fk_personnel` FOREIGN KEY (`cert_type_id`) REFERENCES `personnel_certification` (`id`),
  CONSTRAINT `visitor_visitor_visit_department_id_f7dbdcb4_fk_personnel` FOREIGN KEY (`visit_department_id`) REFERENCES `personnel_department` (`id`),
  CONSTRAINT `visitor_visitor_visit_reason_id_4b9a2d23_fk_visitor_reason_id` FOREIGN KEY (`visit_reason_id`) REFERENCES `visitor_reason` (`id`),
  CONSTRAINT `visitor_visitor_visited_id_8043a7ea_fk_personnel_employee_id` FOREIGN KEY (`visited_id`) REFERENCES `personnel_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitor: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitorbiodata
CREATE TABLE IF NOT EXISTS `visitor_visitorbiodata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `bio_tmp` longtext NOT NULL,
  `bio_no` int DEFAULT NULL,
  `bio_index` int DEFAULT NULL,
  `bio_type` int NOT NULL,
  `major_ver` varchar(30) NOT NULL,
  `minor_ver` varchar(30) DEFAULT NULL,
  `bio_format` int DEFAULT NULL,
  `valid` int NOT NULL,
  `duress` int NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `visitor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_visitorbiodata_visitor_id_bio_no_bio_in_e5d598fb_uniq` (`visitor_id`,`bio_no`,`bio_index`,`bio_type`,`bio_format`,`major_ver`),
  CONSTRAINT `visitor_visitorbiodata_visitor_id_b944ed37_fk_visitor_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitorbiodata: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitorbiophoto
CREATE TABLE IF NOT EXISTS `visitor_visitorbiophoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `enroll_sn` varchar(50) DEFAULT NULL,
  `register_photo` varchar(100) NOT NULL,
  `register_time` datetime(6) NOT NULL,
  `approval_photo` varchar(100) DEFAULT NULL,
  `approval_state` smallint NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `visitor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visitor_visitorbioph_visitor_id_9816daf7_fk_visitor_v` (`visitor_id`),
  CONSTRAINT `visitor_visitorbioph_visitor_id_9816daf7_fk_visitor_v` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitorbiophoto: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitorconfig
CREATE TABLE IF NOT EXISTS `visitor_visitorconfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `qr_code_policy` smallint NOT NULL,
  `code_prefix` varchar(5) NOT NULL,
  `code_width` int NOT NULL,
  `code_start` int NOT NULL,
  `access_limited` longtext,
  `auto_delete_data` smallint NOT NULL,
  `data_retention` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitorconfig: ~0 rows (approximately)
INSERT INTO `visitor_visitorconfig` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `qr_code_policy`, `code_prefix`, `code_width`, `code_start`, `access_limited`, `auto_delete_data`, `data_retention`) VALUES
	(1, '2024-08-16 15:04:14.507874', NULL, '2024-08-16 15:04:14.507874', NULL, 0, 1, 'V', 8, 1, NULL, 0, 9999);

-- Dumping structure for table rmci.bio.visitor_visitorlog
CREATE TABLE IF NOT EXISTS `visitor_visitorlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visitor_status` smallint DEFAULT NULL,
  `visitor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visitor_visitorlog_visitor_id_ebaafde1_fk_visitor_visitor_id` (`visitor_id`),
  CONSTRAINT `visitor_visitorlog_visitor_id_ebaafde1_fk_visitor_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitorlog: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitortransaction
CREATE TABLE IF NOT EXISTS `visitor_visitortransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visitor_code` varchar(50) NOT NULL,
  `area` varchar(30) NOT NULL,
  `punch_time` datetime(6) DEFAULT NULL,
  `punch_state` varchar(5) NOT NULL,
  `verify_type` int NOT NULL,
  `temperature` decimal(4,1) NOT NULL,
  `is_mask` int NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `source` smallint NOT NULL,
  `terminal_sn` varchar(50) DEFAULT NULL,
  `terminal_alias` varchar(50) DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `visitor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_visitortransaction_visitor_code_punch_time_2b871513_uniq` (`visitor_code`,`punch_time`),
  KEY `visitor_visitortrans_terminal_id_7527ef69_fk_iclock_te` (`terminal_id`),
  KEY `visitor_visitortrans_visitor_id_0ee95624_fk_visitor_v` (`visitor_id`),
  CONSTRAINT `visitor_visitortrans_terminal_id_7527ef69_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`),
  CONSTRAINT `visitor_visitortrans_visitor_id_0ee95624_fk_visitor_v` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitortransaction: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitor_acc_groups
CREATE TABLE IF NOT EXISTS `visitor_visitor_acc_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visitor_id` int NOT NULL,
  `accgroups_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_visitor_acc_groups_visitor_id_accgroups_id_bb522609_uniq` (`visitor_id`,`accgroups_id`),
  KEY `visitor_visitor_acc__accgroups_id_b1487149_fk_acc_accgr` (`accgroups_id`),
  CONSTRAINT `visitor_visitor_acc__accgroups_id_b1487149_fk_acc_accgr` FOREIGN KEY (`accgroups_id`) REFERENCES `acc_accgroups` (`id`),
  CONSTRAINT `visitor_visitor_acc__visitor_id_8ce09562_fk_visitor_v` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitor_acc_groups: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.visitor_visitor_area
CREATE TABLE IF NOT EXISTS `visitor_visitor_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visitor_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_visitor_area_visitor_id_area_id_27d158cc_uniq` (`visitor_id`,`area_id`),
  KEY `visitor_visitor_area_area_id_b402c047_fk_personnel_area_id` (`area_id`),
  CONSTRAINT `visitor_visitor_area_area_id_b402c047_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  CONSTRAINT `visitor_visitor_area_visitor_id_98d7ed05_fk_visitor_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.visitor_visitor_area: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_nodeinstance
CREATE TABLE IF NOT EXISTS `workflow_nodeinstance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `node_name` varchar(30) NOT NULL,
  `order_id` int NOT NULL,
  `approval_status` smallint NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `approval_remark` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `targeted` tinyint(1) NOT NULL,
  `approver_employee_id` int DEFAULT NULL,
  `workflow_instance_id` int DEFAULT NULL,
  `workflow_node_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_nodeinstanc_approver_employee_id_d36cd45d_fk_personnel` (`approver_employee_id`),
  KEY `workflow_nodeinstanc_workflow_instance_id_afe84fe4_fk_workflow_` (`workflow_instance_id`),
  KEY `workflow_nodeinstanc_workflow_node_id_166f36c4_fk_workflow_` (`workflow_node_id`),
  CONSTRAINT `workflow_nodeinstanc_approver_employee_id_d36cd45d_fk_personnel` FOREIGN KEY (`approver_employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `workflow_nodeinstanc_workflow_instance_id_afe84fe4_fk_workflow_` FOREIGN KEY (`workflow_instance_id`) REFERENCES `workflow_workflowinstance` (`id`),
  CONSTRAINT `workflow_nodeinstanc_workflow_node_id_166f36c4_fk_workflow_` FOREIGN KEY (`workflow_node_id`) REFERENCES `workflow_workflownode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_nodeinstance: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflowengine
CREATE TABLE IF NOT EXISTS `workflow_workflowengine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workflow_code` varchar(50) NOT NULL,
  `workflow_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `workflow_type` smallint NOT NULL,
  `applicant_position_id` int DEFAULT NULL,
  `content_type_id` int DEFAULT NULL,
  `departments_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_code` (`workflow_code`),
  KEY `workflow_workfloweng_applicant_position_i_8a65e03a_fk_personnel` (`applicant_position_id`),
  KEY `workflow_workfloweng_content_type_id_f7345c20_fk_django_co` (`content_type_id`),
  KEY `workflow_workflowengine_departments_id_0f06d4c7` (`departments_id`),
  CONSTRAINT `workflow_workfloweng_applicant_position_i_8a65e03a_fk_personnel` FOREIGN KEY (`applicant_position_id`) REFERENCES `personnel_position` (`id`),
  CONSTRAINT `workflow_workfloweng_content_type_id_f7345c20_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `workflow_workfloweng_departments_id_0f06d4c7_fk_personnel` FOREIGN KEY (`departments_id`) REFERENCES `personnel_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflowengine: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflowengine_employee
CREATE TABLE IF NOT EXISTS `workflow_workflowengine_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workflowengine_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_workflowengine__workflowengine_id_employ_8128deb2_uniq` (`workflowengine_id`,`employee_id`),
  KEY `workflow_workfloweng_employee_id_803a409e_fk_personnel` (`employee_id`),
  CONSTRAINT `workflow_workfloweng_employee_id_803a409e_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `workflow_workfloweng_workflowengine_id_6ebcc5f2_fk_workflow_` FOREIGN KEY (`workflowengine_id`) REFERENCES `workflow_workflowengine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflowengine_employee: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflowinstance
CREATE TABLE IF NOT EXISTS `workflow_workflowinstance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approval_time` datetime(6) DEFAULT NULL,
  `approval_status` smallint NOT NULL,
  `approval_remark` longtext,
  `approver` varchar(30) DEFAULT NULL,
  `approver_instance` longtext,
  `employee_id` int NOT NULL,
  `workflow_engine_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_workflowinstance_employee_id_c7cff08e` (`employee_id`),
  KEY `workflow_workflowins_workflow_engine_id_1e6ac40f_fk_workflow_` (`workflow_engine_id`),
  CONSTRAINT `workflow_workflowins_employee_id_c7cff08e_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  CONSTRAINT `workflow_workflowins_workflow_engine_id_1e6ac40f_fk_workflow_` FOREIGN KEY (`workflow_engine_id`) REFERENCES `workflow_workflowengine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflowinstance: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflownode
CREATE TABLE IF NOT EXISTS `workflow_workflownode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `node_name` varchar(30) NOT NULL,
  `order_id` int NOT NULL,
  `approver_by_overall` tinyint(1) NOT NULL,
  `notify_by_overall` tinyint(1) NOT NULL,
  `workflow_engine_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_workflownod_workflow_engine_id_04c8f470_fk_workflow_` (`workflow_engine_id`),
  CONSTRAINT `workflow_workflownod_workflow_engine_id_04c8f470_fk_workflow_` FOREIGN KEY (`workflow_engine_id`) REFERENCES `workflow_workflowengine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflownode: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflownode_approver
CREATE TABLE IF NOT EXISTS `workflow_workflownode_approver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workflownode_id` int NOT NULL,
  `workflowrole_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_workflownode_ap_workflownode_id_workflow_7543ba37_uniq` (`workflownode_id`,`workflowrole_id`),
  KEY `workflow_workflownod_workflowrole_id_c8e00d42_fk_workflow_` (`workflowrole_id`),
  CONSTRAINT `workflow_workflownod_workflownode_id_d814c941_fk_workflow_` FOREIGN KEY (`workflownode_id`) REFERENCES `workflow_workflownode` (`id`),
  CONSTRAINT `workflow_workflownod_workflowrole_id_c8e00d42_fk_workflow_` FOREIGN KEY (`workflowrole_id`) REFERENCES `workflow_workflowrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflownode_approver: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflownode_notifier
CREATE TABLE IF NOT EXISTS `workflow_workflownode_notifier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workflownode_id` int NOT NULL,
  `workflowrole_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_workflownode_no_workflownode_id_workflow_cac02b37_uniq` (`workflownode_id`,`workflowrole_id`),
  KEY `workflow_workflownod_workflowrole_id_73de7fc2_fk_workflow_` (`workflowrole_id`),
  CONSTRAINT `workflow_workflownod_workflownode_id_57298016_fk_workflow_` FOREIGN KEY (`workflownode_id`) REFERENCES `workflow_workflownode` (`id`),
  CONSTRAINT `workflow_workflownod_workflowrole_id_73de7fc2_fk_workflow_` FOREIGN KEY (`workflowrole_id`) REFERENCES `workflow_workflowrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflownode_notifier: ~0 rows (approximately)

-- Dumping structure for table rmci.bio.workflow_workflowrole
CREATE TABLE IF NOT EXISTS `workflow_workflowrole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(30) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_code` (`role_code`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci.bio.workflow_workflowrole: ~0 rows (approximately)


-- Dumping database structure for rmci_pes
CREATE DATABASE IF NOT EXISTS `rmci_pes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rmci_pes`;

-- Dumping structure for table rmci_pes.pes_user
CREATE TABLE IF NOT EXISTS `pes_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` longtext,
  `role` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rmci_pes.pes_user: ~1 rows (approximately)
INSERT INTO `pes_user` (`id`, `code`, `username`, `password`, `role`, `timestamp`) VALUES
	(1, 'BvPJmNcCAbqBLovh6', 'jeco', '$2b$10$nHo3z42gD9SkY.pM2hVjFO4cRO4WojxcsDvL/AOOxhBTCttxGa0Hm', 1, '2023-12-14 10:57:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
