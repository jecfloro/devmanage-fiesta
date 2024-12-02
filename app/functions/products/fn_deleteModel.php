<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_modeliddelete = $_POST['ii_modeliddelete'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $product = $conn->prepare("SELECT * FROM msc_products WHERE productModelID = '$ii_modeliddelete'");
    $product->execute();
    $cproduct = $product->rowCount();
    $rproduct = $product->fetchall(PDO::FETCH_ASSOC);

    if ($cproduct > 0) {
        $response = array('status' => 500, 'message' => "Brand is associated with products, cannot be deleted!");
        echo json_encode($response);
    } else {
        $delete = $conn->prepare("DELETE FROM `msc_models` WHERE PK_mscModels = '$ii_modeliddelete'");
        $delete->execute();
        $cdelete = $delete->rowCount();
    
        if ($cdelete > 0) {
            $response = array('status' => 200, 'message' => "Model Deleted!");
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
