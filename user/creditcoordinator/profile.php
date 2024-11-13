<?php

include '../../app/connection/MYSQLSERVER.php';
include '../../app/sessions/AuthSession.php';
include '../../app/sessions/CreditCoordinatorSession.php';
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

        $infoLastname = $ruserprofile["userLastname"];
        $infoFirstName = $ruserprofile["userFirstName"];
        $infoMiddleName = $ruserprofile["userMiddleName"];
        $infoNickName = $ruserprofile["userNickName"];
        $infoGender = $ruserprofile["userGender"];
        $infoCivilStatus = $ruserprofile["userCivilStatus"];
        $infoNationality = $ruserprofile["userNationality"];
        $infoAge = $ruserprofile["userAge"];
        $infoBirthday = $ruserprofile["userDateofBirth"];
        $infoPlaceOfBirth = $ruserprofile["userPlaceofBirth"];
        $contactnumber = $ruserprofile["userContactNumber"];
        $infoAddress = $ruserprofile["userAddress"];
        $fullname = $ruserprofile["userFullName"];
        $email = $ruserprofile["user_email"];
        $infosecret = $ruserprofile["user_secret"];
    }

    $spouse = $conn->prepare("SELECT * FROM appsysusers_spouse WHERE FK_appsysUsers = '$usercode'");
    $spouse->execute();
    $cspouse = $spouse->rowCount();
    $rspouse = $spouse->fetch(PDO::FETCH_ASSOC);

    $homeownership = $conn->prepare("SELECT * FROM appsysusers_homeownership WHERE FK_appsysUsers = '$usercode'");
    $homeownership->execute();
    $chomeownership = $homeownership->rowCount();
    $rhomeownership = $homeownership->fetch(PDO::FETCH_ASSOC);



    $employment = $conn->prepare("SELECT * FROM appsysusers_employment WHERE FK_appsysUsers = '$usercode'");
    $employment->execute();
    $cemployment = $employment->rowCount();
    $remployment = $employment->fetchAll(PDO::FETCH_ASSOC);

    if ($cemployment == 0) {

        for ($i = 1; $i < 3; $i++) {

            $insert = $conn->prepare("INSERT INTO appsysusers_employment (`FK_appsysUsers`, `order`) VALUES ($usercode, $i)");
            $insert->execute();
        }
    }

    $personalpref = $conn->prepare("SELECT * FROM appsysusers_personalpref WHERE FK_appsysUsers = '$usercode'");
    $personalpref->execute();
    $cpersonalpref = $personalpref->rowCount();
    $rpersonalpref = $personalpref->fetchAll(PDO::FETCH_ASSOC);

    if ($cpersonalpref == 0) {

        for ($j = 1; $j < 3; $j++) {

            $insert = $conn->prepare("INSERT INTO appsysusers_personalpref (`FK_appsysUsers`, `order`) VALUES ($usercode, $j)");
            $insert->execute();
        }
    }

    $children = $conn->prepare("SELECT * FROM appsysusers_children WHERE FK_appsysUsers = '$usercode'");
    $children->execute();
    $cchildren = $children->rowCount();
    $rchildren = $children->fetchAll(PDO::FETCH_ASSOC);

    if ($cchildren == 0) {

        for ($k= 1; $k < 6; $k++) {

            $insert = $conn->prepare("INSERT INTO appsysusers_children (`FK_appsysUsers`, `order`) VALUES ($usercode, $k)");
            $insert->execute();
        }
    }

    $childrenv = $conn->prepare("SELECT * FROM appsysusers_children WHERE FK_appsysUsers = '$usercode' AND cname IS NOT NULL ORDER BY `order` ASC");
    $childrenv->execute();
    $cchildrenv = $childrenv->rowCount();
    $rchildrenv = $childrenv->fetchAll(PDO::FETCH_ASSOC);

    $relatives = $conn->prepare("SELECT * FROM appsysusers_relatives WHERE FK_appsysUsers = '$usercode'");
    $relatives->execute();
    $crelatives = $relatives->rowCount();
    $rrelatives = $relatives->fetchAll(PDO::FETCH_ASSOC);

    if ($crelatives == 0) {

        for ($l= 1; $l < 3; $l++) {

            $insert = $conn->prepare("INSERT INTO appsysusers_relatives (`FK_appsysUsers`, `order`) VALUES ($usercode, $l)");
            $insert->execute();
        }
    }

    $relativesenv = $conn->prepare("SELECT * FROM appsysusers_relatives WHERE FK_appsysUsers = '$usercode' AND rname IS NOT NULL ORDER BY `order` ASC");
    $relativesenv->execute();
    $crelativesenv = $relativesenv->rowCount();
    $rrelativesenv = $relativesenv->fetchAll(PDO::FETCH_ASSOC);

    $neighbors = $conn->prepare("SELECT * FROM appsysusers_neighbors WHERE FK_appsysUsers = '$usercode'");
    $neighbors->execute();
    $cneighbors = $neighbors->rowCount();
    $rneighbors = $neighbors->fetchAll(PDO::FETCH_ASSOC);

    if ($cneighbors == 0) {

        for ($m= 1; $m < 3; $m++) {

            $insert = $conn->prepare("INSERT INTO appsysusers_neighbors (`FK_appsysUsers`, `order`) VALUES ($usercode, $m)");
            $insert->execute();
        }
    }

    $neighborsenv = $conn->prepare("SELECT * FROM appsysusers_neighbors WHERE FK_appsysUsers = '$usercode' AND rname IS NOT NULL ORDER BY `order` ASC");
    $neighborsenv->execute();
    $cneighborsenv = $neighborsenv->rowCount();
    $rneighborsenv = $neighborsenv->fetchAll(PDO::FETCH_ASSOC);

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
            <div id="kt_aside" class="aside aside-default  aside-hoverable " data-kt-drawer="true" data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_aside_toggle">
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
                                    Profile <small class="text-muted fs-6 fw-normal ms-1"></small>
                                </h1>
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item text-muted">
                                        Credit Coordinator
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        <a href="profile.php" class="text-dark text-hover-primary">
                                            Profile
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap text-nowrap py-1">

                            </div>
                        </div>
                    </div>
                    <div class="post fs-6 d-flex flex-column-fluid" id="kt_post">
                        <div class="container-fluid">
                            <div class="row g-xl-12">
                                <div class="col-xxl-12">
                                    <div class="card mb-5 mb-xl-10" id="kt-container-profile">
                                        <div class="card-header border-0 cursor-pointer">
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Profile Details</h3>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Full Name</label>
                                                        <div class="col-lg-8">
                                                            <div class="row g-3">
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_lastname" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Last Name" value="<?php echo $infoLastname; ?>">
                                                                </div>
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_firstname" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="First Name" value="<?php echo $infoFirstName; ?>">
                                                                </div>
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_middlename" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Middle Name (Optional)" value="<?php echo $infoMiddleName; ?>">
                                                                </div>
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_nickname" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Nick Name" value="<?php echo $infoNickName; ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Gender</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Gender" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="select_gender">
                                                                    <option></option>
                                                                    <option value="0" <?php if ($infoGender == 0) {
                                                                                            echo "selected";
                                                                                        } ?>>Male</option>
                                                                    <option value="1" <?php if ($infoGender == 1) {
                                                                                            echo "selected";
                                                                                        } ?>>Female</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Civil Status</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Civil Status" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="select_civilstatus">
                                                                    <option></option>
                                                                    <option value="SINGLE" <?php if ($infoCivilStatus == "SINGLE") {
                                                                                                echo "selected";
                                                                                            } ?>>Single</option>
                                                                    <option value="MARRIED" <?php if ($infoCivilStatus == "MARRIED") {
                                                                                                echo "selected";
                                                                                            } ?>>Married</option>
                                                                    <option value="DIVORCED" <?php if ($infoCivilStatus == "DIVORCED") {
                                                                                                    echo "selected";
                                                                                                } ?>>Divorced</option>
                                                                    <option value="WIDOWED" <?php if ($infoCivilStatus == "WIDOWED") {
                                                                                                echo "selected";
                                                                                            } ?>>Widowed</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Nationality</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" id="ii_nationality" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Nationality" value="<?php echo $infoNationality; ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Age</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input type="number" min="0" max="200" id="ii_age" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $infoAge; ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Birthdate</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Birthdate" id="ii_birthdate" value="<?php echo $infoBirthday; ?>" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Place of Birth</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" id="ii_placeofbirth" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Place of Birth" value="<?php echo $infoPlaceOfBirth; ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Contact Number</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <div class="input-group input-group-solid mb-5">
                                                                    <span class="input-group-text fw-bolder" id="basic-addon1">+63</span>
                                                                    <input class="form-control form-control-lg form-control-solid fw-bolder" id="ii_contactnumber" inputmode="text" placeholder="___-____-___" value="<?php echo $contactnumber; ?>">
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Region</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                            <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Region" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="ii_region">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Province</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                            <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Province" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="ii_province">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">City</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                            <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select City" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="ii_city">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Barangay</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                            <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Barangay" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="ii_barangay">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Address</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <textarea id="ii_address" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Address"><?php echo $infoAddress; ?></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-end py-6 px-9">
                                                    <button type="submit" class="btn btn-primary" data-ii-updateprofile-modal-action="update" data-passaccess="updateprofile">Save Changes</button>
                                                </div>
                                                <input type="hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-spouse">
                                        <div class="card-header border-0 cursor-pointer">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">1</span>
                                                <h3 class="fw-bold m-0">Spouse</h3>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Full Name</label>
                                                        <div class="col-lg-8">
                                                            <div class="row g-3">
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_spouselastname" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Last Name" value="<?php echo $rspouse["lastName"] ?>">
                                                                </div>
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_spousefirstname" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="First Name" value="<?php echo $rspouse["firstName"] ?>">
                                                                </div>
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_spousemiddlename" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Middle Name (Optional)" value="<?php echo $rspouse["middleName"] ?>">
                                                                </div>
                                                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_spousenickname" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Nick Name" value="<?php echo $rspouse["nickName"] ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Gender</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Gender" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="select_spousegender">
                                                                    <option></option>
                                                                    <option value="0" <?php if ($rspouse["gender"] == 0) {
                                                                                            echo "selected";
                                                                                        } ?>>Male</option>
                                                                    <option value="1" <?php if ($rspouse["gender"] == 1) {
                                                                                            echo "selected";
                                                                                        } ?>>Female</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Civil Status</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Civil Status" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="select_spousecivilstatus">
                                                                    <option></option>
                                                                    <option value="SINGLE" <?php if ($rspouse["civilStatus"] == "SINGLE") {
                                                                                                echo "selected";
                                                                                            } ?>>Single</option>
                                                                    <option value="MARRIED" <?php if ($rspouse["civilStatus"] == "MARRIED") {
                                                                                                echo "selected";
                                                                                            } ?>>Married</option>
                                                                    <option value="DIVORCED" <?php if ($rspouse["civilStatus"] == "DIVORCED") {
                                                                                                    echo "selected";
                                                                                                } ?>>Divorced</option>
                                                                    <option value="WIDOWED" <?php if ($rspouse["civilStatus"] == "WIDOWED") {
                                                                                                echo "selected";
                                                                                            } ?>>Widowed</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Nationality</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" id="ii_spousenationality" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Nationality" value="<?php echo $rspouse["nationality"] ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Age</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input type="number" min="0" max="200" id="ii_spouseage" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rspouse["age"] ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Birthdate</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Birthdate" id="ii_spousebirthdate" value="<?php echo $rspouse["birthdate"] ?>" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Place of Birth</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" id="ii_spouseplaceofbirth" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Place of Birth" value="<?php echo $rspouse["placeofBirth"] ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-6">
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Contact Number</label>
                                                        <div class="col-lg-8">
                                                            <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                <div class="input-group input-group-solid mb-5">
                                                                    <span class="input-group-text fw-bolder" id="basic-addon1">+63</span>
                                                                    <input class="form-control form-control-lg form-control-solid fw-bolder" id="ii_spousecontactnumber" inputmode="text" placeholder="___-____-___" value="<?php echo $rspouse["contactNumber"] ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-end py-6 px-9">
                                                    <button type="submit" class="btn btn-primary" data-ii-updatespouse-modal-action="update" data-passaccess="updatespouse">Save Changes</button>
                                                </div>
                                                <input type="hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-homeownership">
                                        <div class="card-header border-0 cursor-pointer">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">2</span>
                                                <h3 class="fw-bold m-0">Home Ownership</h3>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <div class="col-lg-12">
                                                            <div class="row g-3 mb-10">
                                                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <div class="form-check form-check-custom form-check-solid">
                                                                        <input class="form-check-input" type="radio" value="Owned" name="ii_homeownershipradio" id="ii_homeownership1" <?php if ($rhomeownership["selectedOption"] == "Owned") {
                                                                                                                                                                                            echo "checked";
                                                                                                                                                                                        } ?> />
                                                                        <label class="form-check-label" for="ii_homeownership1">
                                                                            Owned
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <div class="form-check form-check-custom form-check-solid">
                                                                        <input class="form-check-input" type="radio" value="Renting/Boarding" name="ii_homeownershipradio" id="ii_homeownership2" <?php if ($rhomeownership["selectedOption"] == "Renting/Boarding") {
                                                                                                                                                                                                        echo "checked";
                                                                                                                                                                                                    } ?> />
                                                                        <label class="form-check-label" for="ii_homeownership2">
                                                                            Renting/Boarding
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <div class="form-check form-check-custom form-check-solid">
                                                                        <input class="form-check-input" type="radio" value="Living with Parents" name="ii_homeownershipradio" id="ii_homeownership3" <?php if ($rhomeownership["selectedOption"] == "Living with Parents") {
                                                                                                                                                                                                            echo "checked";
                                                                                                                                                                                                        } ?> />
                                                                        <label class="form-check-label" for="ii_homeownership3">
                                                                            Living w/ Parents
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 fv-row fv-plugins-icon-container">
                                                                    <div class="form-check form-check-custom form-check-solid">
                                                                        <input class="form-check-input" type="radio" value="Mortgaged" name="ii_homeownershipradio" id="ii_homeownership4" <?php if ($rhomeownership["selectedOption"] == "Mortgaged") {
                                                                                                                                                                                                echo "checked";
                                                                                                                                                                                            } ?> />
                                                                        <label class="form-check-label" for="ii_homeownership4">
                                                                            Mortgaged
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-6">
                                                                <label class="col-lg-4 col-form-label required fw-semibold fs-6">Monthly Amortization</label>
                                                                <div class="col-lg-8">
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_homeownershipmonthlyamortization" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Monthly Amortization" value="<?php if ($rhomeownership["monthlyAmortization"] != "0.00") { echo $rhomeownership["monthlyAmortization"]; } else { echo "0.00"; } ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-6">
                                                                <label class="col-lg-4 col-form-label required fw-semibold fs-6">Monthly Rental</label>
                                                                <div class="col-lg-8">
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_homeownershipmonthlyrental" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Monthly Rental" value="<?php if ($rhomeownership["monthlyAmortization"] != "0.00") { echo $rhomeownership["monthlyRental"]; } else { echo "0.00";} ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-6">
                                                                <label class="col-lg-4 col-form-label required fw-semibold fs-6">Name of Land Lord</label>
                                                                <div class="col-lg-8">
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_homeownershiplandlord" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name of Land Lord" value="<?php echo $rhomeownership["landLord"] ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-6">
                                                                <label class="col-lg-4 col-form-label required fw-semibold fs-6">Number of Years of Stay</label>
                                                                <div class="col-lg-8">
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_homeownershipyearsstay" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Years of Stay" value="<?php echo $rhomeownership["yearsStay"] ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-6">
                                                                <label class="col-lg-4 col-form-label fw-semibold fs-6">PREVIOUS ADDRESS (House No., Street, Brgy, City/Municipality, Province) </label>
                                                                <div class="col-lg-8">
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_homeownershippreviousaddress" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Previous Address" value="<?php echo $rhomeownership["previousAddress"] ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-end py-6 px-9">
                                                    <button type="submit" class="btn btn-primary" data-ii-updatehomeownership-modal-action="update" data-passaccess="updatehomeownership">Save Changes</button>
                                                </div>
                                                <input type="hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-employment">
                                        <div class="card-header border-0 cursor-pointer d-flex align-items-center">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">3</span>
                                                <h3 class="fw-bold m-0">Employment</h3>
                                            </div>
                                        </div>
                                        <div class="blockui">
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Name of Employer or Business</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_employmentemployerbusiness_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name of Employer or Business" value="<?php echo $remployment[0]["employerName"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Telephone Number</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_employmenttelephonenumber_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Telephone Number" value="<?php echo $remployment[0]["telephoneNumber"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Position</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_employmentposition_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Position" value="<?php echo $remployment[0]["position"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Number of Years Employed</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_employmentyearsemployed_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Years Employed" value="<?php echo $remployment[0]["yearsEmployed"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Name of Employer or Business</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_employmentemployerbusiness_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name of Employer or Business" value="<?php echo $remployment[1]["employerName"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Telephone Number</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_employmenttelephonenumber_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Telephone Number" value="<?php echo $remployment[1]["telephoneNumber"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Position</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_employmentposition_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Position" value="<?php echo $remployment[1]["position"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Number of Years Employed</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_employmentyearsemployed_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Years Employed" value="<?php echo $remployment[1]["yearsEmployed"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-end py-6 px-9 gap-3">
                                                    <button type="submit" class="btn btn-primary" data-ii-updateemployment-modal-action="update" data-passaccess="updateemployment">Save Changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-personal">
                                        <div class="card-header border-0 cursor-pointer d-flex align-items-center">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">4</span>
                                                <h3 class="fw-bold m-0">Personal Preferences</h3>
                                            </div>
                                        </div>
                                        <div class="blockui">
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Father's Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_personalfname_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Father's Name" value="<?php echo $rpersonalpref[0]["pname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_personalfage_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rpersonalpref[0]["age"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">HOME ADDRESS (House No., Street, Brgy, City/Municipality, Province)</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_personaladdress_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Home Address" value="<?php echo $rpersonalpref[0]["homeAddress"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Employer</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_personalemployer_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Employer" value="<?php echo $rpersonalpref[0]["employer"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="col-form-label fw-semibold fs-6">Employer Address</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_personalemployeraddress_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Employer Address" value="<?php echo $rpersonalpref[0]["employerAddress"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="row mb-6">
                                                            <div class="col-lg-3">
                                                                <label class="col-form-label fw-semibold fs-6">Mother's Name</label>
                                                                <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_personalmname_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Mother's Name" value="<?php echo $rpersonalpref[1]["pname"]; ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                    <input type="number" min="0" max="200" id="ii_personalmage_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rpersonalpref[1]["age"]; ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label class="col-form-label fw-semibold fs-6">HOME ADDRESS (House No., Street, Brgy, City/Municipality, Province)</label>
                                                                <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_personaladdress_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Home Address" value="<?php echo $rpersonalpref[1]["homeAddress"]; ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label class="col-form-label fw-semibold fs-6">Employer</label>
                                                                <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_personalemployer_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Employer" value="<?php echo $rpersonalpref[1]["employer"]; ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label class="col-form-label fw-semibold fs-6">Employer Address</label>
                                                                <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                    <input type="text" id="ii_personalemployeraddress_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Employer Address" value="<?php echo $rpersonalpref[1]["employerAddress"]; ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-end py-6 px-9 gap-3">
                                            <button type="submit" class="btn btn-primary" data-ii-updatepersonal-modal-action="update" data-passaccess="updatepersonal">Save Changes</button>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-children">
                                        <div class="card-header border-0 cursor-pointer d-flex align-items-center">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">5</span>
                                                <h3 class="fw-bold m-0">Children</h3>
                                            </div>
                                        </div>
                                        <div class="blockui">
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenname_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rchildrenv[0]["cname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_childrenage_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rchildrenv[0]["age"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Graduate/Year</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrengraduate_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Graduate/Year" value="<?php echo $rchildrenv[0]["graduateYear"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">School</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenschool_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="School" value="<?php echo $rchildrenv[0]["school"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenname_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rchildrenv[1]["cname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_childrenage_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rchildrenv[1]["age"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Graduate/Year</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrengraduate_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Graduate/Year" value="<?php echo $rchildrenv[1]["graduateYear"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">School</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenschool_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="School" value="<?php echo $rchildrenv[1]["school"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenname_3" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rchildrenv[2]["cname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_childrenage_3" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rchildrenv[2]["age"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Graduate/Year</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrengraduate_3" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Graduate/Year" value="<?php echo $rchildrenv[2]["graduateYear"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">School</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenschool_3" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="School" value="<?php echo $rchildrenv[2]["school"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenname_4" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rchildrenv[3]["cname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_childrenage_4" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rchildrenv[3]["age"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Graduate/Year</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrengraduate_4" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Graduate/Year" value="<?php echo $rchildrenv[3]["graduateYear"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">School</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenschool_4" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="School" value="<?php echo $rchildrenv[3]["school"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenname_5" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rchildrenv[4]["cname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Age</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="number" min="0" max="200" id="ii_childrenage_5" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Age" value="<?php echo $rchildrenv[4]["age"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">Graduate/Year</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrengraduate_5" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Graduate/Year" value="<?php echo $rchildrenv[4]["graduateYear"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <label class="col-form-label fw-semibold fs-6">School</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_childrenschool_5" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="School" value="<?php echo $rchildrenv[4]["school"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-end py-6 px-9 gap-3">
                                            <button type="submit" class="btn btn-primary" data-ii-updatechildren-modal-action="update" data-passaccess="updatechildren">Save Changes</button>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-relatives">
                                        <div class="card-header border-0 cursor-pointer d-flex align-items-center">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">6</span>
                                                <h3 class="fw-bold m-0">Relatives (Not living with you)</h3>
                                            </div>
                                        </div>
                                        <div class="blockui">
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_relativesname_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rrelativesenv[0]["rname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Address</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_relativesaddress_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Address" value="<?php echo $rrelativesenv[0]["raddress"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Cellphone Number</label>
                                                                    <div class="input-group input-group-solid mb-5">
                                                                        <span class="input-group-text fw-bolder" id="basic-addon1">+63</span>
                                                                        <input class="form-control form-control-lg form-control-solid fw-bolder" id="ii_relativescpnumber_1" inputmode="text" placeholder="___-____-___" value="<?php echo $rrelativesenv[0]["cellphoneNumber"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_relativesname_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rrelativesenv[1]["rname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Address</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_relativesaddress_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Address" value="<?php echo $rrelativesenv[1]["raddress"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Cellphone Number</label>
                                                                    <div class="input-group input-group-solid mb-5">
                                                                        <span class="input-group-text fw-bolder" id="basic-addon1">+63</span>
                                                                        <input class="form-control form-control-lg form-control-solid fw-bolder" id="ii_relativescpnumber_2" inputmode="text" placeholder="___-____-___" value="<?php echo $rrelativesenv[1]["cellphoneNumber"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-end py-6 px-9 gap-3">
                                            <button type="submit" class="btn btn-primary" data-ii-updaterelatives-modal-action="update" data-passaccess="updaterelatives">Save Changes</button>
                                        </div>
                                    </div>
                                    <div class="card mb-5 mb-xl-10" id="kt-container-neighbors">
                                        <div class="card-header border-0 cursor-pointer d-flex align-items-center">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <span class="rounded bg-primary pt-1 pe-3 ps-3 pb-1 text-white">7</span>
                                                <h3 class="fw-bold m-0">Neighbors</h3>
                                            </div>
                                        </div>
                                        <div class="blockui">
                                            <div>
                                                <div class="card-body border-top p-9">
                                                    <div class="row mb-6">
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_neighborsname_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rneighborsenv[0]["rname"]; ?>" >
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Address</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_neighborsaddress_1" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Address" value="<?php echo $rneighborsenv[0]["raddress"]; ?>" >
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Cellphone Number</label>
                                                                    <div class="input-group input-group-solid mb-5">
                                                                        <span class="input-group-text fw-bolder" id="basic-addon1">+63</span>
                                                                        <input class="form-control form-control-lg form-control-solid fw-bolder" id="ii_neighborscpnumber_1" inputmode="text" placeholder="___-____-___" value="<?php echo $rneighborsenv[0]["cellphoneNumber"]; ?>" >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <hr class="text-muted">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="row mb-6">
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Name</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_neighborsname_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Name" value="<?php echo $rneighborsenv[1]["rname"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Address</label>
                                                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                                                        <input type="text" id="ii_neighborsaddress_2" class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Address" value="<?php echo $rneighborsenv[1]["raddress"]; ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="col-form-label fw-semibold fs-6">Cellphone Number</label>
                                                                    <div class="input-group input-group-solid mb-5">
                                                                        <span class="input-group-text fw-bolder" id="basic-addon1">+63</span>
                                                                        <input class="form-control form-control-lg form-control-solid fw-bolder" id="ii_neighborscpnumber_2" inputmode="text" placeholder="___-____-___" value="<?php echo $rneighborsenv[1]["cellphoneNumber"]; ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-end py-6 px-9 gap-3">
                                            <button type="submit" class="btn btn-primary" data-ii-updateneighbors-modal-action="update" data-passaccess="updateneighbors">Save Changes</button>
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
    <script src="../../assets/plugins/custom/daterangepicker/daterangepicker.min.js"></script>
    <script src="../../assets/plugins/custom/daterangepicker/flatpicker.min.js"></script>
    <script src="../../assets/plugins/custom/inputmask/inputmask.min.js"></script>
    <script type="module" src="../../app/js/main.userprofileScript.js"></script>
</body>

</html>