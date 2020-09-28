-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 09 日 19:42
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
-- 資料表結構 `w_review`
--

CREATE TABLE `w_review` (
  `sid` int(11) NOT NULL,
  `buy_product` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `buy_member` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `stars` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `review` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `user_photo` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `w_review`
--

INSERT INTO `w_review` (`sid`, `buy_product`, `buy_member`, `stars`, `review`, `user_photo`) VALUES
(1, 'dd', '', '五顆星', '', 'd255a1d4d7a061ccc62b203777e95666.png'),
(2, 'rrrr', '4', '三顆星', 'lllll', '02c11d145853f4077a824cdb6341c322.png'),
(3, '', '', '五顆星', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.5555555', '574e76368c3ef43d73cb1e08a916e293.png'),
(4, '3', '3', '五顆星', '', 'a9fa313bde8d366750fe13062873555b.png'),
(5, 'r', '4', '二顆星', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'e8b9104cf6b478d89c706c49512e9110.png'),
(6, 'r', '4', '三顆星', 'From ancient mathematicians like Euclid, to Leonardo da Vinci, to Denmark’s own Hans J.', 'b250389659d666b63e866233cbe19684.png');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `w_review`
--
ALTER TABLE `w_review`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_review`
--
ALTER TABLE `w_review`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
