<?php

include '../../app/connection/MYSQLSERVER.php';
include '../../app/sessions/AuthSession.php';
include '../../app/sessions/AdministratorSession.php';
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

    $categoriesedit = $conn->prepare("SELECT * FROM msc_categories");
    $categoriesedit->execute();
    $ccategoriesedit = $categoriesedit->rowCount();

    $categoriesfilter = $conn->prepare("SELECT * FROM msc_categories");
    $categoriesfilter->execute();
    $ccategoriesfilter = $categoriesfilter->rowCount();

    $product = $conn->prepare("SELECT * FROM msc_products JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories");
    $product->execute();
    $cproduct = $product->rowCount();

    $productactive = $conn->prepare("SELECT * FROM msc_products JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE productStatus = 'Active'");
    $productactive->execute();
    $cproductactive = $productactive->rowCount();

    $productinactive = $conn->prepare("SELECT * FROM msc_products JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE productStatus = 'Inactive'");
    $productinactive->execute();
    $cproductinactive = $productinactive->rowCount();

    $productdraft = $conn->prepare("SELECT * FROM msc_products JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE productStatus = 'Draft'");
    $productdraft->execute();
    $cproductdraft = $productdraft->rowCount();
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

<body id="kt_body"
    class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled aside-fixed aside-default-enabled user-select-none">
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
            <div id="kt_aside" class="aside aside-default aside-hoverable " data-kt-drawer="true"
                data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}"
                data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}"
                data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_aside_toggle">
                <div class="aside-logo flex-column-auto px-10 pt-9 pb-5" id="kt_aside_logo">
                    <a href="/">
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="60px"
                            class="max-h-50px logo-default theme-light-show" />
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="60px"
                            class="max-h-50px logo-default theme-dark-show" />
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px"
                            class="max-h-50px logo-minimize theme-light-show" />
                        <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px"
                            class="max-h-50px logo-minimize theme-dark-show" />
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
                <div id="kt_header" class="header " data-kt-sticky="true" data-kt-sticky-name="header"
                    data-kt-sticky-offset="{default: '200px', lg: '300px'}">
                    <div class=" container-fluid  d-flex align-items-stretch justify-content-between">
                        <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
                            <div class="d-flex align-items-center d-lg-none">
                                <div class="btn btn-icon btn-active-color-primary ms-n2 me-1 " id="kt_aside_toggle">
                                    <i class="ki-duotone ki-abstract-14 fs-1"><span class="path1"></span><span
                                            class="path2"></span></i>
                                </div>
                            </div>
                            <a href="/" class="d-lg-none">
                                <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px"
                                    class="mh-40px theme-light-show" />
                                <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px"
                                    class="mh-40px theme-dark-show" />
                            </a>
                            <div class="btn btn-icon w-auto ps-0 btn-active-color-primary d-none d-lg-inline-flex me-2 me-lg-5 "
                                data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body"
                                data-kt-toggle-name="aside-minimize">
                                <i class="ki-duotone ki-black-left-line fs-1 rotate-180"><span
                                        class="path1"></span><span class="path2"></span></i>
                            </div>
                        </div>
                        <div class="d-flex align-items-stretch justify-content-end flex-lg-grow-1">
                            <div class="d-flex align-items-stretch flex-shrink-0">
                                <div class="d-flex align-items-center ms-1 ms-lg-2">
                                    <a href="#"
                                        class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px"
                                        data-kt-menu-trigger="{default:'click', lg: 'hover'}"
                                        data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                        <i class="ki-duotone ki-night-day theme-light-show fs-1"><span
                                                class="path1"></span><span class="path2"></span><span
                                                class="path3"></span><span class="path4"></span><span
                                                class="path5"></span><span class="path6"></span><span
                                                class="path7"></span><span class="path8"></span><span
                                                class="path9"></span><span class="path10"></span></i> <i
                                            class="ki-duotone ki-moon theme-dark-show fs-1"><span
                                                class="path1"></span><span class="path2"></span></i></a>
                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-title-gray-700 menu-icon-gray-500 menu-active-bg menu-state-color fw-semibold py-4 fs-base w-150px"
                                        data-kt-menu="true" data-kt-element="theme-mode-menu">
                                        <div class="menu-item px-3 my-0">
                                            <a href="#" class="menu-link px-3 py-2" data-kt-element="mode"
                                                data-kt-value="light">
                                                <span class="menu-icon" data-kt-element="icon">
                                                    <i class="ki-duotone ki-night-day fs-2"><span
                                                            class="path1"></span><span class="path2"></span><span
                                                            class="path3"></span><span class="path4"></span><span
                                                            class="path5"></span><span class="path6"></span><span
                                                            class="path7"></span><span class="path8"></span><span
                                                            class="path9"></span><span class="path10"></span></i>
                                                </span>
                                                <span class="menu-title">
                                                    Light
                                                </span>
                                            </a>
                                        </div>
                                        <div class="menu-item px-3 my-0">
                                            <a href="#" class="menu-link px-3 py-2" data-kt-element="mode"
                                                data-kt-value="dark">
                                                <span class="menu-icon" data-kt-element="icon">
                                                    <i class="ki-duotone ki-moon fs-2"><span class="path1"></span><span
                                                            class="path2"></span></i> </span>
                                                <span class="menu-title">
                                                    Dark
                                                </span>
                                            </a>
                                        </div>
                                        <div class="menu-item px-3 my-0">
                                            <a href="#" class="menu-link px-3 py-2" data-kt-element="mode"
                                                data-kt-value="system">
                                                <span class="menu-icon" data-kt-element="icon">
                                                    <i class="ki-duotone ki-screen fs-2"><span
                                                            class="path1"></span><span class="path2"></span><span
                                                            class="path3"></span><span class="path4"></span></i> </span>
                                                <span class="menu-title">
                                                    System
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center ms-2 ms-lg-3" id="kt_header_user_menu_toggle">
                                    <div class="cursor-pointer symbol symbol-35px symbol-lg-35px"
                                        data-kt-menu-trigger="{default: 'click', lg: 'hover'}"
                                        data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                                        <img alt="Pic" src="../../assets/media/avatars/user-avatar.png" />
                                    </div>
                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-color fw-semibold py-4 fs-6 w-275px"
                                        data-kt-menu="true">
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
                                    Products <small class="text-muted fs-6 fw-normal ms-1"></small>
                                </h1>
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item text-muted">
                                        Administrator
                                    </li>
                                    <li class="breadcrumb-item text-muted">
                                        Settings
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        <a href="products.php" class="text-dark text-hover-primary">
                                            Products
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
                            <div class="row g-5">
                                <div class="col-xxl-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row g-3">
                                                <div class="col-xl-12">
                                                    <p class="fw-bolder text-gray-600">Product Status</p>
                                                    <div class="row g-3">
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                            <div class="border bg-hover-light rounded p-3 d-flex justify-content-between align-items-center fw-bolder"
                                                                data-kt-product-table-filter="all">
                                                                <span>All</span>
                                                                <span
                                                                    class="badge badge-light-dark"><?php echo $cproduct ?></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                            <div class="border bg-hover-light rounded p-3 d-flex justify-content-between align-items-center fw-bolder"
                                                                data-kt-product-table-filter="active">
                                                                <span>Active</span>
                                                                <span
                                                                    class="badge badge-light-dark"><?php echo $cproductactive ?></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                            <div class="border bg-hover-light rounded p-3 d-flex justify-content-between align-items-center fw-bolder"
                                                                data-kt-product-table-filter="inactive">
                                                                <span>Inactive</span>
                                                                <span
                                                                    class="badge badge-light-dark"><?php echo $cproductinactive ?></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                            <div class="border bg-hover-light rounded p-3 d-flex justify-content-between align-items-center fw-bolder"
                                                                data-kt-product-table-filter="draft">
                                                                <span>Draft</span>
                                                                <span
                                                                    class="badge badge-light-dark"><?php echo $cproductdraft ?></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <div class="col-xl-12 mt-5">
                                                    <p class="fw-bolder text-gray-600">Stock Alert</p>
                                                    <div class="row g-3">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                            <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Stock Status" data-allow-clear="false" data-kt-user-table-filter="usertype" data-hide-search="true" id="select_stock">
                                                                <option>All Stock</option>
                                                                <option>Low</option>
                                                                <option>High</option>
                                                                <option>Out of Stock</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div> -->
                                                <div class="col-xl-12 mt-5">
                                                    <p class="fw-bolder text-gray-600">Category</p>
                                                    <div class="row g-3">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                            <select class="form-select form-select-solid fw-bolder"
                                                                data-kt-select2="true"
                                                                data-placeholder="Select Category"
                                                                data-allow-clear="false"
                                                                data-kt-user-table-filter="usertype"
                                                                data-hide-search="true"
                                                                data-kt-product-table-filter="category">
                                                                <option>All Category</option>
                                                                <?php if ($ccategories > 0) { ?>
                                                                    <?php while ($rcategoriesfilter = $categoriesfilter->fetch(PDO::FETCH_ASSOC)) { ?>
                                                                        <option
                                                                            value="<?php echo $rcategoriesfilter["description"]; ?>">
                                                                            <?php echo $rcategoriesfilter["description"]; ?>
                                                                        </option>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-12 mt-5">
                                                    <p class="fw-bolder text-gray-600">Price</p>
                                                    <div class="row g-sm-3 g-xl-0">
                                                        <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6">
                                                            <div class="input-group input-group-solid mb-5">
                                                                <span class="input-group-text fw-bolder"
                                                                    id="basic-addon1">₱</span>
                                                                <input
                                                                    class="form-control form-control-lg form-control-solid fw-bolder"
                                                                    placeholder="Minimum Price" inputmode="numeric"
                                                                    oninput="this.value = this.value.replace(/\D+/g, '')"
                                                                    data-kt-product-table-filter="min">
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6">
                                                            <div class="input-group input-group-solid mb-5">
                                                                <span class="input-group-text fw-bolder"
                                                                    id="basic-addon1">₱</span>
                                                                <input
                                                                    class="form-control form-control-lg form-control-solid fw-bolder"
                                                                    placeholder="Maximum Price" inputmode="numeric"
                                                                    oninput="this.value = this.value.replace(/\D+/g, '')"
                                                                    data-kt-product-table-filter="max">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div
                                            class="card-footer d-flex justify-content-center align-items-center btn btn-light bg-darkgreen p-3">
                                            <div class="d-flex align-items-center gap-2 p-3">
                                                <i class="ki-duotone ki-arrows-loop text-dark fs-2">
                                                    <span class="path1"></span>
                                                    <span class="path2"></span>
                                                </i>
                                                <span>Reset Filters</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-9">
                                    <div class="card">
                                        <div class="card-header border-0 pt-6">
                                            <div class="card-title">
                                                <div class="d-flex align-items-center position-relative my-1">
                                                    <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5"><span
                                                            class="path1"></span><span class="path2"></span></i> <input
                                                        type="text" data-kt-product-table-filter="search"
                                                        class="form-control form-control-solid w-250px ps-13"
                                                        placeholder="Search Product" />
                                                </div>
                                            </div>
                                            <div class="card-toolbar">
                                                <!-- Search -->
                                                <div class="d-flex justify-content-end gap-3 flex-wrap">
                                                    <button type="button"
                                                        class="btn btn-primary d-flex align-items-center ps-5"
                                                        data-bs-toggle="modal" data-bs-target="#addProductModal">
                                                        <i class="ki-duotone ki-plus fs-2"></i>
                                                        <span>Add Product</span>
                                                    </button>
                                                    <a href="" class="btn btn-secondary d-flex align-items-center">
                                                        <i class="ki-duotone ki-arrow-circle-right fs-2">
                                                            <span class="path1"></span>
                                                            <span class="path2"></span>
                                                        </i>
                                                        <span>Refresh</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body py-4">
                                            <table class="table align-middle table-row-dashed fs-6 gy-5"
                                                id="tb_product">
                                                <thead>
                                                    <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
                                                        <th class="w-20">Product Name</th>
                                                        <th class="w-20">Category</th>
                                                        <th class="w-20">Stock</th>
                                                        <th class="w-20">Price</th>
                                                        <th class="w-20">Status</th>
                                                        <th class=""></th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold">
                                                    <?php if ($cproduct > 0) { ?>
                                                        <?php while ($rproduct = $product->fetch(PDO::FETCH_ASSOC)) { ?>
                                                            <tr>
                                                                <td>
                                                                    <div class="">
                                                                        <div class="fw-bolder text-primary">
                                                                            <?php echo $rproduct["productName"]; ?>
                                                                        </div>
                                                                        <span
                                                                            class="fs-6 text-muted"><?php echo $rproduct["productSKU"]; ?></span>
                                                                    </div>
                                                                </td>
                                                                <td><?php echo $rproduct["description"]; ?>
                                                                </td>
                                                                <td><?php echo $rproduct["quantity"]; ?></td>
                                                                <td><?php echo $rproduct["regularPrice"]; ?></td>
                                                                <td><span><?php echo $rproduct["productStatus"]; ?></span></td>
                                                                <td class="text-end datainput">
                                                                    <div class="d-flex justify-content-end gap-2">
                                                                        <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3"
                                                                            data-ii-val="<?php echo $rproduct["PK_mscProducts"]; ?>"
                                                                            data-ii-input-action="view">
                                                                            <i class="ki-duotone ki-dots-square fs-2x">
                                                                                <span class="path1"></span>
                                                                                <span class="path2"></span>
                                                                                <span class="path3"></span>
                                                                                <span class="path4"></span>
                                                                            </i>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </tbody>
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
                <!-- Modal -->
                <div class="modal fade" tabindex="-1" id="addProductModal">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header" id="modal_accessHeader">
                                <h2 class="fw-bold mt-3">Add Product</h2>
                                <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span
                                            class="path2"></span></i>
                                </div>
                            </div>

                            <div class="modal-body">
                                <div class="row g-5">
                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                        <p class="fw-bolder text-muted">General Information</p>
                                        <div class="mt-5">
                                            <label for="ii_productname" class="fw-bolder required">Product Name</label>
                                            <input type="text" id="ii_productname"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product Name">
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productunit" class="fw-bolder required">Product Unit</label>
                                            <input type="text" id="ii_productunit"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product Unit">
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productcategory" class="fw-bolder required">Product
                                                Category</label>
                                            <select class="form-select form-select-solid fw-bolder"
                                                data-kt-select2="true" data-placeholder="Select Category"
                                                data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                data-hide-search="true" id="ii_productcategory">
                                                <option></option>
                                                <?php if ($ccategories > 0) { ?>
                                                    <?php while ($rcategories = $categories->fetch(PDO::FETCH_ASSOC)) { ?>
                                                        <option value="<?php echo $rcategories["PK_mscCategories"]; ?>">
                                                            <?php echo $rcategories["description"]; ?>
                                                        </option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productbrand" class="fw-bolder required">Product Brand</label>
                                            <select class="form-select form-select-solid fw-bolder"
                                                data-kt-select2="true" data-placeholder="Select Brand"
                                                data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                data-hide-search="true" id="ii_productbrand">
                                                <option></option>
                                            </select>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productmodel" class="fw-bolder required">Product Model</label>
                                            <select class="form-select form-select-solid fw-bolder"
                                                data-kt-select2="true" data-placeholder="Select Model"
                                                data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                data-hide-search="true" id="ii_productmodel">
                                                <option></option>
                                            </select>
                                        </div>
                                        <div class="row g-3 mt-5">
                                            <div class="col-xl-6">
                                                <div class="">
                                                    <label for="ii_productsku" class="fw-bolder required">Product
                                                        SKU</label>
                                                    <input type="text" id="ii_productsku"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="XXX-XXX-XX">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productdescription" class="fw-bolder required">Product
                                                Description</label>
                                            <textarea name="" id="ii_productdescription"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product Description"></textarea>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productdetails" class="fw-bolder required">Product
                                                Details</label>
                                            <div class="ii_productdetailscontainer">
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button class="w-100 btn btn-light"
                                                    data-add-product-details="add">Add</button>
                                            </div>
                                        </div>
                                        <p class="fw-bolder text-muted mt-5">Quantity &amp; Reorder</p>
                                        <div class="mt-5">
                                            <label for="ii_totalquantity" class="fw-bolder">Total Quantity</label>
                                            <input type="number" min="0" max="9999" id="ii_totalquantity"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                value="0">
                                        </div>
                                        <div class="row g-3">
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_minstock" class="fw-bolder">Minimum Stock</label>
                                                    <input type="number" min="0" max="99999" id="ii_minstock"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        value="0">
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_maxstock" class="fw-bolder">Maximum Stock</label>
                                                    <input type="number" min="0" max="99999" id="ii_maxstock"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        value="0">
                                                </div>
                                            </div>
                                        </div>
                                        <p class="fw-bolder text-muted mt-5">Pricing</p>
                                        <div class="row g-3">
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_regularprice" class="fw-bolder required">Regular
                                                        Price</label>
                                                    <input type="text" id="ii_regularprice"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="0.00" value="0.00">
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_saleprice" class="fw-bolder">Sale Price</label>
                                                    <input type="text" id="ii_saleprice"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="0.00" value="0.00">
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_repoprice" class="fw-bolder">Repo Price</label>
                                                    <input type="text" id="ii_repoprice"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="0.00" value="0.00">
                                                </div>
                                            </div>
                                        </div>
                                        <p class="fw-bolder text-muted mt-5">Product Status</p>
                                        <div class="row g-3 mt-5">
                                            <div class="col-xl-6">
                                                <div class="">
                                                    <label for="ii_productsetting" class="fw-bolder required">Product
                                                        Setting</label>
                                                    <select class="form-select form-select-solid fw-bolder"
                                                        data-kt-select2="true" data-placeholder="Select Product Setting"
                                                        data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                        data-hide-search="true" id="ii_productsetting">
                                                        <option value=""></option>
                                                        <option value="Regular">Regular</option>
                                                        <option value="Sale">Sale</option>
                                                        <option value="Repo">Repo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="">
                                                    <label for="ii_productstatus" class="fw-bolder required">Product
                                                        Status</label>
                                                    <select class="form-select form-select-solid fw-bolder"
                                                        data-kt-select2="true" data-placeholder="Select Product Status"
                                                        data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                        data-hide-search="true" id="ii_productstatus">
                                                        <option value=""></option>
                                                        <option value="Active">Active</option>
                                                        <option value="Inactive">Inactive</option>
                                                        <option value="Draft">Draft</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" data-ii-productadd-modal-action="submit"
                                    data-passaccess="addproduct">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" tabindex="-1" id="editProductModal">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header" id="modal_accessHeader">
                                <h2 class="fw-bold mt-3">Edit Product</h2>
                                <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span
                                            class="path2"></span></i>
                                </div>
                            </div>

                            <div class="modal-body">
                                <div class="row g-5">
                                    <div class="col-xl-12 fv-row fv-plugins-icon-container">
                                        <p class="fw-bolder text-muted">General Information</p>
                                        <div class="">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value=""
                                                    id="chkbxReturnableedit">
                                                <label class="form-check-label fw-bolder text-dark"
                                                    for="chkbxReturnableedit">
                                                    Returnable Product
                                                </label>
                                            </div>
                                        </div>
                                        <div class="mt-5" hidden>
                                            <label for="ii_productidedit" class="fw-bolder required">Product ID</label>
                                            <input type="text" id="ii_productidedit"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product ID">
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productnameedit" class="fw-bolder required">Product Name</label>
                                            <input type="text" id="ii_productnameedit"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product Name">
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productunitedit" class="fw-bolder required">Product Unit</label>
                                            <input type="text" id="ii_productunitedit"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product Unit">
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productcategoryedit" class="fw-bolder required">Product
                                                Category</label>
                                            <select class="form-select form-select-solid fw-bolder"
                                                data-kt-select2="true" data-placeholder="Select Category"
                                                data-allow-clear="true"
                                                data-hide-search="true" id="ii_productcategoryedit">
                                                <option></option>
                                            </select>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productbrandedit" class="fw-bolder required">Product Brand</label>
                                            <select class="form-select form-select-solid fw-bolder"
                                                data-kt-select2="true" data-placeholder="Select Brand"
                                                data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                data-hide-search="true" id="ii_productbrandedit">
                                                <option></option>
                                            </select>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productmodeledit" class="fw-bolder required">Product Model</label>
                                            <select class="form-select form-select-solid fw-bolder"
                                                data-kt-select2="true" data-placeholder="Select Model"
                                                data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                data-hide-search="true" id="ii_productmodeledit">
                                                <option></option>
                                            </select>
                                        </div>
                                        <div class="row g-3 mt-5">
                                            <div class="col-xl-6">
                                                <div class="">
                                                    <label for="ii_productskuedit" class="fw-bolder required">Product
                                                        SKU</label>
                                                    <input type="text" id="ii_productskuedit"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="XXX-XXX-XX">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productdescriptionedit" class="fw-bolder required">Product
                                                Description</label>
                                            <textarea name="" id="ii_productdescriptionedit"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                placeholder="Product Description" data-kt-autosize="true"></textarea>
                                        </div>
                                        <div class="mt-5">
                                            <label for="ii_productdetailsedit" class="fw-bolder required">Product
                                                Details</label>
                                            <div class="ii_productdetailscontaineredit">
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button class="w-100 btn btn-light"
                                                    data-addedit-product-details="add">Add</button>
                                            </div>
                                        </div>
                                        <p class="fw-bolder text-muted mt-5">Quantity &amp; Reorder</p>
                                        <div class="mt-5">
                                            <label for="ii_totalquantityedit" class="fw-bolder">Total Quantity</label>
                                            <input type="number" min="0" max="9999" id="ii_totalquantityedit"
                                                class="form-control form-control-lg form-control-solid fw-bolder"
                                                value="0">
                                        </div>
                                        <div class="row g-3">
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_minstockedit" class="fw-bolder">Minimum Stock</label>
                                                    <input type="number" min="0" max="99999" id="ii_minstockedit"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        value="0">
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_maxstockedit" class="fw-bolder">Maximum Stock</label>
                                                    <input type="number" min="0" max="99999" id="ii_maxstockedit"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        value="0">
                                                </div>
                                            </div>
                                        </div>
                                        <p class="fw-bolder text-muted mt-5">Pricing</p>
                                        <div class="row g-3">
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_regularpriceedit" class="fw-bolder required">Regular
                                                        Price</label>
                                                    <input type="text" id="ii_regularpriceedit"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="0.00" value="0.00">
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_salepriceedit" class="fw-bolder">Sale Price</label>
                                                    <input type="text" id="ii_salepriceedit"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="0.00" value="0.00">
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="mt-5">
                                                    <label for="ii_repopriceedit" class="fw-bolder">Repo Price</label>
                                                    <input type="text" id="ii_repopriceedit"
                                                        class="form-control form-control-lg form-control-solid fw-bolder"
                                                        placeholder="0.00" value="0.00">
                                                </div>
                                            </div>
                                        </div>
                                        <p class="fw-bolder text-muted mt-5">Product Status</p>
                                        <div class="row g-3 mt-5">
                                            <div class="col-xl-6">
                                                <div class="">
                                                    <label for="ii_productsettingedit" class="fw-bolder required">Product
                                                        Setting</label>
                                                    <select class="form-select form-select-solid fw-bolder"
                                                        data-kt-select2="true" data-placeholder="Select Product Setting"
                                                        data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                        data-hide-search="true" id="ii_productsettingedit">
                                                        <option value="Regular">Regular</option>
                                                        <option value="Sale">Sale</option>
                                                        <option value="Repo">Repo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="">
                                                    <label for="ii_productstatusedit" class="fw-bolder required">Product
                                                        Status</label>
                                                    <select class="form-select form-select-solid fw-bolder"
                                                        data-kt-select2="true" data-placeholder="Select Product Status"
                                                        data-allow-clear="true" data-kt-user-table-filter="usertype"
                                                        data-hide-search="true" id="ii_productstatusedit">
                                                        <option value="Active">Active</option>
                                                        <option value="Inactive">Inactive</option>
                                                        <option value="Draft">Draft</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xl-12">
                                                <div class="mt-10 border p-3 rounded">
                                                    <div class="d-flex justify-content-end align-items-center">
                                                        <button class="btn btn-primary btn-sm w-100" id="btnUpload">Upload Image</button>
                                                    </div>
                                                    <input type="file" class="form-control" id="upldFile" accept="image/*" multiple hidden>
                                                </div>
                                                <div class="mt-3 border row p-3 rounded d-none" id="uploadTempContainer">
                                                </div>
                                                <div class="mt-3 border row p-3 rounded" id="uploadContainer">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" data-ii-productedit-modal-action="submit"
                                    data-passaccess="editproduct">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal -->
                <?php include './authsetting.php'; ?>
                <!-- Drawer -->
                <button id="kt_drawer_trigger" class="btn btn-primary" hidden>Toggle basic drawer</button>
                <div id="kt_drawer_advanced" class="bg-white drawer drawer-end" data-kt-drawer="true"
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
                            <div class="card-title">
                                <div class="d-flex me-3 gap-3">
                                    <button class="btn btn-light btn-sm" data-edit-product-details="edit">Edit</button>
                                    <button class="btn btn-light btn-sm" data-delete-product-details="delete" data-passaccess="deleteproduct">Delete</button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body hover-scroll-overlay-y">
                            <div class="productTitle">
                                <div class="d-flex flex-column gap-1">
                                    <span class="h1 fw-bolder" id="ii_valProductName"></span>
                                    <span class="h5 text-muted"><span id="ii_valSKU"></span> <span
                                            class="text-muted opacity-50">|</span> <span
                                            id="ii_valCategory"></span></span>
                                </div>
                            </div>
                            <div class="d-flex gap-3 mt-5 flex-wrap">
                                <button class="btn btn-primary btn-sm">General Information</button>
                            </div>
                            <div class="row mt-5 g-3">
                                <div class="col-xl-7">
                                    <div class="row g-3">
                                        <div class="col-xl-12">
                                            <img alt="Product Image" src="../../assets/media/images/output.png"
                                                width="100%" class="mh-600px theme-light-show rounded" />
                                        </div>
                                        <div class="col-xl-12">
                                            <span class="h3 fw-bolder mt-5">Description</span>
                                            <p class="mt-3" id="ii_valDescription"></p>
                                        </div>
                                        <div class="col-xl-12">
                                            <span class="h3 fw-bolder mt-5">Status</span>
                                            <div class="mt-3" id="ii_valStatusContainer">

                                            </div>
                                        </div>
                                        <div class="col-xl-12">
                                            <span class="h3 fw-bolder mt-5">Price Information</span>
                                            <div class="mt-3" id="ii_valPriceContainer">
                                                <div
                                                    class="d-flex justify-content-between align-items-center bg-light p-3">
                                                    <span class="fw-bolder">Regular Price</span>
                                                    <span id="ii_valRegularPrice"></span>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <span class="fw-bolder">Repo Price</span>
                                                    <span id="ii_valRepoPrice"></span>
                                                </div>
                                                <div
                                                    class="d-flex justify-content-between align-items-center bg-light p-3">
                                                    <span class="fw-bolder">Sale Price</span>
                                                    <span id="ii_valSalePrice"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-5">
                                    <div class="card card-body border">
                                        <span class="h3 fw-bolder">Stock</span>
                                        <div class="card bg-light p-3 mt-3">
                                            <div class="card-header d-flex justify-content-center align-items-center">
                                                <div
                                                    class="d-flex justify-content-center flex-column align-items-center">
                                                    <span>Quantity at Hand</span>
                                                    <h1 id="ii_valStock"></h1>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row g-3">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="d-flex flex-column">
                                                            <span class="text-muted">Mimimum Stock</span>
                                                            <span class="fw-bolder" id="ii_valMinStock"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="d-flex flex-column">
                                                            <span class="text-muted">Maximum Stock</span>
                                                            <span class="fw-bolder" id="ii_valMaxStock"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="h3 fw-bolder mt-5">Status</span>
                                        <div class="card bg-light p-3 mt-3">
                                            <div class="card-body">
                                                <div class="row g-3">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                        <div class="d-flex flex-column">
                                                            <span class="text-muted">Category</span>
                                                            <span class="fw-bolder" id="ii_valCategoryStatus"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="d-flex flex-column">
                                                            <span class="text-muted">Setting</span>
                                                            <span class="fw-bolder" id="ii_valSettingStatus"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="d-flex flex-column">
                                                            <span class="text-muted">Status</span>
                                                            <span class="fw-bolder" id="ii_valStatus"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Drawer -->
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
    <script src="../../assets/js/datatables/tb-products.js"></script>
    <script type="module" src="../../app/js/main.product.js"></script>
</body>

</html>