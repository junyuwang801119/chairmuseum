-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 08 日 09:54
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
-- 資料表結構 `admins`
--

CREATE TABLE `admins` (
  `sid` int(11) NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `admins`
--

INSERT INTO `admins` (`sid`, `account`, `password`, `nickname`) VALUES
(1, 'ian', '7c4a8d09ca3762af61e59520943dc26494f8941b', '大帥哥');

-- --------------------------------------------------------

--
-- 資料表結構 `i_secondhand_categories`
--

CREATE TABLE `i_secondhand_categories` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `i_secondhand_categories`
--

INSERT INTO `i_secondhand_categories` (`sid`, `name`) VALUES
(1, '霸台高腳椅'),
(2, '沒有把手的'),
(3, '有把手的'),
(4, '餐椅'),
(5, '沙發元素的椅子');

-- --------------------------------------------------------

--
-- 資料表結構 `i_secondhand_conditions`
--

CREATE TABLE `i_secondhand_conditions` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `i_secondhand_conditions`
--

INSERT INTO `i_secondhand_conditions` (`sid`, `name`) VALUES
(1, '九成新Pristind'),
(2, '八成新Mint\r\n'),
(3, '七成新Good');

-- --------------------------------------------------------

--
-- 資料表結構 `i_secondhand_framework`
--

CREATE TABLE `i_secondhand_framework` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `i_secondhand_framework`
--

INSERT INTO `i_secondhand_framework` (`sid`, `name`) VALUES
(1, '木頭'),
(2, '金屬'),
(3, '塑膠');

-- --------------------------------------------------------

--
-- 資料表結構 `i_secondhand_material`
--

CREATE TABLE `i_secondhand_material` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `i_secondhand_material`
--

INSERT INTO `i_secondhand_material` (`sid`, `name`) VALUES
(1, '布料'),
(2, '皮革'),
(5, '木質');

-- --------------------------------------------------------

--
-- 資料表結構 `i_secondhand_product`
--

CREATE TABLE `i_secondhand_product` (
  `sid` int(11) NOT NULL,
  `product_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `conditions_sid` int(11) NOT NULL,
  `categories_sid` int(11) NOT NULL,
  `material_sid` int(11) NOT NULL,
  `framework_sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `i_secondhand_product`
--

INSERT INTO `i_secondhand_product` (`sid`, `product_no`, `productname`, `photo`, `price`, `description`, `stock`, `conditions_sid`, `categories_sid`, `material_sid`, `framework_sid`) VALUES
(1, 'ch007', 'Delos布單椅', 'aa7ae62b55f517e6e1f23d6e1d8e71dd.jpg', 990, '保存良好，照片只有六張椅子，另外兩張目前拿來放衣服了故沒拍到。\r\n整體來說是8張椅子。', 8, 3, 2, 2, 1),
(37, 'ch008', 'F Chair', 'b1a26d95184e64a0874cd99174d40d9b.jpg', 1250, '有點發霉，隨便賣', 2, 3, 3, 2, 2),
(38, 'ch001', 'matial', '6f67963ceb3372983adc2c5ca7d87a34.gif', 2580, '狀況還可以', 1, 1, 5, 1, 1),
(40, 'ch003', 'WOODYCHAIR', 'f8949b0239a6a61839106d1239ceb853.jpg', 1480, '椅腳有些刮痕，但不仔細看看不出來', 2, 2, 2, 1, 1),
(41, 'ch007', 'matial', 'a5b937eedeab2bb479576bf8e39ed7a1.jpg', 1580, '有些褪色，但看不太出來，便宜賣', 1, 2, 2, 2, 2),
(42, 'ch005', 'Ultramix', '06d5eaac507abb7e3be9743d0cafbdfd.jpg', 1280, '椅子底部有破小洞，但不影響使用，其他地方狀況都很好', 1, 1, 2, 2, 2),
(43, 'ch006', 'Wiwi 皮革椅', '412d54779f907fe459fdc6b4dcb924d6.png', 1340, '商品保存良好，但是只有一張無法搭配試裝風格故低下售出。', 1, 1, 3, 1, 1),
(44, 'ch004', 'grod 木椅', '795ef6080af1c0579c9ab4a0d0884567.jpg', 1080, '良品，但因為平常沒在使用所以想賣出', 2, 2, 4, 2, 1),
(57, 'ch008', 'Lausanne', '63d0427377ca0928fb350386817a91d1.jpg', 1080, '聽說是古董，但是家裡整修後發現用不太到所以售出', 2, 3, 1, 2, 1),
(58, 'ch009', 'seaseat', '910049b0cceb1e07ebda78183227240b.jpg', 980, '全白非常好搭配，想要的快買', 5, 1, 3, 5, 2),
(59, 'ch009', 'florseat', '52ab5e92f23baf27aafb99a3b0ef5ab5.jpg', 1380, '可以放在花園，黑色很耐髒', 3, 1, 2, 5, 2),
(60, 'ch010', 'Adelaide椅子(附有旋轉功能與輪腳)', 'f90c6ee11204d6bc5c094be68ba75e5f.jpg', 2480, '因為買錯顏色，忍痛割愛，希望可找到好主人', 2, 1, 2, 1, 2),
(61, 'ch011', '高貴復古灰', '3faf200ecf3d82aac0b22fbc878e6f20.jpg', 1580, '只有一張，要買要快', 1, 2, 2, 5, 2),
(62, 'ch012', 'Florence 椅子', '0c98ea32c1643d109b87f52d4b74662a.jpg', 2480, '搬家換新傢俱的關係，想要買的人可以下單', 5, 1, 2, 5, 2),
(63, 'ch013', 'Adelaide', 'b17cb19cbe765ed366da4bd4e3942113.jpg', 1980, '質感棕非常的美！！！', 3, 1, 2, 5, 1),
(64, 'ch014', 'pureat(室內與室外兩用)', '7531b9f8cebd854ee0b6245a0d146b10.jpg', 1280, '純潔的白色絕對是室內搭配最好的選擇！', 3, 3, 3, 5, 1),
(65, 'ch015', 'greymiracle', '93f9769cbcd98339300489a3fcc70135.jpg', 2280, '有6張，可以組成一套，快買就對了\r\n', 6, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `i_second_manage`
--

CREATE TABLE `i_second_manage` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `i_second_manage`
--

INSERT INTO `i_second_manage` (`sid`, `name`, `parent_sid`) VALUES
(1, '二手管理', 0),
(2, '二手商品列表', 1),
(5, '二手商品新增', 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `account` (`account`);

--
-- 資料表索引 `i_secondhand_categories`
--
ALTER TABLE `i_secondhand_categories`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `i_secondhand_conditions`
--
ALTER TABLE `i_secondhand_conditions`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `i_secondhand_framework`
--
ALTER TABLE `i_secondhand_framework`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `i_secondhand_material`
--
ALTER TABLE `i_secondhand_material`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `i_secondhand_product`
--
ALTER TABLE `i_secondhand_product`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `i_second_manage`
--
ALTER TABLE `i_second_manage`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admins`
--
ALTER TABLE `admins`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_secondhand_categories`
--
ALTER TABLE `i_secondhand_categories`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_secondhand_conditions`
--
ALTER TABLE `i_secondhand_conditions`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_secondhand_framework`
--
ALTER TABLE `i_secondhand_framework`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_secondhand_material`
--
ALTER TABLE `i_secondhand_material`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_secondhand_product`
--
ALTER TABLE `i_secondhand_product`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_second_manage`
--
ALTER TABLE `i_second_manage`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
