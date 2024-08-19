<?php

    include '../../connection/SQLSERVER.php';
    require '../../setting/AESCLASS.php';

    
    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];

    $ii_useridedit = $_POST['ii_useridedit'];
    $ii_usercodeedit = $_POST['ii_usercodeedit'];
    $ii_newpasswordedit = $_POST['ii_newpasswordedit'];
    $ii_confirmpasswordedit = $_POST['ii_confirmpasswordedit'];
    $ii_emailaddressedit = strtolower($_POST['ii_emailaddressedit']);

    $ii_lastnameedit = strtoupper($_POST['ii_lastnameedit']);
    $ii_firstnameedit = strtoupper($_POST['ii_firstnameedit']);
    $ii_middlenameedit = strtoupper($_POST['ii_middlenameedit']);
    $ii_suffixnameedit = strtoupper($_POST['ii_suffixnameedit']);
    
    $ii_usergroupedit = $_POST['ii_usergroupedit'];
    $ii_departmentedit = $_POST['ii_departmentedit'];
    $ii_positionedit = $_POST['ii_positionedit'];

    // new fullname
    if ($ii_suffixnameedit != "") {

        if ($ii_middlenameedit == "") {
            $ii_fullnameedit = $ii_lastnameedit.", ".$ii_firstnameedit." ".$ii_suffixnameedit;
        }

        if ($ii_middlenameedit != "") {
            $ii_fullnameedit = $ii_lastnameedit.", ".$ii_firstnameedit." ".$ii_middlenameedit." ".$ii_suffixnameedit;
        }

    } 
    
    if ($ii_suffixnameedit == "") {

        if ($ii_middlenameedit == "") {
            $ii_fullnameedit = $ii_lastnameedit.", ".$ii_firstnameedit;

        }

        if ($ii_middlenameedit != "") {
            $ii_fullnameedit = $ii_lastnameedit.", ".$ii_firstnameedit." ".$ii_middlenameedit."";

        }

    }

    try {
        $conn = new PDO("sqlsrv:server=$TS8_dbserver;database=$TS8_dbname", $TS8_dbuser, $TS8_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $select_user = $conn->query("SELECT TOP (1000) a.[PK_appsysUsers]
            ,a.[FK_appsysGroups]
            ,a.[FK_appsysDepartments]
            ,a.[FK_appsysPositions]
            ,a.[usercode]
            ,a.[useremail]
            ,a.[pi_lastname]
            ,a.[pi_middlename]
            ,a.[pi_firstname]
            ,a.[pi_suffixname]
        FROM [RMCI.SYS].[dbo].[appsysUsers] 
        AS a JOIN [appsysGroups] 
        AS b ON a.FK_appsysGroups = b.PK_appsysGroups JOIN [appsysDepartments] 
        AS c ON a.FK_appsysDepartments = c.PK_appsysDepartments JOIN [appsysPositions]
        AS d ON a.FK_appsysPositions = d.PK_appsysPositions WHERE [PK_appsysUsers] = '$ii_useridedit'");
        $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);
        
        // Default value

        $default_PK_appsysUsers = $rselect_user[0]["PK_appsysUsers"];
        $default_FK_appsysGroups = $rselect_user[0]["FK_appsysGroups"];
        $default_FK_appsysDepartments = $rselect_user[0]["FK_appsysDepartments"];
        $default_FK_appsysPositions = $rselect_user[0]["FK_appsysPositions"];

        $default_usercode = $rselect_user[0]["usercode"];

        // decrypt value from database

        $decrypted_useremail = secureToken::tokendecrypt($rselect_user[0]["useremail"]);
        $decrypted_pi_lastname = secureToken::tokendecrypt($rselect_user[0]["pi_lastname"]);
        $decrypted_pi_middlename = secureToken::tokendecrypt($rselect_user[0]["pi_middlename"]);
        $decrypted_pi_firstname = secureToken::tokendecrypt($rselect_user[0]["pi_firstname"]);
        $decrypted_pi_suffixname = secureToken::tokendecrypt($rselect_user[0]["pi_suffixname"]);

        if ($decrypted_pi_suffixname != "") {

            if ($decrypted_pi_middlename == "") {
                $ii_fullname = $decrypted_pi_lastname.", ".$decrypted_pi_firstname." ".$decrypted_pi_suffixname;
            }
    
            if ($decrypted_pi_middlename != "") {
                $ii_fullname = $decrypted_pi_lastname.", ".$decrypted_pi_firstname." ".$decrypted_pi_middlename." ".$decrypted_pi_suffixname;
            }
    
        } 
        
        if ($decrypted_pi_suffixname == "") {
    
            if ($decrypted_pi_middlename == "") {
                $ii_fullname = $decrypted_pi_lastname.", ".$decrypted_pi_firstname;
    
            }
    
            if ($decrypted_pi_middlename != "") {
                $ii_fullname = $decrypted_pi_lastname.", ".$decrypted_pi_firstname." ".$decrypted_pi_middlename."";
    
            }
    
        }

        // verify the new user code if it's already existed
        if ($ii_usercodeedit !== $default_usercode) {
            
            $verify_usercode = $conn->query("SELECT TOP (1000) [usercode]
            FROM [RMCI.SYS].[dbo].[appsysUsers] WHERE [usercode] = '$ii_usercodeedit'");
            $rverify_usercode = $verify_usercode->fetchall(PDO::FETCH_ASSOC);

            if (count($rverify_usercode) > 0) {
                $response = array('status' => 403, 'message' => "User Code already exists!");
                echo json_encode($response);
                exit();
            }

        }

        // Change Password

        if ($ii_newpasswordedit != "") {

            $ii_userpass = secureToken::tokenencrypt($ii_newpasswordedit);

            $edit_password = $conn->query("UPDATE [RMCI.SYS].[dbo].[appsysUsers] SET [userpass] = '$ii_userpass' WHERE [PK_appsysUsers] = '$ii_useridedit'");
            $edit_password->execute();

        }

        // Encrypt Information

        $ii_emailencrypt = secureToken::tokenencrypt($ii_emailaddressedit);
        $ii_lastnameencrypt = secureToken::tokenencrypt($ii_lastnameedit);
        $ii_middlenameencrypt = secureToken::tokenencrypt($ii_middlenameedit);
        $ii_firstnameencrypt = secureToken::tokenencrypt($ii_firstnameedit);
        $ii_suffixnameencrypt = secureToken::tokenencrypt($ii_suffixnameedit);
        $ii_fullnameencrypt = secureToken::tokenencrypt($ii_fullnameedit);

        // Update Information

        $edit_information = $conn->query("UPDATE [RMCI.SYS].[dbo].[appsysUsers] SET 
        [FK_appsysGroups] = '$ii_usergroupedit', 
        [FK_appsysDepartments] = '$ii_departmentedit', 
        [FK_appsysPositions] = '$ii_positionedit',
        [usercode] = '$ii_usercodeedit',
        [useremail] = '$ii_emailencrypt',
        [pi_lastname] = '$ii_lastnameencrypt',
        [pi_middlename] = '$ii_middlenameencrypt',
        [pi_firstname] = '$ii_firstnameencrypt',
        [pi_suffixname] = '$ii_suffixnameencrypt',
        [pi_fullname] = '$ii_fullnameencrypt' WHERE [PK_appsysUsers] = '$ii_useridedit' 
        ");
        $edit_information->execute();
        $cedit_information = $edit_information->rowCount();

        // verify lastname, firstname etc., if not same then proceed to renaming the folder on file server

        if ($ii_suffixnameedit != "") {
            rename("F:/$ii_fullname/", "F:/$ii_fullnameedit/");
        } else {
            rename("F:/$ii_fullname/", "F:/$ii_fullnameedit/");
        }

        if ($cedit_information > 0) {
            $response = array('status' => 200, 'message' => "User Information Updated!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }
        

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>