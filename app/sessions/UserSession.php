<?php

    include '../connection/MYSQLSERVER.php';

    if ($_SESSION['isLoggedIn'] == 1 && $_SESSION['isDisabled'] == 0 && $_SESSION['isAdmin'] == 1) {

        header("Location: ../../user/administrator/");
        
    } else if ($_SESSION['isLoggedIn'] == 1 && $_SESSION['isDisabled'] == 0 && $_SESSION['isCustomer'] == 1) {

        header("Location: ../../user/customer/");
        
    } else if ($_SESSION['isLoggedIn'] == 1 && $_SESSION['isDisabled'] == 0 && $_SESSION['isCreditCoordinator'] == 1) {

        header("Location: ../../user/creditcoordinator/");
        
    } else if ($_SESSION['isLoggedIn'] == 1 && $_SESSION['isDisabled'] == 0 && $_SESSION['isCashier'] == 1) {

        header("Location: ../../user/cashier/");
        
    } else if ($_SESSION['isLoggedIn'] == 1 && $_SESSION['isDisabled'] == 0 && $_SESSION['isCreditInvestigator'] == 1) {

        header("Location: ../../user/creditinvestigator/");
        
    } else {

        $_SESSION['session_usercode'] = 0;
    
        $_SESSION['isLoggedIn'] = 0;
        $_SESSION['isDisabled'] = 0;

        $_SESSION['isAdmin'] = 0;
        $_SESSION['isCustomer'] = 0;
        $_SESSION['isBranchManager'] = 0;
        $_SESSION['isCreditInvestigator'] = 0;
        $_SESSION['isCreditCoordinator'] = 0;
        $_SESSION['isCashier'] = 0;

        session_start(); //to ensure you are using same session
        session_destroy(); //destroy the session
    }
    
?>