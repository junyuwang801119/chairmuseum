-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-09-09 12:17:41
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
-- 資料庫： `my_test`
--

-- --------------------------------------------------------

--
-- 資料表結構 `a_title_category`
--

CREATE TABLE `a_title_category` (
  `sid` int(11) NOT NULL,
  `title_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `a_title_category`
--

INSERT INTO `a_title_category` (`sid`, `title_name`) VALUES
(1, '木工知識'),
(2, '椅子學院'),
(3, '職人推薦');

-- --------------------------------------------------------

--
-- 資料表結構 `a_title_mainlist`
--

CREATE TABLE `a_title_mainlist` (
  `sid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title_sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `a_title_mainlist`
--

INSERT INTO `a_title_mainlist` (`sid`, `title`, `images`, `introduction`, `created_at`, `title_sid`) VALUES
(1, '木工入門基礎知識', '43f94efe82d9f6d71150e2a51cee1f26.jpg', '木工是以木材為基本製作材料，以鋸、刨、鑿、插接、粘合等工序進行造型的一種工藝。由於木材質地堅固、富有彈性、易於加工、其製品經久耐用，所以在生產和生活中得到廣泛應用。如工具的木把、桌台、櫥櫃、房屋門窗、公共汽車的坐椅……我們生活的各個方面幾乎和木工密切相連。', '2020-09-09 13:30:50', 1),
(2, '椅子學院產品製造史', 'e3e7190b73b37542100121851709f3dd.jpg', '引進國外知名設計師的椅子，銷售地包含五大洲，是最經典的椅子設計。', '2020-11-01 16:33:03', 1),
(3, '專訪_木工職人', 'd45f7fa35aa5fa14666bcc7b7255453c.jpg', '約18年前，來自台灣各地的我們，代表著自己就讀的高中，南征北討參加全國木工相關競賽而認識彼此。', '2020-10-30 16:33:41', 1),
(4, '世界經典名椅', 'f98f934f15145fcfc154a4d80fbccbbd.jpg', '經典名椅的設計思考:百位日本設計人評選！', '2020-10-16 16:34:54', 1),
(5, '椅子學院之場地介紹', 'e968dc44a689baf60b8b193f31e7859b.jpg', '台灣的展覽、廠房、雷雕機、上漆室等，給莘莘學子使用。', '2020-09-09 13:33:14', 1),
(6, '如何判斷好木頭', 'beea7a87eebfad42ef2100024d267c23.jpg', '好的紅木家具，除了有好的施工工藝外，其有個質量優成的木材也是非常重要的。', '2020-09-09 13:32:55', 1),
(7, '專訪_懷德居', '2318f91480cc46d2e050285256865091.jpg', '懷德居木工實驗學校」位於僻靜的林口山區，創辦人林東陽教授從一介茶農子弟。', '2020-09-18 00:00:00', 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `a_title_category`
--
ALTER TABLE `a_title_category`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `a_title_mainlist`
--
ALTER TABLE `a_title_mainlist`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_title_category`
--
ALTER TABLE `a_title_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_title_mainlist`
--
ALTER TABLE `a_title_mainlist`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
