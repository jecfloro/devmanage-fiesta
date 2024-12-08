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

                if (ii_accesspassword == "addPayment") {
                    $("[data-modal-select='addPayment']").click();
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


$('#ii_amount').on('keyup', function () {

    var price = $(this).val().replace(/[^\d]/g, '');
    var pre, dec;
    var delimiter = '.';

    var result = price;

    if (price.length > 3 && price.charAt(0) == '0') {
        price = price.substr(1);
    }

    if (price.length > 2) {
        pre = price.slice(0, -2);
        dec = price.substr((price.length - 2), 2);
        result = pre + delimiter + dec;
    }

    $(this).val('').val(result);

    if (this.value == "") {
        $("#ii_amount").val("0.00");
    }

});

$("[data-modal-select='addPayment']").click(function (e) {

    e.preventDefault();
    
    var ii_receiptno = $("#ii_receiptno").val().trim();
    var ii_amount = $("#ii_amount").val().trim();
    let ii_remaining = $("#ii_remaining").val().trim();
    var ii_chkboxPayment = 0;

    if (ii_receiptno == "") {
        sweetAlertError("Please fill the receipt number");
        return;
    }

    if (parseFloat(ii_amount) > parseFloat(ii_remaining)) {
        sweetAlertError("Amount is greater than remaining balance!");
        return;
    }

    if ($('#ii_chkboxPayment').is(':checked')) {
        ii_chkboxPayment = 1
    } else {
        ii_chkboxPayment = 0
    }

    if (ii_amount == "") {
        sweetAlertError("Please fill the amount");
    } else {

        var ii_amount = parseFloat(ii_amount);

        if (ii_amount <= 0) {
            sweetAlertError("Please fill the amount");
            return;
        }

        $.ajax({
            url: '../../app/functions/cashier/fn_addPayment.php',
            type: 'POST',
            data: {
                ii_receiptno: ii_receiptno,
                ii_amount: ii_amount,
                ii_chkboxPayment: ii_chkboxPayment
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