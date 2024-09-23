"use strict";

localStorage.removeItem("redirect");

$("[data-ii-productapply-action='submit']").click(function (e) {

    e.preventDefault();

    var dataid = this.getAttribute("data-id");

    localStorage.setItem("redirect", dataid);

    window.location.href = "login.php";

});


