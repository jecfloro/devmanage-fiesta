"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat, phoneInputMask } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

var my_handlers = {
    // fill province
    fill_provinces: function () {
        //selected region
        var region_code = $('option:selected', this).attr('region-code');

        // set selected text to input
        var region_text = $(this).find("option:selected").text();
        let region_input = $('#region-text');
        region_input.val(region_text);
        //clear province & city & barangay input
        $('#province-text').val('');
        $('#city-text').val('');
        $('#barangay-text').val('');

        //province
        let dropdown = $('#ii_province');
        dropdown.empty();
        dropdown.append('<option selected="true" disabled>Choose State/Province</option>');
        dropdown.prop('selectedIndex', 0);

        //city
        let city = $('#ii_city');
        city.empty();
        city.append('<option selected="true" disabled></option>');
        city.prop('selectedIndex', 0);

        //barangay
        let barangay = $('#ii_barangay');
        barangay.empty();
        barangay.append('<option selected="true" disabled></option>');
        barangay.prop('selectedIndex', 0);
        // filter & fill
        var url = '../../assets/js/json/province.json';
        $.getJSON(url, function (data) {
            var result = data.filter(function (value) {
                return value.region_code == region_code;
            });

            result.sort(function (a, b) {
                return a.province_name.localeCompare(b.province_name);
            });

            $.each(result, function (key, entry) {
                dropdown.append($('<option></option>').attr({ 'value': entry.province_name, 'province-code': entry.province_code }).text(entry.province_name));
            })

        });
    },
    // fill city
    fill_cities: function () {
        //selected province
        var province_code = $('option:selected', this).attr('province-code');

        // set selected text to input
        var province_text = $(this).find("option:selected").text();
        let province_input = $('#province-text');
        province_input.val(province_text);
        //clear city & barangay input
        $('#city-text').val('');
        $('#barangay-text').val('');

        //city
        let dropdown = $('#ii_city');
        dropdown.empty();
        dropdown.append('<option selected="true" disabled>Choose city/municipality</option>');
        dropdown.prop('selectedIndex', 0);

        //barangay
        let barangay = $('#ii_barangay');
        barangay.empty();
        barangay.append('<option selected="true" disabled></option>');
        barangay.prop('selectedIndex', 0);

        // filter & fill
        var url = '../../assets/js/json/city.json';
        $.getJSON(url, function (data) {
            var result = data.filter(function (value) {
                return value.province_code == province_code;
            });

            result.sort(function (a, b) {
                return a.city_name.localeCompare(b.city_name);
            });

            $.each(result, function (key, entry) {
                dropdown.append($('<option></option>').attr({ 'value': entry.city_name, 'city-code': entry.city_code }).text(entry.city_name));
            })

        });
    },
    // fill barangay
    fill_barangays: function () {
        // selected barangay
        var city_code = $('option:selected', this).attr('city-code');

        // set selected text to input
        var city_text = $(this).find("option:selected").text();
        let city_input = $('#city-text');
        city_input.val(city_text);
        //clear barangay input
        $('#barangay-text').val('');

        // barangay
        let dropdown = $('#ii_barangay');
        dropdown.empty();
        dropdown.append('<option selected="true" disabled>Choose barangay</option>');
        dropdown.prop('selectedIndex', 0);

        // filter & Fill
        var url = '../../assets/js/json/barangay.json';
        $.getJSON(url, function (data) {
            var result = data.filter(function (value) {
                return value.city_code == city_code;
            });

            result.sort(function (a, b) {
                return a.brgy_name.localeCompare(b.brgy_name);
            });

            $.each(result, function (key, entry) {
                dropdown.append($('<option></option>').attr({ 'value': entry.brgy_name, 'brgy-code': entry.brgy_code }).text(entry.brgy_name));
            })

        });
    },

    onchange_barangay: function () {
        // set selected text to input
        var barangay_text = $(this).find("option:selected").text();
        let barangay_input = $('#barangay-text');
        barangay_input.val(barangay_text);
    },

};

