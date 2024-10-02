<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];

    $homeownership_select = $_POST['homeownership_select'];
    $ii_homeownershipmonthlyamortization = $_POST['ii_homeownershipmonthlyamortization'];
    $ii_homeownershipmonthlyrental = $_POST['ii_homeownershipmonthlyrental'];
    $ii_homeownershiplandlord = strtoupper($_POST['ii_homeownershiplandlord']);
    $ii_homeownershipyearsstay = $_POST['ii_homeownershipyearsstay'];
    $ii_homeownershippreviousaddress = $_POST['ii_homeownershippreviousaddress'];
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $select = $conn->prepare("SELECT * FROM appsysusers_homeownership WHERE FK_appsysUsers = '$usercode'");
        $select->execute();
        $cselect = $select->rowCount();

        if ($cselect == 0) {

            $insert = $conn->prepare("INSERT INTO appsysusers_homeownership (FK_appsysUsers, selectedOption, monthlyAmortization, monthlyRental, landLord, yearsStay, previousAddress) VALUES ('$usercode', '$homeownership_select', '$ii_homeownershipmonthlyamortization', '$ii_homeownershipmonthlyrental', '$ii_homeownershiplandlord', '$ii_homeownershipyearsstay', '$ii_homeownershippreviousaddress')");
            $insert->execute();
            $cinsert = $insert->rowCount();

            if ($cinsert > 0) {
                $response = array('status' => 200, 'message' => "User Information Updated!");
                echo json_encode($response);
            } else {
                $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
                echo json_encode($response);
            }

        } else {

            $update = $conn->prepare("UPDATE appsysusers_homeownership SET 
                selectedOption = '$homeownership_select', 
                monthlyAmortization = '$ii_homeownershipmonthlyamortization', 
                monthlyRental = '$ii_homeownershipmonthlyrental', 
                landLord = '$ii_homeownershiplandlord', 
                yearsStay = '$ii_homeownershipyearsstay', 
                previousAddress = '$ii_homeownershippreviousaddress'
                WHERE FK_appsysUsers = '$usercode'");
            $update->execute();
            $cupdate = $update->rowCount();

            if ($cupdate > 0) {
                $response = array('status' => 200, 'message' => "Spouse Information Updated!");
                echo json_encode($response);
            } else {
                $response = array('status' => 200, 'message' => "Spouse Information Updated!");
                echo json_encode($response);
            }

        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>