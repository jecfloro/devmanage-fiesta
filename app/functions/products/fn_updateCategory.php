<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_categoryidedit = $_POST['ii_categoryidedit'];
$ii_categoryedit = strtoupper($_POST['ii_categoryedit']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_category = $conn->query("SELECT * FROM `msc_categories` WHERE `description` = '$ii_category'");
    $select_category->execute();
    $cselect_category = $select_category->rowCount();

    if ($cselect_category == 0) {

        $categoryEncrypt = secureToken::tokenencrypt($ii_categoryedit);

        $update = $conn->prepare("UPDATE `msc_categories` SET `description` = '$categoryEncrypt' WHERE PK_mscCategories = '$ii_categoryidedit'");
        $update->execute();
        $cupdate = $update->rowCount();
        
        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Category Updated!");
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
