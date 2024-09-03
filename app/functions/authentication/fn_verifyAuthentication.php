<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

require('../../../vendor/autoload.php');

include_once __DIR__ . '/../../src/FixedBitNotation.php';
include_once __DIR__ . '/../../src/GoogleAuthenticator.php';
include_once __DIR__ . '/../../src/GoogleQrUrl.php';

$generateSecret = new \Sonata\GoogleAuthenticator\GoogleAuthenticator();

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$usercode = $_SESSION['session_usercode'];
$code = $_POST['code'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_user = $conn->query("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$usercode'");
    $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);

    if (count($rselect_user)) {

        $usersecret = $rselect_user[0]["user_secret"];

        if ($generateSecret->checkCode($usersecret, $code)) {

            setcookie("PHPSESSCOOKIE", $usersecret, time() + 3600, "/");
            $response = array('status' => 200, 'message' => "Authentication Success!");
            echo json_encode($response);

        } else {
            $response = array('status' => 401, 'message' => "Authentication Failed!");
            echo json_encode($response);
        }

    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
