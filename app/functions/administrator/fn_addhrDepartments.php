<?php

    include '../../connection/SQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $ii_group = $_POST['ii_group'];
    $ii_departmentname = strtoupper($_POST['ii_departmentname']);

    try {
        $conn = new PDO("sqlsrv:server=$TS8_dbserver;database=$TS8_dbname", $TS8_dbuser, $TS8_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $select_department = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysDepartments] WHERE [department_name] = '$ii_departmentname'");
        $rselect_department = $select_department->fetchall(PDO::FETCH_ASSOC);

        if (count($rselect_department) <= 0) {

            $insert = $conn->query("IF NOT EXISTS (SELECT * FROM [RMCI.SYS].[dbo].[appsysDepartments] WHERE [department_name] = '$ii_departmentname') BEGIN INSERT INTO [RMCI.SYS].[dbo].[appsysDepartments] ([FK_appsysGroups], [department_name], [department_created]) VALUES ('$ii_group', '$ii_departmentname','$todaysDate') END");
            $insert->execute();

            $response = array('status' => 200, 'message' => "Department Added!");
            echo json_encode($response);

        } else if (count($rselect_department) > 0) {
            $response = array('status' => 403, 'message' => "Department already exists!");
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