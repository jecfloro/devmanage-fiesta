<?php

include '../../app/connection/SQLSERVER.php';
include '../../app/sessions/AdministratorSession.php';
require '../../app/setting/AESCLASS.php';


date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

try {
    $conn = new PDO("sqlsrv:server=$TS8_dbserver;database=$TS8_dbname", $TS8_dbuser, $TS8_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $usercode = $_SESSION['session_usercode'];

    $select_user = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysUsers] WHERE [PK_appsysUsers] = '$usercode'");
    $rselect_user = $select_user->fetchall(PDO::FETCH_ASSOC);

    // Account Information
    $fullname = secureToken::tokendecrypt($rselect_user[0]["pi_fullname"]);
    $email = secureToken::tokendecrypt($rselect_user[0]["useremail"]);

    $select_group = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysGroups] ORDER BY [group_name] ASC");
    $rselect_group = $select_group->fetchall(PDO::FETCH_ASSOC);
    
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

?>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
    <title>Rivera Medical Center, Inc. - HR Management System</title>
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
                    <a href="dashboard-hr.php">
                        <img alt="Logo" src="../../assets/media/logos/RMCI.png" width="100px" class="max-h-50px logo-default theme-light-show" />
                        <img alt="Logo" src="../../assets/media/logos/RMCI-ALT.png" width="100px" class="max-h-50px logo-default theme-dark-show" />
                        <img alt="Logo" src="../../assets/media/logos/RMCI.png" width="40px" class="max-h-50px logo-minimize theme-light-show" />
                        <img alt="Logo" src="../../assets/media/logos/RMCI-ALT.png" width="40px" class="max-h-50px logo-minimize theme-dark-show" />
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
                            <a href="dashboard-hr.php" class="d-lg-none">
                                <img alt="Logo" src="../../assets/media/logos/RMCI.png" width="60px" class="mh-40px theme-light-show" />
                                <img alt="Logo" src="../../assets/media/logos/RMCI-ALT.png" width="60px" class="mh-40px theme-dark-show" />
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
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content fs-6 d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="toolbar" id="kt_toolbar">
                        <div class=" container-fluid d-flex flex-stack flex-wrap flex-sm-nowrap">
                            <div class="d-flex flex-column align-items-start justify-content-center flex-wrap me-2">
                                <h1 class="text-dark fw-bold my-1 fs-2">
                                    Settings <small class="text-muted fs-6 fw-normal ms-1"></small>
                                </h1>
                                <ul class="breadcrumb fw-semibold fs-base my-1">
                                    <li class="breadcrumb-item text-muted">
                                        <a href="dashboard-hr.php" class="text-muted text-hover-primary">
                                            Home
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item text-muted">
                                        Settings
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        Groups
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
                                    <div class="row g-xl-12">
                                        <div class="card">
                                            <div class="card-header border-0 pt-6">
                                                <div class="card-title">
                                                    <div class="d-flex align-items-center position-relative my-1">
                                                        <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5"><span class="path1"></span><span class="path2"></span></i> <input type="text" data-kt-hrgroupdepartments-table-filter="search" class="form-control form-control-solid w-250px ps-13" placeholder="Search Group" />
                                                    </div>
                                                </div>
                                                <div class="card-toolbar">
                                                    <!-- Search -->
                                                    <div class="d-flex justify-content-end gap-3 flex-wrap">
                                                        <button type="button" class="btn btn-primary d-flex align-items-center ps-5" data-bs-toggle="modal" data-bs-target="#modal_hrGroupDeparments">
                                                            <i class="ki-duotone ki-plus fs-2"></i>
                                                            <span>Add Group</span>
                                                        </button>
                                                        <a href="" class="btn btn-secondary d-flex align-items-center">
                                                            <i class="ki-duotone ki-arrow-circle-right fs-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            <span>Refresh</span>
                                                        </a>
                                                    </div>
                                                    <div class="modal fade" id="modal_hrGroupDeparments" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrGroupDeparmentsHeader">
                                                                    <h2 class="fw-bold">Add Department Group</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrGroupDeparments" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrGroupDeparmentsHeader" data-kt-scroll-wrappers="#modal_hrGroupDeparments" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Group Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_groupname" placeholder="Group Name" aria-label="Group Name" aria-describedby="ii_groupname" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-deptgroup-modal-action="submit">
                                                                                <span class="indicator-label">
                                                                                    Submit
                                                                                </span>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal fade" id="modal_hrGroupDeparmentsEdit" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrGroupDeparmentsHeaderEdit">
                                                                    <h2 class="fw-bold">Edit Department Group</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrGroupDeparmentsEdit" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrGroupDeparmentsHeaderEdit" data-kt-scroll-wrappers="#modal_hrGroupDeparmentsEdit" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2">Code</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_groupcodeedit" placeholder="Group Code" aria-label="Group Code" aria-describedby="ii_groupcodeedit" readonly />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Group Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_groupnameedit" placeholder="Group Name" aria-label="Group Name" aria-describedby="ii_groupnameedit" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Password</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="password" class="form-control" id="ii_passwordedit" placeholder="Password" aria-label="Password" aria-describedby="ii_passwordedit" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-deptgroupedit-modal-action="submit">
                                                                                <span class="indicator-label">
                                                                                    Submit
                                                                                </span>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal fade" id="modal_hrGroupDeparmentsDelete" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrGroupDeparmentsHeaderDelete">
                                                                    <h2 class="fw-bold">Delete Department Group</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrGroupDeparmentsDelete" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrGroupDeparmentsHeaderDelete" data-kt-scroll-wrappers="#modal_hrGroupDeparmentsDelete" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2">Code</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_groupcodedelete" placeholder="Group Code" aria-label="Group Code" aria-describedby="ii_groupcodedelete" readonly />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Password</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="password" class="form-control" id="ii_password" placeholder="Password" aria-label="Password" aria-describedby="ii_password" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-deptgroupdelete-modal-action="submit">
                                                                                <span class="indicator-label">
                                                                                    Submit
                                                                                </span>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body py-4">
                                                <table class="table align-middle table-row-dashed fs-6 gy-5" id="tb_hrGroup">
                                                    <thead>
                                                        <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
                                                            <th>Description</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="text-gray-600 fw-semibold">
                                                        <?php if (count($rselect_group) > 0) { ?>
                                                            <?php for ($ii = 0; $ii < count($rselect_group); $ii++) { ?>
                                                                <tr>
                                                                    <td class="">
                                                                        <?php echo $rselect_group[$ii]["group_name"]; ?>
                                                                    </td>
                                                                    <td class="text-end datainput">
                                                                        <div class="d-flex justify-content-end gap-2">
                                                                            <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3" data-ii-val="<?php echo $rselect_group[$ii]["PK_appsysGroups"]; ?>" data-ii-input-edit-action="edit">
                                                                                <i class="ki-duotone ki-notepad-edit fs-2x">
                                                                                    <span class="path1"></span>
                                                                                    <span class="path2"></span>
                                                                                </i>
                                                                            </div>
                                                                            <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3" data-ii-val="<?php echo $rselect_group[$ii]["PK_appsysGroups"]; ?>" data-ii-input-delete-action="delete">
                                                                                <i class="ki-duotone ki-trash fs-2x">
                                                                                    <span class="path1"></span>
                                                                                    <span class="path2"></span>
                                                                                    <span class="path3"></span>
                                                                                    <span class="path4"></span>
                                                                                    <span class="path5"></span>
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
                </div>
            </div>
        </div>
        <div class="footer py-4 d-flex flex-lg-column user-select-none" id="kt_footer">
            <div class="container-fluid d-flex flex-column justify-content-end flex-md-row flex-stack">
                <div class="text-dark order-2 order-md-1">
                    <span class="text-muted fw-semibold me-1"><script>document.write(new Date().getFullYear());</script> &copy;</span>
                    <span class="text-gray-800 text-hover-primary">Rivera Medical Center, Inc.</span>
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
    <script src="../../assets/js/datatables/hr-group.js"></script>
    <script type="module" src="../../app/js/main.hrGroup.js"></script>
</body>

</html>