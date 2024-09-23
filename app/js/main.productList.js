"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

// Product List Default

// Default Switch Load

var execFilter = () => {

    var sort = $("#ii_sorting").val();
    var search = $("#ii_search").val().trim();
    var category = $("#ii_category").val();
    var product = $("#ii_product").val();
    var min = $("#ii_min").val().trim();
    var max = $("#ii_max").val().trim();

    setTimeout(() => {

        $("#kt_block_ui_1_button").click();

        $.ajax({
            url: '../../app/functions/list/fn_productlist.php',
            type: 'POST',
            data: {
                sort: sort,
                search: search,
                category: category,
                product: product,
                min: min,
                max: max,
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {

                    if (status.productarr == null) {
                        sweetAlertError("No product found");
                        setTimeout(() => {
                            $("#kt_block_ui_1_button").click();
                        }, 1000);
                    } else {

                        $("#productlist_container").empty();
                        $("#product_container").empty();
    
                        for (var i = 0; i < status.productarr.length; i++) {
    
                            if (status.productarr[i]["productisregular"] == 1) {
                                var sett = "Regular";
                                var divv = "<div class='d-flex gap-3'><span class='fs-6 fw-bolder text-dark'>₱ " + status.productarr[i]["productregularprice"] + "</span></div>";
                            }
                            if (status.productarr[i]["productissale"] == 1) {
                                var sett = "Sale";
                                var divv = "<div class='d-flex gap-3'><span class='fs-6 fw-bolder text-dark'>₱ " + status.productarr[i]["productsaleprice"] + "</span><span class='text-muted text-decoration-line-through'>₱ " + status.productarr[i]["productregularprice"] + "</span></div>";
                            }
                            if (status.productarr[i]["productisrepo"] == 1) {
                                var sett = "Repo";
                                var divv = "<div class='d-flex gap-3'><span class='fs-6 fw-bolder text-dark'>₱ " + status.productarr[i]["productrepoprice"] + "</span><span class='text-muted text-decoration-line-through'>₱ " + status.productarr[i]["productregularprice"] + "</span></div>";
                            }

                            if ($("#productlist_container").length == 1) {

                                $("#productlist_container").append("<a href='product.php?p=" + status.productarr[i]["productid"] + "' class='border p-5 rounded shadow-sm product-list cursor-pointer card-hover'><div class=''><img alt='Product Image' src='../../assets/media/images/product.png' width='100%' class='mh-auto mw-auto rounded' /></div><div class='mt-3'><h2>" + status.productarr[i]["productname"] + "</h2><span></span><div class=''><span class='badge bg-primary text-white'>" + sett + "</span></div></div><div class='mt-5 d-flex justify-content-between align-items-center flex-wrap gap-3'>" + divv + "</div></a>");
                                
                            }

                            if ($("#product_container").length == 1) {

                                $("#product_container").append("<a href='products-view.php?p=" + status.productarr[i]["productid"] + "' class='border p-5 rounded shadow-sm product-list cursor-pointer card-hover'><div class=''><img alt='Product Image' src='../../assets/media/images/product.png' width='100%' class='mh-auto mw-auto rounded' /></div><div class='mt-3'><h2>" + status.productarr[i]["productname"] + "</h2><span></span><div class=''><span class='badge bg-primary text-white'>" + sett + "</span></div></div><div class='mt-5 d-flex justify-content-between align-items-center flex-wrap gap-3'>" + divv + "</div></a>");
                                
                            }
    
    
                        }
    
                        setTimeout(() => {
                            $("#kt_block_ui_1_button").click();
                        }, 1000);
                    }
                }
                if (status.status == 500) {
                    sweetAlertError(status.message);
                }
            },
            error: function (response) {
                sweetAlertError("Server Error, Please contact administrator!");
            }
        })

    }, 1000);

}

execFilter();

$("#ii_sorting").change(function (e) {

    e.preventDefault();

    execFilter();

});

// Timeout

var time = 1000;
var timeout;

$("#ii_search").keyup(function (e) {

    e.preventDefault();

    clearTimeout(timeout);
    
    timeout = setTimeout(function () {
        execFilter();
    }, time);
        

});

$("#ii_category").change(function (e) {

    e.preventDefault();

    execFilter();

});

$("#ii_product").change(function (e) {

    e.preventDefault();

    execFilter();

});

$("#ii_min").keyup(function (e) {

    e.preventDefault();

    var max = $("#ii_max").val().trim();

    if (max != "") {
        clearTimeout(timeout);
        
        timeout = setTimeout(function () {
            execFilter();
        }, time);
    }


});

$("#ii_max").keyup(function (e) {

    e.preventDefault();

    var min = $("#ii_min").val().trim();

    if (min != "") {
        clearTimeout(timeout);
        
        timeout = setTimeout(function () {
            execFilter();
        }, time);
    }

});



