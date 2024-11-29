<?php

include '../../app/connection/MYSQLSERVER.php';
include '../../app/sessions/AuthSession.php';
include '../../app/sessions/CreditCoordinatorSession.php';
require '../../app/setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
  $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $idate = $_GET["idate"];
  $edate = $_GET["edate"];

  $userpayments = $conn->prepare("SELECT PK_mm_payments, a.receiptNo, a.amount, a.processDate, b.userFullName AS CashierFullName, c.userFullName AS CustomerFullName, d.FK_mscProducts AS productId, e.productName AS productName, a.FK_mn_installments, a.FK_appsysUsers FROM mm_payments AS a JOIN appsysusers AS b ON a.processBy = b.PK_appsysUsers JOIN appsysusers AS c ON a.FK_appsysUsers = c.PK_appsysUsers JOIN mn_installments AS d ON a.FK_mn_installments = d.PK_mn_installments JOIN msc_products AS e ON d.FK_mscProducts = e.PK_mscProducts WHERE processDate BETWEEN '$idate 00:00:00' AND '$edate 23:59:59' ORDER BY processDate DESC");
  $userpayments->execute();
  $cuserpayments = $userpayments->rowCount();

  $totalamount = 0;

} catch (PDOException $e) {
  echo "Error: " . $e->getMessage();
}

?>
<!DOCTYPE html>
<html>

<head>
  <style>
    @font-face {
      font-family: 'QuicksandRegular';
      src: url('./vendor/dompdf/dompdf/lib/fonts/Quicksand-Regular.ttf') format('truetype');
    }

    @font-face {
      font-family: 'QuicksandBold';
      src: url('./vendor/dompdf/dompdf/lib/fonts/Quicksand-Bold.ttf') format('truetype');
    }

    @font-face {
      font-family: 'QuicksandLight';
      src: url('./vendor/dompdf/dompdf/lib/fonts/Quicksand-Light.ttf') format('truetype');
    }

    @font-face {
      font-family: 'QuicksandMedium';
      src: url('./vendor/dompdf/dompdf/lib/fonts/Quicksand-Medium.ttf') format('truetype');
    }

    @font-face {
      font-family: 'QuicksandSemiBold';
      src: url('./vendor/dompdf/dompdf/lib/fonts/Quicksand-SemiBold.ttf') format('truetype');
    }

    *,
    body {
      font-family: "QuicksandRegular", sans-serif !important;
      font-size: 10px;
    }

    .title,
    .titleSchedule,
    .departmentTitle,
    .mainTitle {
      font-family: "QuicksandBold", sans-serif !important;
      font-size: 15px !important;
    }

    #customers {
      border-collapse: collapse;
      width: 100%;
    }

    #customers td,
    #customers th {
      border: 1px solid black;
      padding: 8px;
      text-wrap: wrap !important;
      width: 30px !important;
      font-size: 10px !important;
    }

    #customers .vl {
      background-color: orange !important;
    }

    #topTemplate {
      border-collapse: collapse;
      width: 100%;
    }

    #topTemplate td,
    #topTemplate th {
      text-wrap: wrap !important;
    }

    #headerTemplate {
      border-collapse: collapse;
      width: 100%;
    }

    #headerTemplate td,
    #headerTemplate th {
      text-wrap: wrap !important;
      padding: 11px;
    }

    /* 
    #customers tr:nth-child(even) {
      background-color: #f2f2f2;
    } */

    /** 
                Set the margins of the page to 0, so the footer and the header
                can be of the full height and width !
             **/
    @page {
      margin: 0cm 0cm;
    }

    /** Define now the real margins of every page in the PDF **/
    body {
      margin-top: 2cm;
      margin-left: 1cm;
      margin-right: 1cm;
      margin-bottom: 2cm;
    }

    /** Define the header rules **/
    header {
      position: fixed;
      top: 0cm;
      left: 0cm;
      right: 0cm;
      height: 1.5cm;

      /** Extra personal styles **/
      background-color: #f7f7f7;
      color: black;
      text-align: center;
    }

    /** Define the footer rules **/
    footer {
      position: fixed;
      bottom: 0cm;
      left: 0cm;
      right: 0cm;
      height: 1.5cm;

      /** Extra personal styles **/
      background-color: #f7f7f7;
      color: black;
      display: flex;
      align-items: center;
      text-align: center;
      line-height: 1cm;
    }

    .SystemNote {
      position: relative;
      left: 15px;
      bottom: 0px;
    }

    .SystemGen {
      position: relative;
      right: 15px;
      bottom: 0px;
    }

    .mainThGray {
      background-color: #e6e6e6 !important;
      font-weight: bolder !important;
    }

    .page-break {
      page-break-before: always;
    }

    .title {
      position: relative !important;
      top: 5px !important;
      left: -222px !important;
    }

    .titleSchedule {
      font-family: "QuicksandBold", sans-serif !important;
    }

    .titleScheduleAlt {
      padding-right: 4px !important;
    }

    .maternity {
      background-color: #ffe5cc !important;
      color: black !important;
      text-align: center !important;
      font-family: "QuicksandBold", sans-serif !important;
    }

    .text-start {
      text-align: start !important;
    }

    .text-right {
      text-align: right !important;
    }

    .text-center {
      text-align: center !important;
    }

    .fw-bolder {
      font-weight: bolder !important;
    }
  </style>
