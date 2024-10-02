<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];

    $ii_spouselastname = strtoupper($_POST['ii_spouselastname']);
    $ii_spousefirstname = strtoupper($_POST['ii_spousefirstname']);
    $ii_spousemiddlename = strtoupper($_POST['ii_spousemiddlename']);
    $ii_spousenickname = strtoupper($_POST['ii_spousenickname']);
    $select_spousegender = $_POST['select_spousegender'];
    $select_spousecivilstatus = strtoupper($_POST['select_spousecivilstatus']);
    $ii_spousenationality = strtoupper($_POST['ii_spousenationality']);
    $ii_spouseage = $_POST['ii_spouseage'];
    $ii_spousebirthdate = $_POST['ii_spousebirthdate'];
    $ii_spouseplaceofbirth = strtoupper($_POST['ii_spouseplaceofbirth']);
    $ii_spousecontactnumber = $_POST['ii_spousecontactnumber'];
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        if ($ii_spousemiddlename == "") {
            $ii_fullname = $ii_spouselastname.", ".$ii_spousefirstname;
        }

        if ($ii_spousemiddlename != "") {
            $ii_fullname = $ii_spouselastname.", ".$ii_spousefirstname." ".$ii_spousemiddlename;
        }

        $select = $conn->prepare("SELECT * FROM appsysusers_spouse WHERE FK_appsysUsers = '$usercode'");
        $select->execute();
        $cselect = $select->rowCount();

        if ($cselect == 0) {

            $insert = $conn->prepare("INSERT INTO appsysusers_spouse (FK_appsysUsers, lastName, firstName, middleName, nickName, fullName, gender, civilStatus, nationality, age, birthdate, placeofBirth, contactNumber) VALUES ('$usercode', '$ii_spouselastname', '$ii_spousefirstname', '$ii_spousemiddlename', '$ii_spousenickname', '$ii_fullname', '$select_spousegender', '$select_spousecivilstatus', '$ii_spousenationality', '$ii_spouseage', '$ii_spousebirthdate', '$ii_spouseplaceofbirth', '$ii_spousecontactnumber')");
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

            $update = $conn->prepare("UPDATE appsysusers_spouse SET 
                lastName = '$ii_spouselastname', 
                firstName = '$ii_spousefirstname', 
                middleName = '$ii_spousemiddlename', 
                nickName = '$ii_spousenickname', 
                fullName = '$ii_fullname', 
                gender = '$select_spousegender', 
                civilStatus = '$select_spousecivilstatus', 
                nationality = '$ii_spousenationality', 
                age = '$ii_spouseage', 
                birthdate = '$ii_spousebirthdate', 
                placeofBirth = '$ii_spouseplaceofbirth', 
                contactNumber = '$ii_spousecontactnumber' 
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