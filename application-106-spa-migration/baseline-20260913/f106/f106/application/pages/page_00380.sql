prompt --application/pages/page_00380
begin
--   Manifest
--     PAGE: 00380
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
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
 p_id=>wwv_flow_imp.id(58512067879128465)
,p_plug_name=>'Cancelled Out Filters'
,p_static_id=>'cancelled-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>81
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(58940715636838224)
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
 p_id=>wwv_flow_imp.id(58940477174838221)
,p_name=>'P380_CO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(58512067879128465)
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
 p_id=>wwv_flow_imp.id(58940410799838220)
,p_name=>'P380_CO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(58512067879128465)
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
 p_id=>wwv_flow_imp.id(58940570498838222)
,p_name=>'P380_CO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(58512067879128465)
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
 p_id=>wwv_flow_imp.id(58940625308838223)
,p_name=>'P380_CO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(58512067879128465)
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
 p_id=>wwv_flow_imp.id(58940715636838224)
,p_name=>'Cancelled Out Report'
,p_static_id=>'cancelled-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(58512067879128465)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(58942576525838242)
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
 p_id=>wwv_flow_imp.id(58941018293838227)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58943029432838247)
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
 p_id=>wwv_flow_imp.id(58941265064838229)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58942710475838243)
,p_query_column_id=>8
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>150
,p_column_heading=>'Itemcode'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58942790509838244)
,p_query_column_id=>9
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>160
,p_column_heading=>'Itemname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58943118544838248)
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
 p_id=>wwv_flow_imp.id(58942949507838246)
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
 p_id=>wwv_flow_imp.id(58940865525838225)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58940992206838226)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58941394744838230)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58941463504838231)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58942880885838245)
,p_query_column_id=>10
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>170
,p_column_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58941141987838228)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59614816082387117)
,p_plug_name=>'Category Wise Revenue By Amount Filters'
,p_static_id=>'category-wise-revenue-by-amount-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>91
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(59615752782387126)
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
 p_id=>wwv_flow_imp.id(59615040753387119)
,p_name=>'P380_CWRBA_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(59614816082387117)
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
 p_id=>wwv_flow_imp.id(59614916217387118)
,p_name=>'P380_CWRBA_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(59614816082387117)
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
 p_id=>wwv_flow_imp.id(59615182717387120)
,p_name=>'P380_CWRBA_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(59614816082387117)
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
 p_id=>wwv_flow_imp.id(59615302717387121)
,p_name=>'P380_CWRBA_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(59614816082387117)
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
 p_id=>wwv_flow_imp.id(59615752782387126)
,p_name=>'Category Wise Revenue By Amount Report'
,p_static_id=>'category-wise-revenue-by-amount-report'
,p_parent_plug_id=>wwv_flow_imp.id(59614816082387117)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(59619793279387166)
,p_query_column_id=>5
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60524985101646918)
,p_query_column_id=>7
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>190
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525299358646921)
,p_query_column_id=>10
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525326304646922)
,p_query_column_id=>11
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>240
,p_column_heading=>'ITEM'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59617730755387146)
,p_query_column_id=>1
,p_column_alias=>'ITEM_CATEGORY'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59617895732387147)
,p_query_column_id=>2
,p_column_alias=>'ITEM_CATEGORY_CODE'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59619552173387164)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59619680507387165)
,p_query_column_id=>4
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525100607646919)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>210
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525178849646920)
,p_query_column_id=>9
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>200
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525500724646923)
,p_query_column_id=>12
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>250
,p_column_heading=>'ITEM SPECIFICATION'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60524840234646917)
,p_query_column_id=>6
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525763090646926)
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
 p_id=>wwv_flow_imp.id(60525686959646925)
,p_query_column_id=>14
,p_column_alias=>'TOTAL_QTY'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60525590036646924)
,p_query_column_id=>13
,p_column_alias=>'UOM'
,p_column_display_sequence=>260
,p_column_heading=>'MEASURING UNIT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60525818954646927)
,p_plug_name=>'Category Wise Revenue By Quantity  Filters'
,p_static_id=>'category-wise-revenue-by-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>101
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(60526716903646936)
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
 p_id=>wwv_flow_imp.id(60526087330646929)
,p_name=>'P380_CWRBQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(60525818954646927)
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
 p_id=>wwv_flow_imp.id(60525925631646928)
