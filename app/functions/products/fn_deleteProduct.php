<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ProductID = $_POST['ProductID'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $installments = $conn->prepare("SELECT * FROM mn_installments WHERE FK_mscProducts = '$ProductID'");
    $installments->execute();
    $cinstallments = $installments->rowCount();
    $rinstallments = $installments->fetchall(PDO::FETCH_ASSOC);

    $product = $conn->prepare("SELECT * FROM msc_products LEFT JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE PK_mscProducts = '$ProductID'");
    $product->execute();
    $cproduct = $product->rowCount();
    $rproduct = $product->fetchall(PDO::FETCH_ASSOC);

    $detailsid = $rproduct["FK_detailsId"];

    if ($cinstallments > 0) {
        $response = array('status' => 500, 'message' => "Product is associated with installments, cannot be deleted!");
        echo json_encode($response);
    } else {
        $delete = $conn->prepare("DELETE FROM `msc_products` WHERE PK_mscProducts = '$ProductID'");
        $delete->execute();
        $cdelete = $delete->rowCount();

        $delete = $conn->prepare("DELETE FROM `msc_details` WHERE detailsId = '$detailsid'");
        $delete->execute();
    
        if ($cdelete > 0) {
            $response = array('status' => 200, 'message' => "Product Deleted!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }
    }


} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
