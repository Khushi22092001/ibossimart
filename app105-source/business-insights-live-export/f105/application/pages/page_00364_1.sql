prompt --application/pages/page_00364
begin
--   Manifest
--     PAGE: 00364
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
 p_id=>364
,p_name=>'Transactional Summary Report'
,p_alias=>'TRANSACTIONAL-SUMMARY-REPORT'
,p_step_title=>'Transactional Summary Report'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#TSUMMARY tr .a-IRR-aggregate{',
'    background-color: #505f6d !important;',
'    color: white;',
'}',
'',
'#TSUMMARY tr .a-IRR-header{',
'    background-color: #505f6d !important;',
'    color: white;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51229704189411019)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51270069056927293)
,p_plug_name=>'Transactional Summary'
,p_static_id=>'transactional-summary'
,p_region_name=>'TSUMMARY'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    MODULENAME,',
'    PAGENO,',
'    SEQ,',
'',
'    ACTIVE,',
'    CANCELED,',
'    PREPARING,',
'    SHORTCLOSED,',
'    CLOSED,',
'    "NON-ACTIVE",',
'',
'    apex_util.prepare_url(',
'        ''f?p='' || :APP_ID || '':'' || PAGENO || '':'' || :APP_SESSION ||',
'        ''::NO::P'' || PAGENO || ''_FROMDATE,P'' || PAGENO || ''_TODATE,P''||PAGENO||''_LOCATION:'' ||',
'        :P364_FROMDATE || '','' || :P364_TODATE || '','' || :P364_LOCATION',
'    ) AS REDIRECT_URL',
'',
'FROM (',
'    SELECT ',
'        m.MODULENAME,',
'        m.PAGENO,',
'        a.STATUS,',
'        a.TNO,',
'        a.SEQ',
'    FROM IMART_TRANSACTIONS_VW a',
'    LEFT JOIN MODULE m ',
'        ON a.MODULE_NAME = m.MODULECODE',
'    WHERE a.TRANSACTION_DATE BETWEEN :P364_FROMDATE AND :P364_TODATE',
'',
'      AND (:P364_LOCATION IS NULL OR ',
'           INSTR('':''||:P364_LOCATION||'':'', '':''||a.LocationCode||'':'') > 0)',
'',
'      AND (:P364_COMPANY IS NULL OR ',
'           INSTR('':''||:P364_COMPANY||'':'', '':''||a.CompanyCode||'':'') > 0)',
'',
'      AND (:P364_MODULE IS NULL OR ',
'           INSTR('':''||:P364_MODULE||'':'', '':''||a.Module_Name||'':'') > 0)',
'',
'      AND (:P364_MODULEGROUP IS NULL OR ',
'           INSTR('':''||:P364_MODULEGROUP||'':'', '':''||m.ModuleGroupCode||'':'') > 0)',
')',
'PIVOT (',
'    COUNT(TNO)',
'    FOR STATUS IN (',
'        ''ACTIVE''        AS ACTIVE,',
'        ''CANCELED''      AS CANCELED,',
'        ''PREPARING''     AS PREPARING,',
'        ''SHORTCLOSED''   AS SHORTCLOSED,',
'        ''CLOSED''        AS CLOSED,',
'        NULL            AS "NON-ACTIVE"',
'    )',
')',
'ORDER BY SEQ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P364_COMPANY,P364_LOCATION,P364_FROMDATE,P364_TODATE,P364_MODULEGROUP,P364_MODULE'
,p_prn_page_header=>'Transactional Summary'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(51270129384927293)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_finder_drop_down=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_sort=>'N'
,p_show_chart=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>33803117259697977
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230522010411028)
,p_db_column_name=>'ACTIVE'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Active'
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
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230690138411029)
,p_db_column_name=>'CANCELED'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Canceled'
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
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230996053411032)
,p_db_column_name=>'CLOSED'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Closed'
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
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230317327411026)
,p_db_column_name=>'MODULENAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Transaction Module'
,p_column_link=>'#REDIRECT_URL#'
,p_column_linktext=>'#MODULENAME#'
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
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51231109841411033)
,p_db_column_name=>'NON-ACTIVE'
,p_display_order=>80
,p_column_identifier=>'Q'
,p_column_label=>'Non-Active'
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
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51231613457411039)
,p_db_column_name=>'PAGENO'
,p_display_order=>100
,p_column_identifier=>'R'
,p_column_label=>'Pageno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230720732411030)
,p_db_column_name=>'PREPARING'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Preparing'
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
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51231768630411040)
,p_db_column_name=>'REDIRECT_URL'
,p_display_order=>110
,p_column_identifier=>'S'
,p_column_label=>'Redirect Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230450157411027)
,p_db_column_name=>'SEQ'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Seq'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51230821080411031)
,p_db_column_name=>'SHORTCLOSED'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'Short-Closed'
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
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(51274190819929027)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'338072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULENAME:ACTIVE:NON-ACTIVE:PREPARING:CANCELED:SHORTCLOSED:CLOSED'
,p_sum_columns_on_break=>'ACTIVE:NON-ACTIVE:PREPARING:CANCELED:SHORTCLOSED:CLOSED'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51229932046411022)
,p_name=>'P364_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_item_default=>'GLOBALCOMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT COMPANYNAME,COMPANYCODE FROM COMPANY'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51229797590411020)
,p_name=>'P364_FROMDATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P364_TODATE',
  'min_date', 'ITEM',
  'min_item', 'P364_GLOBAL_FINANCIALYEARBEGIN',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51231331766411036)
