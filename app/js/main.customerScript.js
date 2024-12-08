"use strict";

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

localStorage.removeItem("redirect");

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
} else {
    alert("Geolocation is not supported by this browser");
}

function showPosition(position) {

    var lat = position.coords.latitude;
    var long = position.coords.longitude;

}

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

        var dataid = this.getAttribute("data-id");

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


    });

}

// End of code snippet.


