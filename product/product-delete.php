<?php

require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

// isset(variable to be checked.) — Determine if a variable is declared and is different than NULL. type : bool.

// 使用$_SERVER[‘HTTP_REFERER’] 變數可以獲取上一個或前一個頁面的URL地址。$_SERVER是php中的環境變數，

// $_SERVER['HTTP_REFERER']
// $_SERVER is an array containing information such as headers, paths, and script locations. The entries in this array are created by the web server. 

// HTTP_REFERER : The address of the page (if any) which referred the user agent to the current page. This is set by the user agent. 

$referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'data-list.php';

if (empty($_GET['sid'])) {

    // 字串的串連使用的是串連運算子，也就是半形點（.）
    header('Location: ' . $referer);
    exit;
}

// intval — Get the integer value of a variable
// 這是什麼意思？
$sid = intval($_GET['sid']) ?? 0;
$pdo->query("DELETE FROM `w_product_mainList` WHERE sid=$sid");
header('Location:' . $referer);
