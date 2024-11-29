<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $days01 = $conn->prepare("SELECT COUNT(*) AS totalCount FROM `mm_payments` WHERE daysInterval > 0 AND daysInterval < 11");
    $days01->execute();
    $rdays01 = $days01->fetch(PDO::FETCH_ASSOC);

    $days02 = $conn->prepare("SELECT COUNT(*) AS totalCount FROM `mm_payments` WHERE daysInterval > 10 AND daysInterval < 26");
    $days02->execute();
    $rdays02 = $days02->fetch(PDO::FETCH_ASSOC);

    $days03 = $conn->prepare("SELECT COUNT(*) AS totalCount FROM `mm_payments` WHERE daysInterval > 25 AND daysInterval < 51");
    $days03->execute();
    $rdays03 = $days03->fetch(PDO::FETCH_ASSOC);

    $days04 = $conn->prepare("SELECT COUNT(*) AS totalCount FROM `mm_payments` WHERE daysInterval > 50 AND daysInterval < 71");
    $days04->execute();
    $rdays04 = $days04->fetch(PDO::FETCH_ASSOC);

    $days05 = $conn->prepare("SELECT COUNT(*) AS totalCount FROM `mm_payments` WHERE daysInterval > 70 AND daysInterval < 91");
    $days05->execute();
    $rdays05 = $days05->fetch(PDO::FETCH_ASSOC);

    $days06 = $conn->prepare("SELECT COUNT(*) AS totalCount FROM `mm_payments` WHERE daysInterval > 90");
    $days06->execute();
    $rdays06 = $days06->fetch(PDO::FETCH_ASSOC);

    $response = array('status' => 200, 
        'range1' => $rdays01["totalCount"],
        'range2' => $rdays02["totalCount"],
        'range3' => $rdays03["totalCount"],
        'range4' => $rdays04["totalCount"],
        'range5' => $rdays05["totalCount"],
        'range6' => $rdays06["totalCount"]
    );
    echo json_encode($response);

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
