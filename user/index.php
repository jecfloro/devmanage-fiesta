<?php 
    
    include '../app/connection/MYSQLSERVER.php';
    include '../app/sessions/UserSession.php';

    if ($_SESSION['isLoggedIn'] == 0 && $_SESSION['isDisabled'] == 0) {
        header("Location: ../../");
    }

?>