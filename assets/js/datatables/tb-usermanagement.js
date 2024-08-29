"use strict";

var KTUsersList = function () {
    // Define shared variables
    var table = document.getElementById('tb_Usermanagement');
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
                { orderable: false, targets: 5 }
            ]
        });
    }

    // Search Datatable --- official docs reference: https://datatables.net/reference/api/search()
    var handleSearchDatatable = () => {
        const filterSearch = document.querySelector('[data-kt-usermanagement-table-filter="search"]');
        filterSearch.addEventListener('keyup', function (e) {
            datatable.search(e.target.value).draw();
        });
    }

    var handleFilterDatatable = () => {
        // Select filter options
        const filterForm = document.querySelector('[data-kt-user-table-filter="form"]');
        const filterButton = filterForm.querySelector('[data-kt-useryupe-table-filter="filter"]');
        const selectOptions = filterForm.querySelectorAll('select');

        // Filter datatable on submit
        filterButton.addEventListener('click', function () {
            var filterString = '';

            // Get filter values
            selectOptions.forEach((item, index) => {
                if (item.value && item.value !== '') {
                    if (index !== 0) {
                        filterString += ' ';
                    }

                    // Build filter value options
                    filterString += item.value;
                }
            });

            // Filter datatable --- official docs reference: https://datatables.net/reference/api/search()
            datatable.search(filterString).draw();
        });
    }

    var handleResetDatatable = () => {

        
        const filterForm = document.querySelector('[data-kt-user-table-filter="form"]');
        const resetButton = filterForm.querySelector('[data-kt-useryupe-table-filter="reset"]');
        const selectOptions = filterForm.querySelectorAll('select');

        resetButton.addEventListener('click', function () {

            selectOptions.forEach(select => {
                $(select).val('').trigger('change');
            });

            // Reset datatable --- official docs reference: https://datatables.net/reference/api/search()
            datatable.search('').draw();

        });
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
            handleResetDatatable();

        }
    }
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTUsersList.init();
});