<?php require __DIR__ . '/../parts/__connect_db.php';;

header('Content-Type: application/json');
$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => '',
];

// INSERT INTO `w_review`(`sid`, `buy_product`, `buy_member`, `stars`, `review`, `user_photo`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6])

$sql = "INSERT INTO `w_review`(`buy_product`, `buy_member`, `stars`, `review`, `user_photo`) 
VALUES(?, ?, ?,?,?)";

$stmt = $pdo->prepare($sql);
$stmt->execute([

    // $_POST['buy_product'],
    // $_POST['buy_member'],
    // $_POST['stars'],
    $_POST['review'],
    // $_POST['user_photo']
]);


if ($stmt->rowCount()) {
    $output['success'] = true;
}


echo json_encode($output, JSON_UNESCAPED_UNICODE);
