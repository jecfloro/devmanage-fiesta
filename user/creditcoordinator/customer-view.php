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
        $fullname = $ruserprofile["userFullName"];
        $email = $ruserprofile["user_email"];
    }

    $uid = $_GET["uid"];

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

    $spouse = $conn->prepare("SELECT * FROM appsysusers_spouse WHERE FK_appsysUsers = '$uid'");
    $spouse->execute();
    $cspouse = $spouse->rowCount();
    $rspouse = $spouse->fetch(PDO::FETCH_ASSOC);

    $homeownership = $conn->prepare("SELECT * FROM appsysusers_homeownership WHERE FK_appsysUsers = '$uid'");
    $homeownership->execute();
    $chomeownership = $homeownership->rowCount();
    $rhomeownership = $homeownership->fetch(PDO::FETCH_ASSOC);

    $employment = $conn->prepare("SELECT * FROM appsysusers_employment WHERE FK_appsysUsers = '$uid'");
    $employment->execute();
    $cemployment = $employment->rowCount();
    $remployment = $employment->fetchAll(PDO::FETCH_ASSOC);

    $personalpref = $conn->prepare("SELECT * FROM appsysusers_personalpref WHERE FK_appsysUsers = '$uid'");
    $personalpref->execute();
    $cpersonalpref = $personalpref->rowCount();
    $rpersonalpref = $personalpref->fetchAll(PDO::FETCH_ASSOC);

    $children = $conn->prepare("SELECT * FROM appsysusers_children WHERE FK_appsysUsers = '$uid'");
    $children->execute();
    $cchildren = $children->rowCount();
    $rchildren = $children->fetchAll(PDO::FETCH_ASSOC);

    $relatives = $conn->prepare("SELECT * FROM appsysusers_relatives WHERE FK_appsysUsers = '$uid'");
    $relatives->execute();
    $crelatives = $relatives->rowCount();
    $rrelatives = $relatives->fetchAll(PDO::FETCH_ASSOC);
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
                                        Credit Coordinator
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
                                <div class="col-xl-12 order-lg-0">
                                    <div class="card">
                                        <div class="card-header cursor-pointer">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <h3 class="fw-bolder m-0">APPLICANT DETAILS</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">LAST NAME</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userLastname"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">FIRST NAME</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userFirstName"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">MIDDLE NAME</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userMiddleName"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NICKNAME</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userNickName"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">GENDER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($ruser["userGender"] == 1) { ?>
                                                                    FEMALE
                                                                <?php } else { ?>
                                                                    MALE
                                                                <?php }  ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">CIVIL STATUS</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userCivilStatus"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NATIONALITY</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userNationality"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">AGE</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userAge"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">DATE OF BIRTH</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userDateofBirth"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">PLACE OF BIRTH</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userPlaceofBirth"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">CONTACT NUMBER</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userContactNumber"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">ADDRESS</span>
                                                            <span class="fw-bolder fs-4"><?php echo $ruser["userAddress"] . ", " . $ruser["userBarangay"] . ", " . $ruser["userCity"] . ", " . $ruser["userProvince"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <?php if ($cspouse > 0) { ?>
                                        <div class="card mt-5">
                                            <div class="card-header cursor-pointer">
                                                <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                    <h3 class="fw-bolder m-0">SPOUSE DETAILS</h3>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <td colspan="4">
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">LAST NAME</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["lastName"] ?></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">FIRST NAME</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["firstName"] ?></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">MIDDLE NAME</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["middleName"] ?></span>
                                                            </div>
                                                        </td>
                                                        <td colspan="2">
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">NICKNAME</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["nickName"] ?></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">DATE OF BIRTH</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["birthdate"] ?></span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">NATIONALITY</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["nationality"] ?></span>
                                                            </div>
                                                        </td>
                                                        <td colspan="2">
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">AGE</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["age"] ?></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">PLACE OF BIRTH</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["placeofBirth"] ?></span>
                                                            </div>
                                                        </td>
                                                        <td colspan="2">
                                                            <div class="d-flex flex-column">
                                                                <span class="fs-8">CONTACT NUMBER</span>
                                                                <span class="fw-bolder fs-4"><?php echo $rspouse["contactNumber"] ?></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <div class="card mt-5">
                                        <div class="card-header cursor-pointer">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <h3 class="fw-bolder m-0">HOME OWNERSHIP</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">OWNED</span>
                                                            <?php if ($rhomeownership["selectedOption"] == "Owned") { ?>
                                                                <i class="ki-duotone ki-check-square text-primary fs-2x">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                </i>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">RENTING/BOARDING</span>
                                                            <?php if ($rhomeownership["selectedOption"] == "Renting/Boarding") { ?>
                                                                <i class="ki-duotone ki-check-square text-primary fs-2x">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                </i>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">LIVING W/ PARENTS</span>
                                                            <?php if ($rhomeownership["selectedOption"] == "Living with Parents") { ?>
                                                                <i class="ki-duotone ki-check-square text-primary fs-2x">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                </i>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">MORTGAGED</span>
                                                            <?php if ($rhomeownership["selectedOption"] == "Mortgaged") { ?>
                                                                <i class="ki-duotone ki-check-square text-primary fs-2x">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                </i>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">MONTHLY AMORTIZATION</span>
                                                            <span class="fw-bolder fs-4"><?php echo $rhomeownership["monthlyAmortization"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">MONTHLY RENTAL</span>
                                                            <span class="fw-bolder fs-4"><?php echo $rhomeownership["monthlyRental"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NAME OF LAND LORD</span>
                                                            <span class="fw-bolder fs-4"><?php echo $rhomeownership["landLord"] ?></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NUMBER OF YEARS OF STAY</span>
                                                            <span class="fw-bolder fs-4"><?php echo $rhomeownership["yearsStay"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">PREVIOUS ADDRESS</span>
                                                            <span class="fw-bolder fs-4"><?php echo $rhomeownership["previousAddress"] ?></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NAME OF EMPLOYER OR BUSINESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[0]["employerName"] != "") { ?>
                                                                    <?php echo $remployment[0]["employerName"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">TEL NUMBER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[0]["telephoneNumber"] != "") { ?>
                                                                    <?php echo $remployment[0]["telephoneNumber"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">ADDRESS OF EMPLOYER OR BUSINESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <span class="opacity-0"><?php echo 1; ?></span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">POSITION</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[0]["position"] != "") { ?>
                                                                    <?php echo $remployment[0]["position"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8"># OF YRS. EMPLOYED</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[0]["yearsEmployed"] != "") { ?>
                                                                    <?php echo $remployment[0]["yearsEmployed"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">EMPLOYMENT STATUS</span>
                                                            <span class="fw-bolder fs-4"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <!--  -->
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NAME OF EMPLOYER OR BUSINESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[1]["employerName"] != "") { ?>
                                                                    <?php echo $remployment[1]["employerName"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">TEL NUMBER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[1]["telephoneNumber"] != "") { ?>
                                                                    <?php echo $remployment[1]["telephoneNumber"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">ADDRESS OF EMPLOYER OR BUSINESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <span class="opacity-0"><?php echo 1; ?></span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">POSITION</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[1]["position"] != "") { ?>
                                                                    <?php echo $remployment[1]["position"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8"># OF YRS. EMPLOYED</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($remployment[1]["yearsEmployed"] != "") { ?>
                                                                    <?php echo $remployment[1]["yearsEmployed"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">EMPLOYMENT STATUS</span>
                                                            <span class="fw-bolder fs-4"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card mt-5">
                                        <div class="card-header cursor-pointer">
                                            <div class="card-title m-0 d-flex gap-3 align-items-center">
                                                <h3 class="fw-bolder m-0">PERSONAL PREFERENCES</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">FATHER'S NAME</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[0]["pname"] != "") { ?>
                                                                    <?php echo $rpersonalpref[0]["pname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[0]["age"] != "") { ?>
                                                                    <?php echo $rpersonalpref[0]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">HOME ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[0]["homeAddress"] != "") { ?>
                                                                    <?php echo $rpersonalpref[0]["homeAddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="1">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">EMPLOYER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[0]["employer"] != "") { ?>
                                                                    <?php echo $rpersonalpref[0]["employer"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="3">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">EMPLOYER'S ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[0]["employerAddress"] != "") { ?>
                                                                    <?php echo $rpersonalpref[0]["employerAddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">FATHER'S NAME</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[1]["pname"] != "") { ?>
                                                                    <?php echo $rpersonalpref[1]["pname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[1]["age"] != "") { ?>
                                                                    <?php echo $rpersonalpref[1]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">HOME ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[1]["homeAddress"] != "") { ?>
                                                                    <?php echo $rpersonalpref[1]["homeAddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="1">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">EMPLOYER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[1]["employer"] != "") { ?>
                                                                    <?php echo $rpersonalpref[1]["employer"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="3">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">EMPLOYER'S ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rpersonalpref[1]["employerAddress"] != "") { ?>
                                                                    <?php echo $rpersonalpref[1]["employerAddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NAME OF YOUR CHILD/CHILDREN</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[0]["cname"] != "") { ?>
                                                                    <?php echo $rchildren[0]["cname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[0]["age"] != "") { ?>
                                                                    <?php echo $rchildren[0]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">GRADE/YEAR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[0]["graduateYear"] != "") { ?>
                                                                    <?php echo $rchildren[0]["graduateYear"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">SCHOOL</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[0]["school"] != "") { ?>
                                                                    <?php echo $rchildren[0]["school"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">NAME OF YOUR CHILD/CHILDREN</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[1]["cname"] != "") { ?>
                                                                    <?php echo $rchildren[1]["cname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[1]["age"] != "") { ?>
                                                                    <?php echo $rchildren[1]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">GRADE/YEAR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[1]["graduateYear"] != "") { ?>
                                                                    <?php echo $rchildren[1]["graduateYear"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">SCHOOL</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[1]["school"] != "") { ?>
                                                                    <?php echo $rchildren[1]["school"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">NAME OF YOUR CHILD/CHILDREN</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[2]["cname"] != "") { ?>
                                                                    <?php echo $rchildren[2]["cname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[2]["age"] != "") { ?>
                                                                    <?php echo $rchildren[2]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">GRADE/YEAR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[2]["graduateYear"] != "") { ?>
                                                                    <?php echo $rchildren[2]["graduateYear"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">SCHOOL</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[2]["school"] != "") { ?>
                                                                    <?php echo $rchildren[2]["school"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">NAME OF YOUR CHILD/CHILDREN</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[3]["cname"] != "") { ?>
                                                                    <?php echo $rchildren[3]["cname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[3]["age"] != "") { ?>
                                                                    <?php echo $rchildren[3]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">GRADE/YEAR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[3]["graduateYear"] != "") { ?>
                                                                    <?php echo $rchildren[3]["graduateYear"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">SCHOOL</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[3]["school"] != "") { ?>
                                                                    <?php echo $rchildren[3]["school"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">NAME OF YOUR CHILD/CHILDREN</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[4]["cname"] != "") { ?>
                                                                    <?php echo $rchildren[4]["cname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">AGE</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[4]["age"] != "") { ?>
                                                                    <?php echo $rchildren[4]["age"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">GRADE/YEAR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[4]["graduateYear"] != "") { ?>
                                                                    <?php echo $rchildren[4]["graduateYear"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">SCHOOL</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rchildren[4]["school"] != "") { ?>
                                                                    <?php echo $rchildren[4]["school"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NAME OF RELATIVES</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[0]["rname"] != "") { ?>
                                                                    <?php echo $rrelatives[0]["rname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">HOME ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[0]["raddress"] != "") { ?>
                                                                    <?php echo $rrelatives[0]["raddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">CELLPHONE NUMBER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[0]["cellphoneNumber"] != "") { ?>
                                                                    <?php echo $rrelatives[0]["cellphoneNumber"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">NAME OF RELATIVES</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[1]["rname"] != "") { ?>
                                                                    <?php echo $rrelatives[1]["rname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">HOME ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[1]["raddress"] != "") { ?>
                                                                    <?php echo $rrelatives[1]["raddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">CELLPHONE NUMBER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[1]["cellphoneNumber"] != "") { ?>
                                                                    <?php echo $rrelatives[1]["cellphoneNumber"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">NAME OF NEIGHBOR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[0]["rname"] != "") { ?>
                                                                    <?php echo $rrelatives[0]["rname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">HOME ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[0]["raddress"] != "") { ?>
                                                                    <?php echo $rrelatives[0]["raddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8">CELLPHONE NUMBER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[0]["cellphoneNumber"] != "") { ?>
                                                                    <?php echo $rrelatives[0]["cellphoneNumber"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">NAME OF NEIGHBOR</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[1]["rname"] != "") { ?>
                                                                    <?php echo $rrelatives[1]["rname"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">HOME ADDRESS</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[1]["raddress"] != "") { ?>
                                                                    <?php echo $rrelatives[1]["raddress"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-column">
                                                            <span class="fs-8 opacity-0">CELLPHONE NUMBER</span>
                                                            <span class="fw-bolder fs-4">
                                                                <?php if ($rrelatives[1]["cellphoneNumber"] != "") { ?>
                                                                    <?php echo $rrelatives[1]["cellphoneNumber"]; ?>
                                                                <?php } else { ?>
                                                                    <span class="opacity-0"><?php echo 1; ?></span>
                                                                <?php } ?>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
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
    <script src="../../assets/js/datatables/tb-customer.js"></script>
    <script type="module" src="../../app/js/main.creditCoordinator.js"></script>
</body>

</html>