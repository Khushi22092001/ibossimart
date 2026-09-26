prompt --application/pages/page_00380
begin
--   Manifest
--     PAGE: 00380
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
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
 p_id=>wwv_flow_imp.id(67992271710594829)
,p_plug_name=>'Cancelled Out Filters'
,p_static_id=>'cancelled-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>81
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(68420919468304588)
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
 p_id=>wwv_flow_imp.id(68420681006304585)
,p_name=>'P380_CO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(67992271710594829)
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
 p_id=>wwv_flow_imp.id(68420614631304584)
,p_name=>'P380_CO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(67992271710594829)
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
 p_id=>wwv_flow_imp.id(68420774330304586)
,p_name=>'P380_CO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(67992271710594829)
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
 p_id=>wwv_flow_imp.id(68420829140304587)
,p_name=>'P380_CO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(67992271710594829)
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
 p_id=>wwv_flow_imp.id(68420919468304588)
,p_name=>'Cancelled Out Report'
,p_static_id=>'cancelled-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(67992271710594829)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(68422780357304606)
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
 p_id=>wwv_flow_imp.id(68421222125304591)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68423233264304611)
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
 p_id=>wwv_flow_imp.id(68421468896304593)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68422914307304607)
,p_query_column_id=>8
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>150
,p_column_heading=>'Itemcode'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68422994341304608)
,p_query_column_id=>9
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>160
,p_column_heading=>'Itemname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68423322376304612)
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
 p_id=>wwv_flow_imp.id(68423153339304610)
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
 p_id=>wwv_flow_imp.id(68421069357304589)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68421196038304590)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68421598576304594)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68421667336304595)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68423084717304609)
,p_query_column_id=>10
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>170
,p_column_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(68421345819304592)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(69095019913853481)
,p_plug_name=>'Category Wise Revenue By Amount Filters'
,p_static_id=>'category-wise-revenue-by-amount-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>91
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(69095956613853490)
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
 p_id=>wwv_flow_imp.id(69095244584853483)
,p_name=>'P380_CWRBA_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(69095019913853481)
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
 p_id=>wwv_flow_imp.id(69095120048853482)
,p_name=>'P380_CWRBA_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(69095019913853481)
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
 p_id=>wwv_flow_imp.id(69095386548853484)
,p_name=>'P380_CWRBA_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(69095019913853481)
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
 p_id=>wwv_flow_imp.id(69095506548853485)
,p_name=>'P380_CWRBA_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(69095019913853481)
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
 p_id=>wwv_flow_imp.id(69095956613853490)
,p_name=>'Category Wise Revenue By Amount Report'
,p_static_id=>'category-wise-revenue-by-amount-report'
,p_parent_plug_id=>wwv_flow_imp.id(69095019913853481)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(69099997110853530)
,p_query_column_id=>5
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005188933113282)
,p_query_column_id=>7
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>190
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005503190113285)
,p_query_column_id=>10
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005530136113286)
,p_query_column_id=>11
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>240
,p_column_heading=>'ITEM'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69097934586853510)
,p_query_column_id=>1
,p_column_alias=>'ITEM_CATEGORY'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69098099563853511)
,p_query_column_id=>2
,p_column_alias=>'ITEM_CATEGORY_CODE'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69099756004853528)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69099884338853529)
,p_query_column_id=>4
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005304439113283)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>210
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005382681113284)
,p_query_column_id=>9
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>200
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005704556113287)
,p_query_column_id=>12
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>250
,p_column_heading=>'ITEM SPECIFICATION'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005044066113281)
,p_query_column_id=>6
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005966922113290)
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
 p_id=>wwv_flow_imp.id(70005890791113289)
,p_query_column_id=>14
,p_column_alias=>'TOTAL_QTY'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70005793868113288)
,p_query_column_id=>13
,p_column_alias=>'UOM'
,p_column_display_sequence=>260
,p_column_heading=>'MEASURING UNIT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70006022786113291)
,p_plug_name=>'Category Wise Revenue By Quantity  Filters'
,p_static_id=>'category-wise-revenue-by-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>101
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(70006920735113300)
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
 p_id=>wwv_flow_imp.id(70006291162113293)
