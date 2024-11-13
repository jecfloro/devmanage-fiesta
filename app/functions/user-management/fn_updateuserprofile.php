<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];

    $ii_lastname = strtoupper($_POST['ii_lastname']);
    $ii_firstname = strtoupper($_POST['ii_firstname']);
    $ii_middlename = strtoupper($_POST['ii_middlename']);
    $ii_nickname = strtoupper($_POST['ii_nickname']);
    $select_gender = $_POST['select_gender'];
    $select_civilstatus = strtoupper($_POST['select_civilstatus']);
    $ii_nationality = strtoupper($_POST['ii_nationality']);
    $ii_age = $_POST['ii_age'];
    $ii_birthdate = $_POST['ii_birthdate'];
    $ii_placeofbirth = strtoupper($_POST['ii_placeofbirth']);
    $ii_contactnumber = $_POST['ii_contactnumber'];
    $ii_address = strtoupper($_POST['ii_address']);
    $region_code = $_POST['region_code'];
    $province_code = $_POST['province_code'];
    $city_code = $_POST['city_code'];
    $barangay_code = $_POST['barangay_code'];
    $region = strtoupper($_POST['region']);
    $province = strtoupper($_POST['province']);
    $city = strtoupper($_POST['city']);
    $barangay = strtoupper($_POST['barangay']);
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        if ($ii_middlename == "") {
            $ii_fullname = $ii_lastname.", ".$ii_firstname;
        }

        if ($ii_middlename != "") {
            $ii_fullname = $ii_lastname.", ".$ii_firstname." ".$ii_middlename;
        }

        $update = $conn->prepare("UPDATE appsysusers SET 
            userLastname = '$ii_lastname', 
            userFirstName = '$ii_firstname', 
            userMiddleName = '$ii_middlename', 
            userNickName = '$ii_nickname', 
            userGender = '$select_gender', 
            userCivilStatus = '$select_civilstatus', 
            userNationality = '$ii_nationality', 
            userAge = '$ii_age', 
            userDateofBirth = '$ii_birthdate', 
            userPlaceofBirth = '$ii_placeofbirth', 
            userContactNumber = '$ii_contactnumber', 
            userAddress = '$ii_address', 
            userRegionCode = '$region_code', 
            userRegion = '$region', 
            userProvinceCode = '$province_code', 
            userProvince = '$province', 
            userCityCode = '$city_code', 
            userCity = '$city', 
            userBarangayCode = '$barangay_code', 
            userBarangay = '$barangay', 
            userFullName = '$ii_fullname' 
            WHERE PK_appsysUsers = '$usercode'");
        $update->execute();
        $cupdate = $update->rowCount();

        if ($cupdate > 0) {

            $updateinfo = $conn->prepare("UPDATE appsysusers SET 
                isProfileFilled = 1
                WHERE PK_appsysUsers = '$usercode'");
            $updateinfo->execute();

            $response = array('status' => 200, 'message' => "User Information Updated!");
            echo json_encode($response);
        } else {

            $updateinfo = $conn->prepare("UPDATE appsysusers SET 
                isProfileFilled = 1
                WHERE PK_appsysUsers = '$usercode'");
            $updateinfo->execute();
            
            $response = array('status' => 200, 'message' => "User Information Updated!");
            echo json_encode($response);
        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>