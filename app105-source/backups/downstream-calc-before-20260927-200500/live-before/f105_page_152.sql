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
--     PAGE: 152
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00152
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>152);
end;
/
prompt --application/pages/page_00152
begin
wwv_flow_imp_page.create_page(
 p_id=>152
,p_name=>'Purchase Bill Pass'
,p_alias=>'PURCHASE-BILL-PASS'
,p_step_title=>'Purchase Bill Pass'
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
'  var bireporturl = $(''#P152_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/PurchaseBillPass1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P152_TNO'').val() ',
'      ;',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P152_BIREPORTURL'').val()',
'  var reportName =  ''PurchaseBillPass1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P152_TNO'').val() ',
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
'function GotoP323() {    ',
'var x = apex.item(''P152_TNO'').getValue();',
'var x1 = apex.item(''P152_SNO'').getValue();',
'var y = apex.item(''P152_DFAMOUNT'').getValue();',
'var y1 = apex.item(''P152_DFTOTALAMOUNT'').getValue();',
'var z1 = apex.item(''P152_FVALUE'').getValue();',
'',
'var url = "f?p=#APP_ID#:323:#SESSION#::NO:RP,323:P323_TNO,P323_SNO,P323_DFAMOUNT,P323_DFTOTALAMOUNT,P323_FVALUE:#P323_TNO#,#P323_SNO#,#P323_DFAMOUNT#,#P323_DFTOTALAMOUNT#,#P323_FVALUE#";',
'',
'url = url.replace("#APP_ID#", $v("pFlowId"));',
'url = url.replace("#SESSION#", $v("pInstance"));',
'url = url.replace("#P323_TNO#", x);',
'url = url.replace("#P323_SNO#", x1);',
'url = url.replace("#P323_DFAMOUNT#", y);',
'url = url.replace("#P323_DFTOTALAMOUNT#", y1);',
'url = url.replace("#P323_FVALUE#", z1);',
'',
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
'});',
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
'',
'/* P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V1 */',
'(function () {',
'  function bindDetailGrid() {',
'    var grid = document.getElementById(''Detail_ig'');',
'    if (!grid) { return; }',
'    var body = grid.querySelector(''.a-GV-bdy'');',
'    var header = grid.querySelector(''.a-GV-w-hdr'');',
'    if (!body || !header || body.dataset.pbPassHorizontalSync === ''Y'') { return; }',
'    body.dataset.pbPassHorizontalSync = ''Y'';',
'    header.scrollLeft = body.scrollLeft;',
'    body.addEventListener(''scroll'', function () { header.scrollLeft = body.scrollLeft; }, { passive: true });',
'  }',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', bindDetailGrid, { once: true });',
'  } else {',
'    window.setTimeout(bindDetailGrid, 0);',
'  }',
'  $(document).on(''apexafterrefresh.pbPassHorizontalSync'', ''#Detail_ig'', bindDetailGrid);',
'}());',
'',
'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',
'(function(){',
'  "use strict";',
'  if(Number(apex.env.APP_PAGE_ID||0)!==152||window.hsplCrossformDetailIntegrityV1)return;',
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
'  window.hsplP152OpenFd=function(anchor){',
'    try{',
'      var model=apex.region("Detail").widget().interactiveGrid("getViews","grid").model;',
'      var row=anchor&&anchor.closest&&anchor.closest("tr"),id=row&&row.getAttribute("data-id"),record=id&&model.getRecord(id);',
'      if(!record)throw new Error("Clicked detail row could not be identified.");',
'      function raw(v){return v&&typeof v==="object"&&"v" in v?v.v:v;}',
'      var sno=raw(model.getValue(record,"SNO")),amount=raw(model.getValue(record,"AMOUNT"));',
'      if(sno===null||sno===undefined||String(sno).trim()==="")throw new Error("Clicked row SNO is blank.");',
'      apex.item("P152_SNO").setValue(sno,null,true);',
'      apex.item("P152_DFAMOUNT").setValue(amount||0,null,true);',
'      GotoP323();',
'    }catch(error){',
'      apex.message.clearErrors();',
'      apex.message.showErrors([{type:"error",location:"page",message:error.message||"FD could not open for the clicked row.",unsafe:false}]);',
'    }',
'  };',
'',
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
'',
'',
'/* P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V1 */',
'html.page-152 #Detail_ig .a-GV-bdy {',
'  overflow-x: scroll !important;',
'  overflow-y: hidden !important;',
'  scrollbar-gutter: stable !important;',
'}',
'',
'html.page-152 #Detail_ig .a-GV-w-scroll {',
'  overflow-x: scroll !important;',
'  overflow-y: hidden !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(605320519521850241)
,p_plug_name=>'Account Posting Detail'
,p_static_id=>'account-posting-detail'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1501751158967552484)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_region_name=>'Attach'
,p_parent_plug_id=>wwv_flow_imp.id(601383181233650837)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
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
'       A.MODULESNO',
'  from MODULEATTACHMENT A',
'  WHERE A.MODULETNO = :P152_TNO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P152_TNO'
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
 p_id=>wwv_flow_imp.id(1501751903542552492)
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
,p_detail_link=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO,P1063_ATTRIBUTECODE,P1063_PARENT_FORMSTATUS:#MODULETNO#,#ATTRIBUTECODE#,&P152_FORMSTATUS.#SNO#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>1061365558291625968
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1501752473028552497)
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
 p_id=>wwv_flow_imp.id(1221367884747422805)
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
 p_id=>wwv_flow_imp.id(1348966759270367180)
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
 p_id=>wwv_flow_imp.id(1501752544268552498)
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
 p_id=>wwv_flow_imp.id(1069498674017737297)
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
 p_id=>wwv_flow_imp.id(1068104398683606246)
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
 p_id=>wwv_flow_imp.id(1501752062845552493)
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
 p_id=>wwv_flow_imp.id(1504397492940527946)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1057267710045261674)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1424662409187343593)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604542367957679972)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(601383467526650840)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(601383181233650837)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       PURCHASEORDERTNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       PURCHASEBILLQUANTITY1,',
'       PURCHASEBILLQUANTITY2,',
'       RECEIVEDQUANTITY1,',
'       RECEIVEDQUANTITY2,',
'       QUANTITY1,',
'       QUANTITY2,',
'       RATE,',
'       RATEMEASURINGUNITCODE,',
'       AMOUNT,',
'       QUALITYDEDUCTION,',
'       QUALITYBONUS,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       REMARK,',
'       QUALITYDEDUCTIONAUTO,',
'       QUALITYBONUSAUTO,',
'       QUALITYDEDUCTIONMANUAL,',
'       QUALITYBONUSMANUAL,',
'       OTHERDEDUCTION,',
'       ROUNDING,',
'       FOOTERAMOUNTWITHRATE,',
'       JOBORDERTNO,',
'       ENTRYTAXPERCENT,',
'       ENTRYTAXAMOUNT,',
'       FOOTERCOSTAMOUNT,',
'       ENTRYTAXFOOTERNATURECODE,',
'       ENTRYTAXAMOUNTFORFREIGHT,',
'       EXTRAFOOTERFORENTRYTAX,',
'       TAXRULECODE,',
'       QUALITYCODE,',
'       PRORATA,',
'       ''GRN'' as GRN,',
'       ''FD'' as FD',
'  from PBPASSDETAIL',
'  where tno = :P152_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P152_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detail'
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
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(605319284994850229)
,p_heading=>'Item Specification'
,p_static_id=>'item-specification'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(605319424731850230)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(605319451091850231)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601385202770650857)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602261578596037830)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602261690635037831)
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
 p_id=>wwv_flow_imp.id(601384297574650848)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(605319284994850229)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601386648105650872)
,p_name=>'ENTRYTAXAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENTRYTAXAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Entry Tax Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>340
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602261140032037825)
,p_name=>'ENTRYTAXAMOUNTFORFREIGHT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENTRYTAXAMOUNTFORFREIGHT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Entry Tax Amount For Freight'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>370
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601386882609650874)
,p_name=>'ENTRYTAXFOOTERNATURECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENTRYTAXFOOTERNATURECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entry Tax Footer Nature Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601386618092650871)
,p_name=>'ENTRYTAXPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENTRYTAXPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Entry Tax Percent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>330
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602261215986037826)
,p_name=>'EXTRAFOOTERFORENTRYTAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXTRAFOOTERFORENTRYTAX'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Extra Footer For Entry Tax'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>380
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602349181587277328)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Fd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:323:&SESSION.::&DEBUG.:Y,:P323_TNO,P323_SNO,P323_DFAMOUNT,P323_DFTOTALAMOUNT,P323_FVALUE:&TNO.,&SNO.,&AMOUNT.,&P152_DFTOTALAMOUNT.,&P152_FVALUE.'
,p_link_text=>'&FD.'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<a href="javascript:hsplP152OpenFd(this)"><class="t-Button t-Button--simple t-Button--hot t-Button--stretch"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601385533817650860)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601386398683650869)
,p_name=>'FOOTERAMOUNTWITHRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNTWITHRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount With Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>310
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601386776880650873)
,p_name=>'FOOTERCOSTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERCOSTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Cost Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>350
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602349055621277327)
,p_name=>'GRN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Grn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''PBPassDetailGrn'')'
,p_link_text=>'&GRN.'
,p_link_attributes=>' class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <a href="javascript:openModal(''PBPassDetailGrn'')">',
' <span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">GRN</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601384132131650846)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(605319284994850229)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select itemname , itemcode from item'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'ITEMCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601384187938650847)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(605319284994850229)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE',
'from itemspecification',
'where tno in (select tno from item where itemcode = :ITEMCODE )'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601386486662650870)
,p_name=>'JOBORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Job Order No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>320
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601386146917650867)
,p_name=>'OTHERDEDUCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OTHERDEDUCTION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Other Deduction'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>290
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(602261533874037829)
,p_name=>'PRORATA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRORATA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Prorata'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>410
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601384391150650849)
,p_name=>'PURCHASEBILLQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEBILLQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Purchase Bill Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
 p_id=>wwv_flow_imp.id(601384514002650850)
,p_name=>'PURCHASEBILLQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEBILLQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Purchase Bill Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
 p_id=>wwv_flow_imp.id(601383957384650845)
,p_name=>'PURCHASEORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Purchase Order No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select purchaseorderno , tno from purchaseorder'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601385431284650859)
,p_name=>'QUALITYBONUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYBONUS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quality Bonus'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601385875879650864)
,p_name=>'QUALITYBONUSAUTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYBONUSAUTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quality Bonus Auto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>260
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601386109009650866)
,p_name=>'QUALITYBONUSMANUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYBONUSMANUAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quality Bonus Manual'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>280
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602261378630037828)
,p_name=>'QUALITYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Quality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select qualityname , qualitycode from quality'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601385277578650858)
,p_name=>'QUALITYDEDUCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYDEDUCTION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quality Deduction'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(601385843256650863)
,p_name=>'QUALITYDEDUCTIONAUTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYDEDUCTIONAUTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quality Deduction Auto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>250
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601386009312650865)
,p_name=>'QUALITYDEDUCTIONMANUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYDEDUCTIONMANUAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quality Deduction Manual'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601384842853650853)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(605319424731850230)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601384908694650854)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(605319451091850231)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601384976124650855)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(601385080441650856)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measuringunitname , measuringunitcode',
'from measuringunit',
'where measuringunitcode in (select measuringunitcode1 from item where itemcode = :ITEMCODE)',
'union all',
'select measuringunitname , measuringunitcode',
'from measuringunit',
'where measuringunitcode in (select measuringunitcode2 from item where itemcode = :ITEMCODE)'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601384615079650851)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
 p_id=>wwv_flow_imp.id(601384701845650852)
,p_name=>'RECEIVEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
 p_id=>wwv_flow_imp.id(601385698506650862)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601386252984650868)
,p_name=>'ROUNDING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROUNDING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rounding'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>300
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601383709727650842)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601383943925650844)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602261310058037827)
,p_name=>'TAXRULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXRULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tax Rule'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601383834579650843)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(601385549912650861)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(601383579031650841)
,p_internal_uid=>160997233780724317
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
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
 p_id=>wwv_flow_imp.id(602266989415042974)
,p_interactive_grid_id=>wwv_flow_imp.id(601383579031650841)
,p_static_id=>'1618807'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(602267181218042974)
,p_report_id=>wwv_flow_imp.id(602266989415042974)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602267722431042976)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(601383709727650842)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602268589234042979)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(601383834579650843)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602269519298042982)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(601383943925650844)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602270370420042984)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(601383957384650845)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>212
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602271292242042987)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(601384132131650846)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602272209680042989)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(601384187938650847)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>384
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602273133178042991)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(601384297574650848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602273989832042993)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(601384391150650849)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602274856604042995)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(601384514002650850)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602275813933042997)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(601384615079650851)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602276656211042999)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(601384701845650852)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602277609457043001)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(601384842853650853)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602278532509043003)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(601384908694650854)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602279374632043005)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(601384976124650855)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602280268168043007)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(601385080441650856)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602281183197043010)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(601385202770650857)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602282117974043012)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(601385277578650858)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602282957872043014)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(601385431284650859)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602283944237043016)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(601385533817650860)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602284745262043018)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(601385549912650861)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602285719984043020)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(601385698506650862)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602286606678043022)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(601385843256650863)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602287471510043024)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(601385875879650864)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602288355782043026)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(601386009312650865)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602289331471043028)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(601386109009650866)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602290233623043030)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(601386146917650867)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>152
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602291089216043032)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(601386252984650868)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602291959686043034)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(601386398683650869)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602292852690043036)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(601386486662650870)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602293795268043038)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(601386618092650871)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602294699039043040)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(601386648105650872)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602295597313043042)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(601386776880650873)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602296499134043045)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(601386882609650874)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602297401824043049)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(602261140032037825)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602298308443043051)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(602261215986037826)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602299152077043053)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(602261310058037827)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602300120343043055)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(602261378630037828)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602300998574043057)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(602261533874037829)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602301812433043059)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(602261578596037830)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602370290547282878)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(602349055621277327)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602371216735282880)
,p_view_id=>wwv_flow_imp.id(602267181218042974)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(602349181587277328)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602264427724037858)
,p_plug_name=>'DetailFooter'
,p_static_id=>'detailfooter'
,p_region_name=>'DetailFooter'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SERIALNO,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       TAXFORMCODE,',
'       INCLUDEDINRATE,',
'       LEGENDSCODE,',
'       FOOTERNATURECODE,',
'       FOOTERNATUREUSER,',
'       COSTAMOUNT,',
'       SN',
'  from PBPASSDETAILFOOTER',
'  where tno = :P152_TNO',
'  and sno = :P152_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(601383467526650840)
,p_ajax_items_to_submit=>'P152_TNO,P152_SNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'DetailFooter'
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
 p_id=>wwv_flow_imp.id(602265951010037874)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602348939101277325)
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
 p_id=>wwv_flow_imp.id(602265818775037872)
,p_name=>'COSTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Costamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602264946928037864)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Footer Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select FOOTERHEADNAME , FOOTERHEADcode from footerhead'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602265595796037870)
,p_name=>'FOOTERNATURECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERNATURECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footernaturecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'IG'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602265666396037871)
,p_name=>'FOOTERNATUREUSER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERNATUREUSER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footernatureuser'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602265133550037865)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Percent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602265208332037866)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
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
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602265419128037868)
,p_name=>'INCLUDEDINRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDEDINRATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Includedinrate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602265541289037869)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(608103493650164442)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602264601528037860)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602264934676037863)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602265859254037873)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sn'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602264785480037862)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(601383943925650844)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602265289924037867)
,p_name=>'TAXFORMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXFORMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Taxformcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602264728820037861)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'tno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_parent_column_id=>wwv_flow_imp.id(601383834579650843)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(602264506256037859)
,p_internal_uid=>161878161005111335
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'        ',
'    }',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(602354793142278909)
,p_interactive_grid_id=>wwv_flow_imp.id(602264506256037859)
,p_static_id=>'1619685'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(602354967484278909)
,p_report_id=>wwv_flow_imp.id(602354793142278909)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602355518423278911)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(602264601528037860)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602356414856278913)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(602264728820037861)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602357267961278916)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(602264785480037862)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602358146342278918)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(602264934676037863)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602359078578278920)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(602264946928037864)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602360034282278922)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(602265133550037865)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602360863585278924)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(602265208332037866)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602361745866278926)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(602265289924037867)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602362649125278928)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(602265419128037868)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602363603994278930)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(602265541289037869)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>210.066
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602364514353278932)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(602265595796037870)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602365416657278934)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(602265666396037871)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602366268301278936)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(602265818775037872)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602367217818278938)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(602265859254037873)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602368105568278940)
,p_view_id=>wwv_flow_imp.id(602354967484278909)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(602265951010037874)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604542234807679970)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604542504299679973)
,p_plug_name=>'Nature and Transaction'
,p_static_id=>'nature-and-transaction'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(601383181233650837)
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
 p_id=>wwv_flow_imp.id(605319041674850226)
,p_plug_name=>'Other Details'
,p_static_id=>'other-details'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_imp.id(454406770486940799)
,p_plug_name=>'PaidInAdvance'
,p_static_id=>'paidinadvance'
,p_region_name=>'PaidInAdvance'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       VOUCHERTNO,',
'       VOUCHERSNO,',
'       AMOUNT',
'  from PBPASSPAIDINADVANCE',
'  where tno = :P152_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P152_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PaidInAdvance'
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
 p_id=>wwv_flow_imp.id(454407500522940806)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454407644989940807)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(454407765139940808)
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
 p_id=>wwv_flow_imp.id(454407052939940801)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(454407213172940803)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454407091224940802)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454407428713940805)
,p_name=>'VOUCHERSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vouchersno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454407338642940804)
,p_name=>'VOUCHERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Voucher No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select voucherno , tno from voucher'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(454406877259940800)
,p_internal_uid=>15422008060242816
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(454823525630602085)
,p_interactive_grid_id=>wwv_flow_imp.id(454406877259940800)
,p_static_id=>'158387'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(454823676916602087)
,p_report_id=>wwv_flow_imp.id(454823525630602085)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454824226502602096)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(454407052939940801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454825097186602101)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(454407091224940802)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454825986357602103)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(454407213172940803)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454826900258602105)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(454407338642940804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454827866719602107)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(454407428713940805)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454828755669602109)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(454407500522940806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(454829576537602112)
,p_view_id=>wwv_flow_imp.id(454823676916602087)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(454407644989940807)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602261923634037833)
,p_plug_name=>'PBPassDetailGrn'
,p_static_id=>'pbpassdetailgrn'
,p_region_name=>'PBPassDetailGrn'
,p_region_css_classes=>' js-dialog-size1200x500'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.SNO,',
'       a.GRNTNO,',
'       a.QUALITYDEDUCTION,',
'       a.QUALITYBONUS,',
'       a.QUALITYDEDUCTIONAUTO,',
'       a.QUALITYBONUSAUTO,',
'       a.QUALITYDEDUCTIONMANUAL,',
'       a.QUALITYBONUSMANUAL,',
'       a.OTHERDEDUCTION,',
'       a.GRNSNO,',
'       a.PURCHASEAMOUNT,',
'       a.PURCHASERATE,',
'       a.PURCHASEQUANTITY1,',
'       a.PURCHASEQUANTITY2,',
'       a.BALANCEQUANTITY1,',
'       a.BALANCEQUANTITY2,',
'       a.BALANCEAMOUNT,',
'       B.CHALANQUANTITY1,',
'       B.RECEIVEDQUANTITY1,',
'       B.ACCEPTEDQUANTITY1',
'  from PBPASSDETAILGRN A, GRNDETAIL B',
'  where a.tno = :P152_TNO',
'  and a.sno = :P152_SNO',
'  and a.grntno = b.tno',
'  and a.grnsno = b.sno'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(601383467526650840)
,p_ajax_items_to_submit=>'P152_TNO,P152_SNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PBPassDetailGrn'
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
 p_id=>wwv_flow_imp.id(501636918948793205)
,p_name=>'ACCEPTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Accepted Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602263920141037853)
,p_name=>'BALANCEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263699943037851)
,p_name=>'BALANCEQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263780338037852)
,p_name=>'BALANCEQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(501636751256793203)
,p_name=>'CHALANQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalan Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602263193838037846)
,p_name=>'GRNSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRNSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262415518037838)
,p_name=>'GRNTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRNTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'GRN No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select grnno , tno from grn'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263088935037845)
,p_name=>'OTHERDEDUCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OTHERDEDUCTION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263291457037847)
,p_name=>'PURCHASEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263499888037849)
,p_name=>'PURCHASEQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263618560037850)
,p_name=>'PURCHASEQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602263443791037848)
,p_name=>'PURCHASERATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASERATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262563919037840)
,p_name=>'QUALITYBONUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYBONUS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262815102037842)
,p_name=>'QUALITYBONUSAUTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYBONUSAUTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262994287037844)
,p_name=>'QUALITYBONUSMANUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYBONUSMANUAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262514775037839)
,p_name=>'QUALITYDEDUCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYDEDUCTION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262676972037841)
,p_name=>'QUALITYDEDUCTIONAUTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYDEDUCTIONAUTO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262853109037843)
,p_name=>'QUALITYDEDUCTIONMANUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYDEDUCTIONMANUAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(501636802866793204)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(602262317126037837)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(601383943925650844)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(602262231228037836)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(602261998565037834)
,p_internal_uid=>161875653314111310
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(602320629337254599)
,p_interactive_grid_id=>wwv_flow_imp.id(602261998565037834)
,p_static_id=>'1619343'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(602320799842254599)
,p_report_id=>wwv_flow_imp.id(602320629337254599)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502814952411216312)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(501636751256793203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502815795236216317)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(501636802866793204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502816626020216319)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(501636918948793205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602322184164254603)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(602262231228037836)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602323079285254605)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(602262317126037837)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602324026513254607)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(602262415518037838)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602324880748254609)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(602262514775037839)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602325841265254611)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(602262563919037840)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602326654108254613)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(602262676972037841)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602327644908254616)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(602262815102037842)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602328489247254618)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(602262853109037843)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>174
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602329421682254621)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(602262994287037844)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602330343454254623)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(602263088935037845)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602331239943254625)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(602263193838037846)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602332089608254628)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(602263291457037847)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602332967304254630)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(602263443791037848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602333888614254632)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(602263499888037849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602334802549254634)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(602263618560037850)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602335677106254636)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(602263699943037851)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602336546393254638)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(602263780338037852)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(602337481008254640)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(602263920141037853)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(438984976543697987)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(501636751256793203)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(438985136239697990)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(501636802866793204)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(438985242632697990)
,p_view_id=>wwv_flow_imp.id(602320799842254599)
,p_static_id=>'sum-3'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(501636918948793205)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454409456349940825)
,p_plug_name=>'PBPassTDSDeductedInAdvance'
,p_static_id=>'pbpasstdsdeductedinadvance'
,p_region_name=>'PBPassTDSDeductedInAdvance'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       VOUCHERTDSDEDUCTEDTNO,',
'       DEDUCTEDINADVANCE,',
'       VOUCHERTDSDEDUCTEDSNO,',
'       PURCHASEORDERTNO',
'  from PBPASSTDSDEDUCTEDINADVANCE',
'  where tno = :P152_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P152_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PBPassTDSDeductedInAdvance'
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
 p_id=>wwv_flow_imp.id(454410354960940834)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(455356324244181885)
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
 p_id=>wwv_flow_imp.id(454410016031940831)