,p_name=>'P380_CWRBQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(70006022786113291)
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
 p_id=>wwv_flow_imp.id(70006129463113292)
,p_name=>'P380_CWRBQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70006022786113291)
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
 p_id=>wwv_flow_imp.id(70006400495113294)
,p_name=>'P380_CWRBQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70006022786113291)
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
 p_id=>wwv_flow_imp.id(70006875642113299)
,p_name=>'P380_CWRBQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(70006022786113291)
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
 p_id=>wwv_flow_imp.id(70006920735113300)
,p_name=>'Category Wise Revenue By Quantity Report'
,p_static_id=>'category-wise-revenue-by-quantity-report'
,p_parent_plug_id=>wwv_flow_imp.id(70006022786113291)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(70007457163113305)
,p_query_column_id=>5
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007632611113307)
,p_query_column_id=>7
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>70
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007981158113310)
,p_query_column_id=>10
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70008043123113311)
,p_query_column_id=>11
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>110
,p_column_heading=>'ITEM'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007080203113301)
,p_query_column_id=>1
,p_column_alias=>'ITEM_CATEGORY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007202070113302)
,p_query_column_id=>2
,p_column_alias=>'ITEM_CATEGORY_CODE'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007273558113303)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007317833113304)
,p_query_column_id=>4
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007841721113309)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007794033113308)
,p_query_column_id=>9
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>80
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70008152530113312)
,p_query_column_id=>12
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>120
,p_column_heading=>'ITEM SPECIFICATION'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70007577031113306)
,p_query_column_id=>6
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70008463351113315)
,p_query_column_id=>15
,p_column_alias=>'TOTAL_AMOUNT'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70008389067113314)
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
 p_id=>wwv_flow_imp.id(70008289477113313)
,p_query_column_id=>13
,p_column_alias=>'UOM'
,p_column_display_sequence=>130
,p_column_heading=>'MEASURING UNIT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(71363564269024213)
,p_plug_name=>'Customer WIse Orders Filters'
,p_static_id=>'customer-wise-orders-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>161
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(71364419801024222)
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
 p_id=>wwv_flow_imp.id(71363742223024215)
,p_name=>'P380_CWO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(71363564269024213)
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
 p_id=>wwv_flow_imp.id(71363625445024214)
,p_name=>'P380_CWO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(71363564269024213)
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
 p_id=>wwv_flow_imp.id(71363912990024216)
,p_name=>'P380_CWO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(71363564269024213)
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
 p_id=>wwv_flow_imp.id(71363971786024217)
,p_name=>'P380_CWO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(71363564269024213)
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
 p_id=>wwv_flow_imp.id(71364419801024222)
,p_name=>'Customer Wise Orders Report'
,p_static_id=>'customer-wise-orders-report'
,p_parent_plug_id=>wwv_flow_imp.id(71363564269024213)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(71364641900024224)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71364758667024225)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71364551578024223)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71365047499024228)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71364990754024227)
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
 p_id=>wwv_flow_imp.id(71365178746024229)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71364858504024226)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71365305806024230)
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
 p_id=>wwv_flow_imp.id(71467941916151981)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27142598456582825)
,p_plug_name=>'Dispatched Quantity Out Filters'
,p_static_id=>'dispatched-quantity-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>61
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(27094921650076832)
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
 p_id=>wwv_flow_imp.id(27143334420582832)
,p_name=>'P380_DQO_LA_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27142598456582825)
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
 p_id=>wwv_flow_imp.id(27143400037582833)
,p_name=>'P380_DQO_LA_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(27142598456582825)
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
 p_id=>wwv_flow_imp.id(27143171152582831)
,p_name=>'P380_DQO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(27142598456582825)
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
 p_id=>wwv_flow_imp.id(27143072783582830)
,p_name=>'P380_DQO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27142598456582825)
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
 p_id=>wwv_flow_imp.id(27094921650076832)
