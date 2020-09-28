-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 08 日 08:54
-- 伺服器版本： 10.4.13-MariaDB
-- PHP 版本： 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `chairproject`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `sid` int(11) NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`sid`, `account`, `password`, `nickname`) VALUES
(1, 'yuchuan', '8cb2237d0679ca88db6464eac60da96345513964', 'yu');

-- --------------------------------------------------------

--
-- 資料表結構 `w_chair_body`
--

CREATE TABLE `w_chair_body` (
  `sid` int(225) NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `w_chair_body`
--

INSERT INTO `w_chair_body` (`sid`, `name`) VALUES
(1, '木頭'),
(2, '金屬'),
(3, '塑膠');

-- --------------------------------------------------------

--
-- 資料表結構 `w_chair_color`
--

CREATE TABLE `w_chair_color` (
  `sid` int(11) NOT NULL,
  `name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `w_chair_color`
--

INSERT INTO `w_chair_color` (`sid`, `name`) VALUES
(1, '白'),
(2, '米'),
(3, '黃'),
(4, '橘'),
(5, '褐'),
(6, '黑'),
(7, '灰'),
(8, '黑'),
(9, '綠'),
(10, '紅'),
(11, '藍'),
(12, '粉色'),
(13, '圖案');

-- --------------------------------------------------------

--
-- 資料表結構 `w_chair_designer`
--

CREATE TABLE `w_chair_designer` (
  `sid` int(11) NOT NULL,
  `name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `w_chair_designer`
--

INSERT INTO `w_chair_designer` (`sid`, `name`) VALUES
(1, 'overgaard'),
(2, 'thonet'),
(5, 'carl hansen & Son'),
(6, 'TON'),
(7, 'MUUTO'),
(8, 'BRDR KRÜGER'),
(9, 'GUBI'),
(10, 'PIERRE FREY'),
(11, 'Modern Link'),
(12, 'DETJER');

-- --------------------------------------------------------

--
-- 資料表結構 `w_chair_seat`
--

CREATE TABLE `w_chair_seat` (
  `sid` int(11) NOT NULL,
  `name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `w_chair_seat`
--

INSERT INTO `w_chair_seat` (`sid`, `name`) VALUES
(1, '皮革'),
(2, '布料'),
(3, '木頭'),
(4, '藤編'),
(5, '塑膠');

-- --------------------------------------------------------

--
-- 資料表結構 `w_product_categories`
--

CREATE TABLE `w_product_categories` (
  `sid` int(11) NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `w_product_categories`
--

INSERT INTO `w_product_categories` (`sid`, `name`) VALUES
(1, 'chair'),
(2, 'armchair'),
(3, 'dining'),
(4, 'lounge'),
(5, 'stool');

-- --------------------------------------------------------

--
-- 資料表結構 `w_product_mainList`
--

CREATE TABLE `w_product_mainList` (
  `sid` int(11) NOT NULL,
  `product_no` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `chair_body` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `chair_seat` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `designer` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `hashtag` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `on_shelf_time` date NOT NULL,
  `off_shelf_time` date NOT NULL,
  `last_edit_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `w_product_mainList`
--

INSERT INTO `w_product_mainList` (`sid`, `product_no`, `product_name`, `description`, `category`, `color`, `chair_body`, `chair_seat`, `designer`, `photo`, `price`, `hashtag`, `on_shelf_time`, `off_shelf_time`, `last_edit_time`) VALUES
(151, 'OD210', 'Circle Dining Chair', ' From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '灰', '木頭', '布料', 'overgaard', '65258f22f93cf7e40e322d26a999dbfd.png', 5000, '#丹麥椅', '2020-09-07', '2020-09-24', '2020-09-07'),
(152, 'OD11-43', 'WIRE DINING CHAIR', ' From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '褐', '金屬', '皮革', 'overgaard', '22c2a33c3d3b33f5b142bac1ef25aa52.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-04', '2020-09-07'),
(154, 'OD12', 'Wire Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '金屬', '皮革', 'overgaard', '84c6079da0154ef9c767b37955b7aa37.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-17', '2020-09-08'),
(155, 'OD13', 'Wire Lounge Sofa', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '金屬', '皮革', 'overgaard', '5f9863c9b0622ceaea951f1cc3c74188.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-30', '2020-09-07'),
(156, 'OD14', 'Wire Bar Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '褐', '金屬', '皮革', 'overgaard', 'd5f5fd7656c5a58d8b65ebde9e199cf0.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-11', '2020-09-08'),
(157, 'OD15', 'Wire Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '褐', '金屬', '皮革', 'overgaard', 'b6f1d242b279ed9ee4c1755fb894e014.png', 5000, '#丹麥椅', '2020-09-22', '2020-09-24', '2020-09-07'),
(158, '214K', '214K', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '木頭', 'thonet', 'dd1e209161c29143e1cc050da4777810.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-11', '2020-09-07'),
(159, '204RH', '204RH', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '白', '木頭', '藤編', 'thonet', 'a98821338b6fd18a4051cfd130bf3e43.png', 5000, '#丹麥椅', '2020-09-12', '2020-09-22', '2020-09-07'),
(160, 'S32PV', 'S32PV', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '米', '金屬', '藤編', 'thonet', '0c3bef39c7d0f6435b0f24de52996810.png', 5000, '#丹麥椅', '2020-09-23', '2020-09-11', '2020-09-08'),
(161, 'CH24', 'WISHBONE', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '綠', '木頭', '藤編', 'carl hansen & Son', '444d677c266554cf556fcf44dd59e7c8.png', 5000, '#丹麥椅', '2020-09-01', '2020-09-09', '2020-09-07'),
(162, 'CH23', 'CH23', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '藤編', 'carl hansen & Son', '0735e6590b110a8794263ce6fded99d6.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-19', '2020-09-07'),
(163, 'CH88P', 'CH88P', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '褐', '金屬', '皮革', 'carl hansen & Son', '87f70e8f0779313c5d432dc32140ab8e.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-22', '2020-09-07'),
(164, 'CH26', 'CH26', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '米', '木頭', '藤編', 'carl hansen & Son', 'bbf36c9cc602962f82a746ce7b9c818c.png', 5000, '#丹麥椅', '2020-09-22', '2020-09-24', '2020-09-07'),
(165, 'CH33T', 'CH33T', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '褐', '木頭', '木頭', 'carl hansen & Son', '534a4101b43574b906139773799af5c1.png', 5000, '#丹麥椅', '2020-09-23', '2020-09-09', '2020-09-07'),
(166, 'CH29P', 'CH29P', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '米', '木頭', '木頭', 'carl hansen & Son', '62be3ce0f5b29cb2c31b1e32116fd765.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-17', '2020-09-07'),
(167, 'CH56', 'CH56', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '橘', '木頭', '皮革', 'carl hansen & Son', '3faf9c14b2251a12f505571f99d27546.png', 5000, '#丹麥椅', '2020-09-22', '2020-09-17', '2020-09-07'),
(168, 'KK47510', 'KK47510', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '紅', '木頭', '皮革', 'carl hansen & Son', '318fba92bb38e5e9f3e673247e708d07.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-24', '2020-09-07'),
(169, 'E005', 'E005', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'carl hansen & Son', '7a3414940dd7ffe722981daf5c99e0b0.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-21', '2020-09-07'),
(170, 'E005', 'E005', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '褐', '木頭', '布料', 'carl hansen & Son', '8a8b3bbe5f93315c27cfa734636bbf10.png', 5000, '#丹麥椅', '2020-09-12', '2020-09-09', '2020-09-07'),
(171, 'CS1', 'COVER SIDE CHAIR', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '白', '木頭', '木頭', 'MUUTO', '6145881b45e3b4c067298ddfb3525e2d.png', 5000, '#丹麥椅', '2020-10-07', '2020-09-10', '2020-09-07'),
(172, 'MU02', 'COVER ARM CHAIR', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '綠', '木頭', '木頭', 'MUUTO', '379ab61b927aac1c58f3f0c07f154ab6.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-24', '2020-09-07'),
(173, 'MU03', 'Fiber Armchair ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黑', '木頭', '塑膠', 'MUUTO', '95ff553c7670ee5b633bcc9fc81d84a4.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-11', '2020-09-07'),
(174, 'MU04', 'Fiber Armchair ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '金屬', '皮革', 'MUUTO', '0c805a22e881ec41eb38974c74456edf.png', 5000, '#丹麥椅', '2020-09-09', '2020-09-10', '2020-09-07'),
(175, 'MU05', 'Fiber Bar Stool ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '褐', '金屬', '皮革', 'MUUTO', '86e2678804e9ad80850b5726ab77455d.png', 5000, '#丹麥椅', '2020-09-24', '2020-09-10', '2020-09-07'),
(176, 'MU06', 'Oslo Lounge chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '黑', '金屬', '布料', 'MUUTO', 'dc5f89bea87a096ee7d94de61db63004.png', 5000, '#丹麥椅', '2020-09-12', '2020-09-18', '2020-09-07'),
(177, 'MU07', 'Oslo Side Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '灰', '金屬', '布料', 'MUUTO', '2b6d2ad2731653c2258359f86e074c6d.png', 5000, '#丹麥椅', '2020-09-12', '2020-09-10', '2020-09-07'),
(178, 'MU08', 'Loft Bar Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '米', '木頭', '木頭', 'MUUTO', 'a5aa1907ab88caf153931199b27e8257.png', 5000, '#丹麥椅', '2020-09-19', '2020-09-08', '2020-09-07'),
(179, 'MU09', 'Fiber Lounge Chair ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '木頭', '皮革', 'MUUTO', '9a3b0ac07106eef30817c21df6fc95ea.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-23', '2020-09-07'),
(180, 'BK01', 'Configure your Arkade Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '灰', '木頭', '布料', 'BRDR KRÜGER', 'a315824b304cc5fef10d4a88f19f1431.png', 5000, '#丹麥椅', '2020-09-09', '2020-09-23', '2020-09-07'),
(181, 'KB02', 'ARV Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '藤編', 'BRDR KRÜGER', '3586f7780ec7b61007e4465eed287e5e.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-05', '2020-09-07'),
(182, 'KB04', ' Pauline Comfort', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '橘', '木頭', '皮革', 'BRDR KRÜGER', 'ea1089de7ce71f20d1eae07f5c214a21.png', 5000, '#丹麥椅', '2020-09-09', '2020-09-18', '2020-09-07'),
(184, 'BK04', 'Jari Dining Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '米', '木頭', '皮革', 'BRDR KRÜGER', '1589668967a52ead5cda9e984391ced5.png', 5000, '#丹麥椅', '2020-09-15', '2020-09-17', '2020-09-07'),
(185, 'BK06', 'F Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '藤編', 'BRDR KRÜGER', '947bc2d96ad95f85e8ab6352ee6bd4c4.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-11', '2020-09-07'),
(186, 'BK07', 'Pauline Bar Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '黑', '木頭', '皮革', 'BRDR KRÜGER', 'b37e0d803fc60efc72dad38af5d43e70.png', 5000, '#丹麥椅', '2020-09-09', '2020-09-23', '2020-09-07'),
(187, 'BK08', 'Ferdinand Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '木頭', '皮革', 'BRDR KRÜGER', '6450568cd12c67172f8b011b58cd5d0f.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-10', '2020-09-07'),
(188, 'BK09', 'Theodor Dining Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '黑', '木頭', '布料', 'BRDR KRÜGER', '87ea8f43fe684365382a63d0e6de1217.png', 5000, '#丹麥椅', '2020-09-22', '2020-09-14', '2020-09-07'),
(189, 'GU01', 'C-Chair Dining Chair - French Cane', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '褐', '木頭', '藤編', 'GUBI', 'e8ab934ddcf443f5778e90bd1f28448c.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-10', '2020-09-07'),
(190, 'GU02', 'Bat Chair - Capsule Collection', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '橘', '金屬', '布料', 'GUBI', 'a7aa3369ca69711f642a2cce116c68e3.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-09', '2020-09-07'),
(191, 'GU03', 'Beetle Dining Chair - Un-Upholstered - Wood Base', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '綠', '塑膠', '塑膠', 'GUBI', '4cfb435d4c145e3fa790ccc0e6223f36.png', 5000, '#丹麥椅', '2020-09-09', '2020-09-10', '2020-09-07'),
(192, 'GU04', 'Masculo Dining Chair - Fully Upholstered - Wood base', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '褐', '木頭', '布料', 'GUBI', '072c865b5cdeb1f9ed4b268eccbf3ef8.png', 5000, '#丹麥椅', '2020-09-05', '2020-09-10', '2020-09-07'),
(193, 'GU05', 'Beetle Dining Chair - Fully Upholstered - Wood base', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '橘', '塑膠', '布料', 'GUBI', '5efdbbc74ee4401501d3d193bbd956aa.png', 5000, '#丹麥椅', '2020-09-15', '2020-09-17', '2020-09-07'),
(194, 'GU06', 'Nagasaki Dining Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '黃', '塑膠', '布料', 'GUBI', '937abe053750d5b164005a336d5bf9bf.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-24', '2020-09-07'),
(195, 'GU10', 'Bat Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '藍', '木頭', '布料', 'GUBI', '0a0f7019232dd6e527aa1df0d271d47e.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-12', '2020-09-07'),
(196, 'GU12', 'Bat Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '粉色', '木頭', '布料', 'GUBI', '283559c6c8b44e46138c69adad68266f.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-16', '2020-09-07'),
(197, 'GU13', 'Beetle Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '圖案', '金屬', '布料', 'GUBI', '3ab37889a59cb913f1bb2a1d44797233.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-02', '2020-09-07'),
(198, 'GU14', 'Masculo Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '綠', '金屬', '布料', 'GUBI', '5add9f781675693751c120d20dc1a001.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-22', '2020-09-07'),
(199, 'GU14', 'Masculo Lounge Chair ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '灰', '木頭', '布料', 'GUBI', '03f2fe4f39c7dfc1fca6497b7ddad826.png', 5000, '#丹麥椅', '2020-09-03', '2020-09-30', '2020-09-07'),
(200, 'GU15', 'Coco Lounge Chair With Armrests', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '金屬', '布料', 'GUBI', '412205c1633683360e6f28ba4428f101.png', 5000, '#丹麥椅', '2020-09-24', '2020-09-09', '2020-09-07'),
(201, 'GU16', 'Sejour Lounge Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '白', '木頭', '布料', 'GUBI', 'c3871a8a04bd2eba0d2c5efd141e41fd.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-03', '2020-09-07'),
(202, 'GU16', 'Beetle Counter Chair ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '褐', '金屬', '塑膠', 'GUBI', '38e102c78a3942784e77723a64293ec4.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-05', '2020-09-07'),
(203, 'GU17', '2D Bar Stool ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '褐', '木頭', '木頭', 'GUBI', '683fc4eef96680d50d49c8627be0e10a.png', 5000, '#丹麥椅', '2020-09-25', '2020-09-09', '2020-09-07'),
(204, 'GU18', '3D Bar Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '黑', '金屬', '木頭', 'GUBI', '06a2985bcf46757291452cabfcda7d2f.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-23', '2020-09-07'),
(205, 'GU18', 'Coco Bar Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'stool', '紅', '金屬', '布料', 'GUBI', 'bff7f63bf91dfc233420bb86e63aab08.png', 5000, '#丹麥椅', '2020-09-24', '2020-09-17', '2020-09-07'),
(206, 'GU19', 'Beetle Meeting Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '綠', '塑膠', '布料', 'GUBI', '336156d0b56817244a4b205aea116024.png', 5000, '#丹麥椅', '2020-09-30', '2020-09-26', '2020-09-07'),
(207, 'GU20', 'Bat Meeting Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '灰', '塑膠', '布料', 'GUBI', 'd00ff8a89ea7a7cc326f82961ac677a1.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-12', '2020-09-07'),
(208, 'GU21', 'Beetle Meeting Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '褐', '金屬', '皮革', 'GUBI', 'eed543e5cd326743c15324bf859518e6.png', 5000, '#丹麥椅', '2020-09-04', '2020-09-10', '2020-09-07'),
(209, 'PF01', 'FROXACH048 Roxane', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '紅', '木頭', '布料', 'PIERRE FREY', '0cbb34c0e059ae344aecd360c5b791e8.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-12', '2020-09-07'),
(210, 'PF02', 'FSIMOCH047 Simon', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '綠', '木頭', '布料', 'PIERRE FREY', 'aa19a7588ebb60e8b456276e178c18a2.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-11', '2020-09-07'),
(211, 'PR03', 'FMILECH048 Milena', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '圖案', '木頭', '布料', 'PIERRE FREY', '4ddd7bf19c416ca8c2c7f6969d406a36.png', 5000, '#丹麥椅', '2020-09-23', '2020-10-01', '2020-09-07'),
(212, 'PF04', 'FHELOCH049 Héloïse', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '圖案', '木頭', '布料', 'PIERRE FREY', 'd8f825d0d7a324b265485421064aff53.png', 5000, '#丹麥椅', '2020-10-01', '2020-09-10', '2020-09-07'),
(213, 'PF05', 'FARSECH052 Arsène 942', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.\r\n', 'chair', '紅', '木頭', '布料', 'PIERRE FREY', 'b554d80fe6288a81eeaa4ab85b581d88.png', 5000, '#丹麥椅', '2020-09-26', '2020-10-01', '2020-09-07'),
(214, 'PF05', 'FSEOUCF062 Séoul 536', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '白', '塑膠', '布料', 'PIERRE FREY', '079e1b4cf1e8409f005a819e8a2ef148.png', 5000, '#丹麥椅', '2020-09-29', '2020-09-19', '2020-09-07'),
(215, 'PF06', 'FFREDFA071 Fred 885', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '綠', '塑膠', '布料', 'PIERRE FREY', '8c416f00bf462f6371d0a2e38495dff4.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-09', '2020-09-07'),
(216, 'PF07', 'FHARDFA078 Hardy 539', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '木頭', '布料', 'PIERRE FREY', '961c4d92c30497ed7dd450bcfb9b5aa2.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-18', '2020-09-07'),
(217, 'PF07', 'FEUGEFA082 Eugène 908', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '綠', '木頭', '布料', 'PIERRE FREY', '0a2a14974180309cee53a6b229e75e25.png', 5000, '#丹麥椅', '2020-09-21', '2020-09-11', '2020-09-07'),
(218, 'PF08', 'FFAUSFA089 Faust 951', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '藍', '木頭', '布料', 'PIERRE FREY', '6a3c4a834bdc0c3985b799df6f52522a.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-04', '2020-09-07'),
(219, 'PF09', 'FAXELFA069C Axel', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '灰', '木頭', '布料', 'PIERRE FREY', 'ce473ae7e032b5bd00b04da6dbd637e9.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-03', '2020-09-07'),
(220, 'ML01', 'Ole Wanscher Round T Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '0730a420e88cfab12609e3a132c7b83f.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-25', '2020-09-07'),
(221, 'ML02', 'Ole Wanscher Low Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黑', '木頭', '皮革', 'Modern Link', 'b5e2e50e25e5a607f3d1c840fca62472.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-05', '2020-09-07'),
(222, 'ML03', 'Danish Cabinetmaker Dining Chairs', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '皮革', 'Modern Link', 'ba9ec4abdd39285562145531078031ce.png', 5000, '#丹麥椅', '2020-09-12', '2020-09-17', '2020-09-07'),
(223, 'ML04', 'Jacob Kjær Side Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '褐', '木頭', '皮革', 'Modern Link', 'b6ea0c3afbbf9dc86683b9133ee7f9de.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-14', '2020-09-07'),
(224, 'ML06', 'N.C. Christoffersen Curved Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '米', '木頭', '布料', 'Modern Link', 'bf04b8ee85d8821cfb5c661b2f56a0a7.png', 5000, '#丹麥椅', '2020-09-08', '2020-09-15', '2020-09-07'),
(225, 'ML05', 'Orla Mølgaard-Nielsen Pair of Easy Chairs', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黑', '木頭', '皮革', 'Modern Link', '5ef88358dd6cfb0ccec86f16fc302610.png', 5000, '#丹麥椅', '2020-09-23', '2020-09-16', '2020-09-07'),
(226, 'ML07', 'Gustav Bertelsen Dining Chairs', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '皮革', 'Modern Link', '71917e197cb5b228d4f77debf3e5faa3.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-04', '2020-09-07'),
(227, 'ML09', 'Danish Cabinetmaker Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', 'cef054830a0774d1ab5359f28df28f5f.png', 5000, '#丹麥椅', '2020-10-07', '2020-09-24', '2020-09-07'),
(228, 'ML10', 'Flemming Lassen Easy Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '白', '木頭', '布料', 'Modern Link', '381709389f3619832d6bf9aac2548c5e.png', 5000, '#丹麥椅', '2020-09-05', '2020-09-04', '2020-09-07'),
(229, 'ML11', 'Jacob Kjær Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '藍', '木頭', '布料', 'Modern Link', 'f80b8dffbcd0c31c918af0925be7b08d.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-09', '2020-09-07'),
(230, 'ML12', 'Frits Henningsen Study Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', 'f25031a0b3d129308a7c64e8639e0fff.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-23', '2020-09-07'),
(231, 'ML13', 'Edvard + Tove Kindt-Larsen Desk Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '綠', '木頭', '皮革', 'Modern Link', '8f0ab83e9fe255f5c14182ab2a509af8.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-04', '2020-09-07'),
(232, 'ML14', 'Hans J. Wegner Pair of Armchairs', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '灰', '木頭', '皮革', 'Modern Link', '87248c179332f110a020fcf19834e4b2.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-09', '2020-09-07'),
(233, 'ML14', 'Erik Kolling Andersen Easy Chair with Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.\r\n', 'lounge', '米', '木頭', '布料', 'Modern Link', 'fc4cbe6b91e7ec12c122ab7227d4452f.png', 5000, '#丹麥椅', '2020-09-23', '2020-09-19', '2020-09-07'),
(234, 'ML14', 'Jacob Kjær Pair of Armchairs', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', 'd483dc25dc6936be2ecbc264ef4252a6.png', 5000, '#丹麥椅', '2020-09-04', '2020-09-03', '2020-09-07'),
(235, 'ML16', 'Ole Wanscher Pair of FD109 Armchairs', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '灰', '木頭', '布料', 'Modern Link', 'eed8ea9d011c534d9407ae00edba2a51.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-11', '2020-09-07'),
(236, 'ML15', 'Frits Henningsen Wingback Chair with Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '木頭', '皮革', 'Modern Link', '3395d9f429ab3755e999e6a67a7340b9.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-18', '2020-09-07'),
(237, 'ML18', 'Torsten Johansson Folding Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '皮革', 'Modern Link', '68f435d634a93b506f841dd01a001975.png', 5000, '#丹麥椅', '2020-09-19', '2020-09-12', '2020-09-07'),
(238, 'ML20', 'Torsten Johansson Folding Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '06430353e1bea42599c22bb096ef9e9d.png', 5000, '#丹麥椅', '2020-09-19', '2020-09-19', '2020-09-07'),
(239, 'ML21', 'Frits Henningsen Curved Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', 'ee00e079cb04f163f125dd57f48a57ad.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-06', '2020-09-07'),
(240, 'ML22', 'Ole Wanscher 1945 Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黑', '木頭', '皮革', 'Modern Link', '01b9df5bcabb076adace04cbebf3fcd2.png', 5000, '#丹麥椅', '2020-09-24', '2020-09-05', '2020-09-07'),
(241, 'ML23', 'Ole Wanscher Alpaca Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '米', '木頭', '布料', 'Modern Link', '2d79c5b29886cc9e88d3598c1121c0a4.png', 5000, '#丹麥椅', '2020-09-23', '2020-09-29', '2020-09-07'),
(242, 'ML23', 'Arne Jacobsen Oxford Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黑', '金屬', '皮革', 'Modern Link', '9afbf71ec71464091083437c35bed428.png', 5000, '#丹麥椅', '2020-09-02', '2020-09-09', '2020-09-07'),
(243, 'ML24', 'Kastholm + Fabricius Executive ', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '金屬', '皮革', 'Modern Link', '62c1cfa9ae5415114f05a226045604b2.png', 5000, '#丹麥椅', '2020-09-03', '2020-09-05', '2020-09-07'),
(244, 'ML25', 'Frits Henningsen Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '93a0f854646f75b3cd30ea48c22fe1cb.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-14', '2020-09-07'),
(245, 'ML25', 'Kaare Klint \"Red Chair\"', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '白', '木頭', '皮革', 'Modern Link', '3f56dd1dd0ec4f16e0d983b545a855b1.png', 5000, '#丹麥椅', '2020-09-03', '2020-09-09', '2020-09-07'),
(246, 'ML26', 'Hans J. Wegner \"The Chair\"', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '0968c43b1bec19b2765dd61164b87552.png', 5000, '#丹麥椅', '2020-09-09', '2020-09-22', '2020-09-07'),
(247, 'ML26', 'Jacob Kjær Easy Chair with Stool', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', 'b7ab0385a2db8199469b3cdf6997bf53.png', 5000, '#丹麥椅', '2020-09-16', '2020-09-16', '2020-09-07'),
(248, 'ML27', 'Ole Wanscher Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黑', '木頭', '皮革', 'Modern Link', '828a410df8ce501af45af2589c809e98.png', 5000, '#丹麥椅', '2020-09-17', '2020-09-16', '2020-09-07'),
(249, 'ML28', 'Rud Rasmussen Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '綠', '木頭', '布料', 'Modern Link', '508d1415d38717e1c669222ca98e366a.png', 5000, '#丹麥椅', '2020-09-04', '2020-09-04', '2020-09-07'),
(250, 'ML29', 'Orla Mølgaard-Nielsen Armchair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '936dc305a7ae84f88666206003a6175d.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-09', '2020-09-07'),
(251, 'ML30', 'Ole Wanscher Niger Easy Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '31add7de7b5042194fbe008448f58016.png', 5000, '#丹麥椅', '2020-09-24', '2020-09-27', '2020-09-07'),
(252, 'ML31', 'Erik Kolling Andersen Prism Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '褐', '木頭', '皮革', 'Modern Link', 'c0888c973ffba2f8367c9d74a5336706.png', 5000, '#丹麥椅', '2020-09-12', '2020-09-11', '2020-09-07'),
(253, 'ML32', 'Erik Kolling Andersen Tall Easy Chair - SOLD', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '黃', '木頭', '布料', 'Modern Link', '1061d077b90f5d894da7d9a234c886c0.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-09', '2020-09-07'),
(254, 'ML33', 'Agner Christoffersen Easy Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'lounge', '黑', '木頭', '布料', 'Modern Link', '4bf8cfae07515a40aa167ae43d1f26cd.png', 5000, '#丹麥椅', '2020-09-04', '2020-09-16', '2020-09-07'),
(255, 'ML35', 'Edvard + Tove Kindt-Larsen Bat', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '皮革', 'Modern Link', '83d7487247fcde783daeafa9feda66d4.png', 5000, '#丹麥椅', '2020-09-19', '2020-09-16', '2020-09-07'),
(256, 'ML36', 'Kaare Klint High Back Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '褐', '木頭', '皮革', 'Modern Link', 'ab0551d0e8fc6478de6c6e9a2929087a.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-04', '2020-09-07'),
(257, 'ML37', 'Frits Henningsen Easy Chair', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '褐', '木頭', '皮革', 'Modern Link', '744c77f324fbcf5f45878a29fc9e1c64.png', 5000, '#丹麥椅', '2020-09-11', '2020-09-04', '2020-09-07'),
(258, 'DJ01', 'Easy Lounge Chair - Darkened Teak', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'armchair', '米', '木頭', '藤編', 'DETJER', '7dbc8d10986060f4998a11d2eca3e441.png', 5000, '#丹麥椅', '2020-09-18', '2020-09-11', '2020-09-07'),
(259, 'DJ02', 'Kangaroo Chair - Darkened Teak', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '米', '木頭', '藤編', 'DETJER', 'a931053d291ed99e5e5c99c83bb5ac6b.png', 5000, '#丹麥椅', '2020-09-11', '2020-10-01', '2020-09-07'),
(260, 'DJ03', 'Favourites Dining Chair -', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'dining', '米', '木頭', '藤編', 'DETJER', 'b0e2d7ea7e9705e04d989a70af63840f.png', 5000, '#丹麥椅', '2020-09-24', '2020-09-15', '2020-09-07'),
(261, 'DJ06', 'Library Chair - Charcoal Black', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'chair', '黑', '木頭', '藤編', 'DETJER', '770f4b9ab71e3b3a2c6d3cff006d2582.png', 5000, '#丹麥椅', '2020-09-10', '2020-09-11', '2020-09-07');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `account` (`account`);

--
-- 資料表索引 `w_chair_body`
--
ALTER TABLE `w_chair_body`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_chair_color`
--
ALTER TABLE `w_chair_color`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_chair_designer`
--
ALTER TABLE `w_chair_designer`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_chair_seat`
--
ALTER TABLE `w_chair_seat`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_product_categories`
--
ALTER TABLE `w_product_categories`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_product_mainList`
--
ALTER TABLE `w_product_mainList`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_chair_body`
--
ALTER TABLE `w_chair_body`
  MODIFY `sid` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_chair_color`
--
ALTER TABLE `w_chair_color`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_chair_designer`
--
ALTER TABLE `w_chair_designer`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_chair_seat`
--
ALTER TABLE `w_chair_seat`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_product_categories`
--
ALTER TABLE `w_product_categories`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_product_mainList`
--
ALTER TABLE `w_product_mainList`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
