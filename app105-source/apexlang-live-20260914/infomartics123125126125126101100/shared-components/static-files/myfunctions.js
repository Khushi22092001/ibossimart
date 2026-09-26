function showError(pData, pItem) {
    apex.item(pItem).setFocus();
    apex.message.clearErrors();
    apex.message.showErrors([{
            type: "error",
            location: "inline",
            pageItem: pItem,
            message: pData,
            unsafe: false
        },
        {
            type: "error",
            location: "inline",
            message: "An error has occurred.",
            unsafe: false
        }
    ]);
}

/*
ENABLE DISABLE PAGE ITEM
*/
function disablefield(pageItem){
    //$s(pageItem,'');//Setting null value to the field
    apex.item(pageItem).disable(); // Disabling the field
}

function enablefield(pageItem){
    apex.item(pageItem).enable(); // Enabling the field
}




// created by vibhor

function mergeReportColumn(regionStaticId, colPosition) {
    $('#report_' + regionStaticId + ', #' + regionStaticId).find('.t-Report-report, table').each(function() {
        var $table = $(this);
        var first_instance_td = null;

        $table.find('tbody tr').each(function() {
            var $row = $(this);
            // Use visible remaining tds
            var $current_td = $row.find('td').eq(colPosition - 1);
            if ($current_td.length === 0) return;

            var current_text = $current_td.text().trim();

            if (first_instance_td === null) {
                first_instance_td = $current_td;
            } else if (current_text === first_instance_td.text().trim() && current_text !== "") {
                var current_rowspan = parseInt(first_instance_td.attr('rowspan')) || 1;
                first_instance_td.attr('rowspan', current_rowspan + 1);
                first_instance_td.css({
                    "border-bottom": "1px solid #e6e6e6",
                    "vertical-align": "middle",
                    "background-color": "#ffffff"
                });
                $current_td.remove();
            } else {
                first_instance_td = $current_td;
            }
        });
    });
}



function runMergeAutomation() {
    $('.t-report-merge-column1').each(function() {
        var regionStaticId = $(this).closest('[id]').attr('id');
        if (regionStaticId && regionStaticId.indexOf('report_') === 0) {
            regionStaticId = regionStaticId.replace('report_', '');
        }
        mergeReportColumn(regionStaticId, 1);
    });

    // Column 2 runs AFTER column 1 — order matters
    $('.t-report-merge-column2').each(function() {
        var regionStaticId = $(this).closest('[id]').attr('id');
        if (regionStaticId && regionStaticId.indexOf('report_') === 0) {
            regionStaticId = regionStaticId.replace('report_', '');
        }
        mergeReportColumn(regionStaticId, 2);
    });
}

$(document).ready(function() { runMergeAutomation(); });
$(document).on("apexafterrefresh", function() { runMergeAutomation(); });