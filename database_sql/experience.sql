-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-09-08 14:50:20
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
-- 資料表結構 `a_experience_category`
--

CREATE TABLE `a_experience_category` (
  `sid` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `a_experience_category`
--

INSERT INTO `a_experience_category` (`sid`, `name`) VALUES
(1, '一日體驗班'),
(2, '職人養成班'),
(3, '展覽活動');

-- --------------------------------------------------------

--
-- 資料表結構 `a_experience_mainlist`
--

CREATE TABLE `a_experience_mainlist` (
  `sid` int(11) NOT NULL,
  `activitie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activitie_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `origina_price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `registered_people` int(100) NOT NULL,
  `low_people` int(100) NOT NULL,
  `total_people` int(100) NOT NULL,
  `category_sid` int(11) NOT NULL,
  `following` int(10) NOT NULL,
  `visible` int(10) NOT NULL,
  `images` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `a_experience_mainlist`
--

INSERT INTO `a_experience_mainlist` (`sid`, `activitie_name`, `activitie_id`, `address`, `teacher`, `start_date`, `end_date`, `origina_price`, `sale_price`, `registered_people`, `low_people`, `total_people`, `category_sid`, `following`, `visible`, `images`, `introduction`) VALUES
(1, '2020 基礎班-假日 12天正規課程', 'b01', '台北市', '顏水龍', '2020-08-01', '2020-09-15', 25000, 20000, 4, 5, 10, 1, 0, 1, '10c965b3eb3950cb3194f5fe4f5894f5.jpg', '從最基本的手工具、研磨刀具開始教起，前期學習使用手工具練習、十字搭接、魯班鎖、木料概論；後期學習機器原理與加工應用，配合專業圖面從取料手續開始製作板凳作品完成。'),
(2, '2020 進階班-假日 12天正規課程', 'b02', '台北市', '木工職人', '2020-09-01', '2020-09-30', 25000, 20000, 3, 5, 10, 1, 0, 1, 'f58fe90fd230f63041e5d86899c78160.jpg', '最基本的手工具、研磨刀具開始教起，前期學習使用手工具練習、十字搭接、魯班鎖、木料概論；後期學習機器原理與加工應用，配合專業圖面從取料手續開始製作板凳作品完成。'),
(3, '2020 進階班-假日 12天正規課程', 'b03', '台北市', '木工職人', '2020-09-30', '2020-10-15', 30000, 25000, 2, 5, 10, 1, 0, 1, '64e9b610efeb735f36208923ed7ab3d5.png', '進階班學員自由創作請於上課前先想好本期作品，並於第一堂課攜帶設計圖與老師討論製作。若無想法，亦可選擇教室原有圖紙學習製作。'),
(4, '2020 進階班-平日 12天正規課程', 'b04', '台北市', '顏水龍', '2020-10-01', '2020-10-16', 30000, 25000, 4, 5, 10, 1, 0, 1, 'cfbcd64953e9da307c0a561564fd2307.png', '進階班學員自由創作請於上課前先想好本期作品，並於第一堂課攜帶設計圖與老師討論製作。若無想法，亦可選擇教室原有圖紙學習製作。'),
(5, '長期竹編工作坊', 'b05', '台北市', '木工職人', '2020-09-22', '2020-12-01', 15000, 12000, 8, 5, 10, 1, 0, 1, '778f391bcf5336ece17d058048e0119e.jpg', '\"編織\"是美好生活的開始，用天然素材編織日日使用的器物；今晚，我們會帶著大家從基礎原竹材處理開始，不論是否有接觸過竹編，都能循序漸進慢慢掌控材料。讓妳/你可以更能掌握生活的尺度，編織自己的需求。'),
(6, '家具乙級工法專班 & 乙級證照練習', 'b06', '台北市', '木工職人', '2020-10-08', '2020-10-24', 35000, 30000, 5, 5, 10, 1, 1, 1, '864055403b85e43f430cb7194eceb65c.jpg', '提供乙證考題工程圖，由乙級證照考題之工法為基礎教學，並延伸為實用之家具作品。'),
(7, '傳統木雕基礎課程', 'b07', '台北市', '顏水龍', '2020-10-10', '2020-10-25', 15000, 12000, 3, 5, 10, 1, 1, 1, '886107e17bc290b87339efaa32e67ba2.jpg', '傳統木雕，以陰刻技法為課程核心，除了實作練習外，課堂中以講述的方式介紹傳統木雕工藝的設計方式與審美觀等，除了可引導學員將傳統木雕的文化內涵運用在木雕創作外，也可與木作課程結合，讓經典的傳統圖像運用在現代木作上，增加學員創作元素及應用。'),
(8, '夜間進階班 每周二、四正規課程', 'b08', '台北市', '木工職人', '2020-09-17', '2020-11-15', 25000, 20000, 4, 5, 10, 1, 1, 0, 'c81c5b17d8af697e096081d47a4499ce.jpg', '初次參加木工職人正規課程的學員皆需參與基礎課程，不需具備木工基礎，適合第一次接觸木工的朋友報名參加。'),
(9, '2020 基礎班-假日 12天正規課程', 'b09', '台北市', '一朗木創', '2020-10-01', '2020-11-15', 25000, 20000, 4, 5, 10, 1, 1, 0, 'b24f5a78059f33a7f1942f54fb611f59.jpg', '從最基本的手工具、研磨刀具開始教起，前期學習使用手工具練習、十字搭接、魯班鎖、木料概論；後期學習機器原理與加工應用，配合專業圖面從取料手續開始製作板凳作品完成。'),
(10, '長期竹編工作坊', 'b10', '台北市', '木工職人', '2020-11-14', '2020-12-27', 15000, 12000, 2, 5, 10, 1, 1, 1, 'd2eb629d468db775391645ab832aac92.png', '\"編織\"是美好生活的開始，用天然素材編織日日使用的器物；今晚，我們會帶著大家從基礎原竹材處理開始，不論是否有接觸過竹編，都能循序漸進慢慢掌控材料。讓妳/你可以更能掌握生活的尺度，編織自己的需求。'),
(11, '菊花紋竹編墊課程', 'a01', '台北市', '木工職人', '2020-08-30', '2020-08-30', 2000, 1600, 10, 10, 20, 1, 0, 1, '73f33162beb6db6f1f4e8fe176f985d7.jpg', '運用台灣經典的竹編技法，讓熟悉的編織紋路重新回到餐桌上，六角型的墊子看似簡單，但其中藏了許多眉角，包含：利用六角孔編搭配不同的穿花技巧，能夠呈現不同的竹編花紋；編織完的竹編墊富彈性並耐重；邊框的壓條是以簡單的物理互相疊壓的原理來穩固，這些有趣的細節，也成就了具有漂亮編紋又實用的竹編墊。'),
(12, 'HELLO KITTY多功能旋轉收納架DIY', 'a02', '台北市', '木宇設計', '2020-09-12', '2020-09-12', 2000, 1600, 16, 10, 20, 1, 1, 1, '5e56c6b947a097405d2a233a9d7a6dc5.jpg', '飾品、化妝品輕鬆收納，可360度旋轉方便拿取，讓HELLO KITTY陪伴你幸福每一天。'),
(13, '起司杯墊多種功能一次滿足', 'a03', '台北市', '木宇設計', '2020-09-19', '2020-09-19', 999, 599, 15, 10, 20, 1, 0, 1, '29037560001a364714dd71a44d115a83.jpg', '起司杯墊堆疊起來就好像一整塊的起司啊'),
(14, '寵物營養學講座&寵物餐桌DIY', 'a04', '台北市', '木宇設計', '2020-09-20', '2020-09-20', 1599, 899, 14, 10, 20, 1, 0, 1, 'a03edbbdbd8b74e10fb070e2c463f677.jpg', '手創空間與「小樹動物醫院」舉辦寵物營養學講座，讓毛孩爸爸媽媽們更清楚如何照護毛小孩的健康，講座後還能學習親手為毛小孩量身訂做專屬餐桌喔!'),
(15, '木趣彈珠台', 'a05', '台北市', '王小名', '2020-10-03', '2020-10-03', 999, 699, 13, 10, 20, 1, 1, 1, '4e14ec7db1f27c6a331fd3748bc62ad5.jpg', '超人氣課程-木趣彈珠台要在寶熊漁樂碼頭開課囉~'),
(16, '夏天露營趣', 'a06', '台北市', '木工職人', '2020-10-04', '2020-10-04', 1599, 1099, 12, 10, 20, 1, 1, 1, 'c2fbdd884017844f6543297c603a0d92.jpg', '出發露營前的整理就是在考驗各位的收納實力啊~擁有這款露營椅，車子就可以載更多的裝備囉!'),
(17, '一日竹編工作坊', 'a07', '台北市', '木工職人', '2020-10-11', '2020-10-11', 2000, 1450, 8, 10, 20, 1, 0, 1, '45e421577cf46c472caf07d0dcbe3b52.jpg', '日常實用的竹編果籃，能夠放在廚房盛裝水果、薑、蒜、乾貨；擁有流線自然的編紋，也適合擺入一些植物，作為室內裝飾。'),
(18, '雙人彈珠檯DIY', 'a08', '台北市', '木工職人', '2020-10-24', '2020-10-24', 1999, 1499, 10, 10, 20, 1, 0, 1, '381634ce728cc191864d3379010156d3.jpg', '雙人一起玩彈珠檯好好玩! 讓HELLO KITTY與好朋友陪你FUN!'),
(19, '一日竹編工作坊(進階)', 'a09', '台北市', '木工職人', '2020-10-25', '2020-10-25', 2000, 1450, 5, 10, 20, 1, 1, 1, '1ff3dc79317f849722853f3c6b8acd49.jpg', '日常實用的竹編果籃，能夠放在廚房盛裝水果、薑、蒜、乾貨；擁有流線自然的編紋，也適合擺入一些植物，作為室內裝飾。'),
(20, 'HELLO KITTY多功能旋轉收納架DIY', 'a10', '台北市', '木工職人', '2020-11-28', '2020-11-28', 2000, 1600, 3, 10, 20, 1, 1, 1, 'b86ee963d8d19bd7f4cfd8a86147650e.jpg', '飾品、化妝品輕鬆收納，可360度旋轉方便拿取，讓HELLO KITTY陪伴你幸福每一天。'),
(21, '起司杯墊多種功能一次滿足', 'a11', '台北市', '木工職人', '2020-12-05', '2020-12-05', 999, 599, 4, 10, 20, 1, 1, 1, 'dd25f70d508fe0f882b43fd71c948805.jpg', '起司杯墊堆疊起來就好像一整塊的起司啊!'),
(22, '2020年台灣國際木工機械展', 'c01', '台北市', '', '2020-09-25', '2020-09-28', 200, 0, 0, 0, 0, 1, 1, 1, '45b0df793befbbe6c70b12f4c2079e24.jpg', '一次加工機械 (薄片及合板設備、製材設備等)'),
(23, '中國國際地面材料及輔裝技術展覽會', 'c02', '台北市', '', '2020-08-28', '2020-10-25', 300, 0, 0, 0, 0, 1, 1, 1, 'c0690fe46fb9aaf1dab847ee072b6a50.jpg', '木頭家居的裝潢風格'),
(24, 'WOFX – 2020 家具展', 'c03', '台北市', '', '2020-10-17', '2020-11-30', 300, 0, 0, 0, 0, 1, 1, 1, 'cbfacd33d80fe95a2449c281e0405b8d.jpg', '百大家具椅子之特展'),
(25, '趙偉森個展-偉森的房間', 'c04', '台北市', '', '2020-08-29', '2020-09-23', 250, 100, 0, 0, 0, 1, 1, 1, '597f92ccf419203b35e9f1b62a728b3f.jpg', '這是趙偉森人生中的第一次個展，以自己的房間為主題，藉由新的設計替房間換上一個截然不同的樣貌；把快速便宜的ikea家具汰換成實木打造的手作家具。'),
(26, '與木共舞 木平台木器家居聯展', 'c05', '台北市', '', '2020-08-29', '2020-10-11', 250, 0, 0, 0, 0, 1, 1, 1, '6e0d147c6ef016c948e530c5b9277dc6.jpg', '多種木頭家居的品牌聯展'),
(27, '格子動物園', 'c06', '台北市', '', '2020-10-01', '2020-11-29', 250, 50, 0, 0, 0, 1, 1, 1, '9df55819752689398fbaf51ca37948d5.jpg', '本次【格子】動物園展出了格子。共同工坊老師和學員的作品，每個小動物萌萌認真的臉，溫暖了我們不安忐忑的心。'),
(28, '見東籬——2020臺灣文博會', 'c07', '台北市', '', '2020-10-23', '2020-10-26', 300, 100, 0, 0, 0, 1, 1, 1, '519535921f98f936e4dcb90f9e3c961e.jpg', '體現「採菊東籬下，悠然見南山」的心境轉折，千片萬片，飛龍捲起漫天風雲。'),
(29, '徜徉．有情門', 'c08', '台北市', '', '2020-11-14', '2020-11-22', 150, 0, 0, 0, 0, 1, 1, 1, '52e3d14ba5a8ca546e57d75780cd6750.jpg', '美麗原鄉，雨水豐沛，土地豐饒，孕育出蘭陽平原特有的風土民情。'),
(30, '懷德居木民創作展', 'c09', '台北市', '', '2020-12-01', '2020-12-31', 150, 0, 0, 0, 0, 1, 1, 1, '1320c070d71e676baf0e9b86202aa367.jpg', '懷德居都應民間友好組織之請，協辦木工夏令營活動，累積了可觀經驗。');

-- --------------------------------------------------------

--
-- 資料表結構 `a_wood_maker`
--

CREATE TABLE `a_wood_maker` (
  `sid` int(11) NOT NULL,
  `organizer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `images` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `a_wood_maker`
--

INSERT INTO `a_wood_maker` (`sid`, `organizer`, `address`, `email`, `mobile`, `open_time`, `close_time`, `images`, `introduction`) VALUES
(1, '椅子學院', '台北市', 'aaa@gmail.com', '0918123456', '09:00:00', '18:00:00', 'a0beea0d5dc4d36a61f05fba1ff5dfc4.jpg', '免費平台展示空間'),
(2, '椅子學院', '台北市', 'aaa@gmail.com', '0918123456', '09:00:00', '21:00:00', '58792aab9979d287c603eb63d27522ea.jpg', '木造機器工廠'),
(3, '椅子學院', '台北市', 'aaa@gmail.com', '0918123456', '09:00:00', '21:00:00', '93ef5f95a1204adf9906440319c266c9.jpg', '木工上漆室'),
(4, '椅子學院', '台北市', 'aaa@gmail.com', '0918123456', '09:00:00', '21:00:00', '1887e429d7d848e8de67f87f6abe5935.jpg', '雷雕廠房');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `a_experience_category`
--
ALTER TABLE `a_experience_category`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `a_experience_mainlist`
--
ALTER TABLE `a_experience_mainlist`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `a_wood_maker`
--
ALTER TABLE `a_wood_maker`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_experience_category`
--
ALTER TABLE `a_experience_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_experience_mainlist`
--
ALTER TABLE `a_experience_mainlist`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_wood_maker`
--
ALTER TABLE `a_wood_maker`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
