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
--     PAGE: 146
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00146
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>146);
end;
/
prompt --application/pages/page_00146
begin
wwv_flow_imp_page.create_page(
 p_id=>146
,p_name=>'GRN'
,p_alias=>'GRN'
,p_step_title=>'GRN'
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
'function ud() {',
'        // Get the modal element by ID',
'        //if (apex.item(''P146_STOCKREQUIRED'').getValue()==''YES'' ) {',
'                openModal(''DetailStorage'');',
'       // }',
'}',
'',
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P146_DOCTYPECODE'').getValue()==''CONVERSIONJOBOUTOFPREMISES'' ||',
'        apex.item(''P146_DOCTYPECODE'').getValue()==''SALERETURN''',
'         ) {',
'                openModal(''StockStorageDetail'');',
'        }',
'}',
'',
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
'  var bireporturl = $(''#P146_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/GRN.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P146_TNO'').val() ',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P146_BIREPORTURL'').val()',
'  var reportName =  ''GRN.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P146_TNO'').val() ',
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
'',
'/* GRN_DETAIL_HORIZONTAL_SYNC_NATIVE_V5 */',
'(function () {',
'  function bindGrnDetailHeaderSync() {',
'    var grid = document.getElementById(''GrnDetail_ig'');',
'    if (!grid) { return; }',
'',
'    var body = grid.querySelector(''.a-GV-bdy'');',
'    var header = grid.querySelector(''.a-GV-w-hdr'');',
'    if (!body || !header || body.dataset.grnHorizontalSyncV5 === ''Y'') { return; }',
'',
'    body.dataset.grnHorizontalSyncV5 = ''Y'';',
'    header.scrollLeft = body.scrollLeft;',
'    body.addEventListener(''scroll'', function () {',
'      header.scrollLeft = body.scrollLeft;',
'    }, { passive: true });',
'  }',
'',
'  function scheduleBinding() {',
'    window.setTimeout(bindGrnDetailHeaderSync, 0);',
'  }',
'',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', scheduleBinding, { once: true });',
'  } else {',
'    scheduleBinding();',
'  }',
'',
'  document.addEventListener(''click'', function (event) {',
'    if (event.target.closest(''.t-Tabs-link'')) { scheduleBinding(); }',
'  });',
'',
'  new MutationObserver(scheduleBinding).observe(document.documentElement, {',
'    childList: true,',
'    subtree: true',
'  });',
'})();',
'',
'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',
'(function(){',
'  "use strict";',
'  if(Number(apex.env.APP_PAGE_ID||0)!==146||window.hsplCrossformDetailIntegrityV1)return;',
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
'',
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
 p_id=>wwv_flow_imp.id(1375603989088055716)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_parent_plug_id=>wwv_flow_imp.id(633982718272365468)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
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
'       b.PARTYATTRIBUTEname',
'  from MODULEATTACHMENT A, partyattribute b',
'  WHERE A.MODULETNO = :P146_TNO',
'  and a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P146_TNO'
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
 p_id=>wwv_flow_imp.id(1375604733663055724)
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
,p_detail_link=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO,P1063_ATTRIBUTECODE,P1063_PARENT_FORMSTATUS:#MODULETNO#,#ATTRIBUTECODE#,&P146_FORMSTATUS.#SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>1375604733663055724
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375605303149055729)
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
 p_id=>wwv_flow_imp.id(1095220714867926037)
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
 p_id=>wwv_flow_imp.id(1222819589390870412)
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
 p_id=>wwv_flow_imp.id(1375605374389055730)
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
 p_id=>wwv_flow_imp.id(943351504138240529)
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
 p_id=>wwv_flow_imp.id(941957228804109478)
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
 p_id=>wwv_flow_imp.id(539985445011125132)
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
 p_id=>wwv_flow_imp.id(1375604892966055725)
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
 p_id=>wwv_flow_imp.id(1378250323061031178)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(930100317648535144)
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
 p_id=>wwv_flow_imp.id(1297487260258606020)
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
 p_id=>wwv_flow_imp.id(793149763636681631)
,p_plug_name=>'DetailStorage'
,p_static_id=>'detailstorage'
,p_region_name=>'DetailStorage'
,p_region_css_classes=>'js-dialog-size900x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SN,',
'       STORAGELOCATIONCODE,',
'       INITIALREADING,',
'       FINALREADING,',
'       DIFFERENCEREADING,',
'       UNLOADINGQUANTITY1,',
'       UNLOADINGQUANTITY2,',
'       REMARK,',
'       rejectedquantity1,',
'       rejectedquantity2',
'  from GRNDETAILSTORAGE',
'  where tno = :P146_TNO',
'  and sno = :P146_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(791584114826107354)
,p_ajax_items_to_submit=>'P146_TNO,P146_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'DetailStorage'
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
 p_id=>wwv_flow_imp.id(641802603047137689)
,p_heading=>'Received'
,p_static_id=>'received'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(641802704067137690)
,p_heading=>'Rejected'
,p_static_id=>'rejected'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793151024364681644)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793151151679681645)
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
 p_id=>wwv_flow_imp.id(793150568761681639)
,p_name=>'DIFFERENCEREADING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIFFERENCEREADING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Difference Reading'
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
 p_id=>wwv_flow_imp.id(793150444844681638)
,p_name=>'FINALREADING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FINALREADING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Final Reading'
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
 p_id=>wwv_flow_imp.id(793150326574681637)
,p_name=>'INITIALREADING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIALREADING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Initial Reading'
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
 p_id=>wwv_flow_imp.id(641802426138137687)
,p_name=>'REJECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REJECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(641802704067137690)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(641802499962137688)
,p_name=>'REJECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REJECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(641802704067137690)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(793150866360681642)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_imp.id(793150928678681643)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793150139790681635)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793150095546681634)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(791584392378107357)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793150238394681636)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Storage Location'
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select STORAGELOCATIONNAME , STORAGELOCATIONCODE from storagelocation'
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
 p_id=>wwv_flow_imp.id(793149994932681633)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P146_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793150655749681640)
,p_name=>'UNLOADINGQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNLOADINGQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(641802603047137689)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(793150739800681641)
,p_name=>'UNLOADINGQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNLOADINGQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(641802603047137689)
,p_use_group_for=>'BOTH'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(793149837742681632)
,p_internal_uid=>793149837742681632
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
 p_id=>wwv_flow_imp.id(793177207465096702)
,p_interactive_grid_id=>wwv_flow_imp.id(793149837742681632)
,p_static_id=>'223247'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(793177417093096702)
,p_report_id=>wwv_flow_imp.id(793177207465096702)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(642201968435378455)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(641802426138137687)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85.583
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(642202926874378457)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(641802499962137688)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85.569
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793177848464096704)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(793149994932681633)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793178723300096708)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(793150095546681634)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793179678809096712)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(793150139790681635)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793180596305096715)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(793150238394681636)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793181454629096719)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(793150326574681637)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793182410164096723)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(793150444844681638)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793183225046096727)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(793150568761681639)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793184175582096731)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(793150655749681640)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95.98599999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793184964164096735)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(793150739800681641)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95.993
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793185910484096738)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(793150866360681642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793186811902096742)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(793150928678681643)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793187714598096746)
,p_view_id=>wwv_flow_imp.id(793177417093096702)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(793151024364681644)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(793114131398680152)
,p_plug_name=>'EQ'
,p_static_id=>'eq'
,p_region_name=>'EQ'
,p_region_css_classes=>'js-dialog-size900x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SN,',
'       COMPANYSERIALNO,',
'       QUANTITY1,',
'       QUANTITY2,',
'       WARRANTYUPTODATE,',
'       REMARK,',
'       WARRANTYPROVIDERCODE,',
'       MANUFACTUREMODELCODE,',
'       MANUFACTUREMAKECODE',
'  from GRNSERIALNO',
'  where tno = :P146_TNO',
'  and sno = :P146_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(791584114826107354)
,p_ajax_items_to_submit=>'P146_TNO,P146_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'EQ'
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
 p_id=>wwv_flow_imp.id(793115461638680165)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793115577510680166)
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
 p_id=>wwv_flow_imp.id(793114639522680157)
,p_name=>'COMPANYSERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPANYSERIALNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Companyserialno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(793115338505680164)
,p_name=>'MANUFACTUREMAKECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MANUFACTUREMAKECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Manufacture Make'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(793115228180680163)
,p_name=>'MANUFACTUREMODELCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MANUFACTUREMODELCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Manufacture Model'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(793114740472680158)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
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
 p_id=>wwv_flow_imp.id(793114910063680159)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
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
 p_id=>wwv_flow_imp.id(793115035287680161)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(793115740028680168)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793114583707680156)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793114500783680155)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(791584392378107357)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793114385040680154)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P146_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793115170466680162)
,p_name=>'WARRANTYPROVIDERCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WARRANTYPROVIDERCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Warranty Provider'
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
 p_id=>wwv_flow_imp.id(793114940233680160)
,p_name=>'WARRANTYUPTODATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WARRANTYUPTODATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Warranty Upto Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(793114324251680153)
,p_internal_uid=>793114324251680153
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
 p_id=>wwv_flow_imp.id(793120925651764918)
,p_interactive_grid_id=>wwv_flow_imp.id(793114324251680153)
,p_static_id=>'223024'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(793121146617764919)
,p_report_id=>wwv_flow_imp.id(793120925651764918)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793121722064764922)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(793114385040680154)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793122599830764926)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(793114500783680155)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793123511654764930)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(793114583707680156)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793124369788764934)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(793114639522680157)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793125319835764938)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(793114740472680158)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94.9722
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793126148392764943)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(793114910063680159)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.9688
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793127102768764948)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(793114940233680160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134.483
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793127940485764952)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(793115035287680161)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793128882037764956)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(793115170466680162)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>153.47899999999998
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793129808345764960)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(793115228180680163)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160.4792
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793130677860764965)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(793115338505680164)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793132551527767318)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(793115461638680165)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793138759982778587)
,p_view_id=>wwv_flow_imp.id(793121146617764919)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(793115740028680168)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(641800840693137671)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(635135915118316562)
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
 p_id=>wwv_flow_imp.id(635135915118316562)
,p_plug_name=>'GRN'
,p_static_id=>'grn'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(633982718272365468)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       GRNNO,',
'       GRNDATE,',
'       PARTYCODE,',
'       WEIGHMENTTNO,',
'       MATERIALINTNO,',
'       PURCHASEORDERTNO,',
'       JOBORDERTNO,',
'       DELIVERYORDERTNO,',
'       TRANSPORTERCODE,',
'       DRIVERNAME,',
'       VEHICLETYPECODE,',
'       VEHICLENO,',
'       REFDOCTYPECODE,',
'       REFDOCNO,',
'      -- utl_i18n.unescape_reference(REFDOCNO) AS REFDOCNO,',
'       REFDOCDATE,',
'       REFDOCAMOUNT,',
'       FREIGHTTYPECODE,',
'       CCINVOICETNO,',
'       MODULECODE,',
'       MODULETNO,',
'       LRNO,',
'       GATEPASSTNO,',
'       LRDATE,',
'       DELIVERYORDERSNO,',
'       EMPLOYEECODE,',
'       CHALLANNO,',
'       POAMENDMENTTNO,',
'       UNLOADEDBY,',
'       COMPANYVEHICLECODE,',
'       FROMCITYCODE,',
'       FREIGHTRATE,',
'       FREIGHTAMOUNT,',
'       FREIGHTUNITCODE,',
'       FREIGHTPOSTEDTOSTOCK,',
'       LIFTINGFROMCITYCODE,',
'       FREIGHTADVANCEAMOUNT,',
'       FREIGHTADVANCEPERCENT,',
'       FREIGHTADVANCECHARGEDONCODE,',
'       LOADINGSTORAGELOCATIONCODE,',
'       DEDUCTIONRATE,',
'       DRIVERMOBILENO,',
'       INCLUDEINPURCHASEBILL,',
'       REMARK,',
'       CREATOR,',
'       CREATIONTIME,',
'       loadingadvicetno',
'  from GRN'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(791584114826107354)
,p_plug_name=>'GrnDetail'
,p_static_id=>'grndetail'
,p_region_name=>'GrnDetail'
,p_parent_plug_id=>wwv_flow_imp.id(633982718272365468)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.rowid , a.TNO,',
'       a.SNO,',
'       a.ITEMCODE,',
'       a.ITEMSPECIFICATIONCODE,',
'       a.STOREAGELOCATIONCODE,',
'       a.CHALANQUANTITY1,',
'       a.RECEIVEDQUANTITY1,',
'       a.CHALANQUANTITY2,',
'       a.RECEIVEDQUANTITY2,',
'       a.INSPECTEDQUANTITY1,',
'       a.INSPECTEDQUANTITY2,',
'       a.ACCEPTEDQUANTITY1,',
'       a.ACCEPTEDQUANTITY2,',
'       a.REJECTEDQUANTITY1,',
'       a.REJECTEDQUANTITY2,',
'       a.JOININSPECTEDQUANTITY1,',
'       a.JOININSPECTEDQUANTITY2,',
'       a.JOINACCEPTEDQUANTITY1,',
'       a.JOINACCEPTEDQUANTITY2,',
'       a.JOINREJECTEDQUANTITY1,',
'       a.JOINREJECTEDQUANTITY2,',
'       a.RATE,',
'       a.RATEMEASURINGUNITCODE,',
'       a.DISCREPANCYAMOUNT,',
'       a.DISCREPANCYTYPECODE,',
'       a.DISCREPANCYQUANTITY1,',
'       a.DISCREPANCYQUANTITY2,',
'       a.AMOUNT,',
'       a.REMARK,',
'       a.PACKINGTYPECODE,',
'       a.DESCRIPTION,',
'    --   a.STORAGELOCATIONCODE,',
'       a.PURCHASEORDERTNO,',
'       a.JOBORDERTNO,',
' --      a.MRNQUANTITY1,',
'     --  a.MRNQUANTITY2,',
'       a.PACKINGNOS,',
'       a.POAMENDMENTTNO,',
'      -- a.SERIALNO,',
'      -- a.ISEXCISABLE,',
'       --a.ISCAPITAL,',
'      -- a.MBILLNO,',
'       --a.MBILLDATE,',
'       a.QCLESSQUANTITY1,',
'       a.RECEIVEDQUANTITY1WITHOUTQC,',
'       a.PACKINGWEIGHT,',
'       a.FREIGHTPOSTEDTOSTOCK,',
'       a.JOBPOSTEDTOSTOCK,',
'       a.WARRANTYUPTO,',
'       a.PURCHASEPOSTEDTOSTOCK,',
'       a.PURCHASEPOSTEDTOSTOCKRATE,',
'       a.FREIGHTPOSTEDTOSTOCKRATE,',
'       a.JOBPOSTEDTOSTOCKRATE,',
'       ''EQ'' as EQ,',
'       ''SD'' as SD,',
'       ''UD'' as UD,',
'      GETDINSPECTIONNO(:P146_TNO) as DINSPECTIONNO,',
'      GETDINSPECTIONDATE(:P146_TNO) as DINSPECTIONDATE,',
'      GetMeasuringUnitNameFromItem(itemcode) as unit1,',
'      GetMeasuringUnit2NameFromItem(itemcode) as unit2,',
'      A.ITEMCODE as ITEMCODE1,',
'      A.ITEMSPECIFICATIONCODE as ITEMSPECIFICATIONCODE1,',
'      nvl(a.CHALANQUANTITY1,0) - nvl(a.RECEIVEDQUANTITY1,0) as RejectQuantity',
'  from GRNDETAIL a',
'  where a.tno = :P146_TNO',
'  ',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P146_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GrnDetail'
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
 p_id=>wwv_flow_imp.id(795331050247881071)
