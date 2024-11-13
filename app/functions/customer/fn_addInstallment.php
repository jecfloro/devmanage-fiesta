<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];
    $dataid = $_POST['dataid'];
    $dataprice = $_POST['dataprice'];
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $select = $conn->prepare("SELECT SUM(CASE WHEN installmentStatus = 'PENDING' THEN 1 ELSE 0 END) AS pendingTotal, SUM(CASE WHEN installmentStatus = 'APPROVED' THEN 1 ELSE 0 END) approvedTotal FROM  mn_installments WHERE FK_appsysUsers = '$usercode' AND FK_mscProducts = '$dataid'");
        $select->execute();
        $cselect = $select->rowCount();

        if ($cselect > 0) {

            $rselect = $select->fetch(PDO::FETCH_ASSOC);

            if ($rselect["pendingTotal"] == 0 && $rselect["approvedTotal"] == 0) {

                $installmentCode = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 1, 20);
    
                $insert = $conn->prepare("INSERT INTO mn_installments (FK_appsysUsers, FK_mscProducts, installmentCode, productPrice, requestedDate, installmentStatus) VALUES ('$usercode', '$dataid', '$installmentCode', '$dataprice', '$todaysDate', 'PENDING')");
                $insert->execute();
                $cinsert = $insert->rowCount();
    
                if ($cinsert > 0) {
                    $response = array('status' => 200, 'message' => "Installment Request Added!");
                    echo json_encode($response);
                } else {
                    $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
                    echo json_encode($response);
                }
                
            } else {
                $response = array('status' => 409, 'message' => "Installment Request already exists!");
                echo json_encode($response);
            }

        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>