,p_name=>'DEDUCTEDINADVANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEDUCTEDINADVANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Deductedinadvance'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454410205207940833)
,p_name=>'PURCHASEORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Purchase Order No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select purchaseorderno , tno from purchaseorder'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(454409638157940827)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(454409788904940829)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454409732102940828)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454410139982940832)
,p_name=>'VOUCHERTDSDEDUCTEDSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERTDSDEDUCTEDSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vouchertdsdeductedsno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(454409885519940830)
,p_name=>'VOUCHERTDSDEDUCTEDTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERTDSDEDUCTEDTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Voucher No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select voucherno , tno from voucher'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(454409523088940826)
,p_internal_uid=>15424653889242842
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(455228209023976360)
,p_interactive_grid_id=>wwv_flow_imp.id(454409523088940826)
,p_static_id=>'162434'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(455228429403976367)
,p_report_id=>wwv_flow_imp.id(455228209023976360)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455228946206976383)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(454409638157940827)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455229808220976391)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(454409732102940828)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455230756935976393)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(454409788904940829)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455231653560976395)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(454409885519940830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455232530490976397)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(454410016031940831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455233442674976399)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(454410139982940832)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>178
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455234354561976401)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(454410205207940833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(455362327937182401)
,p_view_id=>wwv_flow_imp.id(455228429403976367)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(454410354960940834)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(601994468342228812)
,p_plug_name=>'Purchase Bill Pass'
,p_static_id=>'purchase-bill-pass'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(601383181233650837)
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
'       PBPASSNO,',
'       PBPASSDATE,',
'       PURCHASEBILLTNO,',
'       PBPASSONCODE,',
'       FOOTERFROMPURCHASEBILL,',
'       CURRENCYUNITCODE,',
'       CURRENCYVALUE,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       PBPASSAMOUNT,',
'       REMARK,',
'       ITEMWISEFOOTER,',
'       SUMOFQUALITYBONUS,',
'       SUMOFQUALITYDEDUCTION,',
'       FOOTERAFTERQUALITY,',
'       SUMOFQUALITYBONUSAUTO,',
'       SUMOFQUALITYDEDUCTIONAUTO,',
'       SUMOFQUALITYBONUSMANUAL,',
'       SUMOFQUALITYDEDUCTIONMANUAL,',
'       SUMOFOTHERDEDUCTION,',
'       SUMOFFOOTERAMOUNTWITHRATE,',
'       CREATOR,',
'       ENTRYTAXPERCENT,',
'       ENTRYTAXAMOUNT,',
'       ENTRYTAXFOOTERNATURECODE,',
'       EXCISEDOCTYPECODE,',
'       ENTRYTAXAMOUNTFORFREIGHT,',
'       ACCOUNTCODE,',
'       EXTRAFOOTERFORENTRYTAX,',
'       TRANSACTIONTYPECODE,',
'       REVERSECHARGEIFAPPLICABLE,',
'       DUEDATE,',
'       CREATIONTIME,',
'       PAIDAMOUNT,',
'       PAIDINADVANCE,',
'       REVERSECHARGEFOOTERNATURECODE,',
'       TDSDEDUCTEDINADVANCE,',
'       TDSDEDUCTABLEAMOUNT,',
'       TDSLOWERRATEAPPLICABLE,',
'       TDSLOWERRATE,',
'       CESSLOWERRATE,',
'       SURCHARGELOWERRATE,',
'       TDSCERTIFICATENO,',
'       TDSCERTIFICATEFILENAME,',
'       TDSTAXCATEGORYCODE,',
'       PANNO,',
'       TDSTHRESHOLD,',
'       TDSTRANSACTIONTHRESHOLD,',
'       TOTALTDSPERCENT,',
'       THRESHOLDPLUSMINUS,',
'       ADVANCEORBILL,',
'       SUMOFTDSAMOUNT,',
'       AMOUNTAFTERTDS,',
'       TDSNATURECODE,',
'       TDSPAYEECATEGORYCODE,',
'       TOTALBILLAMOUNTFORTHEFY,',
'       DEDUCTIONSTARTABOVEAMOUNT,',
'       INCOMETAXRETURNTILLDATE,',
'       ELIGIBLEFORTDSUNDER194Q,',
'       YEARSWITHOUTRETURN,',
'       FREIGHTADVANCEAMOUNT,',
'       TCSAMOUNTDEDUCTEDINBILL,',
'       ISINDIANRESIDENT,',
'       TOTALTDSRATE,',
'       TDSMASTERCODE,',
'       PARTYCODE,',
'       taxinround,',
'       billinroundfigure,',
'       pbpassamountbeforeround,',
'       roundoff',
'  from PBPASS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604542269232679971)
,p_plug_name=>'Select Purchase Bill No And Pass On'
,p_static_id=>'select-purchase-bill-no-and-pass-on'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(607087246093783530)
,p_plug_name=>'TDS'
,p_static_id=>'tds'
,p_parent_plug_id=>wwv_flow_imp.id(601383181233650837)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SERIALNO,',
'       FOOTERHEADCODE,',
'       FOOTERVALUE,',
'       FOOTERPERCENT',
'  from PBPASSTDSDETAIL',
'  where tno = :P152_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P152_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'TDS'
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
 p_id=>wwv_flow_imp.id(607088241159783539)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(607088277715783540)
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
 p_id=>wwv_flow_imp.id(607087935777783536)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footer Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(607088143820783538)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer %'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(607087974671783537)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(607087460060783532)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(607087809806783535)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(607087673173783534)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(607087643981783533)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(607087438581783531)
,p_internal_uid=>166701093330857007
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
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(607647822299657321)
,p_interactive_grid_id=>wwv_flow_imp.id(607087438581783531)
,p_static_id=>'1672615'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(607647964545657321)
,p_report_id=>wwv_flow_imp.id(607647822299657321)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607648509743657322)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(607087460060783532)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607649422355657325)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(607087643981783533)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607650260246657327)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(607087673173783534)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607651197754657329)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(607087809806783535)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607652050719657331)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(607087935777783536)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607653013840657333)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(607087974671783537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607653891882657335)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(607088143820783538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607654826710657338)
,p_view_id=>wwv_flow_imp.id(607647964545657321)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(607088241159783539)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(605320200066850238)
,p_plug_name=>'TDS Detail'
,p_static_id=>'tds-detail'
,p_parent_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(302136524147043571)
,p_button_sequence=>470
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
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
 p_id=>wwv_flow_imp.id(602392805943508618)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1501751158967552484)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P152_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(454408171220940813)
,p_button_sequence=>260
,p_button_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_button_name=>'Advance'
,p_static_id=>'advance'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'...'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(454407873294940810)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(454406770486940799)
,p_button_name=>'Back2'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602350531205277341)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(602261923634037833)
,p_button_name=>'Back'
,p_static_id=>'back-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602350748331277344)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(602264427724037858)
,p_button_name=>'Back1'
,p_static_id=>'back-3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(455356566065181887)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(454409456349940825)
,p_button_name=>'Back2_1'
,p_static_id=>'back-4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602124481498618821)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
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
 p_id=>wwv_flow_imp.id(602125696171618823)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602124858507618823)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
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
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602126869019618823)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602127290938618824)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602351052084277347)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(601383467526650840)
,p_button_name=>'GetItems'
,p_static_id=>'getitems'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Items'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(607088483771783542)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(607087246093783530)
,p_button_name=>'GetTDS'
,p_static_id=>'gettds'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'GETTDS'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602126538643618823)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
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
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602126140982618823)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602125320650618823)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602127708604618824)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(1057267710045261674)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P152_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P152_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(455357159460181893)
,p_button_sequence=>460
,p_button_plug_id=>wwv_flow_imp.id(605320200066850238)
,p_button_name=>'Tdsadvance'
,p_static_id=>'tdsadvance'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'...'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(602045508213228880)
,p_branch_name=>'Go To Page 151'
,p_branch_action=>'f?p=&APP_ID.:151:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(602124858507618823)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602007694024228852)
,p_name=>'P152_ACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602016866910228856)
,p_name=>'P152_ADVANCEORBILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ADVANCEORBILL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452831566501866223)
,p_name=>'P152_ALLOWEDBACK'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452831817980874516)
,p_name=>'P152_ALLOWEDFORWARD'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602017654070228856)
,p_name=>'P152_AMOUNTAFTERTDS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'AMOUNTAFTERTDS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605320879626850245)
,p_name=>'P152_BILLAMOUNT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_prompt=>'Bill Amount'
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(198439275617447974)
,p_name=>'P152_BILLINROUNDFIGURE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Bill In Round Figure'
,p_source=>'BILLINROUNDFIGURE'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Yes;YES,No;NO'
,p_grid_label_column_span=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1511055354307585586)
,p_name=>'P152_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1452437009091317194)
,p_name=>'P152_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_item_default=>'151'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447056954067861610)
,p_name=>'P152_CALLEDFROMTNO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602012876989228855)
,p_name=>'P152_CESSLOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'CESSLOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601995247213228836)
,p_name=>'P152_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602009667048228853)
,p_name=>'P152_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602005307285228851)
,p_name=>'P152_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601998904993228849)
,p_name=>'P152_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(604542367957679972)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Currency Unit'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CURRENCYUNITNAME , CURRENCYUNITCODE from currencyunit',
'where getdocumentstatuscode(''CURRENCYUNIT'',TNO) = ''ACTIVE'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(601999339514228849)
,p_name=>'P152_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(604542367957679972)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Currency Value'
,p_source=>'CURRENCYVALUE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(455356996607181892)
,p_name=>'P152_DAMOUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(454409456349940825)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605320992010850246)
,p_name=>'P152_DEBITNOTEAMOUNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DEBITNOTEAMOUNT,(:P152_PBPASSAMOUNT - NVL(:P152_DEBITNOTEAMOUNT,0))) from debitnote     ',
'where REFERENCEMODULETNO = :P152_TNO;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Debit Note Amount'
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605320659449850243)
,p_name=>'P152_DEBITNOTENO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_prompt=>'Debit Voucher No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607091649597783574)
,p_name=>'P152_DEBITNOTETNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602019337769228857)
,p_name=>'P152_DEDUCTIONSTARTABOVEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'DEDUCTIONSTARTABOVEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353031740277366)
,p_name=>'P152_DETAILQUALITYBONUSAUTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353219581277368)
,p_name=>'P152_DETAILQUALITYBONUSMANUAL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353082572277367)
,p_name=>'P152_DETAILQUALITYDEDUCTIONAUTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602353258955277369)
,p_name=>'P152_DETAILQUALITYDEDUCTIONMANUAL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447355566793243102)
,p_name=>'P152_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(602264427724037858)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294285086097767365)
,p_name=>'P152_DFQUANTITY1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(601383467526650840)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447355600534243103)
,p_name=>'P152_DFTOTALAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(602264427724037858)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605320839768850244)
,p_name=>'P152_DNNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEBITNOTENO from debitnote',
'where REFERENCEMODULETNO = :P152_TNO;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'DN No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(608139492959356459)
,p_name=>'P152_DNTNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno from debitnote',
'where REFERENCEMODULETNO = :P152_TNO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601996499010228848)
,p_name=>'P152_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(604542234807679970)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.DocTypeName as d,',
'	a.DocTypeCode as r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c, Module d',
'where a.DocTypeCode = b.DocTypeCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(602009283540228853)
,p_name=>'P152_DUEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'DUEDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602020002570228859)
,p_name=>'P152_ELIGIBLEFORTDSUNDER194Q'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ELIGIBLEFORTDSUNDER194Q'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602006124922228851)
,p_name=>'P152_ENTRYTAXAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ENTRYTAXAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602007264326228852)
,p_name=>'P152_ENTRYTAXAMOUNTFORFREIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ENTRYTAXAMOUNTFORFREIGHT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602006476719228852)
,p_name=>'P152_ENTRYTAXFOOTERNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ENTRYTAXFOOTERNATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602005744838228851)
,p_name=>'P152_ENTRYTAXPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ENTRYTAXPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602006875604228852)
,p_name=>'P152_EXCISEDOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'EXCISEDOCTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602008138677228853)
,p_name=>'P152_EXTRAFOOTERFORENTRYTAX'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'EXTRAFOOTERFORENTRYTAX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601995744300228840)
,p_name=>'P152_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602002455116228850)
,p_name=>'P152_FOOTERAFTERQUALITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'FOOTERAFTERQUALITY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601998509828228849)
,p_name=>'P152_FOOTERFROMPURCHASEBILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'NO'
,p_prompt=>'Footer From Purchase Bill'
,p_source=>'FOOTERFROMPURCHASEBILL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1452436922612317193)
,p_name=>'P152_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P152_TNO is null then',
'		return(''NEWRECORD'');',
'	else',
'		return(''EDITRECORD'');',
'	End if;',
'	end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602020799835228859)
,p_name=>'P152_FREIGHTADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'FREIGHTADVANCEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447355766188243104)
,p_name=>'P152_FVALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(602264427724037858)
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602352643838277362)
,p_name=>'P152_GRNQUALITYBONUSAUTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602352746723277364)
,p_name=>'P152_GRNQUALITYBONUSMANUAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602352677614277363)
,p_name=>'P152_GRNQUALITYDEDUCTIONAUTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602352866282277365)
,p_name=>'P152_GRNQUALITYDEDUCTIONMANUAL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294285027560767364)
,p_name=>'P152_HSNCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(601383467526650840)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602019740954228859)
,p_name=>'P152_INCOMETAXRETURNTILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'INCOMETAXRETURNTILLDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602021592559228859)
,p_name=>'P152_ISINDIANRESIDENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ISINDIANRESIDENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602001312242228850)
,p_name=>'P152_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601996053157228841)
,p_name=>'P152_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(604542234807679970)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'RC'
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
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(1452433205295317156)
,p_name=>'P152_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605319779898850234)
,p_name=>'P152_NATUREOFSUPPLY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(604542504299679973)
,p_prompt=>'Nature Of Supply'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NATUREOFSUPPLYNAME , NATUREOFSUPPLYCODE from natureofsupply',
'where getdocumentstatuscode(''NATUREOFSUPPLY'',TNO) = ''ACTIVE'''))
,p_cSize=>32
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451806917020682803)
,p_name=>'P152_NETPAYABLEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'select nvl(:P152_PBPASSAMOUNT,0)-nvl(:P152_SUMOFTDSAMOUNT,0)-nvl(:P152_PAIDINADVANCE,0) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Net Payable Amount'
,p_format_mask=>'999999999.99'
,p_source=>'AMOUNTAFTERTDS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1451841426191045890)
,p_name=>'P152_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602010049510228853)
,p_name=>'P152_PAIDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'PAIDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602010465876228853)
,p_name=>'P152_PAIDINADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'0'
,p_prompt=>'Paid In Advance'
,p_format_mask=>'999999999.99'
,p_source=>'PAIDINADVANCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454408670892940818)
,p_name=>'P152_PAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(454406770486940799)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602014936279228855)
,p_name=>'P152_PANNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'PANNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605319679889850233)
,p_name=>'P152_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(604542234807679970)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P152_PARTY'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '700')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1426489944055692354)
,p_name=>'P152_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602000485291228850)
,p_name=>'P152_PBPASSAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'PB Pass Amount'
,p_format_mask=>'999999999.99'
,p_source=>'PBPASSAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(198439376859447975)
,p_name=>'P152_PBPASSAMOUNTBEFOREROUND'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'PB Pass Amount Before Round'
,p_format_mask=>'9999999999.99'
,p_source=>'PBPASSAMOUNTBEFOREROUND'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601997275124228848)
,p_name=>'P152_PBPASSDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(604542234807679970)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'PB Pass Date'
,p_source=>'PBPASSDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P152_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P152_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601996907544228848)
,p_name=>'P152_PBPASSNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(604542234807679970)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'PB Pass No'
,p_source=>'PBPASSNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601998143757228849)
,p_name=>'P152_PBPASSONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'ACCEPTED'
,p_prompt=>'Pass On Qty'
,p_source=>'PBPASSONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select PBPASSONNAME,PBPASSONCODE from pbpasson'
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(601997721877228849)
,p_name=>'P152_PURCHASEBILLTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Purchase Bill No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:143:&SESSION.::NO:RP,143:P143_TNO,P143_CALLEDFROMPAGE,P143_FORMSTATUS,P143_CALLEDFROMTNO:&P152_PURCHASEBILLTNO.,152,CALLED,&P152_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'PURCHASEBILLTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P152_PURHASEBILLTNO'
,p_lov_cascade_parent_items=>'P152_LOCATIONCODE,P152_DOCTYPECODE,P152_PARTYCODE'
,p_ajax_items_to_submit=>'P152_LOCATIONCODE,P152_DOCTYPECODE,P152_PARTYCODE,P152_PURCHASEBILLTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602000919147228850)
,p_name=>'P152_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1000
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602010891129228853)
,p_name=>'P152_REVERSECHARGEFOOTERNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'REVERSECHARGEFOOTERNATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602008930376228853)
,p_name=>'P152_REVERSECHARGEIFAPPLICABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Reverse Charge If Applicable'
,p_source=>'REVERSECHARGEIFAPPLICABLE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(605321141125850247)
,p_name=>'P152_REVERSECHARGENO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_prompt=>'Reverse Ch. No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(198439471828447976)
,p_name=>'P152_ROUNDOFF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Round Off'
,p_format_mask=>'999999999.99'
,p_source=>'ROUNDOFF'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602263998611037854)
,p_name=>'P152_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(601383467526650840)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(916419714457765125)
,p_name=>'P152_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P152_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1426489780410692353)
,p_name=>'P152_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1424662409187343593)
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
 p_id=>wwv_flow_imp.id(601999722150228849)