,p_heading=>'Inspection'
,p_static_id=>'inspection'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(792259664269503863)
,p_heading=>'Item'
,p_static_id=>'item'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(792259774003503864)
,p_heading=>'Packing'
,p_static_id=>'packing'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(792259876806503865)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(792259990646503866)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791585370588107367)
,p_name=>'ACCEPTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Accepted Qty1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(795331050247881071)
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
 p_id=>wwv_flow_imp.id(791585457202107368)
,p_name=>'ACCEPTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256728717503833)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
 p_id=>wwv_flow_imp.id(792259297755503859)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792259421710503860)
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
 p_id=>wwv_flow_imp.id(791584752700107361)
,p_name=>'CHALANQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Chalan'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(792259876806503865)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_format_mask=>'9999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'CHALANQUANTITY1'
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
 p_id=>wwv_flow_imp.id(791584993050107363)
,p_name=>'CHALANQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalan'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(792259990646503866)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
 p_id=>wwv_flow_imp.id(792256943846503836)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(792259664269503863)
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
 p_id=>wwv_flow_imp.id(795330765331881068)
,p_name=>'DINSPECTIONDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DINSPECTIONDATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dinspection Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(795331050247881071)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_item_width=>20
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(795330648780881067)
,p_name=>'DINSPECTIONNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DINSPECTIONNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dinspection No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>530
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(795331050247881071)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256314359503829)
,p_name=>'DISCREPANCYAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCREPANCYAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256470145503831)
,p_name=>'DISCREPANCYQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCREPANCYQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>360
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256622149503832)
,p_name=>'DISCREPANCYQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCREPANCYQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>370
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256365569503830)
,p_name=>'DISCREPANCYTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCREPANCYTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Discrepancy Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(792260040907503867)
,p_name=>'EQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EQ'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Eq'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''EQ'')'
,p_link_text=>'&EQ.'
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
,p_default_expression=>'<a href="javascript:openModal(''EQ'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">EQ</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792258603224503852)
,p_name=>'FREIGHTPOSTEDTOSTOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FREIGHTPOSTEDTOSTOCK'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>430
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792259101130503857)
,p_name=>'FREIGHTPOSTEDTOSTOCKRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FREIGHTPOSTEDTOSTOCKRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>470
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791585206338107365)
,p_name=>'INSPECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSPECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Inspected'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791585305791107366)
,p_name=>'INSPECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSPECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791584535121107358)
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
,p_group_id=>wwv_flow_imp.id(792259664269503863)
,p_use_group_for=>'BOTH'
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
'select itemname , itemcode from item',
'where getdocumentstatuscode(''ITEM'',TNO) = ''ACTIVE''',
'and :P146_MATERIALINTNO is null',
'and :P146_LOADINGADVICETNO is null  ',
'and :P146_PURCHASEORDERTNO is null ',
'union all',
'select itemname , itemcode from item',
'where getdocumentstatuscode(''ITEM'',TNO) = ''ACTIVE''',
'and itemcode in (select distinct itemcode from materialindetail where tno = :P146_MATERIALINTNO )',
'union all',
'select itemname , itemcode from item',
'where getdocumentstatuscode(''ITEM'',TNO) = ''ACTIVE''',
'and itemcode in (select distinct itemcode from loadingadvicedetail where tno = :P146_LOADINGADVICETNO )',
'union all',
'select itemname , itemcode from item',
'where getdocumentstatuscode(''ITEM'',TNO) = ''ACTIVE''',
'and itemcode in (select distinct itemcode from purchaseorderdetail where tno = :P146_PURCHASEORDERTNO )'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P146_MATERIALINTNO,P146_LOADINGADVICETNO,P146_PURCHASEORDERTNO'
,p_ajax_optimize_refresh=>false
,p_static_id=>'ITEMCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(481822749309780242)
,p_name=>'ITEMCODE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Itemcode1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':ITEMCODE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791584554997107359)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(792259664269503863)
,p_use_group_for=>'BOTH'
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
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE from itemspecification',
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
 p_id=>wwv_flow_imp.id(481822815110780243)
,p_name=>'ITEMSPECIFICATIONCODE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Itemspecificationcode1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>570
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(792257257751503839)
,p_name=>'JOBORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>390
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792258671951503853)
,p_name=>'JOBPOSTEDTOSTOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBPOSTEDTOSTOCK'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>440
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792259173137503858)
,p_name=>'JOBPOSTEDTOSTOCKRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBPOSTEDTOSTOCKRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>480
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792255662879503823)
,p_name=>'JOINACCEPTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOINACCEPTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792255753278503824)
,p_name=>'JOINACCEPTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOINACCEPTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791585768357107371)
,p_name=>'JOININSPECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOININSPECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791585869214107372)
,p_name=>'JOININSPECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOININSPECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792255881748503825)
,p_name=>'JOINREJECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOINREJECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256017860503826)
,p_name=>'JOINREJECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOINREJECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792257569597503842)
,p_name=>'PACKINGNOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGNOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Packing Nos'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(792259774003503864)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(792256860017503835)
,p_name=>'PACKINGTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Packing Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(792259774003503864)
,p_use_group_for=>'BOTH'
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
,p_lov_source=>'select PACKINGTYPENAME , PACKINGTYPECODE from packingtype'
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
 p_id=>wwv_flow_imp.id(792258460009503851)
,p_name=>'PACKINGWEIGHT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGWEIGHT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Packing Weight'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(792259774003503864)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(792257724298503843)
,p_name=>'POAMENDMENTTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POAMENDMENTTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>400
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792257139109503838)
,p_name=>'PURCHASEORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>380
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792258909263503855)
,p_name=>'PURCHASEPOSTEDTOSTOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEPOSTEDTOSTOCK'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>450
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792259014836503856)
,p_name=>'PURCHASEPOSTEDTOSTOCKRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEPOSTEDTOSTOCKRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>460
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792258288019503849)
,p_name=>'QCLESSQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QCLESSQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>410
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792256038435503827)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(792256146588503828)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(792259876806503865)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select MEASURINGUNITNAME , MEASURINGUNITCODE from measuringunit'
,p_lov_display_extra=>true
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(791584874314107362)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(792259876806503865)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'RECEIVEDQUANTITY1'
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
 p_id=>wwv_flow_imp.id(792258403386503850)
,p_name=>'RECEIVEDQUANTITY1WITHOUTQC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1WITHOUTQC'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>420
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791585037143107364)
,p_name=>'RECEIVEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(792259990646503866)
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
 p_id=>wwv_flow_imp.id(791585561795107369)
,p_name=>'REJECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REJECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rejected Qty'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
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
 p_id=>wwv_flow_imp.id(791585656726107370)
,p_name=>'REJECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REJECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(485224366815960036)
,p_name=>'REJECTQUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REJECTQUANTITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Short/Excess Qty'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>590
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(792256741741503834)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(792259557260503862)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>490
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(792260198012503868)
,p_name=>'SD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Sd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:sd(''StockStorageDetail'')'
,p_link_text=>'&SD.'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'SD'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<a href="javascript:sd(''StockStorageDetail'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">SD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791584392378107357)
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
 p_id=>wwv_flow_imp.id(791584671474107360)
,p_name=>'STOREAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOREAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791584324663107356)
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
 p_id=>wwv_flow_imp.id(792260275029503869)
,p_name=>'UD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ud'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:ud(''DetailStorage'')'
,p_link_text=>'&UD.'
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
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="javascript:ud(''DetailStorage'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">UD</span></a>',
''))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(481823236987780247)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>580
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(792259876806503865)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(644349227203241264)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(792259990646503866)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(792258741245503854)
,p_name=>'WARRANTYUPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WARRANTYUPTO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Warranty Upto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P146_GRNDATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(791584170029107355)
,p_internal_uid=>791584170029107355
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_imp.id(792261252910507756)
,p_interactive_grid_id=>wwv_flow_imp.id(791584170029107355)
,p_static_id=>'215202'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(792261454184507757)
,p_report_id=>wwv_flow_imp.id(792261252910507756)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(476252629326309890)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(481822749309780242)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(476253569225309893)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(481822815110780243)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(482050654736119063)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(481823236987780247)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>54
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(485590469285044853)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(485224366815960036)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(644355284518244523)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(644349227203241264)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792261997181507763)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(791584324663107356)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792262932054507768)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(791584392378107357)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792263775223507772)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(791584535121107358)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>174.986
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792264692737507777)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(791584554997107359)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>314.993
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792265554140507781)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(791584671474107360)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792266511200507785)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(791584752700107361)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792267381305507789)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(791584874314107362)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792268274980507794)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(791584993050107363)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792269173811507798)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(791585037143107364)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792270095277507803)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(791585206338107365)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792271007935507807)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(791585305791107366)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792271850634507812)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(791585370588107367)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792272794815507817)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(791585457202107368)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792273638029507821)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(791585561795107369)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792274585496507825)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(791585656726107370)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792275441756507829)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(791585768357107371)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792276424710507834)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(791585869214107372)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792277267507507838)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(792255662879503823)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792278187268507843)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(792255753278503824)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792278939961507847)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(792255881748503825)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792279922850507851)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(792256017860503826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792280766154507856)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(792256038435503827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792281723884507860)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(792256146588503828)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792282583615507864)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(792256314359503829)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792283513276507868)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(792256365569503830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792284370108507872)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(792256470145503831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792285257335507877)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(792256622149503832)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792286172581507881)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(792256728717503833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792287092039507885)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(792256741741503834)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792288032710507889)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(792256860017503835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792288860859507893)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(792256943846503836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792290676305507902)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(792257139109503838)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792291610254507906)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(792257257751503839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792294284105507920)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(792257569597503842)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792295183359507929)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(792257724298503843)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792300458228507960)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(792258288019503849)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792301410662507964)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(792258403386503850)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792302329760507968)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(792258460009503851)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792303213400507972)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(792258603224503852)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792304041340507977)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(792258671951503853)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792304937985507982)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(792258741245503854)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792305846570507986)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(792258909263503855)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792306818166507990)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(792259014836503856)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792307653079507995)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(792259101130503857)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792308587225508002)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(792259173137503858)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792310477417524154)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(792259297755503859)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(792388495173630462)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(792259557260503862)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793033124017308653)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(792260040907503867)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793033995309308662)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(792260198012503868)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793034891383308667)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(792260275029503869)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(796043480659445912)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(795330648780881067)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>273
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(796044355829445918)
,p_view_id=>wwv_flow_imp.id(792261454184507757)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(795330765331881068)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(793329189068469265)
,p_plug_name=>'GrnJob'
,p_static_id=>'grnjob'
,p_region_name=>'GrnJob'
,p_parent_plug_id=>wwv_flow_imp.id(633982718272365468)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       JOBTYPECODE,',
'       PARTYCODE,',
'       JOBORDERTNO,',
'       REMARK,',
'       SERIALNO,',
'       QUANTITY1,',
'       QUANTITY2,',
'       JOBPOSTEDTOSTOCK,',
'       JOBPOSTEDTOSTOCKRATE',
'  from GRNJOB',
'  where tno = :P146_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P146_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GrnJob'
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
 p_id=>wwv_flow_imp.id(793330459438469278)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793330538436469279)
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
 p_id=>wwv_flow_imp.id(793329639271469270)
,p_name=>'JOBORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Job order No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'         a.joborderno,',
'         a.tno',
'from ',
'         joborder a',
'where',
'        a.partycode = :PARTYCODE',
'        and a.companycode = :global_companycode',
'        and exists (',
'             select aa.partycode from joborder aa , Joborderdetail bb',
'              where aa.tno = bb.tno',
'                    and aa.partycode = a.partycode',
'                    and bb.jobtypecode = :jobtypecode',
'                    And aa.tno = a.tno ',
'              )',
' Order by ',
'           a.joborderdate, a.joborderno'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'JOBTYPECODE,PARTYCODE'
,p_ajax_items_to_submit=>'JOBTYPECODE,PARTYCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793330181126469275)
,p_name=>'JOBPOSTEDTOSTOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBPOSTEDTOSTOCK'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Job Posted tostock'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(793330239572469276)
,p_name=>'JOBPOSTEDTOSTOCKRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBPOSTEDTOSTOCKRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Job Posted To Stock Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(793329453560469268)
,p_name=>'JOBTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Job Type'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select jobtypename , jobtypecode from jobtype'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'JOBTYPECODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793329556116469269)
,p_name=>'PARTYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Party'
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       a.partyname,',
'       a.partycode',
'from ',
'        party a',
'where',
'      exists (select aa.partycode from joborder aa , Joborderdetail bb',
'              where  aa.tno = bb.tno',
'                            and aa.partycode = a.partycode',
'                    and bb.jobtypecode = :jobtypecode',
'              )',
' /* and exists',
'(  ',
'    select bb.COMPANYCODE',
'      from bossuser aa, bossuserrole bb, partycompany cc',
'     where aa.tno = bb.tno',
'       and cc.tno = a.tno',
'       AND bb.companycode = cc.companycode(+)',
'       and aa.Loginname = :GLOBAL_LOGINNAME',
')',
'',
'and ( exists (',
'    select * from party x, partycompany y, company z',
'    where x.partycode = y.partycode    ',
'    and y.companycode = z.companycode ',
'    and x.partycode = a.partycode',
'    and z.companycode =  :global_companycode',
'     )',
'',
'   or',
'    NOT exists',
'   (',
'    select * from party x, partycompany y, company z',
'    where x.partycode = y.partycode    ',
'    and y.companycode = z.companycode ',
'    and x.partycode = a.partycode',
'    )',
') */',
'Order by ',
'         a.partyname'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'JOBTYPECODE'
,p_ajax_items_to_submit=>'JOBTYPECODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793329986475469273)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(793330005019469274)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(793329738548469271)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(793330314705469277)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793329818316469272)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
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
 p_id=>wwv_flow_imp.id(793329328532469267)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P146_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(793329287262469266)