,p_name=>'P380_CWRBQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(60525818954646927)
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
 p_id=>wwv_flow_imp.id(60526196663646930)
,p_name=>'P380_CWRBQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(60525818954646927)
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
 p_id=>wwv_flow_imp.id(60526671810646935)
,p_name=>'P380_CWRBQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(60525818954646927)
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
 p_id=>wwv_flow_imp.id(60526716903646936)
,p_name=>'Category Wise Revenue By Quantity Report'
,p_static_id=>'category-wise-revenue-by-quantity-report'
,p_parent_plug_id=>wwv_flow_imp.id(60525818954646927)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(60527253331646941)
,p_query_column_id=>5
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527428779646943)
,p_query_column_id=>7
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>70
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527777326646946)
,p_query_column_id=>10
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527839291646947)
,p_query_column_id=>11
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>110
,p_column_heading=>'ITEM'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60526876371646937)
,p_query_column_id=>1
,p_column_alias=>'ITEM_CATEGORY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60526998238646938)
,p_query_column_id=>2
,p_column_alias=>'ITEM_CATEGORY_CODE'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527069726646939)
,p_query_column_id=>3
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527114001646940)
,p_query_column_id=>4
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527637889646945)
,p_query_column_id=>8
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527590201646944)
,p_query_column_id=>9
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>80
,p_column_heading=>'SALES ORDER NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527948698646948)
,p_query_column_id=>12
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>120
,p_column_heading=>'ITEM SPECIFICATION'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60527373199646942)
,p_query_column_id=>6
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60528259519646951)
,p_query_column_id=>15
,p_column_alias=>'TOTAL_AMOUNT'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60528185235646950)
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
 p_id=>wwv_flow_imp.id(60528085645646949)
,p_query_column_id=>13
,p_column_alias=>'UOM'
,p_column_display_sequence=>130
,p_column_heading=>'MEASURING UNIT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61883360437557849)
,p_plug_name=>'Customer WIse Orders Filters'
,p_static_id=>'customer-wise-orders-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>161
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(61884215969557858)
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
 p_id=>wwv_flow_imp.id(61883538391557851)
,p_name=>'P380_CWO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61883360437557849)
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
 p_id=>wwv_flow_imp.id(61883421613557850)
,p_name=>'P380_CWO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61883360437557849)
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
 p_id=>wwv_flow_imp.id(61883709158557852)
,p_name=>'P380_CWO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(61883360437557849)
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
 p_id=>wwv_flow_imp.id(61883767954557853)
,p_name=>'P380_CWO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61883360437557849)
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
 p_id=>wwv_flow_imp.id(61884215969557858)
,p_name=>'Customer Wise Orders Report'
,p_static_id=>'customer-wise-orders-report'
,p_parent_plug_id=>wwv_flow_imp.id(61883360437557849)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(61884438068557860)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61884554835557861)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61884347746557859)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61884843667557864)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61884786922557863)
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
 p_id=>wwv_flow_imp.id(61884974914557865)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61884654672557862)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61885101974557866)
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
 p_id=>wwv_flow_imp.id(61987738084685617)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17662394625116461)
,p_plug_name=>'Dispatched Quantity Out Filters'
,p_static_id=>'dispatched-quantity-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>61
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(17614717818610468)
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
 p_id=>wwv_flow_imp.id(17663130589116468)
,p_name=>'P380_DQO_LA_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17662394625116461)
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
 p_id=>wwv_flow_imp.id(17663196206116469)
,p_name=>'P380_DQO_LA_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(17662394625116461)
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
 p_id=>wwv_flow_imp.id(17662967321116467)
,p_name=>'P380_DQO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17662394625116461)
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
 p_id=>wwv_flow_imp.id(17662868952116466)
,p_name=>'P380_DQO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17662394625116461)
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
 p_id=>wwv_flow_imp.id(17614717818610468)
,p_name=>'Dispatched Quantity Out Report'
,p_static_id=>'dispatched-quantity-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(17662394625116461)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(17614966625610471)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58510635416128451)
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
 p_id=>wwv_flow_imp.id(17615221122610473)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367661615362833)
