<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_categoryiddelete = $_POST['ii_categoryiddelete'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $product = $conn->prepare("SELECT * FROM msc_products WHERE FK_mscCategories = '$ii_categoryiddelete'");
    $product->execute();
    $cproduct = $product->rowCount();
    $rproduct = $product->fetchall(PDO::FETCH_ASSOC);

    if ($cproduct > 0) {
        $response = array('status' => 500, 'message' => "Cannot delete this category as it has associated products!");
        echo json_encode($response);
    } else {
        $delete = $conn->prepare("DELETE FROM `msc_categories` WHERE PK_mscCategories = '$ii_categoryiddelete'");
        $delete->execute();
        $cdelete = $delete->rowCount();
            
        if ($cdelete > 0) {
            $response = array('status' => 200, 'message' => "Category Deleted!");
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
