<?php

    include '../connection/MYSQLSERVER.php';

    $usercode = $_SESSION['session_usercode'];

    try {
        $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
        $userprofile = $conn->prepare("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$usercode'");
        $userprofile->execute();
        $cuserprofile = $userprofile->rowCount();
        $ruserprofile = $userprofile->fetch(PDO::FETCH_ASSOC);
    
        if ($cuserprofile > 0) {
            $isSecret = $ruserprofile["isSecret"];
            $user_secret = $ruserprofile["user_secret"];
        }

        if ($_COOKIE["PHPSESSCOOKIE"] == "") {

            if ($isSecret == 1) {
                header("Location: /authentication.php");
            }

        } else {

            if ($isSecret == 0) {
                setcookie("PHPSESSCOOKIE", $usersecret, time() - 3600, "/");
                header("Location: /");
            } else {

                if ($user_secret != $_COOKIE["PHPSESSCOOKIE"]) {
                    setcookie("PHPSESSCOOKIE", $usersecret, time() - 3600, "/");
                    header("Location: /authentication.php");
                }

            }

    
        }
        
        
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }

?>