,p_name=>'P152_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Sum Of Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602000129167228849)
,p_name=>'P152_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(605319041674850226)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Sum Of Footer Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602004901010228851)
,p_name=>'P152_SUMOFFOOTERAMOUNTWITHRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFFOOTERAMOUNTWITHRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602004448772228851)
,p_name=>'P152_SUMOFOTHERDEDUCTION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFOTHERDEDUCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602001718958228850)
,p_name=>'P152_SUMOFQUALITYBONUS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFQUALITYBONUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602002920693228850)
,p_name=>'P152_SUMOFQUALITYBONUSAUTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFQUALITYBONUSAUTO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602003675193228851)
,p_name=>'P152_SUMOFQUALITYBONUSMANUAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFQUALITYBONUSMANUAL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602002081781228850)
,p_name=>'P152_SUMOFQUALITYDEDUCTION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFQUALITYDEDUCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602003331719228851)
,p_name=>'P152_SUMOFQUALITYDEDUCTIONAUTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFQUALITYDEDUCTIONAUTO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602004095825228851)
,p_name=>'P152_SUMOFQUALITYDEDUCTIONMANUAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SUMOFQUALITYDEDUCTIONMANUAL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602017257728228856)
,p_name=>'P152_SUMOFTDSAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(605320200066850238)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'TDS Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFTDSAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602013270402228855)
,p_name=>'P152_SURCHARGELOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'SURCHARGELOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213369639619746182)
,p_name=>'P152_TAXINROUND'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(604542269232679971)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'NO'
,p_prompt=>'Tax in Round Fig.'
,p_source=>'TAXINROUND'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:No;NO,Yes;YES'
,p_grid_label_column_span=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602021146822228859)
,p_name=>'P152_TCSAMOUNTDEDUCTEDINBILL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TCSAMOUNTDEDUCTEDINBILL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602014090356228855)
,p_name=>'P152_TDSCERTIFICATEFILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSCERTIFICATEFILENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602013674525228855)
,p_name=>'P152_TDSCERTIFICATENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSCERTIFICATENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602011699128228854)
,p_name=>'P152_TDSDEDUCTABLEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(605320200066850238)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'TDS Deductable Amount'
,p_format_mask=>'999999999.99'
,p_source=>'TDSDEDUCTABLEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602011334592228854)
,p_name=>'P152_TDSDEDUCTEDINADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(605320200066850238)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'0'
,p_prompt=>'TDS Deducted In Advance'
,p_format_mask=>'999999999.99'
,p_source=>'TDSDEDUCTEDINADVANCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602012502946228855)
,p_name=>'P152_TDSLOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSLOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602012106169228854)
,p_name=>'P152_TDSLOWERRATEAPPLICABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSLOWERRATEAPPLICABLE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602022350049228860)
,p_name=>'P152_TDSMASTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSMASTERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602018078964228856)
,p_name=>'P152_TDSNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(604542504299679973)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_default=>'TDSONPURCHASE'
,p_prompt=>'TDS Nature'
,p_source=>'TDSNATURECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select TDSNATURENAME , TDSNATURECODE from tdsnature'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(602018456343228857)
,p_name=>'P152_TDSPAYEECATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSPAYEECATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602014534224228855)
,p_name=>'P152_TDSTAXCATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSTAXCATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602015308312228855)
,p_name=>'P152_TDSTHRESHOLD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSTHRESHOLD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602015684859228856)
,p_name=>'P152_TDSTRANSACTIONTHRESHOLD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TDSTRANSACTIONTHRESHOLD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602016479435228856)
,p_name=>'P152_THRESHOLDPLUSMINUS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'THRESHOLDPLUSMINUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(601994875974228821)
,p_name=>'P152_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602018941699228857)
,p_name=>'P152_TOTALBILLAMOUNTFORTHEFY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TOTALBILLAMOUNTFORTHEFY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602016063901228856)
,p_name=>'P152_TOTALTDSPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TOTALTDSPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602022009461228860)
,p_name=>'P152_TOTALTDSRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'TOTALTDSRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602008507309228853)
,p_name=>'P152_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(604542504299679973)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_prompt=>'Transaction Type'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TRANSACTIONTYPENAME , TRANSACTIONTYPECODE from transactiontype',
''))
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(605320549540850242)
,p_name=>'P152_VOUCHERNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select voucherno from voucher ',
'where moduletno = :P152_TNO',
'and modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'and doctypecode = ''PURCHASE''; '))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Voucher No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(607091579701783573)
,p_name=>'P152_VOUCHERTNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(605320519521850241)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno from voucher ',
'where moduletno = :P152_TNO',
'and modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'and doctypecode = ''PURCHASE'';  '))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(602020361232228859)
,p_name=>'P152_YEARSWITHOUTRETURN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_item_source_plug_id=>wwv_flow_imp.id(601994468342228812)
,p_source=>'YEARSWITHOUTRETURN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447357123104243118)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_triggering_element=>'LEGENDSCODE,FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447357257237243119)
,p_event_id=>wwv_flow_imp.id(447357123104243118)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,LEGENDSCODE,FOOTERPERCENT,P152_DFAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare	',
    '	cursor cFooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.sno < c.sno ',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	vFooterSchemeDetail cFooterSchemeDetail%ROWTYPE;',
    '	',
    '	cursor c3FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v3FooterSchemeDetail c3FooterSchemeDetail%ROWTYPE;',
    '',
    '',
    '	cursor c2FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a',
    '		where a.Status = ''ACTIVE''',
    '			and a.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v2FooterSchemeDetail c2FooterSchemeDetail%ROWTYPE;',
    '	',
    '	myFormula varchar2(1000);',
    '	isFound varchar2(10);',
    '	fvalue number;',
    '    tTotalDetailAmount number;',
    '    tmp varchar2(100);',
    '	',
    'BEGIN',
    '  /*for vBookingDetail in',
    '        (',
    '        Select',
    '            sum(a.Amount) as TotalAmount',
    '        From BookingDetail a',
    '        Where a.Tno = :P93_Tno',
    '        )',
    '    loop',
    '        tTotalDetailAmount := vBookingDetail.TotalAmount;',
    '    end loop;*/',
    '    tTotalDetailAmount := :P152_DFAMOUNT;',
    '',
    '  open c2FooterSchemeDetail;',
    '  fetch c2FooterSchemeDetail into v2FooterSchemeDetail;',
    '  if c2FooterSchemeDetail%FOUND then',
    '  		if length(nvl(v2FooterSchemeDetail.Formula,''''))>0 then',
    '  				myFormula := v2FooterSchemeDetail.Formula;',
    '  				myFormula := replace(myFormula, ''.A.'', nvl(tTotalDetailAmount,0) );',
    '  				for vFooterSchemeDetail  in cFooterSchemeDetail ',
    '  				loop',
    '					if :FooterHeadCode = vFooterSchemeDetail.FooterHeadCode then',
    '							isFound := ''YES'';',
    '							myFormula := replace(myFormula, vFooterSchemeDetail.FooterHeadCode, nvl(:FooterValue,0) );',
    '							exit;',
    '					end if;',
    '  				end loop;',
    '  				',
    '  					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0) );',
    '  			',
    '  				for v3FooterSchemeDetail  in c3FooterSchemeDetail ',
    '  				loop',
    '  						myFormula := replace(myFormula, v3FooterSchemeDetail.FooterHeadCode, ''0'' );',
    '  				end loop;',
    '  				if (:legendscode is null and NVL(GetMYparametervalue(''LEGENDS''),''YES'') = ''NO'') then ',
    '					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '					:footervalue := getvalue(myformula);',
    '			    end if;',
    '',
    '                ',
    '',
    '		  		if (:Legendscode is not null and  NVL(GetMyparametervalue(''LEGENDS''),''NO'')= ''YES'') then ',
    '		  				select getvalue(myFormula) into  fvalue 	from dual;',
    '',
    '                          ',
    '                      ',
    '		  				if :legendscode = ''PRA'' then ',
    '		  					 	:footervalue := nvl(round(fvalue,0),0);',
    '		  					',
    '',
    '                                 ',
    '                                ',
    '		  				end if;',
    '		  				',
    '		  				if :legendscode = ''PRD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,0),0);',
    '		  					',
    '		  				end if;',
    '							if :legendscode is null then ',
    '									myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '							end if;',
    '							if :legendscode = ''PAA'' then ',
    '		  						:footervalue := nvl(round(fvalue,2),0);',
    '							end if;',
    '							',
    '							if :legendscode = ''PAD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,2),0);',
    '							end if;',
    '		  		END IF;',
    '		  	',
    '  			',
    '  		end if;',
    ' end if;',
    ' end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447357334992243120)
,p_event_id=>wwv_flow_imp.id(447357123104243118)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447357579499243123)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>480
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447357676026243124)
,p_event_id=>wwv_flow_imp.id(447357579499243123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P152_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447358058673243127)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>500
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447358099080243128)
,p_event_id=>wwv_flow_imp.id(447358058673243127)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P152_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447357377385243121)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447357531241243122)
,p_event_id=>wwv_flow_imp.id(447357377385243121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P152_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447358193760243129)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>510
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602350748331277344)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447358287421243130)
,p_event_id=>wwv_flow_imp.id(447358193760243129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow,index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt) && !meta.deleted && !meta.agg) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    '',
    'apex.item("P152_FVALUE").setValue(n_totamt.toFixed(2));',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447356585549243113)
,p_name=>'Calculate Sum of Amount Value on Loose focus'
,p_static_id=>'calculate-sum-of-amount-value-on-loose-focus'
,p_event_sequence=>440
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'AMOUNT,FD,FOOTERAMOUNT,TOTALAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447356805676243115)
,p_event_id=>wwv_flow_imp.id(447356585549243113)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("AMOUNT");',
    'var footerKey = model.getFieldKey("FOOTERAMOUNT");',
    'var grandtotalKey = model.getFieldKey("TOTALAMOUNT");',
    'var totalAmt = 0;',
    'var footerAmt = 0;',
    'var grandtotalAmt = 0;',
    '',
    'model.forEach(function(r, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '  var total = parseFloat(r[totalKey], 10);',
    '  var footer = parseFloat(r[footerKey], 10);',
    '  var grandtotal = parseFloat(r[grandtotalKey], 10);',
    '',
    '  if (!isNaN(total) && !meta.deleted && !meta.agg) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  if (!isNaN(footer) && !meta.deleted && !meta.agg) {',
    '    footerAmt += footer;',
    '  }',
    '',
    '  if (!isNaN(grandtotal) && !meta.deleted && !meta.agg) {',
    '    grandtotalAmt += grandtotal;',
    '  }',
    '});',
    '',
    '$s("P152_SUMOFAMOUNT", totalAmt);',
    '$s("P152_SUMOFFOOTERAMOUNT", footerAmt);',
    '$s("P152_PBPASSAMOUNT", grandtotalAmt);',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447356724322243114)
,p_event_id=>wwv_flow_imp.id(447356585549243113)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PBPASSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TOTALAMOUNT',
  'plsql_expression', ':TOTALAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198440198315447983)
,p_event_id=>wwv_flow_imp.id(447356585549243113)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set P152_PBPASSAMOUN'
,p_static_id=>'set-p152-pbpassamoun'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PBPASSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT',
  'sql_query', ' select round(:P152_PBPASSAMOUNT,0) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198440019186447982)
,p_event_id=>wwv_flow_imp.id(447356585549243113)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set P152_PBPASSAMOUNTBEFOREROUND'
,p_static_id=>'set-p152-pbpassamountbeforeround'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PBPASSAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT',
  'plsql_expression', ':P152_PBPASSAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198440235101447984)
,p_event_id=>wwv_flow_imp.id(447356585549243113)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set P152_ROUNDOFF'
,p_static_id=>'set-p152-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT,P152_PBPASSAMOUNTBEFOREROUND',
  'sql_query', 'select :P152_PBPASSAMOUNT - :P152_PBPASSAMOUNTBEFOREROUND from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198440398018447985)
,p_event_id=>wwv_flow_imp.id(447356585549243113)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set P152_ROUNDOFF'
,p_static_id=>'set-p152-roundoff-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ROUNDOFF,P152_PBPASSAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select 0 as a , 0 as b from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(607088578967783543)
,p_name=>'calculate tds'
,p_static_id=>'calculate-tds'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(607088483771783542)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(607088659772783544)
,p_event_id=>wwv_flow_imp.id(607088578967783543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P152_TDSPAYEECATEGORYCODE,P152_TDSTAXCATEGORYCODE,P152_PANNO,P152_TDSTHRESHOLD,P152_TDSTRANSACTIONTHRESHOLD,P152_TOTALTDSPERCENT,P152_THRESHOLDPLUSMINUS,P152_ADVANCEORBILL,P152_TDSDEDUCTABLEAMOUNT',
  'items_to_submit', 'P152_PARTYCODE,P152_TDSPAYEECATEGORYCODE,P152_TDSNATURECODE,P152_TDSTAXCATEGORYCODE,P152_PANNO,P152_COMPANYCODE,P152_FINANCIALYEARCODE,P152_THRESHOLDPLUSMINUS,P152_SUMOFAMOUNT,P152_TDSDEDUCTABLEAMOUNT,P152_TDSDEDUCTEDINADVANCE,P152_PBPASSDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tExpenseAmount Number;',
    '    tThisExpenseAmount Number;',
    '    tTDSAmount Number;',
    '    tTotalExpenseAmount Number;',
    'begin',
    '    for vParty in ',
    '        (',
    '        select ',
    '            a.TDSPayeeCategoryCode',
    '        from Party a',
    '        where a.PartyCode = :P152_PartyCode ',
    '        )',
    '    loop ',
    '    :P152_TDSPayeeCategoryCode := vParty.TDSPayeeCategoryCode;',
    '    end loop;',
    '    --',
    '    :P152_TDSTaxCategoryCode := GetTDSTaxCategoryCode(:P152_TDSPayeeCategoryCode, :P152_TDSNatureCode, :P152_PBPassDate);',
    '    :P152_PANNo := GetPartyAttributeValue(:P152_PartyCode, ''PANNO'');',
    '    ----',
    ' --   raise_application_error(-20000,GetTDSTaxCategoryCode(:P152_TDSPayeeCategoryCode, :P152_TDSNatureCode, :P152_PBPassDate));',
    '--raise_application_error(-20000, ''TDSTaxCategoryCode : '' || :P152_TDSTaxCategoryCode || '' Panno : '' || :P152_PANNo );',
    '    ----',
    '    for vTDSTaxCategory in',
    '        (',
    '        select',
    '            b.TotalTDSPercentWithPAN,',
    '            b.TotalTDSPercentWithoutPAN,',
    '            b.Threshold,',
    '            b.TransactionThreshold',
    '        from TDSTaxCategory a, TDSTaxCategoryDetail b',
    '        where a.TNo = b.TNo ',
    '            and a.TDSTaxCategoryCode = :P152_TDSTaxCategoryCode',
    '            and b.TDSPayeeCategoryCode = :P152_TDSPayeeCategoryCode',
    '        )',
    '    loop',
    '        --',
    '        :P152_TDSThreshold := vTDSTaxCategory.Threshold;',
    '        :P152_TDSTransactionThreshold := vTDSTaxCategory.TransactionThreshold;',
    '        --',
    '        if :P152_PANNo is null then ',
    '        :P152_TotalTDSPercent := vTDSTaxCategory.TotalTDSPercentWithoutPAN;',
    '        else ',
    '        :P152_TotalTDSPercent := vTDSTaxCategory.TotalTDSPercentWithPAN;',
    '        end if;',
    '        exit;',
    '    end loop;',
    '    ----',
    '    if nvl(:P152_TDSThreshold, 0) > 0 then ',
    '        select ',
    '            sum(b.TDSAmount)',
    '            into  tTDSAmount',
    '        from Voucher a, VoucherTDSDeducted b ',
    '        where a.TNo = b.TNo ',
    '            and b.PartyCode = :P152_PartyCode',
    '            and a.FinancialYearCode = :P152_FinancialYearCode',
    '            and b.TDSNatureCode = :P152_TDSNatureCode',
    '        ;',
    '    --',
    '    if nvl(tTDSAmount, 0) > 0 then ',
    '         :P152_ThresholdPlusMinus := 0;',
    '    else ',
    '        --',
    '        select ',
    '            sum(-1 * b.ThresholdPlusMinus )',
    '            into  tExpenseAmount',
    '        from Voucher a, VoucherTDSDeducted b ',
    '        where a.TNo = b.TNo ',
    '            and b.PartyCode = :P152_PartyCode',
    '            and a.FinancialYearCode = :P152_FinancialYearCode',
    '            and b.ThresholdPlusMinus < 0',
    '            and b.AdvanceOrBill = ''BILL''',
    '            and b.TDSNatureCode = :P152_TDSNatureCode',
    '             and a.VoucherNo != ''OPENING''',
    '            ---------------------------',
    '        ;',
    '',
    '        tThisExpenseAmount := nvl(:P152_SumOfAmount, 0);',
    '        --',
    '        tTotalExpenseAmount := nvl(tExpenseAmount, 0) + nvl(tThisExpenseAmount, 0);',
    '        --',
    '        if nvl(tTotalExpenseAmount, 0) > nvl(:P152_TDSThreshold, 0) or  nvl(tThisExpenseAmount, 0) > nvl(:P152_TDSTransactionThreshold, 0) then ',
    '        :P152_ThresholdPlusMinus := tExpenseAmount;',
    '        else ',
    '        :P152_ThresholdPlusMinus := -1 * tThisExpenseAmount;',
    '        end if;',
    '        --',
    '        end if;  -- if nv(tTDSAmount, 0) > 0 then',
    '        --',
    '    end if; -- if nvl(:P152_TDSThreshold, 0) > 0 then ',
    '',
    '',
    '    :P152_AdvanceOrBill := ''BILL'';',
    '',
    '      ',
    '    if :P152_TotalTDSPercent > 0 then ',
    '		:P152_TDSDeductableAmount := nvl(:P152_SumOfAmount, 0) + nvl(:P152_ThresholdPlusMinus, 0) - nvl(:P152_TDSDeductedInAdvance, 0) ;',
    '        --raise_application_error(-20000, ''sumofamount : '' || to_char(:P152_SumOfAmount) || '' ThresholdPlusMinus : '' || :P152_ThresholdPlusMinus || '' TDSDeductedInAdvance : '' ||:P152_TDSDeductedInAdvance );',
    '	else ',
    '		:P152_TDSDeductableAmount := 0;',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(607088868427783546)
,p_event_id=>wwv_flow_imp.id(607088578967783543)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_TDSPAYEECATEGORYCODE,P152_COMPANYCODE,P152_FINANCIALYEARCODE,P152_TDSLOWERRATEAPPLICABLE,P152_PANNO,P152_TDSDEDUCTABLEAMOUNT,P152_TDSTAXCATEGORYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '	tFooterPercent number;',
    'begin',
    '    delete PBPassTDSDetail a',
    '    where not exists(',
    '        Select',
    '            aa.Tno',
    '        From PBPass aa',
    '        Where aa.Tno = a.Tno',
    '        )',
    '    ;',
    '    ----',
    '	delete PBPassTDSDetail where tno = :P152_TNO;',
    '',
    '    --raise_application_error(-20000, ''Tax Category Code : '' || :P152_TDSTaxCategoryCode || '' Payee Category Code : '' || :P152_TDSPayeeCategoryCode || '' Company Code : '' ||:P152_CompanyCode );',
    '	----',
    '	for vTDSMaster in',
    '        (',
    '		select',
    '			a.SNo,',
    '			a.FooterHeadCode,',
    '			b.FooterHeadName,',
    '			b.FooterPostFix,',
    '			to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithPAN, ''.CESSONTDS.'', d.CessPercentWithPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithPAN, 0)) as FooterPercentWithPAN,',
    '			to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN',
    '		from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
    '		where a.FooterHeadCode = b.FooterHeadCode',
    '			and c.TNo = d.TNo',
    '			and c.TDSTaxCategoryCode = :P152_TDSTaxCategoryCode',
    '			and d.TDSPayeeCategoryCode = :P152_TDSPayeeCategoryCode',
    '			and a.FooterHeadCode in (',
    '					''.TDS.'',',
    '					''.CESSONTDS.'',',
    '					''.SURCHARGEONTDS.''',
    '			)',
    '			and a.CompanyCode = :P152_CompanyCode ',
    '			and a.FinancialYearCode = :P152_FinancialYearCode',
    '			and a.ModuleCode = ''PBPASS''',
    '			and nvl(:P152_TDSLowerRateApplicable, ''NO'') != ''YES''',
    '		union all',
    '		select',
    '			a.SNo,',
    '			a.FooterHeadCode,',
    '			b.FooterHeadName,',
    '			b.FooterPostFix,',
    '			to_number(decode(a.FooterHeadCode, ''.TDS.'', :P152_TDSLowerRate, ''.CESSONTDS.'', :P152_CessLowerRate, ''.SURCHARGEONTDS.'', :P152_SurchargeLowerRate, 0)) as FooterPercentWithPAN,',
    '			to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN',
    '		from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
    '		where a.FooterHeadCode = b.FooterHeadCode',
    '			and c.TNo = d.TNo',
    '			and c.TDSTaxCategoryCode = :P152_TDSTaxCategoryCode',
    '			and d.TDSPayeeCategoryCode = :P152_TDSPayeeCategoryCode',
    '			and a.FooterHeadCode in (',
    '					''.TDS.'',',
    '					''.CESSONTDS.'',',
    '					''.SURCHARGEONTDS.''',
    '			)',
    '			and a.CompanyCode = :P152_CompanyCode ',
    '			and a.FinancialYearCode = :P152_FinancialYearCode',
    '			and a.ModuleCode = ''PBPASS''',
    '			and nvl(:P152_TDSLowerRateApplicable, ''NO'') = ''YES''',
    '		order by 1 ',
    '		)',
    '	loop',
    '		if :P152_PANNo is null then ',
    '			tFooterPercent := vTDSMaster.FooterPercentWithoutPAN;',
    '		else',
    '			tFooterPercent := vTDSMaster.FooterPercentWithPAN;',
    '		end if;',
    '        if nvl(GetApexTDSValue(:P152_CompanyCode, :P152_financialyearcode, ''PBPASS'', vTDSMaster.FooterHeadCode, tFooterPercent, :P152_TDSDeductableAmount),0) > 0 then',
    '',
    '        		insert into PBPassTDSDetail a',
    '        			(',
    '        			a.Tno,',
    '        			a.Sno,',
    '        			a.SerialNo,',
    '        			a.FooterHeadCode,',
    '        			a.FooterPercent,',
    '        			a.FooterValue',
    '        			)',
    '        		values',
    '        			(',
    '        			:P152_TNO,',
    '        			globaltno.nextval,',
    '        			vTDSMaster.SNo,',
    '        			vTDSMaster.FooterHeadCode,',
    '                    tFooterPercent,',
    '        			GetApexTDSValue(:P152_CompanyCode, :P152_financialyearcode, ''PBPASS'', vTDSMaster.FooterHeadCode, tFooterPercent, :P152_TDSDeductableAmount)',
    '        			) ',
    '                    ;',
    '        End if;',
    '	end loop;  	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(607089036309783547)
,p_event_id=>wwv_flow_imp.id(607088578967783543)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(607087246093783530)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455358088543181903)
,p_event_id=>wwv_flow_imp.id(607088578967783543)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_SUMOFTDSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(footervalue) from PBPassTDSDetail ',
    'where tno = :P152_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461547842696383517)
,p_event_id=>wwv_flow_imp.id(607088578967783543)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set tds deduct. amt'
,p_static_id=>'set-tds-deduct-amt'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_SUMOFAMOUNT,P152_TDSDEDUCTEDINADVANCE',
  'plsql_expression', 'nvl(:P152_SUMOFAMOUNT,0)-nvl(:P152_TDSDEDUCTEDINADVANCE,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(605319088892850227)
,p_name=>'Check footer after quality'
,p_static_id=>'check-footer-after-quality'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_FOOTERAFTERQUALITY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605319209419850228)
,p_event_id=>wwv_flow_imp.id(605319088892850227)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P152_ITEMWISEFOOTER',
  'items_to_submit', 'P152_PURCHASEBILLTNO,P152_FOOTERFROMPURCHASEBILL,P152_ITEMWISEFOOTER',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '',
    'begin',
    '',
    '    declare',
    '    		cursor cPB is',
    '    				select',
    '    						a.PurchaseBillTNo,',
    '    						a.FooterFromPurchaseBill',
    '    				from PBPass a',
    '    				where a.PurchaseBillTNo = :P152_PurchaseBillTNo',
    '    		;',
    '    		vPB cPB%ROWTYPE;',
    '    begin',
    '    		open cPB;',
    '    		fetch cPB into vPB;',
    '    		if cPB%FOUND then',
    '    				if :P152_FooterFromPurchaseBill != vPB.FooterFromPurchaseBill then',
    '    						:P152_FooterFromPurchaseBill := vPB.FooterFromPurchaseBill;',
    '    						--clear_message;',
    '    						--message(''Bill already passed at least once. So value of Footer From Purchase Bill must be same as last time.'');',
    '                            raise_application_error(-20000,''Bill already passed at least once. So value of Footer From Purchase Bill must be same as last time.'');',
    '    				end if;',
    '    		end if;',
    '    		close cPB;',
    '    end;',
    '',
    '    if :P152_FooterFromPurchaseBill = ''YES'' then',
    '    		declare',
    '    				cursor cPB is',
    '    						select ',
    '    							a.ItemWiseFooter',
    '    						from PurchaseBill a',
    '    						where a.TNO = :P152_PurchaseBillTNO',
    '    				;',
    '    				vPB cPB%ROWTYPE;',
    '    		begin',
    '    				open cPB;',
    '    				fetch cPB into vPB;',
    '    				if cPB%FOUND then',
    '    						:P152_ItemWiseFooter := vPB.ItemWiseFooter;',
    '    				end if;',
    '    				close cPB;',
    '    		end;',
    '    end if;',
    '   ',
    '',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604542545982679974)
,p_name=>'Check FOOTERFROMPURCHASEBILL'
,p_static_id=>'check-footerfrompurchasebill'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_FOOTERFROMPURCHASEBILL'
,p_condition_element=>'P152_FOOTERFROMPURCHASEBILL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605318885889850225)
,p_event_id=>wwv_flow_imp.id(604542545982679974)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P152_FOOTERFROMPURCHASEBILL,P152_FOOTERAFTERQUALITY',
  'items_to_submit', 'P152_FOOTERFROMPURCHASEBILL,P152_PURCHASEBILLTNO,P152_ITEMWISEFOOTER',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    '',
    'begin',
    '',
    '/*',
    '    if :P152_FooterFromPurchaseBill = ''YES'' then',
    '    				select',
    '    						count(a.TNO) into tmp',
    '    				from PurchaseBillGRNDetail a, GRN b, FreightType c',
    '    				where a.TNO = :P152_PurchaseBillTNo',
    '    						and a.GRNTNO =b.TNo						',
    '    						and b.FreightTypeCode = c.FreightTypeCode',
    '    						and c.IsFreightRequired = ''YES''',
    '    				;',
    '    				if nvl(tmp, 0) > 0 then',
    '    						--message(''Transportation will be paid by Freight or FreightBill Module.'');',
    '    						--message(''Transportation will be paid by Freight or FreightBill Module.'');',
    '                            raise_application_error(-20000 , ''Transportation will be paid by Freight or FreightBill Module.'');',
    '    						:P152_FooterFromPurchaseBill := ''NO'';',
    '    				end if;',
    '    end if;',
    ' */',
    '    ------------------------------------------------------',
    '    declare',
    '    		cursor cPB is',
    '    				select',
    '    						a.PurchaseBillTNo,',
    '    						a.FooterFromPurchaseBill',
    '    				from PBPass a',
    '    				where a.PurchaseBillTNo = :P152_PurchaseBillTNo',
    '    		;',
    '    		vPB cPB%ROWTYPE;',
    '    begin',
    '    		open cPB;',
    '    		fetch cPB into vPB;',
    '    		if cPB%FOUND then',
    '    				if :P152_FooterFromPurchaseBill != vPB.FooterFromPurchaseBill then',
    '    						:P152_FooterFromPurchaseBill := vPB.FooterFromPurchaseBill;',
    '    						--clear_message;',
    '    						--message(''Bill already passed at least once. So value of Footer From Purchase Bill must be same as last time.'');',
    '                            raise_application_error(-20000 , ''Bill already passed at least once. So value of Footer From Purchase Bill must be same as last time.'');',
    '    				end if;',
    '    		end if;',
    '    		close cPB;',
    '    end;',
    '',
    '    if :P152_FooterFromPurchaseBill = ''YES'' then',
    '    		declare',
    '    				cursor cPB is',
    '    						select ',
    '    							a.ItemWiseFooter',
    '    						from PurchaseBill a',
    '    						where a.TNO = :P152_PurchaseBillTNO',
    '    				;',
    '    				vPB cPB%ROWTYPE;',
    '    		begin',
    '    				open cPB;',
    '    				fetch cPB into vPB;',
    '    				if cPB%FOUND then',
    '    						:P152_ItemWiseFooter := vPB.ItemWiseFooter;',
    '    				end if;',
    '    				close cPB;',
    '    		end;',
    '    end if;',
    '',
    '    if :P152_FooterFromPurchaseBill = ''YES'' then',
    '		:P152_FooterAfterQuality := ''NO'';',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447355340331243100)
