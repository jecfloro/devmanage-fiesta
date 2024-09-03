<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

require('../../../vendor/autoload.php');

include_once __DIR__ . '/../../src/FixedBitNotation.php';
include_once __DIR__ . '/../../src/GoogleAuthenticator.php';
include_once __DIR__ . '/../../src/GoogleQrUrl.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require '../../../vendor/phpmailer/phpmailer/src/Exception.php';
require '../../../vendor/phpmailer/phpmailer/src/PHPMailer.php';
require '../../../vendor/phpmailer/phpmailer/src/SMTP.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ii_emailaddress = $_POST['ii_emailaddress'];
$select_usertype = $_POST['select_usertype'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_email = $conn->query("SELECT * FROM appsysusers WHERE user_email = '$ii_emailaddress'");
    $rselect_email = $select_email->fetchall(PDO::FETCH_ASSOC);

    if (count($rselect_email) > 0) {
        $response = array('status' => 404, 'message' => "Email already exists!");
        echo json_encode($response);
    } else {

        $randomPassword = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 1, 6);
        $ii_password = secureToken::tokenencrypt($randomPassword);
        $recoveryCode = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 1, 10);
        $activationCode = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 1, 30);

        $generateSecret = new \Sonata\GoogleAuthenticator\GoogleAuthenticator();
        $secret = $generateSecret->generateSecret();

        if ($select_usertype == "Administrator") {
            $isUserType = "isAdmin";
        }
        if ($select_usertype == "Cashier") {
            $isUserType = "isCashier";
        }
        if ($select_usertype == "Credit Coordinator") {
            $isUserType = "isCreditCoordinator";
        }
        if ($select_usertype == "Credit Investigator") {
            $isUserType = "isCreditInvestigator";
        }
        if ($select_usertype == "Branch Manager") {
            $isUserType = "isBranchManager";
        }

        $mail = new PHPMailer(true);

        $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                       //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'supp.eservices@gmail.com';            //SMTP username
        $mail->Password   = 'bgoakrtuecrwtufz';                     //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;

        //Recipients
        $mail->setFrom('supp.eservices@gmail.com', 'Fiest Appliances Support: Administrator');
        $mail->addAddress($ii_emailaddress);     //Add a recipient
        $mail->addReplyTo('noreply@gmail.com', 'Do Not Reply To This Email');

        //Content
        $mail->isHTML(true);                                        //Set email format to HTML
        $mail->Subject = 'Fiest Appliances Center, Inc.';
        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = 'Fiest Appliances Center, Inc. - Account Activation';
        $mail->Body    = '<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <style type="text/css">
        @media only screen and (max-width: 550px) {
        .responsive_at_550 {
        width: 90% !important;
        max-width: 90% !important;
        }
        }
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="font-family:"Quicksand"; font-size:20px; color:#202020; font-weight:bold; padding-left:20px; padding-right:20px;">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tbody>
            <tr>
                <td align="center">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                        <tbody>
                            <tr>
                                <td width="100%" align="center">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tbody>
                                            <tr>
                                                <td height="40">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tbody>
                                            <tr>
                                                <td height="40">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table width="500" border="0" cellpadding="0" cellspacing="0" align="center" style="padding-left:20px; padding-right:20px;" class="responsive_at_550">
                                        <tbody>
                                            <tr>
                                                <td align="center" bgcolor="#f0f7f0">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td width="100%" height="7" align="center" border="0" bgcolor="#458C41"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td height="30">&nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    Fiesta Appliances 
                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td width="100%" align="center">
                                                                    <h1 style="padding-top: 20px;">Thank you for Registration!</h1>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td width="100%" align="center">
                                                                    <p style="font-size:14px; color:#202020; padding-left:20px; padding-right:20px; text-align: center;">Your password is: 123213</p>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td height="30">&nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width="200" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td align="center" bgcolor="#458C41">
                                                                    <a style="display:block; color:#ffffff; font-size:14px; font-weight:bold; text-decoration:none; padding-left:20px; padding-right:20px; padding-top:20px; padding-bottom:20px;" href="https://devproject.dev/v-account-activation.php?activation_token='.$activationCode.'">Verify E-mail Address</a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td height="30">&nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tbody>
                                            <tr>
                                                <td height="40">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tbody>
                                            <tr>
                                                <td height="40">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>';

        $mail->send();

        $insert = $conn->prepare("INSERT INTO `appsysusers` (user_email, user_password, $isUserType, user_recoveryCode, user_activationCode) VALUES ('$ii_emailaddress', '$ii_password', 1, '$recoveryCode', '$activationCode')");
        $insert->execute();
        $cinsert = $insert->rowCount();

        if ($cinsert > 0) {
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
