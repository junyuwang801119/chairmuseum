<?php require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';
// INSERT INTO `w_product_mainList`(`sid`, `product_no`, `product_name`, `description`, `category`, `color`, `chair_body`, `chair_seat`, `designer`, `photo`, `price`, `hashtag`, `on_shelf_time`, `off_shelf_time`, `last_edit_time`) VALUES 

$output = [
    'success' => false,
    'postData' => $_POST,
    'code' => 0,
    'error' => '',
];

$sql = "INSERT INTO `w_product_mainList`
(`product_no`, `product_name`, `description`, `category`, `color`,  
`chair_body`,`chair_seat`, `designer`, `photo`, `price`, 
`hashtag`, `on_shelf_time`, `off_shelf_time`, `last_edit_time`) 
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

$stmt = $pdo->prepare($sql);
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
]);



if ($stmt->rowCount()) {
    $output['success'] = true;
}


echo json_encode($output, JSON_UNESCAPED_UNICODE);