,p_name=>'Check rate'
,p_static_id=>'check-rate'
,p_event_sequence=>370
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447355424546243101)
,p_event_id=>wwv_flow_imp.id(447355340331243100)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'RATE',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P152_PURCHASEBILLTNO,RATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    prate number;',
    'begin',
    '        /* select decode(d.rate , null , b.rate , d.rate) into prate',
    '        from purchaseorder a , purchaseorderdetail b , poamendment c , poamendmentdetail d',
    '        where a.tno = b.tno',
    '        and a.tno = c.purchaseordertno(+)',
    '        and c.tno = d.tno(+)',
    '        and b.itemcode = d.itemcode(+)',
    '        and b.itemspecificationcode = d.itemspecificationcode(+)',
    '        and b.itemcode = :ITEMCODE',
    '        and b.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '        and a.tno IN (select purchasEordertno from purchasebill where tno = :P152_PURCHASEBILLTNO);  */ ',
    '',
    '        select',
    '        max(nvl(getpoamendmentrate(a.tno , trunc(PARTYBILLDATE) , b.itemcode , b.itemspecificationcode),b.rate)) ',
    '        into prate',
    '        from purchaseorder a , purchaseorderdetail b , purchasebill c ',
    '        where a.tno = b.tno',
    '        and a.tno = c.purchaseordertno',
    '        and c.purchaseordertno = :P152_PURCHASEBILLTNO;',
    '',
    '        IF :RATE > prate then  ',
    '            :RATE := prate;',
    '            raise_application_error(-20000,''Entered Rate is not matching with PO rate.'');',
    '        end if;',
    '',
    '    ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503410179927376929)
,p_event_id=>wwv_flow_imp.id(447355340331243100)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RATE',
  'plsql_expression', ':rate',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447355887837243106)
,p_event_id=>wwv_flow_imp.id(447355340331243100)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE',
  'sql_query', 'select nvl(:QUANTITY1,0)*nvl(:RATE,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602350587197277342)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602350531205277341)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602350722947277343)
,p_event_id=>wwv_flow_imp.id(602350587197277342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602261923634037833)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602350884098277345)
,p_name=>'Close1'
,p_static_id=>'close-2'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602350748331277344)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602350957347277346)
,p_event_id=>wwv_flow_imp.id(602350884098277345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602264427724037858)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499822720385593200)
,p_name=>'delete unsaved'
,p_static_id=>'delete-unsaved'
,p_event_sequence=>620
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499822862474593201)
,p_event_id=>wwv_flow_imp.id(499822720385593200)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PBPASSDETAIL a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P152_TNO;',
    '',
    'delete from PBPASSDETAILGRN a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPASSDETAILFOOTER a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    'delete from PBPASSTDSDETAIL a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPASSPAIDINADVANCE a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPassTDSDeductedInAdvance a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602148576008696429)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602124481498618821)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457097511038425721)
,p_event_id=>wwv_flow_imp.id(602148576008696429)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P152_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602149045032696429)
,p_event_id=>wwv_flow_imp.id(602148576008696429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PBPASSDETAIL a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPASSDETAILGRN a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPASSDETAILFOOTER a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    'delete from PBPASSTDSDETAIL a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPASSPAIDINADVANCE a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '',
    'delete from PBPassTDSDeductedInAdvance a',
    '    where not exists (',
    '        select 1 from pbpass  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P152_TNO;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602149812468697780)
,p_event_id=>wwv_flow_imp.id(602148576008696429)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P152_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P152_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602130858613632915)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602131758302632918)
,p_event_id=>wwv_flow_imp.id(602130858613632915)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602124858507618823)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602132325453632918)
,p_event_id=>wwv_flow_imp.id(602130858613632915)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602124858507618823)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P152_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(448073948848731906)
,p_event_id=>wwv_flow_imp.id(602130858613632915)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602124858507618823)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  TMP NUMBER;',
'  TMP1 NUMBER;',
'BEGIN',
'   SELECT COUNT(*) INTO TMP FROM VOUCHER WHERE MODULETNO = :P152_TNO;',
'   IF NVL(TMP,0) > 0 then',
'        return true;',
'   end if;',
'   select count(*) into tmp1',
'   from pbpassdetailgrn a, stock b',
'   where a.grntno = b.grntno',
'     and a.tno = :P152_TNO',
'     and nvl(b.usedstockquantity1,0) > 0 ;',
'    if nvl(tmp1,0) > 0 then',
'        return true;',
'    end if;',
'    ----',
'    SELECT COUNT(*) INTO TMP FROM DEBITNOTE WHERE MODULETNO = :P152_TNO;',
'   IF NVL(TMP,0) > 0 then',
'        return true;',
'   end if;',
'END;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602131300356632916)
,p_event_id=>wwv_flow_imp.id(602130858613632915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602124858507618823)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602136120938639144)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602137041174639145)
,p_event_id=>wwv_flow_imp.id(602136120938639144)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602136522436639145)
,p_event_id=>wwv_flow_imp.id(602136120938639144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602132707361634291)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602134140962634294)
,p_event_id=>wwv_flow_imp.id(602132707361634291)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602125320650618823)
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
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602133558096634294)
,p_event_id=>wwv_flow_imp.id(602132707361634291)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602125320650618823)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P152_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(448073790746731905)
,p_event_id=>wwv_flow_imp.id(602132707361634291)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602125320650618823)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  TMP NUMBER;',
'  TMP1 NUMBER;',
'BEGIN',
'   SELECT COUNT(*) INTO TMP FROM VOUCHER WHERE MODULETNO = :P152_TNO;',
'   IF NVL(TMP,0) > 0 then',
'        return true;',
'   end if;',
'   --- Stock',
'   select count(*) into tmp1',
'   from pbpassdetailgrn a, stock b',
'   where a.grntno = b.grntno',
'     and a.tno = :P152_TNO',
'     and nvl(b.usedstockquantity1,0) > 0 ;',
'    if nvl(tmp1,0) > 0 then',
'        return true;',
'    end if;',
'    ----',
'    SELECT COUNT(*) INTO TMP FROM DEBITNOTE WHERE MODULETNO = :P152_TNO;',
'   IF NVL(TMP,0) > 0 then',
'        return true;',
'   end if;',
'END;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602133099237634294)
,p_event_id=>wwv_flow_imp.id(602132707361634291)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602125320650618823)
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
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602134545153635432)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602135436679635432)
,p_event_id=>wwv_flow_imp.id(602134545153635432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602134925457635432)
,p_event_id=>wwv_flow_imp.id(602134545153635432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602144754337692567)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602127708604618824)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602147738237692572)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602127708604618824)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602147199199692572)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(602127708604618824)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P152_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602145667842692569)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_STATUS,P152_PBPASSDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P152_TNO,:P152_STATUS);',
    'if :P152_STATUS = ''ACTIVE'' then',
    '    postpbpass(:P152_TNO , :P152_PBPASSDATE);',
    'end if;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602146229097692569)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P152_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602148185808692574)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602146717708692569)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1057267710045261674)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602145243224692567)
,p_event_id=>wwv_flow_imp.id(602144754337692567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602129123230631785)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602129460527631787)
,p_event_id=>wwv_flow_imp.id(602129123230631785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602129990526631791)
,p_event_id=>wwv_flow_imp.id(602129123230631785)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602130518317631791)
,p_event_id=>wwv_flow_imp.id(602129123230631785)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602142990953689069)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602126869019618823)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602143861104689070)
,p_event_id=>wwv_flow_imp.id(602142990953689069)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_COMPANYCODE,P152_PURCHASEORDERNO',
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
 p_id=>wwv_flow_imp.id(602144358899689070)
,p_event_id=>wwv_flow_imp.id(602142990953689069)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1057267710045261674)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602143418356689070)
,p_event_id=>wwv_flow_imp.id(602142990953689069)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577953498189219053)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602126140982618823)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577953547946219054)
,p_event_id=>wwv_flow_imp.id(577953498189219053)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602352069442277357)
,p_name=>'getCurrencyValue and other details'
,p_static_id=>'getcurrencyvalue-and-other-details'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PURCHASEBILLTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602352171440277358)
,p_event_id=>wwv_flow_imp.id(602352069442277357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_CURRENCYUNITCODE,P152_TRANSACTIONTYPECODE,P152_NATUREOFSUPPLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PURCHASEBILLTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CURRENCYUNITCODE , TRANSACTIONTYPECODE , NATUREOFSUPPLYCODE from PurchaseBill  ',
    'where tno = :P152_PURCHASEBILLTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(608140255833356467)
,p_name=>'Go to Purhase Bill'
,p_static_id=>'go-to-purhase-bill'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PURCHASEBILLTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(608140379567356468)
,p_event_id=>wwv_flow_imp.id(608140255833356467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P152_PURCHASEBILLTNO'').getValue();',
    'var y = ''152'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P152_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:143:#SESSION#::NO:RP,143:P143_TNO,P143_CALLEDFROMPAGE,P143_FORMSTATUS,P143_CALLEDFROMTNO:#P143_TNO#,#P143_CALLEDFROMPAGE#,#P143_FORMSTATUS#,#P143_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P143_TNO#", x);',
    'url = url.replace("#P143_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P143_FORMSTATUS#", z);',
    'url = url.replace("#P143_CALLEDFROMTNO#", x1);',
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
 p_id=>wwv_flow_imp.id(444563088068322531)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>360
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444563191164322532)
,p_event_id=>wwv_flow_imp.id(444563088068322531)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602351243904277348)
,p_name=>'Insert Into Detail'
,p_static_id=>'insert-into-detail'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602351052084277347)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602351281451277349)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_PURCHASEBILLTNO,P152_DOCTYPECODE,P152_PBPASSONCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    '    tOrderUnitRate Number;',
    '	tRate Number;',
    '	tisprorata number;	',
    '    tmp number:=0;',
    '    tpartybilldate date;',
    '    Q1 Number;',
    '    Q2 Number;',
    '    tsno number;',
    'Begin',
    '	Delete from PBPassDetail a where a.TNo = :P152_TNO;',
    '   ',
    '    --delete from PBPASSDETAILGRN where tno = :P152_TNO;',
    '    --delete from PBPASSDETAILFOOTER where tno = :P152_TNO;',
    '    ',
    '    select partybilldate into tpartybilldate from purchasebill a where a.tno = :P152_PURCHASEBILLTNO;',
    '    for vPB in (select',
    '            a.TNO,',
    '            a.SNO,',
    '            a.SERIALNO,',
    '            a.PURCHASEORDERTNO,',
    '            a.ITEMCODE,',
    '            a.ITEMSPECIFICATIONCODE,',
    '            a.DESCRIPTION,',
    '            a.QUANTITY1 as PurchaseBillQuantity1,',
    '            a.QUANTITY2 as PurchaseBillQuantity2,',
    '            nvl(getpoamendmentrate(c.tno , trunc(i.PARTYBILLDATE) , a.itemcode , a.itemspecificationcode),j.rate) Rate,',
    '            a.RateMeasuringUnitCode,',
    '            a.rounding,',
    '            i.FreightAdvanceAmount,',
    '            d.itemclassificationcode,',
    '            a.footeramount,',
    '            e.multiplyingfactor',
    '    from 	PurchaseBillDetail a,',
    '                PurchaseOrder c,									',
    '                Item d, ',
    '                ItemSpecification e, ',
    '                MeasuringUnit f, ',
    '                MeasuringUnit g,',
    '                MeasuringUnit h	,',
    '                PurchaseBill i	,',
    '                purchaseorderdetail j						',
    '    where a.TNo = :P152_PURCHASEBILLTNO',
    '            and a.PurchaseOrderTNO = c.TNo(+)',
    '            and a.ItemCode = d.ItemCode',
    '            and a.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and d.TNO = e.TNo',
    '            and a.RateMeasuringUnitcode = f.MeasuringUnitCode(+)',
    '            and d.MeasuringUnitCode1 = g.MeasuringUnitCode(+)',
    '            and d.MeasuringUnitCode2 = h.MeasuringUnitCode(+)',
    '            and a.tno = i.tno',
    '            and c.tno = j.tno',
    '            and a.ItemCode = j.ItemCode',
    '            and a.ItemSpecificationCode = j.ItemSpecificationCode)',
    '    loop',
    '       ',
    'tRate := vPB.rate;',
    '',
    '',
    'select  decode(:P152_PBPASSONCODE,''ACCEPTED'',sum(a.AcceptedQuantity1 + nvl(a.JoinAcceptedQuantity1, 0)),',
    '     ''RECEIVED'',sum(a.ReceivedQuantity1),',
    '     ''CHALAN'',sum(a.ChalanQuantity1),',
    '     ''MINIMUM'',LEAST( sum(a.ChalanQuantity1), sum(a.ReceivedQuantity1), sum( nvl(a.AcceptedQuantity1,0) + nvl(a.JoinAcceptedQuantity1,0) )),',
    '     ''MAXIMUM'',GREATEST( sum(a.ChalanQuantity1), sum(a.ReceivedQuantity1), sum( nvl(a.AcceptedQuantity1,0) + nvl(a.JoinAcceptedQuantity1,0) )),',
    '     sum(a.AcceptedQuantity1 + nvl(a.JoinAcceptedQuantity1, 0)))  ,',
    'decode(:P152_PBPASSONCODE,''ACCEPTED'',sum(a.AcceptedQuantity2 + nvl(a.JoinAcceptedQuantity2, 0)),',
    '     ''RECEIVED'',sum(a.ReceivedQuantity2),',
    '     ''CHALAN'',sum(a.ChalanQuantity2),',
    '     ''MINIMUM'',LEAST( sum(a.ChalanQuantity2), sum(a.ReceivedQuantity2), sum( nvl(a.AcceptedQuantity2,0) + nvl(a.JoinAcceptedQuantity2,0) )),',
    '     ''MAXIMUM'',GREATEST( sum(a.ChalanQuantity2), sum(a.ReceivedQuantity2), sum( nvl(a.AcceptedQuantity2,0) + nvl(a.JoinAcceptedQuantity2,0) )),',
    '     sum(a.AcceptedQuantity2 + nvl(a.JoinAcceptedQuantity2, 0))) ',
    '     into Q1 , Q2',
    'from grndetail a, PurchaseBillDetail b, PurchaseBillGRNDetail c',
    'where a.PurchaseOrderTNo = b.PurchaseOrderTNo',
    'and a.ItemCode = b.ItemCode',
    'and a.ItemSpecificationCode = b.ItemSpecificationCode',
    'and b.TNo = c.TNo',
    'and b.SNo = c.SNo',
    'and a.tno = c.grntno',
    'and c.TNo = :P152_PURCHASEBILLTNO',
    'and a.ItemCode = vPB.ItemCode',
    'and a.ItemSpecificationCode = vPB.ItemSpecificationCode',
    'and a.PurchaseOrderTNO = vPB.PurchaseOrderTNo',
    'and b.SNo = vPB.SNo;     ',
    '',
    '        insert into pbpassdetail(',
    'tno,',
    'sno,',
    'PURCHASEORDERTNO,',
    'ITEMCODE,',
    'ITEMSPECIFICATIONCODE,',
    'DESCRIPTION,',
    'Quantity1,',
    'Quantity2,',
    'rate,',
    'RATEMEASURINGUNITCODE,',
    'amount,',
    'footeramount,',
    'totalamount)',
    'values',
    '(:P152_TNO,',
    'vPB.sno,',
    'vPB.PURCHASEORDERTNO,',
    'vPB.ITEMCODE,',
    'vPB.ITEMSPECIFICATIONCODE,',
    'vPB.DESCRIPTION,',
    'Q1,',
    'nvl(Q2,q1* nvl(vpb.multiplyingfactor,0)),',
    'trate,',
    'vPB.RateMeasuringUnitCode,',
    'trate*Q1,',
    'vPB.footeramount,',
    '(trate*Q1)+vPB.footeramount',
    ');',
    '    end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602351572072277352)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_PURCHASEBILLTNO,P152_FOOTERFROMPURCHASEBILL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '',
    '    delete from PBPASSDetailFooter where tno = :P152_TNO;',
    '',
    '    insert into PBPASSDetailFooter(TNo, SNo, SerialNo, FooterHeadCode, FooterPercent, FooterValue, TaxFormCode,Legendscode, FooterNatureCode) ',
    '    			select',
    '    					:P152_TNO,',
    '    					b.SNo,',
    '    					a.SerialNo,',
    '    					a.FooterHeadCode,',
    '    					a.FooterPercent,',
    '    					a.FooterValue,',
    '    					a.TaxFormCode,',
    '    					a.legendscode,',
    '    					''IG''				',
    '    			from PurchaseBillDetailFooter a, PurchaseBillDetail b',
    '    			where a.TNO = b.TNo',
    '    					and a.SNo = b.SNo',
    '    					and a.TNo = :P152_PURCHASEBILLTNO;',
    '',
    '    if nvl(:P152_FOOTERFROMPURCHASEBILL,''NO'') = ''NO'' then ',
    '',
    '        for i in (select sno , amount from PBPASSDetail where tno = :P152_TNO)',
    '        loop',
    '            update PBPASSDetailFooter set footervalue = i.amount * (FOOTERPERCENT/100)',
    '            where tno = :P152_TNO',
    '            and sno = i.sno;',
    '',
    '        end loop;',
    '',
    '        for j in (select sno , sum(FOOTERVALUE) as sumfooter from PBPASSDetailFooter group by sno)',
    '        loop',
    '            update PBPASSDetail set FOOTERAMOUNT = j.sumfooter , TOTALAMOUNT = AMOUNT + j.sumfooter',
    '            where tno = :P152_TNO',
    '            and sno = j.sno  ;',
    '',
    '        end loop;',
    '',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602351871723277355)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_PURCHASEBILLTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PBPASSDETAILGRN where tno = :P152_TNO;',
    'insert into PBPASSDETAILGRN(',
    '    tno,',
    '    sno,',
    '    grntno,',
    '    grnsno',
    ')',
    'select ',
    '    :P152_TNO, ',
    '    a.sno , ',
    '    b.GRNTNO, ',
    '    b.grnsno ',
    'from PurchaseBillDetail a, PURCHASEBILLGRNDETAIL b',
    '    where a.tno = b.tno',
    '    and a.tno = :P152_PURCHASEBILLTNO',
    '    and a.sno = b.sno;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501636577962793202)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-4'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_PURCHASEBILLTNO,P152_FOOTERFROMPURCHASEBILL,P152_PBPASSONCODE',
  'language', 'PLSQL',
  'plsql_code', 'apex_createpbpassfrompbill;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602351353360277350)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(601383467526650840)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602351734144277353)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(601383467526650840)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605319592901850232)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602264427724037858)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602352012590277356)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602261923634037833)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602352376498277360)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_SUMOFAMOUNT,P152_SUMOFFOOTERAMOUNT,P152_PBPASSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(nvl(amount,0)) , sum(nvl(footeramount,0)) , sum(nvl(totalamount,0))',
    'from PBPASSDETAIL where tno = :P152_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198439629312447978)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_name=>'set P152_PBPASSAMOUN'
,p_static_id=>'set-p152-pbpassamoun'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PBPASSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT',
  'sql_query', ' select round(:P152_PBPASSAMOUNT,0) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198439571224447977)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'set P152_PBPASSAMOUNTBEFOREROUND'
,p_static_id=>'set-p152-pbpassamountbeforeround'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PBPASSAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT',
  'plsql_expression', ':P152_PBPASSAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198439746015447979)
,p_event_id=>wwv_flow_imp.id(602351243904277348)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_name=>'set P152_ROUNDOFF'
,p_static_id=>'set-p152-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT,P152_PBPASSAMOUNTBEFOREROUND',
  'sql_query', 'select :P152_PBPASSAMOUNT - :P152_PBPASSAMOUNTBEFOREROUND from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P152_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499824634565593219)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>630
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_REVERSECHARGENO,P152_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499824680321593220)
,p_event_id=>wwv_flow_imp.id(499824634565593219)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    'apex.region( "Detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499824774131593221)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>640
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499824922637593222)
,p_event_id=>wwv_flow_imp.id(499824774131593221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ( $(''#ITEMCODE'').val() === '''' ){',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();',
    '    }')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602350291252277339)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602392805943508618)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602350379370277340)
,p_event_id=>wwv_flow_imp.id(602350291252277339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1501751158967552484)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199885928774537063)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>740
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_ROUNDOFF'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199886052651537064)
,p_event_id=>wwv_flow_imp.id(199885928774537063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PBPASSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNTBEFOREROUND,P152_ROUNDOFF',
  'plsql_expression', 'nvl(:P152_PBPASSAMOUNTBEFOREROUND,0) + nvl(:P152_ROUNDOFF,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(608139602919356460)
,p_name=>'Open Debit Note Page'
,p_static_id=>'open-debit-note-page'
,p_event_sequence=>340
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_DNNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(608139716290356461)
,p_event_id=>wwv_flow_imp.id(608139602919356460)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P152_DNTNO'').getValue();',
    'var y = ''152'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P152_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:159:#SESSION#::NO:RP,159:P159_TNO,P159_CALLEDFROMPAGE,P159_FORMSTATUS,P159_CALLEDFROMTNO:#P159_TNO#,#P159_CALLEDFROMPAGE#,#P159_FORMSTATUS#,#P159_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P159_TNO#", x);',
    'url = url.replace("#P159_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P159_FORMSTATUS#", z);',
    'url = url.replace("#P159_CALLEDFROMTNO#", x1);',
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
 p_id=>wwv_flow_imp.id(605321407188850250)
,p_name=>'Open Debit Note Vr'
,p_static_id=>'open-debit-note-vr'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_DEBITNOTENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605321534981850251)
,p_event_id=>wwv_flow_imp.id(605321407188850250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P152_DEBITNOTETNO'').getValue();',
    'var y = ''152'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P152_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:156:#SESSION#::NO:RP,156:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS,P156_CALLEDFROMTNO:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#,#P156_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P156_TNO#", x);',
    'url = url.replace("#P156_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P156_FORMSTATUS#", z);',
    'url = url.replace("#P156_CALLEDFROMTNO#", x1);',
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
 p_id=>wwv_flow_imp.id(454408301932940814)
