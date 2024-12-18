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

                if (ii_accesspassword == "uplfile") {
                    $("[data-ii-uplfile-action='save']").click();
                }

                if (ii_accesspassword == "rejectInstallment") {
                    $("[data-save-installment='reject']").click();
                }

                if (ii_accesspassword == "approveInstallment") {
                    $("[data-save-installment='approve']").click();
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

$("#upldFile").change(function (e) {

    e.preventDefault();

    var attachments = document.getElementById("upldFile").files; // <-- reference your file input here

    $("#uplfiles-container").empty();

    for (var i = 0; i < attachments.length; i++) {

        if (attachments[i].type == "application/pdf") {
            $("#uplfiles-container").append("<div class='mb-3 border rounded p-3 col-12 bg-hover-light-secondary d-flex justify-content-between align-items-center'><div class='d-flex align-items-center'><div class='symbol symbol-50px me-5'><svg height='40' width='40' version='1.1' id='Layer_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 303.188 303.188' xml:space='preserve'><g><polygon style='fill:#E8E8E8;' points='219.821,0 32.842,0 32.842,303.188 270.346,303.188 270.346,50.525 	'></polygon><path style='fill:#FB3449;' d='M230.013,149.935c-3.643-6.493-16.231-8.533-22.006-9.451c-4.552-0.724-9.199-0.94-13.803-0.936c-3.615-0.024-7.177,0.154-10.693,0.354c-1.296,0.087-2.579,0.199-3.861,0.31c-1.314-1.36-2.584-2.765-3.813-4.202c-7.82-9.257-14.134-19.755-19.279-30.664c1.366-5.271,2.459-10.772,3.119-16.485c1.205-10.427,1.619-22.31-2.288-32.251c-1.349-3.431-4.946-7.608-9.096-5.528c-4.771,2.392-6.113,9.169-6.502,13.973c-0.313,3.883-0.094,7.776,0.558,11.594c0.664,3.844,1.733,7.494,2.897,11.139c1.086,3.342,2.283,6.658,3.588,9.943c-0.828,2.586-1.707,5.127-2.63,7.603c-2.152,5.643-4.479,11.004-6.717,16.161c-1.18,2.557-2.335,5.06-3.465,7.507c-3.576,7.855-7.458,15.566-11.815,23.02c-10.163,3.585-19.283,7.741-26.857,12.625c-4.063,2.625-7.652,5.476-10.641,8.603c-2.822,2.952-5.69,6.783-5.941,11.024c-0.141,2.394,0.807,4.717,2.768,6.137c2.697,2.015,6.271,1.881,9.4,1.225c10.25-2.15,18.121-10.961,24.824-18.387c4.617-5.115,9.872-11.61,15.369-19.465c0.012-0.018,0.024-0.036,0.037-0.054c9.428-2.923,19.689-5.391,30.579-7.205c4.975-0.825,10.082-1.5,15.291-1.974c3.663,3.431,7.621,6.555,11.939,9.164c3.363,2.069,6.94,3.816,10.684,5.119c3.786,1.237,7.595,2.247,11.528,2.886c1.986,0.284,4.017,0.413,6.092,0.335c4.631-0.175,11.278-1.951,11.714-7.57C231.127,152.765,230.756,151.257,230.013,149.935z M119.144,160.245c-2.169,3.36-4.261,6.382-6.232,9.041c-4.827,6.568-10.34,14.369-18.322,17.286c-1.516,0.554-3.512,1.126-5.616,1.002c-1.874-0.11-3.722-0.937-3.637-3.065c0.042-1.114,0.587-2.535,1.423-3.931c0.915-1.531,2.048-2.935,3.275-4.226c2.629-2.762,5.953-5.439,9.777-7.918c5.865-3.805,12.867-7.23,20.672-10.286C120.035,158.858,119.587,159.564,119.144,160.245z M146.366,75.985c-0.602-3.514-0.693-7.077-0.323-10.503c0.184-1.713,0.533-3.385,1.038-4.952c0.428-1.33,1.352-4.576,2.826-4.993c2.43-0.688,3.177,4.529,3.452,6.005c1.566,8.396,0.186,17.733-1.693,25.969c-0.299,1.31-0.632,2.599-0.973,3.883c-0.582-1.601-1.137-3.207-1.648-4.821C147.945,83.048,146.939,79.482,146.366,75.985z M163.049,142.265c-9.13,1.48-17.815,3.419-25.979,5.708c0.983-0.275,5.475-8.788,6.477-10.555c4.721-8.315,8.583-17.042,11.358-26.197c4.9,9.691,10.847,18.962,18.153,27.214c0.673,0.749,1.357,1.489,2.053,2.22C171.017,141.096,166.988,141.633,163.049,142.265zM224.793,153.959c-0.334,1.805-4.189,2.837-5.988,3.121c-5.316,0.836-10.94,0.167-16.028-1.542c-3.491-1.172-6.858-2.768-10.057-4.688c-3.18-1.921-6.155-4.181-8.936-6.673c3.429-0.206,6.9-0.341,10.388-0.275c3.488,0.035,7.003,0.211,10.475,0.664c6.511,0.726,13.807,2.961,18.932,7.186C224.588,152.585,224.91,153.321,224.793,153.959z'></path><polygon style='fill:#FB3449;' points='227.64,25.263 32.842,25.263 32.842,0 219.821,0'></polygon><g><path style='fill:#A4A9AD;' d='M126.841,241.152c0,5.361-1.58,9.501-4.742,12.421c-3.162,2.921-7.652,4.381-13.472,4.381h-3.643v15.917H92.022v-47.979h16.606c6.06,0,10.611,1.324,13.652,3.971C125.321,232.51,126.841,236.273,126.841,241.152zM104.985,247.387h2.363c1.947,0,3.495-0.546,4.644-1.641c1.149-1.094,1.723-2.604,1.723-4.529c0-3.238-1.794-4.857-5.382-4.857h-3.348C104.985,236.36,104.985,247.387,104.985,247.387z'></path><path style='fill:#A4A9AD;' d='M175.215,248.864c0,8.007-2.205,14.177-6.613,18.509s-10.606,6.498-18.591,6.498h-15.523v-47.979h16.606c7.701,0,13.646,1.969,17.836,5.907C173.119,235.737,175.215,241.426,175.215,248.864z M161.76,249.324c0-4.398-0.87-7.657-2.609-9.78c-1.739-2.122-4.381-3.183-7.926-3.183h-3.773v26.877h2.888c3.939,0,6.826-1.143,8.664-3.43C160.841,257.523,161.76,254.028,161.76,249.324z'></path><path style='fill:#A4A9AD;' d='M196.579,273.871h-12.766v-47.979h28.355v10.403h-15.589v9.156h14.374v10.403h-14.374L196.579,273.871L196.579,273.871z'></path></g><polygon style='fill:#D1D3D3;' points='219.821,50.525 270.346,50.525 219.821,0'></polygon></g></svg></div><div class='d-flex flex-column'><div class='fw-bold fs-5 text-dark text-hover-primary text-wrap'>" + attachments[i].name + "</div></div></div><div class='mt-2' data-ii-input-action='remove' data-id=" + i + "><i class='ki-duotone ki-cross-square fs-1 text-hover-primary'><span class='path1'></span><span class='path2'></span></i></div></div>");
        }

    }

    $(".save-container").removeClass("d-none");
});

$("#uplfiles-container").on('click', "[data-ii-input-action='remove']", function () {

    let dataid = parseInt(this.getAttribute('data-id'));

    $(this).parent().remove();

    removeFile(dataid);

    var attachments = document.getElementById("upldFile").files;

    var list = $("[data-ii-input-action='remove']");

    for (var i = 0; i < list.length; i++) {

        $(list[i]).attr("data-id", i);

    }

    if (attachments.length == 0) {
        $(".save-container").addClass("d-none");
        $("#uplfiles-container").append("<span>No attachments</span>");
    }

});

$("#btnUpload").click(function (e) {

    e.preventDefault();

    $("#upldFile").click();

});

$("[data-ii-uplfile-action='save']").click(function (e) {

    e.preventDefault();

    var attachments = document.getElementById("upldFile").files; // <-- reference your file input here
    var session_iid = $("#session_iid").val().trim();
    var session_uid = $("#session_uid").val().trim();

    // for (var i = 0; i < attachments.length; i++) {
    //     console.log(attachments[i].name + " - " + attachments[i].type);
    // }

    var formData = new FormData();

    for (var i = 0; i < attachments.length; i++) {
        formData.append("files[]", attachments[i]);
    }

    $.ajax({
        url: '../../app/functions/credit-coordinator/fn_uplfiles.php',
        type: 'POST',
        data: formData,
        contentType: false,
        cache: false,
        processData: false,
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
            if (status.status == 500) {
                sweetAlertError(status.message);
            }
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

});


function removeFile(index) {
    var attachments = document.getElementById("upldFile").files; // <-- reference your file input here
    var fileBuffer = new DataTransfer();

    // append the file list to an array iteratively
    for (let i = 0; i < attachments.length; i++) {

        // Exclude file in specified index
        if (index !== i) {
            fileBuffer.items.add(attachments[i]);
        }

        // Assign buffer to file input
        document.getElementById("upldFile").files = fileBuffer.files; // <-- according to your file input reference
    }
}

$("#uplfiles-uploaded").on('click', "[data-ii-input-action='delete']", function () {

    let dataid = parseInt(this.getAttribute('data-id'));

    $(this).parent().remove();

    $.ajax({
        url: '../../app/functions/credit-coordinator/fn_delfiles.php',
        type: 'POST',
        data: {
            dataid: dataid
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {
                sweetAlertSuccess(status.message);
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

$("[data-modal-select='Reject']").click(function (e) {

    e.preventDefault();

    $("#modalReject").modal('show');

});

$("[data-save-installment='reject']").click(function (e) {

    e.preventDefault();

    var input_rejectReasons = $("#input_rejectReasons").val().trim();

    if (input_rejectReasons == "") {
        sweetAlertError("Please input the reason for rejection!");
        return;
    }

    $.ajax({
        url: '../../app/functions/credit-coordinator/fn_rejectInstallment.php',
        type: 'POST',
        data: {
            input_rejectReasons: input_rejectReasons
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

$('#ii_downPayment').on('keyup', function () {

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
        $("#ii_downPayment").val("0.00");
    }

});

$("[data-modal-select='Approve']").click(function (e) {

    e.preventDefault();

    $("#modalApproved").modal('show');

});

$("[data-save-installment='approve']").click(function (e) {

    e.preventDefault();

    var ii_selectMonths = $("#ii_selectMonths").val().trim();
    var ii_downPayment = $("#ii_downPayment").val().trim();
    var ii_approvedDateSched = $("#ii_approvedDateSched").val().trim();

    if (ii_selectMonths == "") {
        sweetAlertError("Please select the number of months!");
        return;
    }

    if (ii_downPayment == "") {
        sweetAlertError("Please input the down payment!");
        return;
    }

    if (ii_approvedDateSched == "") {
        sweetAlertError("Please input the payment start schedule!");
        return;
    }

    $.ajax({
        url: '../../app/functions/credit-coordinator/fn_acceptInstallment.php',
        type: 'POST',
        data: {
            ii_selectMonths: ii_selectMonths,
            ii_downPayment: ii_downPayment,
            ii_approvedDateSched: ii_approvedDateSched
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
        url: '../../app/functions/credit-coordinator/fn_acceptApproval.php',
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
        url: '../../app/functions/credit-coordinator/fn_rejectApproval.php',
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
        url: '../../app/functions/credit-coordinator/fn_undoApproval.php',
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

$("#btn_GenerateCashierReport").click(function (e) {

    e.preventDefault();

    var startDate = $("#ii_datefrom").val().trim();
    var endDate = $("#ii_dateto").val().trim();

    if (startDate == "") {
        sweetAlertError("Please input the start date!");
        return;
    }

    if (endDate == "") {
        sweetAlertError("Please input the end date!");
        return;
    }

    window.open("cashierpayments.php?idate=" + startDate + "&edate=" + endDate, "_blank");

});

$("#btn_GenerateCustomerReport").click(function (e) {

    e.preventDefault();

    var uid = $("#oo_customer").val().trim();
    var startDate = $("#oo_datefrom").val().trim();
    var endDate = $("#oo_dateto").val().trim();

    if (uid == "") {
        sweetAlertError("Please select customer!");
        return;
    }

    if (startDate == "") {
        sweetAlertError("Please input the start date!");
        return;
    }

    if (endDate == "") {
        sweetAlertError("Please input the end date!");
        return;
    }

    window.open("customerpayments.php?uid=" + uid + "&idate=" + startDate + "&edate=" + endDate, "_blank");

});

$("#btn_GenerateCustomerGenReport").click(function (e) {

    e.preventDefault();

    var startDate = $("#pp_datefrom").val().trim();
    var endDate = $("#pp_dateto").val().trim();

    if (startDate == "") {
        sweetAlertError("Please input the start date!");
        return;
    }

    if (endDate == "") {
        sweetAlertError("Please input the end date!");
        return;
    }

    window.open("customerpaymentsgen.php?idate=" + startDate + "&edate=" + endDate, "_blank");

});

$("#btn_GenerateCustomerInstallmentsReport").click(function (e) {

    e.preventDefault();

    var startDate = $("#qq_datefrom").val().trim();
    var endDate = $("#qq_dateto").val().trim();
    var selection = $("#qq_installmentselection").val().trim();

    if (startDate == "") {
        sweetAlertError("Please input the start date!");
        return;
    }

    if (qq_installmentselection == "") {
        sweetAlertError("Please input the end date!");
        return;
    }

    if (selection == "") {
        sweetAlertError("Please select installment status!");
        return;
    }

    window.open("customerinstallments.php?idate=" + startDate + "&edate=" + endDate + "&status=" + selection, "_blank");

});

$("[data-modal-select='Notify']").click(function (e) {

    e.preventDefault();

    var session_iid = $("#session_iid").val().trim();
    var session_uid = $("#session_uid").val().trim();

    $.ajax({
        url: '../../app/functions/credit-coordinator/fn_updatecustomer.php',
        type: 'POST',
        data: {
            session_iid: session_iid,
            session_uid: session_uid
        },
        cache: false,
        success: function (response) {
            sweetAlertSuccess("Installment Approved!");
            setTimeout(() => {
                location.reload();
            }, 1000);
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

});