<?php

include '../../app/connection/MYSQLSERVER.php';
include '../../app/sessions/AuthSession.php';
include '../../app/sessions/CreditInvestigator.php';
require '../../app/setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $usercode = $_SESSION['session_usercode'];

    $userprofile = $conn->prepare("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$usercode'");
    $userprofile->execute();
    $cuserprofile = $userprofile->rowCount();
    $ruserprofile = $userprofile->fetch(PDO::FETCH_ASSOC);

    if ($cuserprofile > 0) {
        $fullname = $ruserprofile["userFullName"];
        $email = $ruserprofile["user_email"];
    }

    $uid = $_GET["uid"];

    $_SESSION["tempuid"] = $uid;

    $user = $conn->prepare("SELECT * FROM appsysusers WHERE isCustomer = 1 AND PK_appsysUsers = '$uid'");
    $user->execute();
    $cuser = $user->rowCount();
    $ruser = $user->fetch(PDO::FETCH_ASSOC);

    if ($uid == "") {
        header("Location: customer.php");
    }

    if ($cuser == 0) {
        header("Location: customer.php");
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
    <link rel="shortcut icon" href="../../assets/media/logos/favicon.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <link href="../../assets/plugins/custom/leaflet/leaflet.bundle.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/custom.bundle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
    <script src="../../assets/js/routing.bundle.js"></script>
    <script>
        // Frame-busting to prevent site from being loaded within a frame without permission (click-jacking)
        if (window.top != window.self) {
            window.top.location.replace(window.self.location.href);
        }
    </script>
</head>

<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled aside-fixed aside-default-enabled user-select-none">
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
        <div class="page d-flex flex-row flex-column-fluid">
            <div id="kt_aside" class="aside aside-default aside-hoverable " data-kt-drawer="true" data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_aside_toggle">
                <div class="aside-logo flex-column-auto px-10 pt-9 pb-5" id="kt_aside_logo">
                    <a href="/">
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="60px" class="max-h-50px logo-default theme-light-show" />
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="60px" class="max-h-50px logo-default theme-dark-show" />
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px" class="max-h-50px logo-minimize theme-light-show" />
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px" class="max-h-50px logo-minimize theme-dark-show" />
                    </a>
                </div>
                <div class="aside-menu flex-column-fluid ps-3 pe-1">
                    <?php include './sidebar.php' ?>
                </div>
                <div class="aside-footer flex-column-auto pb-5 d-none" id="kt_aside_footer">
                    <a href="index.html" class="btn btn-light-primary w-100">
                        Button
                    </a>
                </div>
            </div>
            <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
                <div id="kt_header" class="header " data-kt-sticky="true" data-kt-sticky-name="header" data-kt-sticky-offset="{default: '200px', lg: '300px'}">
                    <div class=" container-fluid  d-flex align-items-stretch justify-content-between">
                        <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
                            <div class="d-flex align-items-center d-lg-none">
                                <div class="btn btn-icon btn-active-color-primary ms-n2 me-1 " id="kt_aside_toggle">
                                    <i class="ki-duotone ki-abstract-14 fs-1"><span class="path1"></span><span class="path2"></span></i>
                                </div>
                            </div>
                            <a href="/" class="d-lg-none">
                                <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px" class="mh-40px theme-light-show" />
                                <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px" class="mh-40px theme-dark-show" />
                            </a>
                            <div class="btn btn-icon w-auto ps-0 btn-active-color-primary d-none d-lg-inline-flex me-2 me-lg-5 " data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body" data-kt-toggle-name="aside-minimize">
                                <i class="ki-duotone ki-black-left-line fs-1 rotate-180"><span class="path1"></span><span class="path2"></span></i>
                            </div>
                        </div>
                        <div class="d-flex align-items-stretch justify-content-end flex-lg-grow-1">
                            <div class="d-flex align-items-stretch flex-shrink-0">
                                <div class="d-flex align-items-center ms-1 ms-lg-2">
                                    <a href="#" class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px" data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                        <i class="ki-duotone ki-night-day theme-light-show fs-1"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span><span class="path8"></span><span class="path9"></span><span class="path10"></span></i> <i class="ki-duotone ki-moon theme-dark-show fs-1"><span class="path1"></span><span class="path2"></span></i></a>
                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-title-gray-700 menu-icon-gray-500 menu-active-bg menu-state-color fw-semibold py-4 fs-base w-150px" data-kt-menu="true" data-kt-element="theme-mode-menu">
                                        <div class="menu-item px-3 my-0">
                                            <a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="light">
                                                <span class="menu-icon" data-kt-element="icon">
                                                    <i class="ki-duotone ki-night-day fs-2"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span><span class="path8"></span><span class="path9"></span><span class="path10"></span></i> </span>
                                                <span class="menu-title">
                                                    Light
                                                </span>
                                            </a>
                                        </div>
                                        <div class="menu-item px-3 my-0">
                                            <a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="dark">
                                                <span class="menu-icon" data-kt-element="icon">
                                                    <i class="ki-duotone ki-moon fs-2"><span class="path1"></span><span class="path2"></span></i> </span>
                                                <span class="menu-title">
                                                    Dark
                                                </span>
                                            </a>
                                        </div>
                                        <div class="menu-item px-3 my-0">
                                            <a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="system">
                                                <span class="menu-icon" data-kt-element="icon">
                                                    <i class="ki-duotone ki-screen fs-2"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span></i> </span>
                                                <span class="menu-title">
                                                    System
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center ms-2 ms-lg-3" id="kt_header_user_menu_toggle">
                                    <div class="cursor-pointer symbol symbol-35px symbol-lg-35px" data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                        <img alt="Pic" src="../../assets/media/avatars/user-avatar.png" />
                                    </div>
                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-color fw-semibold py-4 fs-6 w-275px" data-kt-menu="true">
                                        <div class="menu-item px-3">
                                            <div class="menu-content d-flex align-items-center px-3">
                                                <div class="symbol symbol-50px me-5">
                                                    <img alt="Logo" src="../../assets/media/avatars/user-avatar.png" />
                                                </div>
                                                <div class="d-flex flex-column">
                                                    <div class="fw-bold d-flex align-items-center fs-5">
                                                        <?php

                                                        if ($fullname != "") {
                                                            echo $fullname;
                                                        } else {
                                                            echo "PROFILE NOT SET";
                                                        }

                                                        ?>
                                                    </div>
                                                    <a href="#" class="fw-semibold text-muted text-hover-primary fs-7">
                                                        <?php echo $email; ?>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="separator my-2"></div>
                                        <div class="menu-item px-5">
                                            <a href="profile.php" class="menu-link px-5">
                                                My Profile
                                            </a>
                                        </div>
                                        <div class="separator my-2"></div>
                                        <div class="menu-item px-5 my-1">
                                            <a href="settings.php" class="menu-link px-5">
                                                Account Settings
                                            </a>
                                        </div>
                                        <div class="menu-item px-5">
                                            <a href="../signout.php" class="menu-link px-5">
                                                Sign Out
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center ms-2 ms-lg-3 user_profile">
                                    <div class="border rounded p-3 bg-light fw-bolder">
                                        <div class="d-flex flex-column">
                                            <div class="fw-bold d-flex align-items-center fs-7">
                                                <?php

                                                if ($fullname != "") {
                                                    echo $fullname;
                                                } else {
                                                    echo "PROFILE NOT SET";
                                                }

                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content fs-6 d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="toolbar" id="kt_toolbar">
                        <div class=" container-fluid  d-flex flex-stack flex-wrap flex-sm-nowrap">
                            <div class="d-flex flex-column align-items-start justify-content-center flex-wrap me-2">
                                <h1 class="text-dark fw-bold my-1 fs-2">
                                    Fiesta Appliances <small class="text-muted fs-6 fw-normal ms-1"></small>
                                </h1>
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item text-muted">
                                        Credit Investigator
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        <a href="customer.php" class="text-dark">Customer</a>
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        <?php if ($ruser["userFullName"] != "") { ?>
                                            <?php echo $ruser["userFullName"]; ?>
                                        <?php } else { ?>
                                            PROFILE NOT SET
                                        <?php } ?>
                                    </li>
                                </ul>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap text-nowrap py-1">

                            </div>
                        </div>
                    </div>
                    <div class="post fs-6 d-flex flex-column-fluid" id="kt_post">
                        <div class="container-fluid">
                            <div class="row g-5">
                                <div class="col-xl-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Location Details</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row g-5">
                                                <div class="col-xl-4">
                                                    <label for="">Latitude</label>
                                                    <input type="text" class="form-control form-control-solid" id="ii_lat" readonly>
                                                </div>
                                                <div class="col-xl-4">
                                                    <label for="">Longitude</label>
                                                    <input type="text" class="form-control form-control-solid" id="ii_long" readonly>
                                                </div>
                                                <div class="col-xl-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="1" id="ii_isDefault" />
                                                        <label class="form-check-label" for="ii_isDefault">
                                                            Make location as default
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-xl-12">
                                                    <label for="">Address</label>
                                                    <input type="text" class="form-control form-control-solid" id="ii_address">
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <div class="">
                                                    <div id="location-map" class="rounded" style="width: 100%; height: 500px;"></div>
                                                    <script>
                                                        if (navigator.geolocation) {
                                                            navigator.geolocation.getCurrentPosition(showPosition);
                                                        } else {
                                                            alert("Geolocation is not supported by this browser");
                                                        }

                                                        function showPosition(position) {

                                                            var lat = position.coords.latitude;
                                                            var long = position.coords.longitude;

                                                            $("#ii_lat").val(lat);
                                                            $("#ii_long").val(long);

                                                            // var lat = 7.313449452877695;
                                                            // var long = 125.6694805466512;

                                                            let petAvatarUri = "data:image/png;base64,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";

                                                            let startingSVG = "data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAUFBQUFBQUGBgUICAcICAsKCQkKCxEMDQwNDBEaEBMQEBMQGhcbFhUWGxcpIBwcICkvJyUnLzkzMzlHREddXX3/wgALCAFoAWgBASEA/8QAHQABAQEAAwEBAQEAAAAAAAAAAAUIBgcJBAMCAf/aAAgBAQAAAADWBbIhbIhbIhbIhbIhbIhbIgLZELZELZELZELZELZELZEBbIhbIhbIhbIhbIhbIhbIhbIhbIhbIhbIhbIhbIhbIhbBELZELZELZELZELZELZELYIhbOPcM/G0RS0RS0RS0Rf25nyEiFsiFsiOB+fPBAAAAOd+g3PFsiAtkR50dM1Pv/kg/xyD/AE+CbS+8/wA4/wD3eP6+CX3N6LrZEBbIkvyf/D1f5vER/J17AfiZCx/sDXp+/j89YrC3wrye/f1gqWyIWyIW+h/N/m/qMtuqvLzlHqrbMK5R1duoieVXF/UPtVEeXPCPSPvWIWwRC3h/I+mtxrbNnn13F6N2zCuUdXbqInnJ076C6TRGHMy643BELYIhb8sutN/d/rbFmOtObhtmFco6u3URMPZj2PtFEdAYB7L9TYhbIhbOBeVH++ut5Eef/QW6NYRDIWP9ga9LeUMLd++gC2g+RX+eq/PSIC2ZhwL2V6nER5ide+k/eMQyFj/YGvS30b5s9hena2eWPWu+tPEQFs8/c06t3WRPx8lvh9ZOaRDIWP8AYGvS3wvyb+71p/a2YUylpb0CIhbIh5l9bbM7JK3HPPf6PQj9axlPoDv/AFYSfy89/n9CeRSTrXGnZPpoWwRDz26LAAAAA7z9Ci2CIY0ybe5UfRxji32c8fQcIjWebnzuB/Hynk/znFIWstllsiFszDgXmfq59KB5u9UfR6ndhREbzD4vyj08srfXPlr8/bHpByB8vlJwzfWniIC2cV8uOMaQ2dDxl0Ucv3Dz/g2Nusjs3ZPOOAYe4id67Ot4xzfyf1H5URAWyJ0f59/MPt23l/rcOSbkw5xoOyNQYk+IfT6Cd4WyIWyIW3UGBeAV+9th9kcSyln3ifIO/NVcn4xlXoPj/LNBat5b11jroiRz/e/cSIWwRC2YbyXqjeBELX+ohbf5FLZg/K+tNyEQtgiFsw3kvVG8CIWyIWyIWzB+V9abkIhbIhbIhkrG+ttj9fZP/I+N2FtX9ulcp/g+wao7OxxknZGtS2RAWyIZKxvrbY/mn1cB6CaU8jeMgdk+mmOMk7I1qWyIC2RDJWN9bbH8seIbC5olZ06p3HrXxz+PZdaq4Xj3l/qdjjJOyNalsiFsiFsw3kvVG8PJnhvpf2ct4EzFs/Vnkf8AJ64coiOsfNDmXrNg/K+tNyEQtgiFsw3kvVG8PJnhvpf2ct4EzFs/Vnkf8nrhyiI6x80OZes2D8r603IRC2CIWzDeS9Ubw8meG+l/Zy3gTMWz9WeR/wAnrhyiI6x80OZes2D8r603IRC2RC2RDJWN9bbH8seIeo/aKJhHOG49a+Ofx+q3J7bq7y45f6nY4yTsjWpbIgLZEMlY31tsfyx4h6j9oomEc4bj1r45/H339v3IHRHL/U7HGSdka1LZEBbIhkrG+ttj+WPEPUftFEwjnDcetfK3rkDuj0VxxknZGtS2RC2RC2YbyXqjeHkzw30v7OW8CZi2fq7i3TXzpxc0RewflfWm5CIWwRC2YbyXqjeHkzw30v7OW8CZi2fq5bIhbMH5X1puQiFsEQtmG8l6o3h5M8N9L+zlvAmYtn6uWyIWzB+V9abkIhbIhbIhkjHOq9peWPEPUftFEwjnDcetUQtkQxZlXY2ty2RAWyIdKedv72on43v1fzM+Gr9z+T+j+SL+Hoh3aWyIC2RCvgvMf5gAAH6ab3rILZELZELZEcaEUtEUtEUtDkq2RC2CIWyIWyIWyIWyIWyIWyIWwRC2RC2RC2RC2RC2RC2RC2RC2RC2RC2RC2RC2RC2RC2RAWyIWyIWyIWyIWyIWyIWyIC2RC2RC2RC2RC2RC2RC2RD/8QAOhAAAAQEAwUGBQMDBQEAAAAAAwQFBgABAgcIEFYRFxggNRYwNDY3QBITFBVVMkFUISZTIiQxUXAl/9oACAEBAAEMAP8A2occAqFWMOPQEEPcy3xYSoMV4pcq96ludZJcb2raa5SY3tW01ykxvatprlJjepbnWSXG9S3OskuN6ludZJcb2raa5SY3tW01ykxvatprlJjepbnWSXG9S3OskuN6ludZJcb2raa5SY3tW01ykxvatprlJjepbnWSXG9S3OskuN6ludZJcb2raa5SY3tW01ykxvatprlJjepbnWSXAFzLfGRKQwnilzrAMAGgqBgB6BQvY3CfyVb5CrUTkvmjvS4rqfh2swsKVcwfcsq4rrYZ4MyjKVdINvX8lXBQqFEnL5Q/sL6OkZyP9TBkLtKQRRVlUprqT0k4bp7Hu3S6rHZJ1aZVI7JOrTKpHZJ1aZVIqlVTOdM5TlOAWs5zAQYwDdUhQuyTq0yqR2SdWmVSOyTq0yqQfSVVKqDpUU00UqggkqqrUJSnJpo3V2SdWmVSOyTq0yqR2SdWmVSBms5y4Qgw7dUggoplVVOVMpTnPsk6tMqkdknVplUjsk6tMqkdj3bpdVg8irKXTRUoJJwpTFi3SM23+mAzF2FO/XFMFFRlVTGnKQZsyKdNGTQ1XxCylOc5SlLbO3DbAajIbqVQBSGLm4T0ktAWj857IrrqrqqrqntnRRUJXRRTLbNvkKUpAQ0+UpSlni660zMsIvWnnyOBOpVW+uEJ7JxXRUHXXRVLZOiuqiqmumeybePSVEFFPyntlncdtAOtjuJLrAprEnKcpzlOWyZQyKSNFjQNXwioamCtIyUpgzlMPvsRi9JGtofL0CSkNFuUObjfDaTZ07aOS+ChJLta7hZT2ThlJ01Z3tkjs2y5MU/VmhlhY6s7+V6p80l3uYjs2SiyClJTtY0BZ1bZ8lxkObcfDlTZU7KIw4r8lm2ZEsILtF77Fev/AD1xtoAYn+iMMaH9Y6VhYro20cmKRS+lYBAlKrKw6d9wucgf9cmKfqzQywsdWd/LfhO+33OX/wDqMLanM0wD5GdXLicQ/o3UkLNFGyiMKDg+nXHKgiCbKO+u+vycdxnUeor2hRhwQ/tjBmfronIXkxaKM/q2cl5YX0757rXj85cuKfqzQywsdWd/LigTvkOtBPyllhJUpyOPFM+LlxHof3NgyP0UTmLFoF/s3cdqnqq/hC713LNLea6+rVT2QIJWLXWJXVOdYQdYwoYQdM51tNHDbrWb6NRKUpcmI9R+suNWXlPbKMJqf8hvutS/fkxddaZmWEXrTz5cWaf89Aain+8YcFH6O41Bec9kuR2IoTjazhSK6dshQ6wRRAhKZyrDErCroEoqnKtorNLha6ArUz297iRXPtrECTqK9gkWjQu0Fw2yUqo+ILlusofdLiu8zKrbTGHNOknWsSRJy2VcmLrrTMywi9aefLiMTfr7VqwspbaotSofa7itAzOeyXLdxC7P3DcxSVHwhRhuXPuTEFTq69oneYmlz613JaRRXtojC6h/OVXGuV0f05DA1JcuOPXPZQpG6z6ifOVz21RbhN+0MFnkf35MXXWmZlhF608+W46Z93YTwJf8zhNN1EFEgcpnsqLjUmC4A9E9tHJiiQvkqrcXKKP6RhlXPoncqJFdeyjvLvHBj1zHoMNOc6osjdG27DZIZBUVhAlLiAtf+bGjiAtf+bGjiAtf+bGjiKtP+fHh24gbdG2s4iqWsDCH4LSCmYAkNV8IQF+rWAAAg0LY0qeIC1/5saOIq0/58eOIq0/58eOIq0/58eL8vptPhQboyEdqHoiwz6bTHUHEMunagKOIq0/58eOIq0/58eOIq0/58eOIC1/5saB79WsHAGBrWxp0mZBSMDyBq+IKGjiCtyTazcKqqwNQe4irT/nx44gLX/mxo4gLX/mxo4gLX/mxovbdG277ZAhBLVxBVKLQnBiNzGWKDOcqu8xEoIaJc1UECq2h+/w7oQa3c5LEFqlKjvMWSdMJzNhS/aEBtrjpO1EURNFOmt0Fy9HH43QXL0cfjdBcvRx+Ny909EKMOJlulpfSffkUchkRJmVE4WJFAZimN0Fy9HH43QXL0cfjcvdPRCjG5e6eiFGNy909EKMLaCsNw9MgrkBChuERBWHGekQSCAhs3uXunohRjcvdPRCjG5e6eiFGN0Fy9HH43QXL0cfg8TMpxwySNgzCMQ3WW6Xb9X9hRRz8bl7p6IUY3QXL0cfjdBcvRx+N0Fy9HH4X22utY7SRW00UkajCcnzrcroUp0/6O8xHt6pVY4SkFROYsMB1Cst2o61TtmGSOlFEmUOkx6Ri2QwwRYEUccWkMK8D6k/HcOZK1zmnQXHGKGADIAk6BbW3BI3AapJSCEpkfzcC8mNlHPKymYkEVeLnNvFyq66b/oJDOc5tnOVIXSn9RG+vJjmRyKsmGJClc7ov4jb1rHFIUSmZ4wOMbMDmRxJ1jRZ59SYbuAMmq5yTQRgTIIQwAtIgWR48VTSRo6bGpCLP91CvN2rC1VtkHGHBvVJTHFUhaNgveKiaVWE08nGw/jLvBsnWe4lNFOUz+OLOX0HYwdCGvUCmkNLujblWLUjlnim7F+9tsm+BXUK5wDY1zb3rL6oFTCAU09GzZr1X2IsBKqIbmEKzcSjIXAQQlydaMeDf7HFCkLQ7kqdDkvzb1ABr+Qp/czNw7ouG4RymZyqRchnby6Lgt6cqmTqkYT23fm3q+DR89T+2GRH+xwgpi1u5KlQ8cSbIQgRQkOdayeeT1X32sCqq0bmKJnbK96yxaAkw+FNQRkC9tsnADRUG5wCgyjdG3KQXmYNvBN2XkvoM+Q60NBoFKocM9sHXg4kxEJ0z+NLTiqOmkU0mHKgv3t6LWSfiVQfTqJUrZosYJGByxkCsEfkIEDimbAJkiwhgywbAI5FsnwnQBSOqXGtov25Vqyp8KYpLla7UXHgrF0pFI1GDPDe2d3/2L50vvjoai6zlYwlLRGsuZ5bdW0X7iqtJUgFMIk/rAI55skAmuBSAqHyBxMNjkzpYQuZ5CpYwdMAFiwFYw9lrWyYaVWfUaJVLff3Lsu2Li01m6/8AYLD+t0vW8PFiqrUBXRCQhLK8YmXSUsydGauGl9LQgYizIJGKsK1TRt6B/wDLJzFOwrI6WukB09UIhGijzwzVzrGNNJTphZtm/UGuqR5rH5U1JanRX8FScZlUksB7LglNCc1VIebPwuOI+IEO6VAJNLNZnN1mJ8iKInUFw4dLObrzT5kVtOoMBvHC240+sQdrHwlIsrMB7IYlVCi1VICdKWp11/BSnGZ1I9s36vV0yItY9Olm4Zq5Vgmncp0wko6WhEAE9LIhFSkP+1bQuEWl91JfJPOvDQ+0QQQRHkEslVdCWUExIurJZkkNDBt0vXDPGSqVUBRRbWy7Zt3TQbol9esexxU+NZuWFnrzr5/hp/5nTLuPhp/5lTLnxTdeamWFbxry9nip8azcsLPXnX7bFN15qZYVvGvL2eLvqLJywmdfeGVwbjoVvE2gyoTmMaUcTD6Mj1VkSacUA4n7pfyE2OJ+6X8hNjiful/ITY4j7k/5k6OI+5P+VOhm4mRxDYJV2JgNIBYyWOlwDRUegYvF1L1I1t5UEQi/16yPiTuIKLXWFSmA0cR9yf8AMnRxH3J/zJ0cT90v5CbHE/dL+QmxxP3S/kJsEsSr/AHpqMgJpkK210UW4pIWZaiZVRjFn19n5YROovb2eLvqLJywmdfeGV418yv3DcYgok5h8+F9wmlVkKKWOJOqJzlKU5w8Vo04XQvqpsSdYvPaRZMolw2uOAJOUoxZ9fZ+WETqL29ni76iycsJnX3hk/8Azw78rf4dGw72agr5teUQB54TWbqhVieE1m6oVY4XWnqFUi7jDT7euIolEDg5gKMI3SXnFf6BIUPHnsm/hubCuhIykKuqVAnC609QqkTwms3VCrE8JrN1QqxcHDm2WgzV9fKLyiOPDA88NDLFn19n5YROovb2eKnxrNyws9edeVxPPryysz6YtDkxWeoSblhY6S74r/RXB/xx3JiT/sdpS5LzemLvyt359ZuWKbrzUywreNeXs8VPjWblhZ6868riefXllZn0xaHJis9Qk3LCx0l3xX+iuD/jjuTEn/Y7SlyXm9MXflbvz6zcsU3XmplhW8a8vZ4qfGs3LCz1515XE8+vLKzPpi0OTFZ6hJuWFjpLviv9FcH/ABx3JiT/ALHaUuS83pi78rd+fWblim681MsK3jXl7PF31Fk5YTOvvDJ/+eHflZH0rZfJic89JmWEbpLziv8AQJCh489kyfJrV5L3elb0yYHnhoZYs+vs/LCJ1F7ezxd9RZOWEzr7wyf/AJ4d+VkfStl8mJzz0mZYRukvOK/0CQoePPZJmIh8pSaQTgCqXMHiYf8A/ESY4qLkfxEiOKi5H8RIhz4g3w7EFSQz5dNkVhgeeGhliz6+z8sInUXt7PF31Fk5YTOvvDJ/+eHflZH0rZfJic89JmWEbpLzyumzzrKei0njhTkBz2MaRxyPtLNyCn9FGLPr7PywidRe3s8VPjWblhZ6868riefXllZn0xaHJis9Qk3LCx0l35Oxltx6kJEltPpHoHwnNasWusB0qQQXCY3NXqMcJjc1eoxwsoOqz8cLKDqs/HCyg6rPwUwotQAeis441IcJtthCaCWEmIadQVKxim681MsK3jXl7PFT41m5YWevOvK4nn15ZWZ9MWhyYrPUJNywsdJd/eYpuvNTLCt415ezxU+NZuWFnrzryuJ59eWVmfTFocmKz1CTcsLHSXf3mKbrzUywreNeXs8W8qpnGTX+0YUj5Mu63EUGHooGh/8Anh35WR9K2XyYnPPSZlhG6S8+8xWHyZh1N0oCPTWNGEiif1r1r/b2WJZojr7HCVCoM6h4BHHLC0DADVhC9rXVqZUgYYUwKIKMLUIJBZzOMkAGXKuBRAA7YO3VCrHbB26oVY7WurUypB1RPqQtIx48OaFggtLCVSJSnqxwpLtg7dUKsdsHbqhVjta6tTKkdrXVqZUjta6tTKkdsHbqhVjtg7dUKsdsHbqhVjta6tTKkdrXVqZUjta6tTKkDDjmRaxhxqxRYw1NQZvsYVUNgzoH9kMEEOCIEKHTWHdvD8rt82bWGqTEOpFYdYddVFdE6ava0UViV00UUzqqtLYBXXzZNYdZMQkjhBBgBBghUSoC9oqs1prgkxVNuJ5oTdLbTQyTG6W2mhkmN0ttNDJMbq7c6NS43V250alxurtzo1LjdLbTQyTG6W2mhkmN0ttNDJMbq7c6NS43V250alxurtzo1LjdLbTQyTG6W2mhkmN0ttNDJMbq7c6NS43V250alxurtzo1LjdLbTQyTG6W2mhkmN0ttNDJMJTNaaGJIVLbieVE/wDbP//EAEQQAAIBAgEHCAcGAwcFAAAAAAECAwAEEBESFEFzdLIFExUgMXGz0iEwQFFhgZIjQlJicoMiJDI0U1RwgpGTM1BjweL/2gAIAQEADT8A/wA6kGVnkYKoHvJJFDtAuFbhrbitvW3rb1txW3FbcVt629betuK24rbitvW3rb1txW3FbcVt629betuKPYDcKvFTjKrxsGUj3ggn2KQlLS2ByNNJ5RrNZxMVpGSsEQ/KvtWcDLaOS0Eo+K1GQl3bE5Whk8p1H2HkwmzgX4p/W3zbBDkYwQPKB35oNbnL5a3SXy1ukvlrdJfLQJBBwkUMjpaysrKdYIFbpL5a3SXy1ukvlqQEoJ4miLAaxnAYRgFxBE0pUHWc0Gt0l8tbpL5a3SXy1GpZ3e1lVVUaySMCQABW6S+Wt0l8tbpL5a3OXy05yKZ4HiB7s4DDlMiznXVlf+g/JvYLS1lnbujXLU8ryufeznKaNJZxPcEDIWmkXOcnqW1lPN9CE0xJPeaYgDvNWthBDk2aAdTQ7njGGh23GepdWM8ObtEIpSQe8UpBHeKubKCb60B6j2cj25YZSJoxnIRQqCVJUPuZDlFXdrFOvdIuX1/Kc8VmviPhJexvLs4jnt1ZbdbYd87hMJ+UbZCPy54J6uiXPGMNEtuM9WDlG5QD4Z5Iwht3tj3wOY+rHeyPFs5TnrhyXcS2jeInr7S1e6lX885yDhwsLIRJtJz1b3lWL6YUL4Wwmuf+ND1dEueMYaJbcZ6tyILn/kQYWXKsv0yoH6t/ZmN9pBhd2qXUQ/PB69bs28Ozt/sxhyndyTftx/Zr1RFc3J+ZCDC25OEfzmfq6Jc8Yw0S24z1bnk4x/OF8DDb3I+RKHq8mXcc37cn2bYNdi3m2dx9kfXWllNKv6guRf8Ac07FmJ1k07BVHvJqysYYW+Lqv8XVsrCCH6ssh4sJ72KBTsUynj6uh3PGMNDtuM9WC9lgPdMv/wAYXthPD9OSQcPVvLGaFfg7L6KRirD3EUjBlPuIq7soZW/UVyN/sfW8p3iRnZxfxnCO5FzN+i3Gf1tPkiHdD9nheXNzcn68wcPV0O54xhodtxnq2dzbXA+vMPHhp8cR7pvs+tJcm5h/ROM/Dky8eMbOX+Met5Psw77SfC3gS1iP5pTnN1Yo2du5RlNT3Ekp73YnCPku3Lj3M6ZzdXQ7njGGh23GerJyVcFPiyLnDCC4jlHejA1LGrr3MMo6txA9rKfzRHOXDlCzLptIPWjlKWL5RfwDCe6muLlVtpX/ACoMoFbrLW6y1ustbnLU/J88NuhtpVBkkQrgZFz29y5fSajRUH8rL2LW6y1uctbnLW5y1awTJKWjaPIXI/FhdQQpEVjaTKUJ/DW5y1uctbnLW6y1IjIf5WXsahI2Y3vXL6DhByfBFcJo0rASRoFrc5a3WWt1lrdZaguobi2DW0qA6nGUjA8pRRfKX+A+t5Shivu4uM1v+wcnQy3veUGavF62fk94fnC+AjMphiyFsxe013LXctdy1+kVc53MiYAZ+ZhPIscUa9rsxyACu5a7lr9Ir9Ir9IoIrmGTtCt2HAoziKP+oqvaa/SK/SK/SK7lruWoJGjljbtRlOQg4W2bzwhAOZn1+kV3LXctdy0YxKIZcgbMbsOEHJ6Q/OZ/W8lXSynZSjMbCGXNuEH3oZBmuKuIVlhkU5Q6uMoIxjQu7sQAqqMpJJ7AKs1NvZfFAcpk/wBRwhkWSNx2qynKCKhURX0GuKbyv1LaMsxPafcq/E1eTl1T8CD0InyGFnOHZPxofQ6fMVcxhlI7R71b4jqSqYrCDXJN5VqaRpJHPazMcpJwvFFve/BCcof/AEmpFDI6kFWVhlBBGo428TSzSMcgVUGUk1NLmwKfuwxjNQYcq3TSjZRDMX1t3BJDKvvVxkq2lIR/7yM+lHHeMCx5p09MtoW4kojKRLMsLj4FZCDQ7IbL+YY/TWuIHLLPtT1AAJYm9MUyfgda7GzwZICfg4re461Q2YLgn4uciioiTBZRE5i/FvxP1JSDPYyk5jfFfwvWuG8BQA/BxlU1vcdaswGOAH4uaIKxRL6IoU/Ai9TVETklg2Ro9sN7/LsPqoDLkimWZz3LGSazwZnf0S3ZHCmFzKA76o4x6Xc9wq1gjhiX3KgyeusUPNahPHri8tQuUkjcFWRl9BBB6szhI4o1LMzHUAK5SgzXzT/Yx2gR/nqRjol8g+zmXz9aQ9yRrrd21LWXn+lP/Pk8Koj/AKJF/Gh1r1o2Gl3rj7OJf/b1ybBmJnH+2DtIk/PULlJIpFKsrDUQerM4SONAWZ2b0AACr5BzusQR6ovN7AFyJfRKCX+EyVch2t5oXyrIqcOAAJSCJpCAdZzeytfOkST/APGtMmSW+nyNM/lGEoyPFKoYV/gbs8ElD78URmT6o8or3GJgaOsW7Kn1MAK128JE0/lWu2STtklI1uxw7Y5OySInWjCtUExEM/lehrNuzJ9SgivcImJon/qSxGFPqkyCv8DaHjkqIZEiiUKMEXNivoMizr5hWoxERzfQ1EEhJ4mjJA1jO7cLYI1xNM+RY1fiorke+mX+j4Qr932LmbviTDQYeP2bQZuPDmbTif2PmbviTDQYeP2bQZuPDmbTif2PR7ziTDo+DxcJsotrOMgSSkcK1qjMRlPzJNbpW6VulbrW7U5AN5aAjM+LoamjWSKRCGV1YZQQRhKgdLYPmpGmppTWpBbk8TVutbrW6VulbpWuMwlKtwDc2bsCV/Mh1ph0fP4uGj2fE/sej3nEmHR8Hi4Wlw1nAmpI4Dm+o5KvQkOymGeBhc3sz9y5xCr8h6ie8S1lH445zmEYdHz+Lho9nxP7Ho95xJh0fB4uHS954pwvoDI8cYjzQQxFftV+1X7VS2STl58mXKzFfu4aVbcBrIa5+TiwvLKGd1UR5AZEDV+1X7VftVYwB0jkEeYSWAw6Xs/FGHR8/i4aPZ8T+x8zd8SYaDDx4dMXninDRDxt1Oh4fEfDS7bgNZDXPycWHRNl4S9TRBxrh0xZ+KMNBm48OZtOJ/Y+Zu+JMNBh48OmLzxThoh426nQ8PiPhpdtwGshrn5OLDomy8Jepog41w6Ys/FGGgzceHM2nE/sfM3fEmGgw8eHTF54pw0Q8bdToeHxHw0u24DWQ1z8nFh0TZeEvU0Qca4dMWfijDQZuPDmbTif2PR7ziTDo+DxcOl7zxThoj+Iep0TH4j4aVbcBrIa5+Tiw6Ks/CHU0RPEGHS9n4ow6Pn8XDR7Pif2PR7ziTDo+DxcOl7zxThoj+Iep0TH4j4aVbcBrIa5+TiwtII4Iy8Lk5sYzQSQ9bB/PW7v563d/PV7GI5TFC6tx4dL2fijDo+fxcNHs+J/Y9HvOJMOj4PFw6XvPFOGiP4h6nRMfiPhpVtwHCSeSezk1SQSEkEeo5LkF3cS6gU9KJ3k4dHz+Lho9nxP7HzN3xJhoMPHh0xeeKcNEPG3U6Hh8R8NLtuA4KSYpASskROtGFakaON62EdbCOtilbFK2KVriCxxUvpKr2u34nJyljhoM3HhzNpxP7HzN3xJhoMPHh0xeeKcNEPG3U6Hh8R8NLtuA+s0Gbjw5m04n9j5m74kw0GHjw6YvPFOGiHjbqdDw+I+Gl23AfWaDNx4czacT+xmC7HBhdcnpzCH75jfDpe88U4aI/iHqdEx+I+GlW3AfWWvJ788g+5nvhzVmOP2Pkaczuo/uJBmyYIc5HRirKfeCK3uXzU7FndyWZidZJwjGRIormREUfAA1vkvmrfJfNW9y+alXNDzSNIwA1ZWJwkILiCZ4gxHvzSK3yXzVvkvmre5fNW9y+at7l81b5L5q3yXzVvkvmre5fNW9y+at7l81Oc53dizMfiThyzcCdAdUEYzU9jkUoyMAVZWGQgg6jTku1tEC81r50pSQVIyEEezEgBQMpNIQ62sgKzXXlSkUKiKMiqqjIAPgPZfxywIz/VWwrYVsK2ArYCtgK2FbCthWwFbAVsBWwrYVsK2ArYCtgK2FbCthX44oEV/q/zt/9k=";

                                                            let markerShadow = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAAAYCAYAAABKtPtEAAAACXBIWXMAAAsTAAALEwEAmpwYAAABOWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjarZGxSsNQFIa/G0XFoVYI4uBwJ1FQbNXBjElbiiBYq0OSrUlDldIk3NyqfQhHtw4u7j6Bk6PgoPgEvoHi1MEhSHASwW/6zs/hcOAHo2LXnYZRhkGsVbvpSNfz5ewTM0wBQCfMUrvVOgCIkzjiJwI+XxEAz5t23WnwN+bDVGlgAmx3oywEUQH6FzrVIMaAGfRTDeIOMNVJuwbiASj1cn8BSkHub0BJuZ4P4gMwe67ngzEHmEHuK4Cpo0sNUEvSkTrrnWpZtSxL2t0kiOTxKNPRIJP7cZioNFEdHXWB/D8AFvPFdtORa1XL2lvnn3E9X+b2foQAxNJjkRWEQ3X+3YWx8/tc3Bgvw+EtTE+KbPcKbjZg4brIVqtQ3oL78RfCs0/+HAmzJwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6AAAUggAARVYAAA6lwAAF2/XWh+QAAABnElEQVR42uRY0Y6EIAxsOe7/f3i197Ikk9lSqIsXjSakirvITIdSqmYmT74qPqjqqnH1hLku8RQ7vJ4AUE9ylg5IsK8VkACtyfe6wOMG49gqtdQDoLP2CAnWeY5sTyF2lAAP0KiJc/8tAQiS73tNJogJCWAwxbGFwBeHKEmQYQOPI7id+nboQzskoU6CLyLyQ7YQESWpiJH3I4/vBLy1DazMkBApQAFwa5WePSKipTEiIfK853EE3trr/Q2PhHQMQO9XEfl9W48IDUhYSQB6n4G/aCwvLoQEeAEPCeiREKmAl8FsDIjkz55/0RaJv1OQ/8cyqBOJjHbUgHaGgCgQWkIFO4HD/200h2EiVeThV+1IUR05ouz4/RWWwEbboc0kRLUDnj+4EYjWf8UgiGSYQ+b0LmCwzjbobx++8jbIakinwubsoej1OyRC0XKYigEeCQUi7R1S4VD+IwUgCS0G7Dc5DPVOjZKNAdo5XV3xONwDfPg4LMH52ksq/qMgMprX8oJIpspik6Wrs+qCp5fEMhO5bFH0I+9/eln8bwDFO0IimD64UgAAAABJRU5ErkJggg==";

                                                            // Square marker template
                                                            // svg shape (64x80px) with clipping path in which we embed the avatar
                                                            let squareSVG = "<svg version='1.1' id='MARKER' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' width='64px' height='80px' viewBox='0 0 64 80' enable-background='new 0 0 64 80' xml:space='preserve'> <polygon id='Pointer' fill='%23f58220' points='32,80 48,40 16,40 '/> <path id='OuterSquare' fill='%23f58220' d='M64,56c0,4.418-3.582,8-8,8H8c-4.418,0-8-3.582-8-8V8c0-4.418,3.582-8,8-8h48c4.418,0,8,3.582,8,8V56z'/><g><defs><path id='ClipPath' d='M8,59c-1.654,0-3-1.346-3-3V8c0-1.654,1.346-3,3-3h48c1.654,0,3,1.346,3,3v48c0,1.654-1.346,3-3,3H8z'/></defs><clipPath id='_clipper'><use xlink:href='%23ClipPath' overflow='visible'/></clipPath><g clip-path='url(%23_clipper)'><image overflow='visible' width='64' height='64' id='PetImage' xlink:href='AVATAR_URI_HERE'></image></g></g></svg>";

                                                            // Round marker template
                                                            // svg shape (64x80px) with clipping path in which we embed the avatar
                                                            let roundSVG = "<svg version='1.1' id='Layer_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' width='64px' height='80px' viewBox='0 0 64 80' enable-background='new 0 0 64 80' xml:space='preserve'> <g> <path fill='rgb(10, 86, 24)' d='M64,32C64,14.327,49.673,0,32,0C14.327,0,0,14.327,0,32c0,14.243,9.309,26.308,22.172,30.456L31.942,80 l9.539-17.429C54.524,58.531,64,46.372,64,32z'/> </g> <g> <defs> <circle id='Clip' cx='32' cy='32' r='28'/> </defs> <clipPath id='ClipPath'> <use xlink:href='%23Clip' overflow='visible'/> </clipPath> <image overflow='visible' clip-path='url(%23ClipPath)' width='64' height='64' id='Icon' xlink:href='AVATAR_URI_HERE' > </image> </g> </svg>"


                                                            function makeMarkerUri(imageUri) {
                                                                let svg = roundSVG;
                                                                return "data:image/svg+xml;utf-8," + svg.replace("AVATAR_URI_HERE", imageUri);
                                                            }

                                                            function startingSVGMarker(imageUri) {
                                                                let svg = roundSVG;
                                                                return "data:image/svg+xml;utf-8," + svg.replace("AVATAR_URI_HERE", imageUri);
                                                            }

                                                            let theIcon = L.icon({
                                                                iconUrl: makeMarkerUri(petAvatarUri),
                                                                shadowUrl: markerShadow,
                                                                iconSize: [50, 50],
                                                                iconAnchor: [20, 50], // bottom center is the anchor point
                                                                shadowSize: [64, 24],
                                                                shadowAnchor: [27, 12],
                                                                popupAnchor: [5, -50],
                                                            });

                                                            let startingSVGMarkerSet = L.icon({
                                                                iconUrl: startingSVGMarker(startingSVG),
                                                                shadowUrl: markerShadow,
                                                                iconSize: [50, 50],
                                                                iconAnchor: [20, 50], // bottom center is the anchor point
                                                                shadowSize: [64, 24],
                                                                shadowAnchor: [27, 12],
                                                                popupAnchor: [5, -50],
                                                            });

                                                            var locationmap = L.map('location-map', {
                                                                center: [lat, long],
                                                                zoom: 20,
                                                                scrollWheelZoom: true
                                                            });

                                                            L.marker([lat, long], {
                                                                icon: theIcon
                                                            }).addTo(locationmap);

                                                            L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', {}).addTo(locationmap);

                                                        }
                                                    </script>
                                                </div>
                                                <div class="mt-5">
                                                    <button class="btn btn-primary w-100" data-location="addLocation" data-passaccess="addLocation">Save Location</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer py-4 d-flex flex-lg-column user-select-none" id="kt_footer">
                    <div class="container-fluid d-flex flex-column justify-content-end flex-md-row flex-stack">
                        <div class="text-dark order-2 order-md-1">
                            <span class="text-muted fw-semibold me-1">
                                <script>
                                    document.write(new Date().getFullYear());
                                </script> &copy;
                            </span>
                            <span class="text-gray-800 text-hover-primary">Fiesta Appliances, Inc.</span>
                        </div>
                    </div>
                </div>
                <?php include './authsetting.php'; ?>
            </div>
        </div>
    </div>
    <div id="kt_scrolltop" class="scrolltop" data-kt-scrolltop="true">
        <i class="ki-duotone ki-arrow-up"><span class="path1"></span><span class="path2"></span></i>
    </div>
    <script src="../../assets/plugins/global/plugins.bundle.js"></script>
    <script src="../../assets/js/scripts.bundle.js"></script>
    <script src="../../assets/plugins/custom/leaflet/leaflet.bundle.js"></script>
    <script src="../../assets/plugins/custom/datatables/datatables.bundle.js"></script>
    <script src="../../assets/js/widgets.bundle.js"></script>
    <script src="../../assets/js/custom/widgets.js"></script>
    <script type="module" src="../../app/js/main.creditInvestigator.js"></script>
</body>

</html>