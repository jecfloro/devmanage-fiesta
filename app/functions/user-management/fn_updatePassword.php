<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $usercode = $_SESSION['session_usercode'];
    $currentpassword = $_POST['currentpassword'];
    $newpassword = $_POST['newpassword'];
    
    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $select_user = $conn->query("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$usercode'");
        $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);

        if (count($rselect_user)) {

            if ($rselect_user[0]["isDisabled"] == 1) {
                $response = array('status' => 401, 'message' => "Account Locked, Please contact administrator!");
                echo json_encode($response);
            } else {

                $userpass = $rselect_user[0]["user_password"];

                $decpt_userpass = secureToken::tokendecrypt($userpass);

                if ($decpt_userpass === $currentpassword) {

                    $ii_userpass = secureToken::tokenencrypt($newpassword);
                    
                    $update = $conn->prepare("UPDATE appsysusers SET 
                        user_password = '$ii_userpass'
                        WHERE PK_appsysUsers = '$usercode'");
                    $update->execute();
                    $cupdate = $update->rowCount();

                    if ($cupdate > 0) {
                        $response = array('status' => 200, 'message' => "Password Updated!");
                        echo json_encode($response);
                    } else {
                        $response = array('status' => 200, 'message' => "Password Updated!");
                        echo json_encode($response);
                    }
                    
                } else {
                    $response = array('status' => 401, 'message' => "Authentication Failed");
                    echo json_encode($response);
                }
                
            }
            
        } else {
            $response = array('status' => 404, 'message' => "User not Found");
            echo json_encode($response);
        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    
    $conn = null;

?>