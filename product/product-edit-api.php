<?php 

require __DIR__. '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';
header('Content-Type: application/json');

$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => '',
];

$sqll = "UPDATE `w_product_mainList` SET `product_no`=?,`product_name`=?,`description`=?,`category`=?,`color`=?,`chair_body`=?,`chair_seat`=?,`designer`=?,`photo`=?,`price`=?,`hashtag`=?,`on_shelf_time`=?,`off_shelf_time`=?, `last_edit_time`=NOW() WHERE `sid`=?";

$stmt = $pdo->prepare($sqll);

$stmt->execute([
            $_POST['product_no'],
            $_POST['product_name'],
            $_POST['description'],
            $_POST['category'],
            $_POST['color'],
            $_POST['chair_body'],
            $_POST['chair_seat'],
            $_POST['designer'],
            $_POST['photo'],
            $_POST['price'],
            $_POST['hashtag'],
            $_POST['on_shelf_time'],
            $_POST['off_shelf_time'],           
            $_POST['sid'],
    ]);



if ($stmt->rowCount()) {
    $output['success'] = true;
}


echo json_encode($output, JSON_UNESCAPED_UNICODE);
