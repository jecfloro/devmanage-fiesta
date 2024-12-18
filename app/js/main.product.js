"use strict"

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

                if (ii_accesspassword == "addcategory") {
                    $("[data-ii-categoryadd-modal-action='submit']").click();
                }

                if (ii_accesspassword == "editcategory") {
                    $("[data-ii-categoryedit-modal-action='submit']").click();
                }

                if (ii_accesspassword == "deletecategory") {
                    $("[data-ii-categorydelete-modal-action='submit']").click();
                }

                if (ii_accesspassword == "addproduct") {
                    $("[data-ii-productadd-modal-action='submit']").click();
                }

                if (ii_accesspassword == "editproduct") {
                    $("[data-ii-productedit-modal-action='submit']").click();
                }

                if (ii_accesspassword == "deleteproduct") {
                    $("[data-delete-product-details='delete']").click();
                }

                if (ii_accesspassword == "addproperty") {
                    $("[data-ii-propertyadd-modal-action='submit']").click();
                }

                if (ii_accesspassword == "editproperty") {
                    $("[data-ii-propertyedit-modal-action='submit']").click();
                }

                if (ii_accesspassword == "deleteproperty") {
                    $("[data-ii-propertydelete-modal-action='submit']").click();
                }

                if (ii_accesspassword == "addbrand") {
                    $("[data-ii-brandadd-modal-action='submit']").click();
                }

                if (ii_accesspassword == "editbrand") {
                    $("[data-ii-brandedit-modal-action='submit']").click();
                }

                if (ii_accesspassword == "deletebrand") {
                    $("[data-ii-branddelete-modal-action='submit']").click();
                }

                if (ii_accesspassword == "addmodel") {
                    $("[data-ii-modeladd-modal-action='submit']").click();
                }

                if (ii_accesspassword == "editmodel") {
                    $("[data-ii-modeledit-modal-action='submit']").click();
                }

                if (ii_accesspassword == "deletemodel") {
                    $("[data-ii-modeldelete-modal-action='submit']").click();
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
            url: '../../app/functions/products/fn_addCategory.php',
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

$('#ii_saleprice').on('keyup', function () {

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
        $("#ii_saleprice").val("0.00");
    }

});

$('#ii_repoprice').on('keyup', function () {

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
        $("#ii_repoprice").val("0.00");
    }

});

$('#ii_regularpriceedit').on('keyup', function () {

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
        $("#ii_regularpriceedit").val("0.00");
    }

});

$('#ii_salepriceedit').on('keyup', function () {

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
        $("#ii_salepriceedit").val("0.00");
    }

});

$('#ii_repopriceedit').on('keyup', function () {

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
        $("#ii_repopriceedit").val("0.00");
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

    $(".ii_productdetailscontainer").append("<div class='row mb-5 g-3 pd_item' data-count='" + randomCode + "'><div class='col-xl-6'><input type='text' id='ii_pdetails1_" + randomCode + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Description Title'></div><div class='col-xl-6 d-flex gap-3 dataInput'><input type='text' id='ii_pdetails2_" + randomCode + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Details'><div class='d-flex justify-content-end align-items-center' data-input-delete='delete' data-del='" + randomCode + "'><span class='btn btn-light'>delete</span></div></div></div>");

});

$(document).on('click', ".dataInput [data-input-delete='delete']", function (e) {

    e.preventDefault();

    var datadel = this.getAttribute("data-del");

    $("[data-count='" + datadel + "']").remove();


});

$("#ii_productcategory").change(function (e) {

    e.preventDefault();

    var ii_productcategory = $(this).val();

    if (ii_productcategory == "") {

        $("#ii_productbrand").empty();
        $("#ii_productbrand").append($('<option></option>').attr({ 'value': '' }).text(''));

        $("#ii_productmodel").empty();
        $("#ii_productmodel").append($('<option></option>').attr({ 'value': '' }).text(''));

    } else {

        $("#ii_productmodel").empty();
        $("#ii_productmodel").append($('<option></option>').attr({ 'value': '' }).text(''));

        $.ajax({
            url: '../../app/functions/products/fn_searchDropdownBrand.php',
            type: 'POST',
            data: {
                ii_productcategory: ii_productcategory
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    $("#ii_productbrand").empty();

                    $("#ii_productbrand").append($('<option></option>').attr({ 'value': '' }).text(''));

                    for (var i = 0; i < status.brands.length; i++) {
                        $("#ii_productbrand").append($('<option></option>').attr({ 'value': status.brands[i]["PK_mscBrands"] }).text(status.brands[i]["description"]));
                    }

                }
                if (status.status == 500) {
                    alert(status.message);
                }
            }
        })

        $.ajax({
            url: '../../app/functions/products/fn_searchDropdownProperties.php',
            type: 'POST',
            data: {
                ii_productcategory: ii_productcategory
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    $(".ii_productdetailscontainer").empty();

                    for (var i = 0; i < status.properties.length; i++) {
                        $(".ii_productdetailscontainer").append("<div class='row mb-5 g-3 pd_item' data-count='" + status.properties[i]["PK_mscProperties"] + "'><div class='col-xl-6'><input type='text' id='ii_pdetails1_" + status.properties[i]["PK_mscProperties"] + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Description Title' value='" + status.properties[i]["description"] + "'></div><div class='col-xl-6 d-flex gap-3 dataInput'><input type='text' id='ii_pdetails2_" + status.properties[i]["PK_mscProperties"] + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Details' value=''><div class='d-flex justify-content-end align-items-center' data-input-delete='delete' data-del='" + status.properties[i]["PK_mscProperties"] + "'><span class='btn btn-light'>delete</span></div></div></div>");
                    }

                }
                if (status.status == 500) {
                    alert(status.message);
                }
            }
        })


    }

});

