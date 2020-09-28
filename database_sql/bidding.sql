-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-09-09 09:04:11
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
-- 資料庫： `project`
--

-- --------------------------------------------------------

--
-- 資料表結構 `bidding`
--

CREATE TABLE `bidding` (
  `sid` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `membership_sid` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `startingDate` date NOT NULL,
  `startingTime` time NOT NULL,
  `bidDate` date NOT NULL,
  `bidTime` time NOT NULL,
  `startedPrice` int(11) NOT NULL,
  `bidPrice` int(11) NOT NULL,
  `soldPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `bidding`
--

INSERT INTO `bidding` (`sid`, `product_sid`, `membership_sid`, `productName`, `pics`, `startingDate`, `startingTime`, `bidDate`, `bidTime`, `startedPrice`, `bidPrice`, `soldPrice`) VALUES
(2, 1, 1, 'CH07 Shell Chair Walnuts', '40f51d5e045f155b29fcd9b319d03cd0.jpg', '2020-09-19', '10:03:00', '2020-10-17', '10:03:00', 200001, 10001, 1000001),
(3, 2, 1, 'France Chair - Leather', 'f09c49ceebe55f4007b07b8cb8a52479.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(4, 3, 1, '45 Armchair - Fabric', 'fec7598d264659d68f403b83061f668c.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(5, 4, 1, 'The Spanish Dining Chair with Armrests', '7eed45aa60e61b21ff443451e97b2e5d.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(6, 5, 1, 'Grasshopper Chair', '322bf5f5aa22d8d028bc8d9ccd86c16f.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(7, 6, 1, 'The Hunting Chair', 'd38e8b4d13756e113e1467183a61af09.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(8, 7, 1, 'Chieftain Armchair', '572559bc05e1ab52762ec2a587fad712.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(9, 8, 1, 'Cuba Chair Soaped Oak', '826facad0fd818b1a8f4bc33d247ed8a.jpg', '2020-09-10', '10:00:00', '2020-10-10', '10:00:00', 20000, 1000, 100000),
(17, 10, 0, 'Dddd', '77369b2ff685ce72c49dbc551f86ba07.jpg', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 234, 777777, 5),
(18, 10, 0, 'Dddd', 'e1f8ed8c3b4357e59d160604cf829951.jpg', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 6, 6, 6);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `bidding`
--
ALTER TABLE `bidding`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `bidding`
--
ALTER TABLE `bidding`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
