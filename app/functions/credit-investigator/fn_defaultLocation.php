<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$usercode = $_SESSION['session_usercode'];

$ii_datauser = $_POST["ii_datauser"];
$ii_datalocation = $_POST["ii_datalocation"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $update = $conn->prepare("UPDATE mm_location SET isDefault = null WHERE FK_appsysUsers = '$ii_datauser'");
    $update->execute();

    $update = $conn->prepare("UPDATE mm_location SET isDefault = 1 WHERE FK_appsysUsers = '$ii_datauser' AND PK_mm_location = '$ii_datalocation'");
    $update->execute();
    $cupdate = $update->rowCount();

    if ($cupdate > 0) {
        $response = array('status' => 200, 'message' => "Location Default Updated!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
