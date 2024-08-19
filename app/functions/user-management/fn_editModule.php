<?php

    include '../../connection/SQLSERVER.php';
    require '../../setting/AESCLASS.php';

    
    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $ii_useridmodule = $_POST['ii_useridmodule'];
    $chkbxAdministrativeAccess = $_POST['chkbxAdministrativeAccess'];
    $chkbxHRAccess = $_POST['chkbxHRAccess'];
    $chkbxAccountingAccess = $_POST['chkbxAccountingAccess'];
    $chkMedicalRecordsAccess = $_POST['chkMedicalRecordsAccess'];
    $chkbxBillingAccess = $_POST['chkbxBillingAccess'];
    $chkbxGrantDepartmentHead = $_POST['chkbxGrantDepartmentHead'];
    $chkbxGrantHRAdmin = $_POST['chkbxGrantHRAdmin'];
    $chkbxGrantHRSchedule = $_POST['chkbxGrantHRSchedule'];
    $chkbxGrantHRApproval = $_POST['chkbxGrantHRApproval'];

    try {
        $conn = new PDO("sqlsrv:server=$TS8_dbserver;database=$TS8_dbname", $TS8_dbuser, $TS8_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $edit_module = $conn->query("UPDATE [RMCI.SYS].[dbo].[appsysUsers] SET
        [usertype] = '$chkbxAdministrativeAccess',
        [systemHR] = '$chkbxHRAccess', 
        [systemBilling] = '$chkbxBillingAccess',
        [systemMedicalRecords] = '$chkMedicalRecordsAccess',
        [systemAccounting] = '$chkbxAccountingAccess',
        [sysHRadminaccess] = '$chkbxGrantHRAdmin',
        [sysHRdepartmentHead] = '$chkbxGrantDepartmentHead',
        [sysHRscheduleAdd] = '$chkbxGrantHRSchedule',
        [sysHRscheduleApproval] = '$chkbxGrantHRApproval'
        WHERE [PK_appsysUsers] = '$ii_useridmodule'");
        $edit_module->execute();
        $cedit_module = $edit_module->rowCount();

        if ($cedit_module > 0) {
            $response = array('status' => 200, 'message' => "Access Updated!");
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