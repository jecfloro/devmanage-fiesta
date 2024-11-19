<?php

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$usercode = $_SESSION['session_usercode'];

$ii_selectMonths = $_POST["ii_selectMonths"];
$ii_downPayment = $_POST["ii_downPayment"];
$ii_approvedDateSched = $_POST["ii_approvedDateSched"];
$tempiid = $_SESSION["tempiid"];
$tempuid = $_SESSION["tempuid"];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $update = $conn->prepare("UPDATE mn_installments SET approvedMonths = '$ii_selectMonths', productDownpayment = '$ii_downPayment', approvedDate = '$todaysDate', approvedBy = '$usercode', approvedPaymentSched = '$ii_approvedDateSched', installmentStatus = 'APPROVED' WHERE PK_mn_installments = '$tempiid' AND FK_appsysUsers = '$tempuid'");
    $update->execute();
    $cupdate = $update->rowCount();

    $installments = $conn->prepare("SELECT * FROM mn_installments JOIN msc_products ON mn_installments.FK_mscProducts = msc_products.PK_mscProducts JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE FK_appsysUsers = '$tempuid' AND PK_mn_installments = '$tempiid'");
    $installments->execute();
    $cinstallments = $installments->rowCount();
    $rinstallments = $installments->fetch(PDO::FETCH_ASSOC);

    $deduct = $rinstallments["productPrice"] - $rinstallments["productDownpayment"];
    $installment = round($deduct / $rinstallments["approvedMonths"]);
    $multiply = $installment * $rinstallments["approvedMonths"];

    if ($cupdate > 0) {

        $starting_date = $ii_approvedDateSched;

        for ($ii = 1; $ii <= $ii_selectMonths; $ii++) {

            $date30days = date('Y-m-d', strtotime($starting_date . ' + 30 days'));
            
            $insert = $conn->prepare("INSERT INTO mm_schedule (`order`, `FK_mn_installments`, `FK_appsysUsers`, `dateSchedule`, `amount`) VALUES ('$ii','$tempiid','$tempuid','$date30days','$installment')");
            $insert->execute();

            $starting_date = $date30days;
        }

        $response = array('status' => 200, 'message' => "Installment Approved!");
        echo json_encode($response);
    } else {
        $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
