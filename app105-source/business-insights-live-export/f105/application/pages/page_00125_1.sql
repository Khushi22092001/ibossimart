prompt --application/pages/page_00125
begin
--   Manifest
--     PAGE: 00125
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
 p_id=>125
,p_name=>'Account Day Book'
,p_alias=>'ACCOUNT-DAY-BOOK'
,p_step_title=>'Account Day Book'
,p_warn_on_unsaved_changes=>'N'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P125_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/AccountDayBook.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P125_FROMDATE'').val());',
'  var toDate = new Date($(''#P125_TODATE'').val());',
'  var companycode ,global_companycode;',
'  ',
' ',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } ',
'  ',
'',
'  var reportParams = ',
'      ''&P_MODULE=''+ $(''#P125_MODULE'').val() + ',
'      ''&P_FROMDATE='' +$(''#P125_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P125_TODATE'').val() + ',
'      ''&P_VOUCHERNO='' + $(''#P125_VOUCHERNO'').val() +',
'      ''&P_ACCOUNT='' +$(''#P125_ACCOUNT'').val() +',
'      ''&P_LOCATION='' +$(''#P125_LOCATION'').val() +',
'      ''&P_DOCTYPE='' +$(''#P125_DOCTYPE'').val() +',
'      ''&P_FROMAMOUNT='' +$(''#P125_FROMAMOUNT'').val() +',
'      ''&P_TOAMOUNT='' +$(''#P125_TOAMOUNT'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode;',
'     ',
'       ',
'      ',
'  ',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P146_DOCTYPECODE'').getValue()==''CONVERSIONJOBOUTOFPREMISES'') {',
'                openModal(''StockStorageDetail'');',
'        }',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P125_BIREPORTURL'').val()',
'  var reportName =  ''AccountDayBook.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  ',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P125_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'       ''"_paramsP_MODULE":"'' +$(''#P125_MODULE'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P125_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P125_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_VOUCHERNO":"'' +$(''#P125_VOUCHERNO'').val() + ''",'' + ',
'	  ''"_paramsP_ACCOUNT":"'' +$(''#P125_ACCOUNT'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P125_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P125_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_FROMAMOUNT":"'' + $(''#P125_FROMAMOUNT'').val() + ''",'' + ',
'	  ''"_paramsP_TOAMOUNT":"'' + $(''#P125_TOAMOUNT'').val() + ''",'' + ',
'      ''"_paramsGLOBAL_COMPANYCODE":"'' +global_companycode;',
'     ',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(452387285642117091)
,p_plug_name=>'Account Day Book'
,p_static_id=>'account-day-book'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.tno,',
'       ',
'       Case',
'         When ROW_NUMBER() Over(Partition By a.tNo Order By a.tNo) = 1 Then',
'          a.VoucherNo',
'         Else',
'          Null',
'       End VoucherNo,',
'       Case',
'         When ROW_NUMBER() Over(Partition By a.tNo Order By a.tNo) = 1 Then',
'          a.VoucherDate',
'         Else',
'          Null',
'       End VoucherDate,',
'       Case',
'         When ROW_NUMBER() Over(Partition By a.tNo Order By a.tNo) = 1 Then',
'          a.DocTypeCode',
'         Else',
'          Null',
'       End DocType,',
'       --a.VoucherNo,',
'       --a.VoucherDate,',
'       -- a.DocTypeCode,',
'       b.sno,',
'       b.locationcode,',
'       Nvl(getpartyname(b.accountCode), b.accountcode) As Particular,',
'       Case',
'         When b.amount < 1 Then',
'          (-1) * b.amount',
'         Else',
'          0',
'       End Debit,',
'       Case',
'         When b.amount > 1 Then',
'          b.amount',
'         Else',
'          0',
'       End Credit,',
'       a.narration',
'',
'  From Voucher a, voucherDetail b',
' Where a.tno = b.tno',
' and a.COMPANYCODE = :global_companycode',
'   --and (:global_companycode is null or a.companycode = :global_companycode)',
'   and (:P125_MODULE is null or a.modulecode = :P125_MODULE)',
'   and (:P125_FROMDATE is null or a.voucherdate >= :P125_FROMDATE)',
'   and (:P125_TODATE is null or a.voucherdate <= :P125_TODATE)',
'   and (:P125_VOUCHERNO is null or a.tno = :P125_VOUCHERNO)',
'   and (:P125_ACCOUNT is null or b.accountcode = :P125_ACCOUNT)',
'   AND (:P125_LOCATION IS NULL OR instr('':''||:P125_LOCATION||'':'','':''||B.LocationCode||'':'') > 0)',
'   and (:P125_FROMAMOUNT is null or abs(b.amount) >= :P125_FROMAMOUNT)',
'   and (:P125_TOAMOUNT is null or abs(b.amount) <= :P125_TOAMOUNT)',
'   AND (:P125_DOCTYPE IS NULL OR instr('':''||:P125_DOCTYPE||'':'','':''||A.DOCTYPECODE||'':'') > 0)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Account Day Book'
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
 p_id=>wwv_flow_imp.id(449340601357666814)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>10355732157968830
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341486599666823)
,p_db_column_name=>'CREDIT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Credit'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341377778666822)
,p_db_column_name=>'DEBIT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Debit'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341699134666825)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341181815666820)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341656960666824)
,p_db_column_name=>'NARRATION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341315488666821)
,p_db_column_name=>'PARTICULAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Particular'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449341095572666819)
,p_db_column_name=>'SNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449340758966666815)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449340930238666817)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Voucherdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449340817216666816)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Voucher No'
,p_column_link=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.:156:P156_TNO,P156_CALLEDFROMPAGE,P156_CALLEDFROMTNO:#TNO#,125,&P125_TNO.'
,p_column_linktext=>'#VOUCHERNO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(452400648377125772)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'134158'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VOUCHERDATE:DOCTYPE:VOUCHERNO:LOCATIONCODE:PARTICULAR:DEBIT:CREDIT:NARRATION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(449341854427666826)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(440050212622898551)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(452387285642117091)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(452419772345317185)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_button_name=>'Reresh'
,p_static_id=>'reresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449342320328666831)
,p_name=>'P125_ACCOUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct nvl(getpartyname(b.accountcode),b.accountcode) d, b.accountcode r',
'from voucher a, voucherDetail B',
'where a.tno = b.tno',
'  and ( :P125_FROMDATE is null or a.voucherdate >= :P125_FROMDATE )',
'  and ( :P125_TODATE is null or a.voucherdate <= :P125_TODATE )',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P125_FROMDATE,P125_TODATE'
,p_ajax_items_to_submit=>'P125_FROMDATE,P125_TODATE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(440057237572928224)
,p_name=>'P125_BIREPORTURL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449342616590666834)
,p_name=>'P125_DOCTYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'Doc Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct getdoctypename(a.doctypecode) d, a.doctypecode r',
'from voucher a',
'where  ( :P125_FROMDATE is null or a.voucherdate >= :P125_FROMDATE )',
'  and ( :P125_TODATE is null or a.voucherdate <= :P125_TODATE )',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P125_FROMDATE,P125_TODATE'
,p_ajax_items_to_submit=>'P125_FROMDATE,P125_TODATE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449342378470666832)
,p_name=>'P125_FROMAMOUNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'From Amount'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449341990684666828)
,p_name=>'P125_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(298911203834175659)
,p_name=>'P125_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	a.LocationName d,',
'	a.LocationCode r',
'From Location a, ModuleLocationDetail b , ModuleLocation c',
'Where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)',
'	and c.CompanyCode = :GLOBAL_COMPANYCODE',
'	and (',
'		not exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'		or',
'		exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)',
'			and bb.LocationCode = a.LocationCode',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'	)',
'Order by a.LocationName'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449341892952666827)
,p_name=>'P125_MODULE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452420147046317188)
,p_name=>'P125_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(452387285642117091)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449342472582666833)
,p_name=>'P125_TOAMOUNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'To Amount'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449342139265666829)
,p_name=>'P125_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449342173327666830)
,p_name=>'P125_VOUCHERNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(449341854427666826)
,p_prompt=>'Transaction No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P125_VOUCHERNO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P125_FROMDATE,P125_TODATE'
,p_ajax_items_to_submit=>'P125_FROMDATE,P125_TODATE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Transaction No',
  'width', '550')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440050298823898552)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(440050212622898551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440050427436898553)
