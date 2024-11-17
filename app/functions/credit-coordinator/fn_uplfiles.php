<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$countfiles = count($_FILES['files']['name']);
$tempiid = $_SESSION["tempiid"];
$tempuid = $_SESSION["tempuid"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $resultCount = 0;

    for ($index = 0; $index < $countfiles; $index++) {

        $uniqid = uniqid() . "-" . time();

        $file_name = $_FILES['files']['name'][$index];

        $file_tmp = $_FILES['files']['tmp_name'][$index];

        $file_size = $_FILES['files']['size'][$index];

        $file_type = $_FILES['files']['type'][$index];

        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

        $extension  = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $basename   = $uniqid . "." . $extension; // 5dab1961e93a7_1571494241.jpg

        $destination  = "../../../uploads/{$basename}";
        move_uploaded_file( $file_tmp, $destination );

        $insert = $conn->prepare("INSERT INTO msc_uploads (`FK_appsysUsers`, `FK_mn_installments`, `fileCode`, `fileName`, `fileExtension`, `fileUploaded`) VALUES ('$tempuid', '$tempiid', '$basename', '$file_name', '$file_ext', '$todaysDate')");
        $insert->execute();
        $cinsert = $insert->rowCount();

        if ($cinsert > 0) {
            $resultCount++;
        }

    }

    if ($countfiles == $resultCount) {
        $response = array('status' => 200, 'message' => "File Uploaded!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