$(function () {
    // events
    $('#ii_region').on('change', my_handlers.fill_provinces);
    $('#ii_province').on('change', my_handlers.fill_cities);
    $('#ii_city').on('change', my_handlers.fill_barangays);
    $('#ii_barangay').on('change', my_handlers.onchange_barangay);

    // Region
    let dropdown_region = $('#ii_region');
    dropdown_region.empty();
    dropdown_region.append('<option selected="true">Choose Region</option>');
    dropdown_region.prop('selectedIndex', 0);
    const url_region = '../../assets/js/json/region.json';
    //province
    let dropdown_province = $('#ii_province');
    dropdown_province.empty();
    dropdown_province.append('<option selected="true">Choose State/Province</option>');
    dropdown_province.prop('selectedIndex', 0);
    const url_province = '../../assets/js/json/province.json';
    //city
    let dropdown_city = $('#ii_city');
    dropdown_city.empty();
    dropdown_city.append('<option selected="true">Choose city/municipality</option>');
    dropdown_city.prop('selectedIndex', 0);
    const url_city = '../../assets/js/json/city.json';
    // barangay
    let dropdown_barangay = $('#ii_barangay');
    dropdown_barangay.empty();
    dropdown_barangay.append('<option selected="true">Choose barangay</option>');
    dropdown_barangay.prop('selectedIndex', 0);
    const url_barangay = '../../assets/js/json/barangay.json';

    $.ajax({
        url: '../../app/functions/user-management/fn_retrieveDetails.php',
        type: 'POST',
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                if (status.user[0]["userRegionCode"] == null) {
                    $.getJSON(url_region, function (data) {
                        $.each(data, function (key, entry) {
                            dropdown_region.append($('<option></option>').attr({ 'value': entry.region_name, 'region-code': entry.region_code }).text(entry.region_name));
                        })
                    });
                } else {

                    $.getJSON(url_region, function (data) {
                        $.each(data, function (key, entry) {
                            if (entry.region_code == status.user[0]["userRegionCode"]) {
                                dropdown_region.append($('<option></option>').attr({ 'value': entry.region_name, 'region-code': entry.region_code, 'selected': 'selected' }).text(entry.region_name));
                            } else {
                                dropdown_region.append($('<option></option>').attr({ 'value': entry.region_name, 'region-code': entry.region_code }).text(entry.region_name));
                            }
                        })
                    });
                }

                if (status.user[0]["userProvinceCode"] == null) {
                    $.getJSON(url_province, function (data) {
                        var result = data.filter(function (value) {
                            return value.region_code == status.user[0]["userRegionCode"];
                        });

                        result.sort(function (a, b) {
                            return a.province_name.localeCompare(b.province_name);
                        });

                        $.each(result, function (key, entry) {
                            dropdown_province.append($('<option></option>').attr({ 'value': entry.province_name, 'province-code': entry.province_code }).text(entry.province_name));
                        })

                    });
                } else {
                    $.getJSON(url_province, function (data) {
                        var result = data.filter(function (value) {
                            return value.region_code == status.user[0]["userRegionCode"];
                        });

                        result.sort(function (a, b) {
                            return a.province_name.localeCompare(b.province_name);
                        });

                        $.each(result, function (key, entry) {
                            if (entry.province_code == status.user[0]["userProvinceCode"]) {
                                dropdown_province.append($('<option></option>').attr({ 'value': entry.province_name, 'province-code': entry.province_code, 'selected': 'selected' }).text(entry.province_name));
                            } else {
                                dropdown_province.append($('<option></option>').attr({ 'value': entry.province_name, 'province-code': entry.province_code }).text(entry.province_name));
                            }
                        })

                    });
                }

                if (status.user[0]["userCityCode"] == null) {
                    $.getJSON(url_city, function (data) {
                        var result = data.filter(function (value) {
                            return value.province_code == status.user[0]["userProvinceCode"];
                        });

                        result.sort(function (a, b) {
                            return a.city_name.localeCompare(b.city_name);
                        });

                        $.each(result, function (key, entry) {
                            dropdown_city.append($('<option></option>').attr({ 'value': entry.city_name, 'city-code': entry.city_code }).text(entry.city_name));
                        })

                    });
                } else {
                    $.getJSON(url_city, function (data) {
                        var result = data.filter(function (value) {
                            return value.province_code == status.user[0]["userProvinceCode"];
                        });

                        result.sort(function (a, b) {
                            return a.city_name.localeCompare(b.city_name);
                        });

                        $.each(result, function (key, entry) {
                            if (entry.city_code == status.user[0]["userCityCode"]) {
                                dropdown_city.append($('<option></option>').attr({ 'value': entry.city_name, 'city-code': entry.city_code, 'selected': 'selected' }).text(entry.city_name));
                            } else {
                                dropdown_city.append($('<option></option>').attr({ 'value': entry.city_name, 'city-code': entry.city_code }).text(entry.city_name));
                            }
                        })

                    });
                }

                if (status.user[0]["userBarangayCode"] == null) {
                    $.getJSON(url_barangay, function (data) {
                        var result = data.filter(function (value) {
                            return value.city_code == status.user[0]["userCityCode"];
                        });

                        result.sort(function (a, b) {
                            return a.brgy_name.localeCompare(b.brgy_name);
                        });

                        $.each(result, function (key, entry) {
                            dropdown_barangay.append($('<option></option>').attr({ 'value': entry.brgy_name, 'brgy-code': entry.brgy_code }).text(entry.brgy_name));
                        })

                    });
                } else {
                    $.getJSON(url_barangay, function (data) {
                        var result = data.filter(function (value) {
                            return value.city_code == status.user[0]["userCityCode"];
                        });

                        result.sort(function (a, b) {
                            return a.brgy_name.localeCompare(b.brgy_name);
                        });

                        $.each(result, function (key, entry) {
                            if (entry.brgy_code == status.user[0]["userBarangayCode"]) {
                                dropdown_barangay.append($('<option></option>').attr({ 'value': entry.brgy_name, 'brgy-code': entry.brgy_code, 'selected': 'selected' }).text(entry.brgy_name));
                            } else {
                                dropdown_barangay.append($('<option></option>').attr({ 'value': entry.brgy_name, 'brgy-code': entry.brgy_code }).text(entry.brgy_name));
                            }
                        })

                    });
                }

            }
            if (status.status == 401 || status.status == 404) {
                alert(status.message);
            }
            if (status.status == 500) {
                alert(status.message);
            }
        }
    })

});

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
    var ii_birthdate = $("#ii_birthdate").val().trim();

    var ii_placeofbirth = $("#ii_placeofbirth").val().trim();
    var ii_contactnumber = $("#ii_contactnumber").val();
    var ii_address = $("#ii_address").val();

    var region_code = $("#ii_region").find(':selected').attr('region-code')
    var province_code = $("#ii_province").find(':selected').attr('province-code')
    var city_code = $("#ii_city").find(':selected').attr('city-code')
    var barangay_code = $("#ii_barangay").find(':selected').attr('brgy-code')
    var region = $("#ii_region").val();
    var province = $("#ii_province").val();
    var city = $("#ii_city").val();
    var barangay = $("#ii_barangay").val();

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

    if (region == "") {
        sweetAlertError("Region is required!");
        return;
    }

    if (province == "") {
        sweetAlertError("Province is required!");
        return;
    }

    if (city == "") {
        sweetAlertError("City is required!");
        return;
    }

    if (barangay == "") {
        sweetAlertError("Barangay is required!");
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

    $.ajax({
        url: '../../app/functions/user-management/fn_updateUserProfile.php',
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
            ii_address: ii_address,
            region_code: region_code,
            province_code: province_code,
            city_code: city_code,
            barangay_code: barangay_code,
            region: region,
            province: province,
            city: city,
            barangay: barangay
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {
                $("#modal_access").modal("hide");
                sweetAlertSuccess(status.message);
                $("#ii_accessconfirmation").val("");
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

                if (ii_accesspassword == "enableauth") {
                    $("[data-ii-googleauth-modal-action='submit']").click();
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

$("#setting_resetpassword").click(function (e) {

    e.preventDefault();

    $("#setting_reset").addClass("d-none");
    $("#setting_password").removeClass("d-none");

});

$("#setting_password_cancel").click(function (e) {

    e.preventDefault();

    $("#setting_reset").removeClass("d-none");
    $("#setting_password").addClass("d-none");

});

$("[data-ii-resetpassword-modal-action='update']").click(function (e) {

    var currentpassword = $("#currentpassword").val().trim();
    var newpassword = $("#newpassword").val().trim();
    var confirmpassword = $("#confirmpassword").val().trim();

    if (currentpassword == "") {
        sweetAlertError("Current Password is required!");
        return;
    }

    if (newpassword == "") {
        sweetAlertError("New Password is required!");
        return;
    }

    if (confirmpassword == "") {
        sweetAlertError("Confirm Password is required!");
        return;
    }

    if (newpassword !== confirmpassword) {
        sweetAlertError("Passwords do not match!");
        return;
    }

    if (!currentpassword.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Current Password!");
        return;
    }

    if (!newpassword.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on New Password!");
        return;
    }

    if (!confirmpassword.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Confirm Password!");
        return;
    }

    $.ajax({
        url: '../../app/functions/user-management/fn_updatePassword.php',
        type: 'POST',
        data: {
            currentpassword: currentpassword,
            newpassword: newpassword
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {
                $("#setting_reset").removeClass("d-none");
                $("#setting_password").addClass("d-none");

                $("#currentpassword").val("");
                $("#newpassword").val("");
                $("#confirmpassword").val("");

                sweetAlertSuccess(status.message);
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

$("[data-ii-googleauth-modal-action='enable']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var googleAuthenticationCode = $("#googleAuthenticationCode").val().trim();

    if (googleAuthenticationCode == "") {
        sweetAlertError("6-Digit Code is required!");
        return;
    }

    $.ajax({
        url: '../../app/functions/user-management/fn_enableAuthentication.php',
        type: 'POST',
        data: {
            code: googleAuthenticationCode
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

$("[data-ii-googleauth-modal-action='disable']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var googleAuthenticationCode = $("#googleAuthenticationCode").val().trim();

    if (googleAuthenticationCode == "") {
        sweetAlertError("6-Digit Code is required!");
        return;
    }

    $.ajax({
        url: '../../app/functions/user-management/fn_disableAuthentication.php',
        type: 'POST',
        data: {
            code: googleAuthenticationCode
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

if ($("[data-ii-updatespouse-modal-action='update']").length == 1) {

    $("[data-ii-updatespouse-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var ii_spouselastname = $("#ii_spouselastname").val().trim();
        var ii_spousefirstname = $("#ii_spousefirstname").val().trim();
        var ii_spousemiddlename = $("#ii_spousemiddlename").val().trim();
        var ii_spousenickname = $("#ii_spousenickname").val().trim();

        var select_spousegender = $("#select_spousegender").val();
        var select_spousecivilstatus = $("#select_spousecivilstatus").val();

        var ii_spousenationality = $("#ii_spousenationality").val().trim();
        var ii_spouseage = $("#ii_spouseage").val().trim();
        var ii_spousebirthdate = $("#ii_spousebirthdate").val().trim();
        var ii_spouseplaceofbirth = $("#ii_spouseplaceofbirth").val().trim();
        var ii_spousecontactnumber = $("#ii_spousecontactnumber").val().trim();

        if (ii_spouselastname == "") {
            sweetAlertError("Last Name is required!");
            return;
        }

        if (ii_spousefirstname == "") {
            sweetAlertError("First Name is required!");
            return;
        }

        if (ii_spousenickname == "") {
            sweetAlertError("Nick Name is required!");
            return;
        }

        if (select_spousegender == "") {
            sweetAlertError("Gender is required!");
            return;
        }

        if (select_spousecivilstatus == "") {
            sweetAlertError("Civil Status is required!");
            return;
        }

        if (ii_spousenationality == "") {
            sweetAlertError("Nationality is required!");
            return;
        }

        if (ii_spouseage == "") {
            sweetAlertError("Age is required!");
            return;
        }

        if (ii_spousebirthdate == "") {
            sweetAlertError("Birthdate is required!");
            return;
        }

        if (ii_spouseplaceofbirth == "") {
            sweetAlertError("Place of Birth is required!");
            return;
        }

        if (ii_spousecontactnumber == "") {
            sweetAlertError("Contact Number is required!");
            return;
        }

        if (!ii_spousecontactnumber.match(phoneInputMask)) {
            sweetAlertError("Contact Number is required!");
            return;
        }

        if (!ii_spouselastname.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Last Name!");
            return;
        }

        if (!ii_spousefirstname.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on First Name!");
            return;
        }

        if (ii_spousemiddlename != "") {
            if (!ii_spousemiddlename.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Middle Name!");
                return;
            }
        }

        if (!ii_spousenickname.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Nick Name!");
            return;
        }

        if (!ii_spousenationality.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Nationality!");
            return;
        }

        if (!ii_spouseplaceofbirth.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Place Of Birth!");
            return;
        }

        var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfileSpouse.php',
            type: 'POST',
            data: {
                ii_spouselastname: ii_spouselastname,
                ii_spousefirstname: ii_spousefirstname,
                ii_spousemiddlename: ii_spousemiddlename,
                ii_spousenickname: ii_spousenickname,
                select_spousegender: select_spousegender,
                select_spousecivilstatus: select_spousecivilstatus,
                ii_spousenationality: ii_spousenationality,
                ii_spouseage: ii_spouseage,
                ii_spousebirthdate: ii_spousebirthdate,
                ii_spouseplaceofbirth: ii_spouseplaceofbirth,
                ii_spousecontactnumber: ii_spousecontactnumber
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}

$('#ii_homeownershipmonthlyamortization').on('keyup', function () {

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
        $("#ii_homeownershipmonthlyamortization").val("0.00");
    }

});

$('#ii_homeownershipmonthlyrental').on('keyup', function () {

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
        $("#ii_homeownershipmonthlyrental").val("0.00");
    }

});

if ($("[data-ii-updatehomeownership-modal-action='update']").length == 1) {

    $("[data-ii-updatehomeownership-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var homeownership_select = $('input[name="ii_homeownershipradio"]:checked').val();

        var ii_homeownershipmonthlyamortization = $("#ii_homeownershipmonthlyamortization").val().trim();
        var ii_homeownershipmonthlyrental = $("#ii_homeownershipmonthlyrental").val().trim();
        var ii_homeownershiplandlord = $("#ii_homeownershiplandlord").val().trim();
        var ii_homeownershipyearsstay = $("#ii_homeownershipyearsstay").val().trim();
        var ii_homeownershippreviousaddress = $("#ii_homeownershippreviousaddress").val().trim();

        // if (homeownership_select == "4") {
        //     if (ii_homeownershipmonthlyamortization == "0.00") {
        //         sweetAlertError("Monthly Amortization is required!");
        //         return;
        //     }
        // }

        // if (homeownership_select == "2") {
        //     if (ii_homeownershipmonthlyrental == "0.00") {
        //         sweetAlertError("Monthly Rental is required!");
        //         return;
        //     }
        // }

        if (homeownership_select == undefined) {
            sweetAlertError("Select Otion is required!");
            return;
        }

        if (ii_homeownershipmonthlyamortization == "0.00") {
            sweetAlertError("Monthly Amortization is required!");
            return;
        }

        if (ii_homeownershipmonthlyrental == "0.00") {
            sweetAlertError("Monthly Rental is required!");
            return;
        }

        if (ii_homeownershiplandlord == "") {
            sweetAlertError("Name of Land Lord is required!");
            return;
        }

        if (ii_homeownershipyearsstay == "") {
            sweetAlertError("Years of Stay is required!");
            return;
        }

        if (ii_homeownershippreviousaddress == "") {
            sweetAlertError("Previous Address is required!");
            return;
        }

        if (!ii_homeownershiplandlord.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Name of Land Lord!");
            return;
        }

        if (!ii_homeownershippreviousaddress.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Previous Address!");
            return;
        }

        var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfileHomeOwnership.php',
            type: 'POST',
            data: {
                homeownership_select: homeownership_select,
                ii_homeownershipmonthlyamortization: ii_homeownershipmonthlyamortization,
                ii_homeownershipmonthlyrental: ii_homeownershipmonthlyrental,
                ii_homeownershiplandlord: ii_homeownershiplandlord,
                ii_homeownershipyearsstay: ii_homeownershipyearsstay,
                ii_homeownershippreviousaddress: ii_homeownershippreviousaddress
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}

if ($("[data-ii-updateemployment-modal-action='update']").length == 1) {

    $("[data-ii-updateemployment-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var ii_employmentemployerbusiness_1 = $("#ii_employmentemployerbusiness_1").val().trim();
        var ii_employmenttelephonenumber_1 = $("#ii_employmenttelephonenumber_1").val().trim();
        var ii_employmentposition_1 = $("#ii_employmentposition_1").val().trim();
        var ii_employmentyearsemployed_1 = $("#ii_employmentyearsemployed_1").val().trim();

        var ii_employmentemployerbusiness_2 = $("#ii_employmentemployerbusiness_2").val().trim();
        var ii_employmenttelephonenumber_2 = $("#ii_employmenttelephonenumber_2").val().trim();
        var ii_employmentposition_2 = $("#ii_employmentposition_2").val().trim();
        var ii_employmentyearsemployed_2 = $("#ii_employmentyearsemployed_2").val().trim();

        let set_1 = 0;
        let set_2 = 0;

        if (ii_employmentemployerbusiness_1 != "" || ii_employmenttelephonenumber_1 != "" || ii_employmentposition_1 != "" || ii_employmentyearsemployed_1 != "") {

            if (ii_employmentemployerbusiness_1 == "") {
                sweetAlertError("Employer Business is required!");
                return;
            }

            if (ii_employmenttelephonenumber_1 == "") {
                sweetAlertError("Telephone Number is required!");
                return;
            }

            if (ii_employmentposition_1 == "") {
                sweetAlertError("Position is required!");
                return;
            }

            if (ii_employmentyearsemployed_1 == "") {
                sweetAlertError("Years Employed is required!");
                return;
            }

            if (!ii_employmentemployerbusiness_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Employer Business!");
                return;
            }

            if (!ii_employmenttelephonenumber_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Telephone Number!");
                return;
            }

            if (!ii_employmentposition_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Position!");
                return;
            }

            if (!ii_employmentyearsemployed_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Years Employed!");
                return;
            }

            set_1++;

        }

        if (ii_employmentemployerbusiness_2 != "" || ii_employmenttelephonenumber_2 != "" || ii_employmentposition_2 != "" || ii_employmentyearsemployed_2 != "") {

            if (ii_employmentemployerbusiness_2 == "") {
                sweetAlertError("Employer Business is required!");
                return;
            }

            if (ii_employmenttelephonenumber_2 == "") {
                sweetAlertError("Telephone Number is required!");
                return;
            }

            if (ii_employmentposition_2 == "") {
                sweetAlertError("Position is required!");
                return;
            }

            if (ii_employmentyearsemployed_2 == "") {
                sweetAlertError("Years Employed is required!");
                return;
            }

            if (!ii_employmentemployerbusiness_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Employer Business!");
                return;
            }

            if (!ii_employmenttelephonenumber_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Telephone Number!");
                return;
            }

            if (!ii_employmentposition_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Position!");
                return;
            }

            if (!ii_employmentyearsemployed_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Years Employed!");
                return;
            }

            set_2++;

        }

        if (set_1 == 0 && set_2 == 0) {
            sweetAlertError("At least one employment record is required!");
            return;
        }

        var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfileEmployment.php',
            type: 'POST',
            data: {
                set_1: set_1,
                set_2: set_2,
                ii_employmentemployerbusiness_1: ii_employmentemployerbusiness_1,
                ii_employmenttelephonenumber_1: ii_employmenttelephonenumber_1,
                ii_employmentposition_1: ii_employmentposition_1,
                ii_employmentyearsemployed_1: ii_employmentyearsemployed_1,
                ii_employmentemployerbusiness_2: ii_employmentemployerbusiness_2,
                ii_employmenttelephonenumber_2: ii_employmenttelephonenumber_2,
                ii_employmentposition_2: ii_employmentposition_2,
                ii_employmentyearsemployed_2: ii_employmentyearsemployed_2
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}

if ($("[data-ii-updatepersonal-modal-action='update']").length == 1) {

    $("[data-ii-updatepersonal-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var ii_personalfname_1 = $("#ii_personalfname_1").val().trim();
        var ii_personalfage_1 = $("#ii_personalfage_1").val().trim();
        var ii_personaladdress_1 = $("#ii_personaladdress_1").val().trim();
        var ii_personalemployer_1 = $("#ii_personalemployer_1").val().trim();
        var ii_personalemployeraddress_1 = $("#ii_personalemployeraddress_1").val().trim();

        var ii_personalmname_2 = $("#ii_personalmname_2").val().trim();
        var ii_personalmage_2 = $("#ii_personalmage_2").val().trim();
        var ii_personaladdress_2 = $("#ii_personaladdress_2").val().trim();
        var ii_personalemployer_2 = $("#ii_personalemployer_2").val().trim();
        var ii_personalemployeraddress_2 = $("#ii_personalemployeraddress_2").val().trim();

        let set_1 = 0;
        let set_2 = 0;

        if (ii_personalfname_1 != "" || ii_personalfage_1 != "" || ii_personaladdress_1 != "" || ii_personalemployer_1 != "" || ii_personalemployeraddress_1 != "") {

            if (ii_personalfname_1 == "") {
                sweetAlertError("Father's name is required!");
                return;
            }

            if (ii_personalfage_1 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_personaladdress_1 == "") {
                sweetAlertError("Address is required!");
                return;
            }

            if (ii_personalemployer_1 == "") {
                sweetAlertError("Employer is required!");
                return;
            }

            if (ii_personalemployeraddress_1 == "") {
                sweetAlertError("Employer Address is required!");
                return;
            }

            if (!ii_personalfname_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Father's Name!");
                return;
            }

            if (!ii_personaladdress_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Address!");
                return;
            }

            if (!ii_personalemployer_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Employer!");
                return;
            }

            if (!ii_personalemployeraddress_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Employer Address!");
                return;
            }

            set_1++;

        }

        if (ii_personalmname_2 != "" || ii_personalmage_2 != "" || ii_personaladdress_2 != "" || ii_personalemployer_2 != "" || ii_personalemployeraddress_2 != "") {

            if (ii_personalmname_2 == "") {
                sweetAlertError("Father's name is required!");
                return;
            }

            if (ii_personalmage_2 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_personaladdress_2 == "") {
                sweetAlertError("Address is required!");
                return;
            }

            if (ii_personalemployer_2 == "") {
                sweetAlertError("Employer is required!");
                return;
            }

            if (ii_personalemployeraddress_2 == "") {
                sweetAlertError("Employer Address is required!");
                return;
            }

            if (!ii_personalmname_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Father's Name!");
                return;
            }

            if (!ii_personaladdress_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Address!");
                return;
            }

            if (!ii_personalemployer_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Employer!");
                return;
            }

            if (!ii_personalemployeraddress_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Employer Address!");
                return;
            }

            set_2++;

        }

        if (set_1 == 0 && set_2 == 0) {
            sweetAlertError("At least one personal record is required!");
            return;
        }

        var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfilePersonal.php',
            type: 'POST',
            data: {
                set_1: set_1,
                set_2: set_2,
                ii_personalfname_1: ii_personalfname_1,
                ii_personalfage_1: ii_personalfage_1,
                ii_personaladdress_1: ii_personaladdress_1,
                ii_personalemployer_1: ii_personalemployer_1,
                ii_personalemployeraddress_1: ii_personalemployeraddress_1,
                ii_personalmname_2: ii_personalmname_2,
                ii_personalmage_2: ii_personalmage_2,
                ii_personaladdress_2: ii_personaladdress_2,
                ii_personalemployer_2: ii_personalemployer_2,
                ii_personalemployeraddress_2: ii_personalemployeraddress_2
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}

if ($("[data-ii-updatechildren-modal-action='update']").length == 1) {

    $("[data-ii-updatechildren-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var ii_childrenname_1 = $("#ii_childrenname_1").val().trim();
        var ii_childrenage_1 = $("#ii_childrenage_1").val().trim();
        var ii_childrengraduate_1 = $("#ii_childrengraduate_1").val().trim();
        var ii_childrenschool_1 = $("#ii_childrenschool_1").val().trim();
        var ii_childrenname_2 = $("#ii_childrenname_2").val().trim();
        var ii_childrenage_2 = $("#ii_childrenage_2").val().trim();
        var ii_childrengraduate_2 = $("#ii_childrengraduate_2").val().trim();
        var ii_childrenschool_2 = $("#ii_childrenschool_2").val().trim();
        var ii_childrenname_3 = $("#ii_childrenname_3").val().trim();
        var ii_childrenage_3 = $("#ii_childrenage_3").val().trim();
        var ii_childrengraduate_3 = $("#ii_childrengraduate_3").val().trim();
        var ii_childrenschool_3 = $("#ii_childrenschool_3").val().trim();
        var ii_childrenname_4 = $("#ii_childrenname_4").val().trim();
        var ii_childrenage_4 = $("#ii_childrenage_4").val().trim();
        var ii_childrengraduate_4 = $("#ii_childrengraduate_4").val().trim();
        var ii_childrenschool_4 = $("#ii_childrenschool_4").val().trim();
        var ii_childrenname_5 = $("#ii_childrenname_5").val().trim();
        var ii_childrenage_5 = $("#ii_childrenage_5").val().trim();
        var ii_childrengraduate_5 = $("#ii_childrengraduate_5").val().trim();
        var ii_childrenschool_5 = $("#ii_childrenschool_5").val().trim();

        let set_1 = 0;
        let set_2 = 0;
        let set_3 = 0;
        let set_4 = 0;
        let set_5 = 0;

        if (ii_childrenname_1 != "" || ii_childrenage_1 != "" || ii_childrengraduate_1 != "" || ii_childrenschool_1 != "") {

            if (ii_childrenname_1 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_childrenage_1 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_childrengraduate_1 == "") {
                sweetAlertError("Graduation year is required!");
                return;
            }

            if (ii_childrenschool_1 == "") {
                sweetAlertError("School is required!");
                return;
            }

            set_1++;

        }

        if (ii_childrenname_2 != "" || ii_childrenage_2 != "" || ii_childrengraduate_2 != "" || ii_childrenschool_2 != "") {

            if (ii_childrenname_2 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_childrenage_2 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_childrengraduate_2 == "") {
                sweetAlertError("Graduation year is required!");
                return;
            }

            if (ii_childrenschool_2 == "") {
                sweetAlertError("School is required!");
                return;
            }

            set_2++;

        }

        if (ii_childrenname_3 != "" || ii_childrenage_3 != "" || ii_childrengraduate_3 != "" || ii_childrenschool_3 != "") {

            if (ii_childrenname_3 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_childrenage_3 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_childrengraduate_3 == "") {
                sweetAlertError("Graduation year is required!");
                return;
            }

            if (ii_childrenschool_3 == "") {
                sweetAlertError("School is required!");
                return;
            }

            set_3++;

        }

        if (ii_childrenname_4 != "" || ii_childrenage_4 != "" || ii_childrengraduate_4 != "" || ii_childrenschool_4 != "") {

            if (ii_childrenname_4 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_childrenage_4 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_childrengraduate_4 == "") {
                sweetAlertError("Graduation year is required!");
                return;
            }

            if (ii_childrenschool_4 == "") {
                sweetAlertError("School is required!");
                return;
            }

            set_4++;

        }

        if (ii_childrenname_5 != "" || ii_childrenage_5 != "" || ii_childrengraduate_5 != "" || ii_childrenschool_5 != "") {

            if (ii_childrenname_5 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_childrenage_5 == "") {
                sweetAlertError("Age is required!");
                return;
            }

            if (ii_childrengraduate_5 == "") {
                sweetAlertError("Graduation year is required!");
                return;
            }

            if (ii_childrenschool_5 == "") {
                sweetAlertError("School is required!");
                return;
            }

            set_5++;

        }

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfileChildren.php',
            type: 'POST',
            data: {
                set_1: set_1,
                set_2: set_2,
                set_3: set_3,
                set_4: set_4,
                set_5: set_5,
                ii_childrenname_1: ii_childrenname_1,
                ii_childrenage_1: ii_childrenage_1,
                ii_childrengraduate_1: ii_childrengraduate_1,
                ii_childrenschool_1: ii_childrenschool_1,
                ii_childrenname_2: ii_childrenname_2,
                ii_childrenage_2: ii_childrenage_2,
                ii_childrengraduate_2: ii_childrengraduate_2,
                ii_childrenschool_2: ii_childrenschool_2,
                ii_childrenname_3: ii_childrenname_3,
                ii_childrenage_3: ii_childrenage_3,
                ii_childrengraduate_3: ii_childrengraduate_3,
                ii_childrenschool_3: ii_childrenschool_3,
                ii_childrenname_4: ii_childrenname_4,
                ii_childrenage_4: ii_childrenage_4,
                ii_childrengraduate_4: ii_childrengraduate_4,
                ii_childrenschool_4: ii_childrenschool_4,
                ii_childrenname_5: ii_childrenname_5,
                ii_childrenage_5: ii_childrenage_5,
                ii_childrengraduate_5: ii_childrengraduate_5,
                ii_childrenschool_5: ii_childrenschool_5
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}

if ($("[data-ii-updaterelatives-modal-action='update']").length == 1) {

    $("[data-ii-updaterelatives-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var ii_relativesname_1 = $("#ii_relativesname_1").val().trim();
        var ii_relativesaddress_1 = $("#ii_relativesaddress_1").val().trim();
        var ii_relativescpnumber_1 = $("#ii_relativescpnumber_1").val().trim();

        var ii_relativesname_2 = $("#ii_relativesname_2").val().trim();
        var ii_relativesaddress_2 = $("#ii_relativesaddress_2").val().trim();
        var ii_relativescpnumber_2 = $("#ii_relativescpnumber_2").val().trim();

        let set_1 = 0;
        let set_2 = 0;

        if (ii_relativesname_1 != "" || ii_relativesaddress_1 != "" || ii_relativescpnumber_1 != "") {

            if (ii_relativesname_1 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_relativesaddress_1 == "") {
                sweetAlertError("Address is required!");
                return;
            }

            if (ii_relativescpnumber_1 == "") {
                sweetAlertError("Cellphone Number is required!");
                return;
            }

            if (!ii_relativesname_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Name!");
                return;
            }

            if (!ii_relativesaddress_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Address!");
                return;
            }

            if (!ii_relativescpnumber_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Cellphone Number!");
                return;
            }

            set_1++;

        }

        if (ii_relativesname_2 != "" || ii_relativesaddress_2 != "" || ii_relativescpnumber_2 != "") {

            if (ii_relativesname_2 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_relativesaddress_2 == "") {
                sweetAlertError("Address is required!");
                return;
            }

            if (ii_relativescpnumber_2 == "") {
                sweetAlertError("Cellphone Number is required!");
                return;
            }

            if (!ii_relativesname_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Name!");
                return;
            }

            if (!ii_relativesaddress_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Address!");
                return;
            }

            if (!ii_relativescpnumber_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Cellphone Number!");
                return;
            }


            set_2++;

        }

        if (set_1 == 0 && set_2 == 0) {
            sweetAlertError("At least one Relative is required!");
            return;
        }

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfileRelatives.php',
            type: 'POST',
            data: {
                set_1: set_1,
                set_2: set_2,
                ii_relativesname_1: ii_relativesname_1,
                ii_relativesaddress_1: ii_relativesaddress_1,
                ii_relativescpnumber_1: ii_relativescpnumber_1,
                ii_relativesname_2: ii_relativesname_2,
                ii_relativesaddress_2: ii_relativesaddress_2,
                ii_relativescpnumber_2: ii_relativescpnumber_2
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}

if ($("[data-ii-updateneighbors-modal-action='update']").length == 1) {

    $("[data-ii-updateneighbors-modal-action='update']").click(function (e) {

        e.preventDefault();

        var setting = this.getAttribute("data-passaccess");

        var ii_neighborsname_1 = $("#ii_neighborsname_1").val().trim();
        var ii_neighborsaddress_1 = $("#ii_neighborsaddress_1").val().trim();
        var ii_neighborscpnumber_1 = $("#ii_neighborscpnumber_1").val().trim();

        var ii_neighborsname_2 = $("#ii_neighborsname_2").val().trim();
        var ii_neighborsaddress_2 = $("#ii_neighborsaddress_2").val().trim();
        var ii_neighborscpnumber_2 = $("#ii_neighborscpnumber_2").val().trim();

        let set_1 = 0;
        let set_2 = 0;

        if (ii_neighborsname_1 != "" || ii_neighborsaddress_1 != "" || ii_neighborscpnumber_1 != "") {

            if (ii_neighborsname_1 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_neighborsaddress_1 == "") {
                sweetAlertError("Address is required!");
                return;
            }

            if (ii_neighborscpnumber_1 == "") {
                sweetAlertError("Cellphone Number is required!");
                return;
            }

            if (!ii_neighborsname_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Name!");
                return;
            }

            if (!ii_neighborsaddress_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Address!");
                return;
            }

            if (!ii_neighborscpnumber_1.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Cellphone Number!");
                return;
            }

            set_1++;

        }

        if (ii_neighborsname_2 != "" || ii_neighborsaddress_2 != "" || ii_neighborscpnumber_2 != "") {

            if (ii_neighborsname_2 == "") {
                sweetAlertError("Name is required!");
                return;
            }

            if (ii_neighborsaddress_2 == "") {
                sweetAlertError("Address is required!");
                return;
            }

            if (ii_neighborscpnumber_2 == "") {
                sweetAlertError("Cellphone Number is required!");
                return;
            }

            if (!ii_neighborsname_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Name!");
                return;
            }

            if (!ii_neighborsaddress_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Address!");
                return;
            }

            if (!ii_neighborscpnumber_2.match(defaultFormat)) {
                sweetAlertError("Invalid Characters on Cellphone Number!");
                return;
            }


            set_2++;

        }

        if (set_1 == 0 && set_2 == 0) {
            sweetAlertError("At least one Neighbor is required!");
            return;
        }

        $.ajax({
            url: '../../app/functions/user-management/fn_updateUserProfileNeighbor.php',
            type: 'POST',
            data: {
                set_1: set_1,
                set_2: set_2,
                ii_neighborsname_1: ii_neighborsname_1,
                ii_neighborsaddress_1: ii_neighborsaddress_1,
                ii_neighborscpnumber_1: ii_neighborscpnumber_1,
                ii_neighborsname_2: ii_neighborsname_2,
                ii_neighborsaddress_2: ii_neighborsaddress_2,
                ii_neighborscpnumber_2: ii_neighborscpnumber_2
            },
            cache: false,
            success: function (response) {
                var status = JSON.parse(response);
                if (status.status == 200) {
                    $("#modal_access").modal("hide");
                    sweetAlertSuccess(status.message);
                    $("#ii_accessconfirmation").val("");
                    $("#ii_password").val("");
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 1000);
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

}