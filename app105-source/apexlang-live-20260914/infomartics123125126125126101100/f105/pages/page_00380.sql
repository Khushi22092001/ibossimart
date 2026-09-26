prompt --application/pages/page_00380
begin
--   Manifest
--     PAGE: 00380
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>380
,p_name=>'Sales Dashboard Detail Report'
,p_alias=>'SALES-DASHBOARD-DETAIL-REPORT'
,p_page_mode=>'MODAL'
,p_step_title=>'Sales Dashboard Detail Report'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.ui-widget-overlay.clickable-overlay {',
'    cursor: pointer;',
'}',
'',
'',
'.my-custom-tags {',
'    max-width: 400px;',
'    word-break: break-word;',
'}',
'.my-badge {',
'    display: inline-block;',
'    background-color: #f0f4f8;',
'    color: #1a4f7c;',
'    padding: 4px 8px;',
'    border-radius: 4px;',
'    font-size: 12px;',
'    border: 1px solid #d1e2f2;',
'    line-height: 1.8;',
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
'  ',
'',
'/* ================================================ */',
'',
'#Parent .ui-dialog-titlebar {',
'    background: #1a1a2e !important;',
'    color: #ffffff !important;',
'}',
'',
'#Parent .ui-dialog-title {',
'    color: #ffffff !important;',
'    font-size: 16px !important;',
'    font-weight: 500 !important;',
'}',
'',
'#Parent .ui-dialog-titlebar-close {',
'    color: #ffffff !important;',
'}',
'',
'#Parent .ui-widget-header {',
'    background: #1a1a2e !important;',
'    border: none !important;',
'}'))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'1400'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50970578070425715)
,p_plug_name=>'Cancelled Out Filters'
,p_static_id=>'cancelled-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>81
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(51399225828135474)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_CANCELLED_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51398987366135471)
,p_name=>'P380_CO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(50970578070425715)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51398920991135470)
,p_name=>'P380_CO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(50970578070425715)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51399080690135472)
,p_name=>'P380_CO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(50970578070425715)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51399135500135473)
,p_name=>'P380_CO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(50970578070425715)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(51399225828135474)
,p_name=>'Cancelled Out Report'
,p_static_id=>'cancelled-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(50970578070425715)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    P.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE)   AS CITYNAME,',
'    GETSTATENAME(P.OFFICESTATECODE) AS STATENAME,',
'    P.PARTYNAME || '', '' || GETCITYNAME(P.OFFICECITYCODE) || '', '' || GETSTATENAME(P.OFFICESTATECODE) AS DTL_PARTYNAME,',
'    CAST(TRUNC(SO.SALESORDERDATE) AS DATE) AS SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    SOD.ITEMCODE,',
'    GETITEMNAME(SOD.ITEMCODE)                                       AS ITEMNAME,',
'    GETITEMSPECIFICATIONNAME(SOD.ITEMCODE, SOD.ITEMSPECIFICATIONCODE) AS SPECIFICATION,',
'    SOD.QUANTITY1                                                   AS ORDERED_QTY,',
'    NVL(DR.SUM_QTY, 0)                                             AS DISPATCHED_QTY,',
'    NVL(LR.SUM_QTY, 0)                                             AS LOADING_QTY,',
'    GREATEST(SOD.QUANTITY1 - NVL(DR.SUM_QTY, 0) - NVL(LR.SUM_QTY, 0), 0) AS CANCELLED_QTY',
'FROM SALESORDER SO',
'JOIN SALESORDERDETAIL SOD           ON SO.TNO = SOD.TNO',
'LEFT JOIN PARTY P                   ON P.PARTYCODE = SO.PARTYCODE',
'LEFT JOIN (',
'    SELECT DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE, DA.REFERENCETNO, SUM(DAD.QUANTITY1) AS SUM_QTY',
'    FROM DESPATCHADVICEDETAIL DAD',
'    JOIN DESPATCHADVICE DA          ON DAD.TNO = DA.TNO',
'    GROUP BY DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE, DA.REFERENCETNO',
') DR ON DR.REFERENCETNO = SO.TNO',
'    AND DR.ITEMCODE = SOD.ITEMCODE',
'    AND NVL(DR.ITEMSPECIFICATIONCODE, ''X'') = NVL(SOD.ITEMSPECIFICATIONCODE, ''X'')',
'LEFT JOIN (',
'    SELECT LAD.ITEMCODE, LAD.ITEMSPECIFICATIONCODE, LA.SALESORDERTNO, SUM(LAD.QUANTITY1) AS SUM_QTY',
'    FROM LOADINGADVICEDETAIL LAD',
'    JOIN LOADINGADVICE LA           ON LAD.TNO = LA.TNO',
'    GROUP BY LAD.ITEMCODE, LAD.ITEMSPECIFICATIONCODE, LA.SALESORDERTNO',
') LR ON LR.SALESORDERTNO = SO.TNO',
'    AND LR.ITEMCODE = SOD.ITEMCODE',
'    AND NVL(LR.ITEMSPECIFICATIONCODE, ''X'') = NVL(SOD.ITEMSPECIFICATIONCODE, ''X'')',
'WHERE TRUNC(SO.SALESORDERDATE) BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND GETDOCUMENTSTATUSCODE(''SALESORDER'', SO.TNO) = ''SHORTCLOSED''',
'  AND GREATEST(SOD.QUANTITY1 - NVL(DR.SUM_QTY, 0) - NVL(LR.SUM_QTY, 0), 0) > 0',
'  AND (:P380_PARTY             IS NULL OR INSTR('':''||:P380_PARTY||'':'',             '':''||SO.PARTYCODE||'':'')              > 0)',
'  AND (:P380_ITEM              IS NULL OR INSTR('':''||:P380_ITEM||'':'',              '':''||SOD.ITEMCODE||'':'')              > 0)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P380_ITEMSPECIFICATION||'':'', '':''||SOD.ITEMSPECIFICATIONCODE||'':'') > 0)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR INSTR('':''||:P380_SALES_EXECUTIVE||'':'',   '':''||SO.SALESEXECUTIVECODE||'':'')     > 0)',
'  AND (:P380_ITEM_CATEGORY     IS NULL OR EXISTS (',
'          SELECT 1 FROM V_ITEM_DETAILS VI',
'          WHERE VI.ITEMCODE = SOD.ITEMCODE',
'          AND INSTR('':''||:P380_ITEM_CATEGORY||'':'','':''||VI.ITEMCATEGORYCODE||'':'') > 0',
'      ))',
'ORDER BY SO.SALESORDERDATE DESC, SO.SALESORDERNO'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(51401086717135492)
,p_query_column_id=>14
,p_column_alias=>'CANCELLED_QTY'
,p_column_display_sequence=>140
,p_column_heading=>'CANCELLED QTY'
,p_column_format=>'999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399528485135477)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51401539624135497)
,p_query_column_id=>12
,p_column_alias=>'DISPATCHED_QTY'
,p_column_display_sequence=>190
,p_column_heading=>'Dispatched Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399775256135479)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51401220667135493)
,p_query_column_id=>8
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>150
,p_column_heading=>'Itemcode'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51401300701135494)
,p_query_column_id=>9
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>160
,p_column_heading=>'Itemname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51401628736135498)
,p_query_column_id=>13
,p_column_alias=>'LOADING_QTY'
,p_column_display_sequence=>200
,p_column_heading=>'Loading Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51401459699135496)
,p_query_column_id=>11
,p_column_alias=>'ORDERED_QTY'
,p_column_display_sequence=>180
,p_column_heading=>'Ordered Qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399375717135475)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399502398135476)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399904936135480)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399973696135481)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51401391077135495)
,p_query_column_id=>10
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>170
,p_column_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51399652179135478)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52073326273684367)
,p_plug_name=>'Category Wise Revenue By Amount Filters'
,p_static_id=>'category-wise-revenue-by-amount-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>91
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(52074262973684376)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'CATEGORY_WISE_AMOUNT'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52073550944684369)
,p_name=>'P380_CWRBA_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(52073326273684367)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52073426408684368)
,p_name=>'P380_CWRBA_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(52073326273684367)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52073692908684370)
,p_name=>'P380_CWRBA_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(52073326273684367)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52073812908684371)
,p_name=>'P380_CWRBA_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(52073326273684367)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(52074262973684376)
,p_name=>'Category Wise Revenue By Amount Report'
,p_static_id=>'category-wise-revenue-by-amount-report'
,p_parent_plug_id=>wwv_flow_imp.id(52073326273684367)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NVL(ic.itemcategoryname, ''Uncategorized'')                          AS item_category,',
'    NVL(ic.itemcategorycode, ''UNCAT'')                                  AS item_category_code,',
'    p.partycode,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                       AS cityname,',
'    GETSTATENAME(p.officestatecode)                                     AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' || ',
'    GETSTATENAME(p.officestatecode)                                     AS dtl_partyname,',
'    CAST(TRUNC(so.salesorderdate) AS DATE)                             AS salesorderdate,',
'    so.salesorderno,',
'    sod.itemcode,',
'    GETITEMNAME(sod.itemcode)                                           AS itemname,',
'    GETITEMSPECIFICATIONNAME(sod.itemcode, sod.itemspecificationcode)   AS specification,',
'    GETMEASURINGUNITNAMEFROMITEM(sod.itemcode)                          AS uom,',
'    SUM(sod.quantity1)                                                  AS total_qty,',
'    SUM(sod.amount)                                                     AS total_amount',
'FROM salesorder so',
'JOIN salesorderdetail sod  ON so.tno = sod.tno',
'LEFT JOIN item it           ON it.itemcode = sod.itemcode',
'LEFT JOIN itemcategory ic   ON ic.itemcategorycode = it.itemcategorycode',
'LEFT JOIN party p           ON p.partycode = so.partycode',
'WHERE TRUNC(so.salesorderdate) BETWEEN TO_DATE(:P380_FROMDATE, ''DD-MM-YYYY'')',
'                                   AND TO_DATE(:P380_TODATE,   ''DD-MM-YYYY'')',
'  AND (:P380_PARTY             IS NULL OR INSTR('':''||:P380_PARTY||'':'',             '':''||so.partycode||'':'')                > 0)',
'  AND (:P380_ITEM              IS NULL OR INSTR('':''||:P380_ITEM||'':'',              '':''||sod.itemcode||'':'')                > 0)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P380_ITEMSPECIFICATION||'':'', '':''||sod.itemspecificationcode||'':'')   > 0)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR INSTR('':''||:P380_SALES_EXECUTIVE||'':'',   '':''||so.salesexecutivecode||'':'')       > 0)',
'  AND (:P380_ITEM_CATEGORY     IS NULL OR INSTR('':''||:P380_ITEM_CATEGORY||'':'',     '':''||ic.itemcategorycode||'':'')         > 0)',
'GROUP BY',
'    ic.itemcategoryname,',
'    ic.itemcategorycode,',
'    p.partycode,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode),',
'    GETSTATENAME(p.officestatecode),',
'    CAST(TRUNC(so.salesorderdate) AS DATE),',
'    so.salesorderno,',
'    sod.itemcode,',
'    GETITEMNAME(sod.itemcode),',
'    GETITEMSPECIFICATIONNAME(sod.itemcode, sod.itemspecificationcode),',
'    GETMEASURINGUNITNAMEFROMITEM(sod.itemcode)',
'ORDER BY',
'    ic.itemcategoryname,',
'    total_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(52078303470684416)
,p_query_column_id=>5
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52983495292944168)
,p_query_column_id=>7
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>190
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52983809549944171)
,p_query_column_id=>10
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52983836495944172)
,p_query_column_id=>11
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>240
,p_column_heading=>'ITEM'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52076240946684396)
,p_query_column_id=>1
,p_column_alias=>'ITEM_CATEGORY'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52076405923684397)
,p_query_column_id=>2
,p_column_alias=>'ITEM_CATEGORY_CODE'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52078062364684414)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52078190698684415)
,p_query_column_id=>4
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52983610798944169)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>210
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52983689040944170)
,p_query_column_id=>9
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>200
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52984010915944173)
,p_query_column_id=>12
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>250
,p_column_heading=>'ITEM SPECIFICATION'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52983350425944167)
,p_query_column_id=>6
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52984273281944176)
,p_query_column_id=>15
,p_column_alias=>'TOTAL_AMOUNT'
,p_column_display_sequence=>280
,p_column_heading=>'TOTAL AMOUNT'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52984197150944175)
,p_query_column_id=>14
,p_column_alias=>'TOTAL_QTY'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52984100227944174)
,p_query_column_id=>13
,p_column_alias=>'UOM'
,p_column_display_sequence=>260
,p_column_heading=>'MEASURING UNIT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52984329145944177)
,p_plug_name=>'Category Wise Revenue By Quantity  Filters'
,p_static_id=>'category-wise-revenue-by-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>101
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(52985227094944186)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'CATEGORY_WISE_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52984597521944179)
,p_name=>'P380_CWRBQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(52984329145944177)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52984435822944178)
,p_name=>'P380_CWRBQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(52984329145944177)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52984706854944180)
,p_name=>'P380_CWRBQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(52984329145944177)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52985182001944185)
,p_name=>'P380_CWRBQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(52984329145944177)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(52985227094944186)
,p_name=>'Category Wise Revenue By Quantity Report'
,p_static_id=>'category-wise-revenue-by-quantity-report'
,p_parent_plug_id=>wwv_flow_imp.id(52984329145944177)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NVL(ic.itemcategoryname, ''Uncategorized'')                          AS item_category,',
'    NVL(ic.itemcategorycode, ''UNCAT'')                                  AS item_category_code,',
'    p.partycode,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                       AS cityname,',
'    GETSTATENAME(p.officestatecode)                                     AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' || ',
'    GETSTATENAME(p.officestatecode)                                     AS dtl_partyname,',
'    CAST(TRUNC(so.salesorderdate) AS DATE)                             AS salesorderdate,',
'    so.salesorderno,',
'    sod.itemcode,',
'    GETITEMNAME(sod.itemcode)                                           AS itemname,',
'    GETITEMSPECIFICATIONNAME(sod.itemcode, sod.itemspecificationcode)   AS specification,',
'    GETMEASURINGUNITNAMEFROMITEM(sod.itemcode)                          AS uom,',
'    SUM(sod.quantity1)                                                  AS total_qty,',
'    SUM(sod.amount)                                                     AS total_amount',
'FROM salesorder so',
'JOIN salesorderdetail sod  ON so.tno = sod.tno',
'LEFT JOIN item it           ON it.itemcode = sod.itemcode',
'LEFT JOIN itemcategory ic   ON ic.itemcategorycode = it.itemcategorycode',
'LEFT JOIN party p           ON p.partycode = so.partycode',
'WHERE TRUNC(so.salesorderdate) BETWEEN TO_DATE(:P380_FROMDATE, ''DD-MM-YYYY'')',
'                                   AND TO_DATE(:P380_TODATE,   ''DD-MM-YYYY'')',
'  AND (:P380_PARTY             IS NULL OR INSTR('':''||:P380_PARTY||'':'',             '':''||so.partycode||'':'')                > 0)',
'  AND (:P380_ITEM              IS NULL OR INSTR('':''||:P380_ITEM||'':'',              '':''||sod.itemcode||'':'')                > 0)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P380_ITEMSPECIFICATION||'':'', '':''||sod.itemspecificationcode||'':'')   > 0)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR INSTR('':''||:P380_SALES_EXECUTIVE||'':'',   '':''||so.salesexecutivecode||'':'')       > 0)',
'  AND (:P380_ITEM_CATEGORY     IS NULL OR INSTR('':''||:P380_ITEM_CATEGORY||'':'',     '':''||ic.itemcategorycode||'':'')         > 0)',
'GROUP BY',
'    ic.itemcategoryname,',
'    ic.itemcategorycode,',
'    p.partycode,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode),',
'    GETSTATENAME(p.officestatecode),',
'    CAST(TRUNC(so.salesorderdate) AS DATE),',
'    so.salesorderno,',
'    sod.itemcode,',
'    GETITEMNAME(sod.itemcode),',
'    GETITEMSPECIFICATIONNAME(sod.itemcode, sod.itemspecificationcode),',
'    GETMEASURINGUNITNAMEFROMITEM(sod.itemcode)',
'ORDER BY',
'    ic.itemcategoryname,',
'    total_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(52985763522944191)
,p_query_column_id=>5
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52985938970944193)
,p_query_column_id=>7
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>70
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986287517944196)
,p_query_column_id=>10
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986349482944197)
,p_query_column_id=>11
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>110
,p_column_heading=>'ITEM'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52985386562944187)
,p_query_column_id=>1
,p_column_alias=>'ITEM_CATEGORY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52985508429944188)
,p_query_column_id=>2
,p_column_alias=>'ITEM_CATEGORY_CODE'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52985579917944189)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52985624192944190)
,p_query_column_id=>4
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986148080944195)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986100392944194)
,p_query_column_id=>9
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>80
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986458889944198)
,p_query_column_id=>12
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>120
,p_column_heading=>'ITEM SPECIFICATION'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52985883390944192)
,p_query_column_id=>6
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986769710944201)
,p_query_column_id=>15
,p_column_alias=>'TOTAL_AMOUNT'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986695426944200)
,p_query_column_id=>14
,p_column_alias=>'TOTAL_QTY'
,p_column_display_sequence=>140
,p_column_heading=>'Total Qty'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52986595836944199)
,p_query_column_id=>13
,p_column_alias=>'UOM'
,p_column_display_sequence=>130
,p_column_heading=>'MEASURING UNIT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54341870628855099)
,p_plug_name=>'Customer WIse Orders Filters'
,p_static_id=>'customer-wise-orders-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>161
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(54342726160855108)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'CUSTOMER_WISE_ORDERS'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54342048582855101)
,p_name=>'P380_CWO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54341870628855099)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54341931804855100)
,p_name=>'P380_CWO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54341870628855099)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54342219349855102)
,p_name=>'P380_CWO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54341870628855099)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54342278145855103)
,p_name=>'P380_CWO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(54341870628855099)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(54342726160855108)
,p_name=>'Customer Wise Orders Report'
,p_static_id=>'customer-wise-orders-report'
,p_parent_plug_id=>wwv_flow_imp.id(54341870628855099)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE (:P380_PARTY IS NULL OR so.partycode = :P380_PARTY)',
'GROUP BY',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    emp.employeename',
'ORDER BY',
'    so.salesorderdate DESC,',
'    total_base_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_STATE'
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
 p_id=>wwv_flow_imp.id(54342948259855110)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54343065026855111)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54342857937855109)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54343353858855114)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54343297113855113)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>50
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54343485105855115)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54343164863855112)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54343612165855116)
,p_query_column_id=>8
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>80
,p_column_heading=>'Total qty'
,p_column_format=>'9999999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54446248275982867)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10120904816413711)
,p_plug_name=>'Dispatched Quantity Out Filters'
,p_static_id=>'dispatched-quantity-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>61
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(10073228009907718)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_LOADINGADVICE_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10121640780413718)
,p_name=>'P380_DQO_LA_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10120904816413711)
,p_prompt=>'Loading Advice Date'
,p_source=>'LOADINGADVICEDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10121706397413719)
,p_name=>'P380_DQO_LA_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10120904816413711)
,p_prompt=>'Loading Advice No'
,p_source=>'LOADINGADVICENO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10121477512413717)
,p_name=>'P380_DQO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10120904816413711)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10121379143413716)
,p_name=>'P380_DQO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10120904816413711)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10073228009907718)
,p_name=>'Dispatched Quantity Out Report'
,p_static_id=>'dispatched-quantity-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(10120904816413711)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    P.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE)                                                                    AS CITYNAME,',
'    GETSTATENAME(P.OFFICESTATECODE)                                                                  AS STATENAME,',
'    P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE)         AS DTL_PARTYNAME,',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    LA.LOADINGADVICEDATE,',
'    LA.LOADINGADVICENO,',
'    SUM(LAD.QUANTITY1)                                                                               AS DISPATCHEDQTYOUT,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => P.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS PARTY_LINK,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''LOADINGADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 155,',
'                p_items  => ''P155_TNO'',',
'                p_values => LA.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS LA_LINK',
'FROM LOADINGADVICE LA',
'LEFT JOIN LOADINGADVICEDETAIL LAD ON LA.TNO = LAD.TNO',
'LEFT JOIN SALESORDER SO           ON SO.TNO = LA.SALESORDERTNO',
'LEFT JOIN PARTY P                 ON P.PARTYCODE = LA.SUPPLIERCODE',
'WHERE LA.LOADINGADVICEDATE BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY             IS NULL OR :P380_PARTY             = LA.SUPPLIERCODE)',
'  AND (:P380_ITEM              IS NULL OR :P380_ITEM              = LAD.ITEMCODE)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR :P380_ITEMSPECIFICATION = LAD.ITEMSPECIFICATIONCODE)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR :P380_SALES_EXECUTIVE   = SO.SALESEXECUTIVECODE)',
'GROUP BY',
'    P.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE),',
'    GETSTATENAME(P.OFFICESTATECODE),',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    LA.LOADINGADVICEDATE,',
'    LA.LOADINGADVICENO,',
'    P.TNO,',
'    LA.TNO'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(10073476816907721)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50969145607425701)
,p_query_column_id=>10
,p_column_alias=>'DISPATCHEDQTYOUT'
,p_column_display_sequence=>120
,p_column_heading=>'DISPATCHED QTY OUT'
,p_column_format=>'999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10073731313907723)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54826171806660083)
,p_query_column_id=>12
,p_column_alias=>'LA_LINK'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50968932613425699)
,p_query_column_id=>8
,p_column_alias=>'LOADINGADVICEDATE'
,p_column_display_sequence=>100
,p_column_heading=>'LOADING ADVICE DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50969052398425700)
,p_query_column_id=>9
,p_column_alias=>'LOADINGADVICENO'
,p_column_display_sequence=>110
,p_column_heading=>'LOADING ADVICE NO'
,p_column_html_expression=>'<a href="#LA_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#LOADINGADVICENO#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10073266107907719)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10073366972907720)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54826036997660082)
,p_query_column_id=>11
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825843003660080)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825923040660081)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10073573192907722)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53939116834322479)
,p_plug_name=>'Month Wise Quantity Filters'
,p_static_id=>'month-wise-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>111
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(53940017502322488)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'MONTH_WISE_ORDERS'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939258847322481)
,p_name=>'P380_MWQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53939116834322479)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939146617322480)
,p_name=>'P380_MWQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53939116834322479)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939396226322482)
,p_name=>'P380_MWQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53939116834322479)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939486895322483)
,p_name=>'P380_MWQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53939116834322479)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(53940017502322488)
,p_name=>'Month Wise Report'
,p_static_id=>'month-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(53939116834322479)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>121
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE TO_CHAR(so.salesorderdate, ''Mon YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') = :P380_SELECTED_MONTH',
'  AND (:P380_PARTY           IS NULL OR :P380_PARTY           = so.partycode)',
'  AND (:P380_SALES_EXECUTIVE IS NULL OR :P380_SALES_EXECUTIVE = so.salesexecutivecode)',
'GROUP BY',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    emp.employeename',
'ORDER BY',
'    so.salesorderdate DESC,',
'    total_base_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_SALES_EXECUTIVE,P380_FROMDATE,P380_PARTY,P380_TODATE,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(53940251025322491)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940465256322493)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940171971322490)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940666295322495)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940610647322494)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940724037322496)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940355133322492)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53940872123322497)
,p_query_column_id=>8
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>90
,p_column_heading=>'Totalqty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53941278558322501)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>120
,p_column_heading=>'Total Amount'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49559913722026477)
,p_plug_name=>'&P380_HEADER_TITLE.'
,p_static_id=>'p380-header-title'
,p_region_name=>'Parent'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50909079030915281)
,p_plug_name=>'Pending Quantity Out Filters'
,p_static_id=>'pending-quantity-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>71
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(50909960935915290)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_LOADINGADVICE_PENDING_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50909659264915287)
,p_name=>'P380_PQO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(50909079030915281)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50909613461915286)
,p_name=>'P380_PQO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(50909079030915281)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50909777668915288)
,p_name=>'P380_PQO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(50909079030915281)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50909830713915289)
,p_name=>'P380_PQO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(50909079030915281)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(50909960935915290)
,p_name=>'Pending Quantity Out Report'
,p_static_id=>'pending-quantity-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(50909079030915281)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    SO.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE)                                                               AS CITYNAME,',
'    GETSTATENAME(P.OFFICESTATECODE)                                                             AS STATENAME,',
'    P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE)    AS DTL_PARTYNAME,',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    SOD.ITEMCODE,',
'    GETITEMNAME(SOD.ITEMCODE)                                                                   AS ITEMNAME,',
'    SOD.ITEMSPECIFICATIONCODE                                                                   AS SPECIFICATION,',
'    SO.SALESEXECUTIVECODE,',
'    GETEMPLOYEENAME(SO.SALESEXECUTIVECODE)                                                      AS SALESEXECUTIVENAME,',
'    SUM(GREATEST(',
'        SOD.QUANTITY1',
'        - COALESCE(LR.SUM_QTY, 0)',
'        - COALESCE(DR.SUM_QTY, 0),',
'    0))                                                                                         AS PENDINGQTYOUT,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => P.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS PARTY_LINK,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 171,',
'                p_items  => ''P171_TNO'',',
'                p_values => SO.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS SO_LINK',
'FROM SALESORDER SO',
'LEFT JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'LEFT JOIN PARTY P              ON P.PARTYCODE = SO.PARTYCODE',
'LEFT JOIN (',
'    SELECT DA.REFERENCETNO, DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE, SUM(DAD.QUANTITY1) AS SUM_QTY',
'    FROM DESPATCHADVICE DA',
'    JOIN DESPATCHADVICEDETAIL DAD ON DA.TNO = DAD.TNO',
'    GROUP BY DA.REFERENCETNO, DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE',
') DR',
'    ON  DR.REFERENCETNO          = SO.TNO',
'    AND DR.ITEMCODE              = SOD.ITEMCODE',
'    AND DR.ITEMSPECIFICATIONCODE = SOD.ITEMSPECIFICATIONCODE',
'LEFT JOIN (',
'    SELECT LA.SALESORDERTNO, LAD.ITEMCODE, LAD.ITEMSPECIFICATIONCODE, SUM(LAD.QUANTITY1) AS SUM_QTY',
'    FROM LOADINGADVICE LA',
'    JOIN LOADINGADVICEDETAIL LAD ON LA.TNO = LAD.TNO',
'    GROUP BY LA.SALESORDERTNO, LAD.ITEMCODE, LAD.ITEMSPECIFICATIONCODE',
') LR',
'    ON  LR.SALESORDERTNO         = SO.TNO',
'    AND LR.ITEMCODE              = SOD.ITEMCODE',
'    AND LR.ITEMSPECIFICATIONCODE = SOD.ITEMSPECIFICATIONCODE',
'WHERE SO.SALESORDERDATE BETWEEN TO_DATE(:P380_FROMDATE, ''DD-MM-YYYY'')',
'                             AND TO_DATE(:P380_TODATE,   ''DD-MM-YYYY'')',
'  AND (:P380_PARTY             IS NULL OR INSTR('':''||:P380_PARTY||'':'',             '':''||SO.PARTYCODE||'':'')              > 0)',
'  AND (:P380_ITEM              IS NULL OR INSTR('':''||:P380_ITEM||'':'',              '':''||SOD.ITEMCODE||'':'')              > 0)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P380_ITEMSPECIFICATION||'':'', '':''||SOD.ITEMSPECIFICATIONCODE||'':'') > 0)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR INSTR('':''||:P380_SALES_EXECUTIVE||'':'',   '':''||SO.SALESEXECUTIVECODE||'':'')    > 0)',
'  AND (:P380_ITEM_CATEGORY     IS NULL OR EXISTS (',
'          SELECT 1 FROM V_ITEM_DETAILS VI',
'          WHERE VI.ITEMCODE = SOD.ITEMCODE',
'            AND INSTR('':''||:P380_ITEM_CATEGORY||'':'', '':''||VI.ITEMCATEGORYCODE||'':'') > 0',
'  ))',
'GROUP BY',
'    SO.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE),',
'    GETSTATENAME(P.OFFICESTATECODE),',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    SOD.ITEMCODE,',
'    GETITEMNAME(SOD.ITEMCODE),',
'    SOD.ITEMSPECIFICATIONCODE,',
'    SO.SALESEXECUTIVECODE,',
'    GETEMPLOYEENAME(SO.SALESEXECUTIVECODE),',
'    P.TNO,',
'    SO.TNO',
'HAVING SUM(GREATEST(',
'    SOD.QUANTITY1',
'    - COALESCE(LR.SUM_QTY, 0)',
'    - COALESCE(DR.SUM_QTY, 0),',
'0)) > 0',
'ORDER BY SO.SALESORDERDATE, SO.SALESORDERNO'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_SALES_EXECUTIVE,P380_ITEM_CATEGORY'
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
 p_id=>wwv_flow_imp.id(50969842672425708)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50970114362425710)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>140
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52075761570684391)
,p_query_column_id=>8
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52075887361684392)
,p_query_column_id=>9
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50969718814425706)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50969804400425707)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54826295849660084)
,p_query_column_id=>14
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>260
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50967189060425681)
,p_query_column_id=>13
,p_column_alias=>'PENDINGQTYOUT'
,p_column_display_sequence=>170
,p_column_heading=>'PENDING QTY OUT'
,p_column_format=>'999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52076083861684394)
,p_query_column_id=>11
,p_column_alias=>'SALESEXECUTIVECODE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(52076172979684395)
,p_query_column_id=>12
,p_column_alias=>'SALESEXECUTIVENAME'
,p_column_display_sequence=>240
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50970170607425711)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>150
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50970302572425712)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>160
,p_column_heading=>'SALES ORDER NO'
,p_column_html_expression=>'<a href="#SO_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#SALESORDERNO#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54826357653660085)
,p_query_column_id=>15
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54824569209660067)
,p_query_column_id=>10
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>250
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50969927033425709)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53941430872322503)
,p_plug_name=>'Quantity Over Time Filters'
,p_static_id=>'quantity-over-time-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>141
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(53942414129322512)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'QUANTITY_OVER_TIME'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53941629857322505)
,p_name=>'P380_QOT_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53941430872322503)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53941612192322504)
,p_name=>'P380_QOT_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53941430872322503)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53941760550322506)
,p_name=>'P380_QOT_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53941430872322503)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53941915540322507)
,p_name=>'P380_QOT_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53941430872322503)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(53942414129322512)
,p_name=>'Quantity Over Time Report'
,p_static_id=>'quantity-over-time-report'
,p_parent_plug_id=>wwv_flow_imp.id(53941430872322503)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE TO_CHAR(so.salesorderdate, ''DD-Mon-YYYY'', ''NLS_DATE_LANGUAGE = ENGLISH'') = :P380_SELECTED_DAY',
'  AND (:P380_PARTY           IS NULL OR :P380_PARTY           = so.partycode)',
'  AND (:P380_SALES_EXECUTIVE IS NULL OR :P380_SALES_EXECUTIVE = so.salesexecutivecode)',
'GROUP BY',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    emp.employeename',
'ORDER BY',
'    so.salesorderdate DESC,',
'    total_base_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_SALES_EXECUTIVE,P380_FROMDATE,P380_PARTY,P380_TODATE,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(53942706695322515)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54338698898855067)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53942529717322514)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54038861030873469)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54038809162873468)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54038935112873470)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53942811602322516)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54039121376873471)
,p_query_column_id=>8
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>90
,p_column_heading=>'Total qty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54039486596873475)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>100
,p_column_heading=>'Total Amount'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52987756690944211)
,p_plug_name=>'Sales Executive Wise  Quantity  Filters'
,p_static_id=>'sales-executive-wise-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>131
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(53467323904734570)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'SALES_PERSON_WISE'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52987995993944213)
,p_name=>'P380_SEW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(52987756690944211)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52987917999944212)
,p_name=>'P380_SEW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(52987756690944211)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52988102361944214)
,p_name=>'P380_SEW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(52987756690944211)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52988205579944215)
,p_name=>'P380_SEW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(52987756690944211)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(53467323904734570)
,p_name=>'Sales Executive Wise Report'
,p_static_id=>'sales-executive-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(52987756690944211)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'')                           AS sales_executive_code,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE so.salesorderdate BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY           IS NULL OR :P380_PARTY = so.partycode)',
'  AND (',
'        :P380_SALES_EXECUTIVE IS NULL',
'        OR (:P380_SALES_EXECUTIVE = ''UNASSIGNED'' AND so.salesexecutivecode IS NULL)',
'        OR :P380_SALES_EXECUTIVE = so.salesexecutivecode',
'      )',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode,',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno',
'ORDER BY',
'    CASE WHEN NVL(emp.employeename, ''Unassigned'') = ''Unassigned'' THEN 2 ELSE 1 END ASC,',
'    so.salesorderdate DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_SALES_EXECUTIVE,P380_FROMDATE,P380_PARTY,P380_TODATE,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(53467918067734575)
,p_query_column_id=>4
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53468038965734577)
,p_query_column_id=>6
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>70
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53467779589734574)
,p_query_column_id=>3
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53468283606734579)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53468144941734578)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>80
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53938820866322476)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53938185386322470)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53468013949734576)
,p_query_column_id=>5
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53938565531322474)
,p_query_column_id=>9
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>140
,p_column_heading=>'Totalqty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54339119303855071)
,p_query_column_id=>10
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54738785309376994)
,p_plug_name=>'Seller Category Wise Filters'
,p_static_id=>'seller-category-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>181
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(54739675384377003)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'SELLER_CATEGORY_WISE'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54739387666377000)
,p_name=>'P380_SECW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54738785309376994)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54739299804376999)
,p_name=>'P380_SECW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54738785309376994)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54739495901377001)
,p_name=>'P380_SECW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54738785309376994)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54739608901377002)
,p_name=>'P380_SECW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(54738785309376994)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(54739675384377003)
,p_name=>'Seller Category Wise Report'
,p_static_id=>'seller-category-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(54738785309376994)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    GETITEMCATEGORYNAME(vi.itemcategorycode)                           AS category_name,',
'    sod.itemcode,',
'    GETITEMNAME(sod.itemcode)                                          AS item_name,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN v_item_details vi    ON vi.itemcode = sod.itemcode',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE so.salesorderdate BETWEEN TO_DATE(:P380_FROMDATE, ''DD-MM-YYYY'')',
'                            AND TO_DATE(:P380_TODATE,   ''DD-MM-YYYY'')',
'  AND (',
'        :P380_SALES_EXECUTIVE IS NULL',
'        OR (:P380_SALES_EXECUTIVE = ''UNASSIGNED'' AND so.salesexecutivecode IS NULL)',
'        OR :P380_SALES_EXECUTIVE = so.salesexecutivecode',
'      )',
'  AND (:P380_ITEM_CATEGORY IS NULL OR vi.itemcategorycode = :P380_ITEM_CATEGORY)',
'GROUP BY',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    emp.employeename,',
'    vi.itemcategorycode,',
'    sod.itemcode,',
'    GETITEMNAME(sod.itemcode)',
'ORDER BY',
'    so.salesorderdate DESC,',
'    total_base_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_STATE,P380_CITY'
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
 p_id=>wwv_flow_imp.id(54740644069377013)
