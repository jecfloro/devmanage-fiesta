<?php

include './app/connection/MYSQLSERVER.php';

$activation_code = $_GET['activation_code'];

if ($activation_code == "") {
    header("location: /");
}

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $userprofile = $conn->prepare("SELECT * FROM appsysusers WHERE user_activationCode = '$activation_code'");
    $userprofile->execute();
    $cuserprofile = $userprofile->rowCount();
    $ruserprofile = $userprofile->fetch(PDO::FETCH_ASSOC);

    if ($cuserprofile > 0) {

        $PK_appsysUsers = $ruserprofile["PK_appsysUsers"];
        $isActivated = $ruserprofile["isActivated"];

        if ($isActivated == 1) {
            $message = "Your account has already been activated. Please use the login form to access your account.";
        }

        if ($isActivated == 0) {

            $update = $conn->prepare("UPDATE appsysusers SET isActivated = 1 WHERE PK_appsysUsers = '$PK_appsysUsers'");
            $update->execute();

            $message = "Account activated. Please use the login form to access your account.";
        }

    } else {
        header("location: /");
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

?>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
    <title>Fiesta Appliances</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:locale" content="en_US" />
    <link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <link href="assets/plugins/custom/leaflet/leaflet.bundle.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/custom.bundle.css" rel="stylesheet" type="text/css" />
    <script>
        // Frame-busting to prevent site from being loaded within a frame without permission (click-jacking)
        if (window.top != window.self) {
            window.top.location.replace(window.self.location.href);
        }
    </script>
</head>

<body id="kt_body" class="auth-bg user-select-none">
    <script>
        var defaultThemeMode = "light";
        var themeMode;

        if (document.documentElement) {
            if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
                themeMode = document.documentElement.getAttribute("data-bs-theme-mode");
            } else {
                if (localStorage.getItem("data-bs-theme") !== null) {
                    themeMode = localStorage.getItem("data-bs-theme");
                } else {
                    themeMode = defaultThemeMode;
                }
            }

            if (themeMode === "system") {
                themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
            }

            document.documentElement.setAttribute("data-bs-theme", themeMode);
        }
    </script>
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-column flex-lg-row flex-column-fluid">
            <div class="d-flex flex-column flex-row-fluid py-10 shadow-lg">
                <div class="d-flex flex-center flex-column flex-column-fluid">
                    <div class="w-lg-500px p-10 p-lg-15 mx-auto">
                        <div class="form w-100">
                            <a href="/" class="d-flex flex-column align-items-center text-center mb-10">
                                <img src="./assets/media/logos/FIESTAAPPL_LOGO.png" width="100" alt="">
                                <h1 class="text-dark fa-2x fw-bolder mb-3 mt-3 text-uppercase">
                                    Fiesta Appliances
                                </h1>
                            </a>
                            <div class="text-center border p-3 rounded bg-light mb-5">
                                <?php echo $message; ?>
                            </div>
                            <a href="/" class="btn btn-lg btn-darkgreen w-100">Back to Login</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-column flex-lg-row-auto w-xl-400px positon-xl-relative shadow-sm mainpage-container-side">
                <div class="d-flex flex-column justify-content-between">
                    <div class="d-flex flex-row-fluid flex-column text-center p-5">
                        <div class="mainpage-logo-side d-flex justify-content-end flex-column text-center gap-5">
                            <img class="" src="./assets/media/logos/FIESTAAPPL_LOGO_ALT.png" width="100" alt="">
                            <p class="mt-n3 text-white">Version 1.0.0</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../assets/plugins/global/plugins.bundle.js"></script>
    <script src="../../assets/js/scripts.bundle.js"></script>
    <script type="module" src="./app/js/main.authenticationScript.js"></script>
</body>

</html>