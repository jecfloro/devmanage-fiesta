"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat, phoneInputMask } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

$("[data-ii-updateprofile-modal-action='update']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_lastname = $("#ii_lastname").val().trim();
    var ii_firstname = $("#ii_firstname").val().trim();
    var ii_middlename = $("#ii_middlename").val().trim();
    var ii_nickname = $("#ii_nickname").val().trim();
    
    var select_gender = $("#select_gender").val();
    var select_civilstatus = $("#select_civilstatus").val();
    
    var ii_nationality = $("#ii_nationality").val().trim();
    var ii_age = $("#ii_age").val().trim();
    var ii_birthdate = $("#kt_datepicker_9").val().trim();

    var ii_placeofbirth = $("#ii_placeofbirth").val().trim();
    var ii_contactnumber = $("#kt_inputmask_3").val();
    var ii_address = $("#ii_address").val();

    if (ii_lastname == "") {
        sweetAlertError("Last Name is required!");
        return;
    }

    if (ii_firstname == "") {
        sweetAlertError("First Name is required!");
        return;
    }

    if (ii_nickname == "") {
        sweetAlertError("Nick Name is required!");
        return;
    }

    if (select_gender == "") {
        sweetAlertError("Gender is required!");
        return;
    }

    if (select_civilstatus == "") {
        sweetAlertError("Civil Status is required!");
        return;
    }

    if (ii_nationality == "") {
        sweetAlertError("Nationality is required!");
        return;
    }

    if (ii_age == "") {
        sweetAlertError("Age is required!");
        return;
    }

    if (ii_birthdate == "") {
        sweetAlertError("Birthdate is required!");
        return;
    }

    if (ii_placeofbirth == "") {
        sweetAlertError("Place of Birth is required!");
        return;
    }

    if (ii_contactnumber == "") {
        sweetAlertError("Contact Number is required!");
        return;
    }

    if (!ii_contactnumber.match(phoneInputMask)) {
        sweetAlertError("Contact Number is required!");
        return;
    }

    if (ii_address == "") {
        sweetAlertError("Address is required!");
        return;
    }

    if (!ii_lastname.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Last Name!");
        return;
    }

    if (!ii_firstname.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on First Name!");
        return;
    }

    if (ii_middlename != "") {
        if (!ii_middlename.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Middle Name!");
            return;
        }
    }

    if (!ii_nickname.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Nick Name!");
        return;
    }

    if (!ii_nationality.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Nationality!");
        return;
    }

    if (!ii_placeofbirth.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Place Of Birth!");
        return;
    }

    if (!ii_address.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Address!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/user-management/fn_updateuserprofile.php',
            type: 'POST',
            data: {
                ii_lastname: ii_lastname,
                ii_firstname: ii_firstname,
                ii_middlename: ii_middlename,
                ii_nickname: ii_nickname,
                select_gender: select_gender,
                select_civilstatus: select_civilstatus,
                ii_nationality: ii_nationality,
                ii_age: ii_age,
                ii_birthdate: ii_birthdate,
                ii_placeofbirth: ii_placeofbirth,
                ii_contactnumber: ii_contactnumber,
                ii_address: ii_address
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

$("[data-ii-userpassword-modal-action='submit']").click(function(e) {

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

                if (ii_accesspassword == "updateprofile") {
                    $("[data-ii-updateprofile-modal-action='update']").click();
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