,p_query_column_id=>12
,p_column_alias=>'LA_LINK'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58510422422128449)
,p_query_column_id=>8
,p_column_alias=>'LOADINGADVICEDATE'
,p_column_display_sequence=>100
,p_column_heading=>'LOADING ADVICE DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58510542207128450)
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
 p_id=>wwv_flow_imp.id(17614755916610469)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17614856781610470)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367526806362832)
,p_query_column_id=>11
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367332812362830)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367412849362831)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERNO'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17615063001610472)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61480606643025229)
,p_plug_name=>'Month Wise Quantity Filters'
,p_static_id=>'month-wise-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>111
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(61481507311025238)
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
 p_id=>wwv_flow_imp.id(61480748656025231)
,p_name=>'P380_MWQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61480606643025229)
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
 p_id=>wwv_flow_imp.id(61480636426025230)
,p_name=>'P380_MWQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61480606643025229)
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
 p_id=>wwv_flow_imp.id(61480886035025232)
,p_name=>'P380_MWQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(61480606643025229)
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
 p_id=>wwv_flow_imp.id(61480976704025233)
,p_name=>'P380_MWQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61480606643025229)
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
 p_id=>wwv_flow_imp.id(61481507311025238)
,p_name=>'Month Wise Report'
,p_static_id=>'month-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(61480606643025229)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(61481740834025241)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61481955065025243)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61481661780025240)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61482156104025245)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61482100456025244)
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
 p_id=>wwv_flow_imp.id(61482213846025246)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61481844942025242)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61482361932025247)
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
 p_id=>wwv_flow_imp.id(61482768367025251)
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
 p_id=>wwv_flow_imp.id(57101403530729227)
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
 p_id=>wwv_flow_imp.id(58450568839618031)
,p_plug_name=>'Pending Quantity Out Filters'
,p_static_id=>'pending-quantity-out-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>71
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(58451450744618040)
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
 p_id=>wwv_flow_imp.id(58451149073618037)
,p_name=>'P380_PQO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(58450568839618031)
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
 p_id=>wwv_flow_imp.id(58451103270618036)
,p_name=>'P380_PQO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(58450568839618031)
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
 p_id=>wwv_flow_imp.id(58451267477618038)
,p_name=>'P380_PQO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(58450568839618031)
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
 p_id=>wwv_flow_imp.id(58451320522618039)
,p_name=>'P380_PQO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(58450568839618031)
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
 p_id=>wwv_flow_imp.id(58451450744618040)
,p_name=>'Pending Quantity Out Report'
,p_static_id=>'pending-quantity-out-report'
,p_parent_plug_id=>wwv_flow_imp.id(58450568839618031)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(58511332481128458)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58511604171128460)
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
 p_id=>wwv_flow_imp.id(59617251379387141)
,p_query_column_id=>8
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59617377170387142)
,p_query_column_id=>9
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58511208623128456)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58511294209128457)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367785658362834)
,p_query_column_id=>14
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>260
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58508678869128431)
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
 p_id=>wwv_flow_imp.id(59617573670387144)
,p_query_column_id=>11
,p_column_alias=>'SALESEXECUTIVECODE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59617662788387145)
,p_query_column_id=>12
,p_column_alias=>'SALESEXECUTIVENAME'
,p_column_display_sequence=>240
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58511660416128461)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>150
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58511792381128462)
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
 p_id=>wwv_flow_imp.id(62367847462362835)
,p_query_column_id=>15
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366059018362817)
,p_query_column_id=>10
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>250
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58511416842128459)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61482920681025253)
,p_plug_name=>'Quantity Over Time Filters'
,p_static_id=>'quantity-over-time-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>141
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(61483903938025262)
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
 p_id=>wwv_flow_imp.id(61483119666025255)
,p_name=>'P380_QOT_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61482920681025253)
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
 p_id=>wwv_flow_imp.id(61483102001025254)
,p_name=>'P380_QOT_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61482920681025253)
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
 p_id=>wwv_flow_imp.id(61483250359025256)
,p_name=>'P380_QOT_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(61482920681025253)
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
 p_id=>wwv_flow_imp.id(61483405349025257)
,p_name=>'P380_QOT_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61482920681025253)
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
 p_id=>wwv_flow_imp.id(61483903938025262)