,p_name=>'Dispatched Quantity Out Report'
,p_static_id=>'dispatched-quantity-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(27142598456582825)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(27095170457076835)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67990839247594815)
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
 p_id=>wwv_flow_imp.id(27095424954076837)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847865446829197)
,p_query_column_id=>12
,p_column_alias=>'LA_LINK'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67990626253594813)
,p_query_column_id=>8
,p_column_alias=>'LOADINGADVICEDATE'
,p_column_display_sequence=>100
,p_column_heading=>'LOADING ADVICE DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67990746038594814)
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
 p_id=>wwv_flow_imp.id(27094959748076833)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27095060613076834)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847730637829196)
,p_query_column_id=>11
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847536643829194)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847616680829195)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27095266833076836)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70960810474491593)
,p_plug_name=>'Month Wise Quantity Filters'
,p_static_id=>'month-wise-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>111
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(70961711142491602)
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
 p_id=>wwv_flow_imp.id(70960952487491595)
,p_name=>'P380_MWQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(70960810474491593)
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
 p_id=>wwv_flow_imp.id(70960840257491594)
,p_name=>'P380_MWQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70960810474491593)
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
 p_id=>wwv_flow_imp.id(70961089866491596)
,p_name=>'P380_MWQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70960810474491593)
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
 p_id=>wwv_flow_imp.id(70961180535491597)
,p_name=>'P380_MWQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(70960810474491593)
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
 p_id=>wwv_flow_imp.id(70961711142491602)
,p_name=>'Month Wise Report'
,p_static_id=>'month-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(70960810474491593)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(70961944665491605)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70962158896491607)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70961865611491604)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70962359935491609)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70962304287491608)
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
 p_id=>wwv_flow_imp.id(70962417677491610)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70962048773491606)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70962565763491611)
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
 p_id=>wwv_flow_imp.id(70962972198491615)
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
 p_id=>wwv_flow_imp.id(66581607362195591)
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
 p_id=>wwv_flow_imp.id(67930772671084395)
,p_plug_name=>'Pending Quantity Out Filters'
,p_static_id=>'pending-quantity-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>71
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(67931654576084404)
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
 p_id=>wwv_flow_imp.id(67931352905084401)
,p_name=>'P380_PQO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(67930772671084395)
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
 p_id=>wwv_flow_imp.id(67931307102084400)
,p_name=>'P380_PQO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(67930772671084395)
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
 p_id=>wwv_flow_imp.id(67931471309084402)
,p_name=>'P380_PQO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(67930772671084395)
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
 p_id=>wwv_flow_imp.id(67931524354084403)
,p_name=>'P380_PQO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(67930772671084395)
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
 p_id=>wwv_flow_imp.id(67931654576084404)
,p_name=>'Pending Quantity Out Report'
,p_static_id=>'pending-quantity-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(67930772671084395)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(67991536312594822)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67991808002594824)
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
 p_id=>wwv_flow_imp.id(69097455210853505)
,p_query_column_id=>8
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69097581001853506)
,p_query_column_id=>9
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67991412454594820)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67991498040594821)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847989489829198)
,p_query_column_id=>14
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>260
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67988882700594795)
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
 p_id=>wwv_flow_imp.id(69097777501853508)
,p_query_column_id=>11
,p_column_alias=>'SALESEXECUTIVECODE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69097866619853509)
,p_query_column_id=>12
,p_column_alias=>'SALESEXECUTIVENAME'
,p_column_display_sequence=>240
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67991864247594825)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>150
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67991996212594826)
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
 p_id=>wwv_flow_imp.id(71848051293829199)
,p_query_column_id=>15
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71846262849829181)
,p_query_column_id=>10
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>250
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67991620673594823)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70963124512491617)
,p_plug_name=>'Quantity Over Time Filters'
,p_static_id=>'quantity-over-time-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>141
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(70964107769491626)
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
 p_id=>wwv_flow_imp.id(70963323497491619)
,p_name=>'P380_QOT_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(70963124512491617)
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
 p_id=>wwv_flow_imp.id(70963305832491618)
