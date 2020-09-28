-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 09 月 09 日 08:30
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
(126, '是員會我', '3fddf882979c25db0388fdf3f81af088.jpg', 'fd9efq5@viuvmqun.com', '123456', '1975-08-06', '0939099844', '', 0, 1, '2020-09-09 03:06:53'),
(127, '會員是我', 'abraham_lincoln_PNG31.png', '9w9risq@cpxwhurrk.com', '123456', '1941-12-10', '0983931715', '', 0, 1, '2020-09-09 03:06:53'),
(128, '員我會是', 'yuri_gagarin_PNG65810.png', '6yw4auvy45c2@dmrjzq.com', '123456', '1974-10-16', '0950111192', '', 0, 1, '2020-09-09 03:06:53'),
(129, '我員是會', 'burger_king_PNG7.png', 'zzfegfc76@agzwfwsn.com', '123456', '1945-08-15', '0911910298', '', 0, 1, '2020-09-09 03:06:53'),
(130, '我是會員', 'abraham_lincoln_PNG31.png', 'vf4qjid3bptfi@uqmig.com', '123456', '2018-12-10', '0962527215', '', 0, 1, '2020-09-09 03:06:53'),
(131, '員是會我', 'hillary_clinton_PNG52.png', 'fsjn7w92@srqbrmhi.com', '123456', '1984-10-07', '0915344485', '', 0, 1, '2020-09-09 03:06:53'),
(132, '會是員我', 'yuri_gagarin_PNG65810.png', 'fc4fwkcxcnf7m@hnkauigb.com', '123456', '1947-12-28', '0932568670', '', 0, 1, '2020-09-09 03:06:53'),
(133, '會員我是', 'abraham_lincoln_PNG31.png', 'ctfmren28kc@nsfqziv.com', '123456', '1965-08-21', '0914627166', '', 0, 1, '2020-09-09 03:06:53'),
(134, '會是我員', 'burger_king_PNG7.png', 'zenc7hmk@zqguc.com', '123456', '1987-08-12', '0986303380', '', 0, 1, '2020-09-09 03:06:53'),
(135, '員會我是', 'yuri_gagarin_PNG65810.png', 'wefuhzhm@vupdw.com', '123456', '1957-07-20', '0955607336', '', 0, 1, '2020-09-09 03:06:53'),
(136, '會我員是', 'abraham_lincoln_PNG31.png', '65djry6jnxq@gcpqbjcnxz.com', '123456', '1946-05-25', '0901453512', '', 0, 1, '2020-09-09 03:06:53'),
(137, '是會員我', 'burger_king_PNG7.png', 'zj682m4wzqxv@qxiyj.com', '123456', '1987-07-04', '0965122674', '', 0, 1, '2020-09-09 03:06:53'),
(138, '我是員會', 'yuri_gagarin_PNG65810.png', 'ghfa7byysk@iccpi.com', '123456', '1963-04-13', '0981415549', '', 0, 1, '2020-09-09 03:06:53'),
(139, '我員是會', 'hillary_clinton_PNG52.png', 't4cibt8gn8@ammx.com', '123456', '1943-07-06', '0954986760', '', 0, 1, '2020-09-09 03:06:53'),
(140, '是會我員', 'hillary_clinton_PNG52.png', 'vmetbgy2ps2bp@brgfgzw.com', '123456', '1958-10-31', '0919373455', '', 0, 1, '2020-09-09 03:06:53'),
(141, '員是會我', 'yuri_gagarin_PNG65810.png', 'zd3v56ynw@bymswgydg.com', '123456', '1942-01-19', '0997428416', '', 0, 1, '2020-09-09 03:06:53'),
(142, 'eferf', 'be9a25058c1db3740e4485a29481bb52.jpg', 'ytehdy@dfdf.com', '123456', '2000-10-10', '0912345678', '', 0, 1, '2020-09-09 10:26:25'),
(143, 'eferf', 'd424fc4ee41a35697fef435d6cd97b5b.jpg', 'hgf@rdfgr.com', '123456', '2000-10-10', '0912345678', '', 0, 1, '2020-09-09 12:44:04'),
(144, 'eferf', '19f7a88c8e1871bcb80128f38eb5c63c.jpg', 'ytehdy@dfdf.com', '123456', '2000-10-10', '0912345678', '', 0, 1, '2020-09-09 12:54:42'),
(145, '我會員是', 'hillary_clinton_PNG52.png', 'fm8jyqsgk@cuyvr.com', '123456', '1996-11-29', '0993632093', '', 0, 1, '2020-09-09 13:15:24'),
(146, '會是員我', 'abraham_lincoln_PNG31.png', 'y92qn7i85@ickdmkfiz.com', '123456', '1993-08-02', '0960004519', '', 0, 1, '2020-09-09 13:15:24'),
(147, '會我員是', 'hillary_clinton_PNG52.png', 'cwjp9zjp27@pmgsgtmjdu.com', '123456', '2003-02-10', '0930297080', '', 0, 1, '2020-09-09 13:15:24'),
(148, '是我員會', 'burger_king_PNG7.png', '7ujz52ufxh@vhadr.com', '123456', '1956-10-07', '0944078789', '', 0, 1, '2020-09-09 13:15:24'),
(149, '是我員會', 'abraham_lincoln_PNG31.png', 'i5ik9zhr@pwseznvkd.com', '123456', '2007-09-01', '0978088712', '', 0, 1, '2020-09-09 13:15:24'),
(150, '我員是會', 'yuri_gagarin_PNG65810.png', 'nijawkws3466n@dpudrfyh.com', '123456', '1999-02-23', '0992035208', '', 0, 1, '2020-09-09 13:15:24'),
(151, '是會我員', 'abraham_lincoln_PNG31.png', 's8nrp2gwt7@egyww.com', '123456', '1961-09-19', '0993306275', '', 0, 1, '2020-09-09 13:15:24'),
(152, '是會我員', 'yuri_gagarin_PNG65810.png', '7neak6y52evcc@tjwuijtve.com', '123456', '2003-08-20', '0914192704', '', 0, 1, '2020-09-09 13:15:24'),
(153, '員是會我', 'hillary_clinton_PNG52.png', '4ggest4bnvnct@ctjyznnxij.com', '123456', '1964-08-01', '0996052545', '', 0, 1, '2020-09-09 13:15:24'),
(154, '我會員是', 'abraham_lincoln_PNG31.png', 'gmahj73fc6n3z@mcpv.com', '123456', '1974-12-04', '0976730981', '', 0, 1, '2020-09-09 13:15:24'),
(155, '我員會是', 'yuri_gagarin_PNG65810.png', 'nerfngz92@pefxjmz.com', '123456', '1992-07-26', '0916864126', '', 0, 1, '2020-09-09 13:15:24'),
(156, '是我員會', 'abraham_lincoln_PNG31.png', 'pvp2y44dr59r@ivsepinvfy.com', '123456', '1981-09-24', '0943133874', '', 0, 1, '2020-09-09 13:15:24'),
(157, '會是我員', 'abraham_lincoln_PNG31.png', 'g6tusij9s@xfxiawtdfh.com', '123456', '1953-07-26', '0951401560', '', 0, 1, '2020-09-09 13:15:24'),
(158, '會員是我', 'burger_king_PNG7.png', 'ghiftbjgfcsym@xbgi.com', '123456', '2011-07-10', '0993955422', '', 0, 1, '2020-09-09 13:15:24'),
(159, '會是員我', 'burger_king_PNG7.png', 'znf6venh7yzs@gnunxcv.com', '123456', '1960-05-22', '0967041024', '', 0, 1, '2020-09-09 13:15:24'),
(160, '會我是員', 'abraham_lincoln_PNG31.png', '8j8d9enbrgqqm@jpnxjqcvp.com', '123456', '1978-06-13', '0950073176', '', 0, 1, '2020-09-09 13:15:24'),
(161, '是會員我', 'abraham_lincoln_PNG31.png', 'wanxgbdp@kjuat.com', '123456', '2011-01-07', '0982954846', '', 0, 1, '2020-09-09 13:15:24'),
(162, '會是員我', 'yuri_gagarin_PNG65810.png', 'qm25b6w@tjbgthyfz.com', '123456', '1986-09-05', '0987574856', '', 0, 1, '2020-09-09 13:15:24'),
(163, '我是員會', 'hillary_clinton_PNG52.png', 'itjeeqnhrw9t@upqgky.com', '123456', '1953-06-06', '0918554115', '', 0, 1, '2020-09-09 13:15:24'),
(164, '是我會員', 'hillary_clinton_PNG52.png', 'exjdr86@usriy.com', '123456', '1964-12-30', '0993691031', '', 0, 1, '2020-09-09 13:15:36'),
(165, '我會是員', 'hillary_clinton_PNG52.png', 'chbmc96kbbdg@ynvxkav.com', '123456', '2012-07-29', '0924718162', '', 0, 1, '2020-09-09 13:15:36'),
(166, '我員會是', 'burger_king_PNG7.png', 'x933s4ww@cixdryiz.com', '123456', '1979-06-11', '0936540205', '', 0, 1, '2020-09-09 13:15:36'),
(167, '我是員會', 'hillary_clinton_PNG52.png', 'dj7cdbkpwy2@mnjmc.com', '123456', '1941-10-05', '0934438770', '', 0, 1, '2020-09-09 13:15:36'),
(168, '員會我是', 'hillary_clinton_PNG52.png', 'cke3zyr@hbuquqdc.com', '123456', '2018-06-17', '0982127403', '', 0, 1, '2020-09-09 13:15:36'),
(169, '是員我會', 'hillary_clinton_PNG52.png', 'qcztx5h5jifu@imhm.com', '123456', '1949-10-20', '0925408571', '', 0, 1, '2020-09-09 13:15:36'),
(170, '我是會員', 'burger_king_PNG7.png', 'tu6dgshe9@bujme.com', '123456', '1947-12-02', '0922573815', '', 0, 1, '2020-09-09 13:15:36'),
(171, '員會我是', 'abraham_lincoln_PNG31.png', 'pt5jttb@fffec.com', '123456', '1979-09-13', '0912682395', '', 0, 1, '2020-09-09 13:15:36'),
(172, '員我是會', 'yuri_gagarin_PNG65810.png', '4q7gjb9pwpa@zmwuvu.com', '123456', '2009-05-17', '0917241558', '', 0, 1, '2020-09-09 13:15:36'),
(173, '員我會是', 'yuri_gagarin_PNG65810.png', '72fsb772k5@pcspdwdqw.com', '123456', '1950-02-04', '0951700984', '', 0, 1, '2020-09-09 13:15:36'),
(174, '我員是會', 'yuri_gagarin_PNG65810.png', 'nky2nuy83uq9@fpcw.com', '123456', '1990-11-06', '0946471000', '', 0, 1, '2020-09-09 13:15:36'),
(175, '員我會是', 'yuri_gagarin_PNG65810.png', '2fi7iti@kqrh.com', '123456', '2004-11-23', '0923864968', '', 0, 1, '2020-09-09 13:15:36'),
(176, '員會是我', 'yuri_gagarin_PNG65810.png', 'enm557cmw4k5@rxazmzeuar.com', '123456', '2003-02-11', '0908622651', '', 0, 1, '2020-09-09 13:15:36'),
(177, '會我員是', 'yuri_gagarin_PNG65810.png', 'mf46idmhu78h@hfzus.com', '123456', '2001-06-10', '0941205570', '', 0, 1, '2020-09-09 13:15:36'),
(178, '是我員會', 'hillary_clinton_PNG52.png', 'gfzme9t3t@epdafivkwp.com', '123456', '2017-12-25', '0941950489', '', 0, 1, '2020-09-09 13:15:36'),
(179, '我是會員', 'abraham_lincoln_PNG31.png', 'nw82dcqv6@ucdmryfzib.com', '123456', '1950-06-10', '0905983021', '', 0, 1, '2020-09-09 13:15:36'),
(180, '會我是員', 'yuri_gagarin_PNG65810.png', 'rc874mufrg@daxyhbrt.com', '123456', '1945-07-29', '0977839224', '', 0, 1, '2020-09-09 13:15:36'),
(181, '員我會是', 'hillary_clinton_PNG52.png', 'dqzf47qdjxdt@bhujwxupe.com', '123456', '2019-12-21', '0911042356', '', 0, 1, '2020-09-09 13:15:36'),
(182, '是我會員', 'yuri_gagarin_PNG65810.png', '4k6vibtahzvd@bhwztazdky.com', '123456', '2017-12-31', '0957475792', '', 0, 1, '2020-09-09 13:15:36'),
(183, 'eferf', '43de16e2c0543fc06bc615575d5debd2.jpg', 'ytehdy@dfdf.com', '1234t', '2000-10-10', '0912345678', '', 0, 1, '2020-09-09 14:06:05'),
(184, '是我員會', 'burger_king_PNG7.png', '5iqxyqxkxfx2@smdzhvgbv.com', '123456', '1964-12-31', '0985794754', '', 0, 1, '2020-09-09 14:06:23'),
(185, '會我是員', 'burger_king_PNG7.png', 'gk89n7xs@gncip.com', '123456', '2009-09-15', '0985529741', '', 0, 1, '2020-09-09 14:06:23'),
(186, '我會是員', 'burger_king_PNG7.png', 'ae2sixaf4j7@cinpza.com', '123456', '1974-06-09', '0915435707', '', 0, 1, '2020-09-09 14:06:23'),
(187, '我是會員', 'hillary_clinton_PNG52.png', 'dp7w8mt4@fjyzyh.com', '123456', '1943-04-02', '0925169514', '', 0, 1, '2020-09-09 14:06:23'),
(188, '我是員會', 'abraham_lincoln_PNG31.png', 'cpajr5767273@jhwfgbiz.com', '123456', '1994-03-22', '0923435705', '', 0, 1, '2020-09-09 14:06:23'),
(189, '是員會我', 'yuri_gagarin_PNG65810.png', '4kpj4p6c5j3w8@ptfxsct.com', '123456', '2001-07-15', '0914259827', '', 0, 1, '2020-09-09 14:06:23'),
(190, '是員會我', 'yuri_gagarin_PNG65810.png', 'dxbm2hxkh@gjpucjq.com', '123456', '2003-07-17', '0980841562', '', 0, 1, '2020-09-09 14:06:23'),
(191, '是會員我', 'burger_king_PNG7.png', 'ffsapy3b@xrrpnr.com', '123456', '1977-03-08', '0911866659', '', 0, 1, '2020-09-09 14:06:23'),
(192, '員會是我', 'abraham_lincoln_PNG31.png', 'dks9585rjnxu@jtrd.com', '123456', '1960-07-19', '0944406349', '', 0, 1, '2020-09-09 14:06:23'),
(193, '是員會我', 'abraham_lincoln_PNG31.png', 'ma5wtehtd8@xwjgks.com', '123456', '2013-07-03', '0912195236', '', 0, 1, '2020-09-09 14:06:23'),
(194, '是我員會', 'burger_king_PNG7.png', 'nxw78nz5qp@ngcbzrbed.com', '123456', '1983-08-08', '0900331870', '', 0, 1, '2020-09-09 14:06:23'),
(195, '員我是會', 'abraham_lincoln_PNG31.png', '7fy4ekq@brhcf.com', '123456', '2010-02-01', '0924712762', '', 0, 1, '2020-09-09 14:06:23'),
(196, '會員是我', 'abraham_lincoln_PNG31.png', 'zyzp5wzs@chphzckhq.com', '123456', '1999-04-06', '0947476734', '', 0, 1, '2020-09-09 14:06:23'),
(197, '員會我是', 'burger_king_PNG7.png', 'qa95h6r@mgmzdwz.com', '123456', '2006-02-27', '0967479373', '', 0, 1, '2020-09-09 14:06:23'),
(198, '員是我會', 'burger_king_PNG7.png', '9xv4dcuv@uuej.com', '123456', '1989-07-17', '0910430070', '', 0, 1, '2020-09-09 14:06:23'),
(199, '是會我員', 'hillary_clinton_PNG52.png', 'c5u5x9vqh3cq@icisiscfi.com', '123456', '1964-09-12', '0915848356', '', 0, 1, '2020-09-09 14:06:23'),
(200, '員我是會', 'hillary_clinton_PNG52.png', 'zvvens3xj@xkrei.com', '123456', '2002-03-18', '0958088574', '', 0, 1, '2020-09-09 14:06:23'),
(201, '我員會是', 'abraham_lincoln_PNG31.png', 'xx2bdvxjz@gwijbcz.com', '123456', '1999-05-23', '0956449592', '', 0, 1, '2020-09-09 14:06:23'),
(202, '我會是員', 'yuri_gagarin_PNG65810.png', 'rpe6rtguytuw6@yfgscgbt.com', '123456', '2007-10-21', '0922339658', '', 0, 1, '2020-09-09 14:06:23');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members`
--
ALTER TABLE `members`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
