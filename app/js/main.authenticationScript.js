"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

var lat, long;

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
} else {
    alert("Geolocation is not supported by this browser");
}

// Focus Input
$("#user_email").focus();

$("#authBtnLogin_submit").click(function (e) {

    e.preventDefault();

    var user_email = $("#user_email").val().trim();
    var user_password = $("#user_password").val().trim();

    if (user_email == "") {
        sweetAlertError("Email is empty!");
        return;
    }

    if (user_password == "") {
        sweetAlertError("Password is empty!");
        return;
    }

    if (!user_email.match(emailFormat)) {
        sweetAlertError("Email format must be user@gmail.com!");
        return;
    }

    if (!user_password.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Password!");
        return;
    }

    $.ajax({
        url: '../../app/functions/authentication/fn_authentication.php',
        type: 'POST',
        data: {
            user_email: user_email,
            user_password: user_password
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {
                location.reload();
            }
            if (status.status == 401) {
                sweetAlertError(status.message);
            }
            if (status.status == 404) {
                sweetAlertError(status.message);
            }
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

});

$("#authBtnVerify_submit").click(function (e) {

    e.preventDefault();

    var code_verify = $("#code_verify").val().trim();

    if (code_verify == "") {
        sweetAlertError("Authentication Code is empty!");
        return;
    }

    $.ajax({
        url: '../../app/functions/authentication/fn_verifyAuthentication.php',
        type: 'POST',
        data: {
            code: code_verify
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {
                sweetAlertSuccess(status.message);
                setTimeout(() => {
                    location.reload();
                }, 1000);
            }
            if (status.status == 401) {
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

var lat, long;

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
} else {
    alert("Geolocation is not supported by this browser");
}

function showPosition(position) {

    $("#authBtnRegister_submit").click(function (e) {
    
        e.preventDefault();
    
        var user_email = $("#user_email").val().trim();
    
        if (user_email == "") {
            sweetAlertError("Email is empty!");
            return;
        }
    
        if (!user_email.match(emailFormat)) {
            sweetAlertError("Email format must be user@gmail.com!");
            return;
        }
    
            lat = position.coords.latitude;
            long = position.coords.longitude;
    
            $.ajax({
                url: '../../app/functions/authentication/fn_register.php',
                type: 'POST',
                data: {
                    lat: lat,
                    long: long,
                    user_email: user_email
                },
                cache: false,
                success: function (response) {
                    var status = JSON.parse(response);
                    $("#authBtnRegister_submit").prop("disabled", true);
                    if (status.status == 200) {
                        sweetAlertSuccess(status.message);
                        setTimeout(() => {
                            location.reload();
                        }, 1000);
                        $("#authBtnRegister_submit").prop("disabled", false);
                    } else {
                        sweetAlertSuccess("Please check email for account activation!");
                        setTimeout(() => {
                            location.reload();
                        }, 1000);
                        $("#authBtnRegister_submit").prop("disabled", false);
                    }
                    if (status.status == 401) {
                        sweetAlertError(status.message);
                    }
                    if (status.status == 404) {
                        sweetAlertError(status.message);
                    }
                },
                error: function (response) {
                    sweetAlertError("Server Error, Please contact administrator!");
                }
            })
    
        sweetAlertSuccess("Please check email for account activation!");
        setTimeout(() => {
            location.href = "/";
        }, 2000);
        $("#authBtnRegister_submit").prop("disabled", false);
    
    });

}