</head>

<body>
  <!-- Define header and footer blocks before your content -->
  <header>
    <table id="headerTemplate">
      <tr>
        <td colspan="2"><img src="<?php echo $_SERVER["DOCUMENT_ROOT"] . '/assets/media/logos/FIESTAAPPL_LOGO.png'; ?>" width="40" /></td>
      </tr>
    </table>
  </header>

  <footer>
    <div>
      <div style="float:left;" class="SystemNote">
        This document is system generated. Do not edit
      </div>
      <div style="float:right;" class="SystemGen">
        <?php echo $todaysDate; ?>
      </div>
    </div>
  </footer>

  <!-- Wrap the content of your PDF inside a main tag -->
  <main>
    <table id="topTemplate">
      <tr>
        <td class="text-center mainTitle" colspan="2">CASHIER PAYMENTS</td>
      </tr>
      <tr>
        <td class="text-right titleScheduleAlt" colspan="2">Inclusive Month/Days</td>
      </tr>
      <tr>
        <td class="text-right titleSchedule" colspan="2"><?php echo date("F d, Y", strtotime($idate)); ?> - <?php echo date("F d, Y", strtotime($edate)); ?></td>
      </tr>
    </table>

    <!-- <div class="title">SCHEDULE</div> -->
    <table id="customers" style="margin-top: 30px;">
      <tr class="text-start">
        <td class="mainThGray">Receipt Number</td>
        <td class="mainThGray">Processed Date</td>
        <td class="mainThGray">Cashier</td>
        <td class="mainThGray">Amount</td>
      </tr>
      <?php if ($cuserpayments > 0) { ?>
        <?php while ($ruserpayments = $userpayments->fetch(PDO::FETCH_ASSOC)) { ?>
          <tr class="text-start">
            <td><?php echo $ruserpayments["receiptNo"] ?></td>
            <td><?php echo date("F d, Y h:i A", strtotime($ruserpayments["processDate"])) ?></td>
            <td><?php echo $ruserpayments["CashierFullName"] ?></td>
            <td><?php echo $ruserpayments["amount"] ?></td>
          </tr>
          <?php $totalamount += $ruserpayments["amount"];?>
        <?php } ?>
        <tr class="text-start fw-bolder">
          <td colspan="3">Total</td>
          <td><?php echo number_format($totalamount, 2); ?></td>
        </tr>
      <?php } ?>

    </table>

    </div>
    <div class="page-break"></div>
  </main>
</body>

</html>