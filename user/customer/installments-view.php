<?php

include '../../app/connection/MYSQLSERVER.php';
include '../../app/sessions/AuthSession.php';
include '../../app/sessions/CustomerSession.php';
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

    if ($ruserprofile["isProfileFilled"] != 1 && $ruserprofile["isHomeOwnershipFilled"] != 1 && $ruserprofile["isEmploymentFilled"] != 1 && $ruserprofile["isPersonalPrefFilled"] != 1 && $ruserprofile["isRelativesFilled"] != 1 && $ruserprofile["isNeighborFilled"] != 1) {
        header("Location: /");
    }

    $iid = $_GET["iid"];

    $installments = $conn->prepare("SELECT * FROM mn_installments JOIN msc_products ON mn_installments.FK_mscProducts = msc_products.PK_mscProducts JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE FK_appsysUsers = '$usercode' AND PK_mn_installments = '$iid'");
    $installments->execute();
    $cinstallments = $installments->rowCount();
    $rinstallments = $installments->fetch(PDO::FETCH_ASSOC);

    if ($iid == "") {
        header("Location: installments.php");
    }

    if ($cinstallments == 0) {
        header("Location: installments.php");
    }

    $attachments = $conn->prepare("SELECT * FROM mm_attachments WHERE FK_mn_installments = '$iid'");
    $attachments->execute();
    $cattachments = $attachments->rowCount();
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
                                    Fiest Appliances <small class="text-muted fs-6 fw-normal ms-1"></small>
                                </h1>
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item text-muted">
                                        Installments
                                    </li>
                                    <li class="breadcrumb-item">
                                        <?php echo $rinstallments["productName"] ?>
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
                                <div class="col-xxl-12">
                                    <div class="card">
                                        <div class="card-body d-flex justify-content-between flex-wrap gap-3">
                                            <div class="d-flex flex-column">
                                                <h3 class="fw-bolder"><?php echo $rinstallments["productName"] ?></h3>
                                                <span>#<?php echo $rinstallments["installmentCode"] ?></span>
                                            </div>
                                            <?php if ($rinstallments["installmentStatus"] == "PENDING") { ?>
                                                <button class="btn btn-danger" data-ii-cancelinstallment-modal-action="cancel" data-passaccess="cancelinstallment" data-id="<?php echo $iid; ?>">Cancel Installment</button>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Installment Details</h3>
                                            </div>
                                        </div>
                                        <div class="card-body d-flex justify-content-start flex-wrap">
                                            <?php if ($rinstallments["installmentStatus"] == "CANCELLED") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder">CANCELLED</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Cancelled Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["cancelledDate"])) ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } ?>
                                            <?php if ($rinstallments["installmentStatus"] == "REJECTED") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder">REJECTED</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Rejected By</td>
                                                            <td class="fw-bolder">
                                                                <?php 

                                                                    $uid = $rinstallments["rejectedBy"];
                                                                
                                                                    // Fetch the name of the approved by user
                                                                    $approvedby = $conn->prepare("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$uid'");
                                                                    $approvedby->execute();
                                                                    $rapprovedby = $approvedby->fetch(PDO::FETCH_ASSOC);

                                                                    echo $rapprovedby["userFullName"];
                                                                
                                                                ?>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Rejected Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["rejectedDate"])) ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Reason</td>
                                                            <td class="fw-bolder"><?php echo $rinstallments["rejectReason"]; ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } ?>
                                            <?php if ($rinstallments["installmentStatus"] == "PENDING") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder">WAITING FOR REVIEW</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Requested Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["requestedDate"])) ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } ?>
                                            <?php if ($rinstallments["installmentStatus"] == "APPROVED") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder">APPROVED</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Approved By</td>
                                                            <td class="fw-bolder">
                                                                <?php 

                                                                    $uid = $rinstallments["approvedBy"];
                                                                
                                                                    // Fetch the name of the approved by user
                                                                    $approvedby = $conn->prepare("SELECT * FROM appsysusers WHERE PK_appsysUsers = '$uid'");
                                                                    $approvedby->execute();
                                                                    $rapprovedby = $approvedby->fetch(PDO::FETCH_ASSOC);

                                                                    echo $rapprovedby["userFullName"];
                                                                
                                                                ?>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Approved Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["approvedDate"])) ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } ?>
                                            <?php if ($rinstallments["installmentStatus"] == "COMPLETED") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder">COMPLETED</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Approved By</td>
                                                            <td class="fw-bolder">JECO</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Approved Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["approvedDate"])) ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Completed Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["completedDate"])) ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Attachments</h3>
                                            </div>
                                        </div>
                                        <div class="card-body d-flex flex-wrap gap-3">
                                            <?php if ($cattachments < 0) { ?>
                                                <?php while ($rattachments = $attachments->fetch(PDO::FETCH_ASSOC)) { ?>
                                                    <div class="mb-3">
                                                        <a href="attachment-view.php?filename=<?php echo $rattachments["attachmentCode"]; ?>" target="_blank" class="d-flex align-items-center">
                                                            <div class="symbol symbol-50px me-5">
                                                                <svg height="50" width="50" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 303.188 303.188" xml:space="preserve">
                                                                    <g>
                                                                        <polygon style="fill:#E8E8E8;" points="219.821,0 32.842,0 32.842,303.188 270.346,303.188 270.346,50.525 	"></polygon>
                                                                        <path style="fill:#FB3449;" d="M230.013,149.935c-3.643-6.493-16.231-8.533-22.006-9.451c-4.552-0.724-9.199-0.94-13.803-0.936
                                                                            c-3.615-0.024-7.177,0.154-10.693,0.354c-1.296,0.087-2.579,0.199-3.861,0.31c-1.314-1.36-2.584-2.765-3.813-4.202
                                                                            c-7.82-9.257-14.134-19.755-19.279-30.664c1.366-5.271,2.459-10.772,3.119-16.485c1.205-10.427,1.619-22.31-2.288-32.251
                                                                            c-1.349-3.431-4.946-7.608-9.096-5.528c-4.771,2.392-6.113,9.169-6.502,13.973c-0.313,3.883-0.094,7.776,0.558,11.594
                                                                            c0.664,3.844,1.733,7.494,2.897,11.139c1.086,3.342,2.283,6.658,3.588,9.943c-0.828,2.586-1.707,5.127-2.63,7.603
                                                                            c-2.152,5.643-4.479,11.004-6.717,16.161c-1.18,2.557-2.335,5.06-3.465,7.507c-3.576,7.855-7.458,15.566-11.815,23.02
                                                                            c-10.163,3.585-19.283,7.741-26.857,12.625c-4.063,2.625-7.652,5.476-10.641,8.603c-2.822,2.952-5.69,6.783-5.941,11.024
                                                                            c-0.141,2.394,0.807,4.717,2.768,6.137c2.697,2.015,6.271,1.881,9.4,1.225c10.25-2.15,18.121-10.961,24.824-18.387
                                                                            c4.617-5.115,9.872-11.61,15.369-19.465c0.012-0.018,0.024-0.036,0.037-0.054c9.428-2.923,19.689-5.391,30.579-7.205
                                                                            c4.975-0.825,10.082-1.5,15.291-1.974c3.663,3.431,7.621,6.555,11.939,9.164c3.363,2.069,6.94,3.816,10.684,5.119
                                                                            c3.786,1.237,7.595,2.247,11.528,2.886c1.986,0.284,4.017,0.413,6.092,0.335c4.631-0.175,11.278-1.951,11.714-7.57
                                                                            C231.127,152.765,230.756,151.257,230.013,149.935z M119.144,160.245c-2.169,3.36-4.261,6.382-6.232,9.041
                                                                            c-4.827,6.568-10.34,14.369-18.322,17.286c-1.516,0.554-3.512,1.126-5.616,1.002c-1.874-0.11-3.722-0.937-3.637-3.065
                                                                            c0.042-1.114,0.587-2.535,1.423-3.931c0.915-1.531,2.048-2.935,3.275-4.226c2.629-2.762,5.953-5.439,9.777-7.918
                                                                            c5.865-3.805,12.867-7.23,20.672-10.286C120.035,158.858,119.587,159.564,119.144,160.245z M146.366,75.985
                                                                            c-0.602-3.514-0.693-7.077-0.323-10.503c0.184-1.713,0.533-3.385,1.038-4.952c0.428-1.33,1.352-4.576,2.826-4.993
                                                                            c2.43-0.688,3.177,4.529,3.452,6.005c1.566,8.396,0.186,17.733-1.693,25.969c-0.299,1.31-0.632,2.599-0.973,3.883
                                                                            c-0.582-1.601-1.137-3.207-1.648-4.821C147.945,83.048,146.939,79.482,146.366,75.985z M163.049,142.265
                                                                            c-9.13,1.48-17.815,3.419-25.979,5.708c0.983-0.275,5.475-8.788,6.477-10.555c4.721-8.315,8.583-17.042,11.358-26.197
                                                                            c4.9,9.691,10.847,18.962,18.153,27.214c0.673,0.749,1.357,1.489,2.053,2.22C171.017,141.096,166.988,141.633,163.049,142.265z
                                                                            M224.793,153.959c-0.334,1.805-4.189,2.837-5.988,3.121c-5.316,0.836-10.94,0.167-16.028-1.542
                                                                            c-3.491-1.172-6.858-2.768-10.057-4.688c-3.18-1.921-6.155-4.181-8.936-6.673c3.429-0.206,6.9-0.341,10.388-0.275
                                                                            c3.488,0.035,7.003,0.211,10.475,0.664c6.511,0.726,13.807,2.961,18.932,7.186C224.588,152.585,224.91,153.321,224.793,153.959z"></path>
                                                                                        <polygon style="fill:#FB3449;" points="227.64,25.263 32.842,25.263 32.842,0 219.821,0 	"></polygon>
                                                                                        <g>
                                                                                            <path style="fill:#A4A9AD;" d="M126.841,241.152c0,5.361-1.58,9.501-4.742,12.421c-3.162,2.921-7.652,4.381-13.472,4.381h-3.643
                                                                            v15.917H92.022v-47.979h16.606c6.06,0,10.611,1.324,13.652,3.971C125.321,232.51,126.841,236.273,126.841,241.152z
                                                                            M104.985,247.387h2.363c1.947,0,3.495-0.546,4.644-1.641c1.149-1.094,1.723-2.604,1.723-4.529c0-3.238-1.794-4.857-5.382-4.857
                                                                            h-3.348C104.985,236.36,104.985,247.387,104.985,247.387z"></path>
                                                                                            <path style="fill:#A4A9AD;" d="M175.215,248.864c0,8.007-2.205,14.177-6.613,18.509s-10.606,6.498-18.591,6.498h-15.523v-47.979
                                                                            h16.606c7.701,0,13.646,1.969,17.836,5.907C173.119,235.737,175.215,241.426,175.215,248.864z M161.76,249.324
                                                                            c0-4.398-0.87-7.657-2.609-9.78c-1.739-2.122-4.381-3.183-7.926-3.183h-3.773v26.877h2.888c3.939,0,6.826-1.143,8.664-3.43
                                                                            C160.841,257.523,161.76,254.028,161.76,249.324z"></path>
                                                                                            <path style="fill:#A4A9AD;" d="M196.579,273.871h-12.766v-47.979h28.355v10.403h-15.589v9.156h14.374v10.403h-14.374
                                                                            L196.579,273.871L196.579,273.871z"></path>
                                                                        </g>
                                                                        <polygon style="fill:#D1D3D3;" points="219.821,50.525 270.346,50.525 219.821,0 	"></polygon>
                                                                    </g>
                                                                </svg>
                                                            </div>
                                                            <div class="d-flex flex-column">
                                                                <div class="fw-bold fs-6 text-dark text-hover-primary"><?php echo $rattachments["attachmentName"] ?></div>
                                                                <div class="text-muted fs-7">
                                                                    <?php echo date("F d, Y", strtotime($rattachments["attachmentDate"])) ?>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>

                                                <?php } ?>
                                            <?php } else { ?>
                                                <div class="">No Attachments</div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <?php if ($rinstallments["installmentStatus"] == "APPROVED" || $rinstallments["installmentStatus"] == "COMPLETED") { ?>
                                    <div class="col-xl-7">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title m-0">
                                                    <h3 class="fw-bold m-0">Payment Schedule</h3>
                                                </div>
                                            </div>
                                            <div class="card-body d-flex justify-content-end flex-wrap">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-5">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title m-0">
                                                    <h3 class="fw-bold m-0">Payment History</h3>
                                                </div>
                                            </div>
                                            <div class="card-body d-flex justify-content-end flex-wrap">

                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
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
    <script type="module" src="../../app/js/main.customerScript.js"></script>
</body>

</html>