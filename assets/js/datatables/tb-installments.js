"use strict";

var KTUsersList = function () {
    // Define shared variables
    var table = document.getElementById('tb_installment');
    var datatable;
    var toolbarBase;
    var toolbarSelected;
    var selectedCount;

    // Private functions
    var initUserTable = function () {

        // Init datatable --- more info on datatables: https://datatables.net/manual/
        datatable = $(table).DataTable({
            "info": true,
            'order': [],
            "pageLength": 10,
            "lengthChange": true,
            'columnDefs': [
                { orderable: false, targets: 4 }
            ]
        });
    }

    // Search Datatable --- official docs reference: https://datatables.net/reference/api/search()
    var handleSearchDatatable = () => {
        const filterSearch = document.querySelector('[data-kt-installment-table-filter="search"]');
        filterSearch.addEventListener('keyup', function (e) {
            datatable.search(e.target.value).draw();
        });
    }

    var handleFilterDatatable = () => {

        const ii_select = document.querySelector('[data-kt-installment-table-filter="status"]');
        const ii_reset = document.querySelector('[data-kt-installment-table-filter="reset"]');
        const ii_filter = document.querySelector('[data-kt-installment-table-filter="filter"]');
        const ii_search = document.querySelector('[data-kt-installment-table-filter="search"]');

        ii_reset.addEventListener('click', function (e) {
            datatable.search('').draw();
        });

        ii_filter.addEventListener('click', function (e) {
            
            if (ii_select.value == "All") {
                datatable.column(3).search("", true, false).draw();
            }

            if (ii_select.value == "Approved") {
                datatable.column(3).search('^Approved$', true, false).draw();
            }

            if (ii_select.value == "Pending") {
                datatable.column(3).search('^Pending$', true, false).draw();
            }

            if (ii_select.value == "Rejected") {
                datatable.column(3).search('^Rejected$', true, false).draw();
            }

            if (ii_select.value == "Cancelled") {
                datatable.column(3).search('^Cancelled$', true, false).draw();
            }

            if (ii_select.value == "Completed") {
                datatable.column(3).search('^Completed$', true, false).draw();
            }

        });

        // ii_active.addEventListener('click', function (e) {
        //     datatable.column(4).search('^Active$', true, false).draw();
        // });

        // ii_inactive.addEventListener('click', function (e) {
        //     datatable.column(4).search('^Inactive$', true, false).draw();
        // });

        // ii_draft.addEventListener('click', function (e) {
        //     datatable.column(4).search('^Draft$', true, false).draw();
        // });

    }

    return {
        // Public functions  
        init: function () {
            if (!table) {
                return;
            }

            initUserTable();
            handleSearchDatatable();
            handleFilterDatatable();
        }
    }
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTUsersList.init();
});