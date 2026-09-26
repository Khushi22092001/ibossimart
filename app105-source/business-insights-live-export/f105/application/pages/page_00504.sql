prompt --application/pages/page_00504
begin
--   Manifest
--     PAGE: 00504
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>504
,p_name=>'Sales Dashboard'
,p_alias=>'SALES-DASHBOARD'
,p_step_title=>'Sales Dashboard'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#chart.umd.js',
'https://cdn.jsdelivr.net/npm/apexcharts',
'#APP_FILES#myfunctions#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'function forceScrollToTop() {',
'    setTimeout(function() {',
'        if (document.activeElement) {',
'            document.activeElement.blur();',
'        }',
'        window.scrollTo({',
'            top: 0,',
'            left: 0,',
'            behavior: ''instant''',
'        });',
'    }, 10);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.initCharts = function() {',
'    document.querySelectorAll(''.kpi-sparkline'').forEach(function(canvasElement) {',
'        if (canvasElement.chart) canvasElement.chart.destroy();',
'        ',
'        var type = canvasElement.getAttribute(''data-chart-type'') || ''line'';',
'        var dataStr = canvasElement.getAttribute(''data-chart-values'') || '''';',
'        var labelStr = canvasElement.getAttribute(''data-chart-labels'') || '''';',
'        var color = canvasElement.getAttribute(''data-chart-color'') || ''#000000'';',
'        ',
'        var dataArray = dataStr.split('','').map(Number);',
'        var labelsArray = labelStr.split('','');',
'        ',
'        canvasElement.chart = new Chart(canvasElement, {',
'            type: type,',
'            data: {',
'                labels: labelsArray,',
'                datasets: [{',
'                    data: dataArray,',
'                    borderColor: color,',
'                    backgroundColor: type === ''line'' ? ''transparent'' : color + ''80''',
'                }]',
'            }',
'        });',
'    });',
'};',
'',
'window.initCharts();',
'',
'',
'',
'',
'$(document).ready(function() {',
'    forceScrollToTop();',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ==========================================================================',
'   1. CUSTOM CARD CLASSES',
'   ========================================================================== */',
'.mycardtext {',
'    color: #ffffff;',
'}',
'',
'.mycardsize {',
'    font-size: 15px;',
'    font-weight: bold;',
'}',
'',
'/* ==========================================================================',
'   2. GLOBAL TABLE ROW HOVER STYLING',
'   ========================================================================== */',
'tr:hover {',
'    background-color: #fffacd !important;',
'}',
'',
'/* ==========================================================================',
'   3. CLASSIC REPORT STYLING (.t-Report)',
'   ========================================================================== */',
'.t-Report-colHead, ',
'.t-Report-colHead a {',
'    background-color: #c3cad4;',
'    color: #353d4b;',
'    text-transform: uppercase;',
'    padding: 6px;',
'    letter-spacing: 0.5px;',
'}',
'',
'.t-Report-cell {',
'    line-height: 1.2rem; ',
'    padding-top: 2px !important; ',
'    padding-bottom: 2px !important; ',
'    letter-spacing: 0.5px;',
'}',
'',
'/* ==========================================================================',
'   4. INTERACTIVE REPORT (IRR) STYLING (.a-IRR)',
'   ========================================================================== */',
'/* Global Structure Layouts */',
'.a-IRR-controlsContainer {',
'    display: none;',
'}',
'',
'.a-IRR-table, ',
'.a-IRR-table table {',
'    border-collapse: collapse !important;',
'}',
'',
'/* Control Break Group Headers (e.g., Seller Name / State Name Info Section) */',
'.a-IRR-table th.a-IRR-header--group {',
'    padding: 4px 8px !important;',
'    line-height: 1.2 !important;',
'    font-size: 12px !important;',
'    background-color: #c3cad4;',
'    color: #353d4b;',
'}',
'',
'/* Ultra Thin Standard Column Headers (City Name, Total Quantity, etc.) */',
'.a-IRR-table th.a-IRR-header {',
'    text-transform: uppercase;',
'    padding: 4px 8px !important;',
'    letter-spacing: 0.5px;',
'    line-height: 1.2 !important;',
'    height: auto !important;',
'    min-height: unset !important;',
'}',
'',
'/* Column Header Inner Text Layout Components */',
'.a-IRR-table th.a-IRR-header .a-IRR-headerLabel {',
'    padding: 2px 0 !important;',
'    line-height: 1.1 !important;',
'    min-height: unset !important;',
'    height: auto !important;',
'}',
'',
'/* Interactive Column Header Sort Trigger Buttons */',
'.a-IRR-table th.a-IRR-header button.a-IRR-sortWidget {',
'    padding: 2px 4px !important;',
'    margin: 0 !important;',
'    height: auto !important;',
'    min-height: unset !important;',
'    line-height: 1.1 !important;',
'}',
'',
'/* Ultra Thin Standard Data Body Cells */',
'.a-IRR-table tbody td {',
'    padding: 3px 8px !important;',
'    line-height: 1.2 !important;',
'    height: auto !important;',
'}',
'',
'/* Total / Summary Aggregate Row Block Areas */',
'.a-IRR-table td.a-IRR-aggregate {',
'    padding: 3px 8px !important;',
'    line-height: 1.2 !important;',
'}',
'',
'/* ',
'.a-IRR-table:focus, ',
'.a-IRR-table td:focus, ',
'.a-IRR-header:focus {',
'    outline: none !important;',
'} */',
'',
'',
'.t-Dialog-header {',
'    background: #1a1a2e;',
'    color: #ffffff;',
'    padding: 12px 20px;',
'}',
'',
'.t-Dialog-title {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'    font-weight: 500;',
'}',
'',
'.t-Dialog-close {',
'    color: #ffffff !important;',
'}'))
,p_step_template=>2526646919027767344
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57339004640235961)
,p_plug_name=>'Category wise Revenue'
,p_static_id=>'category-wise-revenue'
,p_region_name=>'Category_wise_revenue'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    NVL(ic.itemcategoryname, ''Uncategorized'')   AS item_category,',
'    NVL(ic.itemcategorycode, ''UNCAT'')           AS item_category_code,',
'    SUM(sod.quantity1)                          AS total_qty,',
'    SUM(sod.amount)                             AS total_base_amount,',
'    ''Category: '' || NVL(ic.itemcategoryname, ''Uncategorized'')   || ',
'    '' | Value: '' || TO_CHAR(SUM(sod.amount), ''99,99,99,990.00'')     AS tooltip_custom_text_1,',
'    ''Category: '' || NVL(ic.itemcategoryname, ''Uncategorized'')   || ',
'    '' | Qty: ''   || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'')  AS tooltip_custom_text_2',
'FROM salesorder so',
'JOIN salesorderdetail sod   ON so.tno = sod.tno',
'LEFT JOIN item it            ON it.itemcode = sod.itemcode',
'LEFT JOIN itemcategory ic    ON ic.itemcategorycode = it.itemcategorycode',
'CROSS JOIN RAW_DATES ',
'WHERE so.salesorderdate BETWEEN V_START AND V_END',
'  AND (:P504_PARTY              IS NULL OR so.partycode             = :P504_PARTY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode            = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode    = :P504_SALES_EXECUTIVE)',
'GROUP BY ',
'    ic.itemcategoryname,',
'    ic.itemcategorycode',
'ORDER BY ',
'    total_base_amount DESC'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_plug_display_condition_type=>'NEVER'
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(57339082361235962)
,p_region_id=>wwv_flow_imp.id(57339004640235961)
,p_chart_type=>'combo'
,p_title=>'Category wise Revenue'
,p_height=>'400'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'slideToRight'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'smooth'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_time_axis_type=>'auto'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    const apexColors = [',
'        "#A9D08E", "#92BFE7", "#D389C9", "#80CBC4", "#F8CBAD",',
'        "#F9E79F", "#C5CAE9", "#F5CBA7", "#F4B084"',
'    ];',
'    ',
'    options.dataFilter = function(data) {',
'        if (data.series && data.series[0] && data.series[0].items) {',
'            data.series[0].items.forEach(function(item, index) {',
'                item.color = apexColors[index % apexColors.length];',
'            });',
'        }',
'        ',
'        console.log(''Colors Applied to Items:'', data.series[0].items);',
'        return data;',
'    };',
'',
'',
'    console.log(options);    ',
'    return options;',
'}'))
,p_automatic_refresh_interval=>300
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(57339113210235963)
,p_chart_id=>wwv_flow_imp.id(57339082361235962)
,p_static_id=>'item-category-by-amount'
,p_js_static_id=>'Series1'
,p_seq=>10
,p_name=>'ITEM CATEGORY BY AMOUNT'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTAL_BASE_AMOUNT'
,p_items_label_column_name=>'ITEM_CATEGORY'
,p_items_short_desc_column_name=>'TOOLTIP_CUSTOM_TEXT_1'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_css_classes=>'font-size:14px;color:#1A237E;'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:170:P170_ITEMCATEGORY,P170_FROMDATE,P170_ITEM,P170_PARTY,P170_TODATE,P170_CALLED_FROM_PAGE_NO:&ITEM_CATEGORY_CODE.,&P504_FROMDATE.,&P504_ITEM_NAME.,&P504_PARTY.,&P504_TODATE.,504'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(57455796618245739)
,p_chart_id=>wwv_flow_imp.id(57339082361235962)
,p_static_id=>'item-category-by-qty'
,p_js_static_id=>'Series2'
,p_seq=>20
,p_name=>'ITEM CATEGORY BY QTY'
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'TOTAL_QTY'
,p_group_name_column_name=>'TOTAL_QTY'
,p_group_short_desc_column_name=>'ITEM_CATEGORY'
,p_items_label_column_name=>'ITEM_CATEGORY'
,p_items_short_desc_column_name=>'TOOLTIP_CUSTOM_TEXT_2'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'diamond'
,p_assigned_to_y2=>'on'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:170:P170_FROMDATE,P170_TODATE,P170_ITEMCATEGORY,P170_CALLED_FROM_PAGE_NO,P170_PARTY:&P504_FROMDATE.,&P504_TODATE.,&ITEM_CATEGORY_CODE.,P504,&P504_PARTY.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(57339276659235964)
,p_chart_id=>wwv_flow_imp.id(57339082361235962)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'thousand'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(57339387290235965)
,p_chart_id=>wwv_flow_imp.id(57339082361235962)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_position=>'bottom'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(57453606277245717)
,p_chart_id=>wwv_flow_imp.id(57339082361235962)
,p_static_id=>'y-2'
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(58024591259638662)
,p_plug_name=>'Category wise Revenue'
,p_static_id=>'category-wise-revenue-2'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(58024696262638663)
,p_region_id=>wwv_flow_imp.id(58024591259638662)
,p_chart_type=>'combo'
,p_title=>'Category wise Revenue'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    const apexColors = [',
'        "#A9D08E", "#92BFE7", "#D389C9", "#80CBC4", "#F8CBAD",',
'        "#F9E79F", "#C5CAE9", "#F5CBA7", "#F4B084"',
'    ];',
'    ',
'    options.dataFilter = function(data) {',
'        if (data.series && data.series[0] && data.series[0].items) {',
'            data.series[0].items.forEach(function(item, index) {',
'                item.color = apexColors[index % apexColors.length];',
'            });',
'        }',
'        ',
'        console.log(''Colors Applied to Items:'', data.series[0].items);',
'        return data;',
'    };',
'',
'    console.log(options);    ',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(58024761336638664)
,p_chart_id=>wwv_flow_imp.id(58024696262638663)
,p_static_id=>'by-amount'
,p_seq=>10
,p_name=>'by Amount'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')    AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    NVL(ic.itemcategoryname, ''Uncategorized'') AS item_category,',
'    NVL(ic.itemcategorycode, ''UNCAT'')         AS item_category_code,',
'    SUM(sod.amount)                           AS total_base_amount,',
'    ''Category: '' || NVL(ic.itemcategoryname, ''Uncategorized'') ||',
'    '' | Value: '' || TO_CHAR(SUM(sod.amount),    ''99,99,99,990.00'') ||',
'    '' | Qty: ''   || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'') AS tooltip_custom_text_1',
'FROM salesorder so',
'JOIN salesorderdetail sod  ON so.tno = sod.tno',
'LEFT JOIN item it           ON it.itemcode = sod.itemcode',
'LEFT JOIN itemcategory ic   ON ic.itemcategorycode = it.itemcategorycode',
'CROSS JOIN RAW_DATES',
'WHERE so.salesorderdate BETWEEN V_START AND V_END',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR ic.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    ic.itemcategoryname,',
'    ic.itemcategorycode',
'ORDER BY',
'    SUM(sod.amount) DESC'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTAL_BASE_AMOUNT'
,p_items_label_column_name=>'ITEM_CATEGORY'
,p_items_short_desc_column_name=>'TOOLTIP_CUSTOM_TEXT_1'
,p_color=>'#a9d08e'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,P380_ITEM_CATEGORY:&P504_FROMDATE.,&P504_TODATE.,&P504_PARTY.,&P504_ITEM_NAME.,&P504_ITEM_SPECIF'
||'ICATION.,&P504_SALES_EXECUTIVE.,CATEGORY_WISE_AMOUNT,&ITEM_CATEGORY_CODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(58361457163166417)
,p_chart_id=>wwv_flow_imp.id(58024696262638663)
,p_static_id=>'by-qty'
,p_seq=>20
,p_name=>'by Qty'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')    AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    NVL(ic.itemcategoryname, ''Uncategorized'') AS item_category,',
'    NVL(ic.itemcategorycode, ''UNCAT'')         AS item_category_code,',
'    SUM(sod.quantity1)                        AS total_qty,',
'    ''Category: '' || NVL(ic.itemcategoryname, ''Uncategorized'') ||',
'    '' | Value: '' || TO_CHAR(SUM(sod.amount),    ''99,99,99,990.00'') ||',
'    '' | Qty: ''   || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'') AS tooltip_custom_text_1',
'FROM salesorder so',
'JOIN salesorderdetail sod  ON so.tno = sod.tno',
'LEFT JOIN item it           ON it.itemcode = sod.itemcode',
'LEFT JOIN itemcategory ic   ON ic.itemcategorycode = it.itemcategorycode',
'CROSS JOIN RAW_DATES',
'WHERE so.salesorderdate BETWEEN V_START AND V_END',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR ic.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    ic.itemcategoryname,',
'    ic.itemcategorycode',
'ORDER BY',
'    total_qty DESC'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_series_type=>'line'
,p_items_value_column_name=>'TOTAL_QTY'
,p_items_label_column_name=>'ITEM_CATEGORY'
,p_items_short_desc_column_name=>'TOOLTIP_CUSTOM_TEXT_1'
,p_color=>'#5856d6'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.::P380_FROMDATE,P380_TODATE,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY:&P504_FROMDATE.,&P504_TODATE.,&P504_ITEM_NAME.,&P504_ITEM_SPECIFICATION.,&ITEM_CATEGORY_COD'
||'E.,&P504_SALES_EXECUTIVE.,CATEGORY_WISE_QTY'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(58024884657638665)
,p_chart_id=>wwv_flow_imp.id(58024696262638663)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(58024982282638666)
,p_chart_id=>wwv_flow_imp.id(58024696262638663)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'thousand'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(59866301689688962)
,p_name=>'Customer Check'
,p_static_id=>'customer-check'
,p_region_name=>'S_CUSTOMER_CHECK'
,p_parent_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_template=>4072358936313175081
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH PAST_ORDERS AS (',
'    SELECT ',
'        partycode, ',
'        MIN(salesorderdate) AS first_order_date',
'    FROM salesorder',
'    GROUP BY partycode',
')',
'SELECT ',
'    rownum,',
'    order_month,',
'    partycode,',
'    customer_name,',
'    total_quantity,',
'    customer_type,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 380,',
'                p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_REGION_TO_DISPLAY'',',
'                p_values => ''01-01-1900'' || '','' ||',
'                            TO_CHAR(SYSDATE, ''DD-MM-YYYY'') || '','' ||',
'                            partycode || '','' ||',
'                            ''CUSTOMER_WISE_ORDERS''',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS customer_link',
'FROM (',
'    SELECT ',
'        TO_CHAR(so.salesorderdate, ''YYYY-MM'')  AS order_month,',
'        so.partycode                            AS partycode,',
'        p.partyname                             AS customer_name,',
'        SUM(sod.quantity1)                      AS total_quantity,',
'        CASE ',
'            WHEN TO_CHAR(po.first_order_date, ''YYYYMM'') = TO_CHAR(so.salesorderdate, ''YYYYMM'') ',
'            THEN ''New Customer''',
'            ELSE ''Returning Customer''',
'        END AS customer_type',
'    FROM salesorder so',
'    JOIN salesorderdetail sod ON so.tno = sod.tno',
'    JOIN item it              ON sod.itemcode = it.itemcode',
'    JOIN party p              ON so.partycode = p.partycode',
'    LEFT JOIN PAST_ORDERS po  ON so.partycode = po.partycode',
'    WHERE (:P504_REPORTS_MONTH    IS NULL OR TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH)',
'      AND (:P504_PARTY            IS NULL OR so.partycode              = :P504_PARTY)',
'      AND (:P504_ITEM_CATEGORY    IS NULL OR it.itemcategorycode       = :P504_ITEM_CATEGORY)',
'      AND (:P504_ITEM_NAME        IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'      AND (:P504_SALES_EXECUTIVE  IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'    GROUP BY',
'        TO_CHAR(so.salesorderdate, ''YYYY-MM''),',
'        TO_CHAR(so.salesorderdate, ''YYYYMM''),',
'        so.partycode,',
'        p.partyname,',
'        TO_CHAR(po.first_order_date, ''YYYYMM'')',
'    ORDER BY',
'        customer_type ASC,',
'        total_quantity DESC',
') x'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,P504_REPORTS_MONTH'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61883273199557848)
,p_query_column_id=>7
,p_column_alias=>'CUSTOMER_LINK'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59866682054688966)
,p_query_column_id=>4
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Customer Name'
,p_column_html_expression=>'<a href="#CUSTOMER_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#CUSTOMER_NAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60056571719281117)
,p_query_column_id=>6
,p_column_alias=>'CUSTOMER_TYPE'
,p_column_display_sequence=>50
,p_column_heading=>'Customer Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60057285090281124)
,p_query_column_id=>2
,p_column_alias=>'ORDER_MONTH'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61883174879557847)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60057315045281125)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>30
,p_column_heading=>'SR No'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59866553545688965)
,p_query_column_id=>5
,p_column_alias=>'TOTAL_QUANTITY'
,p_column_display_sequence=>60
,p_column_heading=>'Total Quantity'
,p_column_format=>'99G99G99G99G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(55923736825330866)
,p_name=>'New Card View Dashboard  for (DEBUGING)'
,p_static_id=>'new-card-view-dashboard-for-debuging'
,p_region_name=>'Card_Dashboard_Debug'
,p_template=>2072724515482255512
,p_display_sequence=>90
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'') AS V_END',
'    FROM DUAL',
'),',
'DATE_PARAMS AS (',
'    SELECT ',
'        V_START AS START_DATE,',
'        V_END AS END_DATE,',
'        CASE ',
'            -- For MONTH (1st to Last day)',
'            WHEN TRUNC(V_START, ''MM'') = V_START ',
'                 AND LAST_DAY(V_END) = V_END ',
'                 AND MONTHS_BETWEEN(V_END + 1, V_START) = 1 ',
'            THEN ADD_MONTHS(TRUNC(V_START, ''MM''), -1)',
'            ',
'            -- For QUARTER (1st to Last day, 3 months)',
'            WHEN TRUNC(V_START, ''Q'') = V_START ',
'                 AND LAST_DAY(V_END) = V_END ',
'                 AND MONTHS_BETWEEN(V_END + 1, V_START) = 3 ',
'            THEN ADD_MONTHS(TRUNC(V_START, ''Q''), -3)',
'            ',
'            -- For FY (01-Apr to 31-Mar, 12 months)',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04'' ',
'                 AND TO_CHAR(V_END, ''MM'') = ''03'' ',
'                 AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 ',
'            THEN ADD_MONTHS(V_START, -12)',
'            ',
'            -- Default (for TODAY, YESTERDAY, LAST 7 DAYS, LAST 30 DAYS)',
'            ELSE V_START - (V_END - V_START + 1)',
'        END AS PREV_START_DATE,',
'        ',
'        CASE ',
'            -- For MONTH',
'            WHEN TRUNC(V_START, ''MM'') = V_START ',
'                 AND LAST_DAY(V_END) = V_END ',
'                 AND MONTHS_BETWEEN(V_END + 1, V_START) = 1 ',
'            THEN LAST_DAY(ADD_MONTHS(V_END, -1))',
'            ',
'            -- For QUARTER',
'            WHEN TRUNC(V_START, ''Q'') = V_START ',
'                 AND LAST_DAY(V_END) = V_END ',
'                 AND MONTHS_BETWEEN(V_END + 1, V_START) = 3 ',
'            THEN LAST_DAY(ADD_MONTHS(V_END, -3))',
'            ',
'            -- For FY',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04'' ',
'                 AND TO_CHAR(V_END, ''MM'') = ''03'' ',
'                 AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 ',
'            THEN ADD_MONTHS(V_END, -12)',
'            ',
'            -- Default',
'            ELSE V_START - 1',
'        END AS PREV_END_DATE,',
'        ',
'        CASE ',
'            WHEN V_END - V_START = 0 THEN ''yesterday''',
'            WHEN V_END - V_START = 6 THEN ''last 7 days''',
'            WHEN V_END - V_START = 29 THEN ''last 30 days''',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END AND MONTHS_BETWEEN(V_END + 1, V_START) = 1 THEN ''last month''',
'            WHEN TRUNC(V_START, ''Q'') = V_START AND LAST_DAY(V_END) = V_END AND MONTHS_BETWEEN(V_END + 1, V_START) = 3 THEN ''last quarter''',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04'' AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ''last FY''',
'            ELSE ''previous period''',
'        END AS PERIOD_LABEL',
'    FROM RAW_DATES',
'),',
'CHART_RAW_DATA AS (',
'    SELECT ',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0 ',
'            THEN ''00:00-12:00''',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1 ',
'            THEN ''12:00-23:59''',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 ',
'            THEN TO_CHAR(V.SALESORDERDATE, ''DD-Mon'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 ',
'            THEN ''Week '' || TO_CHAR(V.SALESORDERDATE, ''W'')',
'            ELSE TO_CHAR(V.SALESORDERDATE, ''Mon-YY'')',
'        END AS LABEL_TEXT,',
'        ',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0 THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 0',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1 THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 1',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TRUNC(V.SALESORDERDATE, ''DD'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN TRUNC(V.SALESORDERDATE, ''W'')',
'            ELSE TRUNC(V.SALESORDERDATE, ''MM'')',
'        END AS SORT_DATE,',
'        ',
'        COUNT(DISTINCT V.PARTYCODE) AS MTH_CLIENTS,',
'        COUNT(DISTINCT V.SALES_ORDER_TNO) AS MTH_ORDERS,',
'        SUM(V.ORDERED_QTY) AS MTH_ORDERED_QTY,',
'        SUM(V.DISPATCHED_QTY) AS MTH_DISPATCHED_QTY,',
'        SUM(V.BASE_AMOUNT) AS MTH_AMOUNT,',
'        SUM(V.LOADINGADVICE_QTY) AS MTH_LOADING_QTY,',
'        SUM(V.PENDING_LOADING_QTY) AS MTH_PENDING_LOADING_QTY,',
'        SUM(V.CANCELLED_QTY) AS MTH_CANCELLED_QTY',
'    FROM V_DASHBOARD_SALES_SUMMARY V',
'    CROSS JOIN DATE_PARAMS DP',
'    WHERE V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE',
'    GROUP BY ',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0 THEN ''00:00-12:00''',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1 THEN ''12:00-23:59''',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TO_CHAR(V.SALESORDERDATE, ''DD-Mon'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN ''Week '' || TO_CHAR(V.SALESORDERDATE, ''W'')',
'            ELSE TO_CHAR(V.SALESORDERDATE, ''Mon-YY'')',
'        END,',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0 THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 0',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1 THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 1',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TRUNC(V.SALESORDERDATE, ''DD'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN TRUNC(V.SALESORDERDATE, ''W'')',
'            ELSE TRUNC(V.SALESORDERDATE, ''MM'')',
'        END',
'),CHART_STRINGS AS (',
'    SELECT ',
'        COALESCE(LISTAGG(LABEL_TEXT, '','') WITHIN GROUP (ORDER BY LABEL_TEXT), '''') AS FINAL_LABELS,',
'        COALESCE(LISTAGG(MTH_CLIENTS, '','') WITHIN GROUP (ORDER BY LABEL_TEXT), '''') AS DATA_CLIENTS,',
'        COALESCE(LISTAGG(MTH_ORDERS, '','') WITHIN GROUP (ORDER BY LABEL_TEXT), '''') AS DATA_ORDERS',
'    FROM CHART_RAW_DATA',
')',
'SELECT * FROM CHART_RAW_DATA',
'-- -- ),',
'-- -- CHART_STRINGS AS (',
'-- --     SELECT ',
'-- --         COALESCE(LISTAGG(LABEL_TEXT, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS FINAL_LABELS,',
'-- --         COALESCE(LISTAGG(MTH_CLIENTS, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_CLIENTS,',
'-- --         COALESCE(LISTAGG(MTH_ORDERS, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_ORDERS,',
'-- --         COALESCE(LISTAGG(MTH_ORDERED_QTY, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_ORDERED_QTY,',
'-- --         COALESCE(LISTAGG(MTH_DISPATCHED_QTY, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_DISPATCHED_QTY,',
'-- --         COALESCE(LISTAGG(MTH_PENDING_QTY, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_PENDING_QTY,',
'-- --         COALESCE(LISTAGG(MTH_AMOUNT, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_AMOUNT,',
'-- --         COALESCE(LISTAGG(MTH_LOADING_QTY, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_LOADING_QTY,',
'-- --         COALESCE(LISTAGG(MTH_PENDING_LOADING_QTY, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_PENDING_LOADING_QTY,',
'-- --         COALESCE(LISTAGG(MTH_CANCELLED_QTY, '','') WITHIN GROUP (ORDER BY SORT_DATE), '''') AS DATA_CANCELLED_QTY',
'-- --     FROM CHART_RAW_DATA',
'-- )',
'-- SELECT * FROM RAW_DATES',
'-- SELECT * FROM DATE_PARAMS',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.set_region_column_width(
 p_id=>wwv_flow_imp.id(55923736825330866)
,p_plug_column_width=>'style="margin-bottom: 10px;"'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56818197955959563)
,p_query_column_id=>1
,p_column_alias=>'LABEL_TEXT'
,p_column_display_sequence=>10
,p_column_heading=>'Label Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56843962973083218)
,p_query_column_id=>7
,p_column_alias=>'MTH_AMOUNT'
,p_column_display_sequence=>60
,p_column_heading=>'Mth Amount'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56844352437083222)
,p_query_column_id=>10
,p_column_alias=>'MTH_CANCELLED_QTY'
,p_column_display_sequence=>100
,p_column_heading=>'Mth Cancelled Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56818268160959564)
,p_query_column_id=>3
,p_column_alias=>'MTH_CLIENTS'
,p_column_display_sequence=>20
,p_column_heading=>'Mth Clients'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56843819280083217)
,p_query_column_id=>6
,p_column_alias=>'MTH_DISPATCHED_QTY'
,p_column_display_sequence=>50
,p_column_heading=>'Mth Dispatched Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56844162367083220)
,p_query_column_id=>8
,p_column_alias=>'MTH_LOADING_QTY'
,p_column_display_sequence=>80
,p_column_heading=>'Mth Loading Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56818498960959566)
,p_query_column_id=>5
,p_column_alias=>'MTH_ORDERED_QTY'
,p_column_display_sequence=>40
,p_column_heading=>'Mth Ordered Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56818407870959565)
,p_query_column_id=>4
,p_column_alias=>'MTH_ORDERS'
,p_column_display_sequence=>30
,p_column_heading=>'Mth Orders'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56844307698083221)
,p_query_column_id=>9
,p_column_alias=>'MTH_PENDING_LOADING_QTY'
,p_column_display_sequence=>90
,p_column_heading=>'Mth Pending Loading Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(56844025694083219)
,p_query_column_id=>2
,p_column_alias=>'SORT_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Sort Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(56847184199083250)
,p_name=>'New Card View Dashboard (Query based)'
,p_static_id=>'new-card-view-dashboard-query-based'
,p_template=>wwv_flow_imp.id(574763864839963122)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:iboss-disable-chart:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'    FROM DUAL',
')',
',DATE_PARAMS AS (',
'    SELECT ',
'        V_START AS START_DATE,',
'        V_END AS END_DATE,',
'        CASE ',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN ADD_MONTHS(TRUNC(V_START, ''MM''), -1)',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN ADD_MONTHS(TRUNC(V_START, ''Q''), -3)',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ADD_MONTHS(V_START, -12)',
'            ELSE V_START - (V_END - V_START + 1)',
'        END AS PREV_START_DATE,',
'        CASE ',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN LAST_DAY(ADD_MONTHS(V_END, -1))',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN LAST_DAY(ADD_MONTHS(V_END, -3))',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ADD_MONTHS(V_END, -12)',
'            ELSE V_START - 1',
'        END AS PREV_END_DATE,',
'        CASE ',
'            WHEN V_END - V_START = 0    THEN '' yesterday''',
'            WHEN V_END - V_START = 6    THEN '' last 7 days''',
'            WHEN V_END - V_START = 29   THEN '' last 30 days''',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN '' last month''',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN '' last quarter''',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN '' last FY''',
'            ELSE '' previous period''',
'        END AS PERIOD_LABEL',
'    FROM RAW_DATES',
')',
'-- Step 1: Parse multi-select colon-delimited string items once up-front into temporary subqueries',
',PARSED_FILTERS AS (',
'    SELECT',
'        CAST(APEX_STRING.SPLIT(:P504_PARTY, '':'')                AS APEX_T_VARCHAR2) AS ARR_PARTY,',
'        CAST(APEX_STRING.SPLIT(:P504_ITEM_CATEGORY, '':'')        AS APEX_T_VARCHAR2) AS ARR_CAT,',
'        CAST(APEX_STRING.SPLIT(:P504_ITEM_NAME, '':'')            AS APEX_T_VARCHAR2) AS ARR_ITEM,',
'        CAST(APEX_STRING.SPLIT(:P504_ITEM_SPECIFICATION, '':'')   AS APEX_T_VARCHAR2) AS ARR_SPEC,',
'        CAST(APEX_STRING.SPLIT(:P504_SALES_EXECUTIVE, '':'')      AS APEX_T_VARCHAR2) AS ARR_EXEC',
'    FROM DUAL',
')',
'-- Step 2: Aggregate Despatch Advice transactional data globally',
',AGG_DESPATCH AS (',
'    SELECT',
'        SUM(CASE WHEN DA.DESPATCHADVICEDATE BETWEEN DP.START_DATE       AND DP.END_DATE         THEN DAD.QUANTITY1 ELSE 0 END) AS CURR_DISP_QTY,',
'        SUM(CASE WHEN DA.DESPATCHADVICEDATE BETWEEN DP.PREV_START_DATE  AND DP.PREV_END_DATE    THEN DAD.QUANTITY1 ELSE 0 END) AS LAG_DISP_QTY',
'    FROM DESPATCHADVICEDETAIL DAD',
'    JOIN DESPATCHADVICE DA ON DAD.TNO = DA.TNO',
'    CROSS JOIN DATE_PARAMS DP',
'    CROSS JOIN PARSED_FILTERS F',
'    WHERE (:P504_PARTY IS NULL              OR DA.PARTYCODE MEMBER OF F.ARR_PARTY)',
'      AND (:P504_ITEM_NAME IS NULL          OR DAD.ITEMCODE MEMBER OF F.ARR_ITEM)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR DAD.ITEMSPECIFICATIONCODE MEMBER OF F.ARR_SPEC)',
'      AND (:P504_ITEM_CATEGORY IS NULL      OR EXISTS (',
'              SELECT 1 FROM V_ITEM_DETAILS VI ',
'              WHERE VI.ITEMCODE = DAD.ITEMCODE AND VI.ITEMCATEGORYCODE MEMBER OF F.ARR_CAT',
'          ))',
'      AND (:P504_SALES_EXECUTIVE IS NULL OR EXISTS (',
'          SELECT 1 FROM SALESORDER SO ',
'          WHERE SO.TNO = DA.REFERENCETNO AND SO.SALESEXECUTIVECODE MEMBER OF F.ARR_EXEC',
'      ))',
')',
'-- Step 3: Aggregate Loading Advice transactional data globally (Fixed the DA alias bug here)',
',AGG_LOADING AS (',
'    SELECT',
'        SUM(CASE WHEN LA.LOADINGADVICEDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN LAD.QUANTITY1 ELSE 0 END) AS CURR_LOAD_QTY,',
'        SUM(CASE WHEN LA.LOADINGADVICEDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN LAD.QUANTITY1 ELSE 0 END) AS LAG_LOAD_QTY',
'    FROM LOADINGADVICEDETAIL LAD',
'    JOIN LOADINGADVICE LA ON LAD.TNO = LA.TNO',
'    CROSS JOIN DATE_PARAMS DP',
'    CROSS JOIN PARSED_FILTERS F',
'    WHERE (:P504_PARTY IS NULL OR LA.SUPPLIERCODE MEMBER OF F.ARR_PARTY)',
'      AND (:P504_ITEM_NAME IS NULL OR LAD.ITEMCODE MEMBER OF F.ARR_ITEM)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR LAD.ITEMSPECIFICATIONCODE MEMBER OF F.ARR_SPEC)',
'      AND (:P504_ITEM_CATEGORY IS NULL OR EXISTS (',
'          SELECT 1 FROM V_ITEM_DETAILS VI ',
'          WHERE VI.ITEMCODE = LAD.ITEMCODE AND VI.ITEMCATEGORYCODE MEMBER OF F.ARR_CAT',
'      ))',
'      AND (:P504_SALES_EXECUTIVE IS NULL OR EXISTS (',
'          SELECT 1 FROM SALESORDER SO ',
'          WHERE SO.TNO = LA.SALESORDERTNO AND SO.SALESEXECUTIVECODE MEMBER OF F.ARR_EXEC',
'      ))',
')',
'-- Step 4: Compute pre-aggregated totals for dispatch and loading grouped cleanly by Sales Order item metrics ',
',SO_DISP_REDUCE AS (',
'    SELECT DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE, DA.REFERENCETNO, SUM(DAD.QUANTITY1) AS SUM_QTY',
'    FROM DESPATCHADVICEDETAIL DAD ',
'    JOIN DESPATCHADVICE DA ON DAD.TNO = DA.TNO ',
'    GROUP BY DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE, DA.REFERENCETNO',
')',
',SO_LOAD_REDUCE AS (',
'    SELECT LAD.ITEMCODE, LAD.ITEMSPECIFICATIONCODE, LA.SALESORDERTNO, SUM(LAD.QUANTITY1) AS SUM_QTY',
'    FROM LOADINGADVICEDETAIL LAD ',
'    JOIN LOADINGADVICE LA ON LAD.TNO = LA.TNO ',
'    GROUP BY LAD.ITEMCODE, LAD.ITEMSPECIFICATIONCODE, LA.SALESORDERTNO',
')',
'-- Step 5: Execute Single-Pass Unified Evaluation of all Sales Order related KPI data matrix elements',
',AGG_SO AS (',
'    SELECT',
'        COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SO.PARTYCODE END) AS CURR_CLIENTS,',
'        COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SO.PARTYCODE END) AS LAG_CLIENTS,',
'        ',
'        COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SO.TNO END) AS CURR_ORDERS,',
'        COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SO.TNO END) AS LAG_ORDERS,',
'        ',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SOD.QUANTITY1 ELSE 0 END) AS CURR_SO_QTY,',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SOD.QUANTITY1 ELSE 0 END) AS LAG_SO_QTY,',
'        ',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SOD.AMOUNT ELSE 0 END) AS CURR_AMT,',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SOD.AMOUNT ELSE 0 END) AS LAG_AMT,',
'        ',
'        -- Pending Dispatch calculations combined cleanly via inline aggregated join maps',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE ',
'                 THEN GREATEST(SOD.QUANTITY1 - COALESCE(DR.SUM_QTY, 0), 0) ELSE 0 END) AS CURR_PEND_DISP,',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE ',
'                 THEN GREATEST(SOD.QUANTITY1 - COALESCE(DR.SUM_QTY, 0), 0) ELSE 0 END) AS LAG_PEND_DISP,',
'                 ',
'        -- Pending Loading calculations combined cleanly via inline aggregated join maps',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE ',
'                 THEN GREATEST(SOD.QUANTITY1 - COALESCE(LR.SUM_QTY, 0) - COALESCE(DR.SUM_QTY, 0), 0) ELSE 0 END) AS CURR_PEND_LOAD,',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE ',
'                 THEN GREATEST(SOD.QUANTITY1 - COALESCE(LR.SUM_QTY, 0) - COALESCE(DR.SUM_QTY, 0), 0) ELSE 0 END) AS LAG_PEND_LOAD,',
'                 ',
'        -- Cancelled Quantity calculations combined cleanly',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE AND GETDOCUMENTSTATUSCODE(''SALESORDER'', SO.TNO) = ''SHORTCLOSED''',
'                 THEN GREATEST(SOD.QUANTITY1 - COALESCE(DR.SUM_QTY, 0) - COALESCE(LR.SUM_QTY, 0), 0) ELSE 0 END) AS CURR_CANC_QTY,',
'        SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE AND GETDOCUMENTSTATUSCODE(''SALESORDER'', SO.TNO) = ''SHORTCLOSED''',
'                 THEN GREATEST(SOD.QUANTITY1 - COALESCE(DR.SUM_QTY, 0) - COALESCE(LR.SUM_QTY, 0), 0) ELSE 0 END) AS LAG_CANC_QTY',
'                 ',
'    FROM SALESORDER SO',
'    JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'    CROSS JOIN DATE_PARAMS DP',
'    CROSS JOIN PARSED_FILTERS F',
'    LEFT JOIN SO_DISP_REDUCE DR ON DR.REFERENCETNO = SO.TNO AND DR.ITEMCODE = SOD.ITEMCODE AND DR.ITEMSPECIFICATIONCODE = SOD.ITEMSPECIFICATIONCODE',
'    LEFT JOIN SO_LOAD_REDUCE LR ON LR.SALESORDERTNO = SO.TNO AND LR.ITEMCODE = SOD.ITEMCODE AND LR.ITEMSPECIFICATIONCODE = SOD.ITEMSPECIFICATIONCODE',
'    WHERE (:P504_PARTY IS NULL OR SO.PARTYCODE MEMBER OF F.ARR_PARTY)',
'      AND (:P504_ITEM_NAME IS NULL OR SOD.ITEMCODE MEMBER OF F.ARR_ITEM)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE MEMBER OF F.ARR_SPEC)',
'      AND (:P504_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE MEMBER OF F.ARR_EXEC)',
'      AND (:P504_ITEM_CATEGORY IS NULL OR EXISTS (',
'          SELECT 1 FROM V_ITEM_DETAILS VI ',
'          WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE MEMBER OF F.ARR_CAT',
'      ))',
'),',
'-- Step 6: Map structural output presentation logic centrally using a single control layout cross matrix',
'KPI_MATRIX AS (',
'    SELECT ',
'        A.SEQ, A.CARD_TITLE, A.CARD_ICON, A.BACKGROUND_COLOR, A.BORDER_COLOR, A.TEXT_COLOR, A.CARD_PRE_TEXT, A.CARD_POST_TEXT,',
'        CASE ',
'            WHEN A.SEQ = 1 THEN GET_FORMATED_SHORT_VALUE(S.CURR_CLIENTS)--TO_CHAR(S.CURR_CLIENTS)',
'            WHEN A.SEQ = 2 THEN GET_FORMATED_SHORT_VALUE(S.CURR_ORDERS)--TO_CHAR(S.CURR_ORDERS)',
'            WHEN A.SEQ = 3 THEN GET_FORMATED_SHORT_VALUE(S.CURR_SO_QTY,2)--TO_CHAR(S.CURR_SO_QTY, ''999,999,990.999'')',
'            WHEN A.SEQ = 4 THEN GET_FORMATED_SHORT_VALUE(D.CURR_DISP_QTY,2)--TO_CHAR(D.CURR_DISP_QTY, ''999,999,990.999'')',
'            WHEN A.SEQ = 5 THEN GET_FORMATED_SHORT_VALUE(S.CURR_PEND_DISP,2)--TO_CHAR(S.CURR_PEND_DISP, ''999,999,990.999'')',
'            WHEN A.SEQ = 6 THEN GET_FORMATED_SHORT_VALUE(S.CURR_AMT,2)',
'                            -- Billions',
'                            -- CASE',
'                            -- WHEN ABS(S.CURR_AMT) >= 1000000000 THEN ',
'                            --     TO_CHAR(S.CURR_AMT / 1000000000, ''99G990D00'') || ''B''',
'                            -- -- Millions',
'                            -- WHEN ABS(S.CURR_AMT) >= 1000000 THEN ',
'                            --     TO_CHAR(S.CURR_AMT / 1000000, ''99G990D00'') || ''M''',
'                            -- -- Thousands',
'                            -- WHEN ABS(S.CURR_AMT) >= 1000 THEN ',
'                            --     TO_CHAR(S.CURR_AMT / 1000, ''99G990D00'') || ''K''',
'                            -- -- Less than 1000 (No change)',
'                            -- ELSE ',
'                            --     TO_CHAR(S.CURR_AMT, ''99G990D00'')',
'                            -- END--TO_CHAR(S.CURR_AMT, ''99G99G99G99G990D00'')',
'            WHEN A.SEQ = 7 THEN GET_FORMATED_SHORT_VALUE(L.CURR_LOAD_QTY,2)---TO_CHAR(L.CURR_LOAD_QTY, ''999,999,990.999'')',
'            WHEN A.SEQ = 8 THEN GET_FORMATED_SHORT_VALUE(S.CURR_PEND_LOAD,2)--TO_CHAR(S.CURR_PEND_LOAD, ''999,999,990.999'')',
'            WHEN A.SEQ = 9 THEN GET_FORMATED_SHORT_VALUE(S.CURR_CANC_QTY,2)--TO_CHAR(S.CURR_CANC_QTY, ''999,999,990.999'')',
'        END AS CARD_TEXT,',
'        CASE ',
'            WHEN A.SEQ = 1 THEN S.CURR_CLIENTS-S.LAG_CLIENTS WHEN A.SEQ = 2 THEN S.CURR_ORDERS-S.LAG_ORDERS',
'            WHEN A.SEQ = 3 THEN S.CURR_SO_QTY-S.LAG_SO_QTY     WHEN A.SEQ = 4 THEN D.CURR_DISP_QTY-D.LAG_DISP_QTY',
'            WHEN A.SEQ = 5 THEN S.CURR_PEND_DISP-S.LAG_PEND_DISP WHEN A.SEQ = 6 THEN S.CURR_AMT-S.LAG_AMT',
'            WHEN A.SEQ = 7 THEN L.CURR_LOAD_QTY-L.LAG_LOAD_QTY   WHEN A.SEQ = 8 THEN S.CURR_PEND_LOAD-S.LAG_PEND_LOAD',
'            ELSE S.CURR_CANC_QTY-S.LAG_CANC_QTY',
'        END AS NET_DELTA,',
'        CASE ',
'            WHEN A.SEQ = 1 THEN S.LAG_CLIENTS WHEN A.SEQ = 2 THEN S.LAG_ORDERS',
'            WHEN A.SEQ = 3 THEN S.LAG_SO_QTY     WHEN A.SEQ = 4 THEN D.LAG_DISP_QTY',
'            WHEN A.SEQ = 5 THEN S.LAG_PEND_DISP WHEN A.SEQ = 6 THEN S.LAG_AMT',
'            WHEN A.SEQ = 7 THEN L.LAG_LOAD_QTY   WHEN A.SEQ = 8 THEN S.LAG_PEND_LOAD',
'            ELSE S.LAG_CANC_QTY',
'        END AS LAG_VALUE,',
'        CASE ',
'            WHEN A.SEQ = 1 AND CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_CLIENTS''',
'                )',
'            WHEN A.SEQ = 2 AND CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_ORDERS''',
'                )',
'            WHEN A.SEQ = 3 AND CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_ORDERED_QTY''',
'                )',
'            WHEN A.SEQ = 4 AND CHECK_MODULE_VIEW_ACCESS(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_DISPATCHED_QTY''',
'                )',
'          WHEN A.SEQ = 5 AND CHECK_MODULE_VIEW_ACCESS(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_PENDING_DISPATCHED_QTY''',
'                )',
'          WHEN A.SEQ = 6 AND CHECK_MODULE_VIEW_ACCESS(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_AMOUNT''',
'                )',
'          WHEN A.SEQ = 7 AND CHECK_MODULE_VIEW_ACCESS(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_LOADINGADVICE_QTY''',
'                )',
'          WHEN A.SEQ = 8 AND CHECK_MODULE_VIEW_ACCESS(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_LOADINGADVICE_PENDING_QTY''',
'                )',
'          WHEN A.SEQ = 9 AND CHECK_MODULE_VIEW_ACCESS(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_CANCELLED_QTY''',
'                )',
'            ELSE APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':504:''||:APP_SESSION) ',
'        END AS CARD_LINK',
'    FROM AGG_SO S',
'    CROSS JOIN AGG_DESPATCH D',
'    CROSS JOIN AGG_LOADING L',
'    CROSS JOIN DATE_PARAMS DP',
'    CROSS JOIN (',
'        SELECT 1 AS SEQ,    ''Total Clients'' AS CARD_TITLE,  ''fa-users-alt'' AS CARD_ICON,    ''#E2F0D9'' AS BACKGROUND_COLOR,  ''#A9D08E'' AS BORDER_COLOR,  ''#1F4E3D'' AS TEXT_COLOR,    NULL AS CARD_PRE_TEXT,  NULL AS CARD_POST_TEXT  FROM DUAL UNION ALL',
'        SELECT 2,           ''Total Orders'',                 ''fa-shopping-cart'',             ''#e6f1fb'',                      ''#92bfe7'',                  ''#185fa5'',                  NULL,                   NULL                    FROM DUAL UNION ALL',
'        SELECT 3,           ''Total Ordered Qty'',            ''fa-cubes'',                     ''#fbeaf0'',                      ''#d389c9'',                  ''#993556'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
'        SELECT 4,           ''Total Dispatched Qty'',         ''fa-truck'',                     ''#E0F2F1'',                      ''#80CBC4'',                  ''#004D40'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
'        SELECT 5,           ''Total Pending Dispatch Qty'',   ''fa-hourglass-2'',               ''#FFF2CC'',                      ''#F8CBAD'',                  ''#7F6000'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
unistr('        SELECT 6,           ''Total Amount'',                 ''fa-money-bag'',                 ''#FEF9E7'',                      ''#F9E79F'',                  ''#7D6608'',                  ''\20B9'',                    NULL                    FROM DUAL UNION ALL'),
'        SELECT 7,           ''Dispatched Qty Out'',           ''fa-sign-out'',                  ''#E8EAF6'',                      ''#C5CAE9'',                  ''#1A237E'',                  NULL,                   NULL                    FROM DUAL UNION ALL',
'        SELECT 8,           ''Pending Qty Out'',              ''fa-pause-circle-o'',            ''#FDF2E9'',                      ''#F5CBA7'',                  ''#6E2C00'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
'        SELECT 9,           ''Cancelled Qty'',                ''fa-ban'',                       ''#FCE4D6'',                      ''#F4B084'',                  ''#C65911'',                  NULL,                   ''MT''                    FROM DUAL',
'    ) A',
')',
'SELECT ',
'    M.SEQ, M.CARD_TITLE, TRIM(M.CARD_TEXT) AS CARD_TEXT, M.CARD_POST_TEXT, M.CARD_PRE_TEXT, M.CARD_ICON, M.BACKGROUND_COLOR, M.BORDER_COLOR, M.TEXT_COLOR, M.CARD_LINK,',
'    CASE ',
'        WHEN M.LAG_VALUE = 0 AND M.NET_DELTA > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'        WHEN M.LAG_VALUE = 0 AND M.NET_DELTA = 0 THEN ''0%''',
'        ELSE CASE WHEN M.NET_DELTA > 0 THEN ''+'' ELSE '''' END || TO_CHAR(ROUND((M.NET_DELTA / M.LAG_VALUE) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL ',
'    END AS CARD_SUBTEXT,',
'    CASE WHEN M.NET_DELTA > 0 THEN ''fa-arrow-up'' WHEN M.NET_DELTA < 0 THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE ',
'        -- Structural inversion logic for negative impact fields (Pending/Cancelled color rules)',
'        WHEN M.SEQ IN (5,8,9) THEN (CASE WHEN M.NET_DELTA > 0 THEN ''#C00000'' WHEN M.NET_DELTA < 0 THEN ''#2E7D32'' ELSE ''#595959'' END)',
'        ELSE (CASE WHEN M.NET_DELTA > 0 THEN ''#2E7D32'' WHEN M.NET_DELTA < 0 THEN ''#C00000'' ELSE ''#595959'' END)',
'    END AS TREND_COLOR',
'FROM KPI_MATRIX M',
'CROSS JOIN DATE_PARAMS DP',
'ORDER BY M.SEQ;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_lazy_loading=>true
,p_query_row_template=>wwv_flow_imp.id(56225064195302226)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.set_region_column_width(
 p_id=>wwv_flow_imp.id(56847184199083250)
,p_plug_column_width=>'style="margin-bottom: 10px;"'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57105224494729266)
,p_query_column_id=>7
,p_column_alias=>'BACKGROUND_COLOR'
,p_column_display_sequence=>70
,p_column_heading=>'Background Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57334610021235917)
,p_query_column_id=>8
,p_column_alias=>'BORDER_COLOR'
,p_column_display_sequence=>80
,p_column_heading=>'Border Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57105209191729265)
,p_query_column_id=>6
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>60
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57334728164235919)
,p_query_column_id=>10
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>100
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57104924460729263)
,p_query_column_id=>4
,p_column_alias=>'CARD_POST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Post Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57105078695729264)
,p_query_column_id=>5
,p_column_alias=>'CARD_PRE_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Pre Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57334824390235920)
,p_query_column_id=>11
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>110
,p_column_heading=>'Card Subtext'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57104852836729262)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57104754613729261)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57104678779729260)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57334670770235918)
,p_query_column_id=>9
,p_column_alias=>'TEXT_COLOR'
,p_column_display_sequence=>90
,p_column_heading=>'Text Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57335038466235922)
,p_query_column_id=>13
,p_column_alias=>'TREND_COLOR'
,p_column_display_sequence=>130
,p_column_heading=>'Trend Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57334930306235921)
,p_query_column_id=>12
,p_column_alias=>'TREND_ICON'
,p_column_display_sequence=>120
,p_column_heading=>'Trend Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59863273156688932)
,p_plug_name=>'Orders by Month'
,p_static_id=>'orders-by-month'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(59863314436688933)
,p_region_id=>wwv_flow_imp.id(59863273156688932)
,p_chart_type=>'combo'
,p_title=>'Orders by Month'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(59863500980688934)
,p_chart_id=>wwv_flow_imp.id(59863314436688933)
,p_static_id=>'by-amount'
,p_seq=>10
,p_name=>'by Amount'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') AS order_month,',
'    SUM(sod.amount)                                                      AS total_amount,',
'    -- SUM(sod.quantity1)                                                   AS total_quantity,',
'    ',
'    ''Month: ''    || TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') || ',
'    '' | Amount: '' || TO_CHAR(SUM(sod.amount), ''99,99,99,990.00'')                          || ',
'    '' | Qty: ''    || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'')                       AS tooltip_amount_qty',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN item it         ON it.itemcode = sod.itemcode',
'CROSS JOIN RAW_DATES rd',
'WHERE so.salesorderdate BETWEEN rd.V_START AND rd.V_END',
'  AND (:P504_PARTY             IS NULL OR so.partycode = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR IT.itemcategorycode = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'GROUP BY ',
'    TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH''),',
'    TO_CHAR(so.salesorderdate, ''YYYYMM'') ',
'ORDER BY ',
'    TO_CHAR(so.salesorderdate, ''YYYYMM'') ASC;'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTAL_AMOUNT'
,p_items_label_column_name=>'ORDER_MONTH'
,p_items_short_desc_column_name=>'TOOLTIP_AMOUNT_QTY'
,p_color=>'#a9d08e'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_TODATE,P380_ITEM,P380_PARTY,P380_SALES_EXECUTIVE,P380_ITEMSPECIFICATION,P380_REGION_TO_DISPLAY,P380_SELECTED_MONTH:&P504_FROMDATE.,&P504_TODATE.,&P504_ITEM_NAME.,&P504_PARTY.,&P504_SALES_EXEC'
||'UTIVE.,&P504_ITEM_SPECIFICATION.,MONTH_WISE_ORDERS,&ORDER_MONTH.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(59863536017688935)
,p_chart_id=>wwv_flow_imp.id(59863314436688933)
,p_static_id=>'by-qty'
,p_seq=>20
,p_name=>'by Qty'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') AS order_month,',
'    -- SUM(sod.amount)                                                      AS total_amount,',
'    SUM(sod.quantity1)                                                   AS total_quantity,',
'    ',
'    ''Month: ''    || TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') || ',
'    '' | Amount: '' || TO_CHAR(SUM(sod.amount), ''99,99,99,990.00'')                          || ',
'    '' | Qty: ''    || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'')                       AS tooltip_amount_qty',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN item it         ON it.itemcode = sod.itemcode',
'CROSS JOIN RAW_DATES rd',
'WHERE so.salesorderdate BETWEEN rd.V_START AND rd.V_END',
'  AND (:P504_PARTY             IS NULL OR so.partycode = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR IT.itemcategorycode = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'GROUP BY ',
'    TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH''),',
'    TO_CHAR(so.salesorderdate, ''YYYYMM'') ',
'ORDER BY ',
'    TO_CHAR(so.salesorderdate, ''YYYYMM'') ASC;'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_series_type=>'line'
,p_items_value_column_name=>'TOTAL_QUANTITY'
,p_items_label_column_name=>'ORDER_MONTH'
,p_items_short_desc_column_name=>'TOOLTIP_AMOUNT_QTY'
,p_color=>'#588637'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_PARTY,P380_TODATE,P380_SALES_EXECUTIVE,P380_ITEM,P380_REGION_TO_DISPLAY,P380_SELECTED_MONTH:&P504_TODATE.,&P504_PARTY.,&P504_TODATE.,&P504_SALES_EXECUTIVE.,&P504_ITEM_NAME.,MONTH_WISE_ORDERS,'
||'&ORDER_MONTH.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(59863655822688936)
,p_chart_id=>wwv_flow_imp.id(59863314436688933)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(59863713408688937)
,p_chart_id=>wwv_flow_imp.id(59863314436688933)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'thousand'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59863863311688938)
,p_plug_name=>'Orders/Qty by Sales Person'
,p_static_id=>'orders-qty-by-sales-person'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(59863945188688939)
,p_region_id=>wwv_flow_imp.id(59863863311688938)
,p_chart_type=>'combo'
,p_title=>'Orders/Qty by Sales Person'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(59864037373688940)
,p_chart_id=>wwv_flow_imp.id(59863945188688939)
,p_static_id=>'by-orders'
,p_seq=>10
,p_name=>'by Orders'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')    AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')                             AS sales_executive_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'')                        AS sales_executive_code,',
'    COUNT(DISTINCT sod.tno)                                         AS total_orders,',
'    ''Executive: '' || NVL(emp.employeename, ''Unassigned'') ||',
'    '' | Orders: '' || TO_CHAR(COUNT(DISTINCT sod.tno), ''99,99,99,990.00'') ||',
'    '' | Qty: ''    || TO_CHAR(SUM(sod.quantity1),       ''99,99,99,990.00'') AS tooltip_sales_perf',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN employee emp     ON so.salesexecutivecode = emp.employeecode',
'LEFT JOIN item it          ON it.itemcode = sod.itemcode',
'CROSS JOIN RAW_DATES rd',
'WHERE so.salesorderdate BETWEEN rd.V_START AND rd.V_END',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode',
'ORDER BY',
'    CASE WHEN NVL(emp.employeename, ''Unassigned'') = ''Unassigned'' THEN 2 ELSE 1 END ASC,',
'    COUNT(DISTINCT sod.tno) DESC'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTAL_ORDERS'
,p_items_label_column_name=>'SALES_EXECUTIVE_NAME'
,p_items_short_desc_column_name=>'TOOLTIP_SALES_PERF'
,p_color=>'#92bfe7'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_TODATE,P380_ITEM,P380_SALES_EXECUTIVE,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_REGION_TO_DISPLAY:&P504_FROMDATE.,&P504_TODATE.,&P504_ITEM_NAME.,&SALES_EXECUTIVE_CODE.,&P504_ITEM_SPECIFI'
||'CATION.,&P504_ITEM_CATEGORY.,SALES_PERSON_WISE'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(59864162029688941)
,p_chart_id=>wwv_flow_imp.id(59863945188688939)
,p_static_id=>'by-qty'
,p_seq=>20
,p_name=>'by Qty'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')    AS V_END',
'    FROM DUAL',
')',
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')                             AS sales_executive_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'')                        AS sales_executive_code,',
'    SUM(sod.quantity1)                                              AS total_quantity,',
'    ''Executive: '' || NVL(emp.employeename, ''Unassigned'') ||',
'    '' | Orders: '' || TO_CHAR(COUNT(DISTINCT sod.tno), ''99,99,99,990.00'') ||',
'    '' | Qty: ''    || TO_CHAR(SUM(sod.quantity1),       ''99,99,99,990.00'') AS tooltip_sales_perf',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN employee emp     ON so.salesexecutivecode = emp.employeecode',
'LEFT JOIN item it          ON it.itemcode = sod.itemcode',
'CROSS JOIN RAW_DATES rd',
'WHERE so.salesorderdate BETWEEN rd.V_START AND rd.V_END',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode',
'ORDER BY',
'    CASE WHEN NVL(emp.employeename, ''Unassigned'') = ''Unassigned'' THEN 2 ELSE 1 END ASC,',
'    SUM(sod.quantity1) DESC'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_series_type=>'line'
,p_items_value_column_name=>'TOTAL_QUANTITY'
,p_items_label_column_name=>'SALES_EXECUTIVE_NAME'
,p_items_short_desc_column_name=>'TOOLTIP_SALES_PERF'
,p_color=>'#1862a3'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY:&P504_FROMDATE.,&P504_TODATE.,&P504_PARTY.,&P504_ITEM_NAME.,&P504_ITEM_SPECIFICATION.,&SALES_EXE'
||'CUTIVE_CODE.,SALES_PERSON_WISE'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(59864271232688942)
,p_chart_id=>wwv_flow_imp.id(59863945188688939)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(59864343408688943)
,p_chart_id=>wwv_flow_imp.id(59863945188688939)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'none'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462996341782491155)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(60059223378281144)
,p_name=>'Party Wise Pending Qty'
,p_static_id=>'party-wise-pending-qty'
,p_region_name=>'S_PARTY_PENDING_QTY'
,p_parent_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_template=>4072358936313175081
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Sum_SO AS (',
'    -- 1. Party Wise Total Sales Order Quantity',
'    SELECT ',
'        so.partycode,',
'        SUM(NVL(sod.quantity1, 0)) AS TOTAL_SO_QTY',
'    FROM salesorder so',
'    JOIN salesorderdetail sod ON so.tno = sod.tno',
'    LEFT JOIN item it         ON sod.itemcode = it.itemcode',
'    WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'      AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'      AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode = :P504_ITEM_CATEGORY)',
'      AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode = :P504_ITEM_NAME)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'      AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'    GROUP BY so.partycode',
'),',
'Sum_DA AS (',
'    -- 2. Party Wise Total Dispatched Quantity',
'    SELECT ',
'        so.partycode,',
'        SUM(NVL(dad.quantity1, 0)) AS TOTAL_DESPATCH_QTY',
'    FROM salesorder so',
'    JOIN despatchadvice da        ON so.tno = da.referencetno',
'    LEFT JOIN despatchadvicedetail dad ON da.tno = dad.tno',
'    LEFT JOIN item it             ON dad.itemcode = it.itemcode',
'    WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'      AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'      AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode = :P504_ITEM_CATEGORY)',
'      AND (:P504_ITEM_NAME          IS NULL OR dad.itemcode = :P504_ITEM_NAME)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR dad.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'      AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'    GROUP BY so.partycode',
'),',
'Sum_LA AS (',
'    -- 3. Party Wise Total Loading Advice Quantity',
'    SELECT ',
'        so.partycode,',
'        SUM(NVL(lad.quantity1, 0)) AS TOTAL_LOADING_QTY',
'    FROM salesorder so',
'    JOIN loadingadvice la         ON so.tno = la.salesordertno',
'    LEFT JOIN loadingadvicedetail lad  ON la.tno = lad.tno',
'    LEFT JOIN item it             ON lad.itemcode = it.itemcode',
'    WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'      AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'      AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode = :P504_ITEM_CATEGORY)',
'      AND (:P504_ITEM_NAME          IS NULL OR lad.itemcode = :P504_ITEM_NAME)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR lad.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'      AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'    GROUP BY so.partycode',
'),',
'Sum_CI_DA_Path AS (',
'    -- 4a. Invoice Qty via Despatch Path',
'    SELECT ',
'        so.partycode,',
'        SUM(NVL(cid.quantity1, 0)) AS TOTAL_INVOICE_QUANTITY',
'    FROM salesorder so',
'    JOIN despatchadvice da        ON so.tno = da.referencetno',
'    JOIN ccinvoice ci             ON ci.despatchadvicetno = da.tno',
'    LEFT JOIN ccinvoicedetail cid ON ci.tno = cid.tno',
'    LEFT JOIN item it             ON cid.itemcode = it.itemcode',
'    WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'      AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'      AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode = :P504_ITEM_CATEGORY)',
'      AND (:P504_ITEM_NAME          IS NULL OR cid.itemcode = :P504_ITEM_NAME)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR cid.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'      AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'    GROUP BY so.partycode',
'),',
'Sum_CI_LA_Path AS (',
'    -- 4b. Invoice Qty via Loading Path',
'    SELECT ',
'        so.partycode,',
'        SUM(NVL(cid.quantity1, 0)) AS TOTAL_INVOICE_QUANTITY',
'    FROM salesorder so',
'    JOIN loadingadvice la         ON so.tno = la.salesordertno',
'    JOIN ccinvoice ci             ON ci.loadingadvicetno = la.tno',
'    LEFT JOIN ccinvoicedetail cid ON ci.tno = cid.tno',
'    LEFT JOIN item it             ON cid.itemcode = it.itemcode',
'    WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'      AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'      AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode = :P504_ITEM_CATEGORY)',
'      AND (:P504_ITEM_NAME          IS NULL OR cid.itemcode = :P504_ITEM_NAME)',
'      AND (:P504_ITEM_SPECIFICATION IS NULL OR cid.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'      AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'    GROUP BY so.partycode',
')',
'-- 5. Main Output (Clean & Simple)',
'SELECT ',
'     p.partyname                                                   AS customer_name,',
'     NVL(sso.TOTAL_SO_QTY, 0)                                      AS total_order_qty,',
'     NVL(sda.TOTAL_DESPATCH_QTY, 0)                                AS total_dispatched_qty,',
'     NVL(sla.TOTAL_LOADING_QTY, 0)                                 AS total_loading_qty,',
'     ',
'     -- Total Invoice Qty (Despatch path + Loading path)',
'     (NVL(cid_da.TOTAL_INVOICE_QUANTITY, 0) + NVL(cid_la.TOTAL_INVOICE_QUANTITY, 0)) AS total_invoice_qty,',
'     ',
'     -- Balance Qty Calculation (Order Qty - Invoice Qty)',
'     (NVL(sso.TOTAL_SO_QTY, 0) - (NVL(cid_da.TOTAL_INVOICE_QUANTITY, 0) + NVL(cid_la.TOTAL_INVOICE_QUANTITY, 0))) AS balance_qty',
'',
'FROM party p',
'JOIN Sum_SO sso          ON p.partycode = sso.partycode',
'LEFT JOIN Sum_DA sda     ON p.partycode = sda.partycode',
'LEFT JOIN Sum_LA sla     ON p.partycode = sla.partycode',
'LEFT JOIN Sum_CI_DA_Path cid_da ON p.partycode = cid_da.partycode',
'LEFT JOIN Sum_CI_LA_Path cid_la ON p.partycode = cid_la.partycode',
'WHERE (NVL(sso.TOTAL_SO_QTY, 0) - (NVL(cid_da.TOTAL_INVOICE_QUANTITY, 0) + NVL(cid_la.TOTAL_INVOICE_QUANTITY, 0))) > 0',
'ORDER BY ',
'    ',
'    p.partyname ASC,',
'    balance_qty DESC;',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,P504_REPORTS_MONTH'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60061138853281163)
,p_query_column_id=>6
,p_column_alias=>'BALANCE_QTY'
,p_column_display_sequence=>60
,p_column_heading=>'Balance Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60059356932281145)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>10
,p_column_heading=>'Customer Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60060837998281160)
,p_query_column_id=>3
,p_column_alias=>'TOTAL_DISPATCHED_QTY'
,p_column_display_sequence=>30
,p_column_heading=>'Total Dispatched Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60061065580281162)
,p_query_column_id=>5
,p_column_alias=>'TOTAL_INVOICE_QTY'
,p_column_display_sequence=>50
,p_column_heading=>'Total Invoice Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60060933452281161)
,p_query_column_id=>4
,p_column_alias=>'TOTAL_LOADING_QTY'
,p_column_display_sequence=>40
,p_column_heading=>'Total Loading Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60060788415281159)
,p_query_column_id=>2
,p_column_alias=>'TOTAL_ORDER_QTY'
,p_column_display_sequence=>20
,p_column_heading=>'Total Order Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463503018794425621)
,p_plug_name=>'Posted'
,p_static_id=>'posted'
,p_parent_plug_id=>wwv_flow_imp.id(462996416499491156)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_number(Round(sum(a.InvoiceAmount)/100000,2),''99999999999.99'') ||'' Lac'' Value,'),
'''Posted'' as Text,',
'''u-color-18'' as card_color',
'From  Invoice a, Financialyear b',
'Where to_Char(a.InvoiceDate,''YYYY'') = to_Char(To_Date(:P504_DATE,''DD-MM-YYYY''),''YYYY'')',
'  and exists (Select 1 from Voucher v where v.ModuleTNo = a.TNo)',
'  and a.FinancialYearCode = b.FinancialyearCode',
'  and :P504_DATE between b.FinancialYearBegin and b.FinancialyearEnd',
'  and a.InvoiceDate <= :P504_DATE',
'  And :P504_DATE Between B.FinancialYearBegin And B.FinancialYearend',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441054406001483677)
,p_region_id=>wwv_flow_imp.id(463503018794425621)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardtext mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(441054931361483677)
,p_card_id=>wwv_flow_imp.id(441054406001483677)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.::P174_COMPANY,P174_FROMDATE,P174_TODATE,P174_STATUS:&GLOBAL_COMPANYCODE.,&P504_FROMDATE.,&P504_DATE.,ACTIVE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59864449527688944)
,p_plug_name=>'Qty Over Time'
,p_static_id=>'qty-over-time'
,p_region_name=>'S_QTY_OVER_TIME'
,p_parent_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(59864571440688945)
,p_region_id=>wwv_flow_imp.id(59864449527688944)
,p_chart_type=>'combo'
,p_title=>'Qty Over Time'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(59864694700688946)
,p_chart_id=>wwv_flow_imp.id(59864571440688945)
,p_static_id=>'by-amount'
,p_seq=>10
,p_name=>'by Amount'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') AS order_day,',
'    SUM(sod.amount)                                                         AS total_amount,',
'    -- SUM(sod.quantity1)                                                      AS total_quantity,',
'    ',
'    ''Day: ''      || TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') || ',
'    '' | Amount: '' || TO_CHAR(SUM(sod.amount), ''99,99,99,990.00'')                            || ',
'    '' | Qty: ''    || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'')                         AS tooltip_amount_qty',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN item it         ON it.itemcode = sod.itemcode',
'WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'  AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR IT.itemcategorycode = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'GROUP BY ',
'    TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH''),',
'    TRUNC(so.salesorderdate)',
'ORDER BY ',
'    TRUNC(so.salesorderdate) ASC;'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,P504_REPORTS_MONTH'
,p_series_type=>'lineWithArea'
,p_items_value_column_name=>'TOTAL_AMOUNT'
,p_items_label_column_name=>'ORDER_DAY'
,p_items_short_desc_column_name=>'TOOLTIP_AMOUNT_QTY'
,p_color=>'#d389c9'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_TODATE,P380_PARTY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,P380_SELECTED_DAY:&P504_FROMDATE.,&P504_TODATE.,&P504_PARTY.,&P504_SALES_EXECUTIVE.,QUANTITY_OVER_TIME,&ORDER_DAY.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(59864736963688947)
,p_chart_id=>wwv_flow_imp.id(59864571440688945)
,p_static_id=>'by-qty'
,p_seq=>20
,p_name=>'by Qty'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') AS order_day,',
'    -- SUM(sod.amount)                                                         AS total_amount,',
'    SUM(sod.quantity1)                                                      AS total_quantity,',
'    ',
'    ''Day: ''      || TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') || ',
'    '' | Amount: '' || TO_CHAR(SUM(sod.amount), ''99,99,99,990.00'')                            || ',
'    '' | Qty: ''    || TO_CHAR(SUM(sod.quantity1), ''99,99,99,990.00'')                         AS tooltip_amount_qty',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN item it         ON it.itemcode = sod.itemcode',
'WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'  AND (:P504_PARTY              IS NULL OR so.partycode = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR IT.itemcategorycode = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode = :P504_SALES_EXECUTIVE)',
'GROUP BY ',
'    TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH''),',
'    TRUNC(so.salesorderdate)',
'ORDER BY ',
'    TRUNC(so.salesorderdate) ASC;'))
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,P504_REPORTS_MONTH'
,p_series_type=>'lineWithArea'
,p_items_value_column_name=>'TOTAL_QUANTITY'
,p_items_label_column_name=>'ORDER_DAY'
,p_items_short_desc_column_name=>'TOOLTIP_AMOUNT_QTY'
,p_color=>'#b841a8'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'belowMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:380:&SESSION.::&DEBUG.:380:P380_FROMDATE,P380_TODATE,P380_PARTY,P380_REGION_TO_DISPLAY,P380_SELECTED_DAY:&P504_FROMDATE.,&P504_TODATE.,&P504_PARTY.,QUANTITY_OVER_TIME,&ORDER_DAY.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(59864822981688948)
,p_chart_id=>wwv_flow_imp.id(59864571440688945)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(59864959825688949)
,p_chart_id=>wwv_flow_imp.id(59864571440688945)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'thousand'
,p_scaling=>'log'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60056908905281120)
,p_plug_name=>'Reports'
,p_static_id=>'reports'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463502582646425617)
,p_plug_name=>'Sales Per Day'
,p_static_id=>'sales-per-day'
,p_parent_plug_id=>wwv_flow_imp.id(462996416499491156)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_number(Round(sum(a.CCInvoiceAmount) /'),
'GetDayofYear(To_Date(:P504_DATE,''DD-MM-YYYY''))/ 1000000',
',0),''99999999999.99'') ||'' Lac''',
' Value,',
'''Sales per Day'' as Text,',
'''u-color-5'' as card_color',
'From CCInvoice a, financialyear b',
' Where a.financialyearcode = b.financialyearcode',
'   And :P504_DATE Between b.financialyearbegin And b.financialyearend',
'   And to_Char(a.CCInvoiceDate, ''YYYY'') = to_Char(To_Date(:P504_DATE, ''DD-MM-YYYY''), ''YYYY'')',
'   And a.CCInvoiceDate <= :P504_DATE',
'      And a.CCInvoiceDate Between B.FinancialYearBegin And B.FinancialYearend'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441052636593483676)
,p_region_id=>wwv_flow_imp.id(463502582646425617)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardsize mycardtext'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60058361184281135)
,p_plug_name=>'Sales Person vs Item Category'
,p_static_id=>'sales-person-vs-item-category'
,p_region_name=>'S_SELLER_ITEM_CATEGORY'
,p_parent_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')        AS seller_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'')   AS sales_executive_code,',
'    NVL(vi.itemcategoryname, ''Unassigned'')     AS category_name,',
'    NVL(vi.itemcategorycode, ''UNCAT'')          AS item_category_code,',
'    SUM(sod.quantity1)                         AS total_quantity,',
'    COUNT(DISTINCT so.tno)                     AS total_orders,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 380,',
'                p_items  => ''P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_ITEM_CATEGORY,P380_REGION_TO_DISPLAY'',',
'                p_values => TO_CHAR(TRUNC(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM''), ''MM''), ''DD-MM-YYYY'') || '','' ||',
'                            TO_CHAR(LAST_DAY(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM'')), ''DD-MM-YYYY'') || '','' ||',
'                            NVL(so.salesexecutivecode, ''UNASSIGNED'') || '','' ||',
'                            NVL(vi.itemcategorycode, ''UNCAT'') || '','' ||',
'                            ''SELLER_CATEGORY_WISE''',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS category_link',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'JOIN v_item_details vi    ON sod.itemcode = vi.itemcode',
'JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR vi.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode,',
'    vi.itemcategoryname,',
'    vi.itemcategorycode',
'ORDER BY',
'    NVL(emp.employeename, ''Unassigned'') ASC,',
'    NVL(vi.itemcategoryname, ''Unassigned'') ASC,',
'    total_quantity DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,P504_REPORTS_MONTH'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(60058494700281136)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_show_search_textbox=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_rows_per_page=>'N'
,p_show_filter=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>42591482575051820
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62280145951079743)
,p_db_column_name=>'CATEGORY_LINK'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'Category Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60060422878281156)
,p_db_column_name=>'CATEGORY_NAME'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>'Category Name'
,p_column_html_expression=>'<a href="#CATEGORY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#CATEGORY_NAME#</a>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62280035990079742)
,p_db_column_name=>'ITEM_CATEGORY_CODE'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'Item Category Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62279924912079741)
,p_db_column_name=>'SALES_EXECUTIVE_CODE'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Sales Executive Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60060354282281155)
,p_db_column_name=>'SELLER_NAME'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Seller Name'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60060635602281158)
,p_db_column_name=>'TOTAL_ORDERS'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>'Total Orders'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60060583308281157)
,p_db_column_name=>'TOTAL_QUANTITY'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Total Quantity'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(60135561378882237)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'426686'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'SELLER_NAME:CATEGORY_NAME:TOTAL_ORDERS:TOTAL_QUANTITY'
,p_break_on=>'SELLER_NAME'
,p_break_enabled_on=>'SELLER_NAME'
,p_sum_columns_on_break=>'TOTAL_ORDERS:TOTAL_QUANTITY:TOTAL_AMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463503441980425625)
,p_plug_name=>'Sales Trend'
,p_static_id=>'sales-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'Select',
'      Case When :P504_COMPARE = ''MONTH'' then To_Char(a.CCInvoiceDate,''MON-YY'')',
'           else To_Char(a.CCInvoiceDate,''YYYY'')',
'      End as MONTHYEAR,',
'      sum(a.CCInvoiceAmount) CMA,',
'      (',
'          Select',
'                sum(aa.CCInvoiceAmount)',
'          From  CCInvoice aa',
'          Where to_Char(aa.CCInvoiceDate,''YYYYMM'') = ',
'                to_Char(Add_Months(to_date(:P504_DATE,''DD-MON-YYYY''),-1 * (Decode(:P504_COMPARE,''MONTH'',1,12)) * nvl(:P504_VALUE,1)) ,''YYYYMM''',
'                )',
'      ) as PMA',
'',
'From  CCInvoice a',
'Where To_Char(a.CCInvoiceDate,''YYYY'') = To_Char(to_date(:P504_DATE,''DD-MON-YYYY''),''YYYY'')',
'Group by ',
'        Case When :P504_COMPARE = ''MONTH'' then To_Char(a.CCInvoiceDate,''MON-YY'')',
'           else To_Char(a.CCInvoiceDate,''YYYY'')',
'        End',
'',
'*/',
'Select Decode(:P504_COMPARE,',
'              ''MONTH'',',
'              to_char(a.ccinvoicedate, ''MON-YY''),',
'              to_char(a.ccinvoicedate, ''YYYY'')) CurrentYear,',
'       Sum(a.ccinvoiceamount) As CurrentMOnthAmount,',
'       NVL((Select Sum(AA.CCINVOICEAMOUNT)',
'          From ccinvoice aa',
'         Where to_char(aa.ccinvoicedate, ''YYYYMM'') =',
'               to_char(ADD_MONTHS(Sysdate,',
'                                  -1 * (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  Nvl(:P504_VALUE, 1)),',
'                       ''YYYYMM'')),0) As PrevAmount',
'  From CCINVOICE A',
' Where Decode(:P504_COMPARE,',
'              ''MONTH'',',
'              to_char(a.ccinvoicedate, ''MON-YY''),',
'              to_char(a.ccinvoicedate, ''YYYY'')) =',
'       Decode(:P504_COMPARE,',
'              ''MONTH'',',
'              TO_CHAR(TO_DATE(:P504_DATE, ''DD-MON-YYYY''), ''MON-YY''),',
'              TO_CHAR(TO_DATE(:P504_DATE, ''DD-MON-YYYY''), ''YYYY''))',
' Group By Decode(:P504_COMPARE,',
'                 ''MONTH'',',
'                 to_char(a.ccinvoicedate, ''MON-YY''),',
'                 to_char(a.ccinvoicedate, ''YYYY''))',
'',
''))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'1'
,p_plug_display_when_cond2=>'2'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441057382603483679)
,p_region_id=>wwv_flow_imp.id(463503441980425625)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441059099557483680)
,p_chart_id=>wwv_flow_imp.id(441057382603483679)
,p_static_id=>'jet_chart_series'
,p_seq=>10
,p_name=>'1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'CURRENTMONTHAMOUNT'
,p_items_label_column_name=>'CURRENTYEAR'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_style=>'italic'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441059704737483680)
,p_chart_id=>wwv_flow_imp.id(441057382603483679)
,p_static_id=>'jet_chart_series-2'
,p_seq=>20
,p_name=>'2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'PREVAMOUNT'
,p_items_label_column_name=>'CURRENTYEAR'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_style=>'italic'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441057924611483679)
,p_chart_id=>wwv_flow_imp.id(441057382603483679)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441058486865483679)
,p_chart_id=>wwv_flow_imp.id(441057382603483679)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463504542393425636)
,p_plug_name=>'Sales Trend 2'
,p_static_id=>'sales-trend-2'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.LabelName,',
'    x.ValueName,',
'    Case When rownum = 1 then ''#76B947''',
'         When rownum = 2 then ''#2E8BC0''',
'         When rownum = 3 then ''#FFA384''',
'         When rownum = 4 then ''#FF8300''',
'         When rownum = 5 then ''#B7AC44''',
'         When rownum = 6 then ''#FF4500''',
'         When rownum = 7 then ''#DF362D''',
'         When rownum = 8 then ''#FAD02C''',
'         When rownum = 9 then ''#333652''',
'         When rownum = 10 then ''#90ADC6''',
'         When rownum = 11 then ''#94C973''',
'         When rownum = 12 then ''u-color-12''',
'    End as Color',
'',
'From',
'(Select',
'      ',
'      Decode(nvl(:P504_COMPARE,''MONTH''),',
'              ''MONTH'',',
'              to_char(a.ccinvoicedate, ''MON-YY''),',
'              to_char(a.ccinvoicedate, ''YYYY'')) LabelName,',
'      Decode(nvl(:P504_COMPARE,''MONTH''),',
'               ''MONTH'',',
'               to_char(a.ccinvoicedate, ''YYYYMM''),',
'               to_char(a.ccinvoicedate, ''YYYY'')) OrderName,       ',
'      Round(sum(TotalAmount),2)as ValueName',
'From  BI_SRevenue a, FinancialYear b',
'Where a.CCInvoiceDate <= NVL(:P504_DATE,TRUNC(SYSDATE))',
'  and a.FinancialyearCode = b.Financialyearcode',
'  and :P504_DATE between b.FinancialyearBegin and b.FinancialyearEnd',
'     And :P504_DATE Between B.FinancialYearBegin And B.FinancialYearend',
'Group by Decode(nvl(:P504_COMPARE,''MONTH''),',
'              ''MONTH'',',
'              to_char(a.ccinvoicedate, ''MON-YY''),',
'              to_char(a.ccinvoicedate, ''YYYY'')) ,',
'      Decode(nvl(:P504_COMPARE,''MONTH''),',
'               ''MONTH'',',
'               to_char(a.ccinvoicedate, ''YYYYMM''),',
'               to_char(a.ccinvoicedate, ''YYYY''))',
'Order by Decode(nvl(:P504_COMPARE,''MONTH''),',
'               ''MONTH'',',
'               to_char(a.ccinvoicedate, ''YYYYMM''),',
'               to_char(a.ccinvoicedate, ''YYYY'')) desc',
')x',
'Where Rownum <= NVL(:P504_VALUE,1)'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441060670588483680)
,p_region_id=>wwv_flow_imp.id(463504542393425636)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441062371842483681)
,p_chart_id=>wwv_flow_imp.id(441060670588483680)
,p_static_id=>'jet_chart_series'
,p_seq=>10
,p_name=>'1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUENAME'
,p_items_label_column_name=>'LABELNAME'
,p_color=>'&COLOR.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441061858045483681)
,p_chart_id=>wwv_flow_imp.id(441060670588483680)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441061255756483681)
,p_chart_id=>wwv_flow_imp.id(441060670588483680)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(59865322281688953)
,p_name=>'Seller / State'
,p_static_id=>'seller-state'
,p_region_name=>'S_SELLER_STATE'
,p_parent_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-report-merge-column1:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')    AS seller_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'') AS sales_executive_code,',
'    st.statename                           AS state_name,',
'    p.officestatecode                      AS state_code,',
'    SUM(sod.quantity1)                     AS total_quantity,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 380,',
'                p_items  => ''P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_STATE,P380_REGION_TO_DISPLAY'',',
'                p_values => TO_CHAR(TRUNC(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM''), ''MM''), ''DD-MM-YYYY'') || '','' ||',
'                            TO_CHAR(LAST_DAY(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM'')), ''DD-MM-YYYY'') || '','' ||',
'                            NVL(so.salesexecutivecode, ''UNASSIGNED'') || '','' ||',
'                            p.officestatecode || '','' ||',
'                            ''SELLER_STATE_WISE''',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS row_link,',
'CASE',
'    WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_PAGE.GET_URL(',
'            p_page   => 380,',
'            p_items  => ''P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_STATE,P380_REGION_TO_DISPLAY'',',
'            p_values => TO_CHAR(TRUNC(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM''), ''MM''), ''DD-MM-YYYY'') || '','' ||',
'                        TO_CHAR(LAST_DAY(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM'')), ''DD-MM-YYYY'') || '','' ||',
'                        NVL(so.salesexecutivecode, ''UNASSIGNED'') || '','' ||',
'                        '''' || '','' ||',
'                        ''SELLER_STATE_WISE''',
'        )',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'END AS seller_link',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'JOIN item it              ON sod.itemcode = it.itemcode',
'JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'JOIN party p              ON so.partycode = p.partycode',
'JOIN city ct              ON p.officecitycode = ct.citycode',
'JOIN state st             ON p.officestatecode = st.statecode',
'WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode,',
'    st.statename,',
'    p.officestatecode',
'ORDER BY',
'    NVL(emp.employeename, ''Unassigned'') ASC,',
'    st.statename ASC,',
'    total_quantity DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,,P504_REPORTS_MONTH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(60084040408391602)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61881110487557826)
,p_query_column_id=>6
,p_column_alias=>'ROW_LINK'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61880879221557824)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367994015362836)
,p_query_column_id=>7
,p_column_alias=>'SELLER_LINK'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59865851382688958)
,p_query_column_id=>1
,p_column_alias=>'SELLER_NAME'
,p_column_display_sequence=>10
,p_column_heading=>'Seller Name'
,p_column_html_expression=>'<a href="#SELLER_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#SELLER_NAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61880972744557825)
,p_query_column_id=>4
,p_column_alias=>'STATE_CODE'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59865960256688959)
,p_query_column_id=>3
,p_column_alias=>'STATE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'State'
,p_column_html_expression=>'<a href="#ROW_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#STATE_NAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59866059483688960)
,p_query_column_id=>5
,p_column_alias=>'TOTAL_QUANTITY'
,p_column_display_sequence=>40
,p_column_heading=>'Total Quantity'
,p_column_format=>'99G99G99G99G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60057708178281128)
,p_plug_name=>'Seller vs State City'
,p_static_id=>'seller-vs-state-city'
,p_region_name=>'S_STATE_CITY_ORDER'
,p_parent_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')                                AS seller_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'')                           AS sales_executive_code,',
'    st.statename                                                       AS state_name,',
'    p.officestatecode                                                  AS state_code,',
'    ct.cityname                                                        AS city_name,',
'    p.officecitycode                                                   AS city_code,',
'    SUM(sod.quantity1)                                                 AS total_quantity,',
'    COUNT(DISTINCT so.tno)                                             AS total_orders,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 380,',
'                p_items  => ''P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_STATE,P380_CITY,P380_REGION_TO_DISPLAY'',',
'                p_values => TO_CHAR(TRUNC(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM''), ''MM''), ''DD-MM-YYYY'') || '','' ||',
'                            TO_CHAR(LAST_DAY(TO_DATE(:P504_REPORTS_MONTH, ''YYYYMM'')), ''DD-MM-YYYY'') || '','' ||',
'                            NVL(so.salesexecutivecode, ''UNASSIGNED'') || '','' ||',
'                            p.officestatecode || '','' ||',
'                            p.officecitycode || '','' ||',
'                            ''SELLER_CITY_WISE''',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS city_link',
'FROM salesorder so',
'JOIN salesorderdetail sod ON so.tno = sod.tno',
'JOIN item it              ON sod.itemcode = it.itemcode',
'JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'JOIN party p              ON so.partycode = p.partycode',
'JOIN city ct              ON p.officecitycode = ct.citycode',
'JOIN state st             ON p.officestatecode = st.statecode',
'WHERE TO_CHAR(so.salesorderdate, ''YYYYMM'') = :P504_REPORTS_MONTH',
'  AND (:P504_PARTY              IS NULL OR so.partycode              = :P504_PARTY)',
'  AND (:P504_ITEM_CATEGORY      IS NULL OR it.itemcategorycode       = :P504_ITEM_CATEGORY)',
'  AND (:P504_ITEM_NAME          IS NULL OR sod.itemcode              = :P504_ITEM_NAME)',
'  AND (:P504_ITEM_SPECIFICATION IS NULL OR sod.itemspecificationcode = :P504_ITEM_SPECIFICATION)',
'  AND (:P504_SALES_EXECUTIVE    IS NULL OR so.salesexecutivecode     = :P504_SALES_EXECUTIVE)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode,',
'    st.statename,',
'    p.officestatecode,',
'    ct.cityname,',
'    p.officecitycode',
'ORDER BY',
'    NVL(emp.employeename, ''Unassigned'') ASC,',
'    st.statename ASC,',
'    ct.cityname ASC,',
'    total_quantity DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE,P504_REPORTS_MONTH'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(60057785773281129)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_show_search_textbox=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_filter=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>42590773648051813
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62277881617079720)
,p_db_column_name=>'CITY_CODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'City Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62277940637079721)
,p_db_column_name=>'CITY_LINK'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'City Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60058072403281132)
,p_db_column_name=>'CITY_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'City Name'
,p_column_html_expression=>'<a href="#CITY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#CITY_NAME#</a>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62277703477079718)
,p_db_column_name=>'SALES_EXECUTIVE_CODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Sales Executive Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60057900265281130)
,p_db_column_name=>'SELLER_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seller Name'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62277768253079719)
,p_db_column_name=>'STATE_CODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'State Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60058009804281131)
,p_db_column_name=>'STATE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'State Name'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60058254057281134)
,p_db_column_name=>'TOTAL_ORDERS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total Orders'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60058148418281133)
,p_db_column_name=>'TOTAL_QUANTITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Total Quantity'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(60126572503796723)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'426596'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SELLER_NAME:STATE_NAME:CITY_NAME:TOTAL_QUANTITY:TOTAL_ORDERS'
,p_break_on=>'SELLER_NAME:STATE_NAME'
,p_break_enabled_on=>'SELLER_NAME:STATE_NAME'
,p_sum_columns_on_break=>'TOTAL_QUANTITY:TOTAL_ORDERS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463505105679425642)
,p_plug_name=>'Top 10 Customer'
,p_static_id=>'top-10-customer'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LABELNAME,',
'       LABELVALUE,',
'       P1,',
'       P2,',
'       P3,',
'       P4,',
'       P5,',
'       P6,',
'       P7,',
'       P8,',
'       P9,',
'       P10,',
'       P11,',
'       P12',
'  from TEMP_TOP10CUSTOMER',
'Order by 2 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441063452745483682)
,p_region_id=>wwv_flow_imp.id(463505105679425642)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441065089383483683)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'current'
,p_seq=>10
,p_name=>'Current'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LABELVALUE'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441065734499483683)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous'
,p_seq=>20
,p_name=>'Previous_1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P1'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441071137455483685)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-10'
,p_seq=>110
,p_name=>'Previous_10'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P10'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441071739993483686)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-11'
,p_seq=>120
,p_name=>'Previous_11'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P11'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441072274363483686)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-12'
,p_seq=>130
,p_name=>'Previous_12'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P12'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441066300833483683)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-2'
,p_seq=>30
,p_name=>'Previous_2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P2'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441066871593483683)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-3'
,p_seq=>40
,p_name=>'Previous_3'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P3'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441067540492483684)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-4'
,p_seq=>50
,p_name=>'Previous_4'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P4'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441068148149483684)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-5'
,p_seq=>60
,p_name=>'Previous_5'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P5'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441068753276483684)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-6'
,p_seq=>70
,p_name=>'Previous_6'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P6'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441069325068483685)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-7'
,p_seq=>80
,p_name=>'Previous_7'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P7'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441069941412483685)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-8'
,p_seq=>90
,p_name=>'Previous_8'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P8'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441070516812483685)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'previous-9'
,p_seq=>100
,p_name=>'Previous_9'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P9'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441063924754483682)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441064475563483682)
,p_chart_id=>wwv_flow_imp.id(441063452745483682)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462800820670670950)
,p_plug_name=>'Top 10  Product'
,p_static_id=>'top-10-product'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LABELNAME,',
'       LABELVALUE,',
'       P1,',
'       P2,',
'       P3,',
'       P4,',
'       P5,',
'       P6,',
'       P7,',
'       P8,',
'       P9,',
'       P10,',
'       P11,',
'       P12',
'  from TEMP_TOP10Item',
'Order by 2 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441035982195483666)
,p_region_id=>wwv_flow_imp.id(462800820670670950)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441037681327483667)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'current'
,p_seq=>10
,p_name=>'Current'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LABELVALUE'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441038303274483667)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous'
,p_seq=>20
,p_name=>'Previous_1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P1'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441043751528483669)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-10'
,p_seq=>110
,p_name=>'Previous_10'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P10'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441044286734483670)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-11'
,p_seq=>120
,p_name=>'Previous_11'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P11'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441044886865483670)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-12'
,p_seq=>130
,p_name=>'Previous_12'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P12'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441038931850483667)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-2'
,p_seq=>30
,p_name=>'Previous_2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P2'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441039481397483668)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-3'
,p_seq=>40
,p_name=>'Previous_3'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P3'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441040164657483668)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-4'
,p_seq=>50
,p_name=>'Previous_4'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P4'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441040760433483668)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-5'
,p_seq=>60
,p_name=>'Previous_5'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P5'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441041336717483668)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-6'
,p_seq=>70
,p_name=>'Previous_6'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P6'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441041889111483669)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-7'
,p_seq=>80
,p_name=>'Previous_7'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P7'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441042518844483669)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-8'
,p_seq=>90
,p_name=>'Previous_8'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P8'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441043130359483669)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'previous-9'
,p_seq=>100
,p_name=>'Previous_9'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P9'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441036553347483666)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441037165301483667)
,p_chart_id=>wwv_flow_imp.id(441035982195483666)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462799139741670933)
,p_plug_name=>'Top 10  State'
,p_static_id=>'top-10-state'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LABELNAME,',
'       LABELVALUE,',
'       P1,',
'       P2,',
'       P3,',
'       P4,',
'       P5,',
'       P6,',
'       P7,',
'       P8,',
'       P9,',
'       P10,',
'       P11,',
'       P12',
'  from TEMP_TOP10state',
'Order by 2 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441026158721483661)
,p_region_id=>wwv_flow_imp.id(462799139741670933)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441027853708483662)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'current'
,p_seq=>10
,p_name=>'Current'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LABELVALUE'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441028451513483663)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous'
,p_seq=>20
,p_name=>'Previous_1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P1'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441033783828483665)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-10'
,p_seq=>110
,p_name=>'Previous_10'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P10'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441034426646483665)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-11'
,p_seq=>120
,p_name=>'Previous_11'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P11'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441034980413483665)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-12'
,p_seq=>130
,p_name=>'Previous_12'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P12'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441029052512483663)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-2'
,p_seq=>30
,p_name=>'Previous_2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P2'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441029626090483663)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-3'
,p_seq=>40
,p_name=>'Previous_3'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P3'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441030223426483663)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-4'
,p_seq=>50
,p_name=>'Previous_4'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P4'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441030791354483664)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-5'
,p_seq=>60
,p_name=>'Previous_5'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P5'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441031437987483664)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-6'
,p_seq=>70
,p_name=>'Previous_6'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P6'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441031982200483664)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-7'
,p_seq=>80
,p_name=>'Previous_7'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P7'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441032580716483664)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-8'
,p_seq=>90
,p_name=>'Previous_8'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P8'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441033190161483665)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'previous-9'
,p_seq=>100
,p_name=>'Previous_9'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P9'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441026636088483662)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441027220366483662)
,p_chart_id=>wwv_flow_imp.id(441026158721483661)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462996416499491156)
,p_plug_name=>'Top KPI Trends'
,p_static_id=>'top-kpi-trends'
,p_icon_css_classes=>'fa-credit-card'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463502792735425619)
,p_plug_name=>'Total Quantity'
,p_static_id=>'total-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(462996416499491156)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'Round(sum(a.Quantity1),3) ||'' MT'' Value,',
'''Total Quantity'' as Text,',
'''u-color-11'' as card_color',
'From  BI_SRevenue a, Item e, FinancialYear f',
'Where to_Char(a.CCInvoiceDate,''YYYY'') = to_Char(To_Date(:P504_DATE,''DD-MM-YYYY''),''YYYY'')',
'  and e.MeasuringUnitCode1 = ''MT''',
'  and a.ItemCode = e.ItemCode',
'  and a.financialyearcode = f.financialyearCode',
'  and :P504_DATE between f.financialyearbegin and f.financialyearend',
'  and a.CCInvoiceDate <= :P504_DATE',
'   And :P504_DATE Between f.FinancialYearBegin And f.FinancialYearend',
'   '))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441053490373483676)
,p_region_id=>wwv_flow_imp.id(463502792735425619)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardtext mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463502357299425615)
,p_plug_name=>'Total Sales'
,p_static_id=>'total-sales'
,p_parent_plug_id=>wwv_flow_imp.id(462996416499491156)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_number(Round(sum(a.CCInvoiceAmount)/100000,2),''99999999999.99'') ||'' Lac'' Value,'),
'''Total Sales'' as Text,',
'''u-color-22'' as card_color',
'From CCInvoice a, financialyear b',
' Where a.financialyearcode = b.financialyearcode',
'   And a.CCINvoiceDate Between B.FinancialYearBegin And :P504_DATE',
'   And to_Char(a.CCInvoiceDate, ''YYYY'') = to_Char(To_Date(:P504_DATE, ''DD-MM-YYYY''), ''YYYY'')',
'   And a.CCInvoiceDate <= :P504_DATE',
'   And b.financialyearcode = a.financialyearcode',
'   And :P504_DATE Between B.FinancialYearBegin And B.FinancialYearend',
'/* Where a.financialyearcode = b.financialyearcode',
'   And :P504_DATE Between b.financialyearbegin And b.financialyearend',
'   And to_Char(a.CCInvoiceDate, ''YYYY'') = to_Char(To_Date(:P504_DATE, ''DD-MON-YYYY''), ''YYYY'')',
'   And a.CCInvoiceDate <= :P504_DATE',
'   And a.CCINvoiceDate Between B.FinancialYearBegin And :P504_DATE',
'*/'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441051101755483675)
,p_region_id=>wwv_flow_imp.id(463502357299425615)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(441051623320483675)
,p_card_id=>wwv_flow_imp.id(441051101755483675)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:505:&SESSION.::&DEBUG.:119:P505_DATE:&P504_DATE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463502181479425613)
,p_plug_name=>'Total Transactions'
,p_static_id=>'total-transactions'
,p_parent_plug_id=>wwv_flow_imp.id(462996416499491156)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'count(a.TNo),',
'''Total Transaction'' as Text,',
'''u-color-14'' as card_color',
'From CCInvoice a, financialyear b',
' Where a.financialyearcode = b.financialyearcode',
'   And a.CCINvoiceDate Between B.FinancialYearBegin And :P504_DATE',
'   And to_Char(a.CCInvoiceDate, ''YYYY'') = to_Char(To_Date(:P504_DATE, ''DD-MM-YYYY''), ''YYYY'')',
'   And a.CCInvoiceDate <= :P504_DATE',
'   And b.financialyearcode = a.financialyearcode',
'   And :P504_DATE Between B.FinancialYearBegin And B.FinancialYearend',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441049585307483673)
,p_region_id=>wwv_flow_imp.id(463502181479425613)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'COUNT(A.TNO)'
,p_sub_title_css_classes=>'u-color-13-text mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(441050157489483674)
,p_card_id=>wwv_flow_imp.id(441049585307483673)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_COMPANY,P174_FROMDATE,P174_TODATE,P174_DOCTYPE:&GLOBAL_COMPANYCODE.,&P504_FROMDATE.,&P504_DATE.,&P504_DOCTYPE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463503177184425623)
,p_plug_name=>'Un-Posted'
,p_static_id=>'un-posted'
,p_parent_plug_id=>wwv_flow_imp.id(462996416499491156)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_number(Round(sum(a.InvoiceAmount)/100000,2),''99999999999.99'') ||'' Lac'' Value,'),
'''Un-Posted'' as Text,',
'''u-color-9'' as card_color',
'From  Invoice a, Financialyear b',
'Where to_Char(a.InvoiceDate,''YYYY'') = to_Char(To_Date(:P504_DATE,''DD-MM-YYYY''),''YYYY'')',
'  and not exists (Select 1 from Voucher v where v.ModuleTNo = a.TNo)',
'  and a.FinancialyearCode = b.Financialyearcode',
'  and :P504_DATE between b.Financialyearbegin and b.FinancialyearEnd',
'  and a.InvoiceDate <= :P504_DATE',
'   And :P504_DATE Between B.FinancialYearBegin And B.FinancialYearend',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441055929275483678)
,p_region_id=>wwv_flow_imp.id(463503177184425623)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardtext mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(441056392803483678)
,p_card_id=>wwv_flow_imp.id(441055929275483678)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.::P174_COMPANY,P174_FROMDATE,P174_TODATE,P174_STATUS:&GLOBAL_COMPANYCODE.,&P504_FROMDATE.,&P504_DATE.,NONACTIVE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(56844732800083226)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_button_name=>'SUBMIT'
,p_static_id=>'submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460926474510786428)
,p_name=>'P504_DATE_RANGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_prompt=>'Date Range'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_UC_DATE_RANGE_PICKER'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'NDP',
  'attribute_06', 'ranges',
  'attribute_07', 'DR',
  'attribute_09', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    ' ''Custom'': true,',
    ' ''Today'': [moment(), moment()],',
    ' ''Yesterday'': [moment().subtract(1, ''days''), moment().subtract(1, ''days'')],',
    ' ''Last 7 Days'': [moment().subtract(6, ''days''), moment()],',
    ' ''Last 30 Days'': [moment().subtract(29, ''days''), moment()],',
    ' ''This Month'': [moment().startOf(''month''), moment().endOf(''month'')],',
    ' ''Last Month'': [moment().subtract(1, ''month'').startOf(''month''), moment().subtract(1, ''month'').endOf(''month'')],',
    ' ''This Quarter'': [moment().startOf(''quarter''), moment().endOf(''quarter'')],',
    ' ''This FY Year'': [moment().month(3).startOf(''month'').isAfter(moment()) ? moment().subtract(1, ''year'').month(3).startOf(''month'') : moment().month(3).startOf(''month''), moment().month(3).startOf(''month'').isAfter(moment()) ? moment().month(2).endOf(''mont'
