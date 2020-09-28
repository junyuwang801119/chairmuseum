-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-09-10 04:39:22
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
(4, '椅子學院', '台北市', 'aaa@gmail.com', '0918123456', '09:00:00', '21:00:00', '1887e429d7d848e8de67f87f6abe5935.jpg', '雷雕廠房'),
(12, '589666', '2F., No. 42, Ln. 140, Sec. 2, Xiyuan Rd., Wanhua Dist.', 'bbb@gmail.com', '0922555888', '11:29:00', '11:33:00', '5409d0d568539a31a8ed4330d95d49e5.jpg', '1234797');

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
(18, 10, 0, 'Dddd', 'e1f8ed8c3b4357e59d160604cf829951.jpg', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 6, 6, 6),
(20, 555, 0, 'rrr', 'fe3e3420995f1ad875a461372660eca7.jpg', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 4, 6, 7);

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
(1, 1, '歷史文檔123', '9c3aeb0a2ff7d0b9a1700ea6cb8fc5d3.png'),
(2, 2, '椅子流行趨勢What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when ', '4e764c4876c71473e21060811361943a.jpg'),
(3, 3, '椅子合作廠商What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when ', '7ee783462245a70a1cac4e4dba5038a5.png'),
(6, 1, '歷史新增2', 'ceb8f62541dec0cc4451a120e2ff68e0.jpg'),
(8, 2, 'fgho', 'f1d2e854ae2b90ff5cfad41a91ca5f8e.png'),
(9, 3, 'lfhyhygy', '940e829d186faba8477c2533ffbceff8.jpg'),
(10, 2, '椅子流行趨勢What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when', '7277e2c20216dba72db7a01dad737b18.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `e_designer`
--

CREATE TABLE `e_designer` (
  `sid` int(11) NOT NULL,
  `e_student_id` int(11) NOT NULL,
  `e_designer_intro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Facebook_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Instagram_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `YouTube_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `web_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `e_designer`
--

INSERT INTO `e_designer` (`sid`, `e_student_id`, `e_designer_intro`, `Facebook_url`, `Instagram_url`, `YouTube_url`, `web_url`) VALUES
(1, 23, '你好！我在學習家具設計四年後才剛從謝菲爾德哈勒姆大學畢業。我喜歡趨勢和風格的變化，並且可以愛上極簡主義作品以及充滿活力的色彩繽紛的物品，並且當涉及音樂播放列表時，我將始終表現最佳！', 'https://www.facebook.com/', 'https://www.instagram.com/gracechar_/', '', 'https://www.made.com/talentlab/shop/emerging-talent-edit/brent-accent-chair-aegean-blue-talent-lab/'),
(2, 2, 'SPYNTEX提供了完全的設計自由度，可以轉換為各種時尚實用的物品，例如家具，家居飾品甚至玩具！SPYNTEX非常適合室內和室外使用，具有光滑的表面，觸感令人愉悅，而且持久，防水且堅固。SPYNTEX概念為“綠色”家具樹立了新的標杆，而又不影響質量或設計。它不僅是對地球友好的產品，而且還是將現代美學與出色耐用性相結合的當代家具行業的引領者。', 'https://www.facebook.com/spyntexglobal/', '', '', 'spyntex.com'),
(3, 3, '富有進取心和雄心勃勃的家具設計師，對當代家具設計和室內空間充滿熱情。在概念化和創造性表達上蓬勃發展。', '', 'https://www.instagram.com/oakstone_design/', '', ' http://oakstonedesign.com/oak/ '),
(4, 4, '我是來自多風的丹麥的基督徒。我今年20歲，是丹麥皇家美術學院的一名學生，重點是家具設計。我喜歡做東西和微笑。', '', 'https://www.instagram.com/christianhnsn/', '', 'http://www.duaesunttres.com'),
(5, 5, '家具，照明和家居用品的設計師和製造商。通過結合傳統技能和新技術，我喜歡用多種不同的材料製作功能性作品。', '', 'https://www.instagram.com/natashaduda', '', ' http://www.natashaduda.com'),
(6, 0, '我今年45歲，我花了20年的時間從事經典的中世紀設計的銷售。我的熱情使我6年前回到了教育領域，打算學習如何設計。我獲得了3D設計的HNC，室內與環境設計的B / Des和產品設計的碩士學位（2017）。', '', 'https://www.instagram.com/jonchristie2000/', '', 'http://jonchristie670.com'),
(7, 0, '嗨，我是荷蘭的一位設計師。最初學習室內設計，但愛上了家具設計。我的目標是創造獨特且實用的產品。我認為，好的設計是好的想法，正確的材料和出色的美學的結合。', '', '', '', 'https://www.made.com/talentlab/view-profile/764781/'),
(8, 0, '薩米·里約（Samy Rio）在櫥櫃製造領域學習了四年，然後在巴黎的Ensci les工作室工作，完成了為期五年的工業設計課程。這種雙重背景使他能夠結合工業技術和手工藝，他認為這是相互補充和不可或缺的。', '', 'https://www.instagram.com/samy_rio/', '', 'http://www.samyrio.fr'),
(9, 0, '我工作的主要目的是創建與其功能和環境相一致的誠實，和諧和溫暖的對像或圖像。我的專業視野是多方面的，從工業到圖形設計和包裝。', '', 'https://www.instagram.com/isabel_cambiella/', '', 'https://www.behance.net/isabelcambiella'),
(10, 0, '在巴黎工作時，我很想對年輕的創作感興趣，那時我想成為一名帆船設計師。重新專注於產品設計後，我正在為巴黎和歐洲的代理商從事工業和包裝設計的自由職業。我開始推動越來越多的家具和燈光設計。', '', 'https://www.instagram.com/ms077/', '', 'https://www.marcsicard.com'),
(11, 0, '我是一個創意大師，紡織品設計師和藝術家。我的設計歷久彌新，獨具匠心，最重要的是使人感到愉悅-使您感覺良好。', '', 'https://www.instagram.com/gosiarusek/', '', 'https://www.made.com/talentlab/view-profile/791803/');

-- --------------------------------------------------------

--
-- 資料表結構 `e_frecord`
--

CREATE TABLE `e_frecord` (
  `sid` int(11) NOT NULL,
  `e_memember_sid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_f_order_sid` int(11) DEFAULT NULL,
  `e_fproj_sid` int(11) DEFAULT NULL,
  `e_f_record_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_f_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_f_time` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `e_frecord`
--

INSERT INTO `e_frecord` (`sid`, `e_memember_sid`, `e_f_order_sid`, `e_fproj_sid`, `e_f_record_name`, `e_f_price`, `e_f_time`, `note`) VALUES
(1, 'ming@gg.com', 4, 5, '布倫特口音扶手椅，愛琴海藍', '28000', '2019-03-20 13:00:00', '希望可以幫忙包好送禮\r\n'),
(2, 'aaa@qq.com\r\n', 45, 6, '多功能氣墊椅', '30000', '2020-08-02 09:54:12', '氣墊第二層想換成紅色'),
(3, 'aaa@qq.coma\r\n', 33, 2, '丹麥兒童椅', '20000', '2020-08-11 09:56:23', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `e_fund_control`
--

CREATE TABLE `e_fund_control` (
  `sid` int(11) NOT NULL,
  `e_account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_designer` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `e_fund_control`
--

INSERT INTO `e_fund_control` (`sid`, `e_account`, `e_password`, `e_designer`) VALUES
(1, 'eva', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '阿芳');

-- --------------------------------------------------------

--
-- 資料表結構 `e_fund_project`
--

CREATE TABLE `e_fund_project` (
  `sid` int(11) NOT NULL,
  `e_designer_sid` int(11) DEFAULT NULL,
  `e_proname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_cate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_pic` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_prointro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_lowprice` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_goal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `e_start_time` datetime NOT NULL,
  `e_end_time` datetime NOT NULL,
  `e_pro_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_realize_time` date NOT NULL,
  `e_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `e_fund_project`
--

INSERT INTO `e_fund_project` (`sid`, `e_designer_sid`, `e_proname`, `e_cate`, `e_pic`, `e_prointro`, `e_lowprice`, `e_goal`, `e_start_time`, `e_end_time`, `e_pro_url`, `e_realize_time`, `e_created_at`) VALUES
(1, 1, '布倫特口音扶手椅，愛琴海藍', '9', '23df85450ca338e0ea631de4ba5aab48.jpg', '布倫特是傳統口音椅子的好玩替代品。柔軟的海軍陸戰隊內飾採用當代黃銅鏡框。布倫特的靈感來自80年代的孟菲斯運動!!\r\n', '23500', '800,00000', '2019-03-16 13:00:00', '2019-05-01 23:59:00', '', '2020-01-16', '2020-09-05 23:27:41'),
(2, 2, '瘋狂的多功能家具！', 'bar stool', 'b93d487dded7b35cbed6554ab9e67bc8.jpg', '一個百變又無窮大的椅子，床，長凳，桌子，甚至是兒童玩具。一種免費移動應用程序豐富的設計解決方案之一。', '27000', '1155500', '2020-07-16 13:00:00', '2020-10-01 13:00:00', 'https://v.kickstarter.com/1599207267_a9446dd0478b2b32c7f59f1510178073ee131740/projects/2692202/video-728787-h264_high.mp4', '2020-12-31', '2020-09-06 02:00:57'),
(3, 3, '丹麥兒童椅', 'bar stool', '7570884b2e5190a85c67eba51e38b4f0.jpg', '幫助推出色彩鮮豔的丹麥兒童椅。它們是可持續的，有機的且不含化學物質。再加上一張桌子來匹配。', '17000', '1100500', '2020-11-16 13:00:00', '2021-01-25 23:59:00', 'https://v.kickstarter.com/1599379195_0a4014ddc3f254a9a5b2cf19791613c509025f1f/projects/1691910/video-531604-h264_high.mp4', '2021-04-30', '2020-09-06 02:08:23'),
(4, 4, '折後折疊：有趣的現代家具', 'bar stool', '532b76cf0ffa9b083a5626bc47bccbec.jpg', '我們喜歡這把椅子！受到Papercraft的啟發，我們將其設計為簡單美觀。摺紙椅的巢狀形狀既大方又符合人體工程學，而波羅的海樺木薄殼則使其保持高效，最小化。外殼的小面通過鋼琴鉸鏈連接-這使椅子具有一定的柔韌性，增加了舒適感。薄的外殼位於優雅折疊的鋼架上。您可以選擇天然胡桃木貼面或3種明亮的單色層壓板。', '18000', '1250000', '2020-10-16 13:00:00', '2021-01-25 23:59:00', 'https://ksr-ugc.imgix.net/assets/011/838/903/e6e3ae1215e59548d18278237f9ce6a7_original.jpg?ixlib=rb-2.1.0&crop=faces&w=1024&h=576&fit=crop&v=1463702131&auto=format&frame=1&q=92&s=b05e49fdd5bfe4eee88c854fb59eed42', '2021-03-31', '2020-09-06 02:08:23'),
(9, 5, '混合椅：可在辦公桌椅上快速轉變的躺椅', 'bar stool', '7d3ee7d9eb22f9d67ca1ab42cdb8bf41.jpg', 'Hybrid Chair是最終的躺椅，可以迅速轉變為桌子椅。適用於任何情況並節省空間。', '16500', '450000', '2019-11-16 13:00:00', '2020-01-31 23:59:00', 'https://ksr-ugc.imgix.net/assets/018/569/681/927a9916c95dc554a5b920aa932ce7f0_original.jpg?ixlib=rb-2.1.0&crop=faces&w=1024&h=576&fit=crop&v=1510660068&auto=format&frame=1&q=92&s=ddd53c6741de736d581922d29d094aec', '2020-04-30', '2020-09-06 02:13:18'),
(10, 6, '氣墊坐墊', '9', 'b13e4d355fdd5550281035b4f139b1e9.jpg', '可以用作額外的椅子，邊桌或裝飾品。坐墊可隨時充氣和放氣。', '13000', '250000', '2019-10-16 13:00:00', '2020-01-25 23:59:00', 'https://ksr-ugc.imgix.net/assets/028/979/687/8f1574138e99ee773c30775723ce4442_original.jpeg?ixlib=rb-2.1.0&crop=faces&w=1024&h=576&fit=crop&v=1588754335&auto=format&frame=1&q=92&s=968a42481022b87dfbfb1d93b3ab9583', '2020-03-30', '2020-09-06 21:20:59'),
(11, 7, '氣泡•彈性主動坐感官椅', 'bar stool', 'a992331737980a397c9e7d02fa208257.jpg', '彈性主動坐姿可刺激感覺，保持平衡，改善姿勢，每日鍛煉，健身，娛樂和能量遊戲', '32000', '700000', '2020-10-16 23:00:00', '2021-01-25 23:59:00', 'https://ksr-ugc.imgix.net/assets/012/165/453/53fa48e07dea4f7354b50481dbc5cdb0_original.jpg?ixlib=rb-2.1.0&crop=faces&w=1024&h=576&fit=crop&v=1463739188&auto=format&frame=1&q=92&s=56066a3dd33ddc1bc751d337ad613b4f', '2021-04-30', '2020-09-06 21:23:32'),
(18, 8, 'Ini@想要的設計紐約2020', 'bar stool', 'bf2d835cb75b1eee039edcbd7659d941.jpg', 'Ini Archibong的Whor底座和Stargazer椅子將他的創意視野變為現實，並在2020年Wanted Design上展出。', '30000', '600000', '2019-10-16 23:00:00', '2020-01-25 23:59:00', 'https://ksr-ugc.imgix.net/assets/011/335/307/255534156ffe32f647c44bd97ce772ea_original.jpg?ixlib=rb-2.1.0&crop=faces&w=1024&h=576&fit=crop&v=1463681183&auto=format&frame=1&q=92&s=a89a36ceb77989a0ac6dcb25f688f7fa', '2021-04-30', '2020-09-06 21:34:24'),
(19, 9, '吊床寶座', 'bar stool', '96addd94ea791793cbd021ad4e2210a0.jpg', '創建吊床王座是為了幫助您在任何需要的地方享受全身吊床體驗。它的設計旨在讓您的房屋看起來很棒，但經久耐用，可以在戶外生活。吊床寶座特意打造，佔地面積最小，外形小巧，用途廣泛。底座直徑為46英寸，可旋轉 360°全景。', '32000', '750000', '2020-09-16 21:27:52', '2020-12-25 21:27:52', 'https://ksr-ugc.imgix.net/assets/025/413/939/cfeebd60a22aba93d70a0474a3069e2f_original.jpg?ixlib=rb-2.1.0&crop=faces&w=1024&h=576&fit=crop&v=1559933402&auto=format&frame=1&q=92&s=c02a960f3d2509d1ca878103b2c8e419', '2021-05-25', '2020-09-06 21:34:24'),
(20, NULL, 'dfd', 'bar stool', 'fd1268225b78ef1d1b005e9609fadb25.jpg', 'rtrtrte', '123', '34343', '2020-09-02 00:00:00', '2020-09-05 00:00:00', NULL, '2020-09-30', '2020-09-07 10:49:04'),
(22, NULL, 'z7676687', 'bar stool', '732b9ae33116cbca502b426ad73ad93f.jpg', 'xsdsfdsfdfdsfmnm,n,mndcdsfdvdddfdfdsf\r\ndfdsfd', '13', '2323', '2020-09-08 00:00:00', '2020-09-12 00:00:00', NULL, '2020-09-30', '2020-09-07 13:38:14'),
(24, NULL, 'z,m.,', '9', '98ed814febb9b5d2edd2e3fb458c23f4.jpg', 'g,,/,/plpplkvgfgdcdfsddsddsdsdsdsdsdsdsds', '123', '34343', '2020-09-18 00:00:00', '2020-09-12 00:00:00', NULL, '2020-09-26', '2020-09-07 13:46:51'),
(35, NULL, 'dfd', '1', '4d19b2907b302c1a221f52b91a5cc96e.jpg', 'dfdgfhggjhgkjhkjk', '123', '34343', '2020-09-09 03:43:00', '2020-09-09 04:40:00', NULL, '2020-09-29', '2020-09-09 01:40:35'),
(36, NULL, 'dfd', '1', 'bd64980fc3194d8c4c5bf6f6d3cd90cd.jpg', 'knk,n,mnmmm', '123', '34343', '2020-09-09 13:41:00', '2020-09-25 13:44:00', NULL, '2020-09-25', '2020-09-09 01:42:25'),
(37, NULL, 'dfd', '9', '52ed17b215f279f104e730291813d5a9.jpg', 'jbjmbmbmmnmm', '123', '34343', '2020-09-09 13:47:00', '2020-10-23 13:47:00', NULL, '2020-09-30', '2020-09-09 01:47:43');

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

-- --------------------------------------------------------

--
-- 資料表結構 `j_cart_delivery_status`
--

CREATE TABLE `j_cart_delivery_status` (
  `sid` int(11) NOT NULL,
  `delivery_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `j_cart_delivery_status`
--

INSERT INTO `j_cart_delivery_status` (`sid`, `delivery_status`) VALUES
(1, '未發貨'),
(2, '出貨中'),
(3, '待取貨'),
(4, '已取貨');

-- --------------------------------------------------------

--
-- 資料表結構 `j_cart_order`
--

CREATE TABLE `j_cart_order` (
  `sid` int(11) NOT NULL,
  `PO_NO` varchar(255) NOT NULL,
  `member` int(11) NOT NULL,
  `qualify` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` int(11) NOT NULL,
  `delivery_status` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `j_cart_order`
--

INSERT INTO `j_cart_order` (`sid`, `PO_NO`, `member`, `qualify`, `order_date`, `order_status`, `delivery_status`, `point`, `total`) VALUES
(2, 'PO200903001', 2, 2, '2020-09-03', 2, 4, 1900, 19000),
(3, 'PO200903002', 2, 2, '2020-09-03', 1, 1, 1400, 14000),
(4, 'PO200904001', 2, 1, '2020-09-04', 3, 4, 800, 8000),
(5, 'PO200904002', 2, 1, '2020-09-04', 3, 4, 1000, 18000),
(6, 'PO200904003', 2, 2, '2020-09-04', 2, 2, 4160, 41600),
(7, 'PO200904004', 2, 2, '2020-09-04', 2, 2, 2090, 20900),
(8, 'PO200905001', 2, 1, '2020-09-05', 2, 2, 2190, 21900),
(9, 'PO200905002', 2, 1, '2020-09-05', 2, 2, 8990, 89900);

-- --------------------------------------------------------

--
-- 資料表結構 `j_cart_order_status`
--

CREATE TABLE `j_cart_order_status` (
  `sid` int(11) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `j_cart_order_status`
--

INSERT INTO `j_cart_order_status` (`sid`, `order_status`) VALUES
(1, '未處理'),
(2, '處理中'),
(3, '結案'),
(4, '撤銷');

-- --------------------------------------------------------

--
-- 資料表結構 `j_cart_qualify`
--

CREATE TABLE `j_cart_qualify` (
  `sid` int(11) NOT NULL,
  `qualify` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `j_cart_qualify`
--

INSERT INTO `j_cart_qualify` (`sid`, `qualify`) VALUES
(1, '符合'),
(2, '不符合');

-- --------------------------------------------------------

--
-- 資料表結構 `j_detail_status`
--

CREATE TABLE `j_detail_status` (
  `sid` int(11) NOT NULL,
  `product_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `j_detail_status`
--

INSERT INTO `j_detail_status` (`sid`, `product_status`) VALUES
(1, '下訂'),
(2, '取消');

-- --------------------------------------------------------

--
-- 資料表結構 `j_order_detail`
--

CREATE TABLE `j_order_detail` (
  `sid` int(11) NOT NULL,
  `PO_NO` varchar(255) NOT NULL,
  `product_name` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `qualify` int(11) NOT NULL,
  `product_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `j_order_detail`
--

INSERT INTO `j_order_detail` (`sid`, `PO_NO`, `product_name`, `quantity`, `qualify`, `product_status`) VALUES
(1, 'PO200903001', 1, 2, 1, 1),
(2, 'PO200903001', 46, 3, 1, 1),
(3, 'PO200903001', 44, 3, 1, 2),
(4, 'PO200903001', 54, 3, 1, 1),
(5, 'PO200903002', 48, 3, 1, 1),
(6, 'PO200903002', 47, 3, 1, 1),
(7, 'PO200903002', 64, 3, 1, 2),
(8, 'PO200903002', 47, 3, 1, 2),
(9, 'PO200904001', 77, 3, 1, 2),
(10, 'PO200904001', 13, 3, 1, 1),
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
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visa` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `members`
--

INSERT INTO `members` (`sid`, `name`, `avatar`, `email`, `password`, `birthday`, `mobile`, `address`, `visa`, `status`, `created_at`) VALUES
(231, '是會我員', 'abraham_lincoln_PNG31.png', '4uigz4b26mh@dfuqnkfb.com', '123456', '1976-11-10', '0977207074', '', 0, 1, '2020-09-10 09:18:17'),
(232, '員會是我', 'abraham_lincoln_PNG31.png', '8z59xp3ebv9@jhmnnsvps.com', '123456', '1988-07-27', '0918901356', '', 0, 1, '2020-09-10 09:18:17'),
(233, '是我會員', 'yuri_gagarin_PNG65810.png', 'r5vij4d@ydsgbigqc.com', '123456', '2019-07-22', '0920909056', '', 0, 1, '2020-09-10 09:18:17'),
(234, '是會員我', 'hillary_clinton_PNG52.png', 'hyygfgvnzivqt@hrxdp.com', '123456', '1949-09-20', '0900101120', '', 0, 1, '2020-09-10 09:18:17'),
(235, '我會是員', 'burger_king_PNG7.png', 'uxxs4rf@hdzghn.com', '123456', '1940-04-03', '0977315456', '', 0, 1, '2020-09-10 09:18:17'),
(236, '我員會是', 'hillary_clinton_PNG52.png', 'ajv4mm25vggj@diunvw.com', '123456', '1949-06-05', '0904332690', '', 0, 1, '2020-09-10 09:59:53'),
(237, '員我會是', 'burger_king_PNG7.png', 'kvrntxfa@sstaxqfrs.com', '123456', '1941-06-02', '0946509260', '', 0, 1, '2020-09-10 09:59:53'),
(238, '我是員會', 'abraham_lincoln_PNG31.png', 'jebtz6uz@juqq.com', '123456', '1949-02-28', '0941138936', '', 0, 1, '2020-09-10 09:59:53'),
(239, '員是我會', 'hillary_clinton_PNG52.png', 'ecs8n723w4@cqvqv.com', '123456', '1978-05-10', '0967169665', '', 0, 1, '2020-09-10 09:59:53'),
(240, '會是我員', 'burger_king_PNG7.png', 'hq2x69xwud2@bfnxwpmjhd.com', '123456', '2020-03-17', '0977980940', '', 0, 1, '2020-09-10 09:59:53'),
(242, '是會我員', 'hillary_clinton_PNG52.png', '4s3w3euz5@ijgnrumffi.com', '123456', '1983-05-23', '0995949086', '', 0, 1, '2020-09-10 10:04:44'),
(243, '我員是會', 'yuri_gagarin_PNG65810.png', 'ca46fgcf@buddd.com', '123456', '1990-07-20', '0959238318', '', 0, 1, '2020-09-10 10:04:44'),
(244, '是會我員', 'abraham_lincoln_PNG31.png', 'i4kjkgnb@sbtztwd.com', '123456', '1960-01-09', '0946914399', '', 0, 1, '2020-09-10 10:04:44'),
(245, '我會員是', 'abraham_lincoln_PNG31.png', '6ddxr5ja2p@akyqb.com', '123456', '1983-05-14', '0951406107', '', 0, 1, '2020-09-10 10:04:44'),
(246, '我是會員', 'yuri_gagarin_PNG65810.png', '6cnt7f26n6t@dezzr.com', '123456', '1991-05-03', '0964152275', '', 0, 1, '2020-09-10 10:04:44'),
(247, 'ghthtt', '1b4e85ac3bf90a4872bfa1d66aff4ce8.jpg', 'pfse64289@gmail.com', 'htht', '2000-10-10', '0955888777', '', 0, 1, '2020-09-10 10:11:11');

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
-- 資料表結構 `w_product_mainlist`
--

CREATE TABLE `w_product_mainlist` (
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
-- 傾印資料表的資料 `w_product_mainlist`
--

INSERT INTO `w_product_mainlist` (`sid`, `product_no`, `product_name`, `description`, `category`, `color`, `chair_body`, `chair_seat`, `designer`, `photo`, `price`, `hashtag`, `on_shelf_time`, `off_shelf_time`, `last_edit_time`) VALUES
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

-- --------------------------------------------------------

--
-- 資料表結構 `w_review_stars`
--

CREATE TABLE `w_review_stars` (
  `sid` int(11) NOT NULL,
  `name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `w_review_stars`
--

INSERT INTO `w_review_stars` (`sid`, `name`) VALUES
(1, '五顆星'),
(2, '四顆星'),
(3, '三顆星'),
(4, '二顆星'),
(5, '一顆星');

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
-- 資料表索引 `a_wood_maker`
--
ALTER TABLE `a_wood_maker`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `bidding`
--
ALTER TABLE `bidding`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `e_designer`
--
ALTER TABLE `e_designer`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `e_student_id` (`e_student_id`);

--
-- 資料表索引 `e_frecord`
--
ALTER TABLE `e_frecord`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `e_memember_sid` (`e_memember_sid`),
  ADD KEY `e_f_record_name` (`e_f_record_name`);

--
-- 資料表索引 `e_fund_control`
--
ALTER TABLE `e_fund_control`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `e_account` (`e_account`);

--
-- 資料表索引 `e_fund_project`
--
ALTER TABLE `e_fund_project`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `e_designer_sid` (`e_designer_sid`);

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
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`sid`);

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
-- 資料表索引 `w_product_mainlist`
--
ALTER TABLE `w_product_mainlist`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_review`
--
ALTER TABLE `w_review`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `w_review_stars`
--
ALTER TABLE `w_review_stars`
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
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_experience_category`
--
ALTER TABLE `a_experience_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_experience_mainlist`
--
ALTER TABLE `a_experience_mainlist`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_title_category`
--
ALTER TABLE `a_title_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_title_mainlist`
--
ALTER TABLE `a_title_mainlist`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `a_wood_maker`
--
ALTER TABLE `a_wood_maker`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `bidding`
--
ALTER TABLE `bidding`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blog`
--
ALTER TABLE `blog`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_designer`
--
ALTER TABLE `e_designer`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_frecord`
--
ALTER TABLE `e_frecord`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_fund_control`
--
ALTER TABLE `e_fund_control`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_fund_project`
--
ALTER TABLE `e_fund_project`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `i_second_manage`
--
ALTER TABLE `i_second_manage`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members`
--
ALTER TABLE `members`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_product_mainlist`
--
ALTER TABLE `w_product_mainlist`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_review`
--
ALTER TABLE `w_review`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `w_review_stars`
--
ALTER TABLE `w_review_stars`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
