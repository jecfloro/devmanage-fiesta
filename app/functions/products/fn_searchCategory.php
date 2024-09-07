<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$CategoryID = $_POST['CategoryID'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $category = $conn->prepare("SELECT * FROM msc_categories WHERE PK_mscCategories = '$CategoryID'");
    $category->execute();
    $ccategory = $category->rowCount();
    $rcategory = $category->fetchall(PDO::FETCH_ASSOC);

    if ($rcategory > 0) {
        $response = array('status' => 200, 'category' => secureToken::tokendecrypt($rcategory[0]["description"]));
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "System Error, Please contact administrator!");
        echo json_encode($response);
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