,p_name=>'Open Paid In Advance'
,p_static_id=>'open-paid-in-advance'
,p_event_sequence=>560
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(454408171220940813)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454408535910940816)
,p_event_id=>wwv_flow_imp.id(454408301932940814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_PARTYCODE,P152_LOCATIONCODE,P152_PBPASSDATE,P152_PURCHASEBILLTNO,P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'p_paidinadvance number;',
    'begin',
    'delete from pbpasspaidinadvance where tno = :P152_TNO;',
    'begin',
    'SELECT',
    'sum(paidinadvance) into p_paidinadvance',
    'FROM',
    'pbpass a',
    'WHERE',
    'a.purchasebilltno IN (',
    '    SELECT',
    '        tno',
    '    FROM',
    '        purchasebill',
    '    WHERE',
    '        purchaseordertno IN (',
    '            SELECT',
    '                purchaseordertno',
    '            FROM',
    '                purchasebill',
    '            WHERE',
    '                tno = :P152_PURCHASEBILLTNO',
    '        )',
    ')',
    'AND getdocumentstatuscode(''PBPASS'', a.tno) = ''ACTIVE''',
    'AND EXISTS (',
    '    SELECT',
    '        1',
    '    FROM',
    '        voucher aa',
    '    WHERE',
    '        aa.moduletno = a.tno',
    ')',
    'AND a.paidinadvance > 0;',
    '',
    'exception when others then ',
    'null;',
    'end;',
    '',
    'for i in ( select distinct voucherno , voucherdate , modulecode , moduletno , tno , sno , ',
    '                paidinadvance     ',
    'from (',
    'select',
    '	b.VoucherNo,',
    '	b.VoucherDate,',
    '	b.ModuleCode,',
    '	b.ModuleTNo,',
    '	a.TNo,',
    '	a.SNo,',
    '	e.TDSDeductedOn - nvl(e.AdvanceAdjustedWithBill, 0)  as PaidInAdvance',
    'from VoucherDetail a, Voucher b, (',
    '	select ',
    '			aa.DrVoucherTNo as TNo,',
    '			aa.AccountCode,',
    '			sum(aa.Amount) as Amount',
    '	from DrCrAllocation aa',
    '	group by aa.DrVoucherTNo,',
    '			aa.AccountCode',
    ') c, (',
    '	select ',
    '			aa.VoucherTNo,',
    '			sum(aa.Amount) as Amount',
    '	from PBPassPaidInAdvance aa, PBPass bb, PurchaseBill cc ',
    '	where aa.TNo = bb.TNo',
    '			and bb.PurchaseBillTno = cc.TNo',
    '			and cc.PartyCode = :P152_PartyCode',
    '			and not exists(',
    '					select ',
    '							aaa.TNo',
    '					from Voucher aaa ',
    '					where aaa.ModuleTNo = aa.TNo',
    '			)',
    '	group by aa.VoucherTNo		',
    ') d, AccountOpeningTDSDeducted e ',
    'where a.TNo = b.TNo',
    '	and a.TNo = c.TNo(+)',
    '	and a.AccountCode = c.AccountCode(+)',
    '	and a.ModuleTNO = e.TNo',
    '	--',
    '	and a.TNo = d.VoucherTNo(+)',
    '	--',
    '	and a.AccountCode = :P152_PartyCode',
    '	and a.LocationCode = :P152_LocationCode',
    '	and a.Amount < 0',
    '	and ( -1 * a.Amount)  - nvl(c.Amount, 0) - nvl(d.Amount, 0) > 0',
    '	and e.TDSDeductedOn - nvl(e.AdvanceAdjustedWithBill, 0) > 0',
    '	and b.VoucherNO = ''OPENING''',
    '	-------------------------------------- --',
    '	-- date27-nov-2020',
    '	and b.VoucherDate <= :P152_PBPassDate',
    '	-------------------------------------- --',
    '-----------------------------------',
    'union all',
    'select',
    '	b.VoucherNo,',
    '	b.VoucherDate,',
    '	b.ModuleCode,',
    '	b.ModuleTNo,',
    '	a.TNo,',
    '	a.SNo,',
    '	( -1 * a.Amount)  - nvl(c.Amount, 0) - nvl(d.Amount, 0) as PaidInAdvance',
    'from VoucherDetail a, Voucher b, (',
    '	select ',
    '			aa.DrVoucherTNo as TNo,',
    '			aa.AccountCode,',
    '			sum(aa.Amount) as Amount',
    '	from DrCrAllocation aa',
    '	group by aa.DrVoucherTNo,',
    '			aa.AccountCode',
    ') c, (',
    '	select ',
    '			aa.VoucherTNo,',
    '			sum(aa.Amount) as Amount',
    '	from PBPassPaidInAdvance aa, PBPass bb, PurchaseBill cc ',
    '	where aa.TNo = bb.TNo',
    '			and bb.PurchaseBillTno = cc.TNo',
    '			and cc.PartyCode = :P152_PartyCode',
    '			and not exists(',
    '					select ',
    '							aaa.TNo',
    '					from Voucher aaa ',
    '					where aaa.ModuleTNo = aa.TNo',
    '			)',
    '	group by aa.VoucherTNo		',
    ') d',
    'where a.TNo = b.TNo',
    '	and a.TNo = c.TNo(+)',
    '	and a.AccountCode = c.AccountCode(+)',
    '	',
    '	and a.TNo = d.VoucherTNo(+)',
    '	',
    '	and a.AccountCode = :P152_PartyCode',
    '	and a.LocationCode = :P152_LocationCode',
    '	and a.Amount < 0',
    '	and ( -1 * a.Amount)  - nvl(c.Amount, 0) - nvl(d.Amount, 0) > 0',
    '	',
    '	and exists(',
    '			select ',
    '					aa.VoucherTNo',
    '			from PaymentAdvicePurchaseOrderBill aa',
    '			where aa.VoucherTNo = a.TNo',
    '					and aa.PurchaseBillTNo = :P152_PurchaseBillTNo',
    '	)',
    '	---------------------------------------------------------------------------------------- --',
    '	and b.VoucherNO != ''OPENING''',
    '	',
    '	and b.VoucherDate <= :P152_PBPassDate',
    ')',
    'order by 2, 1',
    ')',
    'loop',
    '--raise_application_error(-20000,p_paidinadvance);',
    'insert into pbpasspaidinadvance',
    '(',
    'tno,',
    'sno,',
    'vouchertno,',
    'vouchersno,',
    'amount',
    ')',
    'values ',
    '(',
    ':P152_TNO,',
    'globaltno.nextval,',
    'i.tno,',
    'i.sno,',
    'i.paidinadvance - nvl(p_paidinadvance,0)',
    ');',
    'end loop;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454408384838940815)
,p_event_id=>wwv_flow_imp.id(454408301932940814)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(454406770486940799)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454408648279940817)
,p_event_id=>wwv_flow_imp.id(454408301932940814)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(454406770486940799)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455357191047181894)
,p_name=>'Open Paid In Advance_1'
,p_static_id=>'open-paid-in-advance-2'
,p_event_sequence=>570
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(455357159460181893)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455357280920181895)
,p_event_id=>wwv_flow_imp.id(455357191047181894)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_PARTYCODE,P152_LOCATIONCODE,P152_PBPASSDATE,P152_PURCHASEBILLTNO,P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PBPassTDSDeductedInAdvance where tno = :P152_TNO;',
    '',
    'for i in ( select ',
    '            c.VoucherNO,',
    '            c.VoucherDate,',
    '            c.TNo,',
    '            g.SNo,',
    '            f.PurchaseOrderNo,',
    '            f.PurchaseOrderDate,',
    '            f.TNo as PurchaseOrderTNo,',
    '            b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) as DeductedInAdvance',
    '            ----------------------------- --',
    'from PaymentAdvice a, PaymentAdviceReference b, Voucher c, (',
    '                select ',
    '                        aa.PurchaseOrderTNo,',
    '                        sum(aa.DeductedInAdvance) as AdvanceAdjustedWithBill',
    '                from PBPassTDSDeductedInAdvance aa',
    '                group by aa.PurchaseOrderTNo',
    '        ',
    '        ) d, PurchaseOrder f,',
    '        VoucherDetail g',
    'where a.TNo = b.TNo ',
    '        and a.TNO = c.ModuleTNO',
    '        and b.ReferenceModuleTNo = d.PurchaseOrderTNo(+)',
    '        and b.ReferenceMOduleTNO = f.TNO',
    '        --',
    '        and c.TNO = g.TNo',
    '        and a.PartyCode = g.AccountCode',
    '        and g.Amount < 0',
    '        --',
    '        and a.PartyCode = :P152_PartyCode',
    '        and a.CompanyCode = :global_CompanyCode',
    '        and c.VoucherDate <= :P152_PBPassDate',
    '        and exists(',
    '                select ',
    '                        aa.TNo',
    '                from PurchaseBillDetail aa',
    '                where aa.PurchaseOrderTNo = b.ReferenceMOduleTNO ',
    '                and aa.TNo = :P152_PurchaseBillTNo',
    '        ',
    '        )',
    '',
    '        and b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) > 0',
    '        ------------------------------- --',
    '        and a.AmountDr > NVL(GETALLOCATEDAMOUNT(A.TNO , a.PartyCode, ''01-APR-2001'', TRUNC(SYSDATE)), 0)',
    '        and a.AmountDr > nvl(a.TDSAdvanceAdjustedWithBill, 0)',
    'union all ',
    '',
    'select ',
    '            c.VoucherNO,',
    '            c.VoucherDate,',
    '            c.TNo,',
    '            g.SNo,',
    '            f.PurchaseOrderNo,',
    '            f.PurchaseOrderDate,',
    '            f.TNo as PurchaseOrderTNo,',
    '            b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) as DeductedInAdvance',
    '            ----------------------------- --',
    'from PaymentAdvice a, PaymentAdviceReference b, voucher c1, Voucher c, (',
    '                select ',
    '                        aa.PurchaseOrderTNo,',
    '                        sum(aa.DeductedInAdvance) as AdvanceAdjustedWithBill',
    '                from PBPassTDSDeductedInAdvance aa',
    '                group by aa.PurchaseOrderTNo',
    '        ',
    '        ) d, PurchaseOrder f,',
    '        VoucherDetail g',
    'where a.TNo = b.TNo ',
    '        and a.TNO = c1.ModuleTNO',
    '        and c1.TNO = c.ModuleTNO',
    '        and b.ReferenceModuleTNo = d.PurchaseOrderTNo(+)',
    '        and b.ReferenceMOduleTNO = f.TNO',
    '        and c.TNO = g.TNo',
    '        and a.PartyCode = g.AccountCode',
    '        and g.Amount < 0',
    '        and a.PartyCode = :P152_PartyCode',
    '        and a.CompanyCode = :global_CompanyCode',
    '        and c.VoucherDate <= :P152_PBPassDate',
    '        and exists(',
    '                select ',
    '                        aa.TNo',
    '                from PurchaseBillDetail aa',
    '                where aa.PurchaseOrderTNo = b.ReferenceMOduleTNO ',
    '                and aa.TNo = :P152_PurchaseBillTNo',
    '        ',
    '        )',
    '',
    '        and b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) > 0',
    '        and a.AmountDr > NVL(GETALLOCATEDAMOUNT(A.TNO , a.PartyCode, ''01-APR-2001'', TRUNC(SYSDATE)), 0)',
    '        and a.AmountDr > nvl(a.TDSAdvanceAdjustedWithBill, 0)',
    '---------------------------------- --',
    'order by 2,1',
    ')',
    'loop',
    'insert into PBPassTDSDeductedInAdvance',
    '(',
    '    TNO,',
    '    SNO,',
    '    VOUCHERTDSDEDUCTEDTNO,',
    '    DEDUCTEDINADVANCE,',
    '    VOUCHERTDSDEDUCTEDSNO,',
    '    PURCHASEORDERTNO',
    ')',
    'values ',
    '(',
    '    :P152_TNO,',
    '    globaltno.nextval,',
    '    i.tno,',
    '    i.DeductedInAdvance,',
    '    i.sno,',
    '    i.PurchaseOrderTNo',
    ');',
    'end loop;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455357547574181897)
,p_event_id=>wwv_flow_imp.id(455357191047181894)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(454409456349940825)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455357424765181896)
,p_event_id=>wwv_flow_imp.id(455357191047181894)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(454409456349940825)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(605321201650850248)
,p_name=>'Open Voucher'
,p_static_id=>'open-voucher'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_VOUCHERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605321325340850249)
,p_event_id=>wwv_flow_imp.id(605321201650850248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P152_VOUCHERTNO'').getValue();',
    'var y = ''152'';',
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
 p_id=>wwv_flow_imp.id(602141243729684899)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602126538643618823)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602142096449684903)
,p_event_id=>wwv_flow_imp.id(602141243729684899)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_TNO,P152_COMPANYCODE,P152_STATUS',
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
    '            -- if :P152_STATUS = ''ACTIVE'' then',
    '        ',
    '            --    CREATEPAYMENTADVICEFORPO(:P152_TNO);',
    '',
    '            --  end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602142572926684906)
