prompt --application/pages/page_00406
begin
--   Manifest
--     PAGE: 00406
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
 p_id=>406
,p_name=>'TDS RECEIVABLE'
,p_alias=>'TDS-RECEIVABLE'
,p_step_title=>'TDS RECEIVABLE'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
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
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(580309016104580067)
,p_plug_name=>'TDS RECEIVABLE'
,p_static_id=>'tds-receivable'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'      row_number() over(order by c.VoucherDate) SerialNo,',
'       getlocationname(A.LOCATIONCODE) location,',
'       A.DFREIGHTBILLRECEIPTNO AS ENTRYNO,',
'       A.DFREIGHTBILLRECEIPTDATE AS ENTRYDATE,',
'       C.VOUCHERNO,',
'       C.VOUCHERDATE,',
'       D.PARTYNAME,',
'       B.AMOUNT,',
'       B.TDSAMOUNT,',
'       NULL AS MATCHEDWITH26AS,',
'       getpartyattributevalue(D.PARTYCODE, ''PANNO'') AS PANNO,',
'       NULL AS GROSSAMOUNTASPER26AS,',
'       NULL AS TDSRECEIVABLEASPER26AS,',
'       NULL AS TDSDATEASPER26AS,',
'       NULL AS QUARTERASPER26AS,',
'       NULL AS YEARASPER26AS,',
'       NULL AS DIFFINGROSSFROM16AS,',
'       NULL AS DIFFINTDSFROM26AS,',
'       NULL AS REMARK',
'  FROM DFREIGHTBILLRECEIPT       A,',
'       DFREIGHTBILLRECEIPTDETAIL B,',
'       VOUCHER                   C,',
'       PARTY                     D',
' WHERE A.TNO = B.TNO',
'   AND A.TNO = C.MODULETNO(+)',
'   AND A.DEPOCODE = D.PARTYCODE(+)',
'   AND NVL(B.TDSAMOUNT, 0) > 0',
'  and ( :P406_LOCATION is null or instr('':''||:P406_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and C.VoucherDate between :P406_FROMDATE and :P406_TODATE',
'  and ( :P406_PartyCode IS NULL OR instr('':''||:P406_PartyCode||'':'','':''||a.DepoCode||'':'') > 0 )',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GST Input Report'
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
 p_id=>wwv_flow_imp.id(558878410632180705)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>119893541432482721
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467328594425024117)
,p_db_column_name=>'AMOUNT'
,p_display_order=>90
,p_column_identifier=>'EV'
,p_column_label=>'GROSS AMOUNT '
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467331390346024118)
,p_db_column_name=>'DIFFINGROSSFROM16AS'
,p_display_order=>160
,p_column_identifier=>'FC'
,p_column_label=>'DIFFERENCE IN GROSS AMOUNT FROM 26 AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#DIFFINGROSSFROM16AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467331789482024118)
,p_db_column_name=>'DIFFINTDSFROM26AS'
,p_display_order=>170
,p_column_identifier=>'FD'
,p_column_label=>'DIFFERENCE IN TDS AMOUNT FROM 26 AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#DIFFINTDSFROM26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467325832723024115)
,p_db_column_name=>'ENTRYDATE'
,p_display_order=>70
,p_column_identifier=>'ET'
,p_column_label=>'BILL RECEIPT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#ENTRYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467325442526024115)
,p_db_column_name=>'ENTRYNO'
,p_display_order=>60
,p_column_identifier=>'ES'
,p_column_label=>'BILL RECEIPT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#ENTRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467329470649024117)
,p_db_column_name=>'GROSSAMOUNTASPER26AS'
,p_display_order=>110
,p_column_identifier=>'EX'
,p_column_label=>'GROSS AMOUNT AS PER 26 AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#GROSSAMOUNTASPER26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189892643590436152)
,p_db_column_name=>'LOCATION'
,p_display_order=>200
,p_column_identifier=>'FG'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:140px">#LOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467329002429024117)
,p_db_column_name=>'MATCHEDWITH26AS'
,p_display_order=>100
,p_column_identifier=>'EW'
,p_column_label=>'WHETHER MATCHED WITH 26 AS OR NOT'
,p_column_html_expression=>'<div style="display:block; width:80px">#MATCHEDWITH26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467326995945024116)
,p_db_column_name=>'PANNO'
,p_display_order=>40
,p_column_identifier=>'DY'
,p_column_label=>'PAN'
,p_column_html_expression=>'<div style="display:block; width:80px">#PANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467326187015024116)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>80
,p_column_identifier=>'EU'
,p_column_label=>'PARTY'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467330621264024117)
,p_db_column_name=>'QUARTERASPER26AS'
,p_display_order=>140
,p_column_identifier=>'FA'
,p_column_label=>'QUARTER AS PER 26 AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUARTERASPER26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467332188284024118)
,p_db_column_name=>'REMARK'
,p_display_order=>180
,p_column_identifier=>'FE'
,p_column_label=>'REMARK'
,p_column_html_expression=>'<div style="display:block; width:100px">#REMARK#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189649963727099745)
,p_db_column_name=>'SERIALNO'
,p_display_order=>190
,p_column_identifier=>'FF'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467327437254024116)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>50
,p_column_identifier=>'ED'
,p_column_label=>'TDS AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467330195043024117)
,p_db_column_name=>'TDSDATEASPER26AS'
,p_display_order=>130
,p_column_identifier=>'EZ'
,p_column_label=>'TDS DEDUCTED DATE AS PER 26 AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSDATEASPER26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467329810604024117)
,p_db_column_name=>'TDSRECEIVABLEASPER26AS'
,p_display_order=>120
,p_column_identifier=>'EY'
,p_column_label=>'TDS RECEIVABLE AS PER 26AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSRECEIVABLEASPER26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467328238340024116)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>30
,p_column_identifier=>'CA'
,p_column_label=>'VOUCHER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467327787313024116)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>20
,p_column_identifier=>'BZ'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467331061204024118)
,p_db_column_name=>'YEARASPER26AS'
,p_display_order=>150
,p_column_identifier=>'FB'
,p_column_label=>'F.Y. AS PER 26 AS'
,p_column_html_expression=>'<div style="display:block; width:80px">#YEARASPER26AS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(559171419439990503)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131655'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1000
,p_report_columns=>'SERIALNO:LOCATION:VOUCHERNO:VOUCHERDATE:PANNO:ENTRYNO:ENTRYDATE:PARTYNAME:AMOUNT:TDSAMOUNT:MATCHEDWITH26AS:GROSSAMOUNTASPER26AS:TDSRECEIVABLEASPER26AS:TDSDATEASPER26AS:QUARTERASPER26AS:YEARASPER26AS:DIFFINGROSSFROM16AS:DIFFINTDSFROM26AS:REMARK'
,p_sort_column_1=>'VOUCHERDATE'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'AMOUNT:TDSAMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609459682678043907)
,p_plug_name=>'TDS RECEIVABLE'
,p_static_id=>'tds-receivable-2'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(452507642265779723)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(609459682678043907)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467340699138024127)
,p_name=>'P406_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(609459682678043907)
,p_item_default=>'Trunc(Sysdate)-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467341491539024127)
,p_name=>'P406_LOCATION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(609459682678043907)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''TDSRECEIVABLE''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '2',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467341889614024127)
,p_name=>'P406_PARTYCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(609459682678043907)
,p_prompt=>'Party'
,p_placeholder=>'Enter Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'B.PARTYNAME d,',
'B.PARTYCODE r',
'FROM DFREIGHTBILLRECEIPT A, PARTY B',
'WHERE A.DEPOCODE = B.PARTYCODE',
'Order by 1'))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467341120782024127)
,p_name=>'P406_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(609459682678043907)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189649743183099743)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189649878093099744)
,p_event_id=>wwv_flow_imp.id(189649743183099743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
