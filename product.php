<?php

include './app/connection/MYSQLSERVER.php';
include './app/sessions/UserSession.php';
require './app/setting/AESCLASS.php';


date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $categories = $conn->prepare("SELECT * FROM msc_categories");
    $categories->execute();
    $ccategories = $categories->rowCount();

    $prodid = $_GET["p"];

    $product = $conn->prepare("SELECT * FROM msc_products JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories");
    $product->execute();
    $cproduct = $product->rowCount();

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
    <link href="../../assets/css/index.bundle.css" rel="stylesheet" type="text/css" />
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
            <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
                <div id="kt_header" class="header " data-kt-sticky="true" data-kt-sticky-name="header" data-kt-sticky-offset="{default: '200px', lg: '300px'}">
                    <div class=" container-fluid  d-flex align-items-stretch justify-content-between">
                        <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
                            <a href="/" class="d-flex gap-3 align-items-center justify-content-center">
                                <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px" class="mh-40px theme-light-show" />
                                <img alt="Logo" src="../../assets/media/logos/FIESTAAPPL_LOGO.png" width="40px" class="mh-40px theme-dark-show" />
                                <h1 class="mt-3 text-uppercase fw-bolder user_profile">Fiesta Appliances, Inc.</h1>
                            </a>
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
                                <div class="d-flex align-items-center ms-2 ms-lg-3">
                                    <a href="login.php" class="btn btn-primary"> Log in / Sign up </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content fs-6 d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="toolbar" id="kt_toolbar">
                        <div class=" container-fluid  d-flex flex-stack flex-wrap flex-sm-nowrap">
                            <div class="d-flex flex-column align-items-start justify-content-center flex-wrap me-2">
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item">
                                        Home
                                    </li>
                                    <li class="breadcrumb-item">
                                        Appliances
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="post fs-6 d-flex flex-column-fluid" id="kt_post">
                        <div class="container-fluid">
                            <div class="row g-5">
                                <div class="col-xxl-12">
                                    <div class="card">
                                        <div class="card-body d-flex justify-content-between flex-wrap">
                                            <div class="">
                                                <div data-kt-search-element="div" class="w-250px position-relative mb-5 mb-lg-0" autocomplete="off">
                                                    <!--begin::Hidden input(Added to disable form autocomplete)-->
                                                    <input type="hidden">
                                                    <!--end::Hidden input-->

                                                    <!--begin::Icon-->
                                                    <i class="ki-duotone ki-magnifier search-icon fs-2 text-gray-500 position-absolute top-50 translate-middle-y ms-5"><span class="path1"></span><span class="path2"></span></i> <!--end::Icon-->

                                                    <!--begin::Input-->
                                                    <input type="text" class="search-input form-control form-control-solid ps-13" name="search" value="" placeholder="Search Product" data-kt-search-element="input" id="ii_search">
                                                    <!--end::Input-->

                                                    <!--begin::Spinner-->
                                                    <span class="search-spinner  position-absolute top-50 end-0 translate-middle-y lh-0 d-none me-5" data-kt-search-element="spinner">
                                                        <span class="spinner-border h-15px w-15px align-middle text-gray-400"></span>
                                                    </span>
                                                    <!--end::Spinner-->

                                                    <!--begin::Reset-->
                                                    <span class="search-reset  btn btn-flush btn-active-color-primary position-absolute top-50 end-0 translate-middle-y lh-0 d-none me-4" data-kt-search-element="clear">
                                                        <i class="ki-duotone ki-cross fs-2 fs-lg-1 me-0"><span class="path1"></span><span class="path2"></span></i> </span>
                                                    <!--end::Reset-->
                                                </div>
                                            </div>
                                            <div class="">
                                                <select class="form-select form-select-solid fw-bolder w-250px" data-kt-select2="true" data-placeholder="Select Sort" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" id="ii_sorting">
                                                    <option value="default">Default Sorting</option>
                                                    <option value="sortLow">Sort by price: Low to High</option>
                                                    <option value="sortHigh">Sort by price: High to Low</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="">
                                                <p class="fw-bolder text-gray-600">Category</p>
                                                <div class="row g-3">
                                                    <button id="kt_block_ui_1_button" class="btn btn-primary d-none">Block</button>
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                        <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select Category" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" data-kt-product-table-filter="category" id="ii_category">
                                                            <option>All Category</option>
                                                            <?php if ($ccategories > 0) { ?>
                                                                <?php while ($rcategories = $categories->fetch(PDO::FETCH_ASSOC)) { ?>
                                                                    <option value="<?php echo $rcategories["PK_mscCategories"] ?>"><?php echo $rcategories["description"]; ?></option>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <p class="fw-bolder text-gray-600">Products View</p>
                                                <div class="row g-3">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                        <select class="form-select form-select-solid fw-bolder" data-kt-select2="true" data-placeholder="Select View" data-allow-clear="true" data-kt-user-table-filter="usertype" data-hide-search="true" data-kt-product-table-filter="category" id="ii_product">
                                                            <option>All Products</option>
                                                            <option>Regular</option>
                                                            <option>Sale</option>
                                                            <option>Repo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <p class="fw-bolder text-gray-600">Price</p>
                                                <div class="row g-sm-3 g-xl-0">
                                                    <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="input-group input-group-solid mb-5">
                                                            <span class="input-group-text fw-bolder" id="basic-addon1">₱</span>
                                                            <input class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Minimum Price" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" data-kt-product-table-filter="min" id="ii_min">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="input-group input-group-solid mb-5">
                                                            <span class="input-group-text fw-bolder" id="basic-addon1">₱</span>
                                                            <input class="form-control form-control-lg form-control-solid fw-bolder" placeholder="Maximum Price" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" data-kt-product-table-filter="max" id="ii_max">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-9">
                                    <div class="card">
                                        <div class="card-body" id="kt_block_ui_1_target">
                                            <div class="d-flex flex-wrap gap-3" id="productlist_container">
                                                <!-- <?php if ($cproduct > 0) { ?>
                                                    <?php while ($rproduct = $product->fetch(PDO::FETCH_ASSOC)) { ?>
                                                        <div class="border p-5 rounded shadow-sm product-list cursor-pointer card-hover">
                                                            <div class="">
                                                                <img alt="Product Image" src="../../assets/media/images/product.png"
                                                                    width="100%" class="mh-auto mw-auto theme-light-show rounded" />
                                                            </div>
                                                            <div class="mt-3">
                                                                <h2><?php echo secureToken::tokendecrypt($rproduct["productName"]); ?></h2>
                                                                <span><?php echo secureToken::tokendecrypt($rproduct["description"]); ?></span>
                                                                <?php if ($rproduct["isRegular"]) { ?>
                                                                    <div class="">
                                                                        <span class="badge bg-primary text-white">Regular</span>
                                                                    </div>
                                                                <?php } ?>
                                                                <?php if ($rproduct["isSale"]) { ?>
                                                                    <div class="">
                                                                        <span class="badge bg-primary text-white">Sale</span>
                                                                    </div>
                                                                <?php } ?>
                                                                <?php if ($rproduct["isRepo"]) { ?>
                                                                    <div class="">
                                                                        <span class="badge bg-primary text-white">Repo</span>
                                                                    </div>
                                                                <?php } ?>
                                                            </div>
                                                            <div class="mt-5 d-flex justify-content-between align-items-center flex-wrap gap-3">
                                                                <?php if ($rproduct["isRegular"]) { ?>
                                                                    <span class="fs-6 fw-bolder"><?php echo $rproduct["regularPrice"] ?></span>
                                                                <?php } ?>
                                                                <?php if ($rproduct["isSale"]) { ?>
                                                                    <div class="d-flex gap-3">
                                                                        <span class="fs-6 fw-bolder">₱ <?php echo $rproduct["salePrice"] ?></span>
                                                                        <span class="text-muted text-decoration-line-through">₱ <?php echo $rproduct["regularPrice"] ?></span>
                                                                    </div>
                                                                <?php } ?>
                                                                <?php if ($rproduct["isRepo"]) { ?>
                                                                    <div class="d-flex gap-3">
                                                                        <span class="fs-6 fw-bolder">₱ <?php echo $rproduct["repoPrice"] ?></span>
                                                                        <span class="text-muted text-decoration-line-through">₱ <?php echo $rproduct["regularPrice"] ?></span>
                                                                    </div>
                                                                <?php } ?>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                <?php } ?> -->
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
    <script src="../../assets/js/custom/widgets.js"></script>
    <script src="../../assets/js/custom/block/blockui.js"></script>
    <script type="module" src="../../app/js/main.productList.js"></script>
</body>

</html>