,p_query_column_id=>8
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Item Category'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54739869148377005)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54739971292377006)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54826567689660087)
,p_query_column_id=>9
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54826653088660088)
,p_query_column_id=>10
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54739783035377004)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54740254305377009)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54740147454377008)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>50
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54740397994377010)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54740105834377007)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54740426484377011)
,p_query_column_id=>11
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>90
,p_column_heading=>'Total qty'
,p_column_format=>'999999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54740583100377012)
,p_query_column_id=>12
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54736541094376972)
,p_plug_name=>'Seller City Wise Filters'
,p_static_id=>'seller-city-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>171
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(54737464154376981)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'SELLER_CITY_WISE'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54736780588376974)
,p_name=>'P380_SCW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54736541094376972)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54736628785376973)
,p_name=>'P380_SCW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54736541094376972)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54736853357376975)
,p_name=>'P380_SCW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54736541094376972)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54736999310376976)
,p_name=>'P380_SCW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(54736541094376972)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(54737464154376981)
,p_name=>'Seller City Wise Report'
,p_static_id=>'seller-city-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(54736541094376972)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE so.salesorderdate BETWEEN TO_DATE(:P380_FROMDATE, ''DD-MM-YYYY'')',
'                            AND TO_DATE(:P380_TODATE,   ''DD-MM-YYYY'')',
'  AND (',
'        :P380_SALES_EXECUTIVE IS NULL',
'        OR (:P380_SALES_EXECUTIVE = ''UNASSIGNED'' AND so.salesexecutivecode IS NULL)',
'        OR :P380_SALES_EXECUTIVE = so.salesexecutivecode',
'      )',
'  AND (:P380_STATE IS NULL OR p.officestatecode = :P380_STATE)',
'  AND (:P380_CITY  IS NULL OR p.officecitycode  = :P380_CITY)',
'GROUP BY',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    emp.employeename',
'ORDER BY',
'    so.salesorderdate DESC,',
'    total_base_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE,P380_STATE,P380_CITY'
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
 p_id=>wwv_flow_imp.id(54737651836376983)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_column_heading=>'City'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54737788310376984)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54737579814376982)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54738083036376987)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54737942841376986)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>50
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54738206328376988)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54737891428376985)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54738272165376989)
,p_query_column_id=>8
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>80
,p_column_heading=>'Total qty'
,p_column_format=>'999999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54738362612376990)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54339664677855077)
,p_plug_name=>'Seller State Wise Filters'
,p_static_id=>'seller-state-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>151
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(54340587593855086)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'SELLER_STATE_WISE'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54339887539855079)
,p_name=>'P380_SSW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54339664677855077)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54339814802855078)
,p_name=>'P380_SSW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54339664677855077)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54339983311855080)
,p_name=>'P380_SSW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54339664677855077)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54340038527855081)
,p_name=>'P380_SSW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(54339664677855077)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(54340587593855086)
,p_name=>'Seller State Wise Report'
,p_static_id=>'seller-state-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(54339664677855077)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE so.salesorderdate BETWEEN TO_DATE(:P380_FROMDATE, ''DD-MM-YYYY'')',
'                            AND TO_DATE(:P380_TODATE,   ''DD-MM-YYYY'')',
'  AND (',
'        :P380_SALES_EXECUTIVE IS NULL',
'        OR (:P380_SALES_EXECUTIVE = ''UNASSIGNED'' AND so.salesexecutivecode IS NULL)',
'        OR TO_CHAR(:P380_SALES_EXECUTIVE) = TO_CHAR(so.salesexecutivecode)',
'      )',
'  AND (:P380_STATE IS NULL OR p.officestatecode = :P380_STATE)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode,',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno',
'ORDER BY',
'    so.salesorderdate DESC,',
'    total_base_amount DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_SALES_EXECUTIVE'
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
 p_id=>wwv_flow_imp.id(54340728075855088)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54341467644855095)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54340683853855087)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54341109305855091)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54340935574855090)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>50
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54341205465855092)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54340872171855089)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54341283872855093)
,p_query_column_id=>8
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>80
,p_column_heading=>'Totalqty'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54341328956855094)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10120046774413702)
,p_plug_name=>'Total Amount Filters'
,p_static_id=>'total-amount-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>51
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(10070757734907694)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_AMOUNT'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10120559030413708)
,p_name=>'P380_TA_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10120046774413702)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10120538157413707)
,p_name=>'P380_TA_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10120046774413702)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10120667061413709)
,p_name=>'P380_TA_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10120046774413702)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10120819768413710)
,p_name=>'P380_TA_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10120046774413702)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10070757734907694)
,p_name=>'Total Amount Report'
,p_static_id=>'total-amount-report'
,p_parent_plug_id=>wwv_flow_imp.id(10120046774413702)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    P.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE)                                                                    AS CITYNAME,',
'    GETSTATENAME(P.OFFICESTATECODE)                                                                  AS STATENAME,',
'    P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE)         AS DTL_PARTYNAME,',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    SUM(SOD.QUANTITY1)                                                                               AS TOTALQTY,',
'    SUM(SOD.AMOUNT)                                                                                  AS TOTALAMOUNT,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => P.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS PARTY_LINK,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 171,',
'                p_items  => ''P171_TNO'',',
'                p_values => SO.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS SO_LINK',
'FROM SALESORDER SO',
'LEFT JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'LEFT JOIN PARTY P              ON P.PARTYCODE = SO.PARTYCODE',
'WHERE SO.SALESORDERDATE BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY             IS NULL OR :P380_PARTY             = SO.PARTYCODE)',
'  AND (:P380_ITEM              IS NULL OR :P380_ITEM              = SOD.ITEMCODE)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR :P380_ITEMSPECIFICATION = SOD.ITEMSPECIFICATIONCODE)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR :P380_SALES_EXECUTIVE   = SO.SALESEXECUTIVECODE)',
'GROUP BY',
'    P.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE),',
'    GETSTATENAME(P.OFFICESTATECODE),',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    P.TNO,',
'    SO.TNO'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(10071140350907697)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10071300439907699)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10070910003907695)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10071011985907696)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825652055660078)
,p_query_column_id=>10
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10071543112907701)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10071609426907702)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>80
,p_column_heading=>'SALES ORDER NO'
,p_column_html_expression=>'<a href="#SO_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#SALESORDERNO#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825745191660079)
,p_query_column_id=>11
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10071178123907698)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10072093344907707)
,p_query_column_id=>9
,p_column_alias=>'TOTALAMOUNT'
,p_column_display_sequence=>100
,p_column_heading=>'TOTAL AMOUNT'
,p_column_format=>'99999999999999999999999999999999999999999990.99'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10071997335907706)
,p_query_column_id=>8
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>90
,p_column_heading=>'TOTAL QUANTITY'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49914541725542992)
,p_plug_name=>'Total Clients Filters'
,p_static_id=>'total-clients-filters'
,p_region_name=>'SID_SMART_FILTER'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(49559402824026472)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_CLIENTS'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49915712678543003)
,p_name=>'P380_TC_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(49914541725542992)
,p_prompt=>'Amount '
,p_source=>'TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_item_icon_css_classes=>'fa-money'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49915474300543001)
,p_name=>'P380_TC_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(49914541725542992)
,p_prompt=>'Party Name'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49915592709543002)
,p_name=>'P380_TC_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(49914541725542992)
,p_prompt=>'Qty'
,p_source=>'TOTALQTY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_item_icon_css_classes=>'fa-cubes'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49915372434543000)
,p_name=>'P380_TC_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(49914541725542992)
,p_prompt=>'Tc Search'
,p_source=>'DTL_PARTYNAME, TOTALQTY, TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(49559402824026472)
,p_name=>'Total Clients Report'
,p_static_id=>'total-clients-report'
,p_parent_plug_id=>wwv_flow_imp.id(49914541725542992)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    SO.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE)                                                                    AS CITYNAME,',
'    GETSTATENAME(P.OFFICESTATECODE)                                                                  AS STATENAME,',
'    P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE)         AS DTL_PARTYNAME,',
'    SUM(SOD.QUANTITY1)                                                                               AS TOTALQTY,',
'    SUM(SOD.AMOUNT)                                                                                  AS TOTAL_BASE_AMOUNT,',
'    P.TNO                                                                                            AS PARTY_TNO,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => P.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS PARTY_LINK',
'FROM SALESORDER SO',
'LEFT JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'LEFT JOIN PARTY P              ON P.PARTYCODE = SO.PARTYCODE',
'WHERE SO.SALESORDERDATE BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY             IS NULL OR :P380_PARTY             = SO.PARTYCODE)',
'  AND (:P380_ITEM              IS NULL OR :P380_ITEM              = SOD.ITEMCODE)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR :P380_ITEMSPECIFICATION = SOD.ITEMSPECIFICATIONCODE)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR :P380_SALES_EXECUTIVE   = SO.SALESEXECUTIVECODE)',
'GROUP BY',
'    SO.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE),',
'    GETSTATENAME(P.OFFICESTATECODE),',
'    P.TNO',
'ORDER BY SUM(SOD.AMOUNT) DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(49914902845542995)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49915096993542997)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#PARTY_LINK#" class="t-Button t-Button--link" title="Click to view Party Details">',
'   <span class="fa fa-user u-color-7-text" aria-hidden="true" style="margin-right: 5px;"></span>#PARTYNAME#',
'</a>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49914674382542993)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49914779825542994)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825358006660075)
,p_query_column_id=>9
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825315609660074)
,p_query_column_id=>8
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>80
,p_column_heading=>'Party Tno'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49914940324542996)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49915196044542998)
,p_query_column_id=>6
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>60
,p_column_heading=>'TOTAL QTY'
,p_column_format=>'999G999G999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49915298817542999)
,p_query_column_id=>7
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>70
,p_column_heading=>'TOTAL AMOUNT'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10453933749969418)
,p_name=>'Total Dispatched Quantity'
,p_static_id=>'total-dispatched-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(10454828500969427)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'      P.PARTYCODE,',
'      P.PARTYNAME,',
'      GETCITYNAME(P.OFFICECITYCODE) AS CITYNAME,',
'      GETSTATENAME(P.OFFICESTATECODE) AS STATENAME,',
'      P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE) AS DTL_PARTYNAME,',
'      TRUNC(DA.DESPATCHADVICEDATE) AS DESPATCHADVICEDATE,',
'      DA.DESPATCHADVICENO,',
'      SUM(DAD.QUANTITY1) AS TOTALDISPATCHEDQTY',
'FROM DESPATCHADVICE DA',
'LEFT JOIN DESPATCHADVICEDETAIL DAD ON DA.TNO = DAD.TNO',
'LEFT JOIN PARTY P ON P.PARTYCODE = DA.PARTYCODE',
'LEFT JOIN SALESORDER SO ON SO.TNO = DA.REFERENCETNO',
'WHERE TRUNC(DA.DESPATCHADVICEDATE) BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY             IS NULL OR :P380_PARTY             = DA.PARTYCODE)',
'  AND (:P380_ITEM              IS NULL OR :P380_ITEM              = DAD.ITEMCODE)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR :P380_ITEMSPECIFICATION = DAD.ITEMSPECIFICATIONCODE)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR :P380_SALES_EXECUTIVE   = SO.SALESEXECUTIVECODE)',
'GROUP BY',
'      P.PARTYCODE,',
'      P.PARTYNAME,',
'      GETCITYNAME(P.OFFICECITYCODE),',
'      GETSTATENAME(P.OFFICESTATECODE),',
'      TRUNC(DA.DESPATCHADVICEDATE),',
'      DA.DESPATCHADVICENO'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(10453639044969415)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50326105844959100)
,p_query_column_id=>6
,p_column_alias=>'DESPATCHADVICEDATE'
,p_column_display_sequence=>60
,p_column_heading=>'DESPATCH ADVICE DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50326209358959101)
,p_query_column_id=>7
,p_column_alias=>'DESPATCHADVICENO'
,p_column_display_sequence=>70
,p_column_heading=>'DESPATCH ADVICE NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10453473583969413)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10453883223969417)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10453794060969416)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10453582255969414)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50326303784959102)
,p_query_column_id=>8
,p_column_alias=>'TOTALDISPATCHEDQTY'
,p_column_display_sequence=>80
,p_column_heading=>'TOTAL DISPATCHED QTY'
,p_column_format=>'999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10454828500969427)
,p_plug_name=>'Total Dispatched Quantity Filters'
,p_static_id=>'total-dispatched-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>31
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(10453933749969418)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_DISPATCHED_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10454532413969424)
,p_name=>'P380_TDQ_DA_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10454828500969427)
,p_prompt=>'Despatch Advice Date'
,p_source=>'DESPATCHADVICEDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10454386859969422)
,p_name=>'P380_TDQ_DA_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10454828500969427)
,p_prompt=>'Despatch Advice No'
,p_source=>'DESPATCHADVICENO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10454290376969421)
,p_name=>'P380_TDQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10454828500969427)
,p_prompt=>'Party Name'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10454777807969426)
,p_name=>'P380_TDQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10454828500969427)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(49796111101533197)
,p_name=>'Total Ordered Quantity'
,p_static_id=>'total-ordered-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(50057862068205975)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(emp.employeename, ''Unassigned'')                                AS sales_executive_name,',
'    NVL(so.salesexecutivecode, ''UNASSIGNED'')                           AS sales_executive_code,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                      AS cityname,',
'    GETSTATENAME(p.officestatecode)                                    AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' ||',
'    GETSTATENAME(p.officestatecode)                                    AS dtl_partyname,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    so.tno                                                             AS so_tno,',
'    p.tno                                                              AS party_tno,',
'    SUM(sod.quantity1)                                                 AS totalqty,',
'    SUM(sod.amount)                                                    AS total_base_amount,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => p.tno',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS party_link,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 171,',
'                p_items  => ''P171_TNO'',',
'                p_values => so.tno',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS so_link',
'FROM salesorder so',
'LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'LEFT JOIN party p              ON p.partycode = so.partycode',
'LEFT JOIN employee emp         ON so.salesexecutivecode = emp.employeecode',
'WHERE so.salesorderdate BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY           IS NULL OR :P380_PARTY = so.partycode)',
'  AND (:P380_SALES_EXECUTIVE IS NULL OR :P380_SALES_EXECUTIVE = so.salesexecutivecode)',
'GROUP BY',
'    emp.employeename,',
'    so.salesexecutivecode,',
'    so.partycode,',
'    p.partyname,',
'    p.officecitycode,',
'    p.officestatecode,',
'    so.salesorderdate,',
'    so.salesorderno,',
'    so.tno,',
'    p.tno',
'ORDER BY',
'    CASE WHEN NVL(emp.employeename, ''Unassigned'') = ''Unassigned'' THEN 2 ELSE 1 END ASC,',
'    so.salesorderdate DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(50058573011205982)
,p_query_column_id=>4
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50058782880205984)
,p_query_column_id=>6
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#PARTY_LINK#" class="t-Button t-Button--link" title="Click to view Party Details">',
'   <span class="fa fa-user u-color-7-text" aria-hidden="true" style="margin-right: 5px;"></span>#PARTYNAME#',
'</a>'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50058521591205981)
,p_query_column_id=>3
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54339142019855072)
,p_query_column_id=>13
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50822863595463696)
,p_query_column_id=>10
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50058848554205985)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50059000374205986)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER NO'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#SO_LINK#" class="t-Button t-Button--link" style="font-weight: bold; text-decoration: underline;" title="View Sales Order Details">',
'   <span class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 5px;"></span>#SALESORDERNO#',
'</a>'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53937984951322468)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(53937873464322467)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54339292103855073)
,p_query_column_id=>14
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50822757820463695)
,p_query_column_id=>9
,p_column_alias=>'SO_TNO'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50058670538205983)
,p_query_column_id=>5
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50059054555205987)
,p_query_column_id=>11
,p_column_alias=>'TOTALQTY'
,p_column_display_sequence=>80
,p_column_heading=>'TOTAL QTY'
,p_column_format=>'999G999G999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50059135493205988)
,p_query_column_id=>12
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_column_heading=>'TOTAL AMOUNT'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49916373283543010)
,p_plug_name=>'Total Orders Filters'
,p_static_id=>'total-orders-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>11
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(49794980797533186)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_ORDERS'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49916570507543012)
,p_name=>'P380_TO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(49916373283543010)
,p_prompt=>'Party Name'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49916448373543011)
,p_name=>'P380_TO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(49916373283543010)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50057671363205973)
,p_name=>'P380_TO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(49916373283543010)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'DESC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_escape_on_http_output=>'N'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_multi_value_trim_space=>false
,p_fc_filter_combination=>'OR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50057731435205974)
,p_name=>'P380_TO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(49916373283543010)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'SALESORDERNO AS D,',
'SALESORDERNO AS R',
'FROM SALESORDER'))
,p_item_icon_css_classes=>'fa-notebook'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50057862068205975)
,p_plug_name=>'Total Orders Quantity Filters'
,p_static_id=>'total-orders-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>21
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(49794980797533186)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_ORDERED_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50058044161205977)
,p_name=>'P380_TOQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(50057862068205975)
,p_prompt=>'Party Name'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50057965984205976)
,p_name=>'P380_TOQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(50057862068205975)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50058211219205978)
,p_name=>'P380_TOQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(50057862068205975)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50058226002205979)
,p_name=>'P380_TOQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(50057862068205975)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-notebook'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(49794980797533186)
,p_name=>'Total Orders Report'
,p_static_id=>'total-orders-report'
,p_parent_plug_id=>wwv_flow_imp.id(49916373283543010)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Raw_Aggregated_Data AS (',
'    SELECT ',
'        so.partycode,',
'        so.tno,',
'        LISTAGG(DISTINCT TO_CHAR(so.salesorderdate, ''DD-MM-YYYY''), '', '') WITHIN GROUP (ORDER BY so.salesorderdate) AS salesorderdate,',
'        LISTAGG(DISTINCT so.salesorderno, '', '') WITHIN GROUP (ORDER BY so.salesorderno) AS salesorderno,',
'        COUNT(DISTINCT so.tno) AS total_sales_orders',
'    FROM salesorder so',
'    LEFT JOIN salesorderdetail sod ON so.tno = sod.tno',
'    WHERE so.salesorderdate BETWEEN :P380_FROMDATE AND :P380_TODATE',
'      AND (:P380_PARTY             IS NULL OR :P380_PARTY             = so.partycode)',
'      AND (:P380_ITEM              IS NULL OR :P380_ITEM              = sod.itemcode)',
'      AND (:P380_ITEMSPECIFICATION IS NULL OR :P380_ITEMSPECIFICATION = sod.itemspecificationcode)',
'      AND (:P380_SALES_EXECUTIVE   IS NULL OR :P380_SALES_EXECUTIVE   = so.salesexecutivecode)',
'      AND (:P380_TO_SO_DATE IS NULL',
'           OR INSTR('','' || :P380_TO_SO_DATE || '','', '','' || TO_CHAR(so.salesorderdate, ''DD-MM-YYYY'') || '','') > 0)',
'    GROUP BY so.partycode, so.tno',
')',
'SELECT ',
'    rad.partycode,',
'    p.partyname,',
'    GETCITYNAME(p.officecitycode)                                                             AS cityname,',
'    GETSTATENAME(p.officestatecode)                                                           AS statename,',
'    p.partyname || '', '' || GETCITYNAME(p.officecitycode) || '', '' || GETSTATENAME(p.officestatecode) AS dtl_partyname,',
'    rad.salesorderdate,',
'    rad.salesorderno,',
'    rad.total_sales_orders,',
'    p.tno                                                                                     AS party_tno,',
'    rad.tno                                                                                   AS so_tno,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => p.tno',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS party_link,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 171,',
'                p_items  => ''P171_TNO'',',
'                p_values => rad.tno',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS so_link',
'FROM Raw_Aggregated_Data rad',
'LEFT JOIN party p ON p.partycode = rad.partycode',
'ORDER BY rad.total_sales_orders DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM, P380_TO_SO_DATE'
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
 p_id=>wwv_flow_imp.id(50057024738205967)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50057248456205969)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>60
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#PARTY_LINK#" class="t-Button t-Button--link" title="Click to view Party Details">',
'   <span class="fa fa-user u-color-7-text" aria-hidden="true" style="margin-right: 5px;"></span>#PARTYNAME#',
'</a>'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49916902877543015)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49916982419543016)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825025804660072)
,p_query_column_id=>11
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54824840817660070)
,p_query_column_id=>9
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50057351548205970)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>80
,p_column_heading=>'SALES ORDER DATE'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="my-custom-tags">',
'    <span class="my-badge">#SALESORDERDATE#</span>',
'</div>',
''))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50057510449205971)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER NO'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#SO_LINK#" class="t-Button t-Button--link" style="font-weight: bold; text-decoration: underline;" title="View Sales Order Details">',
'   <span class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 5px;"></span>#SALESORDERNO#',
'</a>',
''))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825175234660073)
,p_query_column_id=>12
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54824935343660071)
,p_query_column_id=>10
,p_column_alias=>'SO_TNO'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50057145071205968)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(50059343903205990)
,p_query_column_id=>8
,p_column_alias=>'TOTAL_SALES_ORDERS'
,p_column_display_sequence=>70
,p_column_heading=>'TOTAL SALES ORDERS'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10020043669134120)
,p_name=>'Total Pending Dispatched Quantity'
,p_static_id=>'total-pending-dispatched-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(10019000275134110)
,p_template=>wwv_flow_imp.id(567222375031260372)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    SO.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE)                                                                    AS CITYNAME,',
'    GETSTATENAME(P.OFFICESTATECODE)                                                                  AS STATENAME,',
'    P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE)         AS DTL_PARTYNAME,',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    GREATEST(SUM(SOD.QUANTITY1) - NVL(SUM(DR.DESPATCHQTY), 0), 0)                                  AS PENDINGDISPATCHQTY,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''PARTY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 49,',
'                p_items  => ''P49_TNO'',',
'                p_values => P.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS PARTY_LINK,',
'    CASE',
'        WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'            APEX_PAGE.GET_URL(',
'                p_page   => 171,',
'                p_items  => ''P171_TNO'',',
'                p_values => SO.TNO',
'            )',
'        ELSE',
'            APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':380:'' || :APP_SESSION)',
'    END AS SO_LINK',
'FROM SALESORDER SO',
'LEFT JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'LEFT JOIN PARTY P              ON P.PARTYCODE = SO.PARTYCODE',
'LEFT JOIN (',
'    SELECT',
'        DA.REFERENCETNO,',
'        DAD.ITEMCODE,',
'        DAD.ITEMSPECIFICATIONCODE,',
'        SUM(DAD.QUANTITY1) AS DESPATCHQTY',
'    FROM DESPATCHADVICE DA',
'    JOIN DESPATCHADVICEDETAIL DAD ON DA.TNO = DAD.TNO',
'    GROUP BY DA.REFERENCETNO, DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE',
') DR ON DR.REFERENCETNO          = SO.TNO',
'    AND DR.ITEMCODE              = SOD.ITEMCODE',
'    AND DR.ITEMSPECIFICATIONCODE = SOD.ITEMSPECIFICATIONCODE',
'WHERE SO.SALESORDERDATE BETWEEN :P380_FROMDATE AND :P380_TODATE',
'  AND (:P380_PARTY             IS NULL OR :P380_PARTY             = SO.PARTYCODE)',
'  AND (:P380_ITEM              IS NULL OR :P380_ITEM              = SOD.ITEMCODE)',
'  AND (:P380_ITEMSPECIFICATION IS NULL OR :P380_ITEMSPECIFICATION = SOD.ITEMSPECIFICATIONCODE)',
'  AND (:P380_SALES_EXECUTIVE   IS NULL OR :P380_SALES_EXECUTIVE   = SO.SALESEXECUTIVECODE)',
'GROUP BY',
'    SO.PARTYCODE,',
'    P.PARTYNAME,',
'    GETCITYNAME(P.OFFICECITYCODE),',
'    GETSTATENAME(P.OFFICESTATECODE),',
'    SO.SALESORDERDATE,',
'    SO.SALESORDERNO,',
'    P.TNO,',
'    SO.TNO',
'HAVING GREATEST(SUM(SOD.QUANTITY1) - NVL(SUM(DR.DESPATCHQTY), 0), 0) > 0'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEMSPECIFICATION,P380_ITEM'
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
 p_id=>wwv_flow_imp.id(10020258291134123)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10020544614134125)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10020118766134121)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10020245503134122)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825489083660076)
