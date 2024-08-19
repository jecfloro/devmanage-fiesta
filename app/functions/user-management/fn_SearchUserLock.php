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
        
        $select_user = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysUsers] WHERE [PK_appsysUsers] = '$UserID'");
        $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);

        $lockaccount = $rselect_user[0]["lockaccount"];

        if ($lockaccount == 1) {
            $message = "Type 'Confirm' to unlock";
        } else {
            $message = "Type 'Confirm' to lock";
        }
        
        $response = array('status' => 200, 
            'lockaccount' => $lockaccount,
            'message' => $message,
        );
        echo json_encode($response);

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>