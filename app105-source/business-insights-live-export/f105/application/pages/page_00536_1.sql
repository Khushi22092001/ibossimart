prompt --application/pages/page_00536
begin
--   Manifest
--     PAGE: 00536
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
 p_id=>536
,p_name=>'Product Stock Group by Storage Location'
,p_alias=>'PRODUCT-STOCK-GROUP-BY-STORAGE-LOCATION'
,p_step_title=>'Product Stock Group by Storage Location'
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
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(318491383759833133)
,p_plug_name=>'Product Stock Group by Storage Location'
,p_static_id=>'product-stock-group-by-storage-location'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       STORAGELOCATIONCODE,',
'       STORAGELOCATIONNAME,',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':99:''||:APP_SESSION||''::''||'':99:P99_ITEMSPECIFICATIONCODE,P99_STORAGELOCATION:''||ITEMSPECIFICATIONCODE||'',''||STORAGELOCATIONCODE,NULL,''SESSION'' )||''">''||STORAGELOCATIONNAME||''</a>'' as Storag'
||'eLink,',
'       NVL(SUM(STOCKQUANTITY1),0)STOCKQUANTITY1,',
'       NVL(SUM(USEDSTOCKQUANTITY1),0)USEDSTOCKQUANTITY1,',
'       NVL(SUM(RESERVESTOCKQUANTITY1),0)RESERVESTOCKQUANTITY1,',
'       NVL(SUM(BALANCEQUANTITY1),0)BALANCEQUANTITY1,',
'       NVL(SUM(STOCKQUANTITY2),0)STOCKQUANTITY2,',
'       NVL(SUM(USEDSTOCKQUANTITY2),0)USEDSTOCKQUANTITY2,',
'       NVL(SUM(RESERVESTOCKQUANTITY2),0)RESERVESTOCKQUANTITY2,',
'       NVL(SUM(BALANCEQUANTITY2),0)BALANCEQUANTITY2,',
'       NVL(SUM(STOCKVALUE),0)STOCKVALUE',
'  from D_PRODUCT360VIEW_STOCKSTORAGELOCATIONWISE',
'  where  ITEMSPECIFICATIONCODE like nvl(:P536_ITEMSPECIFICATIONCODE,''%'')',
'  GROUP BY ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       STORAGELOCATIONCODE,',
'       STORAGELOCATIONNAME'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Customer Overdue Invoices'
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
 p_id=>wwv_flow_imp.id(318491444441833134)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_computation=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>118968038368426463
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253394457571099931)
,p_db_column_name=>'BALANCEQUANTITY1'
,p_display_order=>360
,p_column_identifier=>'CX'
,p_column_label=>'Balance Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253396015751099932)
,p_db_column_name=>'BALANCEQUANTITY2'
,p_display_order=>400
,p_column_identifier=>'DB'
,p_column_label=>'Balance Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253397621062099932)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Item Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253397248219099932)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>280
,p_column_identifier=>'CP'
,p_column_label=>'Item Specification Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253394068273099931)
,p_db_column_name=>'RESERVESTOCKQUANTITY1'
,p_display_order=>350
,p_column_identifier=>'CW'
,p_column_label=>'Reserve Stock Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253395655491099931)
,p_db_column_name=>'RESERVESTOCKQUANTITY2'
,p_display_order=>390
,p_column_identifier=>'DA'
,p_column_label=>'Reserve Stock Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253393274504099930)
,p_db_column_name=>'STOCKQUANTITY1'
,p_display_order=>330
,p_column_identifier=>'CU'
,p_column_label=>'Stock Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253394791187099931)
,p_db_column_name=>'STOCKQUANTITY2'
,p_display_order=>370
,p_column_identifier=>'CY'
,p_column_label=>'Stock Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253396416308099932)
,p_db_column_name=>'STOCKVALUE'
,p_display_order=>410
,p_column_identifier=>'DC'
,p_column_label=>'Stock Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253313987476465180)
,p_db_column_name=>'STORAGELINK'
,p_display_order=>450
,p_column_identifier=>'DG'
,p_column_label=>'Storage Location'
,p_column_html_expression=>'<div style="display:block; width:250px">#STORAGELINK#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253390870682099929)
,p_db_column_name=>'STORAGELOCATIONCODE'
,p_display_order=>430
,p_column_identifier=>'DE'
,p_column_label=>'Storage Location Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253391233680099929)
,p_db_column_name=>'STORAGELOCATIONNAME'
,p_display_order=>440
,p_column_identifier=>'DF'
,p_column_label=>'Storage Location Name'
,p_column_html_expression=>'<div style="display:block; width:250px">#STORAGELOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253393619690099931)
,p_db_column_name=>'USEDSTOCKQUANTITY1'
,p_display_order=>340
,p_column_identifier=>'CV'
,p_column_label=>'Used Stock Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(253395242052099931)
,p_db_column_name=>'USEDSTOCKQUANTITY2'
,p_display_order=>380
,p_column_identifier=>'CZ'
,p_column_label=>'Used Stock Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(318555472426116153)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'74569'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STORAGELINK:BALANCEQUANTITY1:BALANCEQUANTITY2:STOCKVALUE'
,p_sort_column_1=>'STORAGELOCATIONNAME'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY:STOCKQUANTITY1:STOCKQUANTITY2:USEDSTOCKQUANTITY1:USEDSTOCKQUANTITY2:RESERVESTOCKQUANTITY1:RESERVESTOCKQUANTITY2:BALANCEQUANTITY1:BALANCEQUANTITY2:STOCKVALUE:AGEOFSTOCK'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(253404618364099938)
,p_name=>'P536_FROMAGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(318491383759833133)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(253405409979099938)
,p_name=>'P536_ITEMCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(318491383759833133)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(253405854697099939)
,p_name=>'P536_ITEMSPECIFICATIONCODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(318491383759833133)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(253404229731099938)
,p_name=>'P536_MONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(318491383759833133)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(253403864095099938)
,p_name=>'P536_PARTYCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(318491383759833133)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(253404981879099938)
,p_name=>'P536_TOAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(318491383759833133)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