,p_name=>'P380_QOT_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70963124512491617)
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
 p_id=>wwv_flow_imp.id(70963454190491620)
,p_name=>'P380_QOT_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70963124512491617)
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
 p_id=>wwv_flow_imp.id(70963609180491621)
,p_name=>'P380_QOT_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(70963124512491617)
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
 p_id=>wwv_flow_imp.id(70964107769491626)
,p_name=>'Quantity Over Time Report'
,p_static_id=>'quantity-over-time-report'
,p_parent_plug_id=>wwv_flow_imp.id(70963124512491617)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(70964400335491629)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71360392539024181)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70964223357491628)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71060554671042583)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71060502803042582)
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
 p_id=>wwv_flow_imp.id(71060628753042584)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70964505242491630)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71060815017042585)
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
 p_id=>wwv_flow_imp.id(71061180237042589)
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
 p_id=>wwv_flow_imp.id(70009450331113325)
,p_plug_name=>'Sales Executive Wise  Quantity  Filters'
,p_static_id=>'sales-executive-wise-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>131
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(70489017544903684)
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
 p_id=>wwv_flow_imp.id(70009689634113327)
,p_name=>'P380_SEW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(70009450331113325)
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
 p_id=>wwv_flow_imp.id(70009611640113326)
,p_name=>'P380_SEW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70009450331113325)
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
 p_id=>wwv_flow_imp.id(70009796002113328)
,p_name=>'P380_SEW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70009450331113325)
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
 p_id=>wwv_flow_imp.id(70009899220113329)
,p_name=>'P380_SEW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(70009450331113325)
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
 p_id=>wwv_flow_imp.id(70489017544903684)
,p_name=>'Sales Executive Wise Report'
,p_static_id=>'sales-executive-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(70009450331113325)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(70489611707903689)
,p_query_column_id=>4
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70489732605903691)
,p_query_column_id=>6
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>70
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70489473229903688)
,p_query_column_id=>3
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70489977246903693)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70489838581903692)
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
 p_id=>wwv_flow_imp.id(70960514506491590)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70959879026491584)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70489707589903690)
,p_query_column_id=>5
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70960259171491588)
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
 p_id=>wwv_flow_imp.id(71360812944024185)
,p_query_column_id=>10
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(71760478949546108)
,p_plug_name=>'Seller Category Wise Filters'
,p_static_id=>'seller-category-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>181
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(71761369024546117)
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
 p_id=>wwv_flow_imp.id(71761081306546114)
,p_name=>'P380_SECW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(71760478949546108)
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
 p_id=>wwv_flow_imp.id(71760993444546113)
,p_name=>'P380_SECW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(71760478949546108)
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
 p_id=>wwv_flow_imp.id(71761189541546115)
,p_name=>'P380_SECW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(71760478949546108)
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
 p_id=>wwv_flow_imp.id(71761302541546116)
,p_name=>'P380_SECW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(71760478949546108)
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
 p_id=>wwv_flow_imp.id(71761369024546117)
,p_name=>'Seller Category Wise Report'
,p_static_id=>'seller-category-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(71760478949546108)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(71762337709546127)
,p_query_column_id=>8
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Item Category'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71761562788546119)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71761664932546120)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71848261329829201)
,p_query_column_id=>9
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71848346728829202)
,p_query_column_id=>10
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71761476675546118)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71761947945546123)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71761841094546122)
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
 p_id=>wwv_flow_imp.id(71762091634546124)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71761799474546121)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71762120124546125)
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
 p_id=>wwv_flow_imp.id(71762276740546126)
,p_query_column_id=>12
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(71758234734546086)
,p_plug_name=>'Seller City Wise Filters'
,p_static_id=>'seller-city-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>171
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(71759157794546095)
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
 p_id=>wwv_flow_imp.id(71758474228546088)
,p_name=>'P380_SCW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(71758234734546086)
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
 p_id=>wwv_flow_imp.id(71758322425546087)