,p_event_id=>wwv_flow_imp.id(602141243729684899)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1057267710045261674)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602141604476684903)
,p_event_id=>wwv_flow_imp.id(602141243729684899)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502777426104814732)
,p_name=>'Recalculate Amounts'
,p_static_id=>'recalculate-amounts'
,p_event_sequence=>660
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502777788645814765)
,p_event_id=>wwv_flow_imp.id(502777426104814732)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'refresh'
,p_static_id=>'refresh'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//alert(''fired'');',
    'var widget      = apex.region(''Detail'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model       = grid.model; ',
    'var gtotal = 0;',
    'var sumoffooteramount = 0;',
    'var sumofamount       = 0;',
    'var sumoftotalamount  = 0;',
    'var detailsno         = 0;',
    'var footeramount        = 0;',
    '',
    'model.forEach(function(r,index) {',
    '    try{',
    '    var record = r;',
    '    rec = record[index];',
    '',
    '     quantity1      = model.getValue(record,''QUANTITY1'');',
    '     rate           = model.getValue(record,''RATE'');',
    '',
    '    detailsno           = model.getValue(record,''SNO'');',
    '    totalamount         = 0;',
    '    ',
    '//alert(discountpercentage);',
    '    if (rate > 0)',
    '    {',
    '        amount                  = quantity1 * rate ;',
    '    }',
    '    else',
    '    {',
    '    amount                  = 0 ;',
    '    }',
    '    ',
    '// loop for footer',
    'var footerwidget      = apex.region(''FooterDetail'').widget();',
    'var footergrid        = footerwidget.interactiveGrid(''getViews'',''grid'');  ',
    'var footermodel       = footergrid.model; ',
    'var totalfooter = 0;',
    'try{',
    '',
    'footermodel.forEach(function(f,findex) {',
    '    var footerrecord = f;',
    '     footerrec = footerrecord[findex];',
    'var legends           = footermodel.getValue(footerrecord,''LEGENDSCODE'');',
    'var legendscode       = legends.v;',
    '',
    '    var footerheadcode        = footermodel.getValue(footerrecord,''FOOTERHEADCODE'');',
    '    var footerpercentage      = footermodel.getValue(footerrecord,''FOOTERPERCENT'');',
    '    var footervalue           = footermodel.getValue(footerrecord,''FOOTERVALUE'');',
    '    var footersno             = footermodel.getValue(footerrecord,''SNO'');',
    '',
    'if (footersno == detailsno){',
    ' ',
    '   // var footervalue = 0;',
    '   var footerpercent =0;',
    '     if (footerpercentage !='''' || footerpercentage !=null)',
    '       footerpercent = parseFloat(footerpercentage);',
    '',
    '    if (legendscode == ''PRA''){',
    '        footervalue = Math.round((parseFloat(amount) * parseFloat(footerpercent)) / 100) ;',
    '    } else ',
    '        if (legendscode == ''PAA''){',
    '    ',
    '            footervalue = ((parseFloat(amount) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '        } else ',
    '            if (legendscode == ''OQA''){',
    '                footervalue = ((parseFloat(quantity1) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '            } else',
    '                if (legendscode == ''OQD''){',
    '                footervalue = (-1) * ((parseFloat(quantity1) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '                }  else footervalue = footervalue;',
    '',
    '   totalfooter += parseFloat(footervalue);',
    '',
    '   footermodel.setValue(footerrecord,''FOOTERVALUE'',footervalue)',
    '',
    '} else totalfooter = parseFloat(footeramount);',
    '} ',
    '// checked sno end;',
    ')',
    '} catch (ex){}',
    '',
    '',
    'totalamount             = parseFloat(amount) + parseFloat(totalfooter);',
    '',
    'model.setValue(record,''FOOTERAMOUNT'',totalfooter);',
    '',
    'model.setValue(record,''RATE'',rate)  ; ',
    'model.setValue(record,''AMOUNT'',amount)  ; ',
    'model.setValue(record,''TOTALAMOUNT'',totalamount)  ; ',
    '',
    '   sumoffooteramount +=   totalfooter;',
    '   sumofamount       +=   amount;',
    '   sumoftotalamount  +=   totalamount;',
    '',
    'apex.item(''P152_SUMOFFOOTERAMOUNT'').setValue(sumoffooteramount);',
    'apex.item(''P152_SUMOFAMOUNT'').setValue(sumofamount);',
    'apex.item(''P152_PURCHASEORDERAMOUNT'').setValue(sumoftotalamount);',
    '    } catch(ex){}',
    '})',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502779297469814766)
,p_event_id=>wwv_flow_imp.id(502777426104814732)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set amount'
,p_static_id=>'set-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT',
  'plsql_expression', ':quantity1 * :rate',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502778344373814766)
,p_event_id=>wwv_flow_imp.id(502777426104814732)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set rate'
,p_static_id=>'set-rate'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT',
  'plsql_expression', ':RATE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502779857710814766)
,p_event_id=>wwv_flow_imp.id(502777426104814732)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set total amount'
,p_static_id=>'set-total-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT',
  'plsql_expression', '(:quantity1 * :rate) + :FOOTERAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(449340075899666809)
,p_name=>'Sep page item DF_AMOUNT'
,p_static_id=>'sep-page-item-df-amount'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449340190436666810)
,p_event_id=>wwv_flow_imp.id(449340075899666809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "AMOUNT");',
    '',
    'apex.item( "P152_DFAMOUNT" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602349536290277331)
,p_name=>'Sep page item SNO'
,p_static_id=>'sep-page-item-sno'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602349637945277332)
,p_event_id=>wwv_flow_imp.id(602349536290277331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "SNO");',
    '',
    'apex.item( "P152_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(454407981735940811)
,p_name=>'Set Advance Value and hide'
,p_static_id=>'set-advance-value-and-hide'
,p_event_sequence=>540
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(454407873294940810)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454408070840940812)
,p_event_id=>wwv_flow_imp.id(454407981735940811)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(454406770486940799)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454408850212940819)
,p_event_id=>wwv_flow_imp.id(454407981735940811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("PaidInAdvance").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("AMOUNT");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P152_PAMOUNT").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454408952939940820)
,p_event_id=>wwv_flow_imp.id(454407981735940811)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PAIDINADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PAMOUNT',
  'plsql_expression', 'nvl(:P152_PAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455356583210181888)
,p_name=>'Set Advance Value and hide_1'
,p_static_id=>'set-advance-value-and-hide-2'
,p_event_sequence=>550
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(455356566065181887)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455356954819181891)
,p_event_id=>wwv_flow_imp.id(455356583210181888)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(454409456349940825)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455356690763181889)
,p_event_id=>wwv_flow_imp.id(455356583210181888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("PBPassTDSDeductedInAdvance").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("DEDUCTEDINADVANCE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P152_DAMOUNT").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455356777184181890)
,p_event_id=>wwv_flow_imp.id(455356583210181888)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_TDSDEDUCTEDINADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_DAMOUNT',
  'plsql_expression', 'nvl(:P152_DAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(294891924893667012)
,p_name=>'set amount'
,p_static_id=>'set-amount'
,p_event_sequence=>700
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY1'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294892356979667014)
,p_event_id=>wwv_flow_imp.id(294891924893667012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY2,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P143_DFAMOUNT',
  'items_to_submit', 'TNO,SNO,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,P152_TAXINROUND',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tlegendscode varchar2(30);',
    '  tfooterheadcode varchar2(30);',
    '  tfooterpercent  number;',
    '  tfootervalue    number;',
    '  tfooteramount   number;',
    '  mfactor		  number;',
    'begin',
    '   select max(multiplyingfactor) into mfactor from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   :quantity2             := mfactor * :quantity1 ;',
    '   ',
    '   :quantity2             := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '   ',
    '  ',
    '   :amount := nvl(:QUANTITY1,0) *nvl(:RATE,0);',
    '   ---',
    '   :P143_DFAMOUNT := :amount;',
    '',
    '',
    '--raise_application_error(-20001,'' Qty2 ''||to_char(:quantity2,0)||'' d.amt ''||nvl(:DISCREPANCYAMOUNT,0)||'' r qty ''||nvl(:rejectedquantity1,0)||'' amt ''||nvl(:amount,0));',
    '',
    '',
    '   --- ',
    '     for vfooter in (',
    '	    Select * From PBPASSDETAILFOOTER a where tno = :TNO and SNO = :SNO',
    '	 ) loop',
    '	 ',
    '		--if vfooter.legendscode = ''PRA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '		--end if;',
    '        if :P152_TAXINROUND=''YES'' then',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '            tlegendscode := ''PRA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PRD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,0);',
    '',
    '		end if;',
    '',
    '		--if vfooter.legendscode = ''PAA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '		--end if;',
    '        if :P152_TAXINROUND=''NO'' then  ',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '            tlegendscode := ''PAA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PAD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '        --Commented by Vibhor As RejectedQuantity1 is not available in PBPassDetail Table, hence can not use as a Reference',
    '		-- if vfooter.legendscode = ''OQA'' then ',
    '		-- 	tfootervalue := (-1)* round((nvl(:RejectedQuantity1,0) * vfooter.footerpercent ) /100,2);',
    '		-- end if;',
    '		',
    '		update PBPASSDETAILFOOTER x',
    '		   set x.footervalue = tfootervalue',
    '		 where x.tno = vfooter.tno',
    '		   and x.sno = vfooter.sno',
    '		   --and x.sn = vfooter.sn',
    '		   and x.footerheadcode = vfooter.Footerheadcode',
    '		   ;',
    '	 end loop;',
    '	 select sum(footervalue) into tfooteramount ',
    '	 from PBPASSDETAILFOOTER ',
    '	 where tno = :tno',
    '	   and sno = :sno;',
    '	   ',
    '	   :FooterAmount := nvl(tfooteramount,0);',
    '	   :totalamount  := nvl(:Amount,0) + nvl(:FooterAmount,0);',
    '	 ',
    'end;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294893308531667015)
,p_event_id=>wwv_flow_imp.id(294891924893667012)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602264427724037858)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294892794313667015)
,p_event_id=>wwv_flow_imp.id(294891924893667012)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '  ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P152_SUMOFAMOUNT'',amount_total);',
    '$s(''P152_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P152_PBPASSAMOUNT'',totalamount_total);',
    '',
    '}());',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(193621426362721489)
,p_name=>'set amount_3'
,p_static_id=>'set-amount-2'
,p_event_sequence=>710
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'AMOUNT'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'AMOUNT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193621582891721490)
,p_event_id=>wwv_flow_imp.id(193621426362721489)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY2,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P143_DFAMOUNT',
  'items_to_submit', 'TNO,SNO,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,P152_TAXINROUND',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tlegendscode varchar2(30);',
    '  tfooterheadcode varchar2(30);',
    '  tfooterpercent  number;',
    '  tfootervalue    number;',
    '  tfooteramount   number;',
    '  mfactor		  number;',
    'begin',
    '   select max(multiplyingfactor) into mfactor from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   :quantity2             := mfactor * :quantity1 ;',
    '   ',
    '   :quantity2             := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '   ',
    '  ',
    '   :amount := nvl(:QUANTITY1,0) *nvl(:RATE,0);',
    '   ---',
    '   :P143_DFAMOUNT := :amount;',
    '',
    '',
    '--raise_application_error(-20001,'' Qty2 ''||to_char(:quantity2,0)||'' d.amt ''||nvl(:DISCREPANCYAMOUNT,0)||'' r qty ''||nvl(:rejectedquantity1,0)||'' amt ''||nvl(:amount,0));',
    '',
    '',
    '   --- ',
    '     for vfooter in (',
    '	    Select * From PBPASSDETAILFOOTER a where tno = :TNO and SNO = :SNO',
    '	 ) loop',
    '	 ',
    '		--if vfooter.legendscode = ''PRA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '		--end if;',
    '        if :P152_TAXINROUND=''YES'' then',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '            tlegendscode := ''PRA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PRD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,0);',
    '',
    '		end if;',
    '',
    '		--if vfooter.legendscode = ''PAA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '		--end if;',
    '        if :P152_TAXINROUND=''NO'' then  ',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '            tlegendscode := ''PAA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PAD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '        --Commented by Vibhor As RejectedQuantity1 is not available in PBPassDetail Table, hence can not use as a Reference',
    '		-- if vfooter.legendscode = ''OQA'' then ',
    '		-- 	tfootervalue := (-1)* round((nvl(:RejectedQuantity1,0) * vfooter.footerpercent ) /100,2);',
    '		-- end if;',
    '		',
    '		update PBPASSDETAILFOOTER x',
    '		   set x.footervalue = tfootervalue',
    '		 where x.tno = vfooter.tno',
    '		   and x.sno = vfooter.sno',
    '		   and x.sn = vfooter.sn',
    '		   and x.footerheadcode = vfooter.Footerheadcode',
    '		   ;',
    '	 end loop;',
    '	 select sum(footervalue) into tfooteramount ',
    '	 from PBPASSDETAILFOOTER ',
    '	 where tno = :tno',
    '	   and sno = :sno;',
    '	   ',
    '	   :FooterAmount := nvl(tfooteramount,0);',
    '	   :totalamount  := nvl(:Amount,0) + nvl(:FooterAmount,0);',
    '	 ',
    'end;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193621760045721492)
,p_event_id=>wwv_flow_imp.id(193621426362721489)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602264427724037858)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193621692491721491)
,p_event_id=>wwv_flow_imp.id(193621426362721489)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '  ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P152_SUMOFAMOUNT'',amount_total);',
    '$s(''P152_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P152_PBPASSAMOUNT'',totalamount_total);',
    '',
    '}());',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(193621114998721485)
,p_name=>'set amount_2'
,p_static_id=>'set-amount-3'
,p_event_sequence=>720
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'RATE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'RATE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193621181878721486)
,p_event_id=>wwv_flow_imp.id(193621114998721485)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY2,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P143_DFAMOUNT',
  'items_to_submit', 'TNO,SNO,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,P152_TAXINROUND',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tlegendscode varchar2(30);',
    '  tfooterheadcode varchar2(30);',
    '  tfooterpercent  number;',
    '  tfootervalue    number;',
    '  tfooteramount   number;',
    '  mfactor		  number;',
    'begin',
    '   select max(multiplyingfactor) into mfactor from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   :quantity2             := mfactor * :quantity1 ;',
    '   ',
    '   :quantity2             := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '   ',
    '  ',
    '   :amount := nvl(:QUANTITY1,0) *nvl(:RATE,0);',
    '   ---',
    '   :P143_DFAMOUNT := :amount;',
    '',
    '',
    '--raise_application_error(-20001,'' Qty2 ''||to_char(:quantity2,0)||'' d.amt ''||nvl(:DISCREPANCYAMOUNT,0)||'' r qty ''||nvl(:rejectedquantity1,0)||'' amt ''||nvl(:amount,0));',
    '',
    '',
    '   --- ',
    '     for vfooter in (',
    '	    Select * From PBPASSDETAILFOOTER a where tno = :TNO and SNO = :SNO',
    '	 ) loop',
    '	 ',
    '		--if vfooter.legendscode = ''PRA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '		--end if;',
    '        if :P152_TAXINROUND=''YES'' then',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '            tlegendscode := ''PRA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PRD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,0);',
    '',
    '		end if;',
    '',
    '		--if vfooter.legendscode = ''PAA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '		--end if;',
    '        if :P152_TAXINROUND=''NO'' then  ',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '            tlegendscode := ''PAA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PAD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '		if vfooter.legendscode = ''OQA'' then ',
    '			tfootervalue := (-1)* round((nvl(:RejectedQuantity1,0) * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '		',
    '		update PBPASSDETAILFOOTER x',
    '		   set x.footervalue = tfootervalue',
    '		 where x.tno = vfooter.tno',
    '		   and x.sno = vfooter.sno',
    '		   and x.sn = vfooter.sn',
    '		   and x.footerheadcode = vfooter.Footerheadcode',
    '		   ;',
    '	 end loop;',
    '	 select sum(footervalue) into tfooteramount ',
    '	 from PBPASSDETAILFOOTER ',
    '	 where tno = :tno',
    '	   and sno = :sno;',
    '	   ',
    '	   :FooterAmount := nvl(tfooteramount,0);',
    '	   :totalamount  := nvl(:Amount,0) + nvl(:FooterAmount,0);',
    '	 ',
    'end;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193621343056721488)
,p_event_id=>wwv_flow_imp.id(193621114998721485)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602264427724037858)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193621249750721487)
,p_event_id=>wwv_flow_imp.id(193621114998721485)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '  ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P152_SUMOFAMOUNT'',amount_total);',
    '$s(''P152_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P152_PBPASSAMOUNT'',totalamount_total);',
    '',
    '}());',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(193620633844721481)
,p_name=>'set amount_1'
,p_static_id=>'set-amount-4'
,p_event_sequence=>730
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY2'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193620729769721482)
,p_event_id=>wwv_flow_imp.id(193620633844721481)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY2,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P143_DFAMOUNT',
  'items_to_submit', 'TNO,SNO,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,P152_TAXINROUND',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tlegendscode varchar2(30);',
    '  tfooterheadcode varchar2(30);',
    '  tfooterpercent  number;',
    '  tfootervalue    number;',
    '  tfooteramount   number;',
    '  mfactor		  number;',
    'begin',
    '   select max(multiplyingfactor) into mfactor from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   :quantity2             := mfactor * :quantity1 ;',
    '   ',
    '   :quantity2             := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '   ',
    '  ',
    '   :amount := nvl(:QUANTITY1,0) *nvl(:RATE,0);',
    '   ---',
    '   :P143_DFAMOUNT := :amount;',
    '',
    '',
    '--raise_application_error(-20001,'' Qty2 ''||to_char(:quantity2,0)||'' d.amt ''||nvl(:DISCREPANCYAMOUNT,0)||'' r qty ''||nvl(:rejectedquantity1,0)||'' amt ''||nvl(:amount,0));',
    '',
    '',
    '   --- ',
    '     for vfooter in (',
    '	    Select * From PBPASSDETAILFOOTER a where tno = :TNO and SNO = :SNO',
    '	 ) loop',
    '	 ',
    '		--if vfooter.legendscode = ''PRA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '		--end if;',
    '        if :P152_TAXINROUND=''YES'' then',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '            tlegendscode := ''PRA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PRD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,0);',
    '',
    '		end if;',
    '',
    '		--if vfooter.legendscode = ''PAA'' then ',
    '		--	tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '		--end if;',
    '        if :P152_TAXINROUND=''NO'' then  ',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '            tlegendscode := ''PAA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PAD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '		if vfooter.legendscode = ''OQA'' then ',
    '			tfootervalue := (-1)* round((nvl(:RejectedQuantity1,0) * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '		',
    '		update PBPASSDETAILFOOTER x',
    '		   set x.footervalue = tfootervalue',
    '		 where x.tno = vfooter.tno',
    '		   and x.sno = vfooter.sno',
    '		   and x.sn = vfooter.sn',
    '		   and x.footerheadcode = vfooter.Footerheadcode',
    '		   ;',
    '	 end loop;',
    '	 select sum(footervalue) into tfooteramount ',
    '	 from PBPASSDETAILFOOTER ',
    '	 where tno = :tno',
    '	   and sno = :sno;',
    '	   ',
    '	   :FooterAmount := nvl(tfooteramount,0);',
    '	   :totalamount  := nvl(:Amount,0) + nvl(:FooterAmount,0);',
    '	 ',
    'end;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193620919310721484)
,p_event_id=>wwv_flow_imp.id(193620633844721481)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(602264427724037858)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193620858943721483)
,p_event_id=>wwv_flow_imp.id(193620633844721481)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '  ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P152_SUMOFAMOUNT'',amount_total);',
    '$s(''P152_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P152_PBPASSAMOUNT'',totalamount_total);',
    '',
    '}());',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(503410483842376932)
,p_name=>'set amt'
,p_static_id=>'set-amt'
,p_event_sequence=>690
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUALITYDEDUCTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503410650251376933)
,p_event_id=>wwv_flow_imp.id(503410483842376932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERAMOUNT,AMOUNT',
  'plsql_expression', ':footeramount+:amount',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(605321560809850252)
,p_name=>'Set Bill Amount'
,p_static_id=>'set-bill-amount'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PURCHASEBILLTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605321704604850253)
,p_event_id=>wwv_flow_imp.id(605321560809850252)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_BILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PURCHASEBILLTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select PURCHASEBILLAMOUNT from purchasebill',
    'where tno = :P152_PURCHASEBILLTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(601383271565650838)
,p_name=>'Set Currency Value'
,p_static_id=>'set-currency-value'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(601383443837650839)
,p_event_id=>wwv_flow_imp.id(601383271565650838)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_CURRENCYUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CURRENCYVALUE from currencyunit',
    'where CURRENCYUNITCODE = :P152_CURRENCYUNITCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455358211599181904)
,p_name=>'Set debit note amount'
,p_static_id=>'set-debit-note-amount'
,p_event_sequence=>600
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_BILLAMOUNT,P152_PBPASSAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455358342994181905)
,p_event_id=>wwv_flow_imp.id(455358211599181904)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_DEBITNOTEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT,P152_BILLAMOUNT',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'RETURN NVL(:P152_BILLAMOUNT, 0) - NVL(:P152_PBPASSAMOUNT, 0) ;--+ NVL(:P152_ROUNDOFF, 0);',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502725354845667416)
,p_name=>'set decimal'
,p_static_id=>'set-decimal'
,p_event_sequence=>670
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502725394747667417)
,p_event_id=>wwv_flow_imp.id(502725354845667416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502725470466667418)
,p_name=>'set decimal_1'
,p_static_id=>'set-decimal-2'
,p_event_sequence=>680
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502725622248667419)
,p_event_id=>wwv_flow_imp.id(502725470466667418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602351505147277351)
,p_name=>'Set Detail Footer'
,p_static_id=>'set-detail-footer'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602351052084277347)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447356004175243107)
,p_name=>'Set DFAMOUNT'
,p_static_id=>'set-dfamount'
,p_event_sequence=>410
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449340335008666811)
,p_event_id=>wwv_flow_imp.id(447356004175243107)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_DFAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RATE,QUANTITY1',
  'sql_query', 'select nvl(:QUANTITY1,0)*nvl(:RATE,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(198439896448447980)
,p_name=>'set footer'
,p_static_id=>'set-footer'
,p_event_sequence=>425
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'FD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198439965489447981)
,p_event_id=>wwv_flow_imp.id(198439896448447980)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(sum(footervalue),0) from pbpassdetailfooter',
    'where tno = :tno',
    'and sno = :sno')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447356450498243111)
,p_name=>'Set Footer and Total Amount'
,p_static_id=>'set-footer-and-total-amount'
,p_event_sequence=>430
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'AMOUNT,FD,FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447356565383243112)
,p_event_id=>wwv_flow_imp.id(447356450498243111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_FVALUE,P152_DFAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:P152_FVALUE,0)+nvl(:P152_DFAMOUNT,0) as A',
    'from dual  ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P152_FVALUE'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503410317877376930)
,p_event_id=>wwv_flow_imp.id(447356450498243111)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERAMOUNT,AMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:FOOTERAMOUNT,0)+nvl(:AMOUNT,0) as A',
    'from dual  ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447358375162243131)
,p_name=>'Set Footer Total'
,p_static_id=>'set-footer-total'
,p_event_sequence=>520
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602350748331277344)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447358512527243132)
,p_event_id=>wwv_flow_imp.id(447358375162243131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget = apex.region(''Detail'').widget();',
    'var grid = widget.interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    '',
    '// Get the selected records',
    'var selectedRecords = grid.getSelectedRecords();',
    '',
    '// Iterate over the selected records and set a value in a specific column',
    'for (var i = 0; i < selectedRecords.length; i++) {',
    '  var record = selectedRecords[i];',
    '  var columnAlias1 = "FOOTERAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value1 = $v("P152_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value2 =  (parseFloat($v("P152_FVALUE"), 10)+ parseFloat($v("P152_DFAMOUNT"), 10)).toString(); // Replace with the new value you want to set',
    '  ',
    '',
    '  model.setValue(record, columnAlias1, value1);',
    '  model.setValue(record, columnAlias2, value2);',
    '}',
    '//var selectedRowIds = grid.getSelectedRowIds();',
    '//var view = grid.view();',
    '//// Iterate over the array to access each selected row ID',
    '////for (var i = 0; i < selectedRowIds.length; i++) {',
    '////  var rowId = selectedRowIds[i];',
    '////  // Access or manipulate the row ID as needed',
    '////}',
    '//var rowId = selectedRecords[0];',
    '//view.setSelection(rowId, false);',
    '//console.log(apex.region(''Detail'').getSelectedRowIds())',
    '//console.log(apex.region(''Detail'').getViewId())',
    '//grid.refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455357596587181898)
,p_name=>'Set net pay amount'
,p_static_id=>'set-net-pay-amount'
,p_event_sequence=>590
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PAIDINADVANCE,P152_PBPASSAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455357703321181899)
,p_event_id=>wwv_flow_imp.id(455357596587181898)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_NETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT,P152_PAIDINADVANCE',
  'plsql_expression', 'nvl(:P152_PBPASSAMOUNT,0) - nvl(:P152_PAIDINADVANCE,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602349724984277333)
,p_name=>'Set P152_SNO'
,p_static_id=>'set-p152-sno'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602349816412277334)
,p_event_id=>wwv_flow_imp.id(602349724984277333)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'sql_query', 'select :SNO from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461547332599383512)
,p_name=>'set paid in advance'
,p_static_id=>'set-paid-in-advance'
,p_event_sequence=>580
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PBPASSAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461546945810383508)
,p_event_id=>wwv_flow_imp.id(461547332599383512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PAIDINADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_TNO,P152_PBPASSAMOUNT',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    psum number;',
    'begin',
    '    select sum(AMOUNT) into psum from pbpasspaidinadvance',
    '    where tno = :P152_TNO;',
    '    if psum > nvl(:P152_PBPASSAMOUNT,0) then  ',
    '        return nvl(:P152_PBPASSAMOUNT,0);',
    '    else  ',
    '        return nvl(psum,0);',
    '    end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(454406629297940797)
,p_name=>'set PAIDINADVANCE and tds deducted in advance'
,p_static_id=>'set-paidinadvance-and-tds-deducted-in-advance'
,p_event_sequence=>530
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PURCHASEBILLTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455357812692181900)
,p_event_id=>wwv_flow_imp.id(454406629297940797)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_PARTYCODE,P152_LOCATIONCODE,P152_PBPASSDATE,P152_PURCHASEBILLTNO,P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'p_paidinadvance number;',
    'begin',
    'delete from pbpasspaidinadvance where tno = :P152_TNO;',
    'begin',
    'SELECT',
    'sum(paidinadvance) into p_paidinadvance',
    'FROM',
    'pbpass a',
    'WHERE',
    'a.purchasebilltno IN (',
    '    SELECT',
    '        tno',
    '    FROM',
    '        purchasebill',
    '    WHERE',
    '        purchaseordertno IN (',
    '            SELECT',
    '                purchaseordertno',
    '            FROM',
    '                purchasebill',
    '            WHERE',
    '                tno = :P152_PURCHASEBILLTNO',
    '        )',
    ')',
    'AND getdocumentstatuscode(''PBPASS'', a.tno) = ''ACTIVE''',
    'AND EXISTS (',
    '    SELECT',
    '        1',
    '    FROM',
    '        voucher aa',
    '    WHERE',
    '        aa.moduletno = a.tno',
    ')',
    'AND a.paidinadvance > 0;',
    '',
    'exception when others then ',
    'null;',
    'end;',
    '',
    'for i in ( select distinct voucherno , voucherdate , modulecode , moduletno , tno , sno , ',
    '                paidinadvance     ',
    'from (',
    'select',
    '	b.VoucherNo,',
    '	b.VoucherDate,',
    '	b.ModuleCode,',
    '	b.ModuleTNo,',
    '	a.TNo,',
    '	a.SNo,',
    '	e.TDSDeductedOn - nvl(e.AdvanceAdjustedWithBill, 0)  as PaidInAdvance',
    'from VoucherDetail a, Voucher b, (',
    '	select ',
    '			aa.DrVoucherTNo as TNo,',
    '			aa.AccountCode,',
    '			sum(aa.Amount) as Amount',
    '	from DrCrAllocation aa',
    '	group by aa.DrVoucherTNo,',
    '			aa.AccountCode',
    ') c, (',
    '	select ',
    '			aa.VoucherTNo,',
    '			sum(aa.Amount) as Amount',
    '	from PBPassPaidInAdvance aa, PBPass bb, PurchaseBill cc ',
    '	where aa.TNo = bb.TNo',
    '			and bb.PurchaseBillTno = cc.TNo',
    '			and cc.PartyCode = :P152_PartyCode',
    '			and not exists(',
    '					select ',
    '							aaa.TNo',
    '					from Voucher aaa ',
    '					where aaa.ModuleTNo = aa.TNo',
    '			)',
    '	group by aa.VoucherTNo		',
    ') d, AccountOpeningTDSDeducted e ',
    'where a.TNo = b.TNo',
    '	and a.TNo = c.TNo(+)',
    '	and a.AccountCode = c.AccountCode(+)',
    '	and a.ModuleTNO = e.TNo',
    '	--',
    '	and a.TNo = d.VoucherTNo(+)',
    '	--',
    '	and a.AccountCode = :P152_PartyCode',
    '	and a.LocationCode = :P152_LocationCode',
    '	and a.Amount < 0',
    '	and ( -1 * a.Amount)  - nvl(c.Amount, 0) - nvl(d.Amount, 0) > 0',
    '	and e.TDSDeductedOn - nvl(e.AdvanceAdjustedWithBill, 0) > 0',
    '	and b.VoucherNO = ''OPENING''',
    '	-------------------------------------- --',
    '	-- date27-nov-2020',
    '	and b.VoucherDate <= :P152_PBPassDate',
    '	-------------------------------------- --',
    '-----------------------------------',
    'union all',
    'select',
    '	b.VoucherNo,',
    '	b.VoucherDate,',
    '	b.ModuleCode,',
    '	b.ModuleTNo,',
    '	a.TNo,',
    '	a.SNo,',
    '	( -1 * a.Amount)  - nvl(c.Amount, 0) - nvl(d.Amount, 0) as PaidInAdvance',
    'from VoucherDetail a, Voucher b, (',
    '	select ',
    '			aa.DrVoucherTNo as TNo,',
    '			aa.AccountCode,',
    '			sum(aa.Amount) as Amount',
    '	from DrCrAllocation aa',
    '	group by aa.DrVoucherTNo,',
    '			aa.AccountCode',
    ') c, (',
    '	select ',
    '			aa.VoucherTNo,',
    '			sum(aa.Amount) as Amount',
    '	from PBPassPaidInAdvance aa, PBPass bb, PurchaseBill cc ',
    '	where aa.TNo = bb.TNo',
    '			and bb.PurchaseBillTno = cc.TNo',
    '			and cc.PartyCode = :P152_PartyCode',
    '			and not exists(',
    '					select ',
    '							aaa.TNo',
    '					from Voucher aaa ',
    '					where aaa.ModuleTNo = aa.TNo',
    '			)',
    '	group by aa.VoucherTNo		',
    ') d',
    'where a.TNo = b.TNo',
    '	and a.TNo = c.TNo(+)',
    '	and a.AccountCode = c.AccountCode(+)',
    '	',
    '	and a.TNo = d.VoucherTNo(+)',
    '	',
    '	and a.AccountCode = :P152_PartyCode',
    '	and a.LocationCode = :P152_LocationCode',
    '	and a.Amount < 0',
    '	and ( -1 * a.Amount)  - nvl(c.Amount, 0) - nvl(d.Amount, 0) > 0',
    '	',
    '	and exists(',
    '			select ',
    '					aa.VoucherTNo',
    '			from PaymentAdvicePurchaseOrderBill aa',
    '			where aa.VoucherTNo = a.TNo',
    '					and aa.PurchaseBillTNo = :P152_PurchaseBillTNo',
    '	)',
    '	---------------------------------------------------------------------------------------- --',
    '	and b.VoucherNO != ''OPENING''',
    '	',
    '	and b.VoucherDate <= :P152_PBPassDate',
    ')',
    'order by 2, 1',
    ')',
    'loop',
    '--raise_application_error(-20000,p_paidinadvance);',
    'insert into pbpasspaidinadvance',
    '(',
    'tno,',
    'sno,',
    'vouchertno,',
    'vouchersno,',
    'amount',
    ')',
    'values ',
    '(',
    ':P152_TNO,',
    'globaltno.nextval,',
    'i.tno,',
    'i.sno,',
    'i.paidinadvance - nvl(p_paidinadvance,0)',
    ');',
    'end loop;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455357925912181901)
