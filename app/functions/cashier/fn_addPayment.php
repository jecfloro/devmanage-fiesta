<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$usercode = $_SESSION['session_usercode'];
$ii_receiptno = $_POST["ii_receiptno"];
$ii_amount = $_POST["ii_amount"];
$ii_chkboxPayment = $_POST["ii_chkboxPayment"];
$tempiid = $_SESSION["tempiid"];
$tempuid = $_SESSION["tempuid"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $schedule = $conn->prepare("SELECT * FROM mm_schedule WHERE FK_mn_installments = '$tempiid' AND FK_appsysUsers = '$tempuid' AND STATUS IS NULL OR STATUS = 'BALANCE' ORDER BY `order` ASC");
    $schedule->execute();
    $cschedule = $schedule->rowCount();
    $rschedule = $schedule->fetchall(PDO::FETCH_ASSOC);

    $uniqid = uniqid() . "" . time();

    for ($i = 1; $i <= $cschedule; $i++) {

        $pkid = $rschedule[$i - 1]["PK_mm_schedule"];
        $pkdate = $rschedule[$i - 1]["dateSchedule"];
        $pkbalance = round(floatval($rschedule[$i - 1]["remaining"]));
        $pkstatus = $rschedule[$i - 1]["status"];
        $numformat = round(floatval($rschedule[$i - 1]["amount"]));

        if ($pkstatus == "BALANCE") {
            $calc = $ii_amount - $pkbalance;
        } else {
            $calc = $ii_amount - $numformat;
        }

        if ($date == $pkdate) {
            $evaluation = "PAID";
        } else if ($date < $pkdate) {
            $evaluation = "PAID";
        } else if ($date > $pkdate) {
            $evaluation = "LATE";
        } else {
        }

        if ($calc > 0) {

            $update = $conn->prepare("UPDATE mm_schedule SET `remaining` = 0, `status` = 'FULL', `fullyPaidDate` = '$date', `evaluation` = '$evaluation', `processedBy` = '$usercode', `receiptNo` = '$ii_receiptno' WHERE `PK_mm_schedule` = '$pkid' AND `FK_mn_installments` = '$tempiid' AND `FK_appsysUsers` = '$tempuid'");
            $update->execute();

            $ii_amount = $calc;
            continue;
        } else if ($calc == 0) {

            $update = $conn->prepare("UPDATE mm_schedule SET `remaining` = 0, `status` = 'FULL', `fullyPaidDate` = '$date', `evaluation` = '$evaluation', `processedBy` = '$usercode', `receiptNo` = '$ii_receiptno' WHERE `PK_mm_schedule` = '$pkid' AND `FK_mn_installments` = '$tempiid' AND `FK_appsysUsers` = '$tempuid'");
            $update->execute();

            break;
        } else {

            $update = $conn->prepare("UPDATE mm_schedule SET `remaining` = abs($calc), `status` = 'BALANCE', `evaluation` = '$evaluation', `processedBy` = '$usercode', `receiptNo` = '$ii_receiptno' WHERE `PK_mm_schedule` = '$pkid' AND `FK_mn_installments` = '$tempiid' AND `FK_appsysUsers` = '$tempuid'");
            $update->execute();

            break;
        }
    }

    $payment = $conn->prepare("INSERT INTO mm_payments (receiptNo, amount, processBy, processDate, FK_mn_installments, FK_appsysUsers) VALUES ('$ii_receiptno', '$ii_amount', '$usercode', '$todaysDate', '$tempiid', '$tempuid')");
    $payment->execute();
    $cpayment = $payment->rowCount();

    if ($cpayment > 0) {
        $response = array('status' => 200, 'message' => "Paymnent Processed!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
