-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 09 日 15:34
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
  `e_memember_sid` int(11) DEFAULT NULL,
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
(1, 2, 4, 5, '布倫特口音扶手椅，愛琴海藍', '28000', '2019-03-20 13:00:00', '123123kjnkjnefeesxdwddecdc');

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
(37, NULL, 'dfd', '1', '28ee86c8d4980677d2889d235be9fb2c.jpg', 'jbjmbmbmmnmm', '123', '34343', '2020-09-09 13:47:00', '2020-10-23 13:47:00', NULL, '2020-09-30', '2020-09-09 01:47:43');

--
-- 已傾印資料表的索引
--

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
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_designer`
--
ALTER TABLE `e_designer`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_frecord`
--
ALTER TABLE `e_frecord`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_fund_control`
--
ALTER TABLE `e_fund_control`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `e_fund_project`
--
ALTER TABLE `e_fund_project`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