,p_internal_uid=>793329287262469266
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
 p_id=>wwv_flow_imp.id(793334834273474843)
,p_interactive_grid_id=>wwv_flow_imp.id(793329287262469266)
,p_static_id=>'224155'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(793335074957474843)
,p_report_id=>wwv_flow_imp.id(793334834273474843)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793335592953474845)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(793329328532469267)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793336450656474849)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(793329453560469268)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793337384627474853)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(793329556116469269)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>158
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793338235186474856)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(793329639271469270)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793339111591474860)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(793329738548469271)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793340086428474864)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(793329818316469272)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793340958863474868)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(793329986475469273)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793341880933474872)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(793330005019469274)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793342709545474875)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(793330181126469275)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793343620055474879)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(793330239572469276)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793344554922474883)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(793330314705469277)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793347669789497723)
,p_view_id=>wwv_flow_imp.id(793335074957474843)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(793330459438469278)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(633982718272365468)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(573879776706959559)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(641801102750137674)
,p_plug_name=>'Reference'
,p_static_id=>'reference'
,p_parent_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(641800941481137672)
,p_plug_name=>'Select No'
,p_static_id=>'select-no'
,p_parent_plug_id=>wwv_flow_imp.id(635135915118316562)
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
 p_id=>wwv_flow_imp.id(793185840067684253)
,p_plug_name=>'StockStorageDetail'
,p_static_id=>'stockstoragedetail'
,p_region_name=>'StockStorageDetail'
,p_region_css_classes=>'js-dialog-size900x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SN,',
'       STOCKTNO,',
'       STORAGELOCATIONCODE,',
'       QUANTITY1,',
'       QUANTITY2',
'  from GRNSTOCKSTORAGEDETAIL',
'  where tno = :P146_TNO',
'  and sno = :P146_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(791584114826107354)
,p_ajax_items_to_submit=>'P146_TNO,P146_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'StockStorageDetail'
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
 p_id=>wwv_flow_imp.id(793186904498684263)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186930007684264)
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
 p_id=>wwv_flow_imp.id(793186536515684260)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'NVL(:P146_RECEIVEDQTY1,0) - NVL(:STOCKQTY1,0)'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186704848684261)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
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
 p_id=>wwv_flow_imp.id(793186794696684262)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186274037684257)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sn'
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
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186137891684256)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'sno'
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
,p_parent_column_id=>wwv_flow_imp.id(791584392378107357)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186399304684258)
,p_name=>'STOCKTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Stock No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '300',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '700')).to_clob
,p_is_required=>false
,p_lov_cascade_parent_items=>'STORAGELOCATIONCODE'
,p_ajax_items_to_submit=>'P146_TNO,P146_LOCATIONCODE,P146_GRNDATE,P146_DETAILITEMCODE,P146_DETAILSPECIFICATIONCODE,P146_STORAGELOCATIONCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186427515684259)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Storage Location'
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STORAGELOCATIONNAME , STORAGELOCATIONCODE from storagelocation',
'where :P146_DOCTYPECODE = ''CONVERSIONJOBOUTOFPREMISES''',
'and STORAGELOCATIONCODE in (select CONVERSIONSTORAGELOCATIONCODE from joborder ',
'                            where tno = :P146_JOBORDERTNO)',
'union all',
'select STORAGELOCATIONNAME , STORAGELOCATIONCODE from storagelocation',
'where :P146_DOCTYPECODE = ''SALERETURN''',
'and  STORAGELOCATIONCODE in (select partyshortname from party where partycode = :P146_PARTYCODE)'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P146_DOCTYPECODE,P146_JOBORDERTNO,P146_PARTYCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(793186008652684255)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'tno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
,p_default_type=>'ITEM'
,p_default_expression=>'P146_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(793185965998684254)
,p_internal_uid=>793185965998684254
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
 p_id=>wwv_flow_imp.id(793270666547388817)
,p_interactive_grid_id=>wwv_flow_imp.id(793185965998684254)
,p_static_id=>'223837'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(793270869062388818)
,p_report_id=>wwv_flow_imp.id(793270666547388817)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793271333035388820)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(793186008652684255)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793272273655388824)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(793186137891684256)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793273108630388828)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(793186274037684257)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793274073741388832)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(793186399304684258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793274924649388836)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(793186427515684259)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793275716609388840)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(793186536515684260)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131.069
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793276613471388845)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(793186704848684261)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157.069
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793277521878388850)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(793186794696684262)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(793279401369389478)
,p_view_id=>wwv_flow_imp.id(793270869062388818)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(793186904498684263)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(641801251666137675)
,p_plug_name=>'Transportation Info'
,p_static_id=>'transportation-info'
,p_parent_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(641801344859137676)
,p_plug_name=>'Under Signed'
,p_static_id=>'under-signed'
,p_parent_plug_id=>wwv_flow_imp.id(635135915118316562)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8525521571410803)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
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
 p_id=>wwv_flow_imp.id(8583665452410878)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1375603989088055716)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P146_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8578887653410867)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(793114131398680152)
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
 p_id=>wwv_flow_imp.id(8571077824410861)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(793149763636681631)
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
 p_id=>wwv_flow_imp.id(8631356080410921)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(793185840067684253)
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
 p_id=>wwv_flow_imp.id(8525998595410805)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
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
 p_id=>wwv_flow_imp.id(8526302052410805)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8526747535410806)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
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
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8527183778410806)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8527517445410806)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8560457638410851)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(791584114826107354)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8527918453410806)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
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
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8528399447410807)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8528779664410807)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8529108588410807)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(930100317648535144)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P146_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P146_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8721960653410973)
,p_branch_name=>'Go To Page 145'
,p_branch_action=>'f?p=&APP_ID.:145:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8526747535410806)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(490194817799175834)
,p_name=>'P146_ALLOWEDBACK'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(490195167274183787)
,p_name=>'P146_ALLOWEDFORWARD'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1383987999294848104)
,p_name=>'P146_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1325369654078579712)
,p_name=>'P146_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_item_default=>'145'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(495156074432414640)
,p_name=>'P146_CALLEDFROMTNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635242224242316703)
,p_name=>'P146_CCINVOICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'CCinvoice No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:175:&SESSION.::NO:RP,175:P175_TNO,P175_CALLEDFROMPAGE,P175_FORMSTATUS,P175_CALLEDFROMTNO:&P146_CCINVOICETNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'CCINVOICETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select ccinvoiceno , tno from ccinvoice'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(635208958487316677)
,p_name=>'P146_CHALLANNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'CHALLANNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(535049494061331280)
,p_name=>'P146_CODESCHEME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635197452493316669)
,p_name=>'P146_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635210243922316678)
,p_name=>'P146_COMPANYVEHICLECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'COMPANYVEHICLECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635216608394316683)
,p_name=>'P146_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635216192200316682)
,p_name=>'P146_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635214654291316679)
,p_name=>'P146_DEDUCTIONRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'DEDUCTIONRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635208190237316677)
,p_name=>'P146_DELIVERYORDERSNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'DELIVERYORDERSNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635201852021316675)
,p_name=>'P146_DELIVERYORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'DELIVERYORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(481731251687179289)
,p_name=>'P146_DETAILITEMCODE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(791584114826107354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(481920100177780352)
,p_name=>'P146_DETAILQTY1'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(791584114826107354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(481731306100179290)
,p_name=>'P146_DETAILSPECIFICATIONCODE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(791584114826107354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635225164955316692)
,p_name=>'P146_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(641800840693137671)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Doctype'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct ',
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
 p_id=>wwv_flow_imp.id(635214968151316679)
,p_name=>'P146_DRIVERMOBILENO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'DRIVERMOBILENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635253224558316713)
,p_name=>'P146_DRIVERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Driver Name'
,p_source=>'DRIVERNAME'
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
 p_id=>wwv_flow_imp.id(635273335961316725)
,p_name=>'P146_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(641801344859137676)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Name'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEENAME , EMPLOYEECODE from employee',
'where getdocumentstatuscode(''EMPLOYEE'',TNO) = ''ACTIVE''',
''))
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
 p_id=>wwv_flow_imp.id(635197781166316673)
,p_name=>'P146_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1325369567599579711)
,p_name=>'P146_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P146_TNO is null then',
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
 p_id=>wwv_flow_imp.id(635263591127316717)
,p_name=>'P146_FREIGHTADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Freight Advance'
,p_source=>'FREIGHTADVANCEAMOUNT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(635213830985316679)
,p_name=>'P146_FREIGHTADVANCECHARGEDONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'FREIGHTADVANCECHARGEDONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635213384676316679)
,p_name=>'P146_FREIGHTADVANCEPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'FREIGHTADVANCEPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635211418135316678)
,p_name=>'P146_FREIGHTAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'FREIGHTAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635212226716316678)
,p_name=>'P146_FREIGHTPOSTEDTOSTOCK'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'FREIGHTPOSTEDTOSTOCK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635261616679316716)
,p_name=>'P146_FREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Freight Rate'
,p_source=>'FREIGHTRATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635256000055316714)
,p_name=>'P146_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select FREIGHTTYPENAME , FREIGHTTYPECODE from freighttype',
'where getdocumentstatuscode(''FREIGHTTYPE'',TNO) = ''ACTIVE''',
'AND MODULECODE=''GRN''',
''))
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(635262395624316716)
,p_name=>'P146_FREIGHTUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Freight Unit'
,p_source=>'FREIGHTUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select measuringunitname , measuringunitcode from measuringunit'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(635275336303316726)
,p_name=>'P146_FROMCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(641801344859137676)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'From City'
,p_source=>'FROMCITYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CITYNAME , CITYCODE from city',
'where getdocumentstatuscode(''CITY'',TNO) = ''ACTIVE''',
''))
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
 p_id=>wwv_flow_imp.id(635243829989316704)
,p_name=>'P146_GATEPASSTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Gate Pass No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:195:&SESSION.::NO:RP,195:P195_TNO,P195_CALLEDFROMPAGE,P195_FORMSTATUS,P195_CALLEDFROMTNO:&P146_GATEPASSTNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'GATEPASSTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select gatepassno , tno from gatepass'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(635226024241316692)
,p_name=>'P146_GRNDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(641800840693137671)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'GRN Date'
,p_source=>'GRNDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P146_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P146_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635225606194316692)
,p_name=>'P146_GRNNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(641800840693137671)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'GRN No'
,p_source=>'GRNNO'
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
 p_id=>wwv_flow_imp.id(635266026805316717)
,p_name=>'P146_INCLUDEINPURCHASEBILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Include in Purchase Bill'
,p_source=>'INCLUDEINPURCHASEBILL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60824655746210200)
,p_name=>'P146_IS_OUT_TO_OUT_CASE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635237844822316702)
,p_name=>'P146_JOBORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Job Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:179:&SESSION.::NO:RP,179:P179_TNO,P179_CALLEDFROMPAGE,P179_FORMSTATUS,P179_CALLEDFROMTNO:&P146_JOBORDERTNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'JOBORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select joborderno , tno from joborder',
'where companycode = :global_companycode',
'and partycode = :P146_PARTYCODE'))
,p_lov_cascade_parent_items=>'P146_PARTYCODE'
,p_ajax_items_to_submit=>'P146_PARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(250728949700204050)
,p_name=>'P146_LAINBOUNDOUTBOUND'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635212619965316678)
,p_name=>'P146_LIFTINGFROMCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'LIFTINGFROMCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646189072495591406)
,p_name=>'P146_LOADINGADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Loading Advice No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:155:&SESSION.::NO:RP,155:P155_TNO,P155_CALLEDFROMPAGE,P155_FORMSTATUS,P155_CALLEDFROMTNO:&P146_LOADINGADVICETNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'LOADINGADVICETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P146_LOADINGADVICETNO'
,p_lov_cascade_parent_items=>'P146_LOCATIONCODE,P146_PARTYCODE,P146_DOCTYPECODE'
,p_ajax_items_to_submit=>'P146_LOCATIONCODE,P146_PARTYCODE,P146_FORMSTATUS,P146_DOCTYPECODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
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
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635214186100316679)
,p_name=>'P146_LOADINGSTORAGELOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'LOADINGSTORAGELOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635224760318316692)
,p_name=>'P146_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(641800840693137671)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
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
 p_id=>wwv_flow_imp.id(635258398841316715)
,p_name=>'P146_LRDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'LR Date'
,p_source=>'LRDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P146_GRNDATE',
  'min_date', 'ITEM',
  'min_item', 'P146_PODATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635257582162316715)
,p_name=>'P146_LRNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'LR No'
,p_source=>'LRNO'
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635236984039316701)
,p_name=>'P146_MATERIALINTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Material In No'
,p_post_element_text=>'<a href="f?p=&APP_ID.:69:&SESSION.::NO:RP,69:P69_TNO,P69_CALLEDFROMPAGE,P69_FORMSTATUS,P69_CALLEDFROMTNO:&P146_MATERIALINTNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>'
,p_source=>'MATERIALINTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P146_MATERIALINTNO'
,p_lov_cascade_parent_items=>'P146_LOCATIONCODE,P146_DOCTYPECODE,P146_PARTYCODE'
,p_ajax_items_to_submit=>'P146_LOCATIONCODE,P146_DOCTYPECODE,P146_PARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635206162521316676)
,p_name=>'P146_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1325365850282579674)
,p_name=>'P146_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635206557981316677)
,p_name=>'P146_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1324774071178308408)
,p_name=>'P146_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635226355660316693)
,p_name=>'P146_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(641800840693137671)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P146_PARTY'
,p_lov_cascade_parent_items=>'P146_DOCTYPECODE'
,p_ajax_items_to_submit=>'P146_DOCTYPECODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>30
,p_colspan=>6
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
  'min_chars', '0',
  'width', '700')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1299422589042954872)
