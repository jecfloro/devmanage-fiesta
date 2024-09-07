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
        }
    }
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTUsersList.init();
});