$("#ii_productbrand").change(function (e) {

    var ii_productbrand = $(this).val();

    if (ii_productbrand == "") {

        $("#ii_productmodel").empty();
        $("#ii_productmodel").append($('<option></option>').attr({ 'value': '' }).text(''));

    } else {

        $.ajax({
            url: '../../app/functions/products/fn_searchDropdownModel.php',
            type: 'POST',
            data: {
                ii_productbrand: ii_productbrand
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    $("#ii_productmodel").empty();

                    $("#ii_productmodel").append($('<option></option>').attr({ 'value': '' }).text(''));

                    for (var i = 0; i < status.models.length; i++) {
                        $("#ii_productmodel").append($('<option></option>').attr({ 'value': status.models[i]["PK_mscModels"] }).text(status.models[i]["description"]));
                    }

                }
                if (status.status == 500) {
                    alert(status.message);
                }
            }
        })

    }

});

$("#ii_productcategoryedit").change(function (e) {

    e.preventDefault();

    var ii_productcategoryedit = $(this).val();

    if (ii_productcategoryedit == "") {

        $("#ii_productbrandedit").empty();
        $("#ii_productbrandedit").append($('<option></option>').attr({ 'value': '' }).text(''));

        $("#ii_productmodeledit").empty();
        $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': '' }).text(''));

    } else {

        Swal.fire({
            text: 'Changing product category will update product details fields',
            icon: "warning",
            buttonsStyling: false,
            confirmButtonText: "Okay",
            customClass: {
                confirmButton: "btn btn-darkgreen"
            },
            timer: 2000,
            timerProgressBar: true,
        }).then((result) => {
            if (result.isConfirmed) {

                $("#ii_productmodeledit").empty();
                $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': '' }).text(''));

                $.ajax({
                    url: '../../app/functions/products/fn_searchDropdownBrandEdit2.php',
                    type: 'POST',
                    data: {
                        ii_productcategoryedit: ii_productcategoryedit
                    },
                    cache: false,
                    success: function (response) {
                        var status = JSON.parse(response);
                        if (status.status == 200) {

                            $("#ii_productbrandedit").empty();

                            $("#ii_productbrandedit").append($('<option></option>').attr({ 'value': '' }).text(''));

                            for (var i = 0; i < status.brands.length; i++) {
                                $("#ii_productbrandedit").append($('<option></option>').attr({ 'value': status.brands[i]["PK_mscBrands"] }).text(status.brands[i]["description"]));
                            }

                        }
                        if (status.status == 500) {
                            alert(status.message);
                        }
                    }
                })

                $.ajax({
                    url: '../../app/functions/products/fn_searchDropdownPropertiesEdit2.php',
                    type: 'POST',
                    data: {
                        ii_productcategoryedit: ii_productcategoryedit
                    },
                    cache: false,
                    success: function (response) {
                        var status = JSON.parse(response);
                        if (status.status == 200) {

                            $(".ii_productdetailscontaineredit").empty();

                            for (var i = 0; i < status.properties.length; i++) {
                                $(".ii_productdetailscontaineredit").append("<div class='row mb-5 g-3 pd_itemedit' data-count='" + status.properties[i]["PK_mscProperties"] + "'><div class='col-xl-6'><input type='text' id='ii_pdetails1_" + status.properties[i]["PK_mscProperties"] + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Description Title' value='" + status.properties[i]["description"] + "'></div><div class='col-xl-6 d-flex gap-3 dataInput'><input type='text' id='ii_pdetails2_" + status.properties[i]["PK_mscProperties"] + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Details' value=''><div class='d-flex justify-content-end align-items-center' data-input-delete='delete' data-del='" + status.properties[i]["PK_mscProperties"] + "'><span class='btn btn-light'>delete</span></div></div></div>");
                            }

                        }
                        if (status.status == 500) {
                            alert(status.message);
                        }
                    }
                })

            }
        });


    }

});

