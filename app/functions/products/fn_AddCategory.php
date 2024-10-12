<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_category = strtoupper($_POST['ii_category']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_category = $conn->query("SELECT * FROM `msc_categories` WHERE `description` = '$ii_category'");
    $select_category->execute();
    $cselect_category = $select_category->rowCount();

    if ($cselect_category == 0) {

        $insert = $conn->prepare("INSERT INTO `msc_categories` (`description`) VALUES ('$ii_category')");
        $insert->execute();
        $cinsert = $insert->rowCount();
        
        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Category Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Category already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
