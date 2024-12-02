<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$BrandID = $_POST['BrandID'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $property = $conn->prepare("SELECT a.PK_mscBrands, a.FK_mscCategories, a.description AS brandDescription, b.description AS categoryDescription FROM msc_brands AS a JOIN msc_categories AS b ON a.FK_mscCategories = b.PK_mscCategories WHERE a.PK_mscBrands = '$BrandID'");
    $property->execute();
    $cproperty = $property->rowCount();
    $rproperty = $property->fetchall(PDO::FETCH_ASSOC);

    if ($rproperty > 0) {
        $response = array('status' => 200, 'category' => $rproperty[0]["FK_mscCategories"], 'categoryname' => $rproperty[0]["categoryDescription"], 'brand' => $rproperty[0]["brandDescription"]);
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "System Error, Please contact administrator!");
        echo json_encode($response);
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
