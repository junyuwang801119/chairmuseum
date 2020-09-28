<?php require __DIR__ . '/../parts/__connect_db.php';


header('Content-Type: application/json');
$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => '',
];

// UPDATE `w_review` SET `sid`=[value-1],`buy_product`=[value-2],`buy_member`=[value-3],`stars`=[value-4],`review`=[value-5],`user_photo`=[value-6] WHERE 1

$sql = "UPDATE `w_review` SET `buy_product`=?,`buy_member`=?,`stars`=?,`review`=?,`user_photo`=? WHERE `sid`=?";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['buy_product'],
    $_POST['buy_member'],
    $_POST['stars'],
    $_POST['review'],
    $_POST['user_photo'],
    $_POST['sid']
]);


if ($stmt->rowCount()) {
    $output['success'] = true;
}


echo json_encode($output, JSON_UNESCAPED_UNICODE);
