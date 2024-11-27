<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");
// $date = "2025-12-15";
// $todaysDate = "2025-12-15 00:00:00";

$usercode = $_SESSION['session_usercode'];
$ii_receiptno = $_POST["ii_receiptno"];
$temp_amount = $_POST["ii_amount"];
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

    function dateDiffInDays($date1, $date2)
    {

        // Calculating the difference in timestamps
        $diff = strtotime($date2) - strtotime($date1);

        // 1 day = 24 hours
        // 24 * 60 * 60 = 86400 seconds
        return abs(round($diff / 86400));
    }

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

    $verifyLatestDate = $conn->prepare("SELECT * FROM mm_payments WHERE FK_mn_installments = '$tempiid' AND FK_appsysUsers = '$tempuid' ORDER BY processDate DESC LIMIT 1");
    $verifyLatestDate->execute();
    $cverifyLatestDate = $verifyLatestDate->rowCount();
    $rverifyLatestDate = $verifyLatestDate->fetch(PDO::FETCH_ASSOC);

    if ($date > $pkdate) {

        if ($cverifyLatestDate > 0) {
            $datenew = date("F d, Y h:i A", strtotime($rverifyLatestDate["processDate"]));

            $dateDiff = dateDiffInDays($datenew, $date);
        } else {
            $dateDiff = dateDiffInDays($date, $pkdate);
        }

        $verifySameDate = $conn->prepare("SELECT * FROM mm_payments WHERE processDate LIKE '%" . $date . "%' AND FK_mn_installments = '$tempiid' AND FK_appsysUsers = '$tempuid'");
        $verifySameDate->execute();
        $cverifySameDate = $verifySameDate->rowCount();

        if ($cverifySameDate > 0) {
            $payment = $conn->prepare("INSERT INTO mm_payments (receiptNo, amount, processBy, processDate, FK_mn_installments, FK_appsysUsers) VALUES ('$ii_receiptno', '$temp_amount', '$usercode', '$todaysDate', '$tempiid', '$tempuid')");
            $payment->execute();
            $cpayment = $payment->rowCount();
        } else {
            $payment = $conn->prepare("INSERT INTO mm_payments (receiptNo, amount, processBy, processDate, FK_mn_installments, daysInterval, FK_appsysUsers) VALUES ('$ii_receiptno', '$temp_amount', '$usercode', '$todaysDate', '$tempiid', $dateDiff, '$tempuid')");
            $payment->execute();
            $cpayment = $payment->rowCount();
        }
    } else {

        $payment = $conn->prepare("INSERT INTO mm_payments (receiptNo, amount, processBy, processDate, FK_mn_installments, FK_appsysUsers) VALUES ('$ii_receiptno', '$temp_amount', '$usercode', '$todaysDate', '$tempiid', '$tempuid')");
        $payment->execute();
        $cpayment = $payment->rowCount();
    }


    if ($cpayment > 0) {

        // verify if fully paid all schedules

        $schedulefull = $conn->prepare("SELECT * FROM mm_schedule WHERE FK_mn_installments = '$tempiid' AND FK_appsysUsers = '$tempuid' AND STATUS = 'FULL' ORDER BY `order` ASC");
        $schedulefull->execute();
        $cschedulefull = $schedulefull->rowCount();

        $installments = $conn->prepare("SELECT * FROM mn_installments JOIN msc_products ON mn_installments.FK_mscProducts = msc_products.PK_mscProducts JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE FK_appsysUsers = '$tempuid' AND PK_mn_installments = '$tempiid'");
        $installments->execute();
        $cinstallments = $installments->rowCount();
        $rinstallments = $installments->fetch(PDO::FETCH_ASSOC);

        if ($cschedulefull == $rinstallments["approvedMonths"]) {
            $update = $conn->prepare("UPDATE mn_installments SET `completedDate` = '$date', `installmentStatus` = 'COMPLETED' WHERE FK_appsysUsers = '$tempuid' AND PK_mn_installments = '$tempiid'");
            $update->execute();

            $update = $conn->prepare("UPDATE appsysusers SET isNew = 0 WHERE PK_appsysUsers = '$tempuid'");
            $update->execute();
        }

        $response = array('status' => 200, 'message' => "Payment Processed!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