,p_event_id=>wwv_flow_imp.id(454406629297940797)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P152_PARTYCODE,P152_LOCATIONCODE,P152_PBPASSDATE,P152_PURCHASEBILLTNO,P152_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PBPassTDSDeductedInAdvance where tno = :P152_TNO;',
    '',
    'for i in ( select ',
    '    c.VoucherNO,',
    '    c.VoucherDate,',
    '    c.TNo,',
    '    g.SNo,',
    '    f.PurchaseOrderNo,',
    '    f.PurchaseOrderDate,',
    '    f.TNo as PurchaseOrderTNo,',
    '    b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) as DeductedInAdvance',
    '            ----------------------------- --',
    'from PaymentAdvice a, PaymentAdviceReference b, Voucher c, (',
    '    select ',
    '            aa.PurchaseOrderTNo,',
    '            sum(aa.DeductedInAdvance) as AdvanceAdjustedWithBill',
    '    from PBPassTDSDeductedInAdvance aa',
    '    group by aa.PurchaseOrderTNo',
    '        ',
    '    ) d, PurchaseOrder f,',
    '    VoucherDetail g,',
    '    (',
    '       Select tno,Sum(footervalue) tdsamount',
    '         From paymentadvicedetail',
    '        Where footerheadcode=''.TDS.''',
    '        Group By tno',
    '',
    '    ) ptds',
    'where a.TNo = b.TNo ',
    '        and a.TNO = c.ModuleTNO',
    '        and b.ReferenceModuleTNo = d.PurchaseOrderTNo(+)',
    '        and b.ReferenceMOduleTNO = f.TNO',
    '        --',
    '        and c.TNO = g.TNo',
    '        and a.PartyCode = g.AccountCode',
    '        and g.Amount < 0',
    '        and a.tno = ptds.tno(+)',
    '        and ptds.tdsamount > 0',
    '        --',
    '        and a.PartyCode = :P152_PartyCode',
    '        and a.CompanyCode = :global_CompanyCode',
    '        and c.VoucherDate <= :P152_PBPassDate',
    '        and exists(',
    '                select ',
    '                        aa.TNo',
    '                from PurchaseBillDetail aa',
    '                where aa.PurchaseOrderTNo = b.ReferenceMOduleTNO ',
    '                and aa.TNo = :P152_PurchaseBillTNo        ',
    '        )',
    '        and b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) > 0',
    '        ------------------------------- --',
    '        and a.AmountDr > NVL(GETALLOCATEDAMOUNT(A.TNO , a.PartyCode, ''01-APR-2001'', TRUNC(SYSDATE)), 0)',
    '        and a.AmountDr > nvl(a.TDSAdvanceAdjustedWithBill, 0)',
    'union all ',
    '',
    'select ',
    '            c.VoucherNO,',
    '            c.VoucherDate,',
    '            c.TNo,',
    '            g.SNo,',
    '            f.PurchaseOrderNo,',
    '            f.PurchaseOrderDate,',
    '            f.TNo as PurchaseOrderTNo,',
    '            b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) as DeductedInAdvance',
    '            ----------------------------- --',
    'from PaymentAdvice a, PaymentAdviceReference b, voucher c1, Voucher c, (',
    '            select ',
    '                    aa.PurchaseOrderTNo,',
    '                    sum(aa.DeductedInAdvance) as AdvanceAdjustedWithBill',
    '            from PBPassTDSDeductedInAdvance aa',
    '            group by aa.PurchaseOrderTNo',
    '    ',
    '    ) d, PurchaseOrder f,',
    '    VoucherDetail g,',
    '    (',
    '       Select tno,Sum(footervalue) tdsamount',
    '         From paymentadvicedetail',
    '        Where footerheadcode=''.TDS.''',
    '        Group By tno',
    '',
    '    ) ptds',
    'where a.TNo = b.TNo ',
    '    and a.TNO = c1.ModuleTNO',
    '    and c1.TNO = c.ModuleTNO',
    '    and b.ReferenceModuleTNo = d.PurchaseOrderTNo(+)',
    '    and b.ReferenceMOduleTNO = f.TNO',
    '    and c.TNO = g.TNo',
    '    and a.PartyCode = g.AccountCode',
    '    and a.tno = ptds.tno(+)',
    '    and ptds.tdsamount > 0',
    '    and g.Amount < 0',
    '    and a.PartyCode = :P152_PartyCode',
    '    and a.CompanyCode = :global_CompanyCode',
    '    and c.VoucherDate <= :P152_PBPassDate',
    '    and exists(',
    '            select ',
    '                    aa.TNo',
    '            from PurchaseBillDetail aa',
    '            where aa.PurchaseOrderTNo = b.ReferenceMOduleTNO ',
    '            and aa.TNo = :P152_PurchaseBillTNo',
    '    ',
    '    )',
    '',
    '    and b.Amount - getAdvanceAdjustedWithBill(b.ReferenceModuleTNo, c.TNo) > 0',
    '    and a.AmountDr > NVL(GETALLOCATEDAMOUNT(A.TNO , a.PartyCode, ''01-APR-2001'', TRUNC(SYSDATE)), 0)',
    '    and a.AmountDr > nvl(a.TDSAdvanceAdjustedWithBill, 0)',
    '---------------------------------- --',
    'order by 2,1',
    ')',
    'loop',
    'insert into PBPassTDSDeductedInAdvance',
    '(',
    '    TNO,',
    '    SNO,',
    '    VOUCHERTDSDEDUCTEDTNO,',
    '    DEDUCTEDINADVANCE,',
    '    VOUCHERTDSDEDUCTEDSNO,',
    '    PURCHASEORDERTNO',
    ')',
    'values ',
    '(',
    '    :P152_TNO,',
    '    globaltno.nextval,',
    '    i.tno,',
    '    i.DeductedInAdvance,',
    '    i.sno,',
    '    i.PurchaseOrderTNo',
    ');',
    'end loop;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454406727537940798)
,p_event_id=>wwv_flow_imp.id(454406629297940797)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PAIDINADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(AMOUNT) from pbpasspaidinadvance',
    'where tno = :P152_TNO;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461546771717383507)
,p_event_id=>wwv_flow_imp.id(454406629297940797)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PAIDINADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_TNO,P152_PBPASSAMOUNT',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    psum number;',
    'begin',
    '    select sum(AMOUNT) into psum from pbpasspaidinadvance',
    '    where tno = :P152_TNO;',
    '    if psum > nvl(:P152_PBPASSAMOUNT,0) then  ',
    '        return nvl(:P152_PBPASSAMOUNT,0);',
    '    else  ',
    '        return nvl(psum,0);',
    '    end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455358037756181902)
,p_event_id=>wwv_flow_imp.id(454406629297940797)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_TDSDEDUCTEDINADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(DEDUCTEDINADVANCE) from PBPassTDSDeductedInAdvance ',
    'where tno = :P152_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602351830536277354)
,p_name=>'Set PBPASSGRN'
,p_static_id=>'set-pbpassgrn'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602351052084277347)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(465587558670106395)
,p_name=>'Set Quantity2 on change'
,p_static_id=>'set-quantity2-on-change'
,p_event_sequence=>400
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY1,RATE,AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(465587648873106396)
,p_event_id=>wwv_flow_imp.id(465587558670106395)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMSPECIFICATIONCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    'nvl(:QUANTITY1,0)* NVL(MULTIPLYINGFACTOR,0)',
    'from itemspecification ',
    'where itemspecificationcode = :ITEMSPECIFICATIONCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(465587339605106393)
,p_name=>'Set Quantity2 on loose focus'
,p_static_id=>'set-quantity2-on-loose-focus'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'QUANTITY1,RATE,AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(465587413789106394)
,p_event_id=>wwv_flow_imp.id(465587339605106393)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMSPECIFICATIONCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    'nvl(:QUANTITY1,0)* NVL(MULTIPLYINGFACTOR,0)',
    'from itemspecification ',
    'where itemspecificationcode = :ITEMSPECIFICATIONCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447356876088243116)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>450
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447357029506243117)
,p_event_id=>wwv_flow_imp.id(447356876088243116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERHEADCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '      SNO',
    'From  FOOTERSCHEMEDETAIL',
    'Where FooterHeadCode = :FOOTERHEADCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602349911677277335)
,p_name=>'Set SNO Seq.'
,p_static_id=>'set-sno-seq'
,p_event_sequence=>160
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(602261923634037833)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602349984266277336)
,p_event_id=>wwv_flow_imp.id(602349911677277335)
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
 p_id=>wwv_flow_imp.id(602350109089277337)
,p_name=>'Set SNO Seq1'
,p_static_id=>'set-sno-seq-2'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602350187697277338)
,p_event_id=>wwv_flow_imp.id(602350109089277337)
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
 p_id=>wwv_flow_imp.id(602349275763277329)
,p_name=>'Set SNO Sequence'
,p_static_id=>'set-sno-sequence'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(602349371740277330)
,p_event_id=>wwv_flow_imp.id(602349275763277329)
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
 p_id=>wwv_flow_imp.id(602352266031277359)
,p_name=>'Set Sum Of Amount'
,p_static_id=>'set-sum-of-amount'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(602351052084277347)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461547589341383515)
,p_name=>'set tds deductable amount'
,p_static_id=>'set-tds-deductable-amount'
,p_event_sequence=>610
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PBPASSAMOUNT,P152_PAIDINADVANCE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461547695537383516)
,p_event_id=>wwv_flow_imp.id(461547589341383515)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P152_PBPASSAMOUNT,P152_PAIDINADVANCE',
  'plsql_expression', 'nvl(:P152_PBPASSAMOUNT,0)-nvl(:P152_PAIDINADVANCE,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447356216076243109)
