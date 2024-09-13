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

$("[data-ii-productadd-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var chkbxReturnable;
    var ii_productname = $("#ii_productname").val().trim();
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

    if ($("#chkbxReturnable").is(":checked")) {
        chkbxReturnable = 1;
    } else {
        chkbxReturnable = 0;
    }

    let proddetailslen = $(".pd_item").length;
    
    let errorCount = 0;

    var arrdetails = [];

    if (proddetailslen > 0) {

        
        for (var i = 0; i < proddetailslen; i++) {

            var input1 = $("#"+ $(".pd_item")[i]["children"][0]["children"][0]["attributes"][1]["nodeValue"]).val().trim();
            var input2 = $("#"+ $(".pd_item")[i]["children"][1]["children"][0]["attributes"][1]["nodeValue"]).val().trim();

            if (input1 == "" || input2 == "") {
                errorCount++;
                break;
            }

            arrdetails.push({"input1": input1, "input2": input2});
            
        }

    }

    if (errorCount > 0) {
        sweetAlertError("Please check empty fields on Product Details!");
        return;
    }

    if (ii_productname == "") {
        sweetAlertError("Product Name is required!");
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

    if (!ii_productname.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Product Name!");
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
                chkbxReturnable: chkbxReturnable,
                ii_productname: ii_productname,
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
                
                $("#ii_valProductName").text(status.productname);
                $("#ii_valSKU").text(status.productsku);
                $("#ii_valCategory").text(status.productcategory);

                var ol = status.productdescription;

                ol = ol.replace(/(?:\r\n|\r|\n)/g, "<br>");

                $("#ii_valDescription").html(ol);

                $("#ii_valStatusContainer").empty();

                for (let aa = 0; aa < status.productdetails.length; aa++) {

                    if(aa % 2 == 0) {
                        $("#ii_valStatusContainer").append("<div class='d-flex justify-content-between align-items-center bg-light p-3'><span class='fw-bolder'>"+ status.productdetails[aa]["title"] +"</span><span class=''>"+ status.productdetails[aa]["description"] +"</span></div>");
                    } else {
                        $("#ii_valStatusContainer").append("<div class='d-flex justify-content-between align-items-center p-3'><span class='fw-bolder'>"+ status.productdetails[aa]["title"] +"</span><span class=''>"+ status.productdetails[aa]["description"] +"</span></div>");
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