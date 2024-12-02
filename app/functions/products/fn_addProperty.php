<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$tempcid = $_SESSION['tempcid'];
$ii_property = strtoupper($_POST['ii_property']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_property = $conn->query("SELECT * FROM `msc_properties` WHERE FK_mscCategories = '$tempcid' AND `description` = '$ii_property'");
    $select_property->execute();
    $cselect_property = $select_property->rowCount();

    if ($cselect_property == 0) {

        $insert = $conn->prepare("INSERT INTO `msc_properties` (`FK_mscCategories`, `description`) VALUES ('$tempcid','$ii_property')");
        $insert->execute();
        $cinsert = $insert->rowCount();
        
        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Property Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Property already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
