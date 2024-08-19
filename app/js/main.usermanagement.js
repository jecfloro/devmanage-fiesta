"use strict"

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

$("[data-ii-adduser-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_usercode = $("#ii_usercode").val().trim();
    var ii_lastname = $("#ii_lastname").val().trim();
    var ii_firstname = $("#ii_firstname").val().trim();
    var ii_middlename = $("#ii_middlename").val().trim();
    var ii_suffixname = $("#ii_suffixname").val().trim();
    var ii_usergroup = $("#ii_usergroup").val();
    var ii_department = $("#ii_department").val();
    var ii_position = $("#ii_position").val();

    if (ii_usercode == "") {
        sweetAlertError("User Code is empty!");
        return;
    }

    if (ii_lastname == "") {
        sweetAlertError("Last Name is empty!");
        return;
    }

    if (ii_firstname == "") {
        sweetAlertError("First Name is empty!");
        return;
    }

    if (ii_usergroup == "") {
        sweetAlertError("Select User Group!");
        return;
    }

    if (ii_department == "") {
        sweetAlertError("Select Department!");
        return;
    }

    if (ii_position == "") {
        sweetAlertError("Select Position!");
        return;
    }

    if (!ii_usercode.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on User Code!");
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

    if (!ii_middlename.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Middle Name!");
        return;
    }

    if (ii_middlename != "") {
        if (!ii_middlename.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Middle Name!");
            return;
        }
    }

    if (ii_suffixname != "") {
        if (!ii_suffixname.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Suffix Name!");
            return;
        }
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#modal_hrAddUser").modal("hide");
        $("#ii_accesspassword").val(setting);
        $("#modal_hrPasswordAccess").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/user-management/fn_addUser.php',
            type: 'POST',
            data: {
                ii_usercode: ii_usercode,
                ii_lastname: ii_lastname,
                ii_firstname: ii_firstname,
                ii_middlename: ii_middlename,
                ii_suffixname: ii_suffixname,
                ii_usergroup: ii_usergroup,
                ii_department: ii_department,
                ii_position: ii_position
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

    var UserID = this.getAttribute("data-ii-val");

    $.ajax({
        url: '../../app/functions/user-management/fn_SearchUserDetails.php',
        type: 'POST',
        data: {
            UserID: UserID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#ii_useridedit").val(status.default_PK_appsysUsers);
                $("#ii_usercodeedit").val(status.default_usercode);
                if (status.decrypted_useremail == false) {
                    $("#ii_emailaddressedit").val("");
                } else {
                    $("#ii_emailaddressedit").val(status.decrypted_useremail);
                }
                $("#ii_lastnameedit").val(status.decrypted_pi_lastname);
                $("#ii_firstnameedit").val(status.decrypted_pi_firstname);
                $("#ii_middlenameedit").val(status.decrypted_pi_middlename);
                $("#ii_suffixnameedit").val(status.decrypted_pi_suffixname);
                $("#ii_usergroupedit").val(status.default_FK_appsysGroups);
                $("#ii_departmentedit").val(status.default_FK_appsysDepartments);
                $("#ii_positionedit").val(status.default_FK_appsysPositions);

                $("#modal_hrEditUser").modal("show");
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

$("[data-ii-edituser-modal-action='submit']").click(function (e) {

    e.preventDefault();

    var setting = this.getAttribute("data-passaccess");

    var ii_useridedit = $("#ii_useridedit").val().trim();
    var ii_usercodeedit = $("#ii_usercodeedit").val().trim();
    var ii_newpasswordedit = $("#ii_newpasswordedit").val().trim();
    var ii_confirmpasswordedit = $("#ii_confirmpasswordedit").val().trim();
    var ii_emailaddressedit = $("#ii_emailaddressedit").val().trim();

    var ii_lastnameedit = $("#ii_lastnameedit").val().trim();
    var ii_firstnameedit = $("#ii_firstnameedit").val().trim();
    var ii_middlenameedit = $("#ii_middlenameedit").val().trim();
    var ii_suffixnameedit = $("#ii_suffixnameedit").val().trim();

    var ii_usergroupedit = $("#ii_usergroupedit").val();
    var ii_departmentedit = $("#ii_departmentedit").val();
    var ii_positionedit = $("#ii_positionedit").val();

    if (ii_useridedit == "") {
        sweetAlertError("User Code is empty!");
        return;
    }

    if (ii_usercodeedit == "") {
        sweetAlertError("User Code is empty!");
        return;
    }

    if (ii_lastnameedit == "") {
        sweetAlertError("Last Name is empty!");
        return;
    }

    if (ii_firstnameedit == "") {
        sweetAlertError("First Name is empty!");
        return;
    }

    if (ii_usergroupedit == "") {
        sweetAlertError("Select User Group!");
        return;
    }

    if (ii_departmentedit == "") {
        sweetAlertError("Select Department!");
        return;
    }

    if (ii_positionedit == "") {
        sweetAlertError("Select Position!");
        return;
    }

    if (!ii_usercodeedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on User Code!");
        return;
    }

    if (ii_newpasswordedit != "") {
        if (!ii_newpasswordedit.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on New Password!");
            return;
        }
    }

    if (ii_confirmpasswordedit != "") {
        if (!ii_confirmpasswordedit.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Confirm Password!");
            return;
        }
    }

    if (ii_emailaddressedit != "") {
        if (!ii_emailaddressedit.match(emailFormat)) {
            sweetAlertError("Email Address must be @gmail.com!");
            return;
        }
    }

    if (!ii_lastnameedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Last Name!");
        return;
    }

    if (!ii_firstnameedit.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on First Name!");
        return;
    }

    if (ii_middlenameedit != "") {
        if (!ii_middlenameedit.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Middle Name!");
            return;
        }
    }
    if (ii_suffixnameedit != "") {
        if (!ii_suffixnameedit.match(defaultFormat)) {
            sweetAlertError("Invalid Characters on Suffix Name!");
            return;
        }
    }

    if (ii_newpasswordedit != "") {

        if (ii_confirmpasswordedit == "") {
            sweetAlertError("Confirm Password is empty!");
            return;
        }

        if (ii_newpasswordedit !== ii_confirmpasswordedit) {
            sweetAlertError("Passwords do not match!");
            return;
        }

    }
    
    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#modal_hrEditUser").modal("hide");
        $("#ii_accesspassword").val(setting);
        $("#modal_hrPasswordAccess").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/user-management/fn_editUser.php',
            type: 'POST',
            data: {
                ii_useridedit: ii_useridedit,
                ii_usercodeedit: ii_usercodeedit,
                ii_newpasswordedit: ii_newpasswordedit,
                ii_confirmpasswordedit: ii_confirmpasswordedit,
                ii_emailaddressedit: ii_emailaddressedit,
                ii_lastnameedit: ii_lastnameedit,
                ii_firstnameedit: ii_firstnameedit,
                ii_middlenameedit: ii_middlenameedit,
                ii_suffixnameedit: ii_suffixnameedit,
                ii_usergroupedit: ii_usergroupedit,
                ii_departmentedit: ii_departmentedit,
                ii_positionedit: ii_positionedit
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
                if (status.status == 403) {
                    $("#ii_password").val("");
                    $("#ii_accessconfirmation").val("");
                    $("#modal_hrPasswordAccess").modal("hide");
                    $("#modal_hrEditUser").modal("show");
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

$(".datainput [data-ii-input-module-action='edit']").click(function (e) {

    e.preventDefault();

    var UserID = this.getAttribute("data-ii-val");

    $("#ii_useridmodule").val(UserID);

    $.ajax({
        url: '../../app/functions/user-management/fn_SearchUserModule.php',
        type: 'POST',
        data: {
            UserID: UserID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $("#chkbxAdministrativeAccess").prop("checked", false);
                $("#chkbxHRAccess").prop("checked", false);
                $("#chkbxBillingAccess").prop("checked", false);
                $("#chkMedicalRecordsAccess").prop("checked", false);
                $("#chkbxAccountingAccess").prop("checked", false);
                $("#chkbxGrantHRAdmin").prop("checked", false);
                $("#chkbxGrantDepartmentHead").prop("checked", false);
                $("#chkbxGrantHRSchedule").prop("checked", false);
                $("#chkbxGrantHRApproval").prop("checked", false);
                
                if (status.usertype == 1) {
                    $("#chkbxAdministrativeAccess").prop("checked", true);
                }

                if (status.systemHR == 1) {
                    $("#chkbxHRAccess").prop("checked", true);
                }

                if (status.systemBilling == 1) {
                    $("#chkbxBillingAccess").prop("checked", true);
                }

                if (status.systemMedicalRecords == 1) {
                    $("#chkMedicalRecordsAccess").prop("checked", true);
                }

                if (status.systemAccounting == 1) {
                    $("#chkbxAccountingAccess").prop("checked", true);
                }

                if (status.sysHRadminaccess == 1) {
                    $("#chkbxGrantHRAdmin").prop("checked", true);
                }

                if (status.sysHRdepartmentHead == 1) {
                    $("#chkbxGrantDepartmentHead").prop("checked", true);
                }

                if (status.sysHRscheduleAdd == 1) {
                    $("#chkbxGrantHRSchedule").prop("checked", true);
                }

                if (status.sysHRscheduleApproval == 1) {
                    $("#chkbxGrantHRApproval").prop("checked", true);
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

    $("#modal_hrModule").modal("show");

});

// Check all checkboxes if administrative access is checked

// $("#chkbxAdministrativeAccess").change(function (e) {

//     if ($(this).is(":checked")) {
        
//         $("#chkbxHRAccess").prop("checked", true);
//         $("#chkbxAccountingAccess").prop("checked", true);
//         $("#chkMedicalRecordsAccess").prop("checked", true);
//         $("#chkbxBillingAccess").prop("checked", true);
//         $("#chkbxGrantHRAdmin").prop("checked", true);
//         $("#chkbxGrantHRSchedule").prop("checked", true);
//         $("#chkbxGrantHRApproval").prop("checked", true);

//     } else {

//         $("#chkbxHRAccess").prop("checked", false);
//         $("#chkbxAccountingAccess").prop("checked", false);
//         $("#chkMedicalRecordsAccess").prop("checked", false);
//         $("#chkbxBillingAccess").prop("checked", false);
//         $("#chkbxGrantHRAdmin").prop("checked", false);
//         $("#chkbxGrantHRSchedule").prop("checked", false);
//         $("#chkbxGrantHRApproval").prop("checked", false);

//     }

// });

$("[data-ii-editmodule-modal-action='submit']").click(function (e) {

    e.preventDefault();
    
    var setting = this.getAttribute("data-passaccess");

    var ii_useridmodule = $("#ii_useridmodule").val().trim();
    let chkbxAdministrativeAccess = 0;
    let chkbxHRAccess = 0;
    let chkbxAccountingAccess = 0;
    let chkMedicalRecordsAccess = 0;
    let chkbxBillingAccess = 0;
    let chkbxGrantDepartmentHead = 0;
    let chkbxGrantHRAdmin = 0;
    let chkbxGrantHRSchedule = 0;
    let chkbxGrantHRApproval = 0;

    if ($("#chkbxAdministrativeAccess").is(":checked")) {
        chkbxAdministrativeAccess = 1;
    }

    if ($("#chkbxHRAccess").is(":checked")) {
        chkbxHRAccess = 1;
    }

    if ($("#chkbxAccountingAccess").is(":checked")) {
        chkbxAccountingAccess = 1;
    }

    if ($("#chkMedicalRecordsAccess").is(":checked")) {
        chkMedicalRecordsAccess = 1;
    }

    if ($("#chkbxBillingAccess").is(":checked")) {
        chkbxBillingAccess = 1;
    }

    if ($("#chkbxGrantDepartmentHead").is(":checked")) {
        chkbxGrantDepartmentHead = 1;
    }

    if ($("#chkbxGrantHRAdmin").is(":checked")) {
        chkbxGrantHRAdmin = 1;
    }

    if ($("#chkbxGrantHRSchedule").is(":checked")) {
        chkbxGrantHRSchedule = 1;
    }

    if ($("#chkbxGrantHRApproval").is(":checked")) {
        chkbxGrantHRApproval = 1;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#modal_hrModule").modal("hide");
        $("#ii_accesspassword").val(setting);
        $("#modal_hrPasswordAccess").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/user-management/fn_editModule.php',
            type: 'POST',
            data: {
                ii_useridmodule: ii_useridmodule,
                chkbxAdministrativeAccess: chkbxAdministrativeAccess,
                chkbxHRAccess: chkbxHRAccess,
                chkbxAccountingAccess: chkbxAccountingAccess,
                chkMedicalRecordsAccess: chkMedicalRecordsAccess,
                chkbxBillingAccess: chkbxBillingAccess,
                chkbxGrantDepartmentHead: chkbxGrantDepartmentHead,
                chkbxGrantHRAdmin: chkbxGrantHRAdmin,
                chkbxGrantHRSchedule: chkbxGrantHRSchedule,
                chkbxGrantHRApproval: chkbxGrantHRApproval
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
                if (status.status == 403) {
                    $("#ii_password").val("");
                    $("#ii_accessconfirmation").val("");
                    $("#modal_hrPasswordAccess").modal("hide");
                    $("#modal_hrModule").modal("show");
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
        url: '../../app/functions/user-management/fn_PasswordVerify.php',
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

                if (ii_accesspassword == "add") {
                    $("[data-ii-adduser-modal-action='submit']").click();
                }

                if (ii_accesspassword == "edit") {
                    $("[data-ii-edituser-modal-action='submit']").click();
                }

                if (ii_accesspassword == "module") {
                    $("[data-ii-editmodule-modal-action='submit']").click();
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


$(".datainput [data-ii-input-lock-action='lock']").click(function (e) {

    e.preventDefault();

    var UserID = this.getAttribute("data-ii-val");

    $("#ii_useridlock").val(UserID);

    $.ajax({
        url: '../../app/functions/user-management/fn_SearchUserLock.php',
        type: 'POST',
        data: {
            UserID: UserID
        },
        cache: false,
        success: function (response) {
            var status = JSON.parse(response);
            if (status.status == 200) {

                $('#ii_userlockconfirm').attr('placeholder', status.message); 

            }
            if (status.status == 500) {
                sweetAlertError(status.message);
            }
        },
        error: function (response) {
            sweetAlertError("Server Error, Please contact administrator!");
        }
    })

    $("#ii_password").val("");
    $("#ii_userlockconfirm").val("");
    $("#modal_hrLock").modal("show");

});

// Verify Confirm

$("#ii_userlockconfirm").keyup(function(e) {
   
    $("[data-ii-lockaccount-modal-action='submit']").prop("disabled", true);

    if (this.value == "Confirm") {
        $("[data-ii-lockaccount-modal-action='submit']").prop("disabled", false);
    }
    
});

$("[data-ii-lockaccount-modal-action='submit']").click(function (e) {

    e.preventDefault();
    
    var setting = this.getAttribute("data-passaccess");

    var ii_userlockconfirm = $("#ii_userlockconfirm").val().trim();
    var ii_useridlock = $("#ii_useridlock").val().trim();

    if (ii_userlockconfirm == "") {
        sweetAlertError("Confirm is empty!");
        return;
    }

    if (!ii_userlockconfirm.match(defaultFormat)) {
        sweetAlertError("Invalid Characters on Password!");
        return;
    }

    var ii_accessconfirmation = $("#ii_accessconfirmation").val().trim();

    if (ii_accessconfirmation == "") {
        $("#modal_hrLock").modal("hide");
        $("#ii_accesspassword").val(setting);
        $("#modal_hrPasswordAccess").modal("show");
        setTimeout(() => {
            $("#ii_password").focus();
        }, 500);
    } else {

        $.ajax({
            url: '../../app/functions/user-management/fn_lockUser.php',
            type: 'POST',
            data: {
                ii_useridlock: ii_useridlock
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
                if (status.status == 403) {
                    $("#ii_password").val("");
                    $("#ii_accessconfirmation").val("");
                    $("#modal_hrPasswordAccess").modal("hide");
                    $("#modal_hrLock").modal("show");
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