||'h'') : moment().add(1, ''year'').month(2).endOf(''month'')]',
    '}',
    '')),
  'attribute_10', 'alwaysShowCalendars:linkedCalendars:showDropdowns:showWeekNumbers',
  'attribute_15', 'onIconClick')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460926735128786430)
,p_name=>'P504_DOCTYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_item_default=>'CHALANCUMINVOICE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59616546188387134)
,p_name=>'P504_FROMDATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55922991322330858)
,p_name=>'P504_FY_BEGIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_item_default=>'CHALANCUMINVOICE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55923180634330860)
,p_name=>'P504_FY_END'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_item_default=>'CHALANCUMINVOICE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55919648242330825)
,p_name=>'P504_ITEM_CATEGORY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_prompt=>'Category'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    IC.ITEMCATEGORYNAME D, ',
'    IC.ITEMCATEGORYCODE R ',
'FROM ITEMCATEGORY IC',
'JOIN ITEM I ON I.ITEMCATEGORYCODE = IC.ITEMCATEGORYCODE'))
,p_cSize=>300
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55919789500330826)
,p_name=>'P504_ITEM_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     ITEMNAME D,',
'     ITEMCODE R',
'FROM V_DASHBOARD_SALES_SUMMARY',
'WHERE (:P504_ITEM_CATEGORY is null or  ITEMCATEGORYCODE = :P504_ITEM_CATEGORY )'))
,p_lov_cascade_parent_items=>'P504_ITEM_CATEGORY'
,p_ajax_items_to_submit=>'P504_ITEM_NAME'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>300
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55919829549330827)
,p_name=>'P504_ITEM_SPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_prompt=>'Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     ITEMSPECIFICATIONNAME D,',
'     ITEMSPECIFICATIONCODE R',
'FROM V_DASHBOARD_SALES_SUMMARY',
'WHERE (:P504_ITEM_NAME is null or  ITEMCODE = :P504_ITEM_NAME )'))
,p_lov_cascade_parent_items=>'P504_ITEM_NAME'
,p_ajax_items_to_submit=>'P504_ITEM_SPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>300
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460926603208786429)
,p_name=>'P504_LOCATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_item_default=>'CO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55919520145330824)
,p_name=>'P504_PARTY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.PartyName||'' - ''||Getcityname(p.OfficeCityCode) D, a.PartyCode R ',
'from V_DASHBOARD_SALES_SUMMARY A',
'join party p on a.partycode = p.partycode'))
,p_cSize=>300
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60056996448281121)
,p_name=>'P504_REPORTS_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(60056908905281120)
,p_item_default=>'to_char(trunc(sysdate),''YYYYMM'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Month'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH date_bounds AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') AS v_start,',
'        TO_DATE(TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'') AS v_end',
'    FROM dual',
'    WHERE :P504_DATE_RANGE IS NOT NULL',
'),',
'calendar_months AS (',
'    SELECT ',
'        ADD_MONTHS(TRUNC(db.v_start, ''MM''), LEVEL - 1) AS month_start_date',
'    FROM date_bounds db',
'    CONNECT BY LEVEL <= MONTHS_BETWEEN(TRUNC(db.v_end, ''MM''), TRUNC(db.v_start, ''MM'')) + 1',
')',
'SELECT ',
'    TO_CHAR(cm.month_start_date, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') AS display_value,',
'    TO_CHAR(cm.month_start_date, ''YYYYMM'')                                 AS return_value',
'FROM calendar_months cm',
'WHERE EXISTS (',
'    SELECT 1 ',
'    FROM salesorder so',
'    WHERE so.salesorderdate >= cm.month_start_date',
'      AND so.salesorderdate <  ADD_MONTHS(cm.month_start_date, 1)',
')',
'ORDER BY cm.month_start_date ASC;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P504_DATE_RANGE'
,p_ajax_items_to_submit=>'P504_REPORTS_MONTH'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55919983656330828)
,p_name=>'P504_SALES_EXECUTIVE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_prompt=>'Seller'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     NVL(EMP.EMPLOYEENAME, ''Unknown Executive ('' || SO.SALESEXECUTIVECODE || '')'') AS D,',
'     SO.SALESEXECUTIVECODE AS R',
'FROM SALESORDER SO',
'LEFT JOIN EMPLOYEE EMP ON EMP.EMPLOYEECODE = SO.SALESEXECUTIVECODE',
'WHERE SO.SALESEXECUTIVECODE IS NOT NULL;'))
,p_cSize=>300
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59616732539387136)
,p_name=>'P504_TODATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(462996341782491155)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(59616684655387135)
,p_computation_sequence=>10
,p_computation_item=>'P504_FROMDATE'
,p_static_id=>'p504-fromdate'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'TRIM(SUBSTR(:P504_DATE_RANGE, 1, INSTR(:P504_DATE_RANGE, '' - '') - 1))'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(59616858765387137)
,p_computation_sequence=>10
,p_computation_item=>'P504_TODATE'
,p_static_id=>'p504-todate'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'TRIM(SUBSTR(:P504_DATE_RANGE, INSTR(:P504_DATE_RANGE, '' - '') + 3))'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60061502860281166)
,p_name=>'Force Scroll Top On After Refresh'
,p_static_id=>'force-scroll-top-on-after-refresh'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(60056908905281120)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60204819753689917)
,p_event_id=>wwv_flow_imp.id(60061502860281166)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'document.activeElement.blur();',
    'window.scrollTo(0, 0);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60061273020281164)
