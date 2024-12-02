<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_productbrandedit = $_POST['ii_productbrandedit'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $models = $conn->prepare("SELECT * FROM msc_models WHERE FK_mscBrands = '$ii_productbrandedit' ORDER BY `description` ASC");
    $models->execute();
    $cmodels = $models->rowCount();
    $rmodels = $models->fetchall(PDO::FETCH_ASSOC);

    $response = array(
        'status' => 200,
        'models' => $rmodels
    );
    echo json_encode($response);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