,p_name=>'P146_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635209363244316677)
,p_name=>'P146_POAMENDMENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'POAMENDMENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473904400068739636)
,p_name=>'P146_PODATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635237400562316702)
,p_name=>'P146_PURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Purchase Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:118:&SESSION.::NO:RP,118:P118_TNO,P118_CALLEDFROMPAGE,P118_FORMSTATUS,P118_CALLEDFROMTNO:&P146_PURCHASEORDERTNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'PURCHASEORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PURCHASEORDERNO , TNO from purchaseorder',
'where getdocumentstatuscode(''PURCHASEORDER'',TNO) = ''ACTIVE''',
'',
'Union all',
'    -- Added in case of Sales Return where PO Prepares (AUTO) hence no staus update',
'select PURCHASEORDERNO , TNO from purchaseorder',
'Where TNO = :P146_PURCHASEORDERTNO'))
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(641900940318137808)
,p_name=>'P146_RECEIVEDQTY1'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(791584114826107354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635243978173316705)
,p_name=>'P146_REFDOCAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(641801102750137674)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Ref Doc Amount'
,p_source=>'REFDOCAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635243653345316705)
,p_name=>'P146_REFDOCDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(641801102750137674)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Ref Doc Date'
,p_source=>'REFDOCDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P146_GRNDATE',
  'min_date', 'ITEM',
  'min_item', 'P146_PODATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(485434795630189765)
,p_name=>'P146_REFDOCNO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(641801102750137674)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Ref Doc No'
,p_source=>'REFDOCNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635242779011316704)
,p_name=>'P146_REFDOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(641801102750137674)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Ref Doc Type'
,p_source=>'REFDOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select doctypename , doctypecode from doctype   ',
'where ISUSEDASREFDOCTYPE = ''YES'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
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
 p_id=>wwv_flow_imp.id(641947404641137851)
,p_name=>'P146_REJECTQTY1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(793149763636681631)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635280489864316730)
,p_name=>'P146_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(641801344859137676)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(792386176852504021)
,p_name=>'P146_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(791584114826107354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(789352359445027643)
,p_name=>'P146_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P146_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1299422425397954871)
,p_name=>'P146_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
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
 p_id=>wwv_flow_imp.id(482016364787780439)
,p_name=>'P146_STOCKQTY1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(793185840067684253)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204558968193107028)
,p_name=>'P146_STOCKREQUIRED'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1297487260258606020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482018099301780456)
,p_name=>'P146_STOCKTNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(793185840067684253)
,p_prompt=>'Stocktno'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(481920987172780384)
,p_name=>'P146_STOCKTRANSFERNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STOCKTRANSFERNO from stocktransfer',
'where moduletno = :P146_TNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Stock Transfer No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:187:&SESSION.::NO:RP,187:P187_TNO,P187_CALLEDFROMPAGE,P187_FORMSTATUS,P187_CALLEDFROMTNO:&P146_STOCKTRANSFERTNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
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
 p_id=>wwv_flow_imp.id(481921043864780385)
,p_name=>'P146_STOCKTRANSFERTNO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno from stocktransfer',
'where moduletno = :P146_TNO'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482015627764780432)
,p_name=>'P146_STORAGELOCATIONCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(793185840067684253)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635196958158316667)
,p_name=>'P146_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635252823969316713)
,p_name=>'P146_TRANSPORTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Transporter'
,p_source=>'TRANSPORTERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PARTYNAME , PARTYCODE from party where partytypecode = ''TRANSPORTER''',
'and getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
''))
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
 p_id=>wwv_flow_imp.id(635274449855316726)
,p_name=>'P146_UNLOADEDBY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(641801344859137676)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Unloaded By'
,p_source=>'UNLOADEDBY'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC:Contractor;CONTRACTOR,Company;COMPANY,Not Applicable;NOTAPPLICABLE'
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
 p_id=>wwv_flow_imp.id(635253978883316713)
,p_name=>'P146_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Vehicle No'
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(635253629226316713)
,p_name=>'P146_VEHICLETYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(641801251666137675)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Vehicle Type'
,p_source=>'VEHICLETYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VEHICLETYPENAME , VEHICLETYPECODE from vehicletype',
''))
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
 p_id=>wwv_flow_imp.id(635236574329316701)
,p_name=>'P146_WEIGHMENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(641800941481137672)
,p_item_source_plug_id=>wwv_flow_imp.id(635135915118316562)
,p_prompt=>'Weighment No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:133:&SESSION.::NO:RP,133:P133_TNO,P133_CALLEDFROMPAGE,P133_FORMSTATUS,P133_CALLEDFROMTNO:&P146_WEIGHMENTTNO.,146,CALLED,&P146_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'WEIGHMENTTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select WEIGHMENTNO , TNO from weighment'
,p_cSize=>32
,p_cMaxlength=>255
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8638980245410933)
,p_name=>'check codescheme'
,p_static_id=>'check-codescheme'
,p_event_sequence=>660
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_GRNDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8639358528410934)
,p_event_id=>wwv_flow_imp.id(8638980245410933)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PARTYCODE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P146_CODESCHEME'
,p_client_condition_expression=>'AUTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8639855658410935)
,p_event_id=>wwv_flow_imp.id(8638980245410933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_CODESCHEME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CODESCHEME  from codescheme',
    '    where companycode = :global_companycode',
    '    and modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    and FINANCIALYEARCODE = :global_FINANCIALYEARCODE;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8640332264410935)
,p_name=>'Check qty'
,p_static_id=>'check-qty'
,p_event_sequence=>500
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8631356080410921)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8640741424410936)
,p_event_id=>wwv_flow_imp.id(8640332264410935)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(793185840067684253)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8641220305410937)
,p_event_id=>wwv_flow_imp.id(8640332264410935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_STOCKQTY1,P146_RECEIVEDQTY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P146_RECEIVEDQTY1 <> :P146_STOCKQTY1 then',
    '    raise_application_error(-20000,''Entered Stock Qty is Not Matching With Detail Quantity.'');',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8641779682410937)
,p_name=>'Check received qty'
,p_static_id=>'check-received-qty'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8571077824410861)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8642105766410937)
,p_event_id=>wwv_flow_imp.id(8641779682410937)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailStorage").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("UNLOADINGQUANTITY1");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'var received = $v("P146_RECEIVEDQTY1");',
    'var n_totamttmp = n_totamt.toFixed(3);',
    'var detail = n_totamttmp.toString();',
    '',
    '//console.log(received,detail);',
    'if (received !== detail) {',
    '   //raise_application_error(-20000,''RECEIVED QTY1 NOT MATCHING WITH DETAIL STORAGE RECEIVED QTY1.'');',
    '   //console.log(''Error.'');',
    '   ',
    '   //apex.message.showErrors("RECEIVED QTY1 NOT MATCHING WITH DETAIL STORAGE RECEIVED QTY1.", null, "error");',
    '   apex.message.showErrors([',
    '        {',
    '            type: apex.message.TYPE.ERROR,',
    '            location: ["page"],',
    '            message: "RECEIVED QTY1 NOT MATCHING WITH DETAIL STORAGE RECEIVED QTY1.",',
    '            unsafe: false',
    '        }',
    '        ]);',
    '} ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8642644658410937)
,p_name=>'Check ref doc no'
,p_static_id=>'check-ref-doc-no'
,p_event_sequence=>650
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_REFDOCNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8643054427410938)
,p_event_id=>wwv_flow_imp.id(8642644658410937)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_FINANCIALYEARCODE,P146_PARTYCODE,P146_REFDOCTYPECODE,P146_REFDOCNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ',
    '    tmp number;',
    '    tmp1 number;',
    'begin',
    '',
    '',
    '    select count(*) into tmp from materialin',
    '    where FINANCIALYEARCODE = :P146_FINANCIALYEARCODE',
    '    and PARTYCODE = :P146_PARTYCODE',
    '    and REFDOCTYPECODE = :P146_REFDOCTYPECODE',
    '    and REFDOCNO = :P146_REFDOCNO;',
    '',
    '    select count(*) into tmp1 from grn    ',
    '    where FINANCIALYEARCODE = :P146_FINANCIALYEARCODE',
    '    and PARTYCODE = :P146_PARTYCODE',
    '    and REFDOCTYPECODE = :P146_REFDOCTYPECODE',
    '    and REFDOCNO = :P146_REFDOCNO;',
    '',
    '    /* if nvl(tmp , 0)> 0   then ',
    '        raise_application_error(-20000,''REF DOC NO is already used in Matrial In.'');',
    '    end if; */',
    '    if nvl(tmp1 , 0)> 0   then ',
    '        raise_application_error(-20000,''REF DOC NO is already used in GRN.'');',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8643500078410938)
,p_name=>'Check shortage'
,p_static_id=>'check-shortage'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'DISCREPANCYTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8643913466410938)
,p_event_id=>wwv_flow_imp.id(8643500078410938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'RECEIVEDQUANTITY1,CHALANQUANTITY1,DISCREPANCYTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :RECEIVEDQUANTITY1 < :CHALANQUANTITY1 THEN',
    '',
    '    IF :DISCREPANCYTYPECODE IS NULL THEN',
    '',
    '        RAISE_APPLICATION_ERROR(-20000,''DISCREPANCY TYPE CANNOT BE LEFT BLANK!'');',
    '',
    '    END IF;',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8644422805410938)
,p_name=>'close eq'
,p_static_id=>'close-eq'
,p_event_sequence=>700
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8578887653410867)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8644888835410939)
,p_event_id=>wwv_flow_imp.id(8644422805410938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(793114131398680152)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8645369331410939)
,p_name=>'Create DInspection'
,p_static_id=>'create-dinspection'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8529108588410807)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8645713133410939)
,p_event_id=>wwv_flow_imp.id(8645369331410939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_STATUS,P146_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P146_STATUS = ''ACTIVE'' and :P146_DOCTYPECODE not in (''CONVERSIONJOBOUTOFPREMISES'',''SALERETURN'')',
    '   and :P146_STOCKREQUIRED=''YES''',
    ' then',
    '        DECLARE',
    '            TDINSPECTIONTNO NUMBER;',
    '            TINSPECTIONTNO  NUMBER;',
    '            TVRTNO          NUMBER;',
    '        BEGIN',
    '               FOR VLOOP IN (',
    '                    SELECT A.TNO DTNO, B.TNO ITNO',
    '                    FROM DINSPECTION A, INSPECTION B',
    '                    WHERE A.TNO = B.MODULETNO',
    '                      AND A.GRNTNO = :P146_TNO',
    '               ) LOOP',
    '                    TDINSPECTIONTNO := VLOOP.DTNO;',
    '                    TINSPECTIONTNO  := VLOOP.ITNO;',
    '                    ',
    '               END LOOP;',
    '                ',
    '',
    '                DELETE FROM INSPECTIONDTLSTORAGE WHERE TNO = TINSPECTIONTNO;',
    '                DELETE FROM INSPECTIONSTOCKDETAIL WHERE TNO = TINSPECTIONTNO;',
    '                DELETE FROM INSPECTIONDETAIL WHERE TNO = TINSPECTIONTNO;',
    '                DELETE FROM INSPECTION WHERE TNO = TINSPECTIONTNO;',
    '',
    '                DELETE FROM DINSPECTIONDTLSTORAGE WHERE TNO = TDINSPECTIONTNO;',
    '                DELETE FROM DINSPECTIONDETAIL WHERE TNO = TDINSPECTIONTNO;',
    '                DELETE FROM DINSPECTION WHERE TNO = TDINSPECTIONTNO;',
    '        END;',
    '',
    '        CREATEDINSPECTION(:P146_TNO);',
    '        --    CREATEDINSPECTION_TEMP(:P146_TNO); --Added by Vibhor',
    '        commit;',
    '        -- 20-feb-2024',
    '        --- Set Stock Rate --',
    '        begin',
    '           for vStock in ( select * from stock where grntno = :P146_TNO) loop',
    '                setstockraterevised(vStock.tno);',
    '           end loop;',
    '        end;',
    '        --- End set StockRate ',
    '           ',
    '    ',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8646270436410939)
,p_name=>'Create Inspection'
,p_static_id=>'create-inspection'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8529108588410807)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8646656044410940)
,p_event_id=>wwv_flow_imp.id(8646270436410939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    ptno number;',
    'begin',
    '    if :P146_STATUS = ''ACTIVE'' then',
    '',
    '        begin',
    '            select tno into ptno  from dinspection where grntno = :P146_TNO;',
    '        exception when no_data_found then',
    '            raise_application_error(-20000,''ptno - ''||ptno);',
    '        when others then',
    '            raise_application_error(-20000,sqlerrm);',
    '        end;',
    '        ',
    '        if ptno is not null then',
    '',
    '            CREATEINSPECTION_APEX(ptno,:global_CompanyCode , :global_Loginname , :global_FinancialYearCode );   ',
    '',
    '        end if;    ',
    '    ',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8647145588410940)
,p_name=>'create mrn'
,p_static_id=>'create-mrn'
,p_event_sequence=>640
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8529108588410807)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8647569416410940)
,p_event_id=>wwv_flow_imp.id(8647145588410940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    'if :P146_STATUS = ''ACTIVE'' then',
    '        createmrnfromgrn(:P146_TNO);',
    ' ',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8648074791410941)
,p_event_id=>wwv_flow_imp.id(8647145588410940)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8529108588410807)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8648519470410941)
,p_name=>'Create  Stock Transfer'
,p_static_id=>'create-stock-transfer'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8529108588410807)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8648923401410942)
,p_event_id=>wwv_flow_imp.id(8648519470410941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_STATUS,P146_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P146_STATUS = ''ACTIVE'' and :P146_DOCTYPECODE in (''CONVERSIONJOBOUTOFPREMISES'',''SALERETURN'') then',
    '',
    '        createstocktransferfromgrn(:P146_TNO);',
    '    ',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8649407595410942)
,p_name=>'delete detail if master not found'
,p_static_id=>'delete-detail-if-master-not-found'
,p_event_sequence=>730
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8649849473410942)
,p_event_id=>wwv_flow_imp.id(8649407595410942)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from grndetail a',
    '    where not exists (',
    '        select 1 from grn  aa  ',
    '        where aa.tno = a.tno',
    '    ) ;',
    '',
    'delete from grndetailstorage a',
    '    where not exists (',
    '        select 1 from grn  aa  ',
    '        where aa.tno = a.tno',
    '    ) ;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8650330218410943)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8525998595410805)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8650755995410943)
