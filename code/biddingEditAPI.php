<?php
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

header('Content-Type: application/json');

$output = [
    'success' => false,
    'postData' => $_POST,
    // 'code' => 0,
    // 'error' => ''
];

if (empty($_POST['sid'])) {
    $output['code'] = 405;
    $output['error'] = '沒有 sid';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

$sql = "UPDATE `bidding` SET 
    `productName`=?,
    `pics`=?,
    `startingDate`=?,
    `startingTime`=?,
    `bidDate`=?,
    `bidTime`=?,
    `startedPrice`=?,
    `bidPrice`=?,
    `soldPrice`=?
    WHERE `sid`=?";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['productName'],
    $_POST['pics'],
    $_POST['startingDate'],
    $_POST['startingTime'],
    $_POST['bidDate'],
    $_POST['bidTime'],
    $_POST['startedPrice'],
    $_POST['bidPrice'],
    $_POST['soldPrice'],
    $_POST['sid'],
]);

if ($stmt->rowCount()) {
    $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
