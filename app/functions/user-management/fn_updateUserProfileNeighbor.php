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
    $ii_neighborsname_1 = strtoupper($_POST['ii_neighborsname_1']);
    $ii_neighborsaddress_1 = strtoupper($_POST['ii_neighborsaddress_1']);
    $ii_neighborscpnumber_1 = $_POST['ii_neighborscpnumber_1'];
    $ii_neighborsname_2 = strtoupper($_POST['ii_neighborsname_2']);
    $ii_neighborsaddress_2 = strtoupper($_POST['ii_neighborsaddress_2']);
    $ii_neighborscpnumber_2 = $_POST['ii_neighborscpnumber_2']; 
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Execute if set number has a value of 0

        if ($set_1 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_neighbors SET 
                rname = null, 
                raddress = null, 
                cellphoneNumber = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_2 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_neighbors SET 
                rname = null, 
                raddress = null, 
                cellphoneNumber = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        // Execute if set number has a value of 1

        if ($set_1 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_neighbors SET 
                rname = '$ii_neighborsname_1', 
                raddress = '$ii_neighborsaddress_1', 
                cellphoneNumber = '$ii_neighborscpnumber_1'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_2 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_neighbors SET 
                rname = '$ii_neighborsname_2', 
                raddress = '$ii_neighborsaddress_2', 
                cellphoneNumber = '$ii_neighborscpnumber_2'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_1 == 1 || $set_2 == 1) {
            
            $updateinfo = $conn->prepare("UPDATE appsysusers SET 
                isNeighborFilled = 1
                WHERE PK_appsysUsers = '$usercode'");
            $updateinfo->execute();
            
        }

        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Neighbors Information Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 200, 'message' => "Neighbors Information Updated!");
            echo json_encode($response);
        }


    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>