,p_name=>'Force Scroll Top On Load'
,p_static_id=>'force-scroll-top-on-load'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60061388482281165)
,p_event_id=>wwv_flow_imp.id(60061273020281164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'document.activeElement.blur();',
    'window.scrollTo(0, 0);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(57100469001729218)
,p_name=>'Hide navigation menu'
,p_static_id=>'hide-navigation-menu'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57100544950729219)
,p_event_id=>wwv_flow_imp.id(57100469001729218)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(56845041047083229)
,p_name=>'Load Chart After Refresh'
,p_static_id=>'load-chart-after-refresh'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#Card_Dashboard'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56845124574083230)
,p_event_id=>wwv_flow_imp.id(56845041047083229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'window.initCharts();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(55921600191330844)
,p_name=>'On Change Refresh the regions'
,p_static_id=>'on-change-refresh-the-regions'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P504_DATE_RANGE,P504_PARTY,P504_ITEM_CATEGORY,P504_ITEM_NAME,P504_ITEM_SPECIFICATION,P504_SALES_EXECUTIVE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56844899924083227)
,p_event_id=>wwv_flow_imp.id(55921600191330844)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region(''Card_Dashboard'').refresh();',
    '// apex.region(''Card_Dashboard_Debug'').refresh();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(59865211579688951)
