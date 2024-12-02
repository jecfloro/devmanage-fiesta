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
$ii_modelidedit = $_POST['ii_modelidedit'];
$ii_modeledit = strtoupper($_POST['ii_modeledit']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_model = $conn->query("SELECT * FROM `msc_models` WHERE FK_mscBrands = '$tempbid' AND `description` = '$ii_modeledit'");
    $select_model->execute();
    $cselect_model = $select_model->rowCount();

    if ($cselect_model == 0) {

        $update = $conn->prepare("UPDATE `msc_models` SET `description` = '$ii_modeledit' WHERE PK_mscModels = '$ii_modelidedit'");
        $update->execute();
        $cupdate = $update->rowCount();
        
        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Model Name Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Model Name already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