,p_name=>'P380_SCW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(71758234734546086)
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
 p_id=>wwv_flow_imp.id(71758546997546089)
,p_name=>'P380_SCW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(71758234734546086)
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
 p_id=>wwv_flow_imp.id(71758692950546090)
,p_name=>'P380_SCW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(71758234734546086)
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
 p_id=>wwv_flow_imp.id(71759157794546095)
,p_name=>'Seller City Wise Report'
,p_static_id=>'seller-city-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(71758234734546086)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(71759345476546097)
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
 p_id=>wwv_flow_imp.id(71759481950546098)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71759273454546096)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71759776676546101)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71759636481546100)
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
 p_id=>wwv_flow_imp.id(71759899968546102)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71759585068546099)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71759965805546103)
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
 p_id=>wwv_flow_imp.id(71760056252546104)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(71361358318024191)
,p_plug_name=>'Seller State Wise Filters'
,p_static_id=>'seller-state-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>151
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(71362281234024200)
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
 p_id=>wwv_flow_imp.id(71361581180024193)
,p_name=>'P380_SSW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(71361358318024191)
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
 p_id=>wwv_flow_imp.id(71361508443024192)
,p_name=>'P380_SSW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(71361358318024191)
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
 p_id=>wwv_flow_imp.id(71361676952024194)
,p_name=>'P380_SSW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(71361358318024191)
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
 p_id=>wwv_flow_imp.id(71361732168024195)
,p_name=>'P380_SSW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(71361358318024191)
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
 p_id=>wwv_flow_imp.id(71362281234024200)
,p_name=>'Seller State Wise Report'
,p_static_id=>'seller-state-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(71361358318024191)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(71362421716024202)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71363161285024209)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71362377494024201)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71362802946024205)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71362629215024204)
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
 p_id=>wwv_flow_imp.id(71362899106024206)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71362565812024203)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71362977513024207)
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
 p_id=>wwv_flow_imp.id(71363022597024208)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27141740414582816)
,p_plug_name=>'Total Amount Filters'
,p_static_id=>'total-amount-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>51
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(27092451375076808)
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
 p_id=>wwv_flow_imp.id(27142252670582822)
,p_name=>'P380_TA_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(27141740414582816)
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
 p_id=>wwv_flow_imp.id(27142231797582821)
,p_name=>'P380_TA_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27141740414582816)
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
 p_id=>wwv_flow_imp.id(27142360701582823)
,p_name=>'P380_TA_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27141740414582816)
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
 p_id=>wwv_flow_imp.id(27142513408582824)
,p_name=>'P380_TA_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(27141740414582816)
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
 p_id=>wwv_flow_imp.id(27092451375076808)
,p_name=>'Total Amount Report'
,p_static_id=>'total-amount-report'
,p_parent_plug_id=>wwv_flow_imp.id(27141740414582816)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(27092833991076811)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27092994080076813)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27092603644076809)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27092705626076810)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847345695829192)
,p_query_column_id=>10
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27093236753076815)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27093303067076816)
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
 p_id=>wwv_flow_imp.id(71847438831829193)
,p_query_column_id=>11
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27092871764076812)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27093786985076821)
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
 p_id=>wwv_flow_imp.id(27093690976076820)
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
 p_id=>wwv_flow_imp.id(66936235365712106)
,p_plug_name=>'Total Clients Filters'
,p_static_id=>'total-clients-filters'
,p_region_name=>'SID_SMART_FILTER'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(66581096464195586)
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
 p_id=>wwv_flow_imp.id(66937406318712117)
,p_name=>'P380_TC_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(66936235365712106)
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
 p_id=>wwv_flow_imp.id(66937167940712115)
,p_name=>'P380_TC_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(66936235365712106)
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
 p_id=>wwv_flow_imp.id(66937286349712116)
,p_name=>'P380_TC_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(66936235365712106)
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
 p_id=>wwv_flow_imp.id(66937066074712114)
,p_name=>'P380_TC_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(66936235365712106)
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
 p_id=>wwv_flow_imp.id(66581096464195586)
