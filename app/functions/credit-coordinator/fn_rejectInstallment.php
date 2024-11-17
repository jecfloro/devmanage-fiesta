<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$usercode = $_SESSION['session_usercode'];

$input_rejectReasons = $_POST["input_rejectReasons"];
$tempiid = $_SESSION["tempiid"];
$tempuid = $_SESSION["tempuid"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $update = $conn->prepare("UPDATE mn_installments SET rejectedBy = '$usercode', rejectedDate = '$todaysDate', rejectReason = '$input_rejectReasons', installmentStatus = 'REJECTED' WHERE PK_mn_installments = '$tempiid' AND FK_appsysUsers = '$tempuid'");
    $update->execute();
    $cupdate = $update->rowCount();

    

    if ($cupdate > 0) {
        $response = array('status' => 200, 'message' => "Installment Rejected!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
