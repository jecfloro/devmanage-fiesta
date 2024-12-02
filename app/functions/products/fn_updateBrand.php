<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_brandidedit = $_POST['ii_brandidedit'];
$ii_brandedit = strtoupper($_POST['ii_brandedit']);
$ii_productcategoryedit = $_POST['ii_productcategoryedit'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_brand = $conn->query("SELECT * FROM `msc_brands` WHERE FK_mscCategories = '$ii_productcategoryedit' AND `description` = '$ii_brandedit'");
    $select_brand->execute();
    $cselect_brand = $select_brand->rowCount();

    if ($cselect_brand == 0) {

        $update = $conn->prepare("UPDATE `msc_brands` SET `FK_mscCategories` = '$ii_productcategoryedit', `description` = '$ii_brandedit' WHERE PK_mscBrands = '$ii_brandidedit'");
        $update->execute();
        $cupdate = $update->rowCount();
        
        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Brand Name Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Brand Name already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