,p_name=>'Set Total Amount'
,p_static_id=>'set-total-amount'
,p_event_sequence=>420
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(601383467526650840)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447356354441243110)
,p_event_id=>wwv_flow_imp.id(447356216076243109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT,FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,FOOTERAMOUNT',
  'sql_query', 'select nvl(:AMOUNT,0)+ nvl(:FOOTERAMOUNT,0) , nvl(:FOOTERAMOUNT,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447357812248243125)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>490
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(602264427724037858)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447357877763243126)
,p_event_id=>wwv_flow_imp.id(447357812248243125)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseInt(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P152_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(576507251306099971)
,p_name=>'setfocusonpartyname'
,p_static_id=>'setfocusonpartyname'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_PBPASSDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(576507377423099972)
,p_event_id=>wwv_flow_imp.id(576507251306099971)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_PARTYCODE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602352453073277361)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate Quality and bonus'
,p_static_id=>'calculate-quality-and-bonus'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    cursor cPB is select * from PBPASSDETAIL where tno = :P152_TNO;',
'    vPB cPB%ROWTYPE;',
'begin',
'    for vPB in cPB',
'    loop',
'',
'        declare',
'',
'		CURSOR cGRN is',
'				select distinct',
'						d.TNo as GRNTNo,',
'						dd.SNo as GRNSNo,',
'						d.GRNNo,',
'						dd.ItemCode,',
'						dd.ItemSpecificationCode',
'				from ',
'						PurchaseOrderDetail a, ',
'						PurchaseOrderDetailQuality b, ',
'						ItemQuality c, ',
'						GRN d, ',
'						GRNDETAIL dd,',
'						QCSample e,',
'						QCSampleDetail f, ',
'						QualityTestDetail g,',
'						QualityTest h,',
'						PurchaseBillDetail i,',
'						PurchaseBillGRNDetail j',
'				where a.TNo = b.TNO',
'						and a.SNo = b.SNo',
'						and a.ItemCode = c.ItemCode ',
'						and b.TNo = d.PurchaseOrderTNo',
'						and b.QualityCode = g.QualityCode',
'						and e.TNO = f.TNo',
'						and ( e.SampleFor IN (''INWARD'', ''INWARDRAKE'') OR  e.DocTypeCode = ''INWARD'' )',
'						and ( d.MaterialInTNo = f.ReferenceTNo or d.RakeTNo = f.ReferenceTNo )',
'						and d.TNO = dd.TNO',
'						and f.TNo = h.QCSampleTNo',
'						and c.QualityCode = g.QualityCode						',
'						and g.TNo = h.TNO						',
'						and a.ItemCode = dd.ItemCode',
'						and a.ItemSpecificationCode = dd.ItemSpecificationCode',
'						and dd.ReceivedQuantity1 = nvl(dd.InspectedQuantity1,0) ',
'						and nvl(dd.RejectedQuantity1,0) = nvl(dd.JoinInspectedQuantity1,0)',
'						and dd.PurchaseOrderTNo = i.PurchaseOrderTNo',
'						and dd.ItemCode = i.ItemCode',
'						and dd.ItemSpecificationCode = i.ItemSpecificationCode',
'						and dd.TNo = j.GRNTNO',
'						and i.TNo = j.TNo',
'						and i.SNo = j.SNo',
'						and a.TNo = vPB.PurchaseOrderTNO',
'						and j.TNO = :P152_PURCHASEBILLTNO',
'						and a.ItemCode = vPB.ItemCode',
'						and a.ItemSpecificationCode = vPB.ItemSpecificationCode						',
'		;',
'		vGRN cGRN%ROWTYPE;		',
'		tGRNBonus number;',
'		tGRNDeduction number;',
'		tItemBonus number;',
'		tItemDeduction number;',
'		tBonusRate number;',
'		tDeductionRate number;',
'		tQualityFound Varchar2(3) := ''NO'';',
'		',
'		i number := 0;',
'',
'        gQuantity1 number := 0;',
'        gQuantity2 number := 0;',
'BEGIN',
'		',
'		tItemBonus := 0;',
'		tItemDeduction := 0;',
'				',
'		for vGRN in cGRN ',
'		loop',
'				i := i + 1;',
'				',
'				',
'				tQualityFound := ''YES'';',
'',
'				',
'				',
'				',
'				tGRNBonus := 0;',
'				tGRNDeduction := 0;',
'				DECLARE',
'						CURSOR cIQ is',
'								select',
'										d.TNo as GRNTNo,',
'										d.GRNNo,',
'										c.TNO,',
'										c.QUALITYCODE,',
'										c.ITEMCODE,',
'										b.MINIMUMVALUE,',
'										b.MAXIMUMVALUE,',
'										b.TOLERANCE,',
'										c.BONUSONBILL,',
'										c.DEDUCTIONONFREIGHT,',
'										c.DEDUCTIONONBILL,',
'										c.DEDUCTIONVARIATIONTYPE,',
'										c.DEDUCTIONMETHODCODE,',
'										g.TestValue,',
'										g.BilledTestValue,',
'										dd.ChalanQuantity1,',
'										dd.ChalanQuantity2,',
'										dd.ReceivedQuantity1,',
'										dd.ReceivedQuantity2,',
'										nvl(dd.AcceptedQuantity1,0) + nvl(dd.JoinAcceptedQuantity1,0) as AcceptedQuantity1,',
'										nvl(dd.AcceptedQuantity1,0) + nvl(dd.JoinAcceptedQuantity1,0) as AcceptedQuantity2,',
'										i.QualityName,',
'										nvl(b.DeductionRate, vPB.Rate) as Rate,',
'										b.DeductionFrom,',
'										b.SLABWISEDEDUCTION,',
'										b.TNo as PurchaseOrderTNo,',
'										b.SNo as PurchaseOrderSNo,',
'										b.SerialNo as PurchaseOrderSerialNo',
'								from ',
'										PurchaseOrderDetail a, ',
'										PurchaseOrderDetailQuality b, ',
'										ItemQuality c, ',
'										GRN d, ',
'										GRNDETAIL dd,',
'										QCSample e,',
'										QCSampleDetail f, ',
'										QualityTestDetail g,',
'										QualityTest h,',
'										Quality i',
'								where a.TNo = b.TNO',
'										and a.SNo = b.SNo',
'										and a.ItemCode = c.ItemCode ',
'										and a.itemspecificationcode = c.itemspecificationcode ',
'										and b.TNo = d.PurchaseOrderTNo',
'										and b.QualityCode = g.QualityCode',
'										and e.TNO = f.TNo',
'										and ( e.SampleFor IN (''INWARD'', ''INWARDRAKE'') OR  e.DocTypeCode = ''INWARD'' )',
'										and ( d.MaterialInTNo = f.ReferenceTNo or d.RakeTNo = f.ReferenceTNo )',
'										and d.TNO = dd.TNO',
'										and f.TNo = h.QCSampleTNo',
'										and c.QualityCode = g.QualityCode						',
'										and g.TNo = h.TNO',
'										and a.TNo = vPB.PurchaseOrderTNO',
'										and a.ItemCode = dd.ItemCode',
'										and a.ItemSpecificationCode = dd.ItemSpecificationCode',
'										and a.ItemCode = vPB.ItemCode',
'										and a.ItemSpecificationCode = vPB.ItemSpecificationCode						',
'										and e.ItemCode = vPB.ItemCode',
'										and e.ItemSpecificationCode = vPB.ItemSpecificationCode						',
'										and d.TNo = vGRN.GRNTNo',
'										and g.QualityCode = i.QualityCode',
'						;',
'						vIQ cIQ%ROWTYPE;		',
'						tBonus number := 0;',
'						tDeduction number := 0;',
'						tVariation number := 0;',
'						tUnitRate Number := 0;',
'						tQuantity1 Number;',
'						tQuantity2 Number;',
'				BEGIN		',
'						',
'				  	for vIQ in cIQ',
'				  	loop',
'								tBonus := 0;',
'								tDeduction := 0;',
'								tVariation := 0;',
'								tUnitRate := 0;',
'								tQuantity1 := 0 ;',
'								tQuantity2 := 0;',
'								tUnitRate := 0;',
'								tBonusRate := 0;',
'								tDeductionRate := 0;',
'								',
'								',
'',
'				  			if vIQ.DeductionOnBill = ''YES'' ',
'				  					and vIQ.DeductionFrom = ''SUPPLIER''						  					',
'				  			then  				',
'				  					tUnitRate := 0;',
'				  					',
'				  					if vIQ.DeductionVariationType = ''LOWER'' then',
'				  							',
'				  							if nvl(vIQ.TestValue,0) < nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue,0)) - nvl(vIQ.Tolerance,0) then',
'				  								',
'				  									tVariation := nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue,0)) - nvl(vIQ.TestValue,0);',
'				  									if vIQ.DeductionMethodCode = ''UNITAGE'' then',
'						  									if nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue,0)) > 0 then',
'						  										',
'						  											tUnitRate := ROUND(vPB.Rate / nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue, 0)), 2);',
'						  									else',
'						  											tUnitRate := 0;',
'						  									end if;',
'				  									else',
'				  											tUnitRate := ROUND(vIQ.Rate / 100,2);',
'				  									end if;',
'				  							end if;',
'				  					elsif vIQ.DeductionVariationType = ''UPPER'' then',
'				  							if nvl(vIQ.TestValue,0) > nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)) + nvl(vIQ.Tolerance,0) then',
'				  									tVariation := nvl(vIQ.TestValue ,0) - nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0));',
'				  									if vIQ.DeductionMethodCode = ''UNITAGE'' then  											',
'						  									if nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)) > 0 then',
'						  											tUnitRate := ROUND(vPB.Rate / nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)), 2);',
'						  									else',
'						  											tUnitRate := 0;',
'						  									end if;',
'				  									else',
'				  											tUnitRate := ROUND(vIQ.Rate / 100,2);',
'				  									end if;',
'				  							end if;',
'				  					',
'				  					elsif vIQ.DeductionVariationType = ''BOTH'' then',
'				  							if nvl(vIQ.TestValue,0) > nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)) + nvl(vIQ.Tolerance,0) then',
'				  									tVariation := nvl(vIQ.TestValue ,0) - nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)) ;',
'				  									if vIQ.DeductionMethodCode = ''UNITAGE'' then  											',
'						  									if nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)) > 0 then',
'						  											tUnitRate := ROuND(vPB.Rate / nvl(vIQ.BilledTestValue, nvl(vIQ.MaximumValue,0)), 2);',
'						  									else',
'						  											tUnitRate := 0;',
'						  									end if;',
'				  									else',
'				  											tUnitRate := ROUND(vIQ.Rate / 100,2);',
'				  									end if;',
'				  							elsif nvl(vIQ.TestValue,0) < nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue,0)) - nvl(vIQ.Tolerance,0) then				  								',
'				  									tVariation := nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue,0)) - nvl(vIQ.TestValue,0);',
'				  									if vIQ.DeductionMethodCode = ''UNITAGE'' then',
'						  									if nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue,0)) > 0 then',
'						  										',
'						  											tUnitRate := ROUND(vPB.Rate / nvl(vIQ.BilledTestValue, nvl(vIQ.MinimumValue, 0)), 2);',
'						  									else',
'						  											tUnitRate := 0;',
'						  									end if;',
'				  									else',
'				  											tUnitRate := ROUND(vIQ.Rate / 100,2);',
'				  									end if;',
'						  					end if;				  							',
'				  					end if;',
'				  					',
'				  					',
'				  					if vIQ.SlabWiseDeduction = ''YES'' and vIQ.DeductionFrom = ''SUPPLIER'' then',
'				  							select',
'				  									max(a.DeductionRate) into tUnitRate',
'				  							from PurchaseOrderQualitySlab a',
'				  							where a.TNo = vIQ.PurchaseOrderTNo',
'				  									and a.SNo = vIQ.PurchaseOrderSNo',
'				  									and a.SerialNo = vIQ.PurchaseOrderSerialNo',
'				  									and vIQ.TestValue between a.LowerLimit and a.UpperLimit',
'				  							;				  							',
'				  					end if;',
'				  					-----------------------------------------------------------------------   ',
'				  					                                                                   ',
'				  					if :P152_PBPassOnCode = ''CHALAN'' then',
'				  							tQuantity1 := vIQ.ChalanQuantity1;',
'				  							tQuantity2 := vIQ.ChalanQuantity1;',
'				  							',
'				  							select',
'				  									sum(a.RejectedQuantity1),',
'				  									sum(a.RejectedQuantity2)',
'				  											into gQuantity1, gQuantity2',
'				  							from JoinInspectionDetail a',
'				  							where a.GRNTNO = vGRN.GRNTNo',
'				  									and a.ItemCode = vGRN.ItemCode',
'				  									and a.ItemSpecificationCode = vGRN.ItemSpecificationCode',
'				  							;',
'				  							tQuantity1 := tQuantity1 - nvl(gQuantity1, 0);',
'				  							',
'				  							-------------------------------------------------------------------------------------------------',
'				  					elsif :P152_PBPassOnCode = ''RECEIVED'' then',
'				  							tQuantity1 := vIQ.ReceivedQuantity1;',
'				  							tQuantity2 := vIQ.ReceivedQuantity2;',
'				  					elsif :P152_PBPassOnCode = ''ACCEPTED'' then',
'				  							tQuantity1 := vIQ.AcceptedQuantity1;',
'				  							tQuantity2 := vIQ.AcceptedQuantity2;				  							',
'				  					elsif :P152_PBPassOnCode = ''MINIMUM'' then',
'				  							tQuantity1 := ',
'				  									least(',
'				  											vIQ.ChalanQuantity1,',
'				  											vIQ.ReceivedQuantity1,',
'				  											vIQ.AcceptedQuantity1 ',
'				  									)',
'				  							;',
'				  							',
'				  							tQuantity2 := ',
'				  									least(',
'				  											vIQ.ChalanQuantity2,',
'				  											vIQ.ReceivedQuantity2,',
'				  											vIQ.AcceptedQuantity2 ',
'				  									)',
'				  							;',
'				  					elsif :P152_PBPassOnCode = ''MAXIMUM'' then',
'				  							tQuantity1 := ',
'				  									least(',
'				  											vIQ.ChalanQuantity1,',
'				  											vIQ.ReceivedQuantity1,',
'				  											vIQ.AcceptedQuantity1 ',
'				  									)',
'				  							;',
'				  							',
'				  							tQuantity2 := ',
'				  									least(',
'				  											vIQ.ChalanQuantity2,',
'				  											vIQ.ReceivedQuantity2,',
'				  											vIQ.AcceptedQuantity2 ',
'				  									)',
'				  							;',
'				  					else',
'				  							tQuantity1 := vIQ.AcceptedQuantity1;',
'				  							tQuantity2 := vIQ.AcceptedQuantity2;				  							',
'				  					end if;',
'				  					',
'				  					if vPB.RateMeasuringUnitCode = vPB.RateMeasuringUnitCode then',
'				  							tDeduction := ROUND(tDeduction + ( tQuantity1 * tVariation * tUnitRate ), 0) ;',
'				  					else',
'				  							tDeduction := ROUND(tDeduction + ( tQuantity2 * tVariation * tUnitRate ), 0);',
'				  					end if;',
'				  					tDeductionRate := tUnitRate;',
'				  			end if;',
'',
'				  			',
'				  			',
'				  			',
'				  			',
'				  			tGRNBonus := tGRNBonus + tBonus;',
'				  			tGRNDeduction := tGRNDeduction + tDeduction;',
'				  			',
'				  	end loop;',
'				  	',
'				END;',
'				',
'				',
'				',
'				:P152_GRNQUALITYBONUSAUTO := tGRNBonus;',
'				:P152_GRNQUALITYDEDUCTIONAUTO := tGRNDeduction;				',
'				',
'				:P152_GRNQUALITYBONUSMANUAL := tGRNBonus;',
'				:P152_GRNQUALITYDEDUCTIONMANUAL := tGRNDeduction;				',
'								',
'				tItemBonus := tItemBonus + tGRNBonus;',
'				tItemDeduction := tItemDeduction + tGRNDeduction;',
'				',
'		end loop;',
'		',
'		',
'',
'	:P152_DETAILQUALITYBONUSAUTO := tItemBonus;',
'  	:P152_DETAILQUALITYDEDUCTIONAUTO := tItemDeduction;',
'  	',
'  	:P152_DETAILQUALITYBONUSMANUAL := tItemBonus;',
'  	:P152_DETAILQUALITYDEDUCTIONMANUAL := tItemDeduction;',
'		',
'END;',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>161966107822350837
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(605320363405850240)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate TDS Amount'
,p_static_id=>'calculate-tds-amount'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tTDSAmount number;',
'    tWCTAmount number;',
'begin',
'    for vPBPassTDSDetail in',
'        (',
'        Select',
'            sum(a.FooterValue) as TDSAmount',
'        From PBPassTDSDetail a',
'        Where a.Tno = :P152_TNO',
'        )',
'    loop',
'        Update PBPass a',
'        Set a.SumOfTDSAmount = vPBPassTDSDetail.TDSAmount',
'        Where a.Tno = :P152_TNO',
'        ;',
'        tTDSAmount := vPBPassTDSDetail.TDSAmount;',
'    end loop;',
'    ----',
' /*   for vPBPassWCTDetail in',
'        (',
'        Select',
'            sum(a.FooterValue) as WCTAmount',
'        From PBPassWCTDetail a',
'        Where a.Tno = :P152_TNO',
'        )',
'    loop',
'        Update PBPass a',
'        Set a.SumOfWCTAmount = vPBPassWCTDetail.WCTAmount',
'        Where a.Tno = :P152_TNO',
'        ;',
'        tWCTAmount := vPBPassWCTDetail.WCTAmount;',
'    end loop;',
'    ----',
' */',
'    for vPBPass in',
'        (',
'        Select',
'            a.PBPassAmount',
'        From PBPass a',
'        Where a.Tno = :P152_TNO',
'        )',
'    loop',
'        Update PBPass a',
'        Set a.AmountAfterTDS = nvl(a.PBPassAmount, 0) - nvl(tWCTAmount, 0) - nvl(tTDSAmount, 0)',
'        Where a.Tno = :P152_TNO',
'        ;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>164934018154923716
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602137724205642418)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from PBPASSDETAIL where tno = :P152_TNO;',
'delete from PBPASSDETAILGRN where tno = :P152_TNO;',
'delete from PBPASSDETAILFOOTER where tno = :P152_TNO;',
'delete from pbpassfooter where tno = :P152_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(602124858507618823)
,p_internal_uid=>161751378954715894
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(452832648078877574)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P152_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13847778879179590
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602261760196037832)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(601383467526650840)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'--raise_application_error(-20000,:P152_PBPASSAMOUNT);',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into PBPASSDETAIL (                 ',
'                    TNO,',
'                    SNO,',
'                    PURCHASEORDERTNO,',
'                    ITEMCODE,',
'                    ITEMSPECIFICATIONCODE,',
'                    DESCRIPTION,',
'                    PURCHASEBILLQUANTITY1,',
'                    PURCHASEBILLQUANTITY2,',
'                    RECEIVEDQUANTITY1,',
'                    RECEIVEDQUANTITY2,',
'                    QUANTITY1,',
'                    QUANTITY2,',
'                    RATE,',
'                    RATEMEASURINGUNITCODE,',
'                    AMOUNT,',
'                    QUALITYDEDUCTION,',
'                    QUALITYBONUS,',
'                    FOOTERAMOUNT,',
'                    TOTALAMOUNT,',
'                    REMARK,',
'                    QUALITYDEDUCTIONAUTO,',
'                    QUALITYBONUSAUTO,',
'                    QUALITYDEDUCTIONMANUAL,',
'                    QUALITYBONUSMANUAL,',
'                    OTHERDEDUCTION,',
'                    ROUNDING,',
'                    FOOTERAMOUNTWITHRATE,',
'                    JOBORDERTNO,',
'                    ENTRYTAXPERCENT,',
'                    ENTRYTAXAMOUNT,',
'                    FOOTERCOSTAMOUNT,',
'                    ENTRYTAXFOOTERNATURECODE,',
'                    ENTRYTAXAMOUNTFORFREIGHT,',
'                    EXTRAFOOTERFORENTRYTAX,',
'                    TAXRULECODE,',
'                    QUALITYCODE,',
'                    PRORATA',
'',
'            )',
'            Values (',
'                :TNO,',
'                :SNO,',
'                :PURCHASEORDERTNO,',
'                :ITEMCODE,',
'                :ITEMSPECIFICATIONCODE,',
'                :DESCRIPTION,',
'                :PURCHASEBILLQUANTITY1,',
'                :PURCHASEBILLQUANTITY2,',
'                :RECEIVEDQUANTITY1,',
'                :RECEIVEDQUANTITY2,',
'                :QUANTITY1,',
'                :QUANTITY2,',
'                :RATE,',
'                :RATEMEASURINGUNITCODE,',
'                :AMOUNT,',
'                :QUALITYDEDUCTION,',
'                :QUALITYBONUS,',
'                :FOOTERAMOUNT,',
'                :TOTALAMOUNT,',
'                :REMARK,',
'                :QUALITYDEDUCTIONAUTO,',
'                :QUALITYBONUSAUTO,',
'                :QUALITYDEDUCTIONMANUAL,',
'                :QUALITYBONUSMANUAL,',
'                :OTHERDEDUCTION,',
'                :ROUNDING,',
'                :FOOTERAMOUNTWITHRATE,',
'                :JOBORDERTNO,',
'                :ENTRYTAXPERCENT,',
'                :ENTRYTAXAMOUNT,',
'                :FOOTERCOSTAMOUNT,',
'                :ENTRYTAXFOOTERNATURECODE,',
'                :ENTRYTAXAMOUNTFORFREIGHT,',
'                :EXTRAFOOTERFORENTRYTAX,',
'                :TAXRULECODE,',
'                :QUALITYCODE,',
'                :PRORATA',
'            );',
'        ',
'        when ''U'' then',
'            update PBPASSDETAIL Set',
'                  TNO=:TNO,',
'                    SNO=:SNO,',
'                    PURCHASEORDERTNO=:PURCHASEORDERTNO,',
'                    ITEMCODE=:ITEMCODE,',
'                    ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'                    DESCRIPTION=:DESCRIPTION,',
'                    PURCHASEBILLQUANTITY1=:PURCHASEBILLQUANTITY1,',
'                    PURCHASEBILLQUANTITY2=:PURCHASEBILLQUANTITY2,',
'                    RECEIVEDQUANTITY1=:RECEIVEDQUANTITY1,',
'                    RECEIVEDQUANTITY2=:RECEIVEDQUANTITY2,',
'                    QUANTITY1=:QUANTITY1,',
'                    QUANTITY2=:QUANTITY2,',
'                    RATE=:RATE,',
'                    RATEMEASURINGUNITCODE=:RATEMEASURINGUNITCODE,',
'                    AMOUNT=:AMOUNT,',
'                    QUALITYDEDUCTION=:QUALITYDEDUCTION,',
'                    QUALITYBONUS=:QUALITYBONUS,',
'                    FOOTERAMOUNT=:FOOTERAMOUNT,',
'                    TOTALAMOUNT=:TOTALAMOUNT,',
'                    REMARK=:REMARK,',
'                    QUALITYDEDUCTIONAUTO=:QUALITYDEDUCTIONAUTO,',
'                    QUALITYBONUSAUTO=:QUALITYBONUSAUTO,',
'                    QUALITYDEDUCTIONMANUAL=:QUALITYDEDUCTIONMANUAL,',
'                    QUALITYBONUSMANUAL=:QUALITYBONUSMANUAL,',
'                    OTHERDEDUCTION=:OTHERDEDUCTION,',
'                    ROUNDING=:ROUNDING,',
'                    FOOTERAMOUNTWITHRATE=:FOOTERAMOUNTWITHRATE,',
'                    JOBORDERTNO=:JOBORDERTNO,',
'                    ENTRYTAXPERCENT=:ENTRYTAXPERCENT,',
'                    ENTRYTAXAMOUNT=:ENTRYTAXAMOUNT,',
'                    FOOTERCOSTAMOUNT=:FOOTERCOSTAMOUNT,',
'                    ENTRYTAXFOOTERNATURECODE=:ENTRYTAXFOOTERNATURECODE,',
'                    ENTRYTAXAMOUNTFORFREIGHT=:ENTRYTAXAMOUNTFORFREIGHT,',
'                    EXTRAFOOTERFORENTRYTAX=:EXTRAFOOTERFORENTRYTAX,',
'                    TAXRULECODE=:TAXRULECODE,',
'                    QUALITYCODE=:QUALITYCODE,',
'                    PRORATA=:PRORATA',
'',
'            WHERE TNO = :P152_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From PBPASSDETAIL',
'            Where TNo = :P152_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>161875414945111308
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602349032003277326)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(602264427724037858)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DETAILFOOTER - Save Interactive Grid Data'
,p_static_id=>'detailfooter-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>161962686752350802
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(454431508445978915)
,p_process_sequence=>170
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get debit voucherno'
,p_static_id=>'get-debit-voucherno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin ',
'    for vloop in ( ',
'        select VOUCHERNO , TNO from voucher ',
'        where moduletno = :P152_TNO',
'          AND DOCTYPECODE=''DEBITNOTE''',
'    )',
'     loop',
'        :P152_DEBITNOTENO := VLOOP.VOUCHERNO;',
'        :P152_DEBITNOTETNO := vloop.tno;',
'     end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15446639246280931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602137410353641243)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P152_Tno is null then',
'        Select GlobalTno.NextVal into :P152_Tno From Dual;',
'     end if;',
'    ----',
'    if :P152_PBPASSNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P152_LocationCode,',
'					:P152_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P152_PBPASSDATE, ''DD-MM-RRRR'')',
'				);',
'        :P152_PBPASSNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P152_LocationCode,',
'                    :P152_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P152_PBPASSDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'',
'    --raise_application_error(-20000,:P152_PBPASSAMOUNT);',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>161751065102714719
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602119690850611385)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P152_TNO is null then',
'    :P152_TNO := GlobalTNo.nextval;',
'    :P152_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P152_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'',
'----',
'',
'for pBill in (',
'select B.PURCHASEBILLAMOUNT, A.PBPASSAMOUNT ',
'from pbpass a, purchasebill b',
'where a.purchasebilltno = b.tno(+)',
'and a.tno = :P152_TNO',
') loop',
'    :P152_BILLAMOUNT := PBILL.PURCHASEBILLAMOUNT;',
'    :P152_DEBITNOTEAMOUNT := NVL(:P152_BILLAMOUNT, 0) - NVL(:P152_PBPASSAMOUNT, 0) ;--+ NVL(:P152_ROUNDOFF, 0);',
'end loop;',
'--- DR P152_DEBITNOTEAMOUNT',
'--select nvl(DEBITNOTEAMOUNT,(:P152_PBPASSAMOUNT - NVL(:P152_BILLAMOUNTT,0))) INTO  :P152_DEBITNOTEAMOUNT from debitnote     ',
'--where REFERENCEMODULETNO = :P152_TNO;',
'',
'',
':P152_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P152_TNO), ''Status'');',
'',
'select nvl(:P152_PBPASSAMOUNT,0)-nvl(:P152_SUMOFTDSAMOUNT,0)-nvl(:P152_PAIDINADVANCE,0)',
' into :P152_NETPAYABLEAMOUNT from dual;',
'',
' if :P152_BILLINROUNDFIGURE is null then  ',
'        :P152_BILLINROUNDFIGURE := ''YES'';',
' end if;',
'',
'-- Get the NatureofSupply with explicit exception handling',
'IF :P152_NATUREOFSUPPLY IS NULL AND :P152_TNO IS NOT NULL THEN',
'    BEGIN',
'        SELECT pb.NatureofSupplyCode ',
'        INTO :P152_NATUREOFSUPPLY',
'        FROM PurchaseBill pb',
'        WHERE EXISTS (',
'            SELECT 1 ',
'            FROM PBPASS x ',
'            WHERE x.purchasebilltno = pb.tno ',
'              AND x.tno = :P152_TNO',
'        );',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            :P152_NATUREOFSUPPLY := NULL; ',
'        WHEN TOO_MANY_ROWS THEN',
'            :P152_NATUREOFSUPPLY := NULL;',
'    END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>161733345599684861
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602119978890612924)
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
'       :P152_MODULEFLOW := ''YES'';',
'   else',
'       :P152_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P152_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P152_ONTHETABLE := ''YES'' ;',
'   else',
'       :P152_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>161733633639686400
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602046002722228894)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(601994468342228812)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Purchase Bill Pass'
,p_static_id=>'initialize-form-purchase-bill-pass'
,p_internal_uid=>161659657471302370
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(605320015186850236)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert Into Footer'
,p_static_id=>'insert-into-footer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from pbpassfooter where tno = :P152_TNO;',
'',
'insert into pbpassfooter',
'    (',
'        TNO,',
'        FOOTERHEADCODE,',
'        FOOTERVALUE',
'    )',
'    (',
'        select ',
'            :P152_TNO,',
'            FOOTERHEADCODE,',
'            sum(FOOTERVALUE)',
'',
'        from pbpassdetailfooter',
'        where tno = :P152_TNO',
'        group by FOOTERHEADCODE',
'    );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>164933669935923712
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(454407850747940809)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(454406770486940799)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'PaidInAdvance - Save Interactive Grid Data'
,p_static_id=>'paidinadvance-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15422981548242825
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(455356462316181886)
,p_process_sequence=>190
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(454409456349940825)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'PBPassTDSDeductedInAdvance - Save Interactive Grid Data'
,p_static_id=>'pbpasstdsdeductedinadvance-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16371593116483902
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602138487744645379)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_static_id=>'prepare-url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(2000);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>161752142493718855
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602046387514228897)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(601994468342228812)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Purchase Bill Pass'
,p_static_id=>'process-form-purchase-bill-pass'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>161660042263302373
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602137981594643729)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P152_TNO, :P152_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(602125696171618823)
,p_internal_uid=>161751636343717205
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(452832057158875743)
,p_process_sequence=>160
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P152_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P152_ALLOWEDBACK,:P152_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'else',
'     :P152_ALLOWEDBACK       := :P152_PBPASSDATE ; ',
'    :P152_ALLOWEDFORWARD    := :P152_PBPASSDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13847187959177759
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(605320268224850239)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetTDSAndThreshold'
,p_static_id=>'settdsandthreshold'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tExpenseAmount Number;',
'    tThisExpenseAmount Number;',
'    tTDSAmount Number;',
'    tTotalExpenseAmount Number;',
'begin',
'    for vParty in ',
'        (',
'        select ',
'            a.TDSPayeeCategoryCode',
'        from Party a',
'        where a.PartyCode = :P152_PartyCode ',
'        )',
'    loop ',
'        update PBPASS a',
'        set a.TDSPayeeCategoryCode = vParty.TDSPayeeCategoryCode',
'        where a.Tno = :P152_TNO',
'        ;',
'    end loop;',
'    --',
'    update PBPASS a',
'    set a.TDSTaxCategoryCode = GetTDSTaxCategoryCode(:P152_TDSPayeeCategoryCode, :P152_TDSNatureCode, :P152_PBPASSDate),',
'        a.PANNo = GetPartyAttributeValue(:P152_PartyCode, ''PANNO'')',
'    where a.Tno = :P152_TNO',
'    ;',
'    ----',
'    for vTDSTaxCategory in',
'        (',
'        select',
'            b.TotalTDSPercentWithPAN,',
'            b.TotalTDSPercentWithoutPAN,',
'            b.Threshold,',
'            b.TransactionThreshold',
'        from TDSTaxCategory a, TDSTaxCategoryDetail b',
'        where a.TNo = b.TNo ',
'            and a.TDSTaxCategoryCode = :P152_TDSTaxCategoryCode',
'            and b.TDSPayeeCategoryCode = :P152_TDSPayeeCategoryCode',
'        )',
'    loop',
'        --',
'        update PBPASS a',
'        set a.TDSThreshold = vTDSTaxCategory.Threshold,',
'            a.TDSTransactionThreshold = vTDSTaxCategory.TransactionThreshold',
'        where a.Tno = :P152_TNO',
'        ;',
'        --',
'        if :P152_PANNo is null then ',
'            update PBPASS a',
'            set a.TotalTDSPercent = vTDSTaxCategory.TotalTDSPercentWithoutPAN',
'            where a.Tno = :P152_TNO',
'            ;',
'        else ',
'            update PBPASS a',
'            set a.TotalTDSPercent = vTDSTaxCategory.TotalTDSPercentWithPAN',
'            where a.Tno = :P152_TNO',
'            ;',
'        end if;',
'        exit;',
'    end loop;',
'    ----',
'    if nvl(:P152_TDSThreshold, 0) > 0 then ',
'        select ',
'            sum(b.TDSAmount)',
'            into  tTDSAmount',
'        from Voucher a, VoucherTDSDeducted b ',
'        where a.TNo = b.TNo ',
'            and b.PartyCode = :P152_PartyCode',
'            and a.FinancialYearCode = :P152_FinancialYearCode',
'            and b.TDSNatureCode = :P152_TDSNatureCode',
'        ;',
'    if nvl(tTDSAmount, 0) > 0 then ',
'        update PBPASS a',
'        set a.ThresholdPlusMinus = 0',
'        where a.Tno = :P152_TNO',
'        ;',
'    else ',
'        --',
'        select ',
'            sum(-1 * b.ThresholdPlusMinus )',
'            into  tExpenseAmount',
'        from Voucher a, VoucherTDSDeducted b ',
'        where a.TNo = b.TNo ',
'            and b.PartyCode = :P152_PartyCode',
'            and a.FinancialYearCode = :P152_FinancialYearCode',
'            and b.ThresholdPlusMinus < 0',
'            and b.AdvanceOrBill = ''BILL''',
'            and b.TDSNatureCode = :P152_TDSNatureCode',
'            and a.VoucherNo != ''OPENING''',
'        ;',
'',
'        tThisExpenseAmount := nvl(:P152_SumOfAmount, 0);',
'        --',
'        tTotalExpenseAmount := nvl(tExpenseAmount, 0) + nvl(tThisExpenseAmount, 0);',
'        --',
'        if nvl(tTotalExpenseAmount, 0) > nvl(:P152_TDSThreshold, 0) or  nvl(tThisExpenseAmount, 0) > nvl(:P152_TDSTransactionThreshold, 0) then ',
'            update PBPASS a',
'            set a.ThresholdPlusMinus = tExpenseAmount',
'            where a.Tno = :P152_TNO',
'            ;',
'        else ',
'            update PBPASS a',
'            set a.ThresholdPlusMinus = -1 * tThisExpenseAmount',
'            where a.Tno = :P152_TNO',
'            ;',
'        end if;',
'        --',
'        end if;',
'        --',
'    end if;',
'',
'    update PBPASS a',
'    set a.AdvanceOrBill = ''BILL''',
'    where a.Tno = :P152_TNO',
'    ;',
'     ',
'    for vPBPASS in',
'        (',
'        Select',
'            a.AdvanceOrBill,',
'            a.TotalTDSPercent,',
'            a.SumOfAmount,',
'            a.ThresholdPlusMinus,',
'            a.TDSDeductedInAdvance',
'        From PBPASS a',
'        Where a.Tno = :P152_TNO',
'        )',
'    loop',
'        if vPBPASS.AdvanceOrBill = ''BILL'' and vPBPASS.TotalTDSPercent > 0 and nvl(vPBPASS.SumOfAmount, 0) > nvl(vPBPASS.TDSDeductedInAdvance, 0) then ',
'            update PBPASS a',
'            set a.TDSDeductableAmount = nvl(vPBPASS.SumOfAmount, 0) + nvl(vPBPASS.ThresholdPlusMinus, 0) - nvl(vPBPASS.TDSDeductedInAdvance, 0)',
'            --set a.TDSDeductableAmount = nvl(:P152_PBPASSAMOUNT,0)-nvl(:P152_PAIDINADVANCE,0)',
'            where a.Tno = :P152_TNO',
'            ;',
'    	else',
'            update PBPASS a',
'            set a.TDSDeductableAmount = 0',
'            where a.Tno = :P152_TNO',
'            ;',
'    		:P152_TDSDeductableAmount := 0;',
'        end if;',
'        exit;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>164933922973923715
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(607088394273783541)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(607087246093783530)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'TDS - Save Interactive Grid Data'
,p_static_id=>'tds-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>166702049022857017
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(602353362276277370)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update PBPASSGRN'
,p_static_id=>'update-pbpassgrn'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P152_FORMSTATUS = ''NEWRECORD'' or :P152_FORMSTATUS = ''EDITRECORD'' then',
'    update PBPASSDETAILGRN ',
'    set  QUALITYDEDUCTIONAUTO = nvl(:P196_GRNQUALITYDEDUCTIONAUTO,0),',
'        QUALITYBONUSAUTO = nvl(:P196_GRNQUALITYBONUSAUTO,0),',
'        QUALITYDEDUCTIONMANUAL = nvl(:P196_GRNQUALITYDEDUCTIONMANUAL,0),',
'        QUALITYBONUSMANUAL = nvl(:P196_GRNQUALITYBONUSMANUAL,0),',
'        OTHERDEDUCTION = nvl(:P196_OTHERDEDUCTION,0)',
'    where tno = :P152_TNO;',
'end if;',
'',
'                               '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>161967017025350846
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90015220260926125)
,p_process_sequence=>125
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Purchase Bill Pass calculations before commit'
,p_static_id=>'verify-pbpass-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number;',
'  l_sa number:=0; l_sf number:=0; l_st number:=0;',
'  procedure add_error(p varchar2) is begin l_count:=l_count+1; if l_count<=8 then l_errors:=l_errors||case when l_errors is null then null else '' | '' end||p; end if; end;',
'  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;',
'begin',
'  for d in (select d.*,nvl((select sum(f.footervalue) from pbpassdetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs from pbpassdetail d where d.tno=:P152_TNO order by d.sno) loop',
'    l_amount:=nvl(d.quantity1,0)*nvl(d.rate,0); l_footer:=d.fs;',
'    if different(d.amount,l_amount,.01) then add_error(''SNO ''||d.sno||'' Amount expected ''||l_amount||'', found ''||nvl(d.amount,0)); end if;',
'    if different(d.footeramount,l_footer,.01) then add_error(''SNO ''||d.sno||'' FD/Other expected ''||l_footer||'', found ''||nvl(d.footeramount,0)); end if;',
'    if different(d.totalamount,l_amount+l_footer,.01) then add_error(''SNO ''||d.sno||'' Total expected ''||(l_amount+l_footer)||'', found ''||nvl(d.totalamount,0)); end if;',
'    l_sa:=l_sa+nvl(d.amount,0); l_sf:=l_sf+nvl(d.footeramount,0); l_st:=l_st+nvl(d.totalamount,0);',
'  end loop;',
'  for h in (select sumofamount,sumoffooteramount,pbpassamountbeforeround from pbpass where tno=:P152_TNO) loop',
'    if different(h.sumofamount,l_sa,.01) then add_error(''Summary Amount expected ''||l_sa||'', found ''||nvl(h.sumofamount,0)); end if;',
'    if different(h.sumoffooteramount,l_sf,.01) then add_error(''Summary Footer expected ''||l_sf||'', found ''||nvl(h.sumoffooteramount,0)); end if;',
'    if different(h.pbpassamountbeforeround,l_st,.01) then add_error(''Bill Pass Amount Before Round expected ''||l_st||'', found ''||nvl(h.pbpassamountbeforeround,0)); end if;',
'  end loop;',
'  if l_errors is not null then raise_application_error(-20053,''Save blocked - Purchase Bill Pass calculation mismatch: ''||l_errors||''. No data from this save was committed.''); end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>90015220260926125
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
