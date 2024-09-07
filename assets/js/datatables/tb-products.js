"use strict";

var KTUsersList = function () {
    // Define shared variables
    var table = document.getElementById('tb_product');
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
        const filterSearch = document.querySelector('[data-kt-product-table-filter="search"]');
        filterSearch.addEventListener('keyup', function (e) {
            datatable.search(e.target.value).draw();
        });
    }

    var handleMinMaxSearch = () => {

        const ii_minpriceinput = document.querySelector('[data-kt-product-table-filter="min"]');
        const ii_maxpriceinput = document.querySelector('[data-kt-product-table-filter="max"]');
        ii_minpriceinput.addEventListener('keyup', function (e) {
            datatable.draw();
        });
        ii_maxpriceinput.addEventListener('keyup', function (e) {
            datatable.draw();
        });

        $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
            var min = parseInt(ii_minpriceinput.value, 10);
            var max = parseInt(ii_maxpriceinput.value, 10);
            var age = parseFloat(data[3]) || 0; // use data for the age column
        
            if (
                (isNaN(min) && isNaN(max)) ||
                (isNaN(min) && age <= max) ||
                (min <= age && isNaN(max)) ||
                (min <= age && age <= max)
            ) {
                return true;
            }
            return false;
        });

    }

    var handleCategorySearch = () => {

        const ii_cateogry = document.querySelector('[data-kt-product-table-filter="category"]');

        $("[data-kt-product-table-filter='category']").change(function(e) {
            console.log(this.value);

            if (this.value == "All Category") {
                datatable.search('').draw();
            } else {
                datatable.search(e.target.value).draw();
            }

        })
    }

    var handleStatusFilter = () => {

        const ii_all = document.querySelector('[data-kt-product-table-filter="all"]');
        const ii_active = document.querySelector('[data-kt-product-table-filter="active"]');
        const ii_inactive = document.querySelector('[data-kt-product-table-filter="inactive"]');
        const ii_draft = document.querySelector('[data-kt-product-table-filter="draft"]');

        ii_all.addEventListener('click', function (e) {
            datatable.column(4).search("", true, false).draw();
        });

        ii_active.addEventListener('click', function (e) {
            datatable.column(4).search('^Active$', true, false).draw();
        });

        ii_inactive.addEventListener('click', function (e) {
            datatable.column(4).search('^Inactive$', true, false).draw();
        });

        ii_draft.addEventListener('click', function (e) {
            datatable.column(4).search('^Draft$', true, false).draw();
        });

        // $("[data-kt-product-table-filter='all']").click(function(e) {
        //     console.log(1);
        // })

    }

    return {
        // Public functions  
        init: function () {
            if (!table) {
                return;
            }

            initUserTable();
            handleSearchDatatable();
            handleMinMaxSearch();
            handleCategorySearch();
            handleStatusFilter();
        }
    }
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTUsersList.init();
});