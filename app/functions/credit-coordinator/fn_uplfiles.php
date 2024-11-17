<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$countfiles = count($_FILES['files']['name']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    for ($index = 0; $index < $countfiles; $index++) {

        $file_name = $_FILES['files']['name'][$index];

        $file_tmp = $_FILES['files']['tmp_name'][$index];

        $file_size = $_FILES['files']['size'][$index];

        $file_type = $_FILES['files']['type'][$index];

        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
    }
    
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
