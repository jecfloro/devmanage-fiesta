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
        
        $select = $conn->prepare("SELECT * FROM mn_installments WHERE FK_appsysUsers = '$usercode' AND PK_mn_installments = '$dataid'");
        $select->execute();
        $cselect = $select->rowCount();

        if ($cselect > 0) {

            $rselect = $select->fetch(PDO::FETCH_ASSOC);

            if ($rselect["installmentStatus"] == "APPROVED") {
                $response = array('status' => 500, 'message' => "Installment already approved!");
                echo json_encode($response);
            }

            if ($rselect["installmentStatus"] == "PENDING") {

                $update = $conn->prepare("UPDATE mn_installments SET installmentStatus = 'CANCELLED', cancelledDate = '$todaysDate' WHERE PK_mn_installments = '$dataid'");
                $update->execute();
                $cupdate = $update->rowCount();

                if ($cupdate > 0) {
                    $response = array('status' => 200, 'message' => "Installment cancelled!");
                    echo json_encode($response);
                } else {
                    $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
                    echo json_encode($response);
                }
                
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