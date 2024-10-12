<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];

    $set_1 = $_POST['set_1'];
    $set_2 = $_POST['set_2'];
    $ii_personalfname_1 = strtoupper($_POST['ii_personalfname_1']);
    $ii_personalfage_1 = $_POST['ii_personalfage_1'];
    $ii_personaladdress_1 = strtoupper($_POST['ii_personaladdress_1']);
    $ii_personalemployer_1 = strtoupper($_POST['ii_personalemployer_1']);
    $ii_personalemployeraddress_1 = strtoupper($_POST['ii_personalemployeraddress_1']);
    $ii_personalmname_2 = strtoupper($_POST['ii_personalmname_2']);
    $ii_personalmage_2 = $_POST['ii_personalmage_2'];
    $ii_personaladdress_2 = strtoupper($_POST['ii_personaladdress_2']);
    $ii_personalemployer_2 = strtoupper($_POST['ii_personalemployer_2']);
    $ii_personalemployeraddress_2 = strtoupper($_POST['ii_personalemployeraddress_2']);
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if ($set_1 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_personalpref SET 
                pname = '$ii_personalfname_1', 
                age = '$ii_personalfage_1', 
                homeAddress = '$ii_personaladdress_1', 
                employer = '$ii_personalemployer_1', 
                employerAddress = '$ii_personalemployeraddress_1'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_2 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_personalpref SET 
                pname = '$ii_personalmname_2', 
                age = '$ii_personalmage_2', 
                homeAddress = '$ii_personaladdress_2', 
                employer = '$ii_personalemployer_2', 
                employerAddress = '$ii_personalemployeraddress_2'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

        }
       
        $updateinfo = $conn->prepare("UPDATE appsysusers SET 
            isPersonalPrefFilled = 1
            WHERE PK_appsysUsers = '$usercode'");
        $updateinfo->execute();

        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Employment Information Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 200, 'message' => "Employment Information Updated!");
            echo json_encode($response);
        }


    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>