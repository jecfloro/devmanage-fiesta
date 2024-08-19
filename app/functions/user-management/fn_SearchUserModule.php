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

        $usertype = $rselect_user[0]["usertype"];
        $systemHR = $rselect_user[0]["systemHR"];
        $systemBilling = $rselect_user[0]["systemBilling"];
        $systemMedicalRecords = $rselect_user[0]["systemMedicalRecords"];
        $systemAccounting = $rselect_user[0]["systemAccounting"];
        $sysHRadminaccess = $rselect_user[0]["sysHRadminaccess"];
        $sysHRdepartmentHead = $rselect_user[0]["sysHRdepartmentHead"];
        $sysHRscheduleAdd = $rselect_user[0]["sysHRscheduleAdd"];
        $sysHRscheduleApproval = $rselect_user[0]["sysHRscheduleApproval"];

        $response = array('status' => 200, 
            'usertype' => $usertype, 
            'systemHR' => $systemHR, 
            'systemBilling' => $systemBilling,
            'systemMedicalRecords' => $systemMedicalRecords,
            'systemAccounting' => $systemAccounting,
            'sysHRadminaccess' => $sysHRadminaccess,
            'sysHRdepartmentHead' => $sysHRdepartmentHead,
            'sysHRscheduleAdd' => $sysHRscheduleAdd,
            'sysHRscheduleApproval' => $sysHRscheduleApproval
        );
        echo json_encode($response);

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>