<?php
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

header('Content-Type: application/json');

$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => ''
];

if (empty($_POST['sid'])) {
    $output['code'] = 405;
    $output['error'] = '沒有 sid';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

if (mb_strlen($_POST['activitie_name']) < 2) {
    $output['code'] = 410;
    $output['error'] = '體驗名稱長度要大於 2';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

$sql = "UPDATE `a_experience_mainlist` SET `activitie_name`=?,`activitie_id`=?,`address`=?,`teacher`=?,`start_date`=?,`end_date`=?,`origina_price`=?,`sale_price`=?,`registered_people`=?,`low_people`=?,`total_people`=?,`category_sid`=?,`following`=?,`visible`=?,`images`=?,`introduction`=? WHERE `sid`=?";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['activitie_name'],
    $_POST['activitie_id'],
    $_POST['address'],
    $_POST['teacher'],
    $_POST['start_date'],
    $_POST['end_date'],
    $_POST['origina_price'],
    $_POST['sale_price'],
    $_POST['registered_people'],
    $_POST['low_people'],
    $_POST['total_people'],
    $_POST['category_sid'],
    $_POST['following'],
    $_POST['visible'],
    $_POST['images'],
    $_POST['introduction'],
    $_POST['sid'],
]);

if ($stmt->rowCount()) {
    $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