,p_event_id=>wwv_flow_imp.id(8650330218410943)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P146_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8651286663410943)
,p_event_id=>wwv_flow_imp.id(8650330218410943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from GRNDETAIL a',
    '   where not exists (',
    '        select 1 from GRN  aa  ',
    '        where aa.tno = a.tno',
    '    ) and tno = :P146_TNO;',
    '',
    ' ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8651725810410943)
,p_event_id=>wwv_flow_imp.id(8650330218410943)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P146_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P146_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(8652237317410944)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>190
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8652629671410944)
,p_event_id=>wwv_flow_imp.id(8652237317410944)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8526747535410806)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8653199146410945)
,p_event_id=>wwv_flow_imp.id(8652237317410944)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8526747535410806)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P146_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8653610919410945)
,p_event_id=>wwv_flow_imp.id(8652237317410944)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8526747535410806)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from PURCHASEBILLGRNDETAIL where grntno = :P146_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8654193698410945)
,p_event_id=>wwv_flow_imp.id(8652237317410944)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8526747535410806)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8654690172410945)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8655035599410946)
,p_event_id=>wwv_flow_imp.id(8654690172410945)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8528399447410807)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8655522299410946)
,p_event_id=>wwv_flow_imp.id(8654690172410945)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8528399447410807)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8656076121410946)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>200
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8656440368410946)
,p_event_id=>wwv_flow_imp.id(8656076121410946)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8528779664410807)
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
 p_id=>wwv_flow_imp.id(8656933782410947)
,p_event_id=>wwv_flow_imp.id(8656076121410946)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8528779664410807)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P146_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8657461736410947)
,p_event_id=>wwv_flow_imp.id(8656076121410946)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8528779664410807)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from PURCHASEBILLGRNDETAIL where grntno = :P146_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8657940846410947)
,p_event_id=>wwv_flow_imp.id(8656076121410946)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8528779664410807)
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
 p_id=>wwv_flow_imp.id(8658480270410948)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8658872389410948)
,p_event_id=>wwv_flow_imp.id(8658480270410948)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8529108588410807)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8659362659410948)
,p_event_id=>wwv_flow_imp.id(8658480270410948)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8529108588410807)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'   and a.CompanyCode = :GLOBAL_COMPANYCODE'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8659820207410948)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8529108588410807)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8660206847410949)
,p_event_id=>wwv_flow_imp.id(8659820207410948)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8529108588410807)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P146_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8660712555410949)
,p_event_id=>wwv_flow_imp.id(8659820207410948)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8529108588410807)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P146_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8661276856410949)
,p_event_id=>wwv_flow_imp.id(8659820207410948)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P146_TNO,:P146_STATUS);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8661705908410949)
,p_event_id=>wwv_flow_imp.id(8659820207410948)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P146_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8662261920410950)
,p_event_id=>wwv_flow_imp.id(8659820207410948)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(930100317648535144)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8662798625410950)
,p_event_id=>wwv_flow_imp.id(8659820207410948)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8663282207410950)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8663658030410950)
,p_event_id=>wwv_flow_imp.id(8663282207410950)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8527918453410806)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P146_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8664182041410951)
,p_event_id=>wwv_flow_imp.id(8663282207410950)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8527183778410806)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P146_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8664690974410951)
,p_event_id=>wwv_flow_imp.id(8663282207410950)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8527517445410806)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P146_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8665118820410951)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8527183778410806)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8665599658410952)
,p_event_id=>wwv_flow_imp.id(8665118820410951)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_COMPANYCODE,P146_PURCHASEORDERNO',
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
 p_id=>wwv_flow_imp.id(8666090319410952)
,p_event_id=>wwv_flow_imp.id(8665118820410951)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8666576046410952)
,p_event_id=>wwv_flow_imp.id(8665118820410951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8667008479410952)
,p_name=>'Generate Pdf'
,p_static_id=>'generate-pdf'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8528399447410807)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8667429681410953)
,p_event_id=>wwv_flow_imp.id(8667008479410952)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8667980426410953)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>570
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8668327692410953)
,p_event_id=>wwv_flow_imp.id(8667980426410953)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8668880622410953)
,p_name=>'Hide Region'
,p_static_id=>'hide-region'
,p_event_sequence=>420
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8571077824410861)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8669276037410953)
,p_event_id=>wwv_flow_imp.id(8668880622410953)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(793149763636681631)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8669729203410954)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8670136940410954)
,p_event_id=>wwv_flow_imp.id(8669729203410954)
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
 p_id=>wwv_flow_imp.id(8670614179410954)
,p_name=>'Insert into Grn Detail'
,p_static_id=>'insert-into-grn-detail'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8560457638410851)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8671074197410955)
,p_event_id=>wwv_flow_imp.id(8670614179410954)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Against Loading Advice, MI is null'
,p_static_id=>'against-loading-advice-mi-is-null'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_LOADINGADVICETNO,P146_PURCHASEORDERTNO,P146_MATERIALINTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :P146_LOADINGADVICETNO IS NOT NULL AND :P146_MATERIALINTNO IS NULL',
    '    THEN',
    '        -- CLEAR EXISTING GRN DETAIL',
    '        DELETE FROM GRNDETAIL WHERE TNO = :P146_TNO;',
    '',
    '        --STEP 2: BULK INSERT FROM LOADING ADVICE',
    '        INSERT INTO GRNDETAIL (',
    '            TNO,',
    '            SNO,',
    '            ITEMCODE,',
    '            ITEMSPECIFICATIONCODE,',
    '            DESCRIPTION,',
    '            CHALANQUANTITY1,',
    '            CHALANQUANTITY2,',
    '            REMARK,',
    '            RATE,',
    '            AMOUNT,',
    '            PURCHASEORDERTNO',
    '        )',
    '        SELECT',
    '            :P146_TNO,',
    '            GLOBALTNO.NEXTVAL,',
    '            A.ITEMCODE,',
    '            A.ITEMSPECIFICATIONCODE,',
    '            A.DESCRIPTION,',
    '            A.QUANTITY1,',
    '            A.QUANTITY2,',
    '            A.REMARK,',
    '            ROUND(B.TOTALAMOUNT / NULLIF(A.QUANTITY1, 0), 2) AS RATE,',
    '            B.TOTALAMOUNT AS AMOUNT,',
    '            :P146_PURCHASEORDERTNO',
    '        FROM  LOADINGADVICEDETAIL A',
    '        JOIN  PURCHASEORDERDETAIL B ON  B.TNO                   = :P146_PURCHASEORDERTNO',
    '                                    AND B.ITEMCODE              = A.ITEMCODE',
    '                                    AND B.ITEMSPECIFICATIONCODE = A.ITEMSPECIFICATIONCODE',
    '        JOIN  ITEM                I ON  I.ITEMCODE              = A.ITEMCODE',
    '                                    AND I.ITEMNATURECODE        != ''SERVICES''',
    '        WHERE A.TNO = :P146_LOADINGADVICETNO;',
    '',
    '        IF SQL%ROWCOUNT = 0 THEN',
    '            RAISE_APPLICATION_ERROR(-20002, ''NO ELIGIBLE ITEMS FOUND FOR LOADING ADVICE TNO = '' || :P146_LOADINGADVICETNO);',
    '        END IF;',
    '',
    '    END IF;',
    '',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        ROLLBACK;',
    '        RAISE;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P146_MATERIALINTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8671582176410955)
,p_event_id=>wwv_flow_imp.id(8670614179410954)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(791584114826107354)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8672033986410955)
,p_event_id=>wwv_flow_imp.id(8670614179410954)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Normal Routine (MI,PO)'
,p_static_id=>'normal-routine-mi-po'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_MATERIALINTNO,P146_GATEPASSTNO,P146_LOADINGADVICETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    ',
    '    IF :P146_LOADINGADVICETNO IS NULL THEN',
    '        RETURN; ',
    '    END IF;',
    '',
    '    ',
    '    -- CLEAR EXISTING GRN DETAIL',
    '    DELETE FROM GRNDETAIL WHERE TNO = :P146_TNO;',
    '',
    '    -- BULK INSERT',
    '    INSERT INTO GRNDETAIL (',
    '        TNO,',
    '        SNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        DESCRIPTION,',
    '        PACKINGTYPECODE,',
    '        PACKINGNOS,',
    '        CHALANQUANTITY1,',
    '        CHALANQUANTITY2,',
    '        REMARK,',
    '        RATE,',
    '        PURCHASEORDERTNO,',
    '        RATEMEASURINGUNITCODE',
    '    )',
    '    SELECT',
    '        :P146_TNO,',
    '        GLOBALTNO.NEXTVAL,',
    '        A.ITEMCODE,',
    '        A.ITEMSPECIFICATIONCODE,',
    '        A.DESCRIPTION,',
    '        A.PACKINGTYPECODE,',
    '        A.PACKINGNOS,',
    '        A.QUANTITY1,',
    '        A.QUANTITY2,',
    '        A.REMARK,',
    '        B.TOTALAMOUNT / NULLIF(A.QUANTITY1, 0) AS RATE,',
    '        C.TNO AS PURCHASEORDERTNO,',
    '        D.MEASURINGUNITCODE1',
    '    FROM  MATERIALINDETAIL    A',
    '    JOIN  MATERIALIN          MI ON  MI.TNO                  = A.TNO',
    '    JOIN  PURCHASEORDERDETAIL B  ON  B.TNO                   = MI.PURCHASEORDERTNO',
    '                                 AND B.ITEMCODE              = A.ITEMCODE',
    '                                 AND B.ITEMSPECIFICATIONCODE = A.ITEMSPECIFICATIONCODE',
    '    JOIN  PURCHASEORDER       C  ON  C.TNO                   = B.TNO',
    '    JOIN  ITEM                D  ON  D.ITEMCODE              = A.ITEMCODE',
    '                                 AND D.ITEMNATURECODE        != ''SERVICES''',
    '    WHERE A.TNO = :P146_MATERIALINTNO;',
    '',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        ROLLBACK;',
    '        RAISE;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P146_MATERIALINTNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8672570798410956)
,p_name=>'Insert through JO and Mat-In'
,p_static_id=>'insert-through-jo-and-mat-in'
,p_event_sequence=>440
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8560457638410851)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8672968749410956)
,p_event_id=>wwv_flow_imp.id(8672570798410956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_JOBORDERTNO,P146_TNO,P146_MATERIALINTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P146_JOBORDERTNO is not null then',
    '        delete from grndetail where tno = :P146_TNO;',
    '        insert into grndetail',
    '        (',
    '            tno,',
    '            sno,',
    '            itemcode,',
    '            itemspecificationcode,',
    '            description,',
    '            chalanquantity1,',
    '            chalanquantity2,',
    '            packingtypecode,',
    '            packingnos,',
    '            jobordertno',
    '        )',
    '        (',
    '            select',
    '                :P146_TNO,',
    '                globaltno.nextval,',
    '                itemcode,',
    '                itemspecificationcode,',
    '                description,',
    '                quantity1,',
    '                quantity2,',
    '                packingtypecode,',
    '                packingnos,',
    '                jobordertno',
    '            from materialindetail',
    '            where tno = :P146_MATERIALINTNO',
    '            and itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        );',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8673464617410956)
,p_event_id=>wwv_flow_imp.id(8672570798410956)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(791584114826107354)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8673923219410956)
,p_name=>'Insert through LoadingAdvice and Mat-In'
,p_static_id=>'insert-through-loadingadvice-and-mat-in'
,p_event_sequence=>450
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8560457638410851)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8674386466410956)
,p_event_id=>wwv_flow_imp.id(8673923219410956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'in case of Sales Return'
,p_static_id=>'in-case-of-sales-return'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_JOBORDERTNO,P146_TNO,P146_MATERIALINTNO,P146_LOADINGADVICETNO,P146_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P146_LOADINGADVICETNO is not null and :P146_DOCTYPECODE =''SALERETURN'' then',
    '        delete from grndetail where tno = :P146_TNO;',
    '        insert into grndetail',
    '        (',
    '            tno,',
    '            sno,',
    '            itemcode,',
    '            itemspecificationcode,',
    '            description,',
    '            chalanquantity1,',
    '            chalanquantity2,',
    '            packingtypecode,',
    '            packingnos,',
    '            jobordertno',
    '        )',
    '        (',
    '            select',
    '                :P146_TNO,',
    '                globaltno.nextval,',
    '                itemcode,',
    '                itemspecificationcode,',
    '                description,',
    '                quantity1,',
    '                quantity2,',
    '                packingtypecode,',
    '                packingnos,',
    '                jobordertno',
    '            from materialindetail',
    '            where tno = :P146_MATERIALINTNO',
    '            and itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        );',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8674809711410957)
,p_event_id=>wwv_flow_imp.id(8673923219410956)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(791584114826107354)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8675376182410957)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>670
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8675756712410957)
,p_event_id=>wwv_flow_imp.id(8675376182410957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '//apex.region( "GrnDetail" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8676296434410957)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>680
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8676622920410957)
,p_event_id=>wwv_flow_imp.id(8676296434410957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ( $(''#ITEMCODE'').val() === '''' ){',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_GrnDetail"].moveNext();',
    '    apex.region( "GrnJob" ).widget().interactiveGrid( "getActions" ).set("edit", true);a',
    '',
    '    }',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8677124603410957)
,p_name=>'move tab2'
,p_static_id=>'move-tab-3'
,p_event_sequence=>690
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793329189068469265)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8677521314410958)
,p_event_id=>wwv_flow_imp.id(8677124603410957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ( $(''#JOBTYPECODE'').val() === '''' ){',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_GrnJob"].moveNext();',
    '',
    '    }',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8678035135410958)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>510
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_condition_element_type=>'ITEM'
,p_condition_element=>'P146_DOCTYPECODE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8678431167410958)
,p_event_id=>wwv_flow_imp.id(8678035135410958)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SD,AMOUNT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8678954848410958)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>520
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_DOCTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8679347494410958)
,p_event_id=>wwv_flow_imp.id(8678954848410958)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(791584114826107354)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8679882152410958)
,p_name=>'Open stock transfer Page'
,p_static_id=>'open-stock-transfer-page'
,p_event_sequence=>560
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_STOCKTRANSFERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8680212425410959)
,p_event_id=>wwv_flow_imp.id(8679882152410958)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P146_STOCKTRANSFERTNO'').getValue();',
    'var y = ''146'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P146_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:187:#SESSION#::NO:RP,187:P187_TNO,P187_CALLEDFROMPAGE,P187_FORMSTATUS,P187_CALLEDFROMTNO:#P187_TNO#,#P187_CALLEDFROMPAGE#,#P187_FORMSTATUS#,#P187_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P187_TNO#", x);',
    'url = url.replace("#P187_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P187_FORMSTATUS#", z);',
    'url = url.replace("#P187_CALLEDFROMTNO#", x1);',
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
 p_id=>wwv_flow_imp.id(8680755065410959)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8527918453410806)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8681150386410959)
