"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

$("[data-ii-categoryadd-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_category = $("#ii_category").val().trim();

    if (ii_category == "") {
        sweetAlertError("Category is required!");
        return;
    }

    if (!ii_category.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Category!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#addCategoryModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_AddCategory.php',
            type: 'POST',
            data: {
                ii_category: ii_category
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

                if (ii_accesspassword == "addcategory") {
                    $("[data-ii-categoryadd-modal-action='submit']").click();
                }

                if (ii_accesspassword == "editcategory") {
                    $("[data-ii-categoryedit-modal-action='submit']").click();
                }

                if (ii_accesspassword == "deletecategory") {
                    $("[data-ii-categorydelete-modal-action='submit']").click();
                }

            }
            if (status.status == 409) {
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

$(".datainput [data-ii-input-edit-action='edit']").click(function (e) {

    e.preventDefault();

    var CategoryID = this.getAttribute("data-ii-val");

    $.ajax({
        url: '../../app/functions/products/fn_searchCategory.php',
        type: 'POST',
        data: {
            CategoryID: CategoryID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_categoryedit").val(status.category);

            }
            if (status.status == 500) {
                alert(status.message);
            }
        }
    })

    $("#ii_categoryidedit").val(CategoryID);

    $("#editCategoryModal").modal("show");

});

$("[data-ii-categoryedit-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_categoryidedit = $("#ii_categoryidedit").val().trim();
    var ii_categoryedit = $("#ii_categoryedit").val().trim();

    if (ii_categoryedit == "") {
        sweetAlertError("Category is required!");
        return;
    }

    if (!ii_categoryedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Category!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#editCategoryModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_updateCategory.php',
            type: 'POST',
            data: {
                ii_categoryidedit: ii_categoryidedit,
                ii_categoryedit: ii_categoryedit
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
                if (status.status == 409) {
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

    }

});

$(".datainput [data-ii-input-delete-action='delete']").click(function (e) {

    e.preventDefault();

    var CategoryID = this.getAttribute("data-ii-val");

    $("#ii_categoryiddelete").val(CategoryID);

    $("#deleteCategoryModal").modal("show");

});

$("[data-ii-categorydelete-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_categoryiddelete = $("#ii_categoryiddelete").val().trim();

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#deleteCategoryModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_deleteCategory.php',
            type: 'POST',
            data: {
                ii_categoryiddelete: ii_categoryiddelete
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
                if (status.status == 409) {
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

    }

});

// Key Input Formats

$('#ii_regularprice').on('keyup', function () {

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
        $("#ii_regularprice").val("0.00");
    }

});

$("[data-add-product-details='add']").click(function (e) {

    e.preventDefault();

    // Test Codes
    // $("#pditemCount").children()[0]["children"][0]["attributes"][1]["nodeValue"];

    function stringGen() {
        var result = '';
        var input_length = parseInt(15);
        var chars = 'abcdefghijklmnopqrstuvwxyz';
        for (var i = 0; i < input_length; i++) {
            result += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return result;
    };

    var randomCode = stringGen();

    $(".ii_productdetailscontainer").append("<div class='row mb-5 g-3 pd_item' data-count='"+randomCode+"'><div class='col-xl-6'><input type='text' id='ii_pdetails1_"+randomCode+"' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Description Title'></div><div class='col-xl-6 d-flex gap-3 dataInput'><input type='text' id='ii_pdetails2_"+randomCode+"' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Details'><div class='d-flex justify-content-end align-items-center' data-input-delete='delete' data-del='"+randomCode+"'><span class='btn btn-light'>delete</span></div></div></div>");

});

$(document).on('click', ".dataInput [data-input-delete='delete']",function (e) {

    e.preventDefault();

    var datadel = this.getAttribute("data-del");

    $("[data-count='" + datadel + "']").remove();

});


