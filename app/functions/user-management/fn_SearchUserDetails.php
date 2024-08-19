<?php

    include '../../connection/SQLSERVER.php';
    require '../../setting/AESCLASS.php';

    
    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $UserID = $_POST['UserID'];

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
        AS d ON a.FK_appsysPositions = d.PK_appsysPositions WHERE [PK_appsysUsers] = '$UserID'");
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

        if (count($rselect_user) > 0) {
            $response = array('status' => 200, 
            'default_PK_appsysUsers' => $default_PK_appsysUsers,
            'default_FK_appsysGroups' => $default_FK_appsysGroups,
            'default_FK_appsysDepartments' => $default_FK_appsysDepartments,
            'default_FK_appsysPositions' => $default_FK_appsysPositions,
            'default_usercode' => $default_usercode,
            'decrypted_useremail' => $decrypted_useremail,
            'decrypted_pi_lastname' => $decrypted_pi_lastname,
            'decrypted_pi_middlename' => $decrypted_pi_middlename,
            'decrypted_pi_firstname' => $decrypted_pi_firstname,
            'decrypted_pi_suffixname' => $decrypted_pi_suffixname,
            );
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