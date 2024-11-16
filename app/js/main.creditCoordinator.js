"use strict";

import { defaultFormat, PasswordFormat, emailFormat, phoneFormat } from "./main.formatScript.js";
import { sweetAlertSuccess, sweetAlertError } from "./main.SweetAlert.js";

$("#upldFile").change(function (e) {

    e.preventDefault();

    var attachments = document.getElementById("upldFile").files; // <-- reference your file input here

    for (var i = 0; i < attachments.length; i++) {
        console.log(attachments[i].name + " - " + attachments[i].type);
    }

});

$("#btnUpload").click(function (e) {

    e.preventDefault();
    
    $("#upldFile").click();

});



function removeFile(index){
    var attachments = document.getElementById("upldFile").files; // <-- reference your file input here
    var fileBuffer = new DataTransfer();
    
    // append the file list to an array iteratively
    for (let i = 0; i < attachments.length; i++) {
        // Exclude file in specified index
        if (index !== i)
            fileBuffer.items.add(attachments[i]);
    }
    
    // Assign buffer to file input
    document.getElementById("upldFile").files = fileBuffer.files; // <-- according to your file input reference

}