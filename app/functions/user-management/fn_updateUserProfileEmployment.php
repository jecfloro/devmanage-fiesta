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
    $ii_employmentemployerbusiness_1 = strtoupper($_POST['ii_employmentemployerbusiness_1']);
    $ii_employmenttelephonenumber_1 = $_POST['ii_employmenttelephonenumber_1'];
    $ii_employmentposition_1 = strtoupper($_POST['ii_employmentposition_1']);
    $ii_employmentyearsemployed_1 = $_POST['ii_employmentyearsemployed_1'];
    $ii_employmentemployerbusiness_2 = strtoupper($_POST['ii_employmentemployerbusiness_2']);
    $ii_employmenttelephonenumber_2 = $_POST['ii_employmenttelephonenumber_2'];
    $ii_employmentposition_2 = strtoupper($_POST['ii_employmentposition_2']);
    $ii_employmentyearsemployed_2 = $_POST['ii_employmentyearsemployed_2'];
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if ($set_1 == 1 && $set_2 == 0) {

            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = null, 
                telephoneNumber = null, 
                position = null, 
                yearsEmployed = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = '$ii_employmentemployerbusiness_1', 
                telephoneNumber = '$ii_employmenttelephonenumber_1', 
                position = '$ii_employmentposition_1', 
                yearsEmployed = '$ii_employmentyearsemployed_1'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        } 

        if ($set_1 == 0 && $set_2 == 1) {

            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = null, 
                telephoneNumber = null, 
                position = null, 
                yearsEmployed = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();
            
            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = null, 
                telephoneNumber = null, 
                position = null, 
                yearsEmployed = null
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = '$ii_employmentemployerbusiness_2', 
                telephoneNumber = '$ii_employmenttelephonenumber_2', 
                position = '$ii_employmentposition_2', 
                yearsEmployed = '$ii_employmentyearsemployed_2'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

        } 
        
        if ($set_1 == 1 && $set_2 == 1) { 

            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = '$ii_employmentemployerbusiness_1', 
                telephoneNumber = '$ii_employmenttelephonenumber_1', 
                position = '$ii_employmentposition_1', 
                yearsEmployed = '$ii_employmentyearsemployed_1'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 1");
            $update->execute();
            $cupdate = $update->rowCount();

            $update = $conn->prepare("UPDATE appsysusers_employment SET 
                employerName = '$ii_employmentemployerbusiness_2', 
                telephoneNumber = '$ii_employmenttelephonenumber_2', 
                position = '$ii_employmentposition_2', 
                yearsEmployed = '$ii_employmentyearsemployed_2'
                WHERE FK_appsysUsers = '$usercode' AND `order` = 2");
            $update->execute();
            $cupdate = $update->rowCount();

        }
       
        $updateinfo = $conn->prepare("UPDATE appsysusers SET 
            isEmploymentFilled = 1
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