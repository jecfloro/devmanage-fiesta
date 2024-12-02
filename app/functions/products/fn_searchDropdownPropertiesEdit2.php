<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_productcategoryedit = $_POST['ii_productcategoryedit'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $properties = $conn->prepare("SELECT * FROM msc_properties WHERE FK_mscCategories = '$ii_productcategoryedit' ORDER BY `PK_mscProperties` ASC");
    $properties->execute();
    $cproperties = $properties->rowCount();
    $rproperties = $properties->fetchall(PDO::FETCH_ASSOC);

    $response = array(
        'status' => 200,
        'properties' => $rproperties
    );
    echo json_encode($response);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
