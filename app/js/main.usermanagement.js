"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

$("[data-ii-usermngadd-modal-action='submit']").click(function (e) {

    e.preventDefault();
    
    var setting = this.getAttribute("data-passaccess");

    var ii_emailaddress = $("#ii_emailaddress").val().trim();
    var select_usertype = $("#select_usertype").val();

    if (ii_emailaddress == "") {
        sweetAlertError("Email Number is required!");
        return;
    }

    if (!ii_emailaddress.match(emailFormat)) {
        sweetAlertError("Email format must be user@gmail.com!");
        return;
    }

    if (select_usertype == "") {
        sweetAlertError("Account Type is required!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#addUserModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/user-management/fn_addUser.php',
            type: 'POST',
            data: {
                ii_emailaddress: ii_emailaddress,
                select_usertype: select_usertype
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
                } else {
                    sweetAlertSuccess("Account Added!");
                    setTimeout(() => {
                        location.reload();
                    }, 1000);
                }
                if (status.status == 403) {
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

                if (ii_accesspassword == "adduser") {
                    $("[data-ii-usermngadd-modal-action='submit']").click();
                    $("[data-ii-usermngadd-modal-action='submit']").click();
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