,p_event_id=>wwv_flow_imp.id(8680755065410959)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_COMPANYCODE,P146_STATUS',
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
    '            -- if :P146_STATUS = ''ACTIVE'' then',
    '        ',
    '             --   CREATEPAYMENTADVICEFORPO(:P146_TNO);',
    '',
    '            --  end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8681646551410959)
,p_event_id=>wwv_flow_imp.id(8680755065410959)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8682187537410959)
,p_event_id=>wwv_flow_imp.id(8680755065410959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8682642843410960)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8583665452410878)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8683005434410960)
,p_event_id=>wwv_flow_imp.id(8682642843410960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1375603989088055716)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8683519927410960)
,p_name=>'Set Accepted Quantity1'
,p_static_id=>'set-accepted-quantity'
,p_event_sequence=>380
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'REJECTEDQUANTITY1,RECEIVEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8683920974410960)
,p_event_id=>wwv_flow_imp.id(8683519927410960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ACCEPTEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'REJECTEDQUANTITY1,RECEIVEDQUANTITY1',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:RECEIVEDQUANTITY1,0)-nvl(:REJECTEDQUANTITY1,0)',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8684448619410960)
,p_name=>'Set amount'
,p_static_id=>'set-amount'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8684870266410960)
,p_event_id=>wwv_flow_imp.id(8684448619410960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RECEIVEDQUANTITY1,RATE',
  'sql_query', 'select nvl(:RECEIVEDQUANTITY1,0)*nvl(:RATE,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8685316062410961)
,p_name=>'set balance qty '
,p_static_id=>'set-balance-qty'
,p_event_sequence=>530
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793185840067684253)
,p_triggering_element=>'STORAGELOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8685763037410961)
,p_event_id=>wwv_flow_imp.id(8685316062410961)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_RECEIVEDQTY1,P146_STOCKQTY1',
  'plsql_expression', 'nvl(:p146_receivedqty1,0) - nvl(:P146_STOCKQTY1,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8686263356410961)
,p_name=>'Set ChalanQuantity2'
,p_static_id=>'set-chalanquantity'
,p_event_sequence=>330
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'CHALANQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8686642642410961)
,p_event_id=>wwv_flow_imp.id(8686263356410961)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CHALANQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,CHALANQUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return nvl(:CHALANQUANTITY1,0)*nvl(mfactor,0);',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8687116725410961)
,p_name=>'Set ChalanQuantity1'
,p_static_id=>'set-chalanquantity-2'
,p_event_sequence=>340
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'CHALANQUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8687511382410961)
,p_event_id=>wwv_flow_imp.id(8687116725410961)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CHALANQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,CHALANQUANTITY2,CHALANQUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number(10,3);',
    'begin',
    '        select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '        return round(nvl(:CHALANQUANTITY2,0)/nvl(mfactor,0),3);',
    '    exception when others then',
    '        return round(nvl(:CHALANQUANTITY1,0),3);',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'CHALANQUANTITY2'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8688036541410962)
,p_name=>'Set Data'
,p_static_id=>'set-data'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_MATERIALINTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8688458367410962)
,p_event_id=>wwv_flow_imp.id(8688036541410962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PURCHASEORDERTNO,P146_JOBORDERTNO,P146_CCINVOICETNO,P146_GATEPASSTNO,P146_REFDOCTYPECODE,P146_REFDOCNO,P146_REFDOCDATE,P146_REFDOCAMOUNT,P146_TRANSPORTERCODE,P146_DRIVERNAME,P146_VEHICLETYPECODE,P146_VEHICLENO,P146_LRNO,P146_LRDATE,P146_FREIGHTT'
||'YPECODE,P146_LOADINGADVICETNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P146_MATERIALINTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select PURCHASEORDERTNO , ',
    '        JOBORDERTNO , ',
    '        CCINVOICETNO , ',
    '        GATEPASSTNO , ',
    '        REFDOCTYPECODE , ',
    '        REFDOCNO , ',
    '        REFDOCDATE , ',
    '        REFDOCAMOUNT ,',
    '        TRANSPORTERCODE,',
    '        DRIVERNAME, ',
    '        VEHICLETYPECODE,',
    '        VEHICLENO,',
    '        LRNO,',
    '        LRDATE,',
    '        FREIGHTTYPECODE , ',
    '        loadingadvicetno',
    'from materialin',
    'where tno = :P146_MATERIALINTNO')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8688922568410962)
,p_event_id=>wwv_flow_imp.id(8688036541410962)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set po date'
,p_static_id=>'set-po-date'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PODATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select purchaseorderdate  from purchaseorder',
    'where tno = :P146_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8689458539410962)
,p_event_id=>wwv_flow_imp.id(8688036541410962)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set weighment no'
,p_static_id=>'set-weighment-no'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_WEIGHMENTTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_MATERIALINTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select tno  from weighment',
    'where materialintno = :P146_MATERIALINTNO',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8689904296410962)
,p_name=>'Set Detail Storage RejectedQty1'
,p_static_id=>'set-detail-storage-rejectedqty'
,p_event_sequence=>580
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'UD,DISCREPANCYTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8690394397410963)
,p_event_id=>wwv_flow_imp.id(8689904296410962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REJECTEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_REJECTQTY1',
  'plsql_expression', 'nvl(:P146_REJECTQTY1,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8690830851410963)
,p_name=>'Set detailqty1'
,p_static_id=>'set-detailqty'
,p_event_sequence=>490
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'CHALANQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8691201943410963)
,p_event_id=>wwv_flow_imp.id(8690830851410963)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_DETAILQTY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'CHALANQUANTITY1',
  'plsql_expression', ':CHALANQUANTITY1',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8691738279410963)
,p_name=>'Set Dinspection'
,p_static_id=>'set-dinspection'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8692109015410963)
,p_event_id=>wwv_flow_imp.id(8691738279410963)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DINSPECTIONNO,DINSPECTIONDATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_TNO,ITEMCODE,ITEMSPECIFICATIONCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select DINSPECTIONNO , DINSPECTIONDATE from dinspection',
    'where tno in (',
    'select tno from dinspectiondetail',
    'where grntno = :P146_TNO',
    'and itemcode = :ITEMCODE',
    'and ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
    ')')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8692612688410963)
,p_name=>'Set DISCREPANCYTYPECODE'
,p_static_id=>'set-discrepancytypecode'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY1,CHALANQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8693098527410963)
,p_event_id=>wwv_flow_imp.id(8692612688410963)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DISCREPANCYTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8693522225410964)
,p_event_id=>wwv_flow_imp.id(8692612688410963)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REJECTQUANTITY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'CHALANQUANTITY1,RECEIVEDQUANTITY1',
  'plsql_expression', 'abs(nvl(:CHALANQUANTITY1,0)-nvl(:RECEIVEDQUANTITY1,0))',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8694065842410964)
,p_event_id=>wwv_flow_imp.id(8692612688410963)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DISCREPANCYTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'CHALANQUANTITY1,RECEIVEDQUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    ' rtvalue varchar2(30);',
    'begin',
    '    if nvl(:CHALANQUANTITY1,0) - nvl(:RECEIVEDQUANTITY1,0 ) > 0 then',
    '        rtvalue := ''SHORT'';',
    '     ELSIF nvl(:CHALANQUANTITY1,0) < nvl(:RECEIVEDQUANTITY1,0)  then',
    '        rtvalue := ''EXCESS'';',
    '     else',
    '        rtvalue := ''NONE'';',
    '     end if;',
    '     return rtvalue;',
    '',
    'end ;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8694581329410964)
,p_name=>'Set InspectedQuantity1'
,p_static_id=>'set-inspectedquantity'
,p_event_sequence=>370
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8694979829410964)
,p_event_id=>wwv_flow_imp.id(8694581329410964)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INSPECTEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RECEIVEDQUANTITY1',
  'sql_query', 'select nvl(:RECEIVEDQUANTITY1,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8695494571410964)
,p_name=>'Set itemcode and specs'
,p_static_id=>'set-itemcode-and-specs'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8695811258410964)
,p_event_id=>wwv_flow_imp.id(8695494571410964)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_DETAILITEMCODE,P146_DETAILSPECIFICATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE',
  'sql_query', 'select :ITEMCODE , :ITEMSPECIFICATIONCODE from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8696312240410964)
,p_name=>'Set Other details'
,p_static_id=>'set-other-details'
,p_event_sequence=>630
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_LOADINGADVICETNO'
,p_condition_element=>'P146_FREIGHTUNITCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8696747003410965)
,p_event_id=>wwv_flow_imp.id(8696312240410964)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'disable freight if LA Outbound'
,p_static_id=>'disable-freight-if-la-outbound'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_FREIGHTTYPECODE,P146_FREIGHTUNITCODE,P146_FREIGHTRATE,P146_FREIGHTADVANCEAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P146_LAINBOUNDOUTBOUND'
,p_client_condition_expression=>'OUTBOUND'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8697209433410965)
,p_event_id=>wwv_flow_imp.id(8696312240410964)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_VEHICLENO,P146_DRIVERNAME,P146_TRANSPORTERCODE,P146_VEHICLETYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select  VEHICLENO , Drivername,',
    '        ISSUEDTOPARTYCODE , ',
    '        VEHICLETYPE',
    'from loadingadvice where tno = :P146_LOADINGADVICETNO')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8697795597410965)
,p_event_id=>wwv_flow_imp.id(8696312240410964)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_FREIGHTTYPECODE,P146_FREIGHTUNITCODE,P146_FREIGHTRATE,P146_FREIGHTADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select  FREIGHTTYPECODE , FREIGHTUNITCODE , FREIGHTRATE , FREIGHTADVANCE ',
    'from loadingadvice where tno = :P146_LOADINGADVICETNO ',
    'and freightchargedat = ''INBOUND''')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8698239138410965)
,p_event_id=>wwv_flow_imp.id(8696312240410964)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_LAINBOUNDOUTBOUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select  freightchargedat',
    'from loadingadvice where tno = :P146_LOADINGADVICETNO ',
    '')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8698752758410965)
,p_name=>'Set P146_RECEIVEDQTY1'
,p_static_id=>'set-p146-receivedqty'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8699191858410965)
,p_event_id=>wwv_flow_imp.id(8698752758410965)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_RECEIVEDQTY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RECEIVEDQUANTITY1',
  'sql_query', 'select nvl(:RECEIVEDQUANTITY1,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8699665076410965)
,p_name=>'Set P146_SNO'
,p_static_id=>'set-p146-sno'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8700093522410966)
,p_event_id=>wwv_flow_imp.id(8699665076410965)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'sql_query', 'select :SNO from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8700592123410966)
,p_name=>'Set Page Item ItemCode'
,p_static_id=>'set-page-item-itemcode'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8700936659410966)
,p_event_id=>wwv_flow_imp.id(8700592123410966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno',
    'var pSno1',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "ITEMCODE1");',
    'pSNO1 = model.getValue( this.data.selectedRecords[0], "ITEMSPECIFICATIONCODE1");',
    '',
    'apex.item( "P146_DETAILITEMCODE" ).setValue (pSNO);',
    'apex.item( "P146_DETAILSPECIFICATIONCODE" ).setValue (pSNO1);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8701465169410966)
,p_name=>'Set Page Item received qty1'
,p_static_id=>'set-page-item-received-qty'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8701804376410966)
,p_event_id=>wwv_flow_imp.id(8701465169410966)
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
    'pSNO = model.getValue( this.data.selectedRecords[0], "RECEIVEDQUANTITY1");',
    '',
    'apex.item( "P146_RECEIVEDQTY1" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8702322938410966)
,p_name=>'Set Page Item SNO'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8702713333410966)
,p_event_id=>wwv_flow_imp.id(8702322938410966)
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
    'apex.item( "P146_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8703266555410967)
,p_name=>'Set page item stock tno '
,p_static_id=>'set-page-item-stock-tno'
,p_event_sequence=>540
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793185840067684253)
,p_triggering_element=>'STOCKTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8703674111410967)
,p_event_id=>wwv_flow_imp.id(8703266555410967)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_STOCKTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'STOCKTNO',
  'plsql_expression', ':STOCKTNO',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8704106940410967)
,p_name=>'Set PO'
,p_static_id=>'set-po'
,p_event_sequence=>430
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8704505765410967)
,p_event_id=>wwv_flow_imp.id(8704106940410967)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PURCHASEORDERTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select purchaseordertno from loadingadvice',
    'where tno = :P146_LOADINGADVICETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P146_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8705004500410967)
,p_event_id=>wwv_flow_imp.id(8704106940410967)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_PODATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select purchaseorderdate  from purchaseorder',
    'where tno = :P146_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8705566717410967)
,p_name=>'set qty2'
,p_static_id=>'set-qty'
,p_event_sequence=>590
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793149763636681631)
,p_triggering_element=>'UNLOADINGQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8705917138410967)
,p_event_id=>wwv_flow_imp.id(8705566717410967)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNLOADINGQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'UNLOADINGQUANTITY1,P146_DETAILSPECIFICATIONCODE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :P146_DETAILSPECIFICATIONCODE;',
    '    return nvl(:UNLOADINGQUANTITY1,0)*nvl(mfactor,0);',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8706416357410968)
,p_name=>'set qty2_2'
,p_static_id=>'set-qty-2'
,p_event_sequence=>600
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793149763636681631)
,p_triggering_element=>'UNLOADINGQUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'UNLOADINGQUANTITY2'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8706864993410968)
,p_event_id=>wwv_flow_imp.id(8706416357410968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNLOADINGQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'UNLOADINGQUANTITY1,P146_DETAILSPECIFICATIONCODE,UNLOADINGQUANTITY2',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :P146_DETAILSPECIFICATIONCODE;',
    '    if mfactor <> 0 then',
    '    return nvl(:UNLOADINGQUANTITY2,0)/nvl(mfactor,0);',
    '    else',
    '    return nvl(:UNLOADINGQUANTITY1,0);',
    '    end if;',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8707310277410968)