,p_name=>'Total Clients Report'
,p_static_id=>'total-clients-report'
,p_parent_plug_id=>wwv_flow_imp.id(66936235365712106)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(66936596485712109)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(66936790633712111)
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
 p_id=>wwv_flow_imp.id(66936368022712107)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(66936473465712108)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847051646829189)
,p_query_column_id=>9
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847009249829188)
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
 p_id=>wwv_flow_imp.id(66936633964712110)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(66936889684712112)
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
 p_id=>wwv_flow_imp.id(66936992457712113)
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
 p_id=>wwv_flow_imp.id(27475627390138532)
,p_name=>'Total Dispatched Quantity'
,p_static_id=>'total-dispatched-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(27476522141138541)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(27475332685138529)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67347799485128214)
,p_query_column_id=>6
,p_column_alias=>'DESPATCHADVICEDATE'
,p_column_display_sequence=>60
,p_column_heading=>'DESPATCH ADVICE DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67347902999128215)
,p_query_column_id=>7
,p_column_alias=>'DESPATCHADVICENO'
,p_column_display_sequence=>70
,p_column_heading=>'DESPATCH ADVICE NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27475167224138527)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27475576864138531)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27475487701138530)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27475275896138528)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67347997425128216)
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
 p_id=>wwv_flow_imp.id(27476522141138541)
,p_plug_name=>'Total Dispatched Quantity Filters'
,p_static_id=>'total-dispatched-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>31
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(27475627390138532)
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
 p_id=>wwv_flow_imp.id(27476226054138538)
,p_name=>'P380_TDQ_DA_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27476522141138541)
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
 p_id=>wwv_flow_imp.id(27476080500138536)
,p_name=>'P380_TDQ_DA_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(27476522141138541)
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
 p_id=>wwv_flow_imp.id(27475984017138535)
,p_name=>'P380_TDQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(27476522141138541)
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
 p_id=>wwv_flow_imp.id(27476471448138540)
,p_name=>'P380_TDQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27476522141138541)
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
 p_id=>wwv_flow_imp.id(66817804741702311)
,p_name=>'Total Ordered Quantity'
,p_static_id=>'total-ordered-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(67079555708375089)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(67080266651375096)
,p_query_column_id=>4
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67080476520375098)
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
 p_id=>wwv_flow_imp.id(67080215231375095)
,p_query_column_id=>3
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71360835660024186)
,p_query_column_id=>13
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67844557235632810)
,p_query_column_id=>10
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67080542194375099)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67080694014375100)
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
 p_id=>wwv_flow_imp.id(70959678591491582)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70959567104491581)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71360985744024187)
,p_query_column_id=>14
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67844451460632809)
,p_query_column_id=>9
,p_column_alias=>'SO_TNO'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67080364178375097)
,p_query_column_id=>5
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67080748195375101)
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
 p_id=>wwv_flow_imp.id(67080829133375102)
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
 p_id=>wwv_flow_imp.id(66938066923712124)
,p_plug_name=>'Total Orders Filters'
,p_static_id=>'total-orders-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>11
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(66816674437702300)
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
 p_id=>wwv_flow_imp.id(66938264147712126)
,p_name=>'P380_TO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(66938066923712124)
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
 p_id=>wwv_flow_imp.id(66938142013712125)
,p_name=>'P380_TO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(66938066923712124)
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
 p_id=>wwv_flow_imp.id(67079365003375087)
,p_name=>'P380_TO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(66938066923712124)
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
 p_id=>wwv_flow_imp.id(67079425075375088)
,p_name=>'P380_TO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(66938066923712124)
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
 p_id=>wwv_flow_imp.id(67079555708375089)
,p_plug_name=>'Total Orders Quantity Filters'
,p_static_id=>'total-orders-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>21
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(66816674437702300)
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
 p_id=>wwv_flow_imp.id(67079737801375091)
,p_name=>'P380_TOQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(67079555708375089)
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
 p_id=>wwv_flow_imp.id(67079659624375090)