,p_name=>'P364_GLOBAL_FINANCIALYEARBEGIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51231423865411037)
,p_name=>'P364_GLOBAL_FINANCIALYEAREND'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51230029600411023)
,p_name=>'P364_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT LOCATIONNAME, LOCATIONCODE FROM LOCATION'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51231197642411034)
,p_name=>'P364_MODULE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_prompt=>'Module'
,p_placeholder=>'-- Select Module Name --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT Distinct',
'     m.MODULENAME as d,',
'     a.MODULE_NAME as r',
'FROM IMART_TRANSACTIONS_VW a',
'LEFT JOIN MODULE m ON m.MODULECODE = a.MODULE_NAME',
'LEFT JOIN MODULEGROUP mg ON mg.MODULEGROUPCODE = m.MODULEGROUPCODE',
'WHERE  (:P364_MODULEGROUP IS NULL OR instr('':''||:P364_MODULEGROUP||'':'','':''||m.ModuleGroupCode||'':'') > 0 )',
'',
'',
''))
,p_lov_cascade_parent_items=>'P364_MODULEGROUP'
,p_ajax_items_to_submit=>'P364_MODULE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51231260089411035)
,p_name=>'P364_MODULEGROUP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_prompt=>'Module Group'
,p_placeholder=>'-- Select Module Group --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     mg.MODULEGROUPNAME,',
'     mg.MODULEGROUPCODE',
'FROM IMART_TRANSACTIONS_VW a',
'LEFT JOIN MODULE m ON a.MODULE_NAME = m.MODULECODE',
'LEFT JOIN MODULEGROUP mg ON mg.MODULEGROUPCODE = m.MODULEGROUPCODE'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51229876282411021)
,p_name=>'P364_TODATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51229704189411019)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P364_GLOBAL_FINANCIALYEAREND',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51230159149411024)
,p_name=>'Refresh the Report on Change'
,p_static_id=>'refresh-the-report-on-change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P364_COMPANY,P364_LOCATION,P364_FROMDATE,P364_TODATE,P364_MODULEGROUP,P364_MODULE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51230268324411025)
,p_event_id=>wwv_flow_imp.id(51230159149411024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(51270069056927293)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51231592341411038)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Global Fin Year Begin and End date'
,p_static_id=>'fetch-global-fin-year-begin-and-end-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P364_GLOBAL_FINANCIALYEARBEGIN  := :GLOBAL_FINANCIALYEARBEGIN;',
'    :P364_GLOBAL_FINANCIALYEAREND  := :GLOBAL_FINANCIALYEAREND;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>33764580216181722
);
wwv_flow_imp.component_end;
end;
/
