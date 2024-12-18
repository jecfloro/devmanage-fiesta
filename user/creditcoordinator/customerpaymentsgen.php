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
require('cp_82nskjdsdkm.php');
$websiteContent = ob_get_contents();
ob_get_clean();

define("DOMPDF_ENABLE_REMOTE", false);

$dompdf->loadHtml($websiteContent);

$dompdf->setPaper('Letter', 'Portrait');

$dompdf->render();

$dompdf->stream('Customer Payments.pdf', ["Attachment" => false]);

// $dompdf->stream();
// $dompdf->getCanvas()
//     ->get_cpdf()
//     ->setEncryption('s@password1', 's@password1', ['print', 'modify', 'copy', 'add']);

// $output = $dompdf->output();
// file_put_contents('dompdf_out.pdf', $output);

// $dompdf->stream();

exit(0);
