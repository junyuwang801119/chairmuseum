<?php
require __DIR__ . '/../parts/__connect_db.php';

header('Content-Type: application/json');

$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => ''
];


if (mb_strlen($_POST['title']) < 2) {
    $output['code'] = 410;
    $output['error'] = '文章名稱長度要大於 2';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}


$sql = "INSERT INTO `a_title_mainlist`(`title`, `images`, `introduction`, `created_at`, `title_sid`) VALUES (?,?,?,?,?)";



$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['title'],
    $_POST['images'],
    $_POST['introduction'],
    $_POST['created_at'],
    $_POST['title_sid'],
]);

//echo $stmt->rowCount();
//echo 'ok';

if ($stmt->rowCount()) {
    $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
