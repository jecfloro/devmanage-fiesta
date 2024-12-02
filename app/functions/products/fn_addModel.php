<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$tempbid = $_SESSION['tempbid'];
$ii_model = strtoupper($_POST['ii_model']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_model = $conn->query("SELECT * FROM `msc_models` WHERE FK_mscBrands = '$tempbid' AND `description` = '$ii_model'");
    $select_model->execute();
    $cselect_model = $select_model->rowCount();

    if ($cselect_model == 0) {

        $insert = $conn->prepare("INSERT INTO `msc_models` (`FK_mscBrands`, `description`) VALUES ('$tempbid','$ii_model')");
        $insert->execute();
        $cinsert = $insert->rowCount();
        
        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Model Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Model already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