,p_name=>'Refresh the Qty Over Time Chart on Change'
,p_static_id=>'refresh-the-qty-over-time-chart-on-change'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P504_QTY_OVER_TIME_MONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(59865307751688952)
,p_event_id=>wwv_flow_imp.id(59865211579688951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(59864449527688944)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60057023020281122)
,p_name=>'Refresh the Report Region'
,p_static_id=>'refresh-the-report-region'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P504_REPORTS_MONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60057156783281123)
,p_event_id=>wwv_flow_imp.id(60057023020281122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const reportsToRefresh = [',
    '    ''S_CUSTOMER_CHECK'',',
    '    ''S_STATE_CITY_ORDER'',',
    '    ''S_SELLER_STATE'',',
    '    ''S_SELLER_ITEM_CATEGORY'',',
    '    ''S_PARTY_PENDING_QTY'',',
    '    ''S_QTY_OVER_TIME''',
    '];',
    '',
    'reportsToRefresh.forEach(regionId => {',
    '    let targetRegion = apex.region(regionId);',
    '    if (targetRegion) {',
    '        targetRegion.refresh();',
    '    }',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(441073550467483690)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create temp data'
,p_static_id=>'create-temp-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Top 10 Customer */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10customer;',
'  For c In (Select x.LabelName, x.ValueName, X.PARTYCODE',
'              From (Select GetPartyname(a.PartyCode) LabelName,',
'                           Sum(a.TotalAmount) As ValueName,',
'                           A.PARTYCODE',
'                      From BI_SRevenue a, Financialyear b',
'                     Where a.CCInvoiceDate <= :P504_DATE',
'                       and a.Financialyearcode = b.Financialyearcode',
'                       and :P504_DATE between b.Financialyearbegin and b.Financialyearend',
'                          And :P504_DATE Between B.FinancialYearBegin And B.FinancialYearend',
'                     Group By GetPartyname(a.PartyCode), A.PARTYCODE',
'                     Order By 2 Desc) x',
'             Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p504_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp1',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp2',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp3',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp4',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp5',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp6',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp7',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp8',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp9',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp10',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp11',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp12',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10customer',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (c.labelname,',
'       c.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* Top 10 State */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10state;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.StateCode',
'                     From (Select c.StateName LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  C.StateCode',
'                             From BI_SRevenue a, Party b, State c, FinancialYear d',
'                            Where a.partyCode = b.PartyCode',
'                              And b.Officestatecode = c.StateCode',
'                              And a.CCInvoiceDate <= :P504_DATE',
'                              and a.FinancialyearCode = d.Financialyearcode',
'                              and :P504_DATE between d.financialyearbegin and d.financialyearend',
'                               Group By c.StateName, c.StateCode',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p504_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp1',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp2',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp3',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp4',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp5',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp6',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp7',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp8',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp9',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp10',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp11',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp12',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10State',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* TOP 10 Item */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10Item;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.ITEMCODE',
'                     From (Select GetItemname(a.ItemCode) LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  A.ITEMCODE',
'                             From BI_SRevenue a, Financialyear b',
'                            Where a.CCInvoiceDate <= :P504_DATE',
'                              and a.FinancialyearCode = b.FinancialyearCode',
'                              and :P504_DATE between b.FinancialyearBegin and b.FinancialyearEnd',
'                            Group By GetItemname(a.ItemCode), A.ITEMCODE',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p504_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10item',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>2088681267785706
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(55922835464330857)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Default Values'
,p_static_id=>'get-default-values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P504_FY_BEGIN      := :GLOBAL_FINANCIALYEARBEGIN;',
'    :P504_FY_END        := :GLOBAL_FINANCIALYEAREND;',
'    IF :P504_DATE_RANGE IS NULL THEN',
'        :P504_DATE_RANGE    :=  :P504_FY_BEGIN||'' - ''||:P504_FY_END;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>38455823339101541
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(441073146959483686)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Top 10 Customer */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10customer;',
'  For c In (Select x.LabelName, x.ValueName, X.PARTYCODE',
'              From (Select GetPartyname(a.PartyCode) LabelName,',
'                           Sum(a.TotalAmount) As ValueName,',
'                           A.PARTYCODE',
'                      From BI_SRevenue a, Financialyear b',
'                     Where a.CCInvoiceDate <= :P504_DATE',
'                       and a.Financialyearcode = b.Financialyearcode',
'                       and :P504_DATE between b.Financialyearbegin and b.Financialyearend',
'                     Group By GetPartyname(a.PartyCode), A.PARTYCODE',
'                     Order By 2 Desc) x',
'             Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p504_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp1',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp2',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp3',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp4',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp5',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp6',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp7',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp8',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp9',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp10',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp11',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp12',
'          From CCInvoice aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10customer',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (c.labelname,',
'       c.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* Top 10 State */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10state;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.StateCode',
'                     From (Select c.StateName LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  C.StateCode',
'                             From BI_SRevenue a, Party b, State c, FinancialYear d',
'                            Where a.partyCode = b.PartyCode',
'                              And b.Officestatecode = c.StateCode',
'                              And a.CCInvoiceDate <= :P504_DATE',
'                              and a.FinancialyearCode = d.Financialyearcode',
'                              and :P504_DATE between d.financialyearbegin and d.financialyearend',
'                            Group By c.StateName, c.StateCode',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p504_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp1',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp2',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp3',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp4',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp5',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp6',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp7',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp8',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp9',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp10',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp11',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.CCInvoiceAmount)',
'          Into vp12',
'          From CCInvoice aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10State',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* TOP 10 Item */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10Item;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.ITEMCODE',
'                     From (Select GetItemname(a.ItemCode) LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  A.ITEMCODE',
'                             From BI_SRevenue a, Financialyear b',
'                            Where a.CCInvoiceDate <= :P504_DATE',
'                              and a.FinancialyearCode = b.FinancialyearCode',
'                              and :P504_DATE between b.FinancialyearBegin and b.FinancialyearEnd',
'                            Group By GetItemname(a.ItemCode), A.ITEMCODE',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p504_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_SRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.CCInvoiceDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P504_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P504_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10item',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2088277759785702
);
wwv_flow_imp.component_end;
end;
/
