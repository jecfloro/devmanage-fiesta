"use strict";

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

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

                if (ii_accesspassword == "addLocation") {
                    $("[data-location='addLocation']").click();
                }

                if (ii_accesspassword == "deleteLocation") {
                    $("[data-location='deleteLocation']").click();
                }

                if (ii_accesspassword == "defaultLocation") {
                    $("[data-location='defaultLocation']").click();
                }

                if (ii_accesspassword == "acceptApproval") {
                    $("[data-ii-approve-customer='acceptApproval']").click();
                }

                if (ii_accesspassword == "rejectApproval") {
                    $("[data-ii-approve-customer='rejectApproval']").click();
                }

                if (ii_accesspassword == "undoApproval") {
                    $("[data-ii-approve-customer='undoApproval']").click();
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

$("[data-location='addLocation']").click(function (e) {

    e.preventDefault();

    var ii_lat = $("#ii_lat").val().trim();
    var ii_long = $("#ii_long").val().trim();
    var ii_address = $("#ii_address").val().trim();
    var ii_isDefault = 0;

    if ($('#ii_isDefault').is(':checked')) {
        ii_isDefault = 1
    } else {
        ii_isDefault = 0
    }

    if (ii_lat == "" || ii_long == "" || ii_address == "") {
        sweetAlertError("Please fill all the fields!");
        return;
    }

    if (!ii_address.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Address!");
        return;
    }

    $.ajax({
        url: '../../app/functions/credit-investigator/fn_addLocation.php',
        type: 'POST',
        data: {
            ii_lat: ii_lat,
            ii_long: ii_long,
            ii_address: ii_address,
            ii_isDefault: ii_isDefault
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

$(".datainput [data-ii-input-delete-action='delete']").click(function (e) {

    e.preventDefault();

    var dataii = this.getAttribute("data-ii");
    var datalocation = this.getAttribute("data-location");

    $("#ii_datauser").val(dataii);
    $("#ii_datalocation").val(datalocation);

    $("#modalDelete").modal("show");

});   

$("[data-location='deleteLocation']").click(function (e) {

    e.preventDefault();

    var ii_datauser = $("#ii_datauser").val().trim();
    var ii_datalocation = $("#ii_datalocation").val().trim();

    var setting = this.getAttribute("data-passaccess");
    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    $.ajax({
        url: '../../app/functions/credit-investigator/fn_deleteLocation.php',
        type: 'POST',
        data: {
            ii_datauser: ii_datauser,
            ii_datalocation: ii_datalocation
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

$(".datainput [data-ii-input-active-action='active']").click(function (e) {

    e.preventDefault();

    var dataii = this.getAttribute("data-ii");
    var datalocation = this.getAttribute("data-location");

    $("#ii_datauserdefault").val(dataii);
    $("#ii_datalocationdefault").val(datalocation);

    $("#modalDefault").modal("show");

});   

$("[data-location='defaultLocation']").click(function (e) {

    e.preventDefault();

    var ii_datauser = $("#ii_datauserdefault").val().trim();
    var ii_datalocation = $("#ii_datalocationdefault").val().trim();

    var setting = this.getAttribute("data-passaccess");
    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    $.ajax({
        url: '../../app/functions/credit-investigator/fn_defaultLocation.php',
        type: 'POST',
        data: {
            ii_datauser: ii_datauser,
            ii_datalocation: ii_datalocation
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


$("[data-ii-approve-customer='acceptApproval']").click(function (e) {

    var dataid = this.getAttribute("data-id");
    var setting = this.getAttribute("data-passaccess");
    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    $.ajax({
        url: '../../app/functions/credit-investigator/fn_acceptApproval.php',
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

$("[data-ii-approve-customer='rejectApproval']").click(function (e) {

    var dataid = this.getAttribute("data-id");
    var setting = this.getAttribute("data-passaccess");
    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    $.ajax({
        url: '../../app/functions/credit-investigator/fn_rejectApproval.php',
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

$("[data-ii-approve-customer='undoApproval']").click(function (e) {

    var dataid = this.getAttribute("data-id");
    var setting = this.getAttribute("data-passaccess");
    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    $.ajax({
        url: '../../app/functions/credit-investigator/fn_undoApproval.php',
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