,p_name=>'Quantity Over Time Report'
,p_static_id=>'quantity-over-time-report'
,p_parent_plug_id=>wwv_flow_imp.id(61482920681025253)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(61484196504025265)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61880188707557817)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61484019526025264)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61580350839576219)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61580298971576218)
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
 p_id=>wwv_flow_imp.id(61580424921576220)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61484301411025266)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61580611185576221)
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
 p_id=>wwv_flow_imp.id(61580976405576225)
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
 p_id=>wwv_flow_imp.id(60529246499646961)
,p_plug_name=>'Sales Executive Wise  Quantity  Filters'
,p_static_id=>'sales-executive-wise-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>131
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(61008813713437320)
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
 p_id=>wwv_flow_imp.id(60529485802646963)
,p_name=>'P380_SEW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(60529246499646961)
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
 p_id=>wwv_flow_imp.id(60529407808646962)
,p_name=>'P380_SEW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(60529246499646961)
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
 p_id=>wwv_flow_imp.id(60529592170646964)
,p_name=>'P380_SEW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(60529246499646961)
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
 p_id=>wwv_flow_imp.id(60529695388646965)
,p_name=>'P380_SEW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(60529246499646961)
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
 p_id=>wwv_flow_imp.id(61008813713437320)
,p_name=>'Sales Executive Wise Report'
,p_static_id=>'sales-executive-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(60529246499646961)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(61009407876437325)
,p_query_column_id=>4
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61009528774437327)
,p_query_column_id=>6
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>70
,p_column_heading=>'PARTY NAME'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61009269398437324)
,p_query_column_id=>3
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61009773415437329)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61009634750437328)
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
 p_id=>wwv_flow_imp.id(61480310675025226)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61479675195025220)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61009503758437326)
,p_query_column_id=>5
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61480055340025224)
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
 p_id=>wwv_flow_imp.id(61880609112557821)
,p_query_column_id=>10
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(62280275118079744)
,p_plug_name=>'Seller Category Wise Filters'
,p_static_id=>'seller-category-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>181
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(62281165193079753)
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
 p_id=>wwv_flow_imp.id(62280877475079750)
,p_name=>'P380_SECW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(62280275118079744)
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
 p_id=>wwv_flow_imp.id(62280789613079749)
,p_name=>'P380_SECW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(62280275118079744)
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
 p_id=>wwv_flow_imp.id(62280985710079751)
,p_name=>'P380_SECW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(62280275118079744)
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
 p_id=>wwv_flow_imp.id(62281098710079752)
,p_name=>'P380_SECW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(62280275118079744)
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
 p_id=>wwv_flow_imp.id(62281165193079753)
,p_name=>'Seller Category Wise Report'
,p_static_id=>'seller-category-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(62280275118079744)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(62282133878079763)
,p_query_column_id=>8
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Item Category'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281358957079755)
,p_query_column_id=>2
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281461101079756)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62368057498362837)
,p_query_column_id=>9
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62368142897362838)
,p_query_column_id=>10
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281272844079754)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281744114079759)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281637263079758)
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
 p_id=>wwv_flow_imp.id(62281887803079760)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive '
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281595643079757)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62281916293079761)
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
 p_id=>wwv_flow_imp.id(62282072909079762)
,p_query_column_id=>12
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(62278030903079722)
,p_plug_name=>'Seller City Wise Filters'
,p_static_id=>'seller-city-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>171
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(62278953963079731)
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
 p_id=>wwv_flow_imp.id(62278270397079724)
,p_name=>'P380_SCW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(62278030903079722)
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
 p_id=>wwv_flow_imp.id(62278118594079723)
,p_name=>'P380_SCW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(62278030903079722)
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
 p_id=>wwv_flow_imp.id(62278343166079725)
,p_name=>'P380_SCW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(62278030903079722)
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
 p_id=>wwv_flow_imp.id(62278489119079726)
,p_name=>'P380_SCW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(62278030903079722)
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
 p_id=>wwv_flow_imp.id(62278953963079731)
,p_name=>'Seller City Wise Report'
,p_static_id=>'seller-city-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(62278030903079722)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(62279141645079733)
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
 p_id=>wwv_flow_imp.id(62279278119079734)
,p_query_column_id=>4
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Party'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62279069623079732)
,p_query_column_id=>1
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62279572845079737)
,p_query_column_id=>5
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62279432650079736)
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
 p_id=>wwv_flow_imp.id(62279696137079738)
,p_query_column_id=>7
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62279381237079735)
,p_query_column_id=>3
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62279761974079739)
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
 p_id=>wwv_flow_imp.id(62279852421079740)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(61881154486557827)