,p_name=>'set qty2_1'
,p_static_id=>'set-qty-3'
,p_event_sequence=>610
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793149763636681631)
,p_triggering_element=>'REJECTEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8707769886410968)
,p_event_id=>wwv_flow_imp.id(8707310277410968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REJECTEDQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_DETAILSPECIFICATIONCODE,REJECTEDQUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :P146_DETAILSPECIFICATIONCODE;',
    '    return nvl(:REJECTEDQUANTITY1,0)*nvl(mfactor,0);',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8708206567410968)
,p_name=>'set qty2_1_1'
,p_static_id=>'set-qty-4'
,p_event_sequence=>620
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793149763636681631)
,p_triggering_element=>'REJECTEDQUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'REJECTEDQUANTITY2'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8708660312410968)
,p_event_id=>wwv_flow_imp.id(8708206567410968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REJECTEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_DETAILSPECIFICATIONCODE,REJECTEDQUANTITY1,REJECTEDQUANTITY2',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :P146_DETAILSPECIFICATIONCODE;',
    '    ',
    '    if mfactor <> 0 then',
    '    return nvl(:REJECTEDQUANTITY2,0)/nvl(mfactor,0);',
    '    else',
    '    return nvl(:REJECTEDQUANTITY1,0);',
    '    end if;',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8709189583410968)
,p_name=>'Set rate on basis of stock tno page item'
,p_static_id=>'set-rate-on-basis-of-stock-tno-page-item'
,p_event_sequence=>550
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'SD,UD,DISCREPANCYTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8709569100410969)
,p_event_id=>wwv_flow_imp.id(8709189583410968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_STOCKTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(rate,0) from stock',
    'where tno = :P146_STOCKTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8710017419410969)
,p_name=>'Set ReceivedQuantity2'
,p_static_id=>'set-receivedquantity'
,p_event_sequence=>350
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8710445996410969)
,p_event_id=>wwv_flow_imp.id(8710017419410969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RECEIVEDQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,RECEIVEDQUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return nvl(:RECEIVEDQUANTITY1,0)*nvl(mfactor,0);',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8710927468410969)
,p_name=>'Set ReceivedQuantity1'
,p_static_id=>'set-receivedquantity-2'
,p_event_sequence=>360
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8711365230410969)
,p_event_id=>wwv_flow_imp.id(8710927468410969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RECEIVEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,RECEIVEDQUANTITY2,RECEIVEDQUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return nvl(:RECEIVEDQUANTITY2,0)/nvl(mfactor,0);',
    '    exception when others then',
    '        return nvl(:RECEIVEDQUANTITY1,0);',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'RECEIVEDQUANTITY2'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8711845285410969)
,p_name=>'Set Reject Qty'
,p_static_id=>'set-reject-qty'
,p_event_sequence=>310
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'DISCREPANCYTYPECODE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'DISCREPANCYTYPECODE'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'REJECT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8712290059410969)
,p_event_id=>wwv_flow_imp.id(8711845285410969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REJECTEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'CHALANQUANTITY1,RECEIVEDQUANTITY1',
  'sql_query', 'select nvl(:CHALANQUANTITY1,0)-nvl(:RECEIVEDQUANTITY1,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8712779678410969)
,p_name=>'Set Reject Qty_1'
,p_static_id=>'set-reject-qty-2'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'DISCREPANCYTYPECODE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'DISCREPANCYTYPECODE'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'REJECT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8713111786410970)
,p_event_id=>wwv_flow_imp.id(8712779678410969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REJECTEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_REJECTQTY1',
  'sql_query', 'select nvl(:P146_REJECTQTY1,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8713671334410970)
,p_name=>'Set reject qty1'
,p_static_id=>'set-reject-qty-3'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8571077824410861)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8714020930410970)
,p_event_id=>wwv_flow_imp.id(8713671334410970)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailStorage").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("REJECTEDQUANTITY1");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P146_REJECTQTY1").setValue(n_totamt);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8714512166410970)
,p_name=>'Set SN'
,p_static_id=>'set-sn'
,p_event_sequence=>280
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(793149763636681631)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8714981060410970)
,p_event_id=>wwv_flow_imp.id(8714512166410970)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SN',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SN is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SN;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8715478639410970)
,p_name=>'Set SN1'
,p_static_id=>'set-sn-2'
,p_event_sequence=>290
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(793185840067684253)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8715868396410970)
,p_event_id=>wwv_flow_imp.id(8715478639410970)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SN',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SN is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SN;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8716310560410971)
,p_name=>'Set storage code'
,p_static_id=>'set-storage-code'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793185840067684253)
,p_triggering_element=>'STORAGELOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8716739161410971)
,p_event_id=>wwv_flow_imp.id(8716310560410971)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_STORAGELOCATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'STORAGELOCATIONCODE',
  'plsql_expression', ':STORAGELOCATIONCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8717220072410971)
,p_name=>'Set sum of qty1'
,p_static_id=>'set-sum-of-qty'
,p_event_sequence=>480
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(793185840067684253)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8717673577410971)
,p_event_id=>wwv_flow_imp.id(8717220072410971)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("StockStorageDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("QUANTITY1");',
    '',
    'var totalAmt = 0;',
    '',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  ',
    '});',
    '',
    '$s("P146_STOCKQTY1", totalAmt);',
    '',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8718127178410971)
,p_event_id=>wwv_flow_imp.id(8717220072410971)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_STOCKQTY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1',
  'plsql_expression', ':QUANTITY1',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8718619874410971)
,p_name=>'Set The Storage Location for Out to Out Case'
,p_static_id=>'set-the-storage-location-for-out-to-out-case'
,p_event_sequence=>740
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(791584114826107354)
,p_triggering_element=>'RECEIVEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8719004405410972)
,p_event_id=>wwv_flow_imp.id(8718619874410971)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P146_TNO,P146_SNO,P146_LOADINGADVICETNO,RECEIVEDQUANTITY1,RECEIVEDQUANTITY2,REJECTEDQUANTITY2,P146_IS_OUT_TO_OUT_CASE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    -- Process only if it is an Out-to-Out case',
    '    IF :P146_IS_OUT_TO_OUT_CASE = 1 THEN',
    '        ',
    '        BEGIN',
    '            INSERT INTO grndetailstorage (',
    '                TNO, SNO, SN, STORAGELOCATIONCODE, ',
    '                UNLOADINGQUANTITY1, UNLOADINGQUANTITY2, ',
    '                REJECTEDQUANTITY1, REMARK',
    '            )',
    '            SELECT ',
    '                :P146_TNO, ',
    '                :P146_SNO, ',
    '                GlobalTno.NEXTVAL, ',
    '                sl.StorageLocationCode, ',
    '                :RECEIVEDQUANTITY1, ',
    '                :RECEIVEDQUANTITY2, ',
    '                :REJECTEDQUANTITY1, ',
    '                ''AUTO INSERTED FOR OTO CASE''',
    '            FROM StorageLocation sl',
    '            INNER JOIN Party p      ON p.PartyName = sl.StorageLocationName',
    '            INNER JOIN SalesOrder so ON so.PartyCode = p.PartyCode',
    '            INNER JOIN LoadingAdvice la ON la.SalesOrderTno = so.TNo',
    '            WHERE la.TNo = :P146_LOADINGADVICETNO',
    '              AND ROWNUM = 1; ',
    '',
    '',
    '        EXCEPTION',
    '            WHEN OTHERS THEN',
    '                ROLLBACK; ',
    '                RAISE_APPLICATION_ERROR(-20001, ''Error during OTO auto-insert: '' || SQLERRM);',
    '        END;',
    '        ',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8719549719410972)
,p_name=>'set value for stock required'
,p_static_id=>'set-value-for-stock-required'
,p_event_sequence=>710
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8720471209410972)
,p_event_id=>wwv_flow_imp.id(8719549719410972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_STOCKREQUIRED'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'rtvalue varchar2(30);',
    'begin',
    'if :P146_LOADINGADVICETNO is not null then',
    '    for vloop in (',
    '            Select  *',
    '             From loadingadvice a ',
    '            Where A.TNO = :P146_LOADINGADVICETNO',
    '              and (a.ispartylocation=''YES''           -- Change it to ''YES'' from ''No'' to enable to stock allocation for Out to Out Cases  -- Changed by Vibhor',
    '               OR getmyparametervalue(''STOCKREQUIREDFOROUTWARD'')=''YES'')',
    '    ) loop',
    '            rtvalue := ''YES'';',
    '      end loop;',
    'else',
    '    rtvalue := ''YES'';',
    'end if;',
    'return(nvl(rtvalue,''NO''));',
    'end;',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8719954921410972)
,p_event_id=>wwv_flow_imp.id(8719549719410972)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_IS_OUT_TO_OUT_CASE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_rtn NUMBER := 0;',
    'BEGIN',
    '    BEGIN',
    '        SELECT 1 INTO v_rtn',
    '        FROM dual',
    '        WHERE EXISTS (',
    '            SELECT 1 ',
    '            FROM LoadingAdvice',
    '            WHERE TNo = :P146_LOADINGADVICETNO',
    '              AND SalesOrderTno IS NOT NULL ',
    '              AND ispartylocation = ''YES''',
    '        );',
    '    EXCEPTION',
    '        WHEN NO_DATA_FOUND THEN',
    '            v_rtn := 0;',
    '    END;',
    '',
    '    RETURN v_rtn;',
    'END;',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8720997681410972)
,p_name=>'set value for stock required during page load'
,p_static_id=>'set-value-for-stock-required-during-page-load'
,p_event_sequence=>720
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8721362778410972)
,p_event_id=>wwv_flow_imp.id(8720997681410972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_STOCKREQUIRED'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P146_LOADINGADVICETNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'rtvalue varchar2(30);',
    'begin',
    'if :P146_LOADINGADVICETNO is not null then',
    '        for vloop in (',
    '        Select  *',
    '                 From loadingadvice a ',
    '                Where A.TNO = :P146_LOADINGADVICETNO',
    '                  and (a.ispartylocation=''YES''          -- Change it to ''YES'' from ''No'' to enable to stock allocation for Out to Out Cases  -- Changed by Vibhor',
    '                   OR getmyparametervalue(''STOCKREQUIREDFOROUTWARD'')=''YES'')',
    '        ) loop',
    '            rtvalue := ''YES'';',
    '        end loop;',
    'else',
    '    rtvalue := ''YES'';',
    'end if;',
    'return(nvl(rtvalue,''NO''));',
    '--return(''YES'');',
    'end;',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8634985510410929)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check received qty'
