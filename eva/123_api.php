<?php
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

header('Content-Type: application/json');

$output = [
  'success' => false,
  'postData' => $_POST,
  'code' => 0,
  'error' => '',
];

// if(empty($_POST['sid'])){
//     $output['code'] = 405;
//     $output['error'] = '無此sid';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE);
//     exit;
// }


// if(mb_strlen($_POST['e_proname'])<2){
//     $output['code'] = 410;
//     $output['error'] = '提案名稱不得少於2個字!!';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE);
//     exit;
// }

// if(mb_strlen($_POST['e_prointro'])<2){
//     $output['code'] = 420;
//     $output['error'] = '提案名稱不得少於10個字!!';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE);
//     exit;
// }





$sqll = "UPDATE `e_frecord` SET 
  `note`=?
   WHERE `sid`=?";

$stmt = $pdo->prepare($sqll);
$stmt->execute([
  $_POST['note'],
  $_POST['sid'],

]);


// echo $stmt->rowCount();     
// echo 'ok';

if ($stmt->rowCount()) {
  $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