$("#ii_productbrandedit").change(function (e) {

    var ii_productbrandedit = $(this).val();

    if (ii_productbrandedit == "") {

        $("#ii_productmodeledit").empty();
        $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': '' }).text(''));

    } else {

        $.ajax({
            url: '../../app/functions/products/fn_searchDropdownModelEdit2.php',
            type: 'POST',
            data: {
                ii_productbrandedit: ii_productbrandedit
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    $("#ii_productmodeledit").empty();

                    $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': '' }).text(''));

                    for (var i = 0; i < status.models.length; i++) {
                        $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': status.models[i]["PK_mscModels"] }).text(status.models[i]["description"]));
                    }

                }
                if (status.status == 500) {
                    alert(status.message);
                }
            }
        })

    }

});

$("[data-ii-productadd-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_productbrand = $("#ii_productbrand").val().trim();
    var ii_productmodel = $("#ii_productmodel").val().trim();
    var ii_productsku = $("#ii_productsku").val().trim();
    var ii_productcategory = $("#ii_productcategory").val();
    var ii_productdescription = $("#ii_productdescription").val().trim();
    var ii_totalquantity = $("#ii_totalquantity").val().trim();
    var ii_minstock = $("#ii_minstock").val().trim();
    var ii_maxstock = $("#ii_maxstock").val().trim();
    var ii_regularprice = $("#ii_regularprice").val().trim();
    var ii_saleprice = $("#ii_saleprice").val().trim();
    var ii_repoprice = $("#ii_repoprice").val().trim();
    var ii_productsetting = $("#ii_productsetting").val();
    var ii_productstatus = $("#ii_productstatus").val();

    let proddetailslen = $(".pd_item").length;

    let errorCount = 0;

    var arrdetails = [];

    if (proddetailslen > 0) {


        for (var i = 0; i < proddetailslen; i++) {

            var input1 = $("#" + $(".pd_item")[i]["children"][0]["children"][0]["attributes"][1]["nodeValue"]).val().trim();
            var input2 = $("#" + $(".pd_item")[i]["children"][1]["children"][0]["attributes"][1]["nodeValue"]).val().trim();

            if (input1 == "" || input2 == "") {
                errorCount++;
                break;
            }

            arrdetails.push({ "input1": input1, "input2": input2 });

        }

    }

    if (errorCount > 0) {
        sweetAlertError("Please check empty fields on Product Details!");
        return;
    }

    if (ii_productbrand == "") {
        sweetAlertError("Product Brand is required!");
        return;
    }

    if (ii_productmodel == "") {
        sweetAlertError("Product Model is required!");
        return;
    }

    if (ii_productsku == "") {
        sweetAlertError("Product SKU is required!");
        return;
    }

    if (ii_productcategory == "") {
        sweetAlertError("Product Category is required!");
        return;
    }

    if (ii_productsetting == "") {
        sweetAlertError("Product Setting is required!");
        return;
    }

    if (ii_productstatus == "") {
        sweetAlertError("Product Status is required!");
        return;
    }

    if (ii_productdescription == "") {
        sweetAlertError("Product Description is required!");
        return;
    }

    if (ii_regularprice == "0.00" || ii_regularprice == "") {
        sweetAlertError("Regular Price is required!");
        return;
    }


    if (!ii_productbrand.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Brand!");
        return;
    }

    if (!ii_productmodel.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Model!");
        return;
    }

    if (!ii_productsku.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product SKU!");
        return;
    }

    if (!ii_productdescription.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Description!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#addProductModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_addProduct.php',
            type: 'POST',
            data: {
                ii_productbrand: ii_productbrand,
                ii_productmodel: ii_productmodel,
                ii_productsku: ii_productsku,
                ii_productcategory: ii_productcategory,
                ii_productdescription: ii_productdescription,
                ii_totalquantity: ii_totalquantity,
                ii_minstock: ii_minstock,
                ii_maxstock: ii_maxstock,
                ii_regularprice: ii_regularprice,
                ii_saleprice: ii_saleprice,
                ii_repoprice: ii_repoprice,
                arrdetails: arrdetails,
                ii_productsetting: ii_productsetting,
                ii_productstatus: ii_productstatus
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

$(".datainput [data-ii-input-action='view']").click(function (e) {

    e.preventDefault();

    var ProductID = this.getAttribute("data-ii-val");

    $.ajax({
        url: '../../app/functions/products/fn_searchProduct.php',
        type: 'POST',
        data: {
            ProductID: ProductID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_productidedit").val(ProductID);
                $("#ii_valProductName").text(status.productname);
                $("#ii_valSKU").text(status.productsku);
                $("#ii_valCategory").text(status.productcategory);

                var ol = status.productdescription;

                ol = ol.replace(/(?:\r\n|\r|\n)/g, "<br>");

                $("#ii_valDescription").html(ol);

                $("#ii_valStatusContainer").empty();

                for (let aa = 0; aa < status.productdetails.length; aa++) {

                    if (aa % 2 == 0) {
                        $("#ii_valStatusContainer").append("<div class='d-flex justify-content-between align-items-center details-light p-3'><span class='fw-bolder'>" + status.productdetails[aa]["title"] + "</span><span class=''>" + status.productdetails[aa]["description"] + "</span></div>");
                    } else {
                        $("#ii_valStatusContainer").append("<div class='d-flex justify-content-between align-items-center p-3'><span class='fw-bolder'>" + status.productdetails[aa]["title"] + "</span><span class=''>" + status.productdetails[aa]["description"] + "</span></div>");
                    }


                }

                $("#ii_valStock").text(status.productquantity);
                $("#ii_valMinStock").text(status.productstockminimum);
                $("#ii_valMaxStock").text(status.productstockmaximum);

                $("#ii_valCategoryStatus").text(status.productcategory);

                if (status.productisregular == 1) {
                    $("#ii_valSettingStatus").text("Regular");
                }

                if (status.productisrepo == 1) {
                    $("#ii_valSettingStatus").text("Repo");
                }

                if (status.productissale == 1) {
                    $("#ii_valSettingStatus").text("Sale");
                }

                $("#ii_valStatus").text(status.productstatus);

                $("#ii_valRegularPrice").text(status.productregularprice);
                $("#ii_valRepoPrice").text(status.productrepoprice);
                $("#ii_valSalePrice").text(status.productsaleprice);

            }
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

    $("#kt_drawer_trigger").click();

});

$("[data-edit-product-details='edit']").click(function (e) {

    e.preventDefault();

    $("#kt_drawer_trigger").click();

    var ProductID = $("#ii_productidedit").val().trim();

    $.ajax({
        url: '../../app/functions/products/fn_searchProduct.php',
        type: 'POST',
        data: {
            ProductID: ProductID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_productnameedit").val(status.productname);
                $("#ii_productunitedit").val(status.productunit);

                var dropdowncategoryid = status.productcid;
                var dropdownbrandid = status.productbrandid;
                var dropdownmodelid = status.productmodelid;

                $.ajax({
                    url: '../../app/functions/products/fn_searchDropdownCategoryEdit.php',
                    type: 'POST',
                    cache: false,
                    success: function (response) {
                        var status = JSON.parse(response);
                        if (status.status == 200) {

                            $("#ii_productcategoryedit").empty();
                            $("#ii_productcategoryedit").append($('<option></option>').attr({ 'value': '' }).text(''));

                            for (var i = 0; i < status.categories.length; i++) {

                                if (status.categories[i]["PK_mscCategories"] == dropdowncategoryid) {
                                    $("#ii_productcategoryedit").append($('<option></option>').attr({ 'value': status.categories[i]["PK_mscCategories"], 'selected': 'selected' }).text(status.categories[i]["description"]));
                                } else {
                                    $("#ii_productcategoryedit").append($('<option></option>').attr({ 'value': status.categories[i]["PK_mscCategories"] }).text(status.categories[i]["description"]));
                                }

                            }

                        }
                        if (status.status == 500) {
                            alert(status.message);
                        }
                    }
                })

                $.ajax({
                    url: '../../app/functions/products/fn_searchDropdownBrandEdit.php',
                    type: 'POST',
                    data: {
                        dropdowncategoryid: dropdowncategoryid
                    },
                    cache: false,
                    success: function (response) {
                        var status = JSON.parse(response);
                        if (status.status == 200) {

                            $("#ii_productbrandedit").empty();

                            $("#ii_productbrandedit").append($('<option></option>').attr({ 'value': '' }).text(''));

                            for (var i = 0; i < status.brands.length; i++) {

                                if (status.brands[i]["PK_mscBrands"] == dropdownbrandid) {
                                    $("#ii_productbrandedit").append($('<option></option>').attr({ 'value': status.brands[i]["PK_mscBrands"], 'selected': 'selected' }).text(status.brands[i]["description"]));
                                } else {
                                    $("#ii_productbrandedit").append($('<option></option>').attr({ 'value': status.brands[i]["PK_mscBrands"] }).text(status.brands[i]["description"]));
                                }

                            }

                        }
                        if (status.status == 500) {
                            alert(status.message);
                        }
                    }
                })

                $.ajax({
                    url: '../../app/functions/products/fn_searchDropdownModelEdit.php',
                    type: 'POST',
                    data: {
                        dropdownbrandid: dropdownbrandid
                    },
                    cache: false,
                    success: function (response) {
                        var status = JSON.parse(response);
                        if (status.status == 200) {

                            $("#ii_productmodeledit").empty();

                            $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': '' }).text(''));

                            for (var i = 0; i < status.models.length; i++) {

                                if (status.models[i]["PK_mscModels"] == dropdownmodelid) {
                                    $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': status.models[i]["PK_mscModels"], 'selected': 'selected' }).text(status.models[i]["description"]));
                                } else {
                                    $("#ii_productmodeledit").append($('<option></option>').attr({ 'value': status.models[i]["PK_mscModels"] }).text(status.models[i]["description"]));
                                }

                            }

                        }
                        if (status.status == 500) {
                            alert(status.message);
                        }
                    }
                })

                $("#ii_productskuedit").val(status.productsku);
                $("#ii_productdescriptionedit").val(status.productdescription);
                $("#ii_totalquantityedit").val(status.productquantity);
                $("#ii_minstockedit").val(status.productstockminimum);
                $("#ii_maxstockedit").val(status.productstockmaximum);
                $("#ii_regularpriceedit").val(status.productregularprice);
                $("#ii_salepriceedit").val(status.productsaleprice);
                $("#ii_repopriceedit").val(status.productrepoprice);

                if (status.productisregular == 1) {
                    $("#select2-ii_productsettingedit-container").text("Regular");
                    $("#ii_productsettingedit").val("Regular");
                }

                if (status.productisrepo == 1) {
                    $("#select2-ii_productsettingedit-container").text("Sale");
                    $("#ii_productsettingedit").val("Sale");
                }

                if (status.productissale == 1) {
                    $("#select2-ii_productsettingedit-container").text("Repo");
                    $("#ii_productsettingedit").val("Repo");
                }

                if (status.productstatus == "Active") {
                    $("#select2-ii_productstatusedit-container").text("Active");
                    $("#ii_productstatusedit").val(status.productstatus);
                }

                if (status.productstatus == "Inactive") {
                    $("#select2-ii_productstatusedit-container").text("Inactive");
                    $("#ii_productstatusedit").val(status.productstatus);
                }

                if (status.productstatus == "Draft") {
                    $("#select2-ii_productstatusedit-container").text("Draft");
                    $("#ii_productstatusedit").val(status.productstatus);
                }

                $(".ii_productdetailscontaineredit").empty();

                for (let aa = 0; aa < status.productdetails.length; aa++) {

                    $("#ii_valStatusContainer").append("<div class='d-flex justify-content-between align-items-center details-light p-3'><span class='fw-bolder'>" + status.productdetails[aa]["title"] + "</span><span class=''>" + status.productdetails[aa]["description"] + "</span></div>");

                    $(".ii_productdetailscontaineredit").append("<div class='row mb-5 g-3 pd_itemedit' data-count='" + status.productdetails[aa]["details"] + "'><div class='col-xl-6'><input type='text' id='ii_pdetails1_" + status.productdetails[aa]["details"] + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Description Title' value='" + status.productdetails[aa]["title"] + "'></div><div class='col-xl-6 d-flex gap-3 dataInput'><input type='text' id='ii_pdetails2_" + status.productdetails[aa]["details"] + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Details' value='" + status.productdetails[aa]["description"] + "'><div class='d-flex justify-content-end align-items-center' data-input-delete='delete' data-del='" + status.productdetails[aa]["details"] + "'><span class='btn btn-light'>delete</span></div></div></div>");

                }

                for (let bb = 0; bb < status.productimages.length; bb++) {

                    $("#uploadContainer").append("<div class='col-xl-2 d-flex flex-column m-3 gap-2' style='max-width: 200px;'><img src='../../uploads_images/" + status.productimages[bb]["fileCode"] + "' alt='' id='image" + status.productimages[bb]["imagesid"] + "' width='100%' class='border rounded'><button class='btn btn-danger btn-sm' data-ii-input-action='delete' data-id=" + status.productimages[bb]["imagesid"] + ">Remove</button></div>")

                }

            }
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

    $("#editProductModal").modal("show");

});

$("[data-addedit-product-details='add']").click(function (e) {

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

    $(".ii_productdetailscontaineredit").append("<div class='row mb-5 g-3 pd_itemedit' data-count='" + randomCode + "'><div class='col-xl-6'><input type='text' id='ii_pdetails1_" + randomCode + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Description Title'></div><div class='col-xl-6 d-flex gap-3 dataInput'><input type='text' id='ii_pdetails2_" + randomCode + "' class='form-control form-control-lg form-control-solid fw-bolder' placeholder='Details'><div class='d-flex justify-content-end align-items-center' data-input-delete='delete' data-del='" + randomCode + "'><span class='btn btn-light'>delete</span></div></div></div>");

});

$("[data-ii-productedit-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var chkbxReturnable;
    var ii_productidedit = $("#ii_productidedit").val().trim();
    var ii_productcategoryedit = $("#ii_productcategoryedit").val().trim();
    var ii_productbrandedit = $("#ii_productbrandedit").val().trim();
    var ii_productmodeledit = $("#ii_productmodeledit").val().trim();
    var ii_productskuedit = $("#ii_productskuedit").val();
    var ii_productdescriptionedit = $("#ii_productdescriptionedit").val().trim();
    var ii_totalquantityedit = $("#ii_totalquantityedit").val().trim();
    var ii_minstockedit = $("#ii_minstockedit").val().trim();
    var ii_maxstockedit = $("#ii_maxstockedit").val().trim();
    var ii_regularpriceedit = $("#ii_regularpriceedit").val().trim();
    var ii_salepriceedit = $("#ii_salepriceedit").val().trim();
    var ii_repopriceedit = $("#ii_repopriceedit").val().trim();
    var ii_productsettingedit = $("#ii_productsettingedit").val();
    var ii_productstatusedit = $("#ii_productstatusedit").val();

    var attachments = document.getElementById("upldFile").files;

    var formData = new FormData();

    for (var i = 0; i < attachments.length; i++) {
        formData.append("files[]", attachments[i]);
    }

    if ($("#chkbxReturnableedit").is(":checked")) {
        chkbxReturnable = 1;
    } else {
        chkbxReturnable = 0;
    }

    let proddetailslen = $(".pd_itemedit").length;

    let errorCount = 0;

    var arrdetails = [];

    if (proddetailslen > 0) {


        for (var i = 0; i < proddetailslen; i++) {

            var input1 = $("#" + $(".pd_itemedit")[i]["children"][0]["children"][0]["attributes"][1]["nodeValue"]).val().trim();
            var input2 = $("#" + $(".pd_itemedit")[i]["children"][1]["children"][0]["attributes"][1]["nodeValue"]).val().trim();

            if (input1 == "" || input2 == "") {
                errorCount++;
                break;
            }

            arrdetails.push({ "input1": input1, "input2": input2 });

        }

    }

    if (arrdetails.length == 0) {

        arrdetails = "null";

    }

    if (errorCount > 0) {
        sweetAlertError("Please check empty fields on Product Details!");
        return;
    }

    if (ii_productbrandedit == "") {
        sweetAlertError("Product Brand is required!");
        return;
    }

    if (ii_productmodeledit == "") {
        sweetAlertError("Product Model is required!");
        return;
    }

    if (ii_productskuedit == "") {
        sweetAlertError("Product SKU is required!");
        return;
    }

    if (ii_productcategoryedit == "") {
        sweetAlertError("Product Category is required!");
        return;
    }

    if (ii_productsettingedit == "") {
        sweetAlertError("Product Setting is required!");
        return;
    }

    if (ii_productstatusedit == "") {
        sweetAlertError("Product Status is required!");
        return;
    }

    if (ii_productdescriptionedit == "") {
        sweetAlertError("Product Description is required!");
        return;
    }

    if (ii_regularpriceedit == "0.00" || ii_regularpriceedit == "") {
        sweetAlertError("Regular Price is required!");
        return;
    }

    if (!ii_productbrandedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Brand!");
        return;
    }

    if (!ii_productmodeledit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Model!");
        return;
    }

    if (!ii_productskuedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product SKU!");
        return;
    }

    if (!ii_productdescriptionedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Description!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#editProductModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_editProduct.php',
            type: 'POST',
            data: {
                chkbxReturnable: chkbxReturnable,
                ii_productidedit: ii_productidedit,
                ii_productcategoryedit: ii_productcategoryedit,
                ii_productbrandedit: ii_productbrandedit,
                ii_productmodeledit: ii_productmodeledit,
                ii_productskuedit: ii_productskuedit,
                ii_productdescriptionedit: ii_productdescriptionedit,
                ii_totalquantityedit: ii_totalquantityedit,
                ii_minstockedit: ii_minstockedit,
                ii_maxstockedit: ii_maxstockedit,
                ii_regularpriceedit: ii_regularpriceedit,
                ii_salepriceedit: ii_salepriceedit,
                ii_repopriceedit: ii_repopriceedit,
                ii_productsettingedit: ii_productsettingedit,
                ii_productstatusedit: ii_productstatusedit,
                arrdetails: arrdetails
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    if (attachments.length > 0) {

                        $.ajax({
                            url: '../../app/functions/products/fn_uplfiles.php',
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

                    } else {

                        $("#modal_access").modal("hide");
                        sweetAlertSuccess(status.message);
                        setTimeout(() => {
                            location.reload();
                        }, 1000);

                    }

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

$("[data-delete-product-details='delete']").click(function (e) {

    e.preventDefault();

    var ProductID = $("#ii_productidedit").val().trim();

    var setting = this.getAttribute("data-passaccess");

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_deleteProduct.php',
            type: 'POST',
            data: {
                ProductID: ProductID
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    $("#kt_drawer_trigger").click();
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

$("#btnUpload").click(function () {

    $("#upldFile").click();

});

$("#upldFile").change(function (e) {

    e.preventDefault();

    var attachments = document.getElementById("upldFile").files;

    $("#uploadTempContainer").empty();

    $("#uploadTempContainer").removeClass("d-none");

    for (var i = 0; i < attachments.length; i++) {

        if (attachments[i].type == "image/jpeg" || attachments[i].type == "image/png" || attachments[i].type == "image/jpg") {

            var reader = new FileReader();

            reader.onload = event => {

                $("#uploadTempContainer").append("<div class='col-xl-2 d-flex flex-column m-3 gap-2' style='max-width: 200px;'><img src='" + event.target.result + "' alt='' id='image" + [i] + "' width='100%' class='border rounded'><button class='btn btn-danger btn-sm' data-ii-input-action='remove' data-id=" + i + ">Remove</button></div>");

            }
            reader.readAsDataURL(attachments[i]);
        }

    }

});

$("#uploadTempContainer").on('click', "[data-ii-input-action='remove']", function () {

    let dataid = parseInt(this.getAttribute('data-id'));

    $(this).parent().remove();

    removeFile(dataid);

    var attachments = document.getElementById("upldFile").files;

    var list = $("[data-ii-input-action='remove']");

    for (var i = 0; i < list.length; i++) {

        $(list[i]).attr("data-id", i);

    }

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

$("#uploadContainer").on('click', "[data-ii-input-action='delete']", function () {

    let dataid = parseInt(this.getAttribute('data-id'));

    $.ajax({
        url: '../../app/functions/products/fn_deleteImage.php',
        type: 'POST',
        data: {
            dataid: dataid
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

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

    $(this).parent().remove();

});

$("[data-ii-propertyadd-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_property = $("#ii_property").val().trim();

    if (ii_property == "") {
        sweetAlertError("Property Name is required!");
        return;
    }

    if (!ii_property.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Property Name!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#addPropertyModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_addProperty.php',
            type: 'POST',
            data: {
                ii_property: ii_property
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

$(".datainput [data-ii-input-editproperty-action='edit']").click(function (e) {

    e.preventDefault();

    var PropertyID = this.getAttribute("data-ii-val");

    $.ajax({
        url: '../../app/functions/products/fn_searchProperty.php',
        type: 'POST',
        data: {
            PropertyID: PropertyID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_propertyidedit").val(PropertyID);
                $("#ii_propertyedit").val(status.category);

            }
            if (status.status == 500) {
                alert(status.message);
            }
        }
    })

    $("#editPropertyModal").modal("show");

});

$("[data-ii-propertyedit-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_propertyidedit = $("#ii_propertyidedit").val().trim();
    var ii_propertyedit = $("#ii_propertyedit").val().trim();

    if (ii_propertyedit == "") {
        sweetAlertError("Property Name is required!");
        return;
    }

    if (!ii_propertyedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Property Name!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#editPropertyModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_updateProperty.php',
            type: 'POST',
            data: {
                ii_propertyidedit: ii_propertyidedit,
                ii_propertyedit: ii_propertyedit
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

$(".datainput [data-ii-input-deleteproperty-action='delete']").click(function (e) {

    e.preventDefault();

    var PropertyID = this.getAttribute("data-ii-val");

    $("#ii_propertyiddelete").val(PropertyID);

    $("#deletePropertyModal").modal("show");

});

$("[data-ii-propertydelete-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_propertyiddelete = $("#ii_propertyiddelete").val().trim();

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#deletePropertyModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_deleteProperty.php',
            type: 'POST',
            data: {
                ii_propertyiddelete: ii_propertyiddelete
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

$("[data-ii-brandadd-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_brand = $("#ii_brand").val().trim();
    var ii_productcategory = $("#ii_productcategory").val().trim();

    if (ii_brand == "") {
        sweetAlertError("Brand Name is required!");
        return;
    }

    if (!ii_brand.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Brand Name!");
        return;
    }

    if (ii_productcategory == "") {
        sweetAlertError("Category is required!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#addBrandModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_addBrand.php',
            type: 'POST',
            data: {
                ii_brand: ii_brand,
                ii_productcategory: ii_productcategory
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

$(".datainput [data-ii-input-editbrand-action='edit']").click(function (e) {

    e.preventDefault();

    var BrandID = this.getAttribute("data-ii-val");

    $.ajax({
        url: '../../app/functions/products/fn_searchBrand.php',
        type: 'POST',
        data: {
            BrandID: BrandID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_brandidedit").val(BrandID);
                $("#ii_brandedit").val(status.brand);
                $("#ii_productcategoryedit").val(status.category);
                $("#select2-ii_productcategoryedit-container").text(status.categoryname);

            }
            if (status.status == 500) {
                alert(status.message);
            }
        }
    })

    $("#editBrandModal").modal("show");

});

$("[data-ii-brandedit-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_brandidedit = $("#ii_brandidedit").val().trim();
    var ii_brandedit = $("#ii_brandedit").val().trim();
    var ii_productcategoryedit = $("#ii_productcategoryedit").val().trim();

    if (ii_brandedit == "") {
        sweetAlertError("Brand Name is required!");
        return;
    }

    if (!ii_brandedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Brand Name!");
        return;
    }

    if (ii_productcategoryedit == "") {
        sweetAlertError("Category is required!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#editBrandModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_updateBrand.php',
            type: 'POST',
            data: {
                ii_brandidedit: ii_brandidedit,
                ii_brandedit: ii_brandedit,
                ii_productcategoryedit: ii_productcategoryedit
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

$(".datainput [data-ii-input-deletebrand-action='delete']").click(function (e) {

    e.preventDefault();

    var BrandID = this.getAttribute("data-ii-val");

    $("#ii_brandiddelete").val(BrandID);

    $("#deleteBrandModal").modal("show");

});

$("[data-ii-branddelete-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_brandiddelete = $("#ii_brandiddelete").val().trim();

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#deleteBrandModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_deleteBrand.php',
            type: 'POST',
            data: {
                ii_brandiddelete: ii_brandiddelete
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

$("[data-ii-modeladd-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_model = $("#ii_model").val().trim();

    if (ii_model == "") {
        sweetAlertError("Model Name is required!");
        return;
    }

    if (!ii_model.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Model Name!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#addModelModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_addModel.php',
            type: 'POST',
            data: {
                ii_model: ii_model
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

$(".datainput [data-ii-input-editmodel-action='edit']").click(function (e) {

    e.preventDefault();

    var ModelID = this.getAttribute("data-ii-val");

    $.ajax({
        url: '../../app/functions/products/fn_searchModel.php',
        type: 'POST',
        data: {
            ModelID: ModelID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_modelidedit").val(ModelID);
                $("#ii_modeledit").val(status.model);

            }
            if (status.status == 500) {
                alert(status.message);
            }
        }
    })

    $("#editModelModal").modal("show");

});

$("[data-ii-modeledit-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_modelidedit = $("#ii_modelidedit").val().trim();
    var ii_modeledit = $("#ii_modeledit").val().trim();

    if (ii_modeledit == "") {
        sweetAlertError("Model Name is required!");
        return;
    }

    if (!ii_modeledit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Model Name!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#editModelModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_updateModel.php',
            type: 'POST',
            data: {
                ii_modelidedit: ii_modelidedit,
                ii_modeledit: ii_modeledit
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

$(".datainput [data-ii-input-deletemodel-action='delete']").click(function (e) {

    e.preventDefault();

    var ModelID = this.getAttribute("data-ii-val");

    $("#ii_modeliddelete").val(ModelID);

    $("#deleteModelModal").modal("show");

});

$("[data-ii-modeldelete-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_modeliddelete = $("#ii_modeliddelete").val().trim();

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#ii_accesspassword").val(setting);
        $("#deleteModelModal").modal("hide");
        $("#modal_access").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/products/fn_deleteModel.php',
            type: 'POST',
            data: {
                ii_modeliddelete: ii_modeliddelete
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