,p_static_id=>'check-received-qty'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for i in (select RECEIVEDQUANTITY1 from grndetail where tno = :P146_TNO)',
'    loop',
'        if i.RECEIVEDQUANTITY1 is null then',
'           raise_application_error(-20000,''Please check Received Qty.''); ',
'        end if;',
'    end loop; ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8634985510410929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8636107575410930)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check ref no'
,p_static_id=>'check-ref-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tmp number;',
'    tmp1 number;',
'begin',
'',
'',
'    select count(*) into tmp from materialin',
'    where FINANCIALYEARCODE = :P146_FINANCIALYEARCODE',
'    and PARTYCODE = :P146_PARTYCODE',
'    and REFDOCTYPECODE = :P146_REFDOCTYPECODE',
'    and REFDOCNO = :P146_REFDOCNO;',
'',
'    select count(*) into tmp1 from grn    ',
'    where FINANCIALYEARCODE = :P146_FINANCIALYEARCODE',
'    and PARTYCODE = :P146_PARTYCODE',
'    and REFDOCTYPECODE = :P146_REFDOCTYPECODE',
'    and REFDOCNO = :P146_REFDOCNO;',
'',
'    /* if nvl(tmp , 0)> 0   then ',
'        raise_application_error(-20000,''REF DOC NO is already used in Matrial In.'');',
'    end if; */',
'    if nvl(tmp1 , 0)> 0   then ',
'        raise_application_error(-20000,''REF DOC NO is already used in GRN.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8526302052410805)
,p_internal_uid=>8636107575410930
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8635755223410929)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check stock transfer'
,p_static_id=>'check-stock-transfer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'begin',
'    select count(*) into tmp ',
'    from stocktransfer    ',
'    where moduletno = :P146_TNO;',
'',
'    if tmp >0 then',
'        raise_application_error(-20000,''Stock transfer is already done.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8526747535410806)
,p_internal_uid=>8635755223410929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8637771220410931)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update grndetail ',
'set INSPECTEDQUANTITY1 = 0 , ',
'ACCEPTEDQUANTITY1 = 0,',
'REJECTEDQUANTITY1 = 0',
'where tno = :P146_TNO;',
'',
'delete from inspectiondetail where tno in (select tno from inspection where grntno = :P146_TNO);',
'delete from inspection where grntno = :P146_TNO;',
'',
'delete from dinspectiondetail where tno in (select tno from dinspection where grntno = :P146_TNO);',
'delete from dinspection where grntno = :P146_TNO;',
'',
'delete from GRNDETAIL where tno = :P146_TNO;',
'delete from GRNDETAILSTORAGE where tno = :P146_TNO;',
'delete from GRNJOB where tno = :P146_TNO;',
'delete from GRNSTOCKSTORAGEDETAIL where tno = :P146_TNO;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8526747535410806)
,p_internal_uid=>8637771220410931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8634512781410928)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'    tmp1 number;',
'    tmp2 number;',
'begin',
'    checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P146_TNO);',
'',
'    select sum(receivedquantity1) into tmp from grndetail where tno = :P146_TNO;',
'',
'    SELECT SUM(QUANTITY1) INTO TMP2',
'     FROM  Grnstockstoragedetail where tno = :P146_TNO and :P146_DOCTYPECODE IN (''SALERETURN'',''CONVERSIONJOBOUTOFPREMISES'');',
'',
'',
'    select sum(UNLOADINGQUANTITY1) into tmp1 ',
'    from grndetailstorage where tno = :P146_TNO;',
'',
'    if nvl(tmp,0) <> nvl(tmp1,0)  and :P146_STOCKREQUIRED = ''YES'' then',
'        raise_application_error(-20000,''Detail Received Quantity not matched with Detail Unloaded Quantity, Pl Check UD TAB'');',
'    end if;',
'    if nvl(tmp,0) <> nvl(tmp2,0)  and :P146_STOCKREQUIRED = ''YES'' and :P146_DOCTYPECODE IN (''SALERETURN'',''CONVERSIONJOBOUTOFPREMISES'')',
'     then',
'        raise_application_error(-20000,''Detail Received Quantity not matched with Detail Allocated Quantity, Pl Check SD TAB'');',
'    end if;',
'',
'end; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8634512781410928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8571812673410861)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(793149763636681631)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DetailStorage - Save Interactive Grid Data'
,p_static_id=>'detailstorage-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8571812673410861
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8579363992410868)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(793114131398680152)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'EQ - Save Interactive Grid Data'
,p_static_id=>'eq-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8579363992410868
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8636531955410930)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'If :P146_TNO is null then',
'    :P146_TNO := GlobalTNo.nextval;',
'    :P146_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P146_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'',
':P146_STATUS := NVL(GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P146_TNO),''STATUS'');',
'',
'select STOCKTRANSFERNO , tno  into :P146_STOCKTRANSFERNO , :P146_STOCKTRANSFERTNO from stocktransfer',
'where moduletno = :P146_TNO;',
'exception when others then',
'    null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8636531955410930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8636978705410930)
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
'       :P146_MODULEFLOW := ''YES'';',
'   else',
'       :P146_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P146_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P146_ONTHETABLE := ''YES'' ;',
'   else',
'       :P146_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8636978705410930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8562855633410853)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(791584114826107354)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GrnDetail - Save Interactive Grid Data'
,p_static_id=>'grndetail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into GRNDETAIL (                 ',
'                    TNO,',
'SNO,',
'ITEMCODE,',
'ITEMSPECIFICATIONCODE,',
'STOREAGELOCATIONCODE,',
'CHALANQUANTITY1,',
'RECEIVEDQUANTITY1,',
'CHALANQUANTITY2,',
'RECEIVEDQUANTITY2,',
'INSPECTEDQUANTITY1,',
'INSPECTEDQUANTITY2,',
'ACCEPTEDQUANTITY1,',
'ACCEPTEDQUANTITY2,',
'REJECTEDQUANTITY1,',
'REJECTEDQUANTITY2,',
'JOININSPECTEDQUANTITY1,',
'JOININSPECTEDQUANTITY2,',
'JOINACCEPTEDQUANTITY1,',
'JOINACCEPTEDQUANTITY2,',
'JOINREJECTEDQUANTITY1,',
'JOINREJECTEDQUANTITY2,',
'RATE,',
'RATEMEASURINGUNITCODE,',
'DISCREPANCYAMOUNT,',
'DISCREPANCYTYPECODE,',
'DISCREPANCYQUANTITY1,',
'DISCREPANCYQUANTITY2,',
'AMOUNT,',
'REMARK,',
'PACKINGTYPECODE,',
'DESCRIPTION,',
'--STORAGELOCATIONCODE,',
'PURCHASEORDERTNO,',
'JOBORDERTNO,',
'--MRNQUANTITY1,',
'--MRNQUANTITY2,',
'PACKINGNOS,',
'POAMENDMENTTNO,',
'--SERIALNO,',
'--ISEXCISABLE,',
'--ISCAPITAL,',
'--MBILLNO,',
'--MBILLDATE,',
'QCLESSQUANTITY1,',
'RECEIVEDQUANTITY1WITHOUTQC,',
'PACKINGWEIGHT,',
'FREIGHTPOSTEDTOSTOCK,',
'JOBPOSTEDTOSTOCK,',
'WARRANTYUPTO,',
'PURCHASEPOSTEDTOSTOCK,',
'PURCHASEPOSTEDTOSTOCKRATE,',
'FREIGHTPOSTEDTOSTOCKRATE,',
'JOBPOSTEDTOSTOCKRATE',
'',
'',
'',
'            )',
'            Values (',
'                :TNO,',
':SNO,',
':ITEMCODE,',
':ITEMSPECIFICATIONCODE,',
':STOREAGELOCATIONCODE,',
':CHALANQUANTITY1,',
':RECEIVEDQUANTITY1,',
':CHALANQUANTITY2,',
':RECEIVEDQUANTITY2,',
':INSPECTEDQUANTITY1,',
':INSPECTEDQUANTITY2,',
':ACCEPTEDQUANTITY1,',
':ACCEPTEDQUANTITY2,',
':REJECTEDQUANTITY1,',
':REJECTEDQUANTITY2,',
':JOININSPECTEDQUANTITY1,',
':JOININSPECTEDQUANTITY2,',
':JOINACCEPTEDQUANTITY1,',
':JOINACCEPTEDQUANTITY2,',
':JOINREJECTEDQUANTITY1,',
':JOINREJECTEDQUANTITY2,',
':RATE,',
':RATEMEASURINGUNITCODE,',
':DISCREPANCYAMOUNT,',
':DISCREPANCYTYPECODE,',
':DISCREPANCYQUANTITY1,',
':DISCREPANCYQUANTITY2,',
':AMOUNT,',
':REMARK,',
':PACKINGTYPECODE,',
':DESCRIPTION,',
'--:STORAGELOCATIONCODE,',
':PURCHASEORDERTNO,',
':JOBORDERTNO,',
'--:MRNQUANTITY1,',
'--:MRNQUANTITY2,',
':PACKINGNOS,',
':POAMENDMENTTNO,',
'--:SERIALNO,',
'--:ISEXCISABLE,',
'--:ISCAPITAL,',
'--:MBILLNO,',
'--:MBILLDATE,',
':QCLESSQUANTITY1,',
':RECEIVEDQUANTITY1WITHOUTQC,',
':PACKINGWEIGHT,',
':FREIGHTPOSTEDTOSTOCK,',
':JOBPOSTEDTOSTOCK,',
':WARRANTYUPTO,',
':PURCHASEPOSTEDTOSTOCK,',
':PURCHASEPOSTEDTOSTOCKRATE,',
':FREIGHTPOSTEDTOSTOCKRATE,',
':JOBPOSTEDTOSTOCKRATE',
'',
'              ',
'',
'            );',
'        ',
'        when ''U'' then',
'            update GRNDETAIL Set',
'                 TNO=:TNO,',
'SNO=:SNO,',
'ITEMCODE=:ITEMCODE,',
'ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'STOREAGELOCATIONCODE=:STOREAGELOCATIONCODE,',
'CHALANQUANTITY1=:CHALANQUANTITY1,',
'RECEIVEDQUANTITY1=:RECEIVEDQUANTITY1,',
'CHALANQUANTITY2=:CHALANQUANTITY2,',
'RECEIVEDQUANTITY2=:RECEIVEDQUANTITY2,',
'INSPECTEDQUANTITY1=:INSPECTEDQUANTITY1,',
'INSPECTEDQUANTITY2=:INSPECTEDQUANTITY2,',
'ACCEPTEDQUANTITY1=:ACCEPTEDQUANTITY1,',
'ACCEPTEDQUANTITY2=:ACCEPTEDQUANTITY2,',
'REJECTEDQUANTITY1=:REJECTEDQUANTITY1,',
'REJECTEDQUANTITY2=:REJECTEDQUANTITY2,',
'JOININSPECTEDQUANTITY1=:JOININSPECTEDQUANTITY1,',
'JOININSPECTEDQUANTITY2=:JOININSPECTEDQUANTITY2,',
'JOINACCEPTEDQUANTITY1=:JOINACCEPTEDQUANTITY1,',
'JOINACCEPTEDQUANTITY2=:JOINACCEPTEDQUANTITY2,',
'JOINREJECTEDQUANTITY1=:JOINREJECTEDQUANTITY1,',
'JOINREJECTEDQUANTITY2=:JOINREJECTEDQUANTITY2,',
'RATE=:RATE,',
'RATEMEASURINGUNITCODE=:RATEMEASURINGUNITCODE,',
'DISCREPANCYAMOUNT=:DISCREPANCYAMOUNT,',
'DISCREPANCYTYPECODE=:DISCREPANCYTYPECODE,',
'DISCREPANCYQUANTITY1=:DISCREPANCYQUANTITY1,',
'DISCREPANCYQUANTITY2=:DISCREPANCYQUANTITY2,',
'AMOUNT=:AMOUNT,',
'REMARK=:REMARK,',
'PACKINGTYPECODE=:PACKINGTYPECODE,',
'DESCRIPTION=:DESCRIPTION,',
'--STORAGELOCATIONCODE=:STORAGELOCATIONCODE,',
'PURCHASEORDERTNO=:PURCHASEORDERTNO,',
'JOBORDERTNO=:JOBORDERTNO,',
'--MRNQUANTITY1=:MRNQUANTITY1,',
'--MRNQUANTITY2=:MRNQUANTITY2,',
'PACKINGNOS=:PACKINGNOS,',
'POAMENDMENTTNO=:POAMENDMENTTNO,',
'--SERIALNO=:SERIALNO,',
'--ISEXCISABLE=:ISEXCISABLE,',
'--ISCAPITAL=:ISCAPITAL,',
'--MBILLNO=:MBILLNO,',
'--MBILLDATE=:MBILLDATE,',
'QCLESSQUANTITY1=:QCLESSQUANTITY1,',
'RECEIVEDQUANTITY1WITHOUTQC=:RECEIVEDQUANTITY1WITHOUTQC,',
'PACKINGWEIGHT=:PACKINGWEIGHT,',
'FREIGHTPOSTEDTOSTOCK=:FREIGHTPOSTEDTOSTOCK,',
'JOBPOSTEDTOSTOCK=:JOBPOSTEDTOSTOCK,',
'WARRANTYUPTO=:WARRANTYUPTO,',
'PURCHASEPOSTEDTOSTOCK=:PURCHASEPOSTEDTOSTOCK,',
'PURCHASEPOSTEDTOSTOCKRATE=:PURCHASEPOSTEDTOSTOCKRATE,',
'FREIGHTPOSTEDTOSTOCKRATE=:FREIGHTPOSTEDTOSTOCKRATE,',
'JOBPOSTEDTOSTOCKRATE=:JOBPOSTEDTOSTOCKRATE',
'',
'            WHERE TNO = :P146_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From GRNDETAIL',
'            Where TNo = :P146_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8562855633410853
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8625906927410916)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(793329189068469265)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'GrnJob - Save Interactive Grid Data'
,p_static_id=>'grnjob-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8625906927410916
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8596681913410889)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(635135915118316562)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form GRN'
,p_static_id=>'initialize-form-grn'
,p_internal_uid=>8596681913410889
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8638540251410931)
,p_process_sequence=>110
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
,p_internal_uid=>8638540251410931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8597034201410889)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(635135915118316562)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form GRN'
,p_static_id=>'process-form-grn'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8597034201410889
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8638138921410931)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P146_TNO, :P146_GRNNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8526302052410805)
,p_internal_uid=>8638138921410931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8634145695410928)
,p_process_sequence=>130
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P146_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P146_ALLOWEDBACK,:P146_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'else',
'     :P146_ALLOWEDBACK       := :P146_GRNDATE ; ',
'    :P146_ALLOWEDFORWARD    := :P146_GRNDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8634145695410928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8637316729410930)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Doc No'
,p_static_id=>'set-doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P146_TNO is null then',
'        Select GlobalTno.NextVal into :P146_TNO From Dual;',
'     end if;',
'    ----',
'    if :P146_GRNNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P146_LOCATIONCODE,',
'					:P146_DOCTYPECODE,',
'					NULL,',
'					TO_DATE(:P146_GRNDATE, ''DD-MM-RRRR'')',
'				);',
'        :P146_GRNNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P146_LOCATIONCODE,',
'                    :P146_DOCTYPECODE,',
'                    NULL,',
'                    TO_DATE(:P146_GRNDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    :P146_REFDOCNO  := utl_i18n.unescape_reference(:P146_REFDOCNO);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8637316729410930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8632707076410922)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(793185840067684253)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'StockStorageDetail - Save Interactive Grid Data'
,p_static_id=>'stockstoragedetail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8632707076410922
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8635300243410929)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update FREIGHTPOSTEDTOSTOCK'
,p_static_id=>'update-freightpostedtostock'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    pFREIGHTPOSTEDTOSTOCK number;',
'    pFREIGHTPOSTEDTOSTOCKDETAIL number;',
'    pRECEIVEDQUANTITY1 number;',
'',
'begin',
'',
'    select FREIGHTPOSTEDTOSTOCK into pFREIGHTPOSTEDTOSTOCK from grn',
'    where tno = :P146_TNO;',
'',
'    select sum(RECEIVEDQUANTITY1) into pRECEIVEDQUANTITY1 from grndetail',
'    where tno = :P146_TNO;',
'',
'    for i in ',
'    (',
'        select sno , RECEIVEDQUANTITY1 , FREIGHTPOSTEDTOSTOCK from grndetail where tno = :P146_TNO',
'    )',
'    loop',
'        if i.FREIGHTPOSTEDTOSTOCK is null then',
'            pFREIGHTPOSTEDTOSTOCKDETAIL := (pFREIGHTPOSTEDTOSTOCK/pRECEIVEDQUANTITY1)*i.RECEIVEDQUANTITY1;',
'',
'            update grndetail set FREIGHTPOSTEDTOSTOCK = pFREIGHTPOSTEDTOSTOCKDETAIL',
'            where tno = :P146_TNO',
'            and sno = i.sno;',
'        end if;',
'',
'',
'    end loop;',
'',
'exception when others then',
'    null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8635300243410929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8562449393410853)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(791584114826107354)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validation with Detail and Stock Detail'
,p_static_id=>'validation-with-detail-and-stock-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'    tmp1 number;',
'    tmp2 number;',
'begin',
'    select sum(receivedquantity1) into tmp from GRNDETAIL',
'    where sno = :SNO;',
'',
'    select sum(UNLOADINGQUANTITY1) into tmp1 from GRNDETAILSTORAGE',
'    where sno = :SNO;',
'',
'    select sum(QUANTITY1) into tmp2 from GRNSTOCKSTORAGEDETAIL',
'    where sno = :SNO;',
'    ',
'    if tmp <> tmp1 and :P146_STOCKREQUIRED = ''YES'' then',
'        raise_application_error(-20000 , ''GRN Detail Storage Quantity Not Matching. With Unloaded Quantity'');',
'    end if;',
'',
'    if tmp <> tmp2 and :P146_STOCKREQUIRED = ''YES'' then',
'        raise_application_error(-20000 , ''GRN Detail Quantity Not Matching with Allocated Quantity'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8562449393410853
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
