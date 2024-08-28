"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

// Focus Input
$("#user_email").focus();

$("#authBtnLogin_submit").click(function(e) {

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
        success: function(response) {
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
        error: function(response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

});