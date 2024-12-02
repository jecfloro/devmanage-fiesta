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
$ii_propertyidedit = $_POST['ii_propertyidedit'];
$ii_propertyedit = strtoupper($_POST['ii_propertyedit']);

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_property = $conn->query("SELECT * FROM `msc_properties` WHERE FK_mscCategories = '$tempcid' AND `description` = '$ii_propertyedit'");
    $select_property->execute();
    $cselect_property = $select_property->rowCount();

    if ($cselect_property == 0) {

        $update = $conn->prepare("UPDATE `msc_properties` SET `description` = '$ii_propertyedit' WHERE PK_mscProperties = '$ii_propertyidedit'");
        $update->execute();
        $cupdate = $update->rowCount();
        
        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Property Name Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Property Name already exists!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
