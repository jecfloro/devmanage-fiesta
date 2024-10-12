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
    $set_3 = $_POST['set_3'];
    $set_4 = $_POST['set_4'];
    $set_5 = $_POST['set_5'];
    $ii_childrenname_1 = strtoupper($_POST['ii_childrenname_1']);
    $ii_childrenage_1 = $_POST['ii_childrenage_1'];
    $ii_childrengraduate_1 = $_POST['ii_childrengraduate_1'];
    $ii_childrenschool_1 = strtoupper($_POST['ii_childrenschool_1']);
    $ii_childrenname_2 = strtoupper($_POST['ii_childrenname_2']);
    $ii_childrenage_2 = $_POST['ii_childrenage_2'];
    $ii_childrengraduate_2 = $_POST['ii_childrengraduate_2'];
    $ii_childrenschool_2 = strtoupper($_POST['ii_childrenschool_2']);
    $ii_childrenname_3 = strtoupper($_POST['ii_childrenname_3']);
    $ii_childrenage_3 = $_POST['ii_childrenage_3'];
    $ii_childrengraduate_3 = $_POST['ii_childrengraduate_3'];
    $ii_childrenschool_3 = strtoupper($_POST['ii_childrenschool_3']);
    $ii_childrenname_4 = strtoupper($_POST['ii_childrenname_4']);
    $ii_childrenage_4 = $_POST['ii_childrenage_4'];
    $ii_childrengraduate_4 = $_POST['ii_childrengraduate_4'];
    $ii_childrenschool_4 = strtoupper($_POST['ii_childrenschool_4']);
    $ii_childrenname_5 = strtoupper($_POST['ii_childrenname_5']);
    $ii_childrenage_5 = $_POST['ii_childrenage_5'];
    $ii_childrengraduate_5 = $_POST['ii_childrengraduate_5'];
    $ii_childrenschool_5 = strtoupper($_POST['ii_childrenschool_5']);
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Execute if set number has a value of 0

        if ($set_1 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = null, 
                age = null, 
                graduateYear = null, 
                school = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_2 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = null, 
                age = null, 
                graduateYear = null, 
                school = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

        }
        
        if ($set_3 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = null, 
                age = null, 
                graduateYear = null, 
                school = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 3");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_4 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = null, 
                age = null, 
                graduateYear = null, 
                school = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 4");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_5 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = null, 
                age = null, 
                graduateYear = null, 
                school = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 5");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        // Execute if set number has a value of 1

        if ($set_1 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = '$ii_childrenname_1', 
                age = '$ii_childrenage_1', 
                graduateYear = '$ii_childrengraduate_1', 
                school = '$ii_childrenschool_1'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_2 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = '$ii_childrenname_2', 
                age = '$ii_childrenage_2', 
                graduateYear = '$ii_childrengraduate_2', 
                school = '$ii_childrenschool_2'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_3 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = '$ii_childrenname_3', 
                age = '$ii_childrenage_3', 
                graduateYear = '$ii_childrengraduate_3', 
                school = '$ii_childrenschool_3'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 3");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_4 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = '$ii_childrenname_4', 
                age = '$ii_childrenage_4', 
                graduateYear = '$ii_childrengraduate_4', 
                school = '$ii_childrenschool_4'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 4");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_5 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_children SET 
                cname = '$ii_childrenname_5', 
                age = '$ii_childrenage_5', 
                graduateYear = '$ii_childrengraduate_5', 
                school = '$ii_childrenschool_5'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 5");
            $update->execute();
            $cupdate = $update->rowCount();

        }

        if ($set_1 == 1 || $set_2 == 1 || $set_3 == 1 || $set_4 == 1 || $set_5 == 1) {
            
            $updateinfo = $conn->prepare("UPDATE appsysusers SET 
                isChildrenFilled = 1
                WHERE PK_appsysUsers = '$usercode'");
            $updateinfo->execute();

        }

        if ($set_1 == 0 || $set_2 == 0 || $set_3 == 0 || $set_4 == 0 || $set_5 == 0) {
            
            $updateinfo = $conn->prepare("UPDATE appsysusers SET 
                isChildrenFilled = null
                WHERE PK_appsysUsers = '$usercode'");
            $updateinfo->execute();

        }
       
        if ($cupdate > 0) {
            $response = array('status' => 200, 'message' => "Children Information Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 200, 'message' => "Children Information Updated!");
            echo json_encode($response);
        }


    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>