,p_plug_name=>'Seller State Wise Filters'
,p_static_id=>'seller-state-wise-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>151
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(61882077402557836)
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
 p_id=>wwv_flow_imp.id(61881377348557829)
,p_name=>'P380_SSW_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61881154486557827)
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
 p_id=>wwv_flow_imp.id(61881304611557828)
,p_name=>'P380_SSW_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61881154486557827)
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
 p_id=>wwv_flow_imp.id(61881473120557830)
,p_name=>'P380_SSW_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(61881154486557827)
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
 p_id=>wwv_flow_imp.id(61881528336557831)
,p_name=>'P380_SSW_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61881154486557827)
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
 p_id=>wwv_flow_imp.id(61882077402557836)
,p_name=>'Seller State Wise Report'
,p_static_id=>'seller-state-wise-report'
,p_parent_plug_id=>wwv_flow_imp.id(61881154486557827)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(61882217884557838)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61882957453557845)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61882173662557837)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61882599114557841)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61882425383557840)
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
 p_id=>wwv_flow_imp.id(61882695274557842)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Sales Executive Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61882361980557839)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_column_heading=>'State Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61882773681557843)
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
 p_id=>wwv_flow_imp.id(61882818765557844)
,p_query_column_id=>9
,p_column_alias=>'TOTAL_BASE_AMOUNT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17661536583116452)
,p_plug_name=>'Total Amount Filters'
,p_static_id=>'total-amount-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>51
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(17612247543610444)
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
 p_id=>wwv_flow_imp.id(17662048839116458)
,p_name=>'P380_TA_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17661536583116452)
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
 p_id=>wwv_flow_imp.id(17662027966116457)
,p_name=>'P380_TA_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17661536583116452)
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
 p_id=>wwv_flow_imp.id(17662156870116459)
,p_name=>'P380_TA_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17661536583116452)
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
 p_id=>wwv_flow_imp.id(17662309577116460)
,p_name=>'P380_TA_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(17661536583116452)
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
 p_id=>wwv_flow_imp.id(17612247543610444)
,p_name=>'Total Amount Report'
,p_static_id=>'total-amount-report'
,p_parent_plug_id=>wwv_flow_imp.id(17661536583116452)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(17612630159610447)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17612790248610449)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17612399812610445)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17612501794610446)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62367141864362828)
,p_query_column_id=>10
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17613032921610451)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>70
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17613099235610452)
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
 p_id=>wwv_flow_imp.id(62367235000362829)
,p_query_column_id=>11
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17612667932610448)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17613583153610457)
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
 p_id=>wwv_flow_imp.id(17613487144610456)
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
 p_id=>wwv_flow_imp.id(57456031534245742)
,p_plug_name=>'Total Clients Filters'
,p_static_id=>'total-clients-filters'
,p_region_name=>'SID_SMART_FILTER'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(57100892632729222)
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
 p_id=>wwv_flow_imp.id(57457202487245753)
,p_name=>'P380_TC_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(57456031534245742)
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
 p_id=>wwv_flow_imp.id(57456964109245751)
,p_name=>'P380_TC_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(57456031534245742)
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
 p_id=>wwv_flow_imp.id(57457082518245752)
,p_name=>'P380_TC_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(57456031534245742)
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
 p_id=>wwv_flow_imp.id(57456862243245750)
,p_name=>'P380_TC_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(57456031534245742)
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
 p_id=>wwv_flow_imp.id(57100892632729222)
,p_name=>'Total Clients Report'
,p_static_id=>'total-clients-report'
,p_parent_plug_id=>wwv_flow_imp.id(57456031534245742)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(57456392654245745)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57456586802245747)
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
 p_id=>wwv_flow_imp.id(57456164191245743)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57456269634245744)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366847815362825)
,p_query_column_id=>9
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366805418362824)
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
 p_id=>wwv_flow_imp.id(57456430133245746)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57456685853245748)
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
 p_id=>wwv_flow_imp.id(57456788626245749)
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
 p_id=>wwv_flow_imp.id(17995423558672168)
