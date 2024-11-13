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

    $categories = $conn->prepare("SELECT * FROM msc_categories");
    $categories->execute();
    $ccategories = $categories->rowCount();

    $prodid = $_GET["p"];

    $product = $conn->prepare("SELECT * FROM msc_products JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE PK_mscProducts = '$prodid'");
    $product->execute();
    $cproduct = $product->rowCount();
    $rproduct = $product->fetch(PDO::FETCH_ASSOC);

    if ($ruserprofile["isProfileFilled"] != 1 && $ruserprofile["isHomeOwnershipFilled"] != 1 && $ruserprofile["isEmploymentFilled"] != 1 && $ruserprofile["isPersonalPrefFilled"] != 1 && $ruserprofile["isRelativesFilled"] != 1 && $ruserprofile["isNeighborFilled"] != 1) {
        header("Location: /");
    }

    $installments = $conn->prepare("SELECT SUM(CASE WHEN installmentStatus = 'PENDING' THEN 1 ELSE 0 END) AS pendingTotal, SUM(CASE WHEN installmentStatus = 'APPROVED' THEN 1 ELSE 0 END) approvedTotal FROM  mn_installments WHERE FK_appsysUsers = '$usercode' AND FK_mscProducts = '$prodid'");
    $installments->execute();
    $cinstallments = $installments->rowCount();
    $rinstallments = $installments->fetch(PDO::FETCH_ASSOC);

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
                                        <a href="products.php" class="text-dark">Products</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <?php echo $rproduct["description"]; ?>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <?php echo $rproduct["productName"]; ?>
                                    </li>
                                </ul>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap text-nowrap py-1">

                            </div>
                        </div>
                    </div>
                    <div class="post fs-6 d-flex flex-column-fluid" id="kt_post">
                        <div class="container-fluid">
                            <div class="row g-xl-12 g-5">
                                <div class="col-xl-12">
                                    <div class="d-flex justify-content-center gap-10 flex-wrap">
                                        <div class="">
                                            <a class="d-block overlay w-350px h-350px" data-fslightbox="lightbox-basic" href="../../assets/media/images/output.png">
                                                <!--begin::Image-->
                                                <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded w-350px h-350px"
                                                    style="background-image:url('../../assets/media/images/output.png')">
                                                </div>
                                                <!--end::Image-->

                                                <!--begin::Action-->
                                                <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                                    <i class="bi bi-eye-fill text-white fs-3x"></i>
                                                </div>
                                                <!--end::Action-->
                                            </a>
                                            <div class="d-flex gap-3 mt-3 overflow-auto overflow-y-hidden">
                                                <a class="d-block overlay w-100px h-100px" data-fslightbox="lightbox-basic" href="../../assets/media/images/output.png">
                                                    <!--begin::Image-->
                                                    <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded w-100px h-100px"
                                                        style="background-image:url('../../assets/media/images/output.png')">
                                                    </div>
                                                    <!--end::Image-->

                                                    <!--begin::Action-->
                                                    <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                                        <i class="bi bi-eye-fill text-white fs-3x"></i>
                                                    </div>
                                                    <!--end::Action-->
                                                </a>
                                                <a class="d-block overlay w-100px h-100px" data-fslightbox="lightbox-basic" href="../../assets/media/images/output.png">
                                                    <!--begin::Image-->
                                                    <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded w-100px h-100px"
                                                        style="background-image:url('../../assets/media/images/output.png')">
                                                    </div>
                                                    <!--end::Image-->

                                                    <!--begin::Action-->
                                                    <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                                        <i class="bi bi-eye-fill text-white fs-3x"></i>
                                                    </div>
                                                    <!--end::Action-->
                                                </a>
                                                <a class="d-block overlay w-100px h-100px" data-fslightbox="lightbox-basic" href="../../assets/media/images/output.png">
                                                    <!--begin::Image-->
                                                    <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded w-100px h-100px"
                                                        style="background-image:url('../../assets/media/images/output.png')">
                                                    </div>
                                                    <!--end::Image-->

                                                    <!--begin::Action-->
                                                    <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                                        <i class="bi bi-eye-fill text-white fs-3x"></i>
                                                    </div>
                                                    <!--end::Action-->
                                                </a>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-column align-items-xl-start align-items-custom">
                                            <h1 class="fw-bolder fs-2x"><?php echo $rproduct["productName"]; ?></h1>
                                            <span>Availability: <?php echo $rproduct["quantity"]; ?> in stock</span>
                                            <div class="mt-5">
                                                <?php if ($rproduct["isRegular"] == 1) { ?>
                                                    <h2>₱ <?php echo $rproduct["regularPrice"]; ?></h2>
                                                <?php } ?>
                                                <?php if ($rproduct["isSale"] == 1) { ?>
                                                    <div class="d-flex gap-5">
                                                        <h2>₱ <?php echo $rproduct["salePrice"]; ?></h2>
                                                        <h2 class="text-muted text-decoration-line-through">₱ <?php echo $rproduct["regularPrice"]; ?></h2>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($rproduct["isRepo"] == 1) { ?>
                                                    <div class="d-flex gap-5">
                                                        <h2>₱ <?php echo $rproduct["repoPrice"]; ?></h2>
                                                        <h2 class="text-muted text-decoration-line-through">₱ <?php echo $rproduct["regularPrice"]; ?></h2>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <ul class="nav nav-tabs nav-line-tabs nav-line-tabs-2x mb-5 fs-6">
                                        <li class="nav-item">
                                            <a class="nav-link active text-uppercase fw-bolder text-primary" data-bs-toggle="tab" href="#kt_tab_pane_4">Features</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-uppercase fw-bolder text-primary" data-bs-toggle="tab" href="#kt_tab_pane_5">Details</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-uppercase fw-bolder text-primary" data-bs-toggle="tab" href="#kt_tab_pane_6">Review</a>
                                        </li>
                                    </ul>

                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="kt_tab_pane_4" role="tabpanel">
                                            <?php echo nl2br($rproduct["productDescription"]); ?>
                                        </div>
                                        <div class="tab-pane fade" id="kt_tab_pane_5" role="tabpanel">
                                            <?php

                                            $productdetailsid = $rproduct["FK_detailsId"];

                                            $productdetails = $conn->prepare("SELECT `order`, `title`, `description` FROM msc_details WHERE detailsId = '$productdetailsid' ORDER BY `order` ASC");
                                            $productdetails->execute();
                                            $cproductdetails = $productdetails->rowCount();
                                            $rproductdetails = $productdetails->fetchall(PDO::FETCH_ASSOC);

                                            ?>
                                            <?php if ($cproductdetails > 0) { ?>
                                                <?php for ($i = 0; $i < count($rproductdetails); $i++) { ?>

                                                    <?php if ($i % 2 == 0) { ?>
                                                        <div class='d-flex justify-content-between align-items-center details-light p-3'><span class='fw-bolder'><?php echo $rproductdetails[$i]["title"]; ?></span><span class=''><?php echo $rproductdetails[$i]["description"]; ?></span></div>
                                                    <?php } else { ?>
                                                        <div class='d-flex justify-content-between align-items-center p-3'><span class='fw-bolder'><?php echo $rproductdetails[$i]["title"]; ?></span><span class=''><?php echo $rproductdetails[$i]["description"]; ?></span></div>
                                                    <?php } ?>

                                                <?php } ?>
                                            <?php } ?>
                                        </div>
                                        <div class="tab-pane fade" id="kt_tab_pane_6" role="tabpanel">
                                            <div class="d-flex justify-content-center flex-column">
                                                <h1>Reviews</h1>
                                                <span>There are no reviews yet.<br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Drawer -->
                                <button id="kt_drawer_trigger" class="btn btn-primary" hidden>Toggle basic drawer</button>
                                <div id="kt_drawer_advanced" class="bg-white drawer drawer-end mt-0" data-kt-drawer="true"
                                    data-kt-drawer-activate="true" data-kt-drawer-toggle="#kt_drawer_trigger"
                                    data-kt-drawer-close="#kt_drawer_advanced_close" data-kt-drawer-name="docs"
                                    data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'100%', 'md': '500px', 'lg': '900px'}"
                                    data-kt-drawer-direction="end">
                                    <div class="card rounded-0 w-100">
                                        <div class="card-header pe-5 d-flex justify-content-between align-items-center">
                                            <div class="card-toolbar">
                                                <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3"
                                                    id="kt_drawer_advanced_close">
                                                    <i class="ki-duotone ki-exit-right fs-2x">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body hover-scroll-overlay-y">
                                            <div class="col-xl-12">
                                                <div class="row mb-6">
                                                    <div class="col-xl-12">
                                                        <div class="productTitle">
                                                            <div class="d-flex flex-column gap-1">
                                                                <span class="h1 fw-bolder"><?php echo $rproduct["productName"]; ?></span>
                                                                <span class="h5">
                                                                    <span><?php echo $rproduct["description"]; ?></span>
                                                                    <span class="text-muted opacity-50">|</span>
                                                                    <span class="text-muted"><?php echo $rproduct["productSKU"]; ?></span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12">
                                                        <hr class="text-muted opacity-10">
                                                    </div>
                                                    <div class="col-xl-4 col-sm-6 h3">Order Value:</div>
                                                    <div class="col-xl-8 col-sm-6 h3">
                                                        <?php if ($rproduct["isRegular"] == 1) { ?>
                                                            <h3 class="fw-bolder">₱ <span class="ii_ordervalue"><?php echo $rproduct["regularPrice"]; ?></span></h3>
                                                        <?php } ?>
                                                        <?php if ($rproduct["isSale"] == 1) { ?>
                                                            <div class="d-flex gap-5">
                                                                <h3 class="fw-bolder">₱ <span class="ii_ordervalue"><?php echo $rproduct["salePrice"]; ?></span></h3>
                                                            </div>
                                                        <?php } ?>
                                                        <?php if ($rproduct["isRepo"] == 1) { ?>
                                                            <div class="d-flex gap-5">
                                                                <h3 class="fw-bolder">₱ <span class="ii_ordervalue"><?php echo $rproduct["repoPrice"]; ?></span></h3>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                    <div class="col-xl-4 col-sm-6 h3">Downpayment:</div>
                                                    <div class="col-xl-8 col-sm-6 h3">
                                                        <h3 class="fw-bolder text-muted">Need Approval</h3>
                                                    </div>
                                                    <div class="col-xl-4 col-sm-6 h3">Installment:</div>
                                                    <div class="col-xl-8 col-sm-6 h3">
                                                        <h3 class="fw-bolder text-muted">Need Approval</h3>
                                                    </div>
                                                    <div class="col-xl-4 col-sm-6 h3">Remaining:</div>
                                                    <div class="col-xl-8 col-sm-6 h3">
                                                        <h3 class="fw-bolder text-muted">Need Approval</h3>
                                                    </div>
                                                    <div class="col-xl-12 h3">
                                                        <div class="mt-10 mb-10 pt-4 pe-4 ps-4 rounded bg-light d-flex justify-content-center align-items-center text-center">
                                                            <div class="">
                                                                <p><span class="fw-bolder">Reminder:</span> Downpayment, Installment Options may vary depending on your approval</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12">
                                                        <button class="btn btn-primary w-100" data-ii-applyinstallment-modal-action="sendrequest" data-passaccess="sendrequest" data-id="<?php echo $prodid; ?>">Send Installment Request</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Drawer -->
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
    <script src="../../assets/plugins/custom/fslightbox/fslightbox.bundle.js"></script>
    <script type="module" src="../../app/js/main.customerScript.js"></script>
</body>

</html>