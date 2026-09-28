prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
end;
/
 
prompt APPLICATION 105 - Imart
--
-- Application Export:
--   Application:     105
--   Name:            Imart
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 140
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00140
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>140);
end;
/
prompt --application/pages/page_00140
begin
wwv_flow_imp_page.create_page(
 p_id=>140
,p_name=>'Payment Advice'
,p_alias=>'PAYMENT-ADVICE-MASTER'
,p_step_title=>'Payment Advice'
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
'</script>'))
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#myfunctions#MIN#.js',
''))
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
'  var bireporturl = $(''#P140_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/PaymentAdvice.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P140_TNO'').val() ',
'      ;',
'',
' ',
'        var reportURL = bireporturl + reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P140_BIREPORTURL'').val()',
'  var reportName =  ''PaymentAdvice.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P140_TNO'').val() ',
'      ;',
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
'function generatePDF_new1() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P140_BIREPORTURL'').val()',
'  var reportName =  ''cheque.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P140_TNO'').val() ',
'      ;',
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
'',
'',
'/* WORKFLOW_LAYOUT_HORIZONTAL_HEADER_SYNC_V1 */',
'(function () {',
'  function bindGrid(grid) {',
'    var body = grid.querySelector(''.a-GV-bdy'');',
'    var header = grid.querySelector(''.a-GV-w-hdr'');',
'    if (!body || !header || body.dataset.workflowHorizontalSync === ''Y'') { return; }',
'',
'    body.dataset.workflowHorizontalSync = ''Y'';',
'    header.scrollLeft = body.scrollLeft;',
'    body.addEventListener(''scroll'', function () {',
'      header.scrollLeft = body.scrollLeft;',
'    }, { passive: true });',
'  }',
'',
'  function bindAll() {',
'    Array.prototype.forEach.call(document.querySelectorAll(''.a-IG''), bindGrid);',
'  }',
'',
'  function scheduleBinding() { window.setTimeout(bindAll, 0); }',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', scheduleBinding, { once: true });',
'  } else {',
'    scheduleBinding();',
'  }',
'  document.addEventListener(''click'', scheduleBinding);',
'  new MutationObserver(scheduleBinding).observe(document.documentElement, {',
'    childList: true,',
'    subtree: true',
'  });',
'}());',
'',
'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',
'(function(){',
'  "use strict";',
'  if(Number(apex.env.APP_PAGE_ID||0)!==140||window.hsplCrossformDetailIntegrityV1)return;',
'  window.hsplCrossformDetailIntegrityV1=true;',
'  var heldFromDetail=false;',
'  function inDetail(target){return !!(target&&target.closest&&target.closest("#detail,#Detail_ig"));}',
'  document.addEventListener("keydown",function(event){',
'    if(event.key!=="Tab")return;',
'    if(!event.repeat){heldFromDetail=inDetail(event.target);return;}',
'    if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}',
'  },true);',
'  document.addEventListener("keyup",function(event){if(event.key==="Tab")heldFromDetail=false;},true);',
'  window.addEventListener("blur",function(){heldFromDetail=false;});',
'  ',
'})();',
'',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* WORKFLOW_LAYOUT_STANDARD_GAP_V1 */',
'/* Keep a clear separation between the title card and tabs/report content. */',
'#tabcontainer,',
'#MYID {',
'  margin-top: 16px !important;',
'}',
'',
'',
'/* WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1 */',
'/* Wide entry grids retain their horizontal track and do not show an inner',
'   vertical scrollbar. */',
'.a-IG .a-GV-bdy,',
'.a-IG .a-GV-scrollBody,',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: scroll !important;',
'  overflow-y: hidden !important;',
'}',
'',
'',
'/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */',
'/* A track appears only when the grid columns exceed the available width. */',
'.a-IG .a-GV-bdy {',
'  overflow-x: auto !important;',
'}',
'',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1498476374486125776)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_parent_plug_id=>wwv_flow_imp.id(599962834278921064)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>110
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       --A.SNO,',
'       --DESCRIPTION,',
'       A.ATTRIBUTEVALUE,',
'       A.ATTACHMENTBLOB,',
'       A.FILENAME,',
'       A.ATTRIBUTECODE,',
'       A.MODULETNO,',
'       A.MODULESNO,',
'        b.PARTYATTRIBUTEname',
'  from MODULEATTACHMENT A , partyattribute b',
'  WHERE A.MODULETNO = :P140_TNO',
'   and a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P140_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Attachment'
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
 p_id=>wwv_flow_imp.id(1498477119061125784)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO,P1063_ATTRIBUTECODE,P1063_PARENT_FORMSTATUS:#MODULETNO#,#ATTRIBUTECODE#,&P140_FORMSTATUS.#SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>1058090773810199260
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1498477688547125789)
,p_db_column_name=>'ATTACHMENTBLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Attachmentblob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1218093100265996097)
,p_db_column_name=>'ATTRIBUTECODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Attributecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1345691974788940472)
,p_db_column_name=>'ATTRIBUTEVALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Attribute Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1498477759787125790)
,p_db_column_name=>'FILENAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1066223889536310589)
,p_db_column_name=>'MODULESNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Modulesno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1064829614202179538)
,p_db_column_name=>'MODULETNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(501248424181516513)
,p_db_column_name=>'PARTYATTRIBUTENAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Attribute name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1498477278364125785)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1501122708459101238)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1052819002306415699)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1420209973094491920)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(599962834278921064)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600269788697105940)
,p_plug_name=>'Payment Advice'
,p_static_id=>'payment-advice'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(599962834278921064)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       PAYMENTADVICENO,',
'       PAYMENTADVICEDATE,',
'       PARTYCODE,',
'       AMOUNT,',
'       ACCOUNTCODE,',
'       NARRATION,',
'       MODULECODE,',
'       MODULETNO,',
'       REMARK,',
'       AMOUNTDR,',
'       AMOUNTCR,',
'       PAYMENTDONE,',
'       CREATOR,',
'       MPAYMENTADVICENO,',
'       PAYMENTFROM,',
'       ACTIVETIME,',
'       ACTIVEUSER,',
'       PRIORITY,',
'       MONEYTRANSFERMODECODE,',
'       MONEYTRANSFERREFERENCENO,',
'       TDSDEDUCTABLEAMOUNT,',
'       TDSALREADYDEDUCTEDON,',
'       TDSMASTERCODE,',
'       WCTMASTERCODE,',
'       WCTDEDUCTABLEAMOUNT,',
'       WCTALREADYDEDUCTEDON,',
'       EMPLOYEECODE,',
'       MONEYTRANSFERREFERENCEDATE,',
'       TDSDEDUCTABLECALCULATION,',
'       TRANSACTIONTYPECODE,',
'       CGSTAMOUNT,',
'       SGSTAMOUNT,',
'       IGSTAMOUNT,',
'       CESSAMOUNT,',
'       TAXRATE,',
'       NATUREOFSUPPLYCODE,',
'       RECEIPTVOUCHERTNO,',
'       CHEQUEPRINTNAME,',
'       PAYMENTUNITCODE,',
'       LOANTNO,',
'       LOANSNO,',
'       MANUALVOUCHERNO,',
'       ROUNDINGAMOUNT,',
'       ROUNDINGMETHODCODE,',
'       TDSNATURECODE,',
'       TDSPAYEECATEGORYCODE,',
'       TDSTAXCATEGORYCODE,',
'       PANNO,',
'       TOTALTDSPERCENT,',
'       tdsamount,',
'       tdspercent,',
'       TDSONOVERANDABOVE,',
'       AMOUNTDRENTERED,',
'       TDSTHRESHOLD,',
'       THRESHOLDPLUSMINUS,',
'       TDSREFERENCENO,',
'       ADVANCEORBILL,',
'       TDSTRANSACTIONTHRESHOLD,',
'       TDSCERTIFICATENO,',
'       TDSLOWERRATEAPPLICABLE,',
'       TDSLOWERRATE,',
'       CESSLOWERRATE,',
'       SURCHARGELOWERRATE,',
'       TDSCERTIFICATEFILENAME,',
'       ISFINAL,',
'       CREATIONTIME,',
'       PAYMENTFORLOCATIONCODE,',
'       TOTALPAYMENTAMOUNTFORTHEFY,',
'       DEDUCTIONSTARTABOVEAMOUNT,',
'       INCOMETAXRETURNTILLDATE,',
'       ELIGIBLEFORTDSUNDER194Q,',
'       YEARSWITHOUTRETURN,',
'       TDSLOCATIONCODE,',
'       TDSADVANCEADJUSTEDWITHBILL,',
'       EMIPENALTYACCOUNTCODE,',
'       EMIPENALTYAMOUNT,',
'       ISINDIANRESIDENT,',
'       PAYMENTAGAINST,',
'       INFAVOUROF,',
'       TAXAMOUNT',
'  from PAYMENTADVICE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(599962908003921065)
,p_plug_name=>'Payment Advice Reference'
,p_static_id=>'payment-advice-reference'
,p_region_name=>'detail'
,p_parent_plug_id=>wwv_flow_imp.id(599962834278921064)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,TNO,',
'       SNO,',
'       SERIALNO,',
'       REFERENCEMODULECODE,',
'       REFERENCEMODULETNO,',
'       AMOUNT,',
'       TDSDEDUCTABLEAMOUNT,',
'       AMOUNTENTERED,',
'       TDSAMOUNT',
'  from PAYMENTADVICEREFERENCE',
'  WHERE TNO = :P140_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P140_TNO,P140_PARTYCODE,P140_REFMODULECODE,P140_PAYMENTADVICEDATE'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Payment Advice Reference'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600480623196400626)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'AMOUNT'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600480826682400628)
,p_name=>'AMOUNTENTERED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNTENTERED'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount To Be Paid'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'AMOUNTENTERED'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600484835607400668)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600484848510400669)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599963793744921074)
,p_name=>'REFERENCEMODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFERENCEMODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Reference Module'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select decode(a.ModuleCode,',
'              ''LOADINGADVICE'',',
'              ''Freight Advance For Loading Advice'',',
'              a.ModuleName) As ModuleName,',
'       a.ModuleCode',
'  From Module a',
' Where MODULECODE In (''LOADINGADVICE'')',
'   and :P140_DOCTYPECODE = ''FREIGHTADVANCE''',
'Union All',
'Select a.ModuleName, a.ModuleCode',
'  From Module a',
' Where a.PaymentAdviceColumnName Is Not Null',
'   and :P140_DOCTYPECODE != ''FREIGHTADVANCE'''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P140_DOCTYPECODE'
,p_ajax_optimize_refresh=>false
,p_static_id=>'REFERENCEMODULECODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(449340407490666812)
,p_name=>'REFERENCEMODULETNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFERENCEMODULETNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Reference No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '1000')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(213468971070289715)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P140_TNO,P140_PARTYCODE,P140_REFMODULECODE,P140_PAYMENTADVICEDATE,P140_FORMSTATUS,P140_LOCATIONCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600481292796400633)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599963309305921069)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599963184905921068)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600480903473400629)
,p_name=>'TDSAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TDSAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'TDS Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600480657151400627)
,p_name=>'TDSDEDUCTABLEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TDSDEDUCTABLEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'TDS Deductable Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599963132799921067)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P140_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(599963033433921066)
,p_internal_uid=>159576688182994542
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'    };',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(600486712112436753)
,p_interactive_grid_id=>wwv_flow_imp.id(599963033433921066)
,p_static_id=>'1601004'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600486902079436754)
,p_report_id=>wwv_flow_imp.id(600486712112436753)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(451834856494179576)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(449340407490666812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600487283777436766)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(599963132799921067)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600488197540436770)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(599963184905921068)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600489110025436772)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(599963309305921069)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600489989142436774)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(599963793744921074)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600491766522436778)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(600480623196400626)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600492685600436780)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(600480657151400627)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600493596438436782)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(600480826682400628)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600494497782436784)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(600480903473400629)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600520081025447558)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(600481292796400633)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601400850201822508)
,p_view_id=>wwv_flow_imp.id(600486902079436754)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(600484835607400668)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600481359363400634)
,p_plug_name=>'Payment Detail'
,p_static_id=>'payment-detail'
,p_region_name=>'PaymentDetail'
,p_parent_plug_id=>wwv_flow_imp.id(599962834278921064)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600481492685400635)
,p_plug_name=>'Summary of amount'
,p_static_id=>'summary-of-amount'
,p_parent_plug_id=>wwv_flow_imp.id(599962908003921065)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--accent1:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(302128798565025705)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600523928254454337)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1498476374486125776)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P140_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600367842417264821)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600368962691264824)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600368223435264823)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600370172428264825)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600370567106264825)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600369806948264824)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600369418027264824)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:328:&SESSION.::&DEBUG.:328:P328_TNO,P328_BIREPORTURL:&P140_TNO.,&P140_BIREPORTURL.'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600368579921264824)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600371038669264825)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(1052819002306415699)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P140_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P140_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(600329846459106017)
,p_branch_name=>'Go To Page 139'
,p_branch_action=>'f?p=&APP_ID.:314:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(600368223435264823)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600273694532105974)
,p_name=>'P140_ACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(600481359363400634)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Cash/Bank'
,p_source=>'ACCOUNTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.PartyName as AccountName,',
'	a.PartyCode as AccountCode',
'from Party a,  DocumentStatusDetail c, PartyCompany d',
'where a.ParentCode IN (''BANKACCOUNTS'', ''BANKODACCOUNTS'')',
'	and a.TNo = c.ModuleTNo',
'	and a.TNO = d.TNo',
'	and d.CompanyCode = :global_CompanyCode',
'	and c.ModuleCode = ''PARTY''',
'	and c.DocumentStatusCode = ''ACTIVE''',
'	and a.PartyTypeCode != ''ACCOUNTGROUP''',
'	and :P140_MONEYTRANSFERMODECODE IN (''CH'', ''CHEQUE'', ''RTGS'', ''EPAYMENT'', ''ATM'', ''NEFT'',''IFT'',''BANK'',''TRANSFER'')',
'UNION ',
'select',
'	a.PartyName as AccountName,',
'	a.PartyCode as AccountCode',
'from Party a, DocumentStatusDetail c, PartyCompany d ',
'where a.ParentCode IN (''CASHINHAND'')',
'	and a.TNo = c.ModuleTNo',
'	and a.TNO = d.TNo',
'	and d.CompanyCode = :global_CompanyCode',
'	and c.ModuleCode = ''PARTY''',
'	and c.DocumentStatusCode = ''ACTIVE''',
'	and :P140_MONEYTRANSFERMODECODE IN (''CASH'')',
'	and a.PartyTypeCode = ''ACCOUNT''',
'order by 1'))
,p_lov_cascade_parent_items=>'P140_MONEYTRANSFERMODECODE'
,p_ajax_items_to_submit=>'P140_MONEYTRANSFERMODECODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600278111880105979)
,p_name=>'P140_ACTIVETIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ACTIVETIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600278526248105979)
,p_name=>'P140_ACTIVEUSER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ACTIVEUSER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600293697947105991)
,p_name=>'P140_ADVANCEORBILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ADVANCEORBILL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600273331225105973)
,p_name=>'P140_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'AMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600276126009105975)
,p_name=>'P140_AMOUNTCR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Net Amount'
,p_format_mask=>'999999999.99'
,p_source=>'AMOUNTCR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600275684572105975)
,p_name=>'P140_AMOUNTDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Total Amount'
,p_format_mask=>'999999999.99'
,p_source=>'AMOUNTDR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600292135637105990)
,p_name=>'P140_AMOUNTDRENTERED'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'AMOUNTDRENTERED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602761714614017041)
,p_name=>'P140_BEFOREROUNDEDAMOUNTCR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1506603001034733896)
,p_name=>'P140_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1447984655818465504)
,p_name=>'P140_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_item_default=>'314'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(445917479614617222)
,p_name=>'P140_CALLEDFROMTNO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600285257235105987)
,p_name=>'P140_CESSAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'CESSAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600295711178105992)
,p_name=>'P140_CESSLOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'CESSLOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600284081109105987)
,p_name=>'P140_CGSTAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'CGSTAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600286922100105987)
,p_name=>'P140_CHEQUEPRINTNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(600481359363400634)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Print Name'
,p_source=>'CHEQUEPRINTNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600270625719105964)
,p_name=>'P140_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600297333148105992)
,p_name=>'P140_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600276869883105979)
,p_name=>'P140_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600298518557105993)
,p_name=>'P140_DEDUCTIONSTARTABOVEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'DEDUCTIONSTARTABOVEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600271739215105969)
,p_name=>'P140_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'	a.DocTypeName as d,',
'	a.DocTypeCode as r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c, Module d',
'where a.DocTypeCode = b.DocTypeCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600299274250105993)
,p_name=>'P140_ELIGIBLEFORTDSUNDER194Q'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ELIGIBLEFORTDSUNDER194Q'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600300899149105996)
,p_name=>'P140_EMIPENALTYACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'EMIPENALTYACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600301260797105996)
,p_name=>'P140_EMIPENALTYAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'EMIPENALTYAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600282490214105982)
,p_name=>'P140_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Employee'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEENAME , EMPLOYEECODE from employee',
'---where getdocumentstatuscode(''EMPLOYEE'',TNO) = ''ACTIVE'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600270895244105969)
,p_name=>'P140_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1447984569339465503)
,p_name=>'P140_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600284868989105987)
,p_name=>'P140_IGSTAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'IGSTAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600298903196105993)
,p_name=>'P140_INCOMETAXRETURNTILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'INCOMETAXRETURNTILLDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600302454770105997)
,p_name=>'P140_INFAVOUROF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'INFAVOUROF'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600296910351105992)
,p_name=>'P140_ISFINAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ISFINAL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600301729850105996)
,p_name=>'P140_ISINDIANRESIDENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ISINDIANRESIDENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600288049074105988)
,p_name=>'P140_LOANSNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'LOANSNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600287691283105988)
,p_name=>'P140_LOANTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'LOANTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600271270168105969)
,p_name=>'P140_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationName as d,',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode ',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600288480045105988)
,p_name=>'P140_MANUALVOUCHERNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'MANUALVOUCHERNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600274478619105975)
,p_name=>'P140_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1447980852022465466)
,p_name=>'P140_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600274930884105975)
,p_name=>'P140_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600279343364105980)
,p_name=>'P140_MONEYTRANSFERMODECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(600481359363400634)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Payment Mode'
,p_source=>'MONEYTRANSFERMODECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.MoneyTransferModeName,',
'a.MoneyTransferModeCode',
'from MoneyTransferMode a',
'order by 1'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600282880506105982)
,p_name=>'P140_MONEYTRANSFERREFERENCEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(600481359363400634)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'CH/Ref Date'
,p_source=>'MONEYTRANSFERREFERENCEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600279712367105980)
,p_name=>'P140_MONEYTRANSFERREFERENCENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(600481359363400634)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'CH/Ref No'
,p_source=>'MONEYTRANSFERREFERENCENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600277261917105979)
,p_name=>'P140_MPAYMENTADVICENO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'MPAYMENTADVICENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600274131234105975)
,p_name=>'P140_NARRATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(600481359363400634)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Narration'
,p_source=>'NARRATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600286083495105987)
,p_name=>'P140_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1447389072918194200)
,p_name=>'P140_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600290887579105989)
,p_name=>'P140_PANNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PANNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353540636277371)
,p_name=>'P140_PARTYBALANCE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Party balance'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600272900625105973)
,p_name=>'P140_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P140_PARTY'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1422037590782840664)
,p_name=>'P140_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600272493270105969)
,p_name=>'P140_PAYMENTADVICEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Payment Advice Date'
,p_source=>'PAYMENTADVICEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600272082711105969)
,p_name=>'P140_PAYMENTADVICENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Payment Advice No'
,p_source=>'PAYMENTADVICENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600302103804105997)
,p_name=>'P140_PAYMENTAGAINST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PAYMENTAGAINST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600276466499105979)
,p_name=>'P140_PAYMENTDONE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PAYMENTDONE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600297741282105993)
,p_name=>'P140_PAYMENTFORLOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PAYMENTFORLOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353744903277373)
,p_name=>'P140_PAYMENTFORLOCATIONNAME'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600277737635105979)
,p_name=>'P140_PAYMENTFROM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PAYMENTFROM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600287294057105988)
,p_name=>'P140_PAYMENTUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PAYMENTUNITCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600278891986105980)
,p_name=>'P140_PRIORITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'PRIORITY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600286477356105987)
,p_name=>'P140_RECEIPTVOUCHERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'RECEIPTVOUCHERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600483508190400655)
,p_name=>'P140_REFMODULECODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(599962908003921065)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600275254469105975)
,p_name=>'P140_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600288888526105988)
,p_name=>'P140_ROUNDINGAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Round Off '
,p_source=>'ROUNDINGAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600289258755105988)
,p_name=>'P140_ROUNDINGMETHODCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'ROUNDINGMETHODCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600284509991105987)
,p_name=>'P140_SGSTAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'SGSTAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(911967361184913435)
,p_name=>'P140_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P140_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1422037427137840663)
,p_name=>'P140_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1420209973094491920)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600296131292105992)
,p_name=>'P140_SURCHARGELOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'SURCHARGELOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600302900009105997)
,p_name=>'P140_TAXAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TAXAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600285686291105987)
,p_name=>'P140_TAXRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TAXRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600300524107105994)
,p_name=>'P140_TDSADVANCEADJUSTEDWITHBILL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSADVANCEADJUSTEDWITHBILL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600280501968105981)
,p_name=>'P140_TDSALREADYDEDUCTEDON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSALREADYDEDUCTEDON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454431631579978916)
,p_name=>'P140_TDSAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'TDS Amount'
,p_format_mask=>'999999999.99'
,p_source=>'TDSAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600296489197105992)
,p_name=>'P140_TDSCERTIFICATEFILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSCERTIFICATEFILENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600294484318105992)
,p_name=>'P140_TDSCERTIFICATENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSCERTIFICATENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600481869431400639)
,p_name=>'P140_TDSCESSAMOUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600481745798400638)
,p_name=>'P140_TDSCESSPERCENT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600280072618105981)
,p_name=>'P140_TDSDEDUCTABLEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSDEDUCTABLEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600283260247105983)
,p_name=>'P140_TDSDEDUCTABLECALCULATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSDEDUCTABLECALCULATION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600300049247105993)
,p_name=>'P140_TDSLOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSLOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600295278859105992)
,p_name=>'P140_TDSLOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSLOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600294857980105992)
,p_name=>'P140_TDSLOWERRATEAPPLICABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSLOWERRATEAPPLICABLE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600280884504105981)
,p_name=>'P140_TDSMASTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSMASTERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602760912546017033)
,p_name=>'P140_TDSMASTERNAME'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600289648400105988)
,p_name=>'P140_TDSNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'TDS Nature'
,p_source=>'TDSNATURECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'Select TDSNATURENAME, TDSNATURECODE from TDSNATURE '
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602760636723017030)
,p_name=>'P140_TDSNATURENAME'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600291693445105990)
,p_name=>'P140_TDSONOVERANDABOVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSONOVERANDABOVE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600290088398105988)
,p_name=>'P140_TDSPAYEECATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'TDS Payee Category'
,p_source=>'TDSPAYEECATEGORYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'Select TDSPAYEECATEGORYNAME,TDSPAYEECATEGORYCODE from TDSPAYEECATEGORY'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353602296277372)
,p_name=>'P140_TDSPAYEECATEGORYNAME'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454431682725978917)
,p_name=>'P140_TDSPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'TDS %'
,p_format_mask=>'999999999.99'
,p_source=>'TDSPERCENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600293271856105990)
,p_name=>'P140_TDSREFERENCENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSREFERENCENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600482063451400641)
,p_name=>'P140_TDSSURCHARGEAMOUNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600482038491400640)
,p_name=>'P140_TDSSURCHARGEPERCENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600290514416105989)
,p_name=>'P140_TDSTAXCATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSTAXCATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600292516983105990)
,p_name=>'P140_TDSTHRESHOLD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSTHRESHOLD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600294060584105991)
,p_name=>'P140_TDSTRANSACTIONTHRESHOLD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TDSTRANSACTIONTHRESHOLD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600292851974105990)
,p_name=>'P140_THRESHOLDPLUSMINUS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'THRESHOLDPLUSMINUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600270168883105952)
,p_name=>'P140_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600298115870105993)
,p_name=>'P140_TOTALPAYMENTAMOUNTFORTHEFY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TOTALPAYMENTAMOUNTFORTHEFY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600482195519400642)
,p_name=>'P140_TOTALTDSAMOUNT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600291275755105989)
,p_name=>'P140_TOTALTDSPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(600481492685400635)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TOTALTDSPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600283730440105986)
,p_name=>'P140_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602760133631017025)
,p_name=>'P140_VOUCHERNO'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_prompt=>'Voucher No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_tag_attributes=>'readonly=true'
,p_colspan=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353797566277374)
,p_name=>'P140_VOUCHERTNO'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600282117873105982)
,p_name=>'P140_WCTALREADYDEDUCTEDON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'WCTALREADYDEDUCTEDON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600281690484105982)
,p_name=>'P140_WCTDEDUCTABLEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'WCTDEDUCTABLEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600281317860105981)
,p_name=>'P140_WCTMASTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'WCTMASTERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600299738098105993)
,p_name=>'P140_YEARSWITHOUTRETURN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_item_source_plug_id=>wwv_flow_imp.id(600269788697105940)
,p_source=>'YEARSWITHOUTRETURN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600482525722400645)
,p_name=>'Calculate Net Amount'
,p_static_id=>'calculate-net-amount'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_TDSAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600482617968400646)
,p_event_id=>wwv_flow_imp.id(600482525722400645)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_AMOUNTCR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P140_AMOUNTDR,P140_TDSAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:P140_AMOUNTDR,0) - nvl(:P140_TDSAMOUNT,0) ',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(454431860752978918)
,p_name=>'calculate net amount'
,p_static_id=>'calculate-net-amount-2'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_TDSAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454431932198978919)
,p_event_id=>wwv_flow_imp.id(454431860752978918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_AMOUNTCR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P140_AMOUNTDR,P140_TDSAMOUNT',
  'plsql_expression', 'NVL(:P140_AMOUNTDR,0) - NVL(:P140_TDSAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600483762529400658)
,p_name=>'Calculate total amount'
,p_static_id=>'calculate-total-amount'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_triggering_element=>'TDSDEDUCTABLEAMOUNT,AMOUNTENTERED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600483878813400659)
,p_event_id=>wwv_flow_imp.id(600483762529400658)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("detail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("AMOUNTENTERED");',
    '',
    'var totalAmt = 0;',
    '',
    '',
    'model.forEach(function(r, index, id) {',
    '     meta = model.getRecordMetadata(id);',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total) && !meta.deleted && !meta.agg) {',
    '    totalAmt += total;',
    '  }',
    '',
    '});',
    '',
    '$s("P140_AMOUNTDR", totalAmt.toFixed(2));',
    '$s("P140_AMOUNTCR", totalAmt.toFixed(2));',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(212747272637770380)
,p_event_id=>wwv_flow_imp.id(600483762529400658)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function(){',
    'let model = apex.region("detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let amountentered_total = 0;',
    'let tdsdeductable_total = 0;',
    'let tds_total = 0;',
    '',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "AMOUNTENTERED") !== "" && !meta.deleted && !meta.agg) {',
    '        amountentered_total += Number(model.getValue(record, "AMOUNTENTERED"));',
    '    }',
    '    if (model.getValue(record, "TDSDEDUCTABLEAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        tdsdeductable_total += Number(model.getValue(record, "TDSDEDUCTABLEAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TDSAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        tds_total += Number(model.getValue(record, "TDSAMOUNT"));',
    '    }',
    '        ',
    '});',
    '',
    '$s(''P140_AMOUNTDR'',amountentered_total);',
    '$s(''P140_TDSDEDUCTABLEAMOUNT'',tdsdeductable_total);',
    '$s(''P140_TDSAMOUNT'',tds_total);',
    '',
    '$s(''P140_TOTALTDSAMOUNT'',tds_total);',
    '',
    '}());',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(212747397583770381)
,p_event_id=>wwv_flow_imp.id(600483762529400658)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNTENTERED,TDSDEDUCTABLEAMOUNT',
  'plsql_expression', ':AMOUNTENTERED',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600413473532306137)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600414383708306137)
