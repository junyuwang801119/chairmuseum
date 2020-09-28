<?php
require __DIR__ . '/../parts/__connect_db.php';
// require __DIR__. '/0831_admin_required.php';

header('Content-Type: application/json');

$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => ''
];

// TODO: 檢查資料格式
// email_pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
// mobile_pattern = /^09\d{2}-?\d{3}-?\d{3}$/;

// if (!empty($_POST['sid'])) {
//     $output['code'] = 405;
//     $output['error'] = '沒有 sid';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE);
//     exit;
// }
// echo $_POST;

if (!mb_strlen($_POST['theme'])) {
    $output['code'] = 410;
    $output['error'] = "選取";
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}


if (!mb_strlen($_POST['text'])) {
    $output['code'] = 410;
    $output['error'] = '此欄未填1';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

if (!mb_strlen($_POST['picture'])) {
    $output['code'] = 410;
    $output['error'] = '此欄未填2';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

// if (empty($_POST['password'])) {
//     $output['code'] = 405;
//     $output['error'] = '此欄未填';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE);
//     exit;
// }

// if (!preg_match('/^09\d{2}-?\d{3}-?\d{3}$/', $_POST['mobile'])) {
//     $output['code'] = 420;
//     $output['error'] = '手機號碼格式錯誤';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE);
//     exit;
// }


$sql = "UPDATE `blog` SET
    `theme`=?,
    `text`=?,
    `picture`=?
    -- `password`=?,
    -- `birthday`=?,
    -- `mobile`=?,
    -- `address`=?
    WHERE `sid`=?";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['theme'],
    $_POST['text'],
    $_POST['picture'],
    // $_POST['password'],
    // $_POST['birthday'],
    // $_POST['mobile'],
    // $_POST['address'],
    $_POST['sid'],
]);

if ($stmt->rowCount()) {
    $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
