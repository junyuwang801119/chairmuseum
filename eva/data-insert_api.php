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

if (mb_strlen($_POST['e_proname']) < 2) {
    $output['code'] = 410;
    $output['error'] = '提案名稱不得少於2個字!!';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

if (mb_strlen($_POST['e_prointro']) < 10) {
    $output['code'] = 420;
    $output['error'] = '提案介紹不得少於10個字!!';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}





$sql = "INSERT INTO `e_fund_project`(
       `e_proname`, `e_cate`,`e_pic`,
       `e_prointro`, `e_lowprice`, `e_goal`, `e_start_time`,
        `e_end_time`, `e_realize_time`, `e_created_at`) VALUES (?,?,?,?,?,?,?,?,?, NOW())";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    //  $_POST['e_designer_sid'],
    $_POST['e_proname'],
    $_POST['e_cate'],
    $_POST['e_pic'],
    $_POST['e_prointro'],
    $_POST['e_lowprice'],
    $_POST['e_goal'],
    $_POST['e_start_time'],
    $_POST['e_end_time'],
    $_POST['e_realize_time'],

]);


// echo $stmt->rowCount();     
// echo 'ok';

if ($stmt->rowCount()) {
    $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
