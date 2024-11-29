<?php

require '../../vendor/autoload.php';
include '../../app/connection/MYSQLSERVER.php';

use Dompdf\Dompdf;
use Dompdf\CPDF;
use Dompdf\Options;

$options = new Options();
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);
$dompdf->getOptions()->getChroot();
$dompdf->getOptions()->setChroot("C:\\laragon\\www\\devmanage-fiesta\\");

ob_start();
require('cp_n92nsjakjd.php');
$websiteContent = ob_get_contents();
ob_get_clean();

define("DOMPDF_ENABLE_REMOTE", false);

$dompdf->loadHtml($websiteContent);

$dompdf->setPaper('Letter', 'Portrait');

$dompdf->render();

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
    $uid = $_GET["uid"];

    $userprofile = $conn->prepare("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$uid'");
    $userprofile->execute();
    $cuserprofile = $userprofile->rowCount();
    $ruserprofile = $userprofile->fetch(PDO::FETCH_ASSOC);

    if ($cuserprofile > 0) {
        $fullname = $ruserprofile["userFullName"];
    }

    $dompdf->stream('customer_payments - '.$fullname.'.pdf', ["Attachment" => false]);
  } catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
  }

// $dompdf->stream();
// $dompdf->getCanvas()
//     ->get_cpdf()
//     ->setEncryption('s@password1', 's@password1', ['print', 'modify', 'copy', 'add']);

// $output = $dompdf->output();
// file_put_contents('dompdf_out.pdf', $output);

// $dompdf->stream();

exit(0);
