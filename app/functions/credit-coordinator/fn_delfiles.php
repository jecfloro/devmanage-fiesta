<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$dataid = $_POST["dataid"];
$tempiid = $_SESSION["tempiid"];
$tempuid = $_SESSION["tempuid"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $files = $conn->prepare("SELECT * FROM msc_uploads WHERE PK_mscUploads = '$dataid'");
    $files->execute();
    $cfiles = $files->rowCount();
    $rfiles = $files->fetch(PDO::FETCH_ASSOC);

    $delete = $conn->prepare("DELETE FROM msc_uploads WHERE PK_mscUploads = '$dataid'");
    $delete->execute();
    $cdelete = $delete->rowCount();

    if ($cdelete > 0) {
        unlink("../../../uploads/" . $rfiles["fileCode"]);
        $response = array('status' => 200, 'message' => "File Deleted!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