,p_name=>'Total Dispatched Quantity'
,p_static_id=>'total-dispatched-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(17996318309672177)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(17995128853672165)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57867595653661850)
,p_query_column_id=>6
,p_column_alias=>'DESPATCHADVICEDATE'
,p_column_display_sequence=>60
,p_column_heading=>'DESPATCH ADVICE DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57867699167661851)
,p_query_column_id=>7
,p_column_alias=>'DESPATCHADVICENO'
,p_column_display_sequence=>70
,p_column_heading=>'DESPATCH ADVICE NO'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17994963392672163)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17995373032672167)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17995283869672166)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17995072064672164)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57867793593661852)
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
 p_id=>wwv_flow_imp.id(17996318309672177)
,p_plug_name=>'Total Dispatched Quantity Filters'
,p_static_id=>'total-dispatched-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>31
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(17995423558672168)
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
 p_id=>wwv_flow_imp.id(17996022222672174)
,p_name=>'P380_TDQ_DA_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17996318309672177)
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
 p_id=>wwv_flow_imp.id(17995876668672172)
,p_name=>'P380_TDQ_DA_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(17996318309672177)
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
 p_id=>wwv_flow_imp.id(17995780185672171)
,p_name=>'P380_TDQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17996318309672177)
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
 p_id=>wwv_flow_imp.id(17996267616672176)
,p_name=>'P380_TDQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17996318309672177)
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
 p_id=>wwv_flow_imp.id(57337600910235947)
,p_name=>'Total Ordered Quantity'
,p_static_id=>'total-ordered-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(57599351876908725)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(57600062819908732)
,p_query_column_id=>4
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57600272688908734)
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
 p_id=>wwv_flow_imp.id(57600011399908731)
,p_query_column_id=>3
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61880631828557822)
,p_query_column_id=>13
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58364353404166446)
,p_query_column_id=>10
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57600338362908735)
,p_query_column_id=>7
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>60
,p_column_heading=>'SALES ORDER DATE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57600490182908736)
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
 p_id=>wwv_flow_imp.id(61479474760025218)
,p_query_column_id=>2
,p_column_alias=>'SALES_EXECUTIVE_CODE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61479363273025217)
,p_query_column_id=>1
,p_column_alias=>'SALES_EXECUTIVE_NAME'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(61880781912557823)
,p_query_column_id=>14
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(58364247629166445)
,p_query_column_id=>9
,p_column_alias=>'SO_TNO'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57600160346908733)
,p_query_column_id=>5
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57600544363908737)
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
 p_id=>wwv_flow_imp.id(57600625301908738)
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
 p_id=>wwv_flow_imp.id(57457863092245760)
,p_plug_name=>'Total Orders Filters'
,p_static_id=>'total-orders-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>11
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(57336470606235936)
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
 p_id=>wwv_flow_imp.id(57458060316245762)
,p_name=>'P380_TO_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(57457863092245760)
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
 p_id=>wwv_flow_imp.id(57457938182245761)
,p_name=>'P380_TO_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(57457863092245760)
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
 p_id=>wwv_flow_imp.id(57599161171908723)
,p_name=>'P380_TO_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(57457863092245760)
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
 p_id=>wwv_flow_imp.id(57599221243908724)
,p_name=>'P380_TO_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(57457863092245760)
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
 p_id=>wwv_flow_imp.id(57599351876908725)
,p_plug_name=>'Total Orders Quantity Filters'
,p_static_id=>'total-orders-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>21
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(57336470606235936)
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
 p_id=>wwv_flow_imp.id(57599533969908727)
,p_name=>'P380_TOQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(57599351876908725)
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
 p_id=>wwv_flow_imp.id(57599455792908726)
,p_name=>'P380_TOQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(57599351876908725)
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
 p_id=>wwv_flow_imp.id(57599701027908728)
,p_name=>'P380_TOQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(57599351876908725)
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
 p_id=>wwv_flow_imp.id(57599715810908729)
,p_name=>'P380_TOQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(57599351876908725)
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
 p_id=>wwv_flow_imp.id(57336470606235936)
,p_name=>'Total Orders Report'
,p_static_id=>'total-orders-report'
,p_parent_plug_id=>wwv_flow_imp.id(57457863092245760)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(57598514546908717)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57598738264908719)
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
 p_id=>wwv_flow_imp.id(57458392686245765)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57458472228245766)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366515613362822)
