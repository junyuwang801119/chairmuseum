-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 09 日 07:44
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
-- 資料庫： `chair_website`
--

-- --------------------------------------------------------

--
-- 資料表結構 `blog`
--

CREATE TABLE `blog` (
  `sid` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `blog`
--

INSERT INTO `blog` (`sid`, `theme`, `text`, `picture`) VALUES
(1, 1, '歷史文檔123', '52584788f674d2184003ce6f58f90a39.jpg'),
(2, 2, '椅子流行趨勢What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when ', '4b8ee2c6bf98cb9791059964f1f6fa22.jpg'),
(3, 3, '椅子合作廠商What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when ', 'a159f5e55bc39c6b1f3d2fd0aadcb385.jpg'),
(6, 1, '歷史新增2', 'b7f6d55223e7ac8d00ed58978fe267ee.jpg');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blog`
--
ALTER TABLE `blog`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
