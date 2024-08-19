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

    // mkdir("F:/JECO E. FLORO/", 0, true);

    $select_group = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysGroups] ORDER BY [group_name] ASC");
    $rselect_group = $select_group->fetchall(PDO::FETCH_ASSOC);

    $select_department = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysDepartments] ORDER BY [department_name] ASC");
    $rselect_department = $select_department->fetchall(PDO::FETCH_ASSOC);

    $select_position = $conn->query("SELECT * FROM [RMCI.SYS].[dbo].[appsysPositions] ORDER BY [position_name] ASC");
    $rselect_position = $select_position->fetchall(PDO::FETCH_ASSOC);

    $select_userlist = $conn->query("SELECT TOP (1000) a.[PK_appsysUsers]
            ,a.[FK_appsysGroups]
            ,b.[group_name]
            ,a.[FK_appsysDepartments]
            ,c.[department_name]
            ,a.[FK_appsysPositions]
            ,d.[position_name]
            ,a.[usercode]
            ,a.[userpass]
            ,a.[usertype]
            ,a.[useremail]
            ,a.[logtime]
            ,a.[logout]
            ,a.[systemHR]
            ,a.[systemBilling]
            ,a.[systemMedicalRecords]
            ,a.[systemAccounting]
            ,a.[sysHRadminaccess]
            ,a.[sysHRemployeeaccess] 
            ,a.[sysHRdepartmentHead]
            ,a.[sysHRscheduleAdd]
            ,a.[sysHRscheduleApproval]
            ,a.[sysHRdeleteaccess]
            ,a.[passchangedate]
            ,a.[usercreatedate]
            ,a.[syslock]
            ,a.[syslockdate]
            ,a.[lockaccount]
            ,a.[pi_lastname]
            ,a.[pi_middlename]
            ,a.[pi_firstname]
            ,a.[pi_suffixname]
            ,a.[pi_fullname]
        FROM [RMCI.SYS].[dbo].[appsysUsers] 
        AS a JOIN [appsysGroups] 
        AS b ON a.FK_appsysGroups = b.PK_appsysGroups JOIN [appsysDepartments] 
        AS c ON a.FK_appsysDepartments = c.PK_appsysDepartments JOIN [appsysPositions]
        AS d ON a.FK_appsysPositions = d.PK_appsysPositions ORDER BY [PK_appsysUsers] ASC");
    $rselect_userlist = $select_userlist->fetchall(PDO::FETCH_ASSOC);
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
                                        Apps
                                    </li>
                                    <li class="breadcrumb-item text-dark">
                                        User Management
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
                                                        <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5"><span class="path1"></span><span class="path2"></span></i> <input type="text" data-kt-hrusermanagement-table-filter="search" class="form-control form-control-solid w-250px ps-13" placeholder="Search User" />
                                                    </div>
                                                </div>
                                                <div class="card-toolbar">
                                                    <!-- Search -->
                                                    <div class="d-flex justify-content-end gap-3 flex-wrap">
                                                        <button type="button" class="btn btn-primary d-flex align-items-center ps-5" data-bs-toggle="modal" data-bs-target="#modal_hrAddUser">
                                                            <i class="ki-duotone ki-plus fs-2"></i>
                                                            <span>Add User</span>
                                                        </button>
                                                        <a href="" class="btn btn-secondary d-flex align-items-center">
                                                            <i class="ki-duotone ki-arrow-circle-right fs-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            <span>Refresh</span>
                                                        </a>
                                                    </div>
                                                    <div class="modal fade" id="modal_hrAddUser" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrAddUserHeader">
                                                                    <h2 class="fw-bold">User Details</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrAddUser" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrAddUserHeader" data-kt-scroll-wrappers="#modal_hrAddUser" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2 d-flex align-items-center gap-3">
                                                                                    User Code
                                                                                </label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_usercode" placeholder="User Code" aria-label="User Code" aria-describedby="ii_" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Last Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_lastname" placeholder="Last Name" aria-label="Last Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">First Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_firstname" placeholder="First Name" aria-label="First Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Middle Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_middlename" placeholder="Middle Name" aria-label="Middle Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Suffix Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3 opacity-0">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_suffixname" placeholder="Suffix Name" aria-label="Suffix Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">User Group</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <select name="" id="ii_usergroup" class="form-control form-control-select">
                                                                                        <option value="">Not Applicable</option>
                                                                                        <?php if (count($rselect_group) > 0) { ?>
                                                                                            <?php for ($ii = 0; $ii < count($rselect_group); $ii++) { ?>
                                                                                                <option value="<?php echo $rselect_group[$ii]["PK_appsysGroups"]; ?>"><?php echo $rselect_group[$ii]["group_name"]; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Department</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <select name="" id="ii_department" class="form-control form-control-select">
                                                                                        <option value="">Not Applicable</option>
                                                                                        <?php if (count($rselect_department) > 0) { ?>
                                                                                            <?php for ($jj = 0; $jj < count($rselect_department); $jj++) { ?>
                                                                                                <option value="<?php echo $rselect_department[$jj]["PK_appsysDepartments"]; ?>"><?php echo $rselect_department[$jj]["department_name"]; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Position</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <select name="" id="ii_position" class="form-control form-control-select">
                                                                                        <option value="">Not Applicable</option>
                                                                                        <?php if (count($rselect_position) > 0) { ?>
                                                                                            <?php for ($kk = 0; $kk < count($rselect_position); $kk++) { ?>
                                                                                                <option value="<?php echo $rselect_position[$kk]["PK_appsysPositions"]; ?>"><?php echo $rselect_position[$kk]["position_name"]; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-adduser-modal-action="submit" data-passaccess="add">
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
                                                    <div class="modal fade" id="modal_hrEditUser" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrAddUserHeader">
                                                                    <h2 class="fw-bold">User Details</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrEditUser" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrEditUserHeader" data-kt-scroll-wrappers="#modal_hrEditUser" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2 d-flex align-items-center gap-3">
                                                                                    User ID
                                                                                </label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_useridedit" placeholder="User ID" aria-label="User ID" aria-describedby="ii_" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" readonly />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2 d-flex align-items-center gap-3">
                                                                                    User Code
                                                                                </label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_usercodeedit" placeholder="User Code" aria-label="User Code" aria-describedby="ii_" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">New Password</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="password" class="form-control" id="ii_newpasswordedit" placeholder="New Password" aria-label="Password" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Confirm Password</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="password" class="form-control" id="ii_confirmpasswordedit" placeholder="Confirm Password" aria-label="Password" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Email Address</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_emailaddressedit" placeholder="Email Address" aria-label="Email Address" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Last Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_lastnameedit" placeholder="Last Name" aria-label="Last Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">First Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_firstnameedit" placeholder="First Name" aria-label="First Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Middle Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_middlenameedit" placeholder="Middle Name" aria-label="Middle Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Suffix Name</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3 opacity-0">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_suffixnameedit" placeholder="Suffix Name" aria-label="Suffix Name" aria-describedby="ii_" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">User Group</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <select name="" id="ii_usergroupedit" class="form-control form-control-select">
                                                                                        <option value="">Not Applicable</option>
                                                                                        <?php if (count($rselect_group) > 0) { ?>
                                                                                            <?php for ($ii = 0; $ii < count($rselect_group); $ii++) { ?>
                                                                                                <option value="<?php echo $rselect_group[$ii]["PK_appsysGroups"]; ?>"><?php echo $rselect_group[$ii]["group_name"]; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Department</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <select name="" id="ii_departmentedit" class="form-control form-control-select">
                                                                                        <option value="">Not Applicable</option>
                                                                                        <?php if (count($rselect_department) > 0) { ?>
                                                                                            <?php for ($jj = 0; $jj < count($rselect_department); $jj++) { ?>
                                                                                                <option value="<?php echo $rselect_department[$jj]["PK_appsysDepartments"]; ?>"><?php echo $rselect_department[$jj]["department_name"]; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2">Position</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <select name="" id="ii_positionedit" class="form-control form-control-select">
                                                                                        <option value="">Not Applicable</option>
                                                                                        <?php if (count($rselect_position) > 0) { ?>
                                                                                            <?php for ($kk = 0; $kk < count($rselect_position); $kk++) { ?>
                                                                                                <option value="<?php echo $rselect_position[$kk]["PK_appsysPositions"]; ?>"><?php echo $rselect_position[$kk]["position_name"]; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-edituser-modal-action="submit" data-passaccess="edit">
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
                                                    <div class="modal fade" id="modal_hrModule" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrAddUserHeader">
                                                                    <h2 class="fw-bold">Miscellaneous Module</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrModule" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrModuleHeader" data-kt-scroll-wrappers="#modal_hrModule" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2 d-flex align-items-center gap-3">
                                                                                    User ID
                                                                                </label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_useridmodule" placeholder="User ID" aria-label="User ID" aria-describedby="ii_" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" readonly />
                                                                                </div>
                                                                            </div>
                                                                            <div class="bg-gray-100 p-3 rounded fw-bolder">
                                                                                Administrative Accessibility
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxAdministrativeAccess" />
                                                                                    <label class="form-check-label" for="chkbxAdministrativeAccess">
                                                                                        Grant user an administrative access
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bg-gray-100 p-3 rounded fw-bolder mt-10">
                                                                                System Accessibility
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxHRAccess" />
                                                                                    <label class="form-check-label" for="chkbxHRAccess">
                                                                                        Human Resource Attendance and Payroll System
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxAccountingAccess" />
                                                                                    <label class="form-check-label" for="chkbxAccountingAccess">
                                                                                        Accounting Report Claims System
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkMedicalRecordsAccess" />
                                                                                    <label class="form-check-label" for="chkMedicalRecordsAccess">
                                                                                        Medical Records Report Claims System
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxBillingAccess" />
                                                                                    <label class="form-check-label" for="chkbxBillingAccess">
                                                                                        Billing Patient Doctors Reference Remover System
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bg-gray-100 p-3 rounded fw-bolder mt-10">
                                                                                User Accessibility
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxGrantDepartmentHead" />
                                                                                    <label class="form-check-label" for="chkbxGrantDepartmentHead">
                                                                                        Make this user as a Department Head
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxGrantHRAdmin" />
                                                                                    <label class="form-check-label" for="chkbxGrantHRAdmin">
                                                                                        Grant this user as an admin on HR System
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxGrantHRSchedule" />
                                                                                    <label class="form-check-label" for="chkbxGrantHRSchedule">
                                                                                        Grant this user to set Schedule on Department
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="pt-5">
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" id="chkbxGrantHRApproval" />
                                                                                    <label class="form-check-label" for="chkbxGrantHRApproval">
                                                                                        Grant this user to approve Schedule on Department
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-editmodule-modal-action="submit" data-passaccess="module">
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
                                                    <div class="modal fade" id="modal_hrLock" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrLockHeader">
                                                                    <h2 class="fw-bold">Lock Account</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrLock" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrModuleHeader" data-kt-scroll-wrappers="#modal_hrModule" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2 d-flex align-items-center gap-3">
                                                                                    User ID
                                                                                </label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_useridlock" placeholder="User ID" aria-label="User ID" aria-describedby="ii_" inputmode="numeric" oninput="this.value = this.value.replace(/\D+/g, '')" readonly />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0">
                                                                                <label class="fw-semibold fs-6 mb-2 d-flex align-items-center gap-3">
                                                                                    Confirm
                                                                                </label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_userlockconfirm" placeholder="Type 'Confirm' to lock account" aria-label="Lock" aria-describedby="ii_"/>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="text-center pt-10">
                                                                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                                                                                Discard
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary" data-ii-lockaccount-modal-action="submit" data-passaccess="lock" disabled>
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
                                                    <div class="modal fade" id="modal_hrPasswordAccess" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mw-650px">
                                                            <div class="modal-content">
                                                                <div class="modal-header" id="modal_hrPasswordAccessHeaderDelete">
                                                                    <h2 class="fw-bold">Password Authentication Entry</h2>
                                                                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                                                                        <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-body px-5 my-7">
                                                                    <div>
                                                                        <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_hrPasswordAccess" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrPasswordAccessHeaderDelete" data-kt-scroll-wrappers="#modal_hrPasswordAccess" data-kt-scroll-offset="300px">
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2">Access</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_accesspassword" placeholder="Access Password" readonly />
                                                                                </div>
                                                                            </div>
                                                                            <div class="fv-row mb-0" hidden>
                                                                                <label class="fw-semibold fs-6 mb-2">Confirmation</label>
                                                                                <div class="input-group mb-5">
                                                                                    <span class="input-group-text">
                                                                                        <i class="ki-duotone ki-check-circle text-primary fs-3">
                                                                                            <span class="path1"></span>
                                                                                            <span class="path2"></span>
                                                                                        </i>
                                                                                    </span>
                                                                                    <input type="text" class="form-control" id="ii_accessconfirmation" placeholder="Access Confirmation" readonly />
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
                                                                            <button type="submit" class="btn btn-primary" data-ii-userpassword-modal-action="submit">
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
                                                <table class="table align-middle table-row-dashed fs-6 gy-5" id="tb_hrUsermanagement">
                                                    <thead>
                                                        <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
                                                            <th></th>
                                                            <th>Fullname</th>
                                                            <th>Role</th>
                                                            <th>Status</th>
                                                            <th>User Group</th>
                                                            <th>Department</th>
                                                            <th>Position</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="text-gray-600 fw-semibold">
                                                        <?php if (count($rselect_userlist) > 0) { ?>
                                                            <?php for ($ll = 0; $ll < count($rselect_userlist); $ll++) { ?>
                                                                <tr>
                                                                    <td>
                                                                        <img alt="Logo" class="bg-secondary rounded" src="../../assets/media/avatars/user-avatar.png" width="60" />
                                                                    </td>
                                                                    <td class="text-nowrap">
                                                                        <div class="d-flex flex-column">
                                                                            <span class="fw-bolder text-primary">
                                                                                <?php echo secureToken::tokendecrypt($rselect_userlist[$ll]["pi_fullname"]); ?>
                                                                            </span>
                                                                            <span class="text-gray-500"><?php echo $rselect_userlist[$ll]["usercode"] ?></span>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <?php if ($rselect_userlist[$ll]["usertype"] == 1) { ?>
                                                                            <div class="d-flex align-items-center gap-3">
                                                                                <i class="ki-duotone ki-key fs-2x text-primary">
                                                                                    <span class="path1"></span>
                                                                                    <span class="path2"></span>
                                                                                </i>
                                                                                <span class="fw-bolder">Admin</span>
                                                                            </div>
                                                                        <?php } ?>
                                                                        <?php if ($rselect_userlist[$ll]["sysHRdepartmentHead"] == 1) { ?>
                                                                            <div class="d-flex align-items-center gap-3">
                                                                                <i class="ki-duotone ki-user-tick fs-2x text-primary">
                                                                                    <span class="path1"></span>
                                                                                    <span class="path2"></span>
                                                                                    <span class="path3"></span>
                                                                                </i>
                                                                                <span class="fw-bolder">Department Head</span>
                                                                            </div>
                                                                        <?php } ?>
                                                                    </td>
                                                                    <td>
                                                                        <?php if ($rselect_userlist[$ll]["lockaccount"] == 1) { ?>
                                                                            <span class="badge badge-secondary fw-bolder">Locked</span>
                                                                        <?php } ?>
                                                                    </td>
                                                                    <td>
                                                                        <span><?php echo $rselect_userlist[$ll]["group_name"] ?></span>
                                                                    </td>
                                                                    <td><?php echo $rselect_userlist[$ll]["department_name"] ?></td>
                                                                    <td><?php echo $rselect_userlist[$ll]["position_name"] ?></td>
                                                                    <td class="text-end datainput">
                                                                        <div class="d-flex justify-content-end gap-2">
                                                                            <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3" data-ii-val="<?php echo $rselect_userlist[$ll]["PK_appsysUsers"]; ?>" data-ii-input-module-action="edit">
                                                                                <i class="ki-duotone ki-setting-3 fs-2x">
                                                                                    <span class="path1"></span>
                                                                                    <span class="path2"></span>
                                                                                    <span class="path3"></span>
                                                                                    <span class="path4"></span>
                                                                                    <span class="path5"></span>
                                                                                </i>
                                                                            </div>
                                                                            <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3" data-ii-val="<?php echo $rselect_userlist[$ll]["PK_appsysUsers"]; ?>" data-ii-input-edit-action="edit">
                                                                                <i class="ki-duotone ki-notepad-edit fs-2x">
                                                                                    <span class="path1"></span>
                                                                                    <span class="path2"></span>
                                                                                </i>
                                                                            </div>
                                                                            <div class="tableaction-hover rounded pt-2 pb-1 ps-3 pe-3" data-ii-val="<?php echo $rselect_userlist[$ll]["PK_appsysUsers"]; ?>" data-ii-input-lock-action="lock">
                                                                                <i class="ki-duotone ki-lock-2 fs-2x">
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
                    <span class="text-muted fw-semibold me-1">
                        <script>
                            document.write(new Date().getFullYear());
                        </script> &copy;
                    </span>
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
    <script src="../../assets/js/datatables/hr-usermanagement.js"></script>
    <script type="module" src="../../app/js/main.usermanagement.js"></script>
</body>

</html>