<?php

    include '../../connection/MYSQLSERVER.php';
    require '../../setting/AESCLASS.php';

    date_default_timezone_set("Asia/Manila");
    $year_start = date("Y");
    $year_end = date("Y")+1;
    $date = date("Y-m-d");
    $todaysDate = date("Y-m-d H:i:s");

    $user_email = $_POST['user_email'];
    $user_password = $_POST['user_password'];

    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $select_user = $conn->query("SELECT * FROM appsysusers WHERE user_email = '$user_email'");
        $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);

        if (count($rselect_user)) {

            if ($rselect_user[0]["isDisabled"] == 1) {
                $response = array('status' => 401, 'message' => "Account Locked, Please contact administrator!");
                echo json_encode($response);
            } else {

                $usercode = $rselect_user[0]["PK_appsysUsers"];
                $userpass = $rselect_user[0]["user_password"];
                $userdisabled = $rselect_user[0]["isDisabled"];
                $useradmin = $rselect_user[0]["isAdmin"];
                $usercustomer = $rselect_user[0]["isCustomer"];
                $userbranchmanager = $rselect_user[0]["isBranchManager"];
                $usercreditinvestigator = $rselect_user[0]["isCreditInvestigator"];
                $usercreditcoordinator = $rselect_user[0]["isCreditCoordinator"];
                $usercashier = $rselect_user[0]["isCashier"];
                
                $decpt_userpass = secureToken::tokendecrypt($userpass);

                if ($decpt_userpass === $user_password) {
                    
                    if ($rselect_user[0]["isActivated"] == 0) {
                        $response = array('status' => 401, 'message' => "Please check your email to actiate your account!");
                        echo json_encode($response);
                    } else {

                        $_SESSION['session_usercode'] = $usercode;
    
                        $_SESSION['isLoggedIn'] = 1;
                        $_SESSION['isDisabled'] = $userdisabled;

                        $_SESSION['isAdmin'] = $useradmin;
                        $_SESSION['isCustomer'] = $usercustomer;
                        $_SESSION['isBranchManager'] = $userbranchmanager;
                        $_SESSION['isCreditInvestigator'] = $usercreditinvestigator;
                        $_SESSION['isCreditCoordinator'] = $usercreditcoordinator;
                        $_SESSION['isCashier'] = $usercashier;
                        
                        $response = array('status' => 200, 'message' => "Authentication Success");
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