,p_event_id=>wwv_flow_imp.id(600413473532306137)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600368223435264823)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600414885856306137)
,p_event_id=>wwv_flow_imp.id(600413473532306137)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600368223435264823)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P140_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600413864093306137)
,p_event_id=>wwv_flow_imp.id(600413473532306137)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600368223435264823)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600418379234308093)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600419309673308093)
,p_event_id=>wwv_flow_imp.id(600418379234308093)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600369418027264824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600418802978308093)
,p_event_id=>wwv_flow_imp.id(600418379234308093)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600369418027264824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600415330580306782)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600416147171306782)
,p_event_id=>wwv_flow_imp.id(600415330580306782)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600368579921264824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''NO''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600415699681306782)
,p_event_id=>wwv_flow_imp.id(600415330580306782)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600368579921264824)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P140_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600416665648306782)
,p_event_id=>wwv_flow_imp.id(600415330580306782)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600368579921264824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''YES''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600417099196307458)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600418017528307459)
,p_event_id=>wwv_flow_imp.id(600417099196307458)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600371038669264825)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE',
'  union all',
'  select 1 from voucher where moduletno = :P140_TNO;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600417512441307458)
,p_event_id=>wwv_flow_imp.id(600417099196307458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600371038669264825)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600406554214287951)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600371038669264825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600409515061287957)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600371038669264825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P140_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600408959877287957)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600371038669264825)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P140_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600407518528287956)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P140_TNO,P140_STATUS,P140_PAYMENTADVICEDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P140_TNO,:P140_STATUS);',
    'IF :P140_STATUS = ''ACTIVE'' then',
    '    postpaymentadvice(:P140_TNO,:P140_PAYMENTADVICEDATE);',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600407990411287956)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P140_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600410043551287957)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600408507573287957)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1052819002306415699)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600406975972287955)
