"use strict";

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

localStorage.removeItem("redirect");

$("[data-ii-productapply-action='submit']").click(function (e) {

    e.preventDefault();

    var dataid = this.getAttribute("data-id");

    localStorage.setItem("redirect", dataid);

    window.location.href = "login.php";

});

if ($("[data-ii-applyinstallment-modal-action='apply']").length == 1) {

    $("[data-ii-applyinstallment-modal-action='apply']").click(function (e) {

        $("#kt_drawer_trigger").click();

    });

}

$("[data-ii-userpassword-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var ii_password = $("#ii_password").val().trim();

    if (ii_password == "") {
        sweetAlertError("Password is empty!");
        return;
    }

    if (!ii_password.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Password!");
        return;
    }

    $.ajax({
        url: '../../app/functions/authentication/fn_PasswordVerify.php',
        type: 'POST',
        data: {
            ii_password: ii_password
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200 && status.access == 1) {

                $("#ii_accessconfirmation").val(1);

                var ii_accesspassword = $("#ii_accesspassword").val().trim();

                if (ii_accesspassword == "cancelinstallment") {
                    $("[data-ii-cancelinstallment-modal-action='cancel']").click();
                }

            }
            if (status.status == 401) {
                $("#ii_password").val("");
                sweetAlertError(status.message);
            }
            if (status.status == 404) {
                sweetAlertError(status.message);
            }
            if (status.status == 500) {
                sweetAlertError(status.message);
            }
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

});

if ($("[data-ii-applyinstallment-modal-action='sendrequest']").length == 1) {

    $("[data-ii-applyinstallment-modal-action='sendrequest']").click(function (e) {

        e.preventDefault();

        var dataid = this.getAttribute("data-id");
        var dataprice = $(".ii_ordervalue").text();

        $(this).prop('disabled', true);

        $.ajax({
            url: '../../app/functions/customer/fn_addInstallment.php',
            type: 'POST',
            data: {
                dataid: dataid,
                dataprice: dataprice
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    setTimeout(() => {
                        location.reload();
                    }, 1000);
                }
                if (status.status == 401) {
                    sweetAlertError(status.message);
                }
                if (status.status == 403) {
                    sweetAlertError(status.message);
                }
                if (status.status == 409) {
                    sweetAlertError(status.message);
                }
                if (status.status == 500) {
                    sweetAlertError(status.message);
                }
            },
            error: function (response) {
                sweetAlertError("Server Error, Please contact administrator!");
            }
        })

    });

}

if ($("[data-ii-cancelinstallment-modal-action='cancel']").length == 1) {

    $("[data-ii-cancelinstallment-modal-action='cancel']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");
        var dataid = this.getAttribute("data-id");

        var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

        if (ii_accessconfirmation == "") {
            $("#ii_accesspassword").val(setting);
            $("#modal_access").modal("show");
            setTimeout(() => {
                $("#ii_password").focus();
            }, 500);
        } else {

            $(this).prop('disabled', true);

            $.ajax({
                url: '../../app/functions/customer/fn_verifyCancelInstallation.php',
                type: 'POST',
                data: {
                    dataid: dataid
                },
                cache: false,
                success: function (response) {
                    var status = JSON.parse(response);
                    if (status.status == 200) {
                        $("#modal_access").modal("hide");
                        sweetAlertSuccess(status.message);
                        setTimeout(() => {
                            location.reload();
                        }, 1000);
                    }
                    if (status.status == 401) {
                        sweetAlertError(status.message);
                    }
                    if (status.status == 403) {
                        sweetAlertError(status.message);
                    }
                    if (status.status == 409) {
                        sweetAlertError(status.message);
                    }
                    if (status.status == 500) {
                        sweetAlertError(status.message);
                    }
                },
                error: function (response) {
                    sweetAlertError("Server Error, Please contact administrator!");
                }
            })

        }


    });

}

// End of code snippet.