,p_event_id=>wwv_flow_imp.id(440050298823898552)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(298366382058399047)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298366707119399080)
,p_event_id=>wwv_flow_imp.id(298366382058399047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(452419894394317186)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(452419772345317185)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(452420062256317187)
,p_event_id=>wwv_flow_imp.id(452419894394317186)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(452387285642117091)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(301451876777226961)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set page item values'
,p_static_id=>'set-page-item-values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' if :P156_PARTYCODE is not null then',
'        :P125_ACCOUNT := :P156_PARTYCODE;',
'        :P156_PARTYCODE := null;',
'    end if;',
'    if :P156_MODULE is not null then',
'        :P125_MODULE := :P156_MODULE;',
'        :P156_MODULE :=null;',
'    end if;',
'    if :P156_FROMDATE is not null then',
'        :P125_FROMDATE := :P156_FROMDATE;',
'        :P156_FROMDATE := null;',
'    end if;',
'    if :P156_TODATE is not null then',
'        :P125_TODATE := :P156_TODATE;',
'        :P156_TODATE := null;',
'    end if;',
'    if :P156_LOCATION is not null then',
'        :P125_LOCATION := :P156_LOCATION;',
'        :P156_LOCATION :=null;',
'    end if;',
'    if :P156_TRANSACTION is not null then',
'        :P125_VOUCHERNO := :P156_TRANSACTION;',
'        :P156_TRANSACTION := null;',
'    end if;',
'    if :P156_DOCTYPE is not null then',
'        :P125_DOCTYPE := :P156_DOCTYPE;',
'        :P156_DOCTYPE := null;',
'    end if;',
'    if :P156_FROMAMOUNT is not null then',
'        :P125_FROMAMOUNT := :P156_FROMAMOUNT;',
'        :P156_FROMAMOUNT:=null;',
'    end if;',
'    if :P156_TOAMOUNT is not null then',
'        :P125_TOAMOUNT := :P156_TOAMOUNT;',
'        :P156_TOAMOUNT:=null;',
'    end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>83951191964008227
);
wwv_flow_imp.component_end;
end;
/