,p_query_column_id=>9
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10021251115134133)
,p_query_column_id=>8
,p_column_alias=>'PENDINGDISPATCHQTY'
,p_column_display_sequence=>130
,p_column_heading=>'PENDING DISPATCHED QUANTITY'
,p_column_format=>'999999990.999'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10020927922134129)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10021043889134130)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>100
,p_column_heading=>'SALES ORDER NO.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#SO_LINK#" class="t-Button t-Button--link" style="font-weight: bold; text-decoration: underline;" title="View Sales Order Details">',
'   <span class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 5px;"></span>#SALESORDERNO#',
'</a>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(54825574914660077)
,p_query_column_id=>10
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10020376612134124)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10019000275134110)
,p_plug_name=>'Total Pending Dispatched Quantity Filters'
,p_static_id=>'total-pending-dispatched-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>41
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(49794980797533186)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P380_REGION_TO_DISPLAY'
,p_plug_display_when_cond2=>'TOTAL_PENDING_DISPATCHED_QTY'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log(options);',
'    return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Total Records : ')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10019457309134115)
,p_name=>'P380_TPDQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10019000275134110)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-users-alt'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10019120748134111)
,p_name=>'P380_TPDQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10019000275134110)
,p_prompt=>'Search'
,p_source=>'DTL_PARTYNAME, SALESORDERDATE, SALESORDERNO, TOTALQTY ,TOTAL_BASE_AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10019304693134113)
,p_name=>'P380_TPDQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10019000275134110)
,p_prompt=>'Sales Order Date'
,p_source=>'SALESORDERDATE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_icon_css_classes=>'fa-calendar-month'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>true
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>true
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10019436481134114)
,p_name=>'P380_TPDQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10019000275134110)
,p_prompt=>'Sales Order No'
,p_source=>'SALESORDERNO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54338951973855070)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(49559913722026477)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-left'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54736067225376967)
,p_name=>'P380_CITY'
,p_item_sequence=>130
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49560006662026478)
,p_name=>'P380_FROMDATE'
,p_item_sequence=>30
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49559513526026473)
,p_name=>'P380_HEADER_TITLE'
,p_item_sequence=>10
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49560422097026482)
,p_name=>'P380_ITEM'
,p_item_sequence=>70
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49560253106026481)
,p_name=>'P380_ITEMSPECIFICATION'
,p_item_sequence=>60
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49797395865533210)
,p_name=>'P380_ITEM_CATEGORY'
,p_item_sequence=>80
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49560153108026480)
,p_name=>'P380_PARTY'
,p_item_sequence=>50
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49559697326026475)
,p_name=>'P380_REGION_TO_DISPLAY'
,p_item_sequence=>20
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49797257819533209)
,p_name=>'P380_SALES_EXECUTIVE'
,p_item_sequence=>90
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54338850909855069)
,p_name=>'P380_SELECTED_DAY'
,p_item_sequence=>110
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53938994385322478)
,p_name=>'P380_SELECTED_MONTH'
,p_item_sequence=>100
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54341559421855096)
,p_name=>'P380_STATE'
,p_item_sequence=>120
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49560114938026479)
,p_name=>'P380_TODATE'
,p_item_sequence=>40
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(54824646962660068)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(54338951973855070)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54824753239660069)
,p_event_id=>wwv_flow_imp.id(54824646962660068)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49559744884026476)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get the Header Name'
,p_static_id=>'get-the-header-name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    CASE ',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_CLIENTS''                      THEN :P380_HEADER_TITLE := ''Total Clients'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_ORDERS''                       THEN :P380_HEADER_TITLE := ''Total Orders'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_ORDERED_QTY''                  THEN :P380_HEADER_TITLE := ''Total Ordered Quantity'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_DISPATCHED_QTY''               THEN :P380_HEADER_TITLE := ''Total Despatched Quantity'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_PENDING_DISPATCHED_QTY''       THEN :P380_HEADER_TITLE := ''Total Pending Despatch Quantity'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_AMOUNT''                       THEN :P380_HEADER_TITLE := ''Total Amount'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_LOADINGADVICE_QTY''            THEN :P380_HEADER_TITLE := ''Total Despatch Quantity Outward'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_LOADINGADVICE_PENDING_QTY''    THEN :P380_HEADER_TITLE := ''Total Pending Despatch Quantity Outward'';',
'        WHEN :P380_REGION_TO_DISPLAY = ''TOTAL_CANCELLED_QTY''                THEN :P380_HEADER_TITLE := ''Total Cancelled Quantity'';',
'        ELSE :P380_HEADER_TITLE := ''Sales Dashboard Detail Reports'';',
'    END CASE;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>39634222567499910
);
wwv_flow_imp.component_end;
end;
/
