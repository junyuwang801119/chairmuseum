-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 09 日 13:38
-- 伺服器版本： 10.4.14-MariaDB
-- PHP 版本： 7.3.21

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
-- 資料表結構 `J_cart_delivery_status`
--

CREATE TABLE `J_cart_delivery_status` (
  `sid` int(11) NOT NULL,
  `delivery_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `J_cart_delivery_status`
--

INSERT INTO `J_cart_delivery_status` (`sid`, `delivery_status`) VALUES
(1, '未發貨'),
(2, '出貨中'),
(3, '待取貨'),
(4, '已取貨');

-- --------------------------------------------------------

--
-- 資料表結構 `J_cart_order`
--

CREATE TABLE `J_cart_order` (
  `sid` int(11) NOT NULL,
  `PO_NO` varchar(255) NOT NULL,
  `member` varchar(255) NOT NULL,
  `qualify` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` int(11) NOT NULL,
  `delivery_status` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `J_cart_order`
--

INSERT INTO `J_cart_order` (`sid`, `PO_NO`, `member`, `qualify`, `order_date`, `order_status`, `delivery_status`, `point`, `total`) VALUES
(2, 'PO200903001', 'Caton', 2, '2020-09-03', 3, 4, 1900, 19000),
(3, 'PO200903002', 'Carl', 2, '2020-09-03', 1, 1, 1400, 14000),
(4, 'PO200904001', 'Jasper', 1, '2020-09-04', 3, 4, 800, 8000),
(5, 'PO200904002', 'Anna', 1, '2020-09-04', 3, 4, 1000, 18000),
(6, 'PO200904003', 'Chirstin', 2, '2020-09-04', 2, 2, 4160, 41600),
(7, 'PO200904004', 'Tina', 2, '2020-09-04', 2, 2, 2090, 20900),
(8, 'PO200905001', 'Amy', 1, '2020-09-05', 2, 2, 2190, 21900),
(9, 'PO200905002', 'Amme', 1, '2020-09-05', 2, 2, 8990, 89900);

-- --------------------------------------------------------

--
-- 資料表結構 `J_cart_order_status`
--

CREATE TABLE `J_cart_order_status` (
  `sid` int(11) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `J_cart_order_status`
--

INSERT INTO `J_cart_order_status` (`sid`, `order_status`) VALUES
(1, '未處理'),
(2, '處理中'),
(3, '結案'),
(4, '撤銷');

-- --------------------------------------------------------

--
-- 資料表結構 `J_cart_qualify`
--

CREATE TABLE `J_cart_qualify` (
  `sid` int(11) NOT NULL,
  `qualify` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `J_cart_qualify`
--

INSERT INTO `J_cart_qualify` (`sid`, `qualify`) VALUES
(1, '符合'),
(2, '不符合');

-- --------------------------------------------------------

--
-- 資料表結構 `J_detail_status`
--

CREATE TABLE `J_detail_status` (
  `sid` int(11) NOT NULL,
  `product_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `J_detail_status`
--

INSERT INTO `J_detail_status` (`sid`, `product_status`) VALUES
(1, '下訂'),
(2, '取消');

-- --------------------------------------------------------

--
-- 資料表結構 `J_order_detail`
--

CREATE TABLE `J_order_detail` (
  `sid` int(11) NOT NULL,
  `PO_NO` varchar(255) NOT NULL,
  `product_name` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `qualify` int(11) NOT NULL,
  `product_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `J_order_detail`
--

INSERT INTO `J_order_detail` (`sid`, `PO_NO`, `product_name`, `quantity`, `qualify`, `product_status`) VALUES
(1, 'PO200903001', 1, 2, 1, 1),
(2, 'PO200903001', 46, 3, 1, 1),
(3, 'PO200903001', 44, 3, 1, 2),
(4, 'PO200903001', 54, 3, 1, 1),
(5, 'PO200903002', 48, 3, 1, 1),
(6, 'PO200903002', 47, 3, 1, 1),
(7, 'PO200903002', 64, 3, 1, 2),
(8, 'PO200903002', 47, 3, 1, 2),
(9, 'PO200904001', 77, 3, 1, 2),
(10, 'PO200904001', 13, 3, 1, 2),
(11, 'PO200904001', 46, 3, 1, 1),
(12, 'PO200904001', 29, 3, 1, 1),
(13, 'PO200904002', 60, 3, 1, 2),
(14, 'PO200904002', 9, 3, 1, 2),
(15, 'PO200904002', 38, 3, 1, 1),
(16, 'PO200904002', 8, 3, 1, 2),
(17, 'PO200904003', 73, 3, 1, 1),
(18, 'PO200904003', 64, 3, 1, 1),
(19, 'PO200904003', 22, 3, 1, 1),
(20, 'PO200904003', 57, 3, 1, 1),
(21, 'PO200904003', 46, 3, 1, 1),
(22, 'PO200904004', 8, 3, 1, 1),
(23, 'PO200904004', 43, 3, 1, 1),
(24, 'PO200904004', 42, 3, 1, 1),
(25, 'PO200904004', 7, 3, 1, 1),
(26, 'PO200904004', 40, 3, 1, 1),
(27, 'PO200905001', 41, 3, 1, 1),
(28, 'PO200905001', 32, 3, 1, 1),
(29, 'PO200905001', 69, 3, 1, 1),
(30, 'PO200905001', 33, 3, 1, 1),
(31, 'PO200905001', 23, 3, 1, 2),
(32, 'PO200905001', 42, 3, 1, 1),
(33, 'PO200905001', 79, 3, 1, 1),
(34, 'PO200905002', 67, 3, 1, 1),
(35, 'PO200905002', 63, 3, 1, 1),
(36, 'PO200905002', 48, 3, 1, 1),
(37, 'PO200905002', 4, 3, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `w_product_mainList`
--

CREATE TABLE `w_product_mainList` (
  `sid` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `w_product_mainList`
--

INSERT INTO `w_product_mainList` (`sid`, `product_name`) VALUES
(1, 'Circle Dining Chair'),
(2, 'WIRE DINING CHAIR'),
(3, 'Wire Lounge Chair'),
(4, 'Wire Lounge Sofa'),
(5, 'Wire Bar Stool'),
(6, 'Wire Stool'),
(7, '214K'),
(8, '204RH'),
(9, 'S32PV'),
(10, 'WISHBONE'),
(11, 'CH23'),
(12, 'CH88P'),
(13, 'CH26'),
(14, 'CH33T'),
(15, 'CH29P'),
(16, 'CH56'),
(17, 'KK47510'),
(18, 'E005'),
(19, 'E005'),
(20, 'COVER SIDE CHAIR'),
(21, 'COVER ARM CHAIR'),
(22, 'Fiber Armchair '),
(23, 'Fiber Armchair '),
(24, 'Fiber Bar Stool '),
(25, 'Oslo Lounge chair'),
(26, 'Oslo Side Chair'),
(27, 'Loft Bar Stool'),
(28, 'Fiber Lounge Chair '),
(29, 'Configure your Arkade Chair'),
(30, 'ARV Chair'),
(31, ' Pauline Comfort'),
(32, 'Jari Dining Chair'),
(33, 'F Chair'),
(34, 'Pauline Bar Stool'),
(35, 'Ferdinand Lounge Chair'),
(36, 'Theodor Dining Chair'),
(37, 'C-Chair Dining Chair - French Cane'),
(38, 'Bat Chair - Capsule Collection'),
(39, 'Beetle Dining Chair - Un-Upholstered - Wood Base'),
(40, 'Masculo Dining Chair - Fully Upholstered - Wood base'),
(41, 'Beetle Dining Chair - Fully Upholstered - Wood base'),
(42, 'Nagasaki Dining Chair'),
(43, 'Bat Lounge Chair'),
(44, 'Bat Lounge Chair'),
(45, 'Beetle Lounge Chair'),
(46, 'Masculo Lounge Chair'),
(47, 'Masculo Lounge Chair '),
(48, 'Coco Lounge Chair With Armrests'),
(49, 'Sejour Lounge Chair'),
(50, 'Beetle Counter Chair '),
(51, '2D Bar Stool'),
(52, '3D Bar Stool'),
(53, 'Coco Bar Chair'),
(54, 'Beetle Meeting Chair'),
(55, 'Bat Meeting Chair'),
(56, 'Beetle Meeting Chair'),
(57, 'FROXACH048 Roxane'),
(58, 'FSIMOCH047 Simon'),
(59, 'FMILECH048 Milena'),
(60, 'FHELOCH049 Héloïse'),
(61, 'FARSECH052 Arsène 942'),
(62, 'FSEOUCF062 Séoul 536'),
(63, 'FFREDFA071 Fred 885'),
(64, 'FHARDFA078 Hardy 539'),
(65, 'FEUGEFA082 Eugène 908'),
(66, 'FFAUSFA089 Faust 951'),
(67, 'FAXELFA069C Axel'),
(68, 'Ole Wanscher Round T Chair'),
(69, 'Ole Wanscher Low Armchair'),
(70, 'Danish Cabinetmaker Dining Chairs'),
(71, 'Jacob Kjær Side Chair'),
(72, 'N.C. Christoffersen Curved Armchair'),
(73, 'Orla Mølgaard-Nielsen Pair of Easy Chairs'),
(74, 'Gustav Bertelsen Dining Chairs'),
(75, 'Danish Cabinetmaker Armchair'),
(76, 'Flemming Lassen Easy Chair'),
(77, 'Jacob Kjær Armchair'),
(78, 'Frits Henningsen Study Chair'),
(79, 'Edvard + Tove Kindt-Larsen Desk Chair'),
(80, 'Hans J. Wegner Pair of Armchairs'),
(81, 'Erik Kolling Andersen Easy Chair with Stool'),
(82, 'Jacob Kjær Pair of Armchairs'),
(83, 'Ole Wanscher Pair of FD109 Armchairs'),
(84, 'Frits Henningsen Wingback Chair with Stool'),
(85, 'Torsten Johansson Folding Chair'),
(86, 'Torsten Johansson Folding Chair'),
(87, 'Frits Henningsen Curved Armchair'),
(88, 'Ole Wanscher 1945 Armchair'),
(89, 'Ole Wanscher Alpaca Armchair'),
(90, 'Arne Jacobsen Oxford Chair'),
(91, 'Kastholm + Fabricius Executive '),
(92, 'Frits Henningsen Armchair'),
(93, 'Kaare Klint \"Red Chair\"'),
(94, 'Hans J. Wegner \"The Chair\"'),
(95, 'Jacob Kjær Easy Chair with Stool'),
(96, 'Ole Wanscher Armchair'),
(97, 'Rud Rasmussen Armchair'),
(98, 'Orla Mølgaard-Nielsen Armchair'),
(99, 'Ole Wanscher Niger Easy Chair'),
(100, 'Erik Kolling Andersen Prism Chair'),
(101, 'Erik Kolling Andersen Tall Easy Chair - SOLD'),
(102, 'Agner Christoffersen Easy Chair'),
(103, 'Edvard + Tove Kindt-Larsen Bat'),
(104, 'Kaare Klint High Back Chair'),
(105, 'Frits Henningsen Easy Chair'),
(106, 'Easy Lounge Chair - Darkened Teak'),
(107, 'Kangaroo Chair - Darkened Teak'),
(108, 'Favourites Dining Chair -'),
(109, 'Library Chair - Charcoal Black');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `J_cart_delivery_status`
--
ALTER TABLE `J_cart_delivery_status`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `J_cart_order`
--
ALTER TABLE `J_cart_order`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `J_cart_order_status`
--
ALTER TABLE `J_cart_order_status`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `J_cart_qualify`
--
ALTER TABLE `J_cart_qualify`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `J_detail_status`
--
ALTER TABLE `J_detail_status`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `J_order_detail`
--
ALTER TABLE `J_order_detail`
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
-- 使用資料表自動遞增(AUTO_INCREMENT) `J_cart_delivery_status`
--
ALTER TABLE `J_cart_delivery_status`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `J_cart_order`
--
ALTER TABLE `J_cart_order`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `J_cart_order_status`
--
ALTER TABLE `J_cart_order_status`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `J_cart_qualify`
--
ALTER TABLE `J_cart_qualify`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `J_detail_status`
--
ALTER TABLE `J_detail_status`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `J_order_detail`
--
ALTER TABLE `J_order_detail`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_product_mainList`
--
ALTER TABLE `w_product_mainList`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
