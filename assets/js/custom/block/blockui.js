"use strict";
var KTGeneralBlockUI = {
	init: function() {
		var e, t, n;
		e = document.querySelector("#kt_block_ui_1_button"), t = document.querySelector("#kt_block_ui_1_target"), n = new KTBlockUI(t), e.addEventListener("click", (function() {
				n.isBlocked() ? (n.release(), e.innerText = "Block") : (n.block(), e.innerText = "Release")
			})),
			function() {
				var e = document.querySelector("#kt_block_ui_2_button"),
					t = document.querySelector("#kt_block_ui_2_target"),
					n = new KTBlockUI(t, {
						message: '<div class="blockui-message"><span class="spinner-border text-primary"></span> Loading...</div>'
					});
			}(),
			function() {
				var e = document.querySelector("#kt_block_ui_3_button"),
					t = document.querySelector("#kt_block_ui_3_target"),
					n = new KTBlockUI(t, {
						overlayClass: "bg-danger bg-opacity-25"
					});
			}(),
			function() {
				var e = document.querySelector("#kt_block_ui_4_button"),
					t = document.querySelector("#kt_block_ui_4_target"),
					n = new KTBlockUI(t);
			}()
	}
};
KTUtil.onDOMContentLoaded((function() {
	KTGeneralBlockUI.init()
}));