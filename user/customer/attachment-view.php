<?php

include '../../app/connection/MYSQLSERVER.php';
include '../../app/sessions/AuthSession.php';
include '../../app/sessions/CustomerSession.php';
require '../../app/setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $ii = $_GET["filename"];

    $attachments = $conn->prepare("SELECT * FROM mm_attachments WHERE attachmentCode = '$ii'");
    $attachments->execute();
    $cattachments = $attachments->rowCount();
    $rattachments = $attachments->fetch(PDO::FETCH_ASSOC);

    // Store the file name into variable
    $file = '../../uploads/' . $rattachments["attachmentName"] . '.pdf';
    $filename = 'filename.pdf';

    // Header content type
    header('Content-type: application/pdf');

    header('Content-Disposition: inline; filename="' . $filename . '"');

    header('Content-Transfer-Encoding: binary');

    header('Accept-Ranges: bytes');

    // Read the file
    @readfile($file);

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

?>