<?php 

    session_start(); //to ensure you are using same session
    session_destroy(); //destroy the session
    setcookie("PHPSESSCOOKIE", $usersecret, time() - 86400, "/");
    header("Location: /"); //to redirect back to "index.php" after logging out
    exit();

?>