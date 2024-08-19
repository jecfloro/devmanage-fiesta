<?php

    include '../../connection/SQLSERVER.php';
    require '../../setting/AESCLASS.php';

    
    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $ii_usercode = $_POST['ii_usercode'];
    $ii_lastname = $_POST['ii_lastname'];
    $ii_firstname = $_POST['ii_firstname'];
    $ii_middlename = $_POST['ii_middlename'];
    $ii_suffixname = $_POST['ii_suffixname'];

    if ($ii_suffixname != "") {

        if ($ii_middlename == "") {
            $ii_fullname = $ii_lastname.", ".$ii_firstname." ".$ii_suffixname;
        }

        if ($ii_middlename != "") {
            $ii_fullname = $ii_lastname.", ".$ii_firstname." ".$ii_middlename." ".$ii_suffixname;
        }

    } 
    
    if ($ii_suffixname == "") {

        if ($ii_middlename == "") {
            $ii_fullname = $ii_lastname.", ".$ii_firstname;

        }

        if ($ii_middlename != "") {
            $ii_fullname = $ii_lastname.", ".$ii_firstname." ".$ii_middlename."";

        }

    }

    $ii_usergroup = $_POST['ii_usergroup'];
    $ii_department = $_POST['ii_department'];
    $ii_position = $_POST['ii_position'];

    try {
        $conn = new PDO("sqlsrv:server=$TS8_dbserver;database=$TS8_dbname", $TS8_dbuser, $TS8_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $select_user = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysUsers] WHERE [usercode] = '$ii_usercode'");
        $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);

        if (count($rselect_user) > 0) {
            $response = array('status' => 403, 'message' => "User Code already exists!");
            echo json_encode($response);
        } else {

            if ($rselect_user["pi_lastname"] == $ii_lastname && $rselect_user["pi_firstname"] == $ii_firstname) {
                $response = array('status' => 403, 'message' => "User details already exists!");
                echo json_encode($response);
            } else {

                $ii_userpass = secureToken::tokenencrypt("1234");
                $ii_lastnameencrypt = secureToken::tokenencrypt($ii_lastname);
                $ii_middlenameencrypt = secureToken::tokenencrypt($ii_middlename);
                $ii_firstnameencrypt = secureToken::tokenencrypt($ii_firstname);
                $ii_suffixnameencrypt = secureToken::tokenencrypt($ii_suffixname);
                $ii_fullnameencrypt = secureToken::tokenencrypt($ii_fullname);

                $insert = $conn->query("IF NOT EXISTS (SELECT * FROM [RMCI.SYS].[dbo].[appsysUsers] WHERE [usercode] = '$ii_usercode') BEGIN INSERT INTO [RMCI.SYS].[dbo].[appsysUsers] ([FK_appsysGroups], [FK_appsysDepartments], [FK_appsysPositions], [usercode], [userpass], [usertype], [systemHR], [sysHRemployeeaccess], [pi_lastname], [pi_middlename], [pi_firstname], [pi_suffixname], [pi_fullname]) VALUES ('$ii_usergroup','$ii_department','$ii_position', '$ii_usercode', '$ii_userpass', 0, 1, 1, '$ii_lastnameencrypt', '$ii_middlenameencrypt', '$ii_firstnameencrypt', '$ii_suffixnameencrypt', '$ii_fullnameencrypt') END");
                $insert->execute();

                mkdir("F:/$ii_fullname/", 0, true);

                $response = array('status' => 200, 'message' => "User Added!");
                echo json_encode($response);

            }

        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>