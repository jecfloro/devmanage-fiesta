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

    $iid = $_GET["iid"];
    $uid = $_GET["uid"];

    $_SESSION["tempuid"] = $iid;

    $installments = $conn->prepare("SELECT * FROM mn_installments JOIN msc_products ON mn_installments.FK_mscProducts = msc_products.PK_mscProducts JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE FK_appsysUsers = '$uid' AND PK_mn_installments = '$iid'");
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
                                    Fiesta Appliances <small class="text-muted fs-6 fw-normal ms-1"></small>
                                </h1>
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item text-muted">
                                        Credit Coordinator
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        <a href="installments.php" class="text-dark">Installments</a>
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
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Installment Details</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <?php if ($rinstallments["installmentStatus"] == "CANCELLED") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder w-75">CANCELLED</td>
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
                                                            <td class="fw-bolder w-75">REJECTED</td>
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
                                                            <td class="fw-bolder w-75">WAITING FOR REVIEW</td>
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
                                                            <td class="fw-bolder w-75">APPROVED</td>
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

                                                <table class="table table-bordered mt-10">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Product Price</td>
                                                            <td class="fw-bolder w-75">₱ <?php echo number_format($rinstallments["productPrice"], 2); ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Down Payment</td>
                                                            <td class="fw-bolder">₱ <?php echo number_format($rinstallments["productDownpayment"], 2); ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Approved Months</td>
                                                            <td class="fw-bolder"><?php echo $rinstallments["approvedMonths"] . " Months"; ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Installment</td>
                                                            <?php

                                                            $deduct = $rinstallments["productPrice"] - $rinstallments["productDownpayment"];
                                                            $installment = $deduct / $rinstallments["approvedMonths"];
                                                            $multiply = $installment * $rinstallments["approvedMonths"];

                                                            ?>
                                                            <td class="fw-bolder">₱ <?php echo number_format($installment, 2); ?> x <?php echo $rinstallments["approvedMonths"]; ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Remaining</td>
                                                            <td class="fw-bolder">₱ <?php echo number_format($multiply, 2); ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } ?>
                                            <?php if ($rinstallments["installmentStatus"] == "COMPLETED") { ?>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Status</td>
                                                            <td class="fw-bolder w-75">COMPLETED</td>
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
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Completed Date</td>
                                                            <td class="fw-bolder"><?php echo date("F d, Y h:i A", strtotime($rinstallments["completedDate"])) ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <table class="table table-bordered mt-10">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Product Price</td>
                                                            <td class="fw-bolder w-75">₱ <?php echo number_format($rinstallments["productPrice"], 2); ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Down Payment</td>
                                                            <td class="fw-bolder">₱ <?php echo number_format($rinstallments["productDownpayment"], 2); ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Approved Months</td>
                                                            <td class="fw-bolder"><?php echo $rinstallments["approvedMonths"] . " Months"; ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Installment</td>
                                                            <?php

                                                            $deduct = $rinstallments["productPrice"] - $rinstallments["productDownpayment"];
                                                            $installment = $deduct / $rinstallments["approvedMonths"];
                                                            $multiply = $installment * $rinstallments["approvedMonths"];

                                                            ?>
                                                            <td class="fw-bolder">₱ <?php echo number_format($installment, 2); ?> x <?php echo $rinstallments["approvedMonths"]; ?></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bg-light text-nowrap">Remaining</td>
                                                            <td class="fw-bolder">₱ <?php echo number_format($multiply, 2); ?></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
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
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Attachments</h3>
                                            </div>
                                            <button class="btn btn-primary btn-sm" id="btnUpload">Upload File</button>
                                        </div>
                                        <div class="card-body d-flex flex-wrap gap-3">
                                            <input type="file" class="form-control" id="upldFile" accept=".pdf" multiple hidden>
                                            <div id="uplfiles-container" class="col-12">

                                            </div>
                                            <div class="w-100 save-container d-none">
                                                <button class="btn btn-secondary btn-sm w-100" data-ii-uplfile-action="save" data-passaccess="uplfile">Save</button>
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
    <script type="module" src="../../app/js/main.creditCoordinator.js"></script>
</body>

</html>