,p_event_id=>wwv_flow_imp.id(600406554214287951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(298912578055175672)
,p_name=>'enable cheque field'
,p_static_id=>'enable-cheque-field'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_MONEYTRANSFERMODECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298912731944175674)
,p_event_id=>wwv_flow_imp.id(298912578055175672)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_MONEYTRANSFERREFERENCENO'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P140_MONEYTRANSFERMODECODE'
,p_client_condition_expression=>'CH'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298912662423175673)
,p_event_id=>wwv_flow_imp.id(298912578055175672)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_MONEYTRANSFERREFERENCENO'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P140_MONEYTRANSFERMODECODE'
,p_client_condition_expression=>'CH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600411656139305481)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600413052761305485)
,p_event_id=>wwv_flow_imp.id(600411656139305481)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600369806948264824)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P140_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600412085817305484)
,p_event_id=>wwv_flow_imp.id(600411656139305481)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600370172428264825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P140_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600412634291305485)
,p_event_id=>wwv_flow_imp.id(600411656139305481)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600370567106264825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P140_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600404880967286355)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600370172428264825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600405739316286360)
,p_event_id=>wwv_flow_imp.id(600404880967286355)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P140_TNO,P140_COMPANYCODE,P140_PURCHASEORDERNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '						and d.LoginName = User',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P60_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = '':P''||to_char(:APP_PAGE_ID)||''_PASSFAILREMARK''',
    '				where a.TNo = vPassFail.TNo;',
    '				',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600406194652286361)
,p_event_id=>wwv_flow_imp.id(600404880967286355)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1052819002306415699)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600405282355286359)
,p_event_id=>wwv_flow_imp.id(600404880967286355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577955271923219071)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600369418027264824)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577955395252219072)
,p_event_id=>wwv_flow_imp.id(577955271923219071)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189930388202676763)
,p_name=>'GeneratePDF1'
,p_static_id=>'generatepdf-2'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600369418027264824)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189930437829676764)
,p_event_id=>wwv_flow_imp.id(189930388202676763)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new1();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600410390976290543)
,p_name=>'Go Back To Called Form'
,p_static_id=>'go-back-to-called-form'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600367842417264821)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600410820896290543)
,p_event_id=>wwv_flow_imp.id(600410390976290543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P140_CALLEDFROMPAGE'').getValue();',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(454408992832940821)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>240
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454409107823940822)
,p_event_id=>wwv_flow_imp.id(454408992832940821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600484293995400663)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600484442669400664)
,p_event_id=>wwv_flow_imp.id(600484293995400663)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502723899907667402)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502723979791667403)
,p_event_id=>wwv_flow_imp.id(502723899907667402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '',
    'apex.region( "detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502724096111667404)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>300
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_triggering_element=>'TDSAMOUNT'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'REFERENCEMODULECODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502724174185667405)
,p_event_id=>wwv_flow_imp.id(502724096111667404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_detail"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502724288488667406)
,p_name=>'move tab 3'
,p_static_id=>'move-tab-3'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_NARRATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502724446418667407)
,p_event_id=>wwv_flow_imp.id(502724288488667406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_PaymentDetail"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(446862573773749741)
,p_name=>'New_4'
,p_static_id=>'new'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600367842417264821)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446863533494749742)
,p_event_id=>wwv_flow_imp.id(446862573773749741)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P140_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P140_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P140_TNO,P140_CALLEDFROMPAGE,P140_FORMSTATUS:#P140_TNO#,#P140_CALLEDFROMPAGE#,#P140_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    '',
    'url = url.replace("#P2002_TNO#", y);',
    '//window.alert(x);',
    '//window.alert(y);',
    '//window.alert(url);',
    '',
    '',
    '//call',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446863019946749742)
,p_event_id=>wwv_flow_imp.id(446862573773749741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_CALLEDFROMTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P140_MODULETNO',
  'plsql_expression', ':P140_MODULETNO',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P140_CALLEDFROMTNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(454409260792940823)
,p_name=>'open voucher'
,p_static_id=>'open-voucher'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_VOUCHERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454409273198940824)
,p_event_id=>wwv_flow_imp.id(454409260792940823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P140_VOUCHERTNO'').getValue();',
    'var y = ''140'';',
    'var z = ''CALLED'';',
    '',
    'var url = "f?p=#APP_ID#:156:#SESSION#::NO:RP,156:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P156_TNO#", x);',
    'url = url.replace("#P156_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P156_FORMSTATUS#", z);',
    '',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602760203925017026)
,p_name=>'Party Change'
,p_static_id=>'party-change'
,p_event_sequence=>118
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602760308981017027)
,p_event_id=>wwv_flow_imp.id(602760203925017026)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P140_PARTYBALANCE,P140_TDSPAYEECATEGORYCODE,P140_TDSMASTERCODE,P140_TDSMASTERNAME,P140_ELIGIBLEFORTDSUNDER194Q,P140_INCOMETAXRETURNTILLDATE',
  'items_to_submit', 'P140_PARTYCODE,P140_PAYMENTADVICEDATE,P140_TDSMASTERCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    'begin',
    '    select',
    '    	count(a.TNo) into tmp',
    '    from PartyTDSMaster a',
    '    where a.PartyCode = :P140_PartyCode',
    '    	and a.TDSMasterCode = nvl(:P140_TDSMasterCode, ''$null$'')',
    '    ;',
    '    ----',
    '    if nvl(tmp, 0) <= 0 or nvl(getMyParameterValue(''AUTOTDSMASTER''), ''YES'') = ''YES''  then		',
    '    	:P140_TDSMasterCode := getTDSMasterCode(:P140_PartyCode, to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''));',
    '    	--:P140_WCTMasterCode := getWCTMasterCode(:P140_PartyCode, to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''),:global_CompanyCode);',
    '    	',
    '    	:P140_TDSMasterName := GetTDSMasterName(:P140_TDSMasterCode);',
    '    		',
    '    end if;	',
    'end;',
    '----',
    'declare',
    '    tBalanceAmount number := GetLAccountClosingAsOn(:P140_PartyCode, :global_CompanyCode, to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), ''NO'', NULL );',
    'begin',
    '    if nvl(tBalanceAmount, 0) < 0 then',
    '        :P140_PARTYBALANCE := to_char(abs(tBalanceAmount), ''99,99,99,99,99,990.99'') || ''   Dr'';',
    '    elsif nvl(tBalanceAmount, 0) > 0 then',
    '        :P140_PARTYBALANCE := to_char(tBalanceAmount, ''99,99,99,99,99,990.99'') || ''   Cr'';',
    '    else',
    '        :P140_PARTYBALANCE := 0;',
    '    end if;',
    'end;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602760405162017028)
,p_name=>'Party_focus_2'
,p_static_id=>'party-focus'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602760526357017029)
,p_event_id=>wwv_flow_imp.id(602760405162017028)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P140_TDSMASTERCODE,P140_TDSMASTERNAME,P140_TDSNATURECODE',
  'items_to_submit', 'P140_PARTYCODE,P140_PAYMENTADVICEDATE,P140_LOCATIONCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P140_PartyCode is not null then',
    '        --raise_application_error(-20000, :P140_PartyCode || '' date : '' || to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''));',
    '		:P140_TDSMasterCode := GetTDSMasterCode(:P140_PartyCode, to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''));',
    '        :P140_TDSMASTERNAME := GetTDSMasterName(GetTDSMasterCode(:P140_PartyCode, to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR'')));',
    '		:P140_PANNo := getPartyAttributeValue(:P140_PartyCode, ''PANNO'');',
    '		declare',
    '			tLocationCode varchar2(30);',
    '		begin	',
    '			if :P140_LocationCode != ''CO'' then',
    '				tLocationCode := :P140_LocationCode;',
    '			else',
    '				tLocationCode := null;',
    '			end if;',
    '			----',
    '			/*declare',
    '				tBalanceAmount number := GetAccountClosing(:P140_PartyCode, :P140_PaymentAdviceDate, tLocationCode, :global_CompanyCode );',
    '			begin',
    '				if nvl(tBalanceAmount, 0) < 0 then',
    '					:P140_PartyBalance := to_char(abs(tBalanceAmount), ''99,99,99,99,990.99'') || '' Dr'';',
    '				elsif nvl(tBalanceAmount, 0) > 0 then',
    '					:P140_PartyBalance := to_char(tBalanceAmount, ''99,99,99,99,990.99'') || '' Cr'';',
    '				else',
    '					:P140_PartyBalance := 0;',
    '				end if;',
    '			end;',
    '            */',
    '		end;',
    '',
    'end if;',
    '----',
    'if :P140_TDSNatureCode is null then ',
    '	for vParty in ',
    '        (',
    '		select ',
    '			b.TDSNatureName,',
    '			a.TDSNatureCode',
    '		from Party a, TDSNature b ',
    '		where a.TDSNatureCode = b.TDSNatureCode',
    '			and a.PartyCode = :P140_PartyCode',
    '			)',
    '		loop ',
    '			--:P140_TDSNatureName := vParty.TDSNatureName;',
    '			:P140_TDSNatureCode := vParty.TDSNatureCode;	',
    '		end loop;',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600482664489400647)
,p_name=>'party_lose_focus_1'
,p_static_id=>'party-lose-focus'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600482825843400648)
,p_event_id=>wwv_flow_imp.id(600482664489400647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P140_TDSPAYEECATEGORYCODE,P140_TDSPAYEECATEGORYNAME,P140_INCOMETAXRETURNTILLDATE,P140_ELIGIBLEFORTDSUNDER194Q',
  'items_to_submit', 'P140_PARTYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '----',
    'for vParty in',
    '	(',
    '	select ',
    '		a.TDSPayeeCategoryCode,',
    '        b.TDSPayeeCategoryName,',
    '		a.IncomeTaxReturnTillDate,',
    '		a.EligibleForTDSUnder194Q',
    '	from Party a, TDSPayeeCategory b',
    '	where a.TDSPayeeCategoryCode = b.TDSPayeeCategoryCode(+)',
    '        and a.PartyCode = :P140_PartyCode ',
    '	)',
    'loop ',
    '	:P140_TDSPayeeCategoryCode 		:= vParty.TDSPayeeCategoryCode;',
    '    :P140_TDSPayeeCategoryName 		:= vParty.TDSPayeeCategoryName;',
    '	:P140_IncomeTaxReturnTillDate 	:= vParty.IncomeTaxReturnTillDate;',
    '	:P140_EligibleForTDSUnder194Q	:= vParty.EligibleForTDSUnder194Q;',
    'end loop;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600403118217285005)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600369806948264824)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600404000402285010)
,p_event_id=>wwv_flow_imp.id(600403118217285005)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P140_TNO,P140_COMPANYCODE,P140_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = '':P''||:APP_PAGE_ID||''_TNo''',
    '				and d.LoginName = User',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = '':P''||:APP_PAGE_ID||''_PASSFAILREMARK''',
    '			where a.TNo = vPassFail.TNo;',
    '			',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, '':P''||:APP_PAGE_ID||''_TNo'' , TMP, :global_CompanyCode );',
    '',
    '            -- if :P140_STATUS = ''ACTIVE'' then',
    '        ',
    '             --   CREATEPAYMENTADVICEFORPO(:P140_TNO);',
    '',
    '            --  end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600404457253285010)
,p_event_id=>wwv_flow_imp.id(600403118217285005)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1052819002306415699)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600403537483285009)
,p_event_id=>wwv_flow_imp.id(600403118217285005)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600483096529400651)
,p_name=>'PaymentForLocation'
,p_static_id=>'paymentforlocation'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_PAYMENTFORLOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600483188046400652)
,p_event_id=>wwv_flow_imp.id(600483096529400651)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P140_TDSLOCATIONCODE',
  'items_to_submit', 'P140_PAYMENTFORLOCATIONCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P140_PaymentForLocationCode is not null then',
    '	:P140_TDSLocationCode := :P140_PaymentForLocationCode;',
    'else',
    '    :P140_TDSLocationCode := null;',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600482273267400643)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600523928254454337)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600482392162400644)
,p_event_id=>wwv_flow_imp.id(600482273267400643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1498476374486125776)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600483562879400656)
,p_name=>'Set Amount'
,p_static_id=>'set-amount'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_triggering_element=>'AMOUNTENTERED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600483652912400657)
,p_event_id=>wwv_flow_imp.id(600483562879400656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNTENTERED',
  'sql_query', 'select :AMOUNTENTERED from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(181765601812466956)
,p_name=>'set amount_'
,p_static_id=>'set-amount-2'
,p_event_sequence=>330
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_triggering_element=>'AMOUNTENTERED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(181765632899466957)
,p_event_id=>wwv_flow_imp.id(181765601812466956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNTENTERED',
  'plsql_expression', ':AMOUNTENTERED',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(501246713553516496)
,p_name=>'set amount and amount entered'
,p_static_id=>'set-amount-and-amount-entered'
,p_event_sequence=>270
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_triggering_element=>'REFERENCEMODULETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501246857936516497)
,p_event_id=>wwv_flow_imp.id(501246713553516496)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNTENTERED,AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'REFERENCEMODULETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select BALANCEAMOUNT a , BALANCEAMOUNT b from ReferenceForPaymentAdvice where REFERENCEMODULETNO = :REFERENCEMODULETNO',
    'AND ROWNUM = 1')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P140_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199888021770537084)
,p_name=>'set amountcr'
,p_static_id=>'set-amountcr'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_ROUNDINGAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199888144188537085)
,p_event_id=>wwv_flow_imp.id(199888021770537084)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_AMOUNTCR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P140_AMOUNTDR,P140_ROUNDINGAMOUNT',
  'plsql_expression', 'NVL(:P140_AMOUNTDR,0) + NVL(:P140_ROUNDINGAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461546620665383505)
,p_name=>'set paymentforlocationcode'
,p_static_id=>'set-paymentforlocationcode'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_LOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461546670706383506)
,p_event_id=>wwv_flow_imp.id(461546620665383505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_PAYMENTFORLOCATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P140_LOCATIONCODE',
  'plsql_expression', ':P140_LOCATIONCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600484027835400660)
,p_name=>'Set Ref Module Code'
,p_static_id=>'set-ref-module-code'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449340514293666813)
,p_event_id=>wwv_flow_imp.id(600484027835400660)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_REFMODULECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'REFERENCEMODULECODE',
  'plsql_expression', ':REFERENCEMODULECODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600483264292400653)
,p_name=>'Set REFMODULECODE'
,p_static_id=>'set-refmodulecode'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599962908003921065)
,p_triggering_element=>'REFERENCEMODULECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600483434064400654)
,p_event_id=>wwv_flow_imp.id(600483264292400653)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_REFMODULECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'REFERENCEMODULECODE',
  'sql_query', 'select :REFERENCEMODULECODE from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502799212838042310)
,p_name=>'skip focus to partycode '
,p_static_id=>'skip-focus-to-partycode'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_PAYMENTADVICEDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM CODESCHEME A',
'WHERE A.MODULECODE = getmodulecodeforpageno(:APP_PAGE_ID)',
'AND CODESCHEME=''AUTO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502799586694042317)
,p_event_id=>wwv_flow_imp.id(502799212838042310)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602760663075017031)
,p_name=>'TDS Nature'
,p_static_id=>'tds-nature'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_TDSNATURENAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602760829605017032)
,p_event_id=>wwv_flow_imp.id(602760663075017031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P140_TDSTAXCATEGORYCODE',
  'items_to_submit', 'P140_PAYMENTADVICEDATE,P140_TDSPAYEECATEGORYCODE,P140_TDSNATURECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P140_TDSNATURECODE is not null then',
    '    :P140_TDSTaxCategoryCode := GetTDSTaxCategoryCode(:P140_TDSPayeeCategoryCode, :P140_TDSNatureCode, :P140_PaymentAdviceDate);',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761412530017038)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(599962908003921065)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CalculateAmountCR'
,p_static_id=>'calculateamountcr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--PROCEDURE CalculateAmountCR IS',
'declare',
'	ttmp Number;',
'	tExpenseAmount Number;',
'	tTotalExpenseAmount Number;',
'	tThisExpenseAmount Number;',
'	tTDSAmount Number;',
'	tSumOfAmountEntered number;',
'	tSumOfAmount number;',
'	tNoTDSAmount number;',
'	tSumOfNoTDSAmount number;',
'begin',
'',
'  	if :P140_PartyCode is not null  and :P140_DocTypeCode != ''EMIREVERSAL'' then ',
'		--SetTDSAndThreshold;',
'        ',
'		for vPA in',
'			(',
'			Select',
'				sum(a.AmountEntered) as SumOfAmountEntered',
'			From PaymentAdviceReference a',
'			Where a.Tno = :P140_Tno',
'            --05-02-2024',
'              AND A.SNO = :SNO',
'			)',
'		loop',
'			tSumOfAmountEntered := vPA.SumOfAmountEntered;',
'			exit;',
'		end loop;',
'		----',
'		if nvl(tSumOfAmountEntered, 0) > 0 then ',
'			for vRef in',
'				(',
'				Select',
'					a.Tno,',
'					a.Sno,',
'					a.ReferenceModuleCode,',
'					a.ReferenceModuleTNo,',
'					a.AmountEntered,',
'					a.Amount',
'				From PaymentAdviceReference a',
'				Where a.Tno = :P140_Tno',
'                  -- 05-02-24',
'                  AND A.SNO = :SNO',
'				Order by a.Sno',
'				)',
'			loop',
'				if vRef.ReferenceModuleCode in (''JOBORDER'', ''PURCHASEORDER'',''CCINVOICE'',''GRN'',''LOADINGADVICE'') and :P140_DOCTYPECODE != ''FREIGHTADVANCE'' then ',
'					:P140_AdvanceOrBill := ''ADVANCE'';',
'				else ',
'					:P140_AdvanceOrBill := ''NOTDS'';',
'				end if;',
'				----',
'				if vRef.ReferenceModuleCode in (''JOBORDER'', ''PURCHASEORDER'',''CCINVOICE'',''GRN'',''LOADINGADVICE'') ',
'                -- 03-DEC-2024',
'                --and :P140_DOCTYPECODE != ''FREIGHTADVANCE'' ',
'                then ',
'					:P140_AdvanceOrBill := ''ADVANCE'';',
'					--:ReferenceBlock.NoTDSAmount := 0;',
'					Update PaymentAdviceReference a',
'					Set a.NoTDSAmount = 0',
'					Where a.Tno = vRef.Tno',
'					and a.Sno = vRef.Sno',
'					;',
'					----',
'					if :P140_TDSOnOverAndAbove = ''YES'' then ',
'						if nvl(:P140_ThresholdPlusMinus, 0) < 0 then ',
'							--:ReferenceBlock.Amount := :ReferenceBlock.AmountEntered;',
'							Update PaymentAdviceReference a',
'							Set a.Amount = a.AmountEntered',
'							Where a.Tno = vRef.Tno',
'							and a.Sno = vRef.Sno',
'							;',
'							:P140_ThresholdPlusMinus := -1 * nvl(tSumOfAmountEntered, 0);',
'						else ',
'							select ',
'								sum(-1 * b.ThresholdPlusMinus)',
'								into tExpenseAmount',
'							from Voucher a, VoucherTDSDeducted b ',
'							where a.TNo = b.TNo ',
'									and b.PartyCode = :P140_PartyCode',
'									and a.FinancialYearCode = :P140_FinancialYearCode',
'									and b.AdvanceOrBill = ''ADVANCE''',
'									and b.TDSNatureCode = :P140_TDSNatureCode',
'									and b.ThresholdPlusMinus < 0',
'							;',
'							tExpenseAmount := round(tExpenseAmount * vRef.AmountEntered / tSumOfAmountEntered, 0);',
'							--:ReferenceBlock.Amount :=  round ((( vRef.AmountEntered + nvl(tExpenseAmount, 0)) * 100 ) / (100 - NVL(:P140_TOTALTDSPERCENT, 0)), 0) - NVL(tExpenseAmount, 0) ;',
'							Update PaymentAdviceReference a',
'							Set a.Amount = round ((( vRef.AmountEntered + nvl(tExpenseAmount, 0)) * 100 ) / (100 - NVL(:P140_TOTALTDSPERCENT, 0)), 0) - NVL(tExpenseAmount, 0)',
'							Where a.Tno = vRef.Tno',
'							and a.Sno = vRef.Sno',
'                            ;',
'						end if;',
'					else ',
'						--:ReferenceBlock.Amount :=  NVL(:ReferenceBlock.AmountEntered,0);',
'						 Update PaymentAdviceReference a',
'						Set a.Amount = a.AmountEntered',
'						Where a.Tno = vRef.Tno',
'						and a.Sno = vRef.Sno',
'						;',
'                        ',
'					end if;  -- if :P140_TDSOnOverAndAbove = ''YES'' then ',
'					----',
'					/*for vRef2 in',
'						(',
'						Select',
'							a.Tno,',
'							a.Sno,',
'							a.ReferenceModuleCode,',
'							a.ReferenceModuleTNo,',
'							a.AmountEntered,',
'							a.Amount',
'						From PaymentAdviceReference a',
'						Where a.Tno = vRef.Tno',
'							and a.Sno = vRef.Sno',
'						)',
'                    loop',
'    					for vJobOrder in',
'    						(',
'    						select ',
'    							a.SumOfAmount',
'    						from JobOrder a',
'    						where  a.TNo = vRef2.ReferenceModuleTNo				',
'    						)',
'    					loop ',
'    						if vRef2.Amount > vJobOrder.SumOfAmount then ',
'    							--:ReferenceBlock.NoTDSAmount := vRef2.Amount - nvl(vJobOrder.SumOfAmount, 0);',
'    							Update PaymentAdviceReference a',
'    							Set a.NoTDSAmount = vRef2.Amount - nvl(vJobOrder.SumOfAmount, 0)',
'    							Where a.Tno = vRef2.Tno',
'    							and a.Sno = vRef2.Sno',
'    							;',
'    						end if;',
'    					end loop;',
'                    end loop;',
'                    */',
'				else',
'					--:ReferenceBlock.Amount := :ReferenceBlock.AmountEntered;',
'					--:ReferenceBlock.NoTDSAmount := :ReferenceBlock.Amount;',
'					----',
'					 Update PaymentAdviceReference a',
'					Set a.Amount = a.AmountEntered,',
'						a.NoTDSAmount = a.AmountEntered',
'					Where a.Tno = vRef.Tno',
'					and a.Sno = vRef.Sno',
'                    ;',
'                    ',
'                   ',
'				end if;	-- if :ReferenceBlock.ReferenceModuleCode in (''JOBORDER'') then ',
'			end loop;',
'			for vPA in',
'				(',
'				Select',
'					sum(a.AmountEntered) as SumOfAmountEntered',
'				From PaymentAdviceReference a',
'				Where a.Tno = :P140_Tno',
'                    -- 05-02-2024',
'                   AND A.SNO = :SNO',
'				)',
'			loop',
'				tSumOfAmount := vPA.SumOfAmountEntered;',
'				exit;',
'			end loop;',
'                --        RAISE_APPLICATION_ERROR(-20022,''T ''||:P140_TDSDeductableAmount||'' AMTDR ''||:P140_AmountDr);',
'',
'			----',
'			:P140_AmountDr := nvl(tSumOfAmount, :P140_AmountDREntered);',
'		else ',
'			:P140_AdvanceOrBill := ''ADVANCE'';',
'			----',
'			if :P140_TDSOnOverAndAbove = ''YES'' then ',
'				if nvl(:P140_ThresholdPlusMinus, 0) < 0 then ',
'					:P140_AmountDr := :P140_AmountDrEntered;',
'					:P140_ThresholdPlusMinus := -1 * :P140_AmountDr;',
'				else',
'					select ',
'						sum(-1 * b.ThresholdPlusMinus)',
'						into tExpenseAmount',
'					from Voucher a, VoucherTDSDeducted b ',
'					where a.TNo = b.TNo ',
'						and b.PartyCode = :P140_PartyCode',
'						and a.FinancialYearCode = :P140_FinancialYearCode',
'						and b.AdvanceOrBill = ''ADVANCE''',
'						and b.TDSNatureCode = :P140_TDSNatureCode',
'						and b.ThresholdPlusMinus < 0',
'					;',
'					:P140_AmountDr :=  round(( ( :P140_AmountDrEntered + nvl(tExpenseAmount, 0) ) * 100 ) / (100 - NVL(:P140_TOTALTDSPERCENT, 0)), 0)- NVL(tExpenseAmount, 0);',
'				end if;',
'			else ',
'				:P140_AmountDr :=  :P140_AmountDrEntered;',
' 			',
'			end if;',
'		end if; -- if nvl(:ReferenceBlock.SumOfAmountEntered, 0) > 0 then ',
'		----',
'		for vRef3 in',
'			(',
'			Select',
'				sum(a.NoTDSAmount) as SumOfNoTDSAmount',
'			From PaymentAdviceReference a',
'			Where a.Tno = :P140_Tno',
'            --05-02-2024',
'              AND A.SNO = :SNO',
'			)',
'		loop',
'			tSumOfNoTDSAmount := vRef3.SumOfNoTDSAmount;',
'		end loop;',
'		----',
'       -- RAISE_APPLICATION_ERROR(-20023,''T ''||:P140_TDSDeductableAmount||'' AMTDR ''||:P140_AmountDr);',
'		if :P140_AdvanceOrBill = ''ADVANCE'' and :P140_DocTypecode != ''EMIREVERSAL'' ',
'				and (',
'					nvl(:P140_TotalPaymentAmountForTheFY, 0) + :P140_AmountDr > NVL(:P140_DeductionStartAboveAmount, 0)',
'					or',
'					:P140_EligibleForTDSUnder194Q = ''YES''',
'				)',
'				then',
'			:P140_TDSDeductableAmount := nvl(:P140_AmountDr, 0) + nvl(:P140_ThresholdPlusMinus, 0) - nvl(tSumOfNoTDSAmount, 0);				',
'        --RAISE_APPLICATION_ERROR(-20023,''T ''||:P140_TDSDeductableAmount||'' AMTDR ''||:P140_AmountDr);',
'		else						',
'			:P140_TDSDeductableAmount := 0;',
'		end if;	',
'				declare							',
'			tTotalDebit Number;',
'			tTotalCredit Number;  		',
'			tClosing Number;					',
'			tStartDate Date := GetFinancialYearBegin(:P140_FinancialYearCode);',
'			tNoDeductionLimit Number;',
'			tTotalTDSTransaction Number;',
'													',
'		begin			',
'			for vFooter in',
'				(',
'				select',
'					a.SNo,',
'					a.FooterHeadCode,',
'					b.FooterHeadName,',
'					b.FooterPostFix,',
'					to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithPAN, ''.CESSONTDS.'', d.CessPercentWithPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithPAN, 0)) as FooterPercentWithPAN,',
'					to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN,',
'					to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutReturn, ''.CESSONTDS.'', d.CessPercentWithoutReturn, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutReturn, 0)) as FooterPercentWithoutReturn',
'				from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
'				where a.FooterHeadCode = b.FooterHeadCode',
'					and c.TNo = d.TNo',
'					and c.TDSTaxCategoryCode = :P140_TDSTaxCategoryCode',
'					and d.TDSPayeeCategoryCode = :P140_TDSPayeeCategoryCode',
'					and c.EffectiveFrom <= :P140_PaymentAdviceDate',
'					and a.FooterHeadCode in(',
'						''.TDS.'',',
'						''.CESSONTDS.'',',
'						''.SURCHARGEONTDS.''',
'						)',
'					and a.CompanyCode = :global_CompanyCode ',
'					and a.FinancialYearCode = :global_FinancialYearCode',
'					and a.ModuleCode = ''PAYMENTADVICE''',
'					and :P140_TDSLowerRateApplicable != ''YES''',
'				UNION ALL',
'				select',
'					a.SNo,',
'					a.FooterHeadCode,',
'					b.FooterHeadName,',
'					b.FooterPostFix,',
'					to_number(decode(a.FooterHeadCode, ''.TDS.'', :P140_TDSLowerRate, ''.CESSONTDS.'', :P140_CessLowerRate, ''.SURCHARGEONTDS.'', :P140_SurchargeLowerRate, 0)) as FooterPercentWithPAN,',
'					to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN,',
'					to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutReturn, ''.CESSONTDS.'', d.CessPercentWithoutReturn, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutReturn, 0)) as FooterPercentWithoutReturn',
'				from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
'				where a.FooterHeadCode = b.FooterHeadCode',
'					and c.TNo = d.TNo',
'					and c.TDSTaxCategoryCode = :P140_TDSTaxCategoryCode',
'					and d.TDSPayeeCategoryCode = :P140_TDSPayeeCategoryCode',
'					and c.EffectiveFrom <= :P140_PaymentAdviceDate',
'					and a.FooterHeadCode in(',
'						''.TDS.'',',
'						''.CESSONTDS.'',',
'						''.SURCHARGEONTDS.''',
'						)',
'					and a.CompanyCode = :global_CompanyCode ',
'					and a.FinancialYearCode = :global_FinancialYearCode',
'					and a.ModuleCode = ''PAYMENTADVICE''',
'					and :P140_TDSLowerRateApplicable = ''YES''',
'				order by 1 ',
'				)',
'			loop',
'				if vFooter.FooterHeadCode = ''.TDS.'' then',
'					if :P140_PANNo is null then ',
'						:P140_TDSPercent := vFooter.FooterPercentWithoutPAN;',
'					else ',
'						if floor( months_between(to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), NVL(to_date(:P140_IncomeTaxReturnTillDate, ''DD-MM-RRRR''), ''31-03-2000'')) / 12 ) >= :P140_YearsWithoutReturn then',
'							:P140_TDSPercent := vFooter.FooterPercentWithoutReturn;	',
'						else ',
'							:P140_TDSPercent := vFooter.FooterPercentWithPAN;',
'						end if;										',
'					end if;',
'				end if;',
'				----',
'				if vFooter.FooterHeadCode = ''.CESSONTDS.'' then',
'					if :P140_PANNo is null then ',
'						:P140_TDSCessPercent := vFooter.FooterPercentWithoutPAN;',
'					else ',
'						if floor( months_between(to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), NVL(to_date(:P140_IncomeTaxReturnTillDate, ''DD-MM-RRRR''), ''31-03-2000'')) / 12 ) >= :P140_YearsWithoutReturn then',
'							:P140_TDSCessPercent := vFooter.FooterPercentWithoutReturn;	',
'						else ',
'							:P140_TDSCessPercent := vFooter.FooterPercentWithPAN;',
'						end if;										',
'					end if;',
'				end if;',
'				----',
'				if vFooter.FooterHeadCode = ''.SURCHARGEONTDS.'' then',
'					if :P140_PANNo is null then ',
'						:P140_TDSSurchargePercent := vFooter.FooterPercentWithoutPAN;',
'					else ',
'						if floor( months_between(to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), NVL(to_date(:P140_IncomeTaxReturnTillDate, ''DD-MM-RRRR''), ''31-03-2000'')) / 12 ) >= :P140_YearsWithoutReturn then',
'							:P140_TDSSurchargePercent := vFooter.FooterPercentWithoutReturn;	',
'						else ',
'							:P140_TDSSurchargePercent := vFooter.FooterPercentWithPAN;',
'						end if;										',
'					end if;',
'				end if;',
'',
'                ',
'			end loop;			',
'		end;',
'		:P140_TDSAmount := round(nvl(:P140_TDSDeductableAmount, 0) * nvl(:P140_TDSPercent, 0) / 100, 2);',
'		:P140_TDSCessAmount := round(nvl(:P140_TDSDeductableAmount, 0) * nvl(:P140_TDSCessPercent, 0) / 100, 2);',
'		:P140_TDSSurchargeAmount := round(nvl(:P140_TDSDeductableAmount, 0) * nvl(:P140_TDSSurchargePercent, 0) / 100, 2);',
'		:P140_TotalTDSAmount := nvl(:P140_TDSAmount, 0) + nvl(:P140_TDSCessAmount, 0) + nvl(:P140_TDSSurchargeAmount, 0);',
'		----',
'        :P140_BEFOREROUNDEDAMOUNTCR := ROUND(:P140_AmountDR - nvl(:P140_TotalTDSAmount,0), 2);',
'        ----',
'        --CalculateRounding;',
'        if :P140_RoundingMethodCode = ''AUTO'' then ',
'        	:P140_RoundingAmount := -1 * ( :P140_BEFOREROUNDEDAMOUNTCR -  round(:P140_BEFOREROUNDEDAMOUNTCR, 0));',
'        end if;',
'        :P140_AmountCr := nvl(:P140_BEFOREROUNDEDAMOUNTCR, 0) + nvl(:P140_RoundingAmount, 0);',
'  	end if;',
'   ',
'      UPDATE PAYMENTADVICEREFERENCE',
'         SET TDSAMOUNT = :P140_TDSAmount ,',
'             TDSDEDUCTABLEAMOUNT = :P140_TDSDeductableAmount',
'        WHERE TNO = :p140_tno ',
'          and sno = :sno',
'          ;',
'',
'      select sum(tdsamount) into :P140_TDSAmount from PAYMENTADVICEREFERENCE',
'       WHERE TNO = :p140_tno ;',
'	',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_only_for_changed_rows=>'N'
,p_internal_uid=>162375067279090514
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(298912325747175670)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check payment mode'
,p_static_id=>'check-payment-mode'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P140_MONEYTRANSFERMODECODE = ''CH'' then',
'    if :P140_MONEYTRANSFERREFERENCENO is null then  ',
'        raise_application_error(-20000 , ''Check No. is required.'');',
'    end if;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>81411640933956936
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600484232990400662)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Records'
,p_static_id=>'delete-records'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete From PaymentAdviceReference a Where a.Tno = :P140_Tno;',
'--Delete From PaymentAdvice a Where a.Tno = :P140_Tno;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(600368223435264823)
,p_internal_uid=>160097887739474138
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600878643438774477)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Payment Advice No'
,p_static_id=>'get-payment-advice-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P140_Tno is null then',
'        Select GlobalTno.NextVal into :P140_Tno From Dual;',
'     end if;',
'    ----',
'    if :P140_PAYMENTADVICENO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P140_LocationCode,',
'					:P140_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P140_PAYMENTADVICEDATE, ''DD-MM-RRRR'')',
'				);',
'        :P140_PAYMENTADVICENO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P140_LocationCode,',
'                    :P140_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P140_PAYMENTADVICEDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160492298187847953
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600402513798280048)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P140_TNO is null then',
'    :P140_TNO := GlobalTNo.nextval;',
'    :P140_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P140_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'',
':P140_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P140_TNO), ''Status'');',
'',
'declare',
'    tBalanceAmount number := GetLAccountClosingAsOn(:P140_PartyCode, :global_CompanyCode, to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), ''NO'', NULL );',
'begin',
'    if nvl(tBalanceAmount, 0) < 0 then',
'        :P140_PARTYBALANCE := to_char(abs(tBalanceAmount), ''99,99,99,99,99,990.99'') || ''   Dr'';',
'    elsif nvl(tBalanceAmount, 0) > 0 then',
'        :P140_PARTYBALANCE := to_char(tBalanceAmount, ''99,99,99,99,99,990.99'') || ''   Cr'';',
'    else',
'        :P140_PARTYBALANCE := 0;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>160016168547353524
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(454432231534978922)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get Voucher No'
,p_static_id=>'get-voucher-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for vloop in ',
'    (',
'        select tno,voucherno from voucher where moduletno = :P140_TNO',
'    ) loop',
'        :P140_VOUCHERTNO := VLOOP.TNO;',
'        :P140_VOUCHERNO := VLOOP.VOUCHERNO;',
'    end loop;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15447362335280938
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600402841097281007)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetOnTheTable'
,p_static_id=>'getonthetable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P140_MODULEFLOW := ''YES'';',
'   else',
'       :P140_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P140_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P140_ONTHETABLE := ''YES'' ;',
'   else',
'       :P140_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>160016495846354483
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600330423399106033)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(600269788697105940)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Payment Advice Master'
,p_static_id=>'initialize-form-payment-advice-master'
,p_internal_uid=>159944078148179509
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(454431975630978920)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT PAYMENTADVICE DETAIL'
,p_static_id=>'insert-paymentadvice-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- iNSERTINTOPAYMENTADVICEDETAIL',
'                DELETE FROM PAYMENTADVICEDETAIL WHERE TNO = :P140_TNO;',
'                INSERT INTO PAYMENTADVICEDETAIL (TNO,SNO,SERIALNO,FOOTERHEADCODE,FOOTERPERCENT,FOOTERVALUE)',
'                ',
'                (select tno , globaltno.nextval ,1, tds , tdspercent ,  tdsamount from (',
'                    SELECT TNO,''.TDS.'' as TDS,:P140_TDSPERCENT as tdspercent,',
'                    SUM(TDSAMOUNT) as tdsamount',
'                FROM PAYMENTADVICEREFERENCE',
'                WHERE TNO = :P140_TNO',
'                   GROUP BY TNO ',
'                )',
'                );--',
'                --VALUES ( :P140_TNO,,1,''.TDS.'',:P140_TDSPercent,:P140_TotalTDSAmount);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15447106431280936
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761493106017039)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Narration'
,p_static_id=>'narration'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	tVehicleNo Varchar2(30);',
'	tChequeNo Varchar2(100);',
'	tModuleNo varchar2(4000);',
'	cnt number := 0;',
'	tAmount varchar2(100);',
'	tNarration varchar2(3500);',
'    tReferenceModuleName varchar2(100);',
'    tMoneyTransferModeName varchar2(100);',
'begin',
'  	if :P140_DocTypeCode != ''EMI'' and :P140_MoneyTransferModeCode is not null and :P140_MoneyTransferModeCode != ''CASH'' then',
'		for vMode in',
'            (',
'            Select',
'                a.MoneyTransferModeName',
'            From MoneyTransferMode a',
'            Where a.MoneyTransferModeCode = :P140_MONEYTRANSFERMODECODE',
'            )',
'        loop',
'            tMoneyTransferModeName := vMode.MoneyTransferModeName;',
'            exit;',
'        end loop;',
'        ---',
'        for vModule in',
'            (',
'            Select',
'				b.ModuleName as ReferenceModuleName',
'			From PaymentAdviceReference a, Module b',
'			Where a.ReferenceModuleCode = b.ModuleCode(+)',
'				and a.Tno = :P140_TNO',
'			Order by a.Sno',
'            )',
'        loop',
'            tReferenceModuleName := vModule.ReferenceModuleName;',
'            exit;',
'        end loop;',
'        ----',
'        for vRef in',
'			(',
'			Select',
'				a.ReferenceModuleTno,',
'				b.ModuleName as ReferenceModuleName,',
'				GetTableColumnValue(b.MasterTableName, b.PaymentAdviceColumnName, ''  TNO = '' || TO_CHAR(NVL(a.ReferenceModuleTNo, 0))) as ReferenceModuleNo,',
'				a.Amount',
'			From PaymentAdviceReference a, Module b',
'			Where a.ReferenceModuleCode = b.ModuleCode(+)',
'				and a.Tno = :P140_TNO',
'			Order by a.Sno',
'			)',
'		loop',
'			cnt := cnt + 1;',
'			if cnt = 1 then',
'				tModuleNo := vRef.ReferenceModuleNo || '' Amt : '' || to_char(vRef.Amount, 9999999990.99);',
'			else',
'				tModuleNo := tModuleNo || '', '' || vRef.ReferenceModuleNo || '' Amt : '' || to_char(vRef.Amount, 9999999990.99);',
'			end if;',
'		end loop;',
'		----',
'		tNarration ',
'				:= ''Being amount paid against '' || initcap(GetPartyName(:P140_PartyCode)) || '' '' || initcap(tReferenceModuleName)',
'				|| '' No. : '' || tModuleNo || '',''',
'				|| '' vide '' || to_char(tMoneyTransferModeName) || '',''',
'				|| '' No. : '' || :P140_MoneyTransferReferenceNo || '',''',
'				|| '' Dated : '' || to_char(to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), ''DD-MM-RRRR'') ',
'		;		',
'	elsif  :P140_DocTypeCode = ''EMI''  and :P140_MoneyTransferModeCode != ''CASH'' then',
'		tNarration',
'				:= ''Being amount paid against EMI, No. : '' || :P140_LoanNo || '',''',
'				|| '' Amount : '' || to_char(:P140_AmountDR, 9999999990.99) || '',''',
'				|| '' vide '' || initcap(tMoneyTransferModeName) || '',''',
'				|| '' No. : '' || :P140_MoneyTransferReferenceNo || '',''',
'				|| '' Dated : '' || to_char(to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR''), ''DD-MM-RRRR'')',
'		;',
'  	end if;',
'    if :P140_NARRATION is null and cnt > 0 then',
'        :P140_NARRATION := tNarration;',
'    end if;',
'end;',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>162375147855090515
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600485012411400670)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(599962908003921065)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Payment Advice Reference - Save Interactive Grid Data'
,p_static_id=>'payment-advice-reference-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160098667160474146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600330756827106037)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(600269788697105940)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Payment Advice Master'
,p_static_id=>'process-form-payment-advice-master'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>159944411576179513
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600876192422747034)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P140_TNO, :P140_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(600368962691264824)
,p_internal_uid=>160489847171820510
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761298004017037)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetTDSandThreshold'
,p_static_id=>'settdsandthreshold'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	tExpenseAmount Number;',
'	tThisExpenseAmount Number;',
'	tTDSAmount Number;',
'	tTotalExpenseAmount Number;',
'	tSumOfAmountEntered number;',
'begin',
'	for vRef in',
'		(',
'		Select',
'			a.AmountEntered',
'		From PaymentAdviceReference a',
'		Where a.Tno = :P140_Tno',
'		)',
'	loop',
'		tSumOfAmountEntered := vRef.AmountEntered;',
'		exit;',
'	end loop;',
'	----',
'    for vParty in',
'    	(',
'    	select ',
'    		a.TDSPayeeCategoryCode,',
'            b.TDSPayeeCategoryName,',
'    		a.IncomeTaxReturnTillDate,',
'    		a.EligibleForTDSUnder194Q',
'    	from Party a, TDSPayeeCategory b',
'    	where a.TDSPayeeCategoryCode = b.TDSPayeeCategoryCode(+)',
'            and a.PartyCode = :P140_PartyCode ',
'    	)',
'    loop ',
'    	:P140_TDSPayeeCategoryCode 		:= vParty.TDSPayeeCategoryCode;',
'        :P140_TDSPayeeCategoryName 		:= vParty.TDSPayeeCategoryName;',
'    	:P140_IncomeTaxReturnTillDate 	:= vParty.IncomeTaxReturnTillDate;',
'    	:P140_EligibleForTDSUnder194Q	:= vParty.EligibleForTDSUnder194Q;',
'    end loop;',
'	----',
'	:P140_TDSTaxCategoryCode := GetTDSTaxCategoryCode(:P140_TDSPayeeCategoryCode, :P140_TDSNatureCode, :P140_PaymentAdviceDate);',
'	:P140_PANNo := GetPartyAttributeValue(:P140_PartyCode, ''PANNO'');',
'	----',
'	for vTDSTaxCategory in',
'		(',
'		select',
'			b.TotalTDSPercentWithPAN,',
'			b.TotalTDSPercentWithoutPAN,',
'			b.Threshold,',
'			b.TransactionThreshold,',
'			b.DeductionStartAboveAmount,',
'			a.YearsWithoutReturn,',
'            b.TDSPayeeCategoryCode,',
'            b.TDSPercentWithPAN,',
'            b.TDSPercentWithoutPAN,',
'            b.CessPercentWithPAN,',
'            b.CessPercentWithoutPAN,     ',
'            b.SurchargePercentWithPAN,',
'            b.SurchargePercentWithoutPAN',
'		from TDSTaxCategory a, TDSTaxCategoryDetail b',
'		where a.TNo = b.TNo ',
'			and a.TDSTaxCategoryCode = :P140_TDSTaxCategoryCode',
'			and b.TDSPayeeCategoryCode = :P140_TDSPayeeCategoryCode',
'		)',
'	loop',
'		:P140_TDSThreshold := vTDSTaxCategory.Threshold;',
'		:P140_DeductionStartAboveAmount := vTDSTaxCategory.DeductionStartAboveAmount;',
'		:P140_YearsWithoutReturn := vTDSTaxCategory.YearsWithoutReturn;',
'		----',
'		if nvl(vTDSTaxCategory.TransactionThreshold, 0) <= 0 then ',
'			:P140_TDSTransactionThreshold := :P140_TDSThreshold;',
'		else ',
'			:P140_TDSTransactionThreshold := vTDSTaxCategory.TransactionThreshold;',
'		end if;',
'		----',
'		if :P140_PANNo is null then ',
'            :P140_TDSPERCENT := vTDSTaxCategory.TDSPercentWithoutPAN;',
'            :P140_TDSCESSPERCENT := vTDSTaxCategory.CessPercentWithoutPAN;',
'            :P140_TDSSURCHARGEPERCENT := vTDSTaxCategory.SurchargePercentWithoutPAN;',
'			:P140_TotalTDSPercent := vTDSTaxCategory.TotalTDSPercentWithoutPAN;',
'		else ',
'            :P140_TDSPERCENT := vTDSTaxCategory.TDSPercentWithPAN;',
'            :P140_TDSCESSPERCENT := vTDSTaxCategory.CessPercentWithPAN;',
'            :P140_TDSSURCHARGEPERCENT := vTDSTaxCategory.SurchargePercentWithPAN;',
'			:P140_TotalTDSPercent := vTDSTaxCategory.TotalTDSPercentWithPAN;',
'		end if;',
'		exit;',
'	end loop;',
'	----',
'	if nvl(:P140_TDSThreshold, 0) > 0 then ',
'		select ',
'			sum(b.ExpenseAmount),',
'			sum(b.TDSAmount)',
'			into tExpenseAmount, tTDSAmount',
'		from Voucher a, VoucherTDSDeducted b ',
'		where a.TNo = b.TNo ',
'			and b.PartyCode = :P140_PartyCode',
'			and a.FinancialYearCode = :P140_FinancialYearCode',
'			and b.TDSNatureCode = :P140_TDSNatureCode',
'		;',
'		----',
'		if nvl(tTDSAmount, 0) > 0 then ',
'			:P140_ThresholdPlusMinus := 0;',
'		else',
'			select ',
'				sum(-1 * b.ThresholdPlusMinus)',
'				into tExpenseAmount',
'			from Voucher a, VoucherTDSDeducted b ',
'			where a.TNo = b.TNo ',
'				and b.PartyCode = :P140_PartyCode',
'				and a.FinancialYearCode = :P140_FinancialYearCode',
'				and b.ThresholdPlusMinus < 0',
'				and b.AdvanceOrBill = ''ADVANCE''',
'				and b.TDSNatureCode = :P140_TDSNatureCode',
'				and a.VoucherNo != ''OPENING''',
'			;',
'			----',
'			if nvl(tSumOfAmountEntered, 0) > 0 then ',
'				if :P140_TDSOnOverAndAbove = ''YES'' then',
'					tThisExpenseAmount := round(( ( tSumOfAmountEntered + NVL(tExpenseAmount, 0) )* 100 ) / (100 - NVL(:P140_TOTALTDSPERCENT, 0) ), 0);',
'				else ',
'					tThisExpenseAmount :=  nvl(tSumOfAmountEntered, 0);',
'				end if;',
'			else',
'				if :P140_TDSOnOverAndAbove = ''YES'' then',
'					tThisExpenseAmount := round(( ( :P140_AmountDrEntered + NVL(tExpenseAmount, 0) ) * 100 ) 	/ (100 - NVL(:P140_TOTALTDSPERCENT, 0) ), 0);		',
'				else ',
'					tThisExpenseAmount := nvl(:P140_AmountDrEntered, 0);',
'				end if;',
'			end if;	 --	if nvl(tSumOfAmountEntered, 0) > 0 then 	',
'			----',
'			tTotalExpenseAmount := nvl(tExpenseAmount, 0) + nvl(tThisExpenseAmount, 0);',
'			----',
'			if nvl(tTotalExpenseAmount, 0) > nvl(:P140_TDSThreshold, 0) or tThisExpenseAmount > nvl(:P140_TDSTransactionThreshold, 0) then ',
'				:P140_ThresholdPlusMinus := tExpenseAmount;',
'			else ',
'				:P140_ThresholdPlusMinus := -1 * tThisExpenseAmount;',
'			end if;',
'		end if;  -- if nv(tTDSAmount, 0) > 0 then',
'	end if; -- if nvl(:P140_TDSThreshold, 0) > 0 then ',
'	----',
'	select ',
'		sum(a.AmountDr) ',
'		into :P140_TotalPaymentAmountForTheFY',
'	from PaymentAdvice a, Voucher b ',
'	where a.TNo = b.ModuleTNo',
'		and a.PartyCode = :P140_PartyCode',
'		and b.FinancialYearCode = :P140_FinancialYearCode',
'	;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>162374952753090513
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761169052017036)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TDS Location Code'
,p_static_id=>'tds-location-code'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for vRef in',
'    (',
'    Select',
'        a.ReferenceModuleTno',
'    From PaymentAdviceReference a',
'    Where a.Tno = :P140_TNO',
'    Order by a.Sno',
'    )',
'loop',
'    for vLocation in',
'        (',
'        select ',
'            a.LocationCode',
'        from OrderNBillAmountLocationWise a',
'        where a.TNo = vRef.REFERENCEMODULETNO',
'        )',
'    loop ',
'        Update PaymentAdvice a',
'        Set a.TDSLocationCode = vLocation.LocationCode',
'        Where a.Tno = :P140_TNO',
'        ;',
'        exit;',
'    end loop;',
'    exit;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>162374823801090512
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761620182017040)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Payment Advice'
,p_static_id=>'update-payment-advice'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  tamount number;',
'begin',
'',
'Update PaymentAdvice a',
'Set',
'a.TDSPayeeCategoryCode = :P140_TDSPayeeCategoryCode,',
'a.TDSNatureCode = :P140_TDSNatureCode,',
'a.Priority = :P140_Priority,',
'a.TDSonOverAndAbove = :P140_TDSonOverAndAbove,',
'a.TDSThresHold = :P140_TDSThresHold,',
'a.TDSTransactionThresHold = :P140_TDSTransactionThresHold,',
'a.IncomeTaxReturnTillDate = :P140_IncomeTaxReturnTillDate,',
'a.EligibleForTDSUnder194Q = :P140_EligibleForTDSUnder194Q,',
'a.TDSTaxCategoryCode = :P140_TDSTaxCategoryCode,',
'a.PANNo = :P140_PANNo,',
'a.DeductionStartAboveAmount = :P140_DeductionStartAboveAmount,',
'a.YearsWithoutReturn = :P140_YearsWithoutReturn,',
'a.CostCentreCode = :P140_CostCentreCode,',
'a.TDSMasterCode = :P140_TDSMasterCode,',
'a.TDSDeductableAmount = :P140_TDSDeductableAmount,',
'a.TDSPercent = :P140_TDSPercent,',
'a.TDSCessPercent = :P140_TDSCessPercent,',
'a.TDSSurchargePercent = :P140_TDSSurchargePercent,',
'a.TDSAmount = :P140_TDSAmount,',
'a.TDSCessAmount = :P140_TDSCessAmount,',
'a.TDSSurchargeAmount = :P140_TDSSurchargeAmount,',
'a.TotalTDSPercent = :P140_TotalTDSPercent,',
'a.TotalTDSAmount = :P140_TotalTDSAmount,',
'a.WCTMasterCode = :P140_WCTMasterCode,',
'a.AmountDREntered = :P140_AmountDREntered,',
'a.AmountDR = :P140_AmountDR,',
'a.AmountCR = :P140_AmountCR,',
'a.Amount = :P140_AmountDR,',
'a.TDSAlreadyDeductedOn = :P140_TDSAlreadyDeductedOn,',
'a.TDSLocationCode = :P140_TDSLocationCode,',
'a.MoneyTransferModeCode = :P140_MoneyTransferModeCode,',
'a.AccountCode = :P140_AccountCode,',
'a.MoneyTransferReferenceNo = :P140_MoneyTransferReferenceNo,',
'a.chequePrintName = :P140_chequePrintName,',
'a.Narration = :P140_Narration,',
'a.PaymentForLocationCode = :P140_PaymentForLocationCode,',
'a.TotalPaymentAmountForTheFY = :P140_TotalPaymentAmountForTheFY,',
'a.ThresholdPlusMinus = :P140_ThresholdPlusMinus,',
'a.AdvanceOrBill = :P140_AdvanceOrBill,',
'a.LoanTno = :P140_LoanTno,',
'a.LoanSno = :P140_LoanSno,',
'a.TDSLowerRateApplicable = :P140_TDSLowerRateApplicable,',
'a.TDSLowerRate = :P140_TDSLowerRate,',
'a.CessLowerRate = :P140_CessLowerRate,',
'a.SurchargeLowerRate = :P140_SurchargeLowerRate,',
'a.RoundingMethodCode = :P140_RoundingMethodCode,',
'a.RoundingAmount = :P140_RoundingAmount',
'Where a.Tno = :P140_TNO',
';',
'',
'select sum(amountentered) into tamount',
'from paymentadvicereference',
'where tno = :P140_TNO;',
'--RAISE_APPLICATION_ERROR(-20001,'' TAMT ''||TAMOUNT||'' R OFF ''||:P140_ROUNDINGAMOUNT);',
'UPDATE PAYMENTADVICE',
'SET AMOUNT = TAMOUNT,',
'    AMOUNTDR = TAMOUNT,',
'    AMOUNTCR = TAMOUNT - NVL(:P140_TDSAmount,0) + NVL(:P140_ROUNDINGAMOUNT,0)',
'WHERE TNO = :P140_TNO;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>162375274931090516
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761111302017035)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(599962908003921065)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Detail Field'
,p_static_id=>'validate-detail-field'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :REFERENCEMODULETNO is not null and :AMOUNTENTERED is null then ',
'    raise_application_error(',
'        -20000,',
'        ''Please enter amount to be paid.''',
'    );',
'end if;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>162374766051090511
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602761006591017034)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validation'
,p_static_id=>'validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare   ',
'    tPAYMENTADVICEDate Date := to_date(:P140_PAYMENTADVICEDATE, ''DD-MM-RRRR'');',
'    tCountDetail number;',
'    tPAYMENTADVICENo varchar2(100);',
'begin ',
'    if :P140_COMPANYCODE is NULL then',
'        :P140_COMPANYCODE := :GLOBAL_COMPANYCODE;',
'        APEX_UTIL.SET_SESSION_STATE(''P105_COMPANYCODE'',''GLOBAL_COMPANYCODE'');',
'    end if;',
'    --',
'    if :P140_FINANCIALYEARCODE is NULL then ',
'        :P140_FINANCIALYEARCODE := :GLOBAL_FINANCIALYEARCODE;',
'        APEX_UTIL.SET_SESSION_STATE(''P105_FINANCIALYEARCODE'',''GLOBAL_FINANCIALYEARCODE'');',
'    end if;',
'    --',
'    if :P140_CREATOR is null then ',
'         :P140_CREATOR := v(''APP_USER'');',
'        APEX_UTIL.SET_SESSION_STATE(''P105_CREATOR'',''APP_USER'');',
'    end if;',
'    --',
'    if :P140_LOCATIONCODE is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter Location.''',
'        );',
'    end if;',
'    --',
'    if :P140_DOCTYPECODE is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter DocType.''',
'        );',
'    end if;',
'    ----',
'    if :P140_PAYMENTADVICEDate is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter Entry Date.''',
'        );',
'    end if;',
'    ----',
'    if :P140_PartyCode is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter Party.''',
'        );',
'    end if;',
'    ----',
'    if :P140_PAYMENTADVICENo is null then ',
'        --',
'        setDocNoNext(',
'        	:P140_ModuleCode,',
'        	:global_CompanyCode,',
'        	:global_FinancialYearCode,',
'        	:P140_LocationCode,',
'        	:P140_DocTypeCode,',
'        	null ,',
'        	tPAYMENTADVICEDate',
'            --sysdate',
'        );	  							',
'        --',
'        :P140_PAYMENTADVICENo := getDocNo(	  									',
'        	:P140_ModuleCode,',
'        	:global_CompanyCode,',
'        	:global_FinancialYearCode,',
'        	:P140_LocationCode,',
'        	:P140_DocTypeCode,',
'        	null ,',
'        	tPAYMENTADVICEDate',
'            --sysdate',
'        );',
'        --',
'    end if;',
'    --',
'    if :P140_PAYMENTADVICENo is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter Payment Advice No''',
'        );',
'    end if;',
'    ----',
'end;',
'declare',
'	tDate varchar2(30);',
'	tEntryDate varchar2(30) := to_char(:P140_PAYMENTADVICEDATE);',
'begin',
'	for vCheckDate in',
'		(',
'		Select',
'			to_char(a.PAYMENTADVICEDate, ''DD-MM-RRRR'') as PAYMENTADVICEDate',
'		From PAYMENTADVICE a',
'		Where a.Tno = :P140_TNO',
'		)',
'	loop',
'		tDate := vCheckDate.PAYMENTADVICEDate;',
'		exit;',
'	end loop;',
'	----',
'	if :P140_FORMSTATUS = ''NEWRECORD'' or (:P140_FORMSTATUS = ''EDITRECORD'' and tDate != tEntryDate) then',
'		declare',
'			cursor cModule is',
'				 select',
'					trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'					trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward,	',
'					a.FreezeDate',
'				from Module a, ModulePrivilege b, BossUser c',
'				where a.ModuleCode = ''PAYMENTADVICE''',
'					and a.ModuleCode = b.ModuleCode',
'					and b.BossUsercode = c.BossUserCode',
'					and c.LoginName = :GLOBAL_LOGINNAME',
'					and b.CompanyCode = :GLOBAL_COMPANYCODE',
'			;',
'			vModule cModule%ROWTYPE;',
'			tMessage varchar2(1000);',
'		begin	',
'			open cModule;',
'			fetch cModule into vModule;',
'			if cModule%FOUND then',
'				if to_date(substr(:P140_PAYMENTADVICEDATE,1,11), ''DD-MM-RRRR'') < vModule.AllowedBack then',
'					tMessage := ''Date must NOT be less than '' || to_char(vModule.AllowedBack, ''DD-MM-RRRR'' );',
'				elsif to_date(substr(:P140_PAYMENTADVICEDATE,1,11), ''DD-MM-RRRR'') > vModule.AllowedForward then',
'					tMessage := ''Date must NOT be greater than '' || to_char(vModule.AllowedForward, ''DD-MM-RRRR'' );					',
'				elsif vModule.FreezeDate is not null and to_date(substr(:P140_PAYMENTADVICEDATE,1,11), ''DD-MM-RRRR'') <= vModule.FreezeDate then',
'					tMessage := ''Date must NOT be less than freeze date '' || to_char(vModule.FreezeDate, ''DD-MM-RRRR'' );				',
'				end if;				',
'			end if;',
'			close cModule;',
'			if tmessage is not null then',
'				raise_application_error(-20001, tMessage);',
'			end if;',
'			----',
'			if not to_date(substr(:P140_PAYMENTADVICEDATE,1,11), ''DD-MM-RRRR'')  between :GLOBAL_FINANCIALYEARBEGIN and :GLOBAL_FINANCIALYEAREND then',
'				raise_application_error(-20001, ''Please enter entry date between financial year.'');	',
'			end if;',
'		end;',
'	end if;',
'end;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>162374661340090510
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
