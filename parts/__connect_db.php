<?php
// 192.168.27.128
$db_host = "localhost";
$db_name = "my_test";
$db_user = "annie";
$db_pass = "423578";
$dsn = "mysql:host={$db_host};dbname={$db_name}";
$pdo_options = [
    PDO::ATTR_ERRMODE =>
    PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE =>
    PDO::FETCH_ASSOC,
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"
];





// PDO class : Represents a connection between PHP and a database server.

$pdo = new PDO($dsn, $db_user, $db_pass, $pdo_options);

if (!isset($_SESSION)) {
    session_start();
}
