<?php

    include '../connection/MYSQLSERVER.php';

    if ($_SESSION['isLoggedIn'] == 0 && $_SESSION['isDisabled'] == 1 && $_SESSION['isAdmin'] == NULL) {
        header("Location: /");
    }

    if ($_SESSION['isLoggedIn'] == 0 && $_SESSION['isDisabled'] == 0 && $_SESSION['isAdmin'] == NULL) {
        header("Location: /");
    }

    if ($_SESSION['isCustomer'] == 1) {
        header("Location: /");
    }
    
?>