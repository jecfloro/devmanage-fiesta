<?php

    include '../connection/MYSQLSERVER.php';

    if ($_SESSION['isLoggedIn'] == 0 && $_SESSION['isDisabled'] == 1 && $_SESSION['isCustomer'] == NULL) {
        header("Location: /");
    }

    if ($_SESSION['isLoggedIn'] == 0 && $_SESSION['isDisabled'] == 0 && $_SESSION['isCreditCoordinator'] == NULL) {
        header("Location: /");
    }

    if ($_SESSION['isLoggedIn'] == 0 && $_SESSION['isDisabled'] == 0 && $_SESSION['isCashier'] == NULL) {
        header("Location: /");
    }

    if ($_SESSION['isAdmin'] == 1) {
        header("Location: /");
    }

    if ($_SESSION['isBranchManager'] == 1) {
        header("Location: /");
    }

    if ($_SESSION['isCreditInvestigator'] == 1) {
        header("Location: /");
    }

    if ($_SESSION['isCustomer'] == 1) {
        header("Location: /");
    }
    
?>