,p_name=>'P380_TOQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(67079555708375089)
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
 p_id=>wwv_flow_imp.id(67079904859375092)
,p_name=>'P380_TOQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(67079555708375089)
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
 p_id=>wwv_flow_imp.id(67079919642375093)
,p_name=>'P380_TOQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(67079555708375089)
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
 p_id=>wwv_flow_imp.id(66816674437702300)
,p_name=>'Total Orders Report'
,p_static_id=>'total-orders-report'
,p_parent_plug_id=>wwv_flow_imp.id(66938066923712124)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(67078718378375081)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67078942096375083)
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
 p_id=>wwv_flow_imp.id(66938596517712129)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(66938676059712130)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71846719444829186)
,p_query_column_id=>11
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71846534457829184)
,p_query_column_id=>9
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67079045188375084)
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
 p_id=>wwv_flow_imp.id(67079204089375085)
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
 p_id=>wwv_flow_imp.id(71846868874829187)
,p_query_column_id=>12
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71846628983829185)
,p_query_column_id=>10
,p_column_alias=>'SO_TNO'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67078838711375082)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(67081037543375104)
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
 p_id=>wwv_flow_imp.id(27041737309303234)
,p_name=>'Total Pending Dispatched Quantity'
,p_static_id=>'total-pending-dispatched-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(27040693915303224)
,p_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(27041951931303237)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27042238254303239)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27041812406303235)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27041939143303236)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(71847182723829190)
,p_query_column_id=>9
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27042944755303247)
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
 p_id=>wwv_flow_imp.id(27042621562303243)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27042737529303244)
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
 p_id=>wwv_flow_imp.id(71847268554829191)
,p_query_column_id=>10
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27042070252303238)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27040693915303224)
,p_plug_name=>'Total Pending Dispatched Quantity Filters'
,p_static_id=>'total-pending-dispatched-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(66581607362195591)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>41
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(66816674437702300)
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
 p_id=>wwv_flow_imp.id(27041150949303229)
,p_name=>'P380_TPDQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27040693915303224)
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
 p_id=>wwv_flow_imp.id(27040814388303225)
,p_name=>'P380_TPDQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27040693915303224)
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
 p_id=>wwv_flow_imp.id(27040998333303227)
,p_name=>'P380_TPDQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27040693915303224)
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
 p_id=>wwv_flow_imp.id(27041130121303228)
,p_name=>'P380_TPDQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(27040693915303224)
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
 p_id=>wwv_flow_imp.id(71360645614024184)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(66581607362195591)
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
 p_id=>wwv_flow_imp.id(71757760865546081)
,p_name=>'P380_CITY'
,p_item_sequence=>130
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66581700302195592)
,p_name=>'P380_FROMDATE'
,p_item_sequence=>30
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66581207166195587)
,p_name=>'P380_HEADER_TITLE'
,p_item_sequence=>10
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66582115737195596)
,p_name=>'P380_ITEM'
,p_item_sequence=>70
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66581946746195595)
,p_name=>'P380_ITEMSPECIFICATION'
,p_item_sequence=>60
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66819089505702324)
,p_name=>'P380_ITEM_CATEGORY'
,p_item_sequence=>80
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66581846748195594)
,p_name=>'P380_PARTY'
,p_item_sequence=>50
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66581390966195589)
,p_name=>'P380_REGION_TO_DISPLAY'
,p_item_sequence=>20
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66818951459702323)
,p_name=>'P380_SALES_EXECUTIVE'
,p_item_sequence=>90
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(71360544550024183)
,p_name=>'P380_SELECTED_DAY'
,p_item_sequence=>110
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70960688025491592)
,p_name=>'P380_SELECTED_MONTH'
,p_item_sequence=>100
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(71363253062024210)
,p_name=>'P380_STATE'
,p_item_sequence=>120
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66581808578195593)
,p_name=>'P380_TODATE'
,p_item_sequence=>40
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(71846340602829182)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(71360645614024184)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(71846446879829183)
,p_event_id=>wwv_flow_imp.id(71846340602829182)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(66581438524195590)
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
