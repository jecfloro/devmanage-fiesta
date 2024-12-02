<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_brand = strtoupper($_POST['ii_brand']);
$ii_productcategory = $_POST["ii_productcategory"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_brand = $conn->query("SELECT * FROM `msc_brands` WHERE FK_mscCategories = '$ii_productcategory' AND `description` = '$ii_brand'");
    $select_brand->execute();
    $cselect_brand = $select_brand->rowCount();

    if ($cselect_brand == 0) {

        $insert = $conn->prepare("INSERT INTO `msc_brands` (`FK_mscCategories`, `description`) VALUES ('$ii_productcategory','$ii_brand')");
        $insert->execute();
        $cinsert = $insert->rowCount();
        
        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Brand Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Brand already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
