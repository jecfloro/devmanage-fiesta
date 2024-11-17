<?php if ($ruserprofile["isProfileFilled"] == 1) { ?>
    <div class="menu menu-sub-indention menu-column menu-rounded menu-title-gray-600 menu-icon-gray-400 menu-active-bg menu-state-primary menu-arrow-gray-500 fw-semibold fs-6 my-5 mt-lg-2 mb-lg-0" id="kt_aside_menu" data-kt-menu="true">
        <div class="hover-scroll-y mx-4" id="kt_aside_menu_wrapper" data-kt-scroll="true" data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-height="auto" data-kt-scroll-wrappers="#kt_aside_menu" data-kt-scroll-offset="20px" data-kt-scroll-dependencies="#kt_aside_logo, #kt_aside_footer">
            <div class="menu-item pt-5">
                <div class="menu-content"><span class="fw-bold text-muted text-uppercase fs-7">Apps</span></div>
            </div>
            <div class="menu-item"><a class="menu-link" href="dashboard.php"><span class="menu-icon"><i class="ki-duotone ki-element-11 fs-2"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span></i></span><span class="menu-title">Dashboard</span></a></div>
            <div class="menu-item"><a class="menu-link" href="customer.php"><span class="menu-icon"><i class="ki-duotone ki-user-square fs-2"><span class="path1"></span><span class="path2"></span><span class="path3"></span></i></span><span class="menu-title">Customer</span></a></div>
            <div class="menu-item"><a class="menu-link" href="installments.php"><span class="menu-icon"><i class="ki-duotone ki-calendar-tick fs-2"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span></i></span><span class="menu-title">Installments</span></a></div>
            <div class="menu-item"><a class="menu-link" href="payments.php"><span class="menu-icon"><i class="ki-duotone ki-wallet fs-2"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span></i></span><span class="menu-title">Payments</span></a></div>
        </div>
    </div>
<?php } ?>