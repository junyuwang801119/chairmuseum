<?php
require __DIR__ . "/../parts/__connect_db.php";

header('Content-Type: application/json');

$output = [
    'succuess' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => ''
];

//TODO : 檢查資料格式

//email_pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
//mobile_pattern = /^09\d{2}-?\d{3}-?\d{3}$/;

if (mb_strlen($_POST['name']) < 2) {
    $output['code'] = 401;
    $output['error'] = '姓名長度要大於 2';
    exit;
}

$sql = "INSERT INTO `address_book`(
    `name`, `email`, `mobile`, 
    `birthday`, `address`, `created_at`
    ) VALUES (?,?,?,?,?,NOW())";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['name'],
    $_POST['email'],
    $_POST['mobile'],
    $_POST['birthday'],
    $_POST['address'],

]);
// echo $stmt->rowCount();
// echo 'ok';

if ($stmt->rowCount()) {
    $output['success'] = true;
}