,p_query_column_id=>11
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366330626362820)
,p_query_column_id=>9
,p_column_alias=>'PARTY_TNO'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57598841356908720)
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
 p_id=>wwv_flow_imp.id(57599000257908721)
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
 p_id=>wwv_flow_imp.id(62366665043362823)
,p_query_column_id=>12
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366425152362821)
,p_query_column_id=>10
,p_column_alias=>'SO_TNO'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57598634879908718)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57600833711908740)
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
 p_id=>wwv_flow_imp.id(17561533477836870)
,p_name=>'Total Pending Dispatched Quantity'
,p_static_id=>'total-pending-dispatched-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(17560490083836860)
,p_template=>wwv_flow_imp.id(574763864839963122)
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
 p_id=>wwv_flow_imp.id(17561748099836873)
,p_query_column_id=>3
,p_column_alias=>'CITYNAME'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17562034422836875)
,p_query_column_id=>5
,p_column_alias=>'DTL_PARTYNAME'
,p_column_display_sequence=>50
,p_column_heading=>'PARTY NAME'
,p_column_html_expression=>'<a href="#PARTY_LINK#" style="color:#2c5f8a;text-decoration:none;font-weight:500;">#PARTYNAME#</a>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17561608574836871)
,p_query_column_id=>1
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17561735311836872)
,p_query_column_id=>2
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(62366978892362826)
,p_query_column_id=>9
,p_column_alias=>'PARTY_LINK'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17562740923836883)
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
 p_id=>wwv_flow_imp.id(17562417730836879)
,p_query_column_id=>6
,p_column_alias=>'SALESORDERDATE'
,p_column_display_sequence=>90
,p_column_heading=>'SALES ORDER DATE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17562533697836880)
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
 p_id=>wwv_flow_imp.id(62367064723362827)
,p_query_column_id=>10
,p_column_alias=>'SO_LINK'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17561866420836874)
,p_query_column_id=>4
,p_column_alias=>'STATENAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17560490083836860)
,p_plug_name=>'Total Pending Dispatched Quantity Filters'
,p_static_id=>'total-pending-dispatched-quantity-filters'
,p_parent_plug_id=>wwv_flow_imp.id(57101403530729227)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>41
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(57336470606235936)
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
 p_id=>wwv_flow_imp.id(17560947117836865)
,p_name=>'P380_TPDQ_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17560490083836860)
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
 p_id=>wwv_flow_imp.id(17560610556836861)
,p_name=>'P380_TPDQ_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17560490083836860)
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
 p_id=>wwv_flow_imp.id(17560794501836863)
,p_name=>'P380_TPDQ_SO_DATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17560490083836860)
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
 p_id=>wwv_flow_imp.id(17560926289836864)
,p_name=>'P380_TPDQ_SO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(17560490083836860)
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
 p_id=>wwv_flow_imp.id(61880441782557820)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(57101403530729227)
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
 p_id=>wwv_flow_imp.id(62277557034079717)
,p_name=>'P380_CITY'
,p_item_sequence=>130
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101496470729228)
,p_name=>'P380_FROMDATE'
,p_item_sequence=>30
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101003334729223)
,p_name=>'P380_HEADER_TITLE'
,p_item_sequence=>10
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101911905729232)
,p_name=>'P380_ITEM'
,p_item_sequence=>70
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101742914729231)
,p_name=>'P380_ITEMSPECIFICATION'
,p_item_sequence=>60
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57338885674235960)
,p_name=>'P380_ITEM_CATEGORY'
,p_item_sequence=>80
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101642916729230)
,p_name=>'P380_PARTY'
,p_item_sequence=>50
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101187134729225)
,p_name=>'P380_REGION_TO_DISPLAY'
,p_item_sequence=>20
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57338747628235959)
,p_name=>'P380_SALES_EXECUTIVE'
,p_item_sequence=>90
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61880340718557819)
,p_name=>'P380_SELECTED_DAY'
,p_item_sequence=>110
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61480484194025228)
,p_name=>'P380_SELECTED_MONTH'
,p_item_sequence=>100
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61883049230557846)
,p_name=>'P380_STATE'
,p_item_sequence=>120
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57101604746729229)
,p_name=>'P380_TODATE'
,p_item_sequence=>40
,p_item_display_point=>'REGION_POSITION_01'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(62366136771362818)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(61880441782557820)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(62366243048362819)
,p_event_id=>wwv_flow_imp.id(62366136771362818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(57101234692729226)
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
