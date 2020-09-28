<?php
$page_name = 'fake_data';

echo __DIR__;
require __DIR__ . '/../parts/__connect_db.php';

// TODO: 檢查資料格式

$names = ['我', '是', '會', '員'];


$imageConfig = [
    'abraham_lincoln_PNG31.png',
    'burger_king_PNG7.png',
    'hillary_clinton_PNG52.png',
    'yuri_gagarin_PNG65810.png'
];

for ($i = 1; $i < 6; $i++) {
    shuffle($names);
    // $sql = sprintf("INSERT INTO `address_book`(
    //     `name`, `email`, `mobile`,
    //     `birthday`, `address`, `created_at`
    //     ) VALUES ('%s', 'shin@test.com', '0918123456', '2000-01-01', '台北市', NOW())", implode('', $names));

    // $email = getRandEMail();

    // 隨機取一個頭像
    $randomImage = $imageConfig[array_rand($imageConfig)];

    $sql = sprintf(
        "INSERT INTO
        `members`
        (`name`, `avatar`, `email`,`password`, `mobile`, `birthday`, `address`,`visa`,`status`,`created_at`)
        VALUES ('%s', '%s', '%s', '123456', '%s', '%s', '', 0, 1, NOW())",
        implode('', $names),
        $randomImage,
        getRandEMail(),
        getRandMobile(),
        getRandDateTime('1940', '2020', 'none', true)

    );

    // VALUES ('%s', 'shin@test.com', '0918123456', '2000-01-01', '台北市', NOW())"

    // echo getRandMobile();




    $stmt = $pdo->query($sql);
}

// INSERT INTO `members`(`name`, `email`, `password`, `birthday`, `mobile`, `created_at`)




echo "

<script>alert('INSERT FAKE DATA SUCCESS');history.go(-1);</script>
";


function getRandEMail()
{
    $id_len = rand(6, 12); //字串長度
    $id = '';

    $subfix_len = rand(3, 9); //字串長度
    $subfix = '';

    $word = 'abcdefghijkmnpqrstuvwxyz23456789'; //字典檔 你可以將 數字 0 1 及字母 O L 排除
    $word2 = 'abcdefghijkmnpqrstuvwxyz'; //字典檔 你可以將 數字 0 1 及字母 O L 排除

    $len = strlen($word); //取得字典檔長度
    $len2 = strlen($word2); //取得字典檔長度

    for ($i = 0; $i <= $id_len; $i++) { //總共取 幾次
        $id .= $word[rand() % $len]; //隨機取得一個字元
    }

    for ($i = 0; $i <= $subfix_len; $i++) { //總共取 幾次
        $subfix .= $word2[rand() % $len2]; //隨機取得一個字元
    }

    return $id . '@' . $subfix . '.com'; //回傳亂數帳號
}

//手機隨機生成
function getRandMobile()
{
    $id = '';
    $id_len = rand(0, 9);
    $word = '0123456789';
    $len = strlen($word);
    for ($i = 0; $i < 8; $i++) {
        $id .= $word[rand() % $len];
    }
    return '09' . $id;
}


// 生成隨機生日
function getRandDateTime($s_year, $e_year, $mod = 'dt', $limit = true)
{
    $rand_source1 = mktime(0, 0, 0, 1, 1, $s_year);
    $rand_source2 = $limit ? mktime(0, 0, 0, date("m"), date("d"), $e_year) : mktime(0, 0, 0, 12, 31, $e_year);
    $rand_time = rand($rand_source1, $rand_source2);
    return $mod == 'dt' ? date("Y-m-d H:i:s", $rand_time) : date("Y-m-d", $rand_time);
}

// function getRandAvatar(){
//     $imageConfig = [
//         'uploads/abraham_lincoln_PNG31.png',
//         'uploads/burger_king_PNG7.png',
//         'uploads/hillary_clinton_PNG52.png',
//         'uploads/yuri_gagarin_PNG65810.png'
//     ]
// }
