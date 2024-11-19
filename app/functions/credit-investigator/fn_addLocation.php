<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$usercode = $_SESSION['session_usercode'];

$ii_lat = $_POST["ii_lat"];
$ii_long = $_POST["ii_long"];
$ii_address = $_POST["ii_address"];
$ii_isDefault = $_POST["ii_isDefault"];
$tempuid = $_SESSION["tempuid"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($ii_isDefault == 1) {

        $update = $conn->prepare("UPDATE mm_location SET isDefault = null WHERE FK_appsysUsers = '$tempuid'");
        $update->execute();

        $insert = $conn->prepare("INSERT INTO mm_location (`FK_appsysUsers`, `lat`, `long`, `isDefault`, `addedBy`, `dateAdded`, `addressNoteDescription`) VALUES ($tempuid,'$ii_lat','$ii_long',1,'$usercode','$todaysDate','$ii_address')");
        $insert->execute();
        $cinsert = $insert->rowCount();

        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Location Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }
    }

    if ($ii_isDefault == 0) {

        $insert = $conn->prepare("INSERT INTO mm_location (`FK_appsysUsers`, `lat`, `long`, `addedBy`, `dateAdded`, `addressNoteDescription`) VALUES ($tempuid,'$ii_lat','$ii_long','$usercode','$todaysDate','$ii_address')");
        $insert->execute();
        $cinsert = $insert->rowCount();

        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Location Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }
        
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
