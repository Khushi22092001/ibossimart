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
--     PAGE: 706
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00706
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>706);
end;
/
prompt --application/pages/page_00706
begin
wwv_flow_imp_page.create_page(
 p_id=>706
,p_name=>'Sales Enquiry'
,p_alias=>'SALES-ENQUIRY1'
,p_step_title=>'Sales Enquiry'
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
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/// Code for Next Item In Enter',
'// $(document).on(''keydown'', '':tabbable'', function(e) {',
'',
'//     if (e.key === "Enter") {',
'//         e.preventDefault();',
'',
'//         var $canfocus = $('':tabbable:visible'');',
'//         var index = $canfocus.index(document.activeElement) + 1;',
'',
'//         if (index >= $canfocus.length) index = 0;',
'//         $canfocus.eq(index).focus();',
'//     }',
'',
'// });',
'// End Code ',
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
'  var bireporturl = $(''#P171_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/SalesOrder.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P171_TNO'').val() ',
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
'  var bireporturl = $(''#P171_BIREPORTURL'').val()',
'  var reportName =  ''SalesOrder.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P171_TNO'').val() ',
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
''))
,p_javascript_code_onload=>'apex.item( "P171_LOCATIONCODE" ).setFocus();'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.no-close .ui-dialog-titlebar-close ( display: none;)',
'',
'',
'',
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
 p_id=>wwv_flow_imp.id(1635232487917736693)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_parent_plug_id=>wwv_flow_imp.id(1042396721355108024)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
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
'  WHERE A.MODULETNO = :P706_TNO',
'  and a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P706_TNO'
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
 p_id=>wwv_flow_imp.id(1635233232492736701)
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
,p_detail_link=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULESNO,P1063_PARENT_FORMSTATUS:#MODULESNO#,&P706_FORMSTATUS.#SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>1526951698692354394
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1635233801978736706)
,p_db_column_name=>'ATTACHMENTBLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Attachment BLOB'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1354849213697607014)
,p_db_column_name=>'ATTRIBUTECODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Attribute Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482448088220551389)
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
 p_id=>wwv_flow_imp.id(1635233873218736707)
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
 p_id=>wwv_flow_imp.id(1202980002967921506)
,p_db_column_name=>'MODULESNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Module Sno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1201585727633790455)
,p_db_column_name=>'MODULETNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Module Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622234923792716109)
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
 p_id=>wwv_flow_imp.id(1635233391795736702)
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
 p_id=>wwv_flow_imp.id(1637878821890712155)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1191210709198112479)
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
 p_id=>wwv_flow_imp.id(1558593752359181820)
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
 p_id=>wwv_flow_imp.id(1058710908769401935)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:margin-top-sm:margin-bottom-sm'
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
 p_id=>wwv_flow_imp.id(727659172888472765)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(1042396721355108024)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.ROWID,',
'       A.TNO,',
'       A.SNO,',
'       A.ITEMCODE,',
'       A.ITEMSPECIFICATIONCODE,',
'       A.DESCRIPTION,',
'       A.QUANTITY1,',
'       A.QUANTITY2,',
'       A.RATEMEASURINGUNITCODE,',
'       A.RATE,',
'       A.AMOUNT,',
'       A.FOOTERAMOUNT,',
'       A.TOTALAMOUNT,',
'       A.REMARK,',
'       A.LOWERTOLERANCEPERCENT,',
'       A.HIGHERTOLERANCEPERCENT,',
'      ',
'       GetMeasuringUnitNameFromItem(itemcode) as unit1,',
'       GetMeasuringUnit2NameFromItem(itemcode) as unit2,',
'       ''FD'' as FD',
'  from SALESENQUIRYDETAIL A',
'  where A.tno = :P706_TNO',
'    --AND A.ITEMCODE = B.ITEMCODE'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P706_TNO'
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
 p_id=>wwv_flow_imp.id(728797315071429989)
,p_heading=>'Item'
,p_static_id=>'item'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(728797382118429990)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(728797622168429992)
,p_heading=>'Rate'
,p_static_id=>'rate'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(728797501052429991)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(320709060156832189)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
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
 p_id=>wwv_flow_imp.id(727661658936472790)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(727661835226472791)
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
 p_id=>wwv_flow_imp.id(727659907841472772)
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
,p_group_id=>wwv_flow_imp.id(728797315071429989)
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
 p_id=>wwv_flow_imp.id(728080895849091353)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'FD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''FooterDetail'')'
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
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="javascript:openModal(''FooterDetail'')">',
' <span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(727660668400472780)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
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
,p_static_id=>'FOOTERAMOUNT'
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
 p_id=>wwv_flow_imp.id(727661129808472784)
,p_name=>'HIGHERTOLERANCEPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HIGHERTOLERANCEPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Higher Tolerance Percent'
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
 p_id=>wwv_flow_imp.id(727659687461472770)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(728797315071429989)
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
,p_lov_source=>'select itemname d, itemcode r from item '
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
 p_id=>wwv_flow_imp.id(727659799575472771)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(728797315071429989)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '300',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '550')).to_clob
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
,p_static_id=>'ITEMSPECIFICATIONCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(727660965059472783)
,p_name=>'LOWERTOLERANCEPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOWERTOLERANCEPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lower Tolerance Percent'
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
 p_id=>wwv_flow_imp.id(727660032268472773)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(728797382118429990)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY1'
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
 p_id=>wwv_flow_imp.id(727660108544472774)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(728797501052429991)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY2'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(320708987338832188)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
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
 p_id=>wwv_flow_imp.id(727660238083472775)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Rate Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(728797622168429992)
,p_use_group_for=>'BOTH'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measuringunitname , measuringunitcode',
'from measuringunit',
'where measuringunitcode in (select measuringunitcode1 from item where itemcode = :ITEMCODE)',
'union all',
'select measuringunitname , measuringunitcode',
'from measuringunit',
'where measuringunitcode in (select measuringunitcode2 from item where itemcode = :ITEMCODE)',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE,UNIT2'
,p_ajax_optimize_refresh=>true
,p_static_id=>'RATEMEASURINGUNITCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(727660886683472782)
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
 p_id=>wwv_flow_imp.id(727659431137472767)
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
 p_id=>wwv_flow_imp.id(727659579065472769)
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
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(727659533207472768)
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
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P706_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(727660843570472781)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TOTALAMOUNT'
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
 p_id=>wwv_flow_imp.id(728081229292091356)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(728797382118429990)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'UNIT1'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(728081323061091357)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(728797501052429991)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(727659266947472766)
,p_internal_uid=>619377733147090459
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
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
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(728037923937997956)
,p_interactive_grid_id=>wwv_flow_imp.id(727659266947472766)
,p_static_id=>'1688226'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(728038142597997956)
,p_report_id=>wwv_flow_imp.id(728037923937997956)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(323691281581179582)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(320708987338832188)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(323692018772179616)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(320709060156832189)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728038616405997957)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(727659431137472767)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728039480598997959)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(727659533207472768)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728040434305997961)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(727659579065472769)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728041328211997963)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(727659687461472770)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728042191716997965)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(727659799575472771)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>340
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728043100888997967)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(727659907841472772)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728044006321997970)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(727660032268472773)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728044898123997972)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(727660108544472774)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728045754329997974)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(727660238083472775)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728050175377997984)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(727660668400472780)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728051136304997986)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(727660843570472781)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728051999957997988)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(727660886683472782)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728052869307997990)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(727660965059472783)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728053818689997992)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(727661129808472784)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728061773011000817)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(727661658936472790)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728096098579175318)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(728080895849091353)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728098706295188278)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(728081229292091356)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>51
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(728099546796188280)
,p_view_id=>wwv_flow_imp.id(728038142597997956)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(728081323061091357)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1049609076160423931)
,p_plug_name=>'E-Mail'
,p_static_id=>'e-mail'
,p_region_name=>'EMAIL'
,p_parent_plug_id=>wwv_flow_imp.id(1042396721355108024)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       MODULETNO,',
'       MODULESNO,',
'       MODULESN,',
'       MODULECODE,',
'      -- MODULETABLENAME,',
'      -- MODULESERIALNO,',
'       ATTRIBUTECODE,',
'       ATTRIBUTEVALUE,',
'      -- DESCRIPTION,',
'      -- ATTACHMENTBLOB,',
'      decode( nvl(FileName, ''NULL''), ''NULL'', ''NO'', ''YES'') as FILENAME,',
'      -- MIMETYPE,',
'       REMARK',
'  from MODULEATTACHMENT ',
'  where tno = :P706_TNO'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P706_TNO'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(320709233588832191)
,p_plug_name=>'EnquiryParty'
,p_static_id=>'enquiryparty'
,p_region_name=>'ENQUIRYPARTY'
,p_region_css_classes=>'js-dialog-size300x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize:js-headingLevel-2:t-Form--labelsAbove:margin-top-none:margin-bottom-none'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'FooterDetail'
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
,p_landmark_type=>'exclude_landmark'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1045459856659515802)
,p_plug_name=>'FooterDetail'
,p_static_id=>'footerdetail'
,p_region_name=>'FooterDetail'
,p_region_css_classes=>'js-dialog-size900x500'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize:js-headingLevel-2:t-Form--labelsAbove:margin-top-none:margin-bottom-none'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SN,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       SERIALNO,',
'      -- TAXFORMCODE,',
'       LEGENDSCODE',
'  from SALESENQUIRYDETAILFOOTER',
'  where tno = :P706_TNO',
'    and sno = :P706_SNO;',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P706_TNO,P706_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'FooterDetail'
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
,p_landmark_type=>'exclude_landmark'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045460957513515813)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045461094052515814)
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
 p_id=>wwv_flow_imp.id(1045460304436515806)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Footer Head'
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
'SELECT',
'a.FOOTERHEADNAME,',
'a.FOOTERHEADCODE',
'FROM FOOTERHEAD a'))
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
 p_id=>wwv_flow_imp.id(1045460372742515807)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Percent'
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
 p_id=>wwv_flow_imp.id(1045460433450515808)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(1045460786446515811)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends Code'
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'LEGENDSCODE d,',
'LEGENDSCODE r',
'FROM LEGENDS'))
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
 p_id=>wwv_flow_imp.id(574686798552420257)
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
 p_id=>wwv_flow_imp.id(1045460553694515809)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
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
 p_id=>wwv_flow_imp.id(576613834891296008)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045460137901515805)
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
,p_static_id=>'SNO1'
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045460115511515804)
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(1045459984259515803)
,p_internal_uid=>937178450459133496
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
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(1045487202077940935)
,p_interactive_grid_id=>wwv_flow_imp.id(1045459984259515803)
,p_static_id=>'1491538'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(1045487359687940935)
,p_report_id=>wwv_flow_imp.id(1045487202077940935)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(576610821710287444)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(574686798552420257)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(576619824092297350)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(576613834891296008)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045487920290940936)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(1045460115511515804)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045488766356940938)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(1045460137901515805)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045489675970940940)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(1045460304436515806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045490535368940942)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(1045460372742515807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045491475667940944)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(1045460433450515808)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045492379569940946)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(1045460553694515809)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045494145139940952)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(1045460786446515811)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045497249695946839)
,p_view_id=>wwv_flow_imp.id(1045487359687940935)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(1045460957513515813)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1045101183995273219)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(1042396721355108024)
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
'       DEPARTMENTCODE,',
'       EMPLOYEECODE,',
'       SALESENQUIRYNO,',
'       SALESENQUIRYDATE,',
'       DELIVERYDATE,',
'       CURRENCYUNITCODE,',
'       CURRENCYVALUE,',
'       WORKORDERTNO,',
'       PARTYCODE,',
'       AGENTCODE,',
'       QUOTATIONTNO,',
'       RATECONTRACTTNO,',
'       DELIVERYORDERTNO,',
'       INDENTTNO,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       SALESENQUIRYAMOUNT,',
'       SUBJECTTEXT,',
'       REFERENCETEXT,',
'       LETTERTEXT,',
'       TITLETEXT,',
'       REMARK,',
'       ITEMWISEFOOTER,',
'       CONSIGNEECODE,',
'       PARTYSALESENQUIRYNO,',
'       PARTYSALESENQUIRYDATE,',
'       VALIDITYUPTODATE,',
'       CREATIONTIME,',
'       CREATOR',
'  from SALESENQUIRY'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1058710811237401934)
,p_plug_name=>'General'
,p_static_id=>'general-2'
,p_parent_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:margin-top-sm:margin-bottom-sm'
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
 p_id=>wwv_flow_imp.id(1042396721355108024)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-Form--slimPadding:margin-top-none'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(623784666446279226)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(1045459856659515802)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--noPadding'
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
 p_id=>wwv_flow_imp.id(303694607513021603)
,p_plug_name=>'Revision'
,p_static_id=>'revision'
,p_parent_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno , salesorderno , salesorderdate from salesorder where RevisionSalesOrderTNo = :P706_TNO',
'union all',
'select tno , salesorderno , salesorderdate from salesorder where tno in (',
'select RevisionSalesOrderTNo from salesorder where tno = :P706_TNO',
'',
')'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P706_TNO'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(303695323644021610)
,p_name=>'SALESORDERDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALESORDERDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(303695428123021612)
,p_name=>'SALESORDERNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALESORDERNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Revision SO '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:171:P171_TNO,P171_CALLEDFROMPAGE,P171_CALLEDFROMTNO:&TNO.,171,&P171_TNO.'
,p_link_text=>'&SALESORDERNO.'
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
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(303695336884021611)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(303694825141021606)
,p_internal_uid=>195413291340639299
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(303869857149890863)
,p_interactive_grid_id=>wwv_flow_imp.id(303694825141021606)
,p_static_id=>'171219'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(303870091019890863)
,p_report_id=>wwv_flow_imp.id(303869857149890863)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(303899492127396349)
,p_view_id=>wwv_flow_imp.id(303870091019890863)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(303695323644021610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(303901821295467895)
,p_view_id=>wwv_flow_imp.id(303870091019890863)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(303695336884021611)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(303902652705467898)
,p_view_id=>wwv_flow_imp.id(303870091019890863)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(303695428123021612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1049606345658423904)
,p_plug_name=>'Special Note'
,p_static_id=>'special-note'
,p_region_name=>'SpeialNote'
,p_parent_plug_id=>wwv_flow_imp.id(1042396721355108024)
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
'       FOOTERNOTE',
'  from SALESENQUIRYFN',
'  where tno = :P706_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P706_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Special Note'
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
 p_id=>wwv_flow_imp.id(1049607012242423910)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1049607103600423911)
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
 p_id=>wwv_flow_imp.id(1049606791375423908)
,p_name=>'FOOTERNOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERNOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Note'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(1049606831336423909)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1049606636395423907)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(1049606604427423906)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P706_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(1049606485518423905)
,p_internal_uid=>941324951718041598
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(1050287073636132713)
,p_interactive_grid_id=>wwv_flow_imp.id(1049606485518423905)
,p_static_id=>'1539537'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(1050287247113132718)
,p_report_id=>wwv_flow_imp.id(1050287073636132713)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1050287758769132721)
,p_view_id=>wwv_flow_imp.id(1050287247113132718)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(1049606604427423906)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1050288651342132724)
,p_view_id=>wwv_flow_imp.id(1050287247113132718)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(1049606636395423907)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1050289536268132727)
,p_view_id=>wwv_flow_imp.id(1050287247113132718)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(1049606791375423908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1050290433099132729)
,p_view_id=>wwv_flow_imp.id(1050287247113132718)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(1049606831336423909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1050291288449132731)
,p_view_id=>wwv_flow_imp.id(1050287247113132718)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(1049607012242423910)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(727662080020472794)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_parent_plug_id=>wwv_flow_imp.id(727659172888472765)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1045334671049315140)
,p_plug_name=>'Terms and Conditions'
,p_static_id=>'terms-and-conditions'
,p_region_name=>'TAC'
,p_parent_plug_id=>wwv_flow_imp.id(1042396721355108024)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITION',
'  from SALESENQUIRYTAC',
'  where tno = :P706_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P706_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Terms and Conditions'
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
 p_id=>wwv_flow_imp.id(1045335368771315147)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045459447844515798)
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
 p_id=>wwv_flow_imp.id(1045335249312315146)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045334932373315143)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
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
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045335183784315145)
,p_name=>'TERMSANDCONDITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.termsandcondition a , b.termsandcondition b  from TERMSANDCONDITIONHEAD A , TERMSANDCONDITIONHEADDETAIL B',
'where a.tno = b.tno    ',
'and a.termsandconditionheadcode = :TERMSANDCONDITIONHEADCODE',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_items_to_submit=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1045335076493315144)
,p_name=>'TERMSANDCONDITIONHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITIONHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
,p_lov_source=>'select TERMSANDCONDITIONHEADNAME , TERMSANDCONDITIONHEADCODE from TERMSANDCONDITIONHEAD'
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
 p_id=>wwv_flow_imp.id(1045334830688315142)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P706_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(1045334778877315141)
,p_internal_uid=>937053245076932834
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(1045454083164499497)
,p_interactive_grid_id=>wwv_flow_imp.id(1045334778877315141)
,p_static_id=>'1491207'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(1045454265494499497)
,p_report_id=>wwv_flow_imp.id(1045454083164499497)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045454740545499499)
,p_view_id=>wwv_flow_imp.id(1045454265494499497)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(1045334830688315142)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045455672339499501)
,p_view_id=>wwv_flow_imp.id(1045454265494499497)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(1045334932373315143)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045456558442499505)
,p_view_id=>wwv_flow_imp.id(1045454265494499497)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(1045335076493315144)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045457441650499507)
,p_view_id=>wwv_flow_imp.id(1045454265494499497)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(1045335183784315145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045458428378499509)
,p_view_id=>wwv_flow_imp.id(1045454265494499497)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(1045335249312315146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1045465441712516048)
,p_view_id=>wwv_flow_imp.id(1045454265494499497)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(1045335368771315147)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1058710671247401933)
,p_plug_name=>'Texts'
,p_static_id=>'texts'
,p_parent_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:margin-top-sm:margin-bottom-sm'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168526057811306397)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
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
 p_id=>wwv_flow_imp.id(168517648997306392)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1635232487917736693)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P706_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168523623347306396)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1045459856659515802)
,p_button_name=>'Back'
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
 p_id=>wwv_flow_imp.id(168528514133306399)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
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
 p_id=>wwv_flow_imp.id(168454665275306350)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(320709233588832191)
,p_button_name=>'close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Back'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168529634355306400)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168486348523306372)
,p_button_sequence=>690
,p_button_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_button_name=>'CreateIndentAndEnquiry'
,p_static_id=>'createindentandenquiry'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Indent & Enquiry'
,p_button_redirect_url=>'f?p=&APP_ID.:275:&SESSION.::&DEBUG.:275::'
,p_button_condition=>'select 1 from SalesEnquiry where tno = :P706_TNO;'
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168528855108306399)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
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
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168506645983306385)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_button_name=>'DnLoad'
,p_static_id=>'dnload'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'DnLoad'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO,P1063_MODULESNO:&P706_TNO.,&P706_MODULESNO_1.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168526842542306399)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168527328829306399)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168526497487306399)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
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
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168507055409306385)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_button_name=>'Preview'
,p_static_id=>'preview'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Preview'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168528073170306399)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168529248467306399)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168507465852306386)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_button_name=>'SendE-MailToParty'
,p_static_id=>'sende-mailtoparty'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send E-mail To Party'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168527683792306399)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(1191210709198112479)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P706_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P706_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168506323510306385)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'UpLoad'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P706_TNO.'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(168610441542306435)
,p_branch_name=>'Go To Page 701'
,p_branch_action=>'f?p=&APP_ID.:701:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(168528855108306399)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045269414941273419)
,p_name=>'P706_AGENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Agent'
,p_source=>'AGENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.PartyName as AgentName,',
'a.PartyCode as AgentCode',
'from Party a',
'where a.PartyTypeCode = ''AGENT''',
'and GetDocumentStatusCode(''PARTY'', A.TNO) = ''ACTIVE''',
'order by 1'))
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
 p_id=>wwv_flow_imp.id(572314618669579095)
,p_name=>'P706_ALLOWEDBACK'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(572315008570582957)
,p_name=>'P706_ALLOWEDFORWARD'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049845873241424183)
,p_name=>'P706_ATTRIBUTECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_source=>'ATTRIBUTECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049846008512424184)
,p_name=>'P706_ATTRIBUTEVALUE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_source=>'ATTRIBUTEVALUE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(329257790656007416)
,p_name=>'P706_BALANCEQTY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(727659172888472765)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330960376593235918)
,p_name=>'P706_BALANCEQTY_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(727659172888472765)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1645230062138424068)
,p_name=>'P706_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1586611716922155676)
,p_name=>'P706_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_item_default=>'701'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(566116078340201068)
,p_name=>'P706_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045168840524273348)
,p_name=>'P706_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(728893595075430139)
,p_name=>'P706_CONSIGNEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Consignee'
,p_source=>'CONSIGNEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode from party',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''CUSTOMER'',''AGENT'')',
'and :P706_DOCTYPECODE = ''SALE''',
'union all   ',
'select partyname , partycode from party',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''SUPPLIER'',''AGENT'')',
'and :P706_DOCTYPECODE = ''PURCHASERETURN'''))
,p_lov_cascade_parent_items=>'P706_DOCTYPECODE'
,p_ajax_items_to_submit=>'P706_DOCTYPECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(1045188424106273357)
,p_name=>'P706_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select to_char(sysdate,''DD-MM-YYYY HH24:MI:SS'') from dual',
''))
,p_item_default_type=>'SQL_QUERY'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045181178175273354)
,p_name=>'P706_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045274276056273425)
,p_name=>'P706_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1058710908769401935)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'1'
,p_prompt=>'Currency Unit'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select CURRENCYUNITNAME , CURRENCYUNITCODE from currencyunit'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>32
,p_cMaxlength=>30
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
 p_id=>wwv_flow_imp.id(1045274591827273425)
,p_name=>'P706_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1058710908769401935)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Value'
,p_source=>'CURRENCYVALUE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045240248649273402)
,p_name=>'P706_DELIVERYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Delivery Date'
,p_source=>'DELIVERYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>6
,p_field_template=>2526760615038828570
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
 p_id=>wwv_flow_imp.id(283348249035742246)
,p_name=>'P706_DELIVERYORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'DELIVERYORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045170454973273348)
,p_name=>'P706_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045680648036516077)
,p_name=>'P706_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1045459856659515802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045680760465516078)
,p_name=>'P706_DFTOTALAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1045459856659515802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045238328004273399)
,p_name=>'P706_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
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
'    and c.CompanyCode = :global_CompanyCode',
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
 p_id=>wwv_flow_imp.id(1045258842423273411)
,p_name=>'P706_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Under Signed'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select employeename , employeecode from employee'
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
 p_id=>wwv_flow_imp.id(320775538691832294)
,p_name=>'P706_ENQUIRYNO'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_prompt=>'Purchase Enquiry No'
,p_source_type=>'ALWAYS_NULL'
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
 p_id=>wwv_flow_imp.id(320743750882832269)
,p_name=>'P706_ENQUIRYTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'INDENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049846248071424187)
,p_name=>'P706_FILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_prompt=>'S.O. Signed Copy Attached'
,p_source=>'FILENAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>3
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
 p_id=>wwv_flow_imp.id(1045169180325273348)
,p_name=>'P706_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1586611630443155675)
,p_name=>'P706_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P706_TNO is null then',
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
 p_id=>wwv_flow_imp.id(1045684992178516082)
,p_name=>'P706_FVALUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(623784666446279226)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(575963707596765008)
,p_name=>'P706_HSNCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(727659172888472765)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(320775415860832293)
,p_name=>'P706_INDENTNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Indent No'
,p_source=>'INDENTTNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>65
,p_tag_attributes=>'readonly=true'
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(283348425849742247)
,p_name=>'P706_INDENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'INDENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045178026038273353)
,p_name=>'P706_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'YES'
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045232702724273392)
,p_name=>'P706_LETTERTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(1058710671247401933)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Letter Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P706_LETTERTEXT."><span class="fa fa-search"></span></a>'
,p_source=>'LETTERTEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_colspan=>12
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
 p_id=>wwv_flow_imp.id(1045237938395273399)
,p_name=>'P706_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(621649405776006777)
,p_name=>'P706_LOCATIONCODE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'P706_LOCATIONCODE'
,p_item_default_type=>'ITEM'
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
'	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID',
''))
,p_cSize=>32
,p_cMaxlength=>40
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
 p_id=>wwv_flow_imp.id(1050582976041603544)
,p_name=>'P706_MAILSTATUS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_prompt=>'Mail Sent Status'
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
 p_id=>wwv_flow_imp.id(1049845544765424180)
,p_name=>'P706_MODULECODE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_default=>'GetModuleCodeForPageNo(:APP_PAGE_ID)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1586607913126155638)
,p_name=>'P706_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049845492577424179)
,p_name=>'P706_MODULESN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_source=>'MODULESN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049845358451424178)
,p_name=>'P706_MODULESNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_default=>'select globaltno.nextval from dual;'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049845261940424177)
,p_name=>'P706_MODULETNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_default=>'P706_TNO'
,p_item_default_type=>'ITEM'
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1050582630618603541)
,p_name=>'P706_OFFICEEMAIL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select officeemail from party',
'where partycode = :P706_PARTYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Party E-mail ID'
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
 p_id=>wwv_flow_imp.id(1586016134021884372)
,p_name=>'P706_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045241890482273403)
,p_name=>'P706_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P292_PARTY1'
,p_lov_cascade_parent_items=>'P706_DOCTYPECODE'
,p_ajax_items_to_submit=>'P706_DOCTYPECODE'
,p_ajax_optimize_refresh=>'N'
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
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(320791024225832307)
,p_name=>'P706_PARTYFORENQUIRY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(320709233588832191)
,p_prompt=>'Party For Enquiry'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname,partycode from party where partytypecode=''SUPPLIER''',
'and getdocumentstatuscode(''PARTY'',TNO)=''ACTIVE'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(283380184026742273)
,p_name=>'P706_PARTYSALESENQUIRYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Party Sales Enquiry Date'
,p_source=>'PARTYSALESENQUIRYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(283380104678742272)
,p_name=>'P706_PARTYSALESENQUIRYNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Party Sales Enquiry No'
,p_source=>'PARTYSALESENQUIRYNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(1560664651886530836)
,p_name=>'P706_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(283348077509742244)
,p_name=>'P706_QUOTATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'QUOTATIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(283348204037742245)
,p_name=>'P706_RATECONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'RATECONTRACTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1045232242420273392)
,p_name=>'P706_REFERENCETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1058710671247401933)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Reference Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P706_REFERENCETEXT."><span class="fa fa-search"></span></a>'
,p_source=>'REFERENCETEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(1045267773230273418)
,p_name=>'P706_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(1049846512696424189)
,p_name=>'P706_REMARK_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_source=>'REMARK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(283344223624742242)
,p_name=>'P706_SALESENQUIRYAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(727662080020472794)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Sales Enquiry Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SALESENQUIRYAMOUNT'
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
 p_id=>wwv_flow_imp.id(283379432749742265)
,p_name=>'P706_SALESENQUIRYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Sales Enquiry Date'
,p_source=>'SALESENQUIRYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(283379329729742264)
,p_name=>'P706_SALESENQUIRYNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Sales Enquiry No'
,p_source=>'SALESENQUIRYNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(727701471662472880)
,p_name=>'P706_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(727659172888472765)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1050594422288603607)
,p_name=>'P706_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P706_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1560664488241530835)
,p_name=>'P706_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1558593752359181820)
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
 p_id=>wwv_flow_imp.id(1045231894347273392)
,p_name=>'P706_SUBJECTTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1058710671247401933)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Subject Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P706_SUBJECTTEXT.)"><span class="fa fa-search"></span></a>'
,p_source=>'SUBJECTTEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(727704352001472862)
,p_name=>'P706_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(727662080020472794)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
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
 p_id=>wwv_flow_imp.id(727704496109472863)
,p_name=>'P706_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(727662080020472794)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
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
 p_id=>wwv_flow_imp.id(1045233053651273392)
,p_name=>'P706_TITLETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1058710671247401933)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Title Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P706_TITLETEXT."><span class="fa fa-search"></span></a>'
,p_source=>'TITLETEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_colspan=>12
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
 p_id=>wwv_flow_imp.id(1045168397380273345)
,p_name=>'P706_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'tno'
,p_source=>'TNO'
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
 p_id=>wwv_flow_imp.id(1049845183241424176)
,p_name=>'P706_TNO_2'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_item_source_plug_id=>wwv_flow_imp.id(1049609076160423931)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(283349276196742256)
,p_name=>'P706_TRANSACTIONTYPECODE'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(283380304818742274)
,p_name=>'P706_VALIDITYUPTODATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(1058710811237401934)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_prompt=>'Validity Upto Date'
,p_source=>'VALIDITYUPTODATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(283347982318742243)
,p_name=>'P706_WORKORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_item_source_plug_id=>wwv_flow_imp.id(1045101183995273219)
,p_source=>'WORKORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168557011959306413)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>200
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_triggering_element=>'LEGENDSCODE,FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168557463421306413)
,p_event_id=>wwv_flow_imp.id(168557011959306413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,LEGENDSCODE,FOOTERPERCENT,P706_DFAMOUNT',
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
    '    tTotalDetailAmount := :P706_DFAMOUNT;',
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
 p_id=>wwv_flow_imp.id(168557969576306413)
,p_event_id=>wwv_flow_imp.id(168557011959306413)
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
 p_id=>wwv_flow_imp.id(168560193252306414)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>220
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168560728902306414)
,p_event_id=>wwv_flow_imp.id(168560193252306414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P706_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168562893429306416)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>250
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168563392997306416)
,p_event_id=>wwv_flow_imp.id(168562893429306416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P706_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168559261687306414)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>210
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168559822579306414)
,p_event_id=>wwv_flow_imp.id(168559261687306414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P706_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168563797456306416)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168523623347306396)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168564255483306416)
,p_event_id=>wwv_flow_imp.id(168563797456306416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    '',
    'model.forEach(function(igrow,index, id) {',
    '',
    'meta = model.getRecordMetadata(id);',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '',
    '    if (!isNaN(n_amt) && !meta.agg) {',
    '        n_totamt += n_amt;',
    '    }',
    '',
    '});',
    'apex.item("P706_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168605849180306433)
,p_name=>'close enquiry party'
,p_static_id=>'close-enquiry-party'
,p_event_sequence=>940
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168454665275306350)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168606376451306433)
,p_event_id=>wwv_flow_imp.id(168605849180306433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(320709233588832191)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168603484688306432)
,p_name=>'create Indent and Enquiry'
,p_static_id=>'create-indent-and-enquiry'
,p_event_sequence=>930
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168486348523306372)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168605001106306432)
,p_event_id=>wwv_flow_imp.id(168603484688306432)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P706_TNO,P706_PARTYFORENQUIRY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '--raise_application_error(-20002,''called'');',
    '    if :P706_PARTYFORENQUIRY is not null then',
    '--raise_application_error(-20002,''called'');',
    '        createindentfromSalesEnquiry(:P706_TNO);',
    '',
    '        createEnquiryfromSalesEnquiry(:P706_TNO,:P706_PARTYFORENQUIRY);',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168605496190306432)
,p_event_id=>wwv_flow_imp.id(168603484688306432)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P706_INDENTTNO,P706_INDENTNO,P706_ENQUIRYTNO,P706_ENQUIRYNO',
  'items_to_submit', 'P706_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    for vInd in (',
    '        select tno,indentno from indent',
    '        where moduletno = :P706_TNO',
    '    ) loop',
    '        :P706_INDENTTNO := vInd.tno;',
    '        :P706_INDENTNO  := vInd.INDENTNO;',
    '    end loop;',
    '    for vEnq in (',
    '        select tno,EnquiryNo from Enquiry',
    '        where moduletno = :P706_TNO',
    '    ) loop',
    '        :P706_ENQUIRYTNO := vEnq.tno;',
    '        :P706_ENQUIRYNO  := vEnq.EnquiryNO;',
    '    end loop;',
    '',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168604490138306432)
,p_event_id=>wwv_flow_imp.id(168603484688306432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:openModal(''ENQUIRYPARTY'');')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168604017897306432)
,p_event_id=>wwv_flow_imp.id(168603484688306432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_PARTYFORENQUIRY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P275_PARTYFORENQUIRY',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168600419166306430)
,p_name=>'delete data'
,p_static_id=>'delete-data'
,p_event_sequence=>860
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168600841257306430)
,p_event_id=>wwv_flow_imp.id(168600419166306430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from SALESENQUIRYDETAIL a',
    '    where not exists (',
    '        select 1 from SALESENQUIRY  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from SALESENQUIRYDETAILFOOTER a',
    '    where not exists (',
    '        select 1 from SALESENQUIRY  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168546470268306408)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>58
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168528514133306399)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168547498758306408)
,p_event_id=>wwv_flow_imp.id(168546470268306408)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P706_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P706_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168546934827306408)
,p_event_id=>wwv_flow_imp.id(168546470268306408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PURCHASEORDERDETAIL a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168547979786306408)
,p_event_id=>wwv_flow_imp.id(168546470268306408)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P706_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P706_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(168539882365306405)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168540858678306405)
,p_event_id=>wwv_flow_imp.id(168539882365306405)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168528855108306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168541427810306407)
,p_event_id=>wwv_flow_imp.id(168539882365306405)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168528855108306399)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P706_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168540350576306405)
,p_event_id=>wwv_flow_imp.id(168539882365306405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168528855108306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168545076238306408)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168546106670306408)
,p_event_id=>wwv_flow_imp.id(168545076238306408)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168528073170306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168545594381306408)
,p_event_id=>wwv_flow_imp.id(168545076238306408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168528073170306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168541782083306407)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168542242290306407)
,p_event_id=>wwv_flow_imp.id(168541782083306407)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168529248467306399)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P706_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168543277940306407)
,p_event_id=>wwv_flow_imp.id(168541782083306407)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168529248467306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from loadingadvice aa where aa.salesordertno = :P706_TNO',
'union all',
'select 1 from despatchadvice aa where aa.referencetno = :P706_TNO',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168542798086306407)
,p_event_id=>wwv_flow_imp.id(168541782083306407)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168529248467306399)
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
 p_id=>wwv_flow_imp.id(168543657632306407)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168544666895306408)
,p_event_id=>wwv_flow_imp.id(168543657632306407)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168527683792306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168544143251306407)
,p_event_id=>wwv_flow_imp.id(168543657632306407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168527683792306399)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168552216793306411)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168527683792306399)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168555721826306413)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168527683792306399)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168555191295306411)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168527683792306399)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P706_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168553157510306411)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P706_TNO,P706_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P706_TNO,:P706_STATUS);',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168553711844306411)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P706_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168554204275306411)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168527683792306399)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168554701120306411)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1191210709198112479)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168552700973306411)
,p_event_id=>wwv_flow_imp.id(168552216793306411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168537944156306405)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168538449373306405)
,p_event_id=>wwv_flow_imp.id(168537944156306405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168526497487306399)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168538956520306405)
,p_event_id=>wwv_flow_imp.id(168537944156306405)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168526842542306399)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168539469596306405)
,p_event_id=>wwv_flow_imp.id(168537944156306405)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(168527328829306399)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168602043815306432)
,p_name=>'Enable Quantity'
,p_static_id=>'enable-quantity'
,p_event_sequence=>900
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_ISOPENSPEC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168603074263306432)
,p_event_id=>wwv_flow_imp.id(168602043815306432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_QUANTITY'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ISOPENSPEC'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168602616643306432)
,p_event_id=>wwv_flow_imp.id(168602043815306432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_QUANTITY'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ISOPENSPEC'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168550273003306410)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168526842542306399)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168551311107306410)
,p_event_id=>wwv_flow_imp.id(168550273003306410)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P706_TNO,P706_COMPANYCODE',
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
 p_id=>wwv_flow_imp.id(168551799964306410)
,p_event_id=>wwv_flow_imp.id(168550273003306410)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168550805334306410)
,p_event_id=>wwv_flow_imp.id(168550273003306410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168573833755306419)
,p_name=>'Focus on reference text'
,p_static_id=>'focus-on-reference-text'
,p_event_sequence=>490
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_SUBJECTTEXT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168574281171306419)
,p_event_id=>wwv_flow_imp.id(168573833755306419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '//$("#P706_REFERENCETEXT").focus();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168571942182306419)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168528073170306399)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168572513927306419)
,p_event_id=>wwv_flow_imp.id(168571942182306419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168561057890306414)
,p_name=>'Get DFA_AMT'
,p_static_id=>'get-dfa-amt'
,p_event_sequence=>230
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168561630558306414)
,p_event_id=>wwv_flow_imp.id(168561057890306414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget      = apex.region(''Detail'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model = grid.getSelectedRecords(); ',
    'var jsonData     = [];',
    '',
    'model.forEach(function(r) {',
    '    var record = r;   ',
    '    jsonData.push(record);',
    '})',
    '',
    'let value = null;',
    'value = jsonData[0][14];',
    '',
    '$s(''P706_DFAMOUNT'',value);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168584898927306424)
,p_name=>'Get Fous'
,p_static_id=>'get-fous'
,p_event_sequence=>650
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_SALESENQUIRYDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168585353294306424)
,p_event_id=>wwv_flow_imp.id(168584898927306424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168565631780306416)
,p_name=>'Hide'
,p_static_id=>'hide'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168523623347306396)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168566044108306416)
,p_event_id=>wwv_flow_imp.id(168565631780306416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1045459856659515802)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168586638064306425)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>670
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168587220177306425)
,p_event_id=>wwv_flow_imp.id(168586638064306425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168567421270306417)
,p_name=>'Initialize SNO Sequence1'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>330
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1049606345658423904)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168567875119306417)
,p_event_id=>wwv_flow_imp.id(168567421270306417)
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
 p_id=>wwv_flow_imp.id(168581676582306422)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>620
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168582197270306424)
,p_event_id=>wwv_flow_imp.id(168581676582306422)
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
 p_id=>wwv_flow_imp.id(168592997194306427)
,p_name=>'move next'
,p_static_id=>'move-next'
,p_event_sequence=>750
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'REMARK'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ITEMCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168593524054306427)
,p_event_id=>wwv_flow_imp.id(168592997194306427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();',
    '',
    'apex.region( "TAC" ).widget().interactiveGrid( "getActions" ).set("edit", true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168572933334306419)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>480
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_TITLETEXT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168573432971306419)
,p_event_id=>wwv_flow_imp.id(168572933334306419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168593882679306427)
,p_name=>'move tab2'
,p_static_id=>'move-tab-2'
,p_event_sequence=>760
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(1045334671049315140)
,p_triggering_element=>'TERMSANDCONDITION'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'TERMSANDCONDITIONHEADCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168594372214306428)
,p_event_id=>wwv_flow_imp.id(168593882679306427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_TAC"].moveNext();',
    '',
    'apex.region( "SpecialNote" ).widget().interactiveGrid( "getActions" ).set("edit", true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168589364474306425)
,p_name=>'move to net tab'
,p_static_id=>'move-to-net-tab'
,p_event_sequence=>700
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'DESCRIPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168589871194306425)
,p_event_id=>wwv_flow_imp.id(168589364474306425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//alert("Value " + $(''#ITEMCODE'').val());',
    'if ( $(''#ITEMCODE'').val() === '''' ){',
    '//alert("null");',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();',
    '    ',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168590292638306427)
,p_name=>'New_1'
,p_static_id=>'new'
,p_event_sequence=>710
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_TNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168590782297306427)
,p_event_id=>wwv_flow_imp.id(168590292638306427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_LOCATIONCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168591152345306427)
,p_name=>'New_2'
,p_static_id=>'new-2'
,p_event_sequence=>720
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1558593752359181820)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168591721321306427)
,p_event_id=>wwv_flow_imp.id(168591152345306427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_LOCATIONCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168607655794306433)
,p_name=>'Open Enquiry'
,p_static_id=>'open-enquiry'
,p_event_sequence=>960
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_ENQUIRYNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168608165396306433)
,p_event_id=>wwv_flow_imp.id(168607655794306433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P706_ENQUIRYTNO'').getValue();',
    'var y = ''292'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P706_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:311:#SESSION#::NO:RP,311:P311_TNO,P311_CALLEDFROMPAGE,P311_CALLEDFROMTNO,P311_FORMSTATUS:#P311_TNO#,#P311_CALLEDFROMPAGE#,#P311_CALLEDFROMTNO#,#P311_FORMSTATUS#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P311_TNO#", x);',
    'url = url.replace("#P311_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P311_CALLEDFROMTNO#", x1);',
    'url = url.replace("#P311_FORMSTATUS#", z);',
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
 p_id=>wwv_flow_imp.id(168606743819306433)
,p_name=>'Open Indent '
,p_static_id=>'open-indent'
,p_event_sequence=>950
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_INDENTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168607246866306433)
,p_event_id=>wwv_flow_imp.id(168606743819306433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P706_INDENTTNO'').getValue();',
    'var y = ''292'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P706_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:108:#SESSION#::NO:RP,108:P108_TNO,P108_CALLEDFROMPAGE,P108_CALLEDFROMTNO,P108_FORMSTATUS:#P108_TNO#,#P108_CALLEDFROMPAGE#,#P108_CALLEDFROMTNO#,#P108_FORMSTATUS#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P108_TNO#", x);',
    'url = url.replace("#P108_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P108_CALLEDFROMTNO#", x1);',
    'url = url.replace("#P108_FORMSTATUS#", z);',
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
 p_id=>wwv_flow_imp.id(168568301286306417)
,p_name=>'P.O. Signed Copy Attached'
,p_static_id=>'p-o-signed-copy-attached'
,p_event_sequence=>350
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168506323510306385)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168568791356306417)
,p_event_id=>wwv_flow_imp.id(168568301286306417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_FILENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ''YES'' from ',
    'ModuleAttachment',
    'where moduletno = :P706_TNO',
    'and modulesno = :P706_MODULESNO_1')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168548417404306410)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168526497487306399)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168549368423306410)
,p_event_id=>wwv_flow_imp.id(168548417404306410)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P706_TNO,P706_COMPANYCODE,P706_STATUS',
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
    '             if :P706_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P706_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168549924611306410)
,p_event_id=>wwv_flow_imp.id(168548417404306410)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168548857117306410)
,p_event_id=>wwv_flow_imp.id(168548417404306410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168566484940306416)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168517648997306392)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168566987602306417)
,p_event_id=>wwv_flow_imp.id(168566484940306416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1635232487917736693)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168596613843306428)
,p_name=>'set amounts'
,p_static_id=>'set-amounts'
,p_event_sequence=>820
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'QUANTITY1,QUANTITY2,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168597572742306428)
,p_event_id=>wwv_flow_imp.id(168596613843306428)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,FOOTERAMOUNT',
  'items_to_submit', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,RATEMEASURINGUNITCODE,P706_PARTYCODE,P706_FORMSTATUS,P706_HSNCODE,P706_TRANSACTIONTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    tmp    number;',
    '    phsn varchar(30);',
    '-----    set amounts',
    ' ',
    'begin',
    '    :Quantity1 := round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '    select max(MULTIPLYINGFACTOR) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;      ',
    '    :quantity2 := round(:QUANTITY1*mfactor,3);',
    '    :quantity2 := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '',
    '    select MEASURINGUNITCODE1 into unit1 from item where itemcode = :ITEMCODE;',
    '    select MEASURINGUNITCODE2 into unit2 from item where itemcode = :ITEMCODE;',
    '    ',
    '    if :RATEMEASURINGUNITCODE = unit1 then',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    else ',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY2,0);',
    '    end if;',
    '',
    '    --:P706_DFAMOUNT    := :Amount ;',
    '    --:P706_DFQUANTITY1 := :Quantity1;',
    '    ',
    '    select trim(hsncode) INTO :P706_HSNCODE from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   ---- INSERT INTO FOOTER DETAIL',
    '    ',
    '    if nvl(:Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '      --RAISE_APPLICATION_ERROR(-20000,''party ''||:P706_PARTYCODE||''tr type ''||:P706_TRANSACTIONTYPECODE||'' hsn ''||:P706_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P706_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '           DELETE FROM SalesEnquiryDetailFooter WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    '            for vTaxRule',
    '            				in (',
    '            					select',
    '            						rownum as slno,',
    '            						b.TNo,',
    '            						b.SNO,',
    '            						a.LegendsCode,',
    '            						c.FooterHeadCode,',
    '            						c.FooterHeadName,',
    '            						b.TaxRate as FooterPercent,',
    '                                    (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '            					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '            					where a.TNO = b.TNo',
    '            						and a.SNO = b.SNo',
    '            						and b.FooterHeadCode = c.FooterHeadCode',
    '            						and a.TNO = d.TNo',
    '                                    and d.tno = e.tno',
    '                                    and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                                    and f.PartyCode = :P706_PARTYCODE',
    '                                    And d.transactiontypecode = :P706_TRANSACTIONTYPECODE',
    '                                    and e.HSNCODE = :P706_HSNCODE',
    '                                    ',
    '            					--Enquiry by b.SNo',
    '            				)',
    '            			loop',
    '           -- raise_application_error(-20000,phsn);	',
    '           --if nvl(:rate,0) > 0 then',
    '           --RAISE_APPLICATION_ERROR(-20000,''party ''||:P706_PARTYCODE||''tr type ''||:P706_TRANSACTIONTYPECODE||'' hsn ''||:P706_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P706_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRul'
||'e.FooterValue);',
    '           --end if;',
    '            			    Insert into SalesEnquiryDetailFooter',
    '                            (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '            				values',
    '                            (:TNO,:SNO,globaltno.nextval,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '            			',
    '            			end loop; -- for vTaxRule',
    '                        commit;',
    '        end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from SalesEnquiryDetailFooter',
    '   where tno = :TNO',
    '     and sno = :SNO;',
    '   ',
    '   :Totalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '',
    'end;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168598609392306430)
,p_event_id=>wwv_flow_imp.id(168596613843306428)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168597109775306428)
,p_event_id=>wwv_flow_imp.id(168596613843306428)
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
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168598069609306430)
,p_event_id=>wwv_flow_imp.id(168596613843306428)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '   ',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P706_SUMOFAMOUNT'',amount_total);',
    '$s(''P706_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P706_SALESENQUIRYAMOUNT'',totalamount_total);',
    '',
    '},400',
    ');',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168601251070306430)
,p_name=>'set balance_1'
,p_static_id=>'set-balance'
,p_event_sequence=>880
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168601784039306432)
,p_event_id=>wwv_flow_imp.id(168601251070306430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_BALANCEQTY_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P706_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(nvl(quantity1,0)) from despatchadvice a , despatchadvicedetail b ',
    'where a.tno=b.tno',
    'and a.REFERENCETNO = :P706_TNO',
    'And b.itemcode = :itemcode',
    '   And b.itemspecificationcode = :itemspecificationcode')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168588514580306425)
,p_name=>'set consignee'
,p_static_id=>'set-consignee'
,p_event_sequence=>690
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168589010768306425)
,p_event_id=>wwv_flow_imp.id(168588514580306425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_CONSIGNEECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P706_PARTYCODE',
  'plsql_expression', ':P706_PARTYCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168585738551306424)
,p_name=>'Set Credit Days'
,p_static_id=>'set-credit-days'
,p_event_sequence=>660
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168586331951306425)
,p_event_id=>wwv_flow_imp.id(168585738551306424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_CREDITDAYS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P706_PARTYCODE',
  'sql_query', 'select CREDITDAYS from party where partycode = :P706_PARTYCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168569146083306417)
,p_name=>'Set Currency Value'
,p_static_id=>'set-currency-value'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168569655011306417)
,p_event_id=>wwv_flow_imp.id(168569146083306417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P706_CURRENCYUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CURRENCYVALUE from currencyunit',
    'where CURRENCYUNITCODE = :P706_CURRENCYUNITCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168594830039306428)
,p_name=>'set decimal qty2'
,p_static_id=>'set-decimal-qty'
,p_event_sequence=>780
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168595323887306428)
,p_event_id=>wwv_flow_imp.id(168594830039306428)
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
 p_id=>wwv_flow_imp.id(168578327324306421)
,p_name=>'Set DFAMOUNT'
,p_static_id=>'set-dfamount'
,p_event_sequence=>570
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168579801606306422)
,p_event_id=>wwv_flow_imp.id(168578327324306421)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'TNO,SNO,P706_HSNCODE,P706_DFAMOUNT,P706_PARTYCODE,ITEMCODE,ITEMSPECIFICATIONCODE,P706_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'TMP NUMBER;',
    'begin',
    ' select count(*) into tmp from salesenquirydetailfooter',
    ' WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    ' if nvl(tmp,0) = 0 and :P706_FORMSTATUS = ''NEWRECORD'' then',
    '',
    ' --raise_application_error(-20000,''-''||:P706_HSNCODE||''-''||''HSN'');',
    '',
    '        DELETE FROM salesenquiryDetailFooter WHERE TNO = :TNO AND SNO = :SNO;',
    '        commit;',
    '        for vTaxRule',
    '    				in (',
    '    					select',
    '    						rownum as slno,',
    '    						b.TNo,',
    '    						b.SNO,',
    '    						a.LegendsCode,',
    '    						c.FooterHeadCode,',
    '    						c.FooterHeadName,',
    '    						b.TaxRate as FooterPercent,',
    '                            (:P706_DFAMOUNT * B.TAXrATE) /100 AS FooterValue',
    '    					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '    					where a.TNO = b.TNo',
    '    						and a.SNO = b.SNo',
    '    						and b.FooterHeadCode = c.FooterHeadCode',
    '    						and a.TNO = d.TNo',
    '                            and d.tno = e.tno',
    '                            and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                            and f.PartyCode = :P706_PARTYCODE',
    '                            And d.transactiontypecode = :P706_TRANSACTIONTYPECODE',
    '                            and e.HSNCODE =  :P706_HSNCODE',
    '    					order by b.SNo',
    '    				)',
    '    			loop',
    '           -- RAISE_APPLICATION_ERROR(-20000,''tAXRULE'');',
    '                      -- ',
    '                      ----',
    '    			    Insert into salesenquiryDetailFooter(tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '    				values(:TNO,:SNO,globaltno.nextval,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '    				',
    '    			end loop; -- for vTaxRule',
    '                COMMIT;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168580292997306422)
,p_event_id=>wwv_flow_imp.id(168578327324306421)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168578794338306422)
,p_event_id=>wwv_flow_imp.id(168578327324306421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', 'select hsncode from itemspecification where itemspecificationcode = :itemspecificationcode;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168579304281306422)
,p_event_id=>wwv_flow_imp.id(168578327324306421)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_DFAMOUNT,P706_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,SNO',
  'sql_query', 'select :AMOUNT, :SNO from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168580782768306422)
,p_event_id=>wwv_flow_imp.id(168578327324306421)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT,TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO,AMOUNT',
  'sql_query', 'SELECT SUM(FOOTERVALUE),SUM(FOOTERVALUE) + NVL(:AMOUNT,0) FROM SALESenquiryDETAILFOOTER WHERE TNO = :TNO AND SNO=:SNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168581251579306422)
,p_event_id=>wwv_flow_imp.id(168578327324306421)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-4'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_FVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO,AMOUNT',
  'sql_query', 'SELECT SUM(FOOTERVALUE) FROM SALESenquiryDETAILFOOTER WHERE TNO = :TNO AND SNO=:SNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168609452870306433)
,p_name=>'set enquiry no'
,p_static_id=>'set-enquiry-no'
,p_event_sequence=>980
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168609939662306435)
,p_event_id=>wwv_flow_imp.id(168609452870306433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_ENQUIRYTNO,P706_ENQUIRYNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P706_TNO',
  'sql_query', 'select tno,enquiryno from enquiry where moduletno = :P706_TNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168564718755306416)
,p_name=>'Set Footer Total'
,p_static_id=>'set-footer-total'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168523623347306396)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168565154873306416)
,p_event_id=>wwv_flow_imp.id(168564718755306416)
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
    '  var value1 = $v("P706_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value2 =  (parseFloat($v("P706_FVALUE"), 10)+ parseFloat($v("P706_DFAMOUNT"), 10)).toString(); // Replace with the new value you want to set',
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
 p_id=>wwv_flow_imp.id(168587620272306425)
,p_name=>'set hsn code'
,p_static_id=>'set-hsn-code'
,p_event_sequence=>680
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168588057395306425)
,p_event_id=>wwv_flow_imp.id(168587620272306425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', 'select hsncode from itemspecification where itemspecificationcode = :itemspecificationcode;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168608579736306433)
,p_name=>'set indent no'
,p_static_id=>'set-indent-no'
,p_event_sequence=>970
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168609126047306433)
,p_event_id=>wwv_flow_imp.id(168608579736306433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_INDENTTNO,P706_INDENTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P706_TNO',
  'sql_query', 'select tno,indentno from indent where moduletno = :P706_TNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168592130832306427)
,p_name=>'set location code'
,p_static_id=>'set-location-code'
,p_event_sequence=>740
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_LOCATIONCODE_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168592542428306427)
,p_event_id=>wwv_flow_imp.id(168592130832306427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_LOCATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P706_LOCATIONCODE_1',
  'plsql_expression', ':P706_LOCATIONCODE_1',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168575563506306421)
,p_name=>'Set Page item P706_SNO'
,p_static_id=>'set-page-item-p706-sno'
,p_event_sequence=>510
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168576052421306421)
,p_event_id=>wwv_flow_imp.id(168575563506306421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'sql_query', 'select :SNO from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168582627887306424)
,p_name=>'Set page item sno'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>630
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168583079436306424)
,p_event_id=>wwv_flow_imp.id(168582627887306424)
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
    'apex.item( "P706_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168583626555306424)
,p_event_id=>wwv_flow_imp.id(168582627887306424)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', 'select hsncode from itemspecification where itemspecificationcode = :itemspecificationcode;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168570057768306417)
,p_name=>'Set POAdvance Amount'
,p_static_id=>'set-poadvance-amount'
,p_event_sequence=>400
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_ISFULLADVANCE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168571067073306419)
,p_event_id=>wwv_flow_imp.id(168570057768306417)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#P706_POADVANCEAMOUNT").prop(''readonly'', true);',
    '')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ISFULLADVANCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168571593420306419)
,p_event_id=>wwv_flow_imp.id(168570057768306417)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#P706_POADVANCEAMOUNT").prop(''readonly'', false);',
    '')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ISFULLADVANCE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168570615790306419)
,p_event_id=>wwv_flow_imp.id(168570057768306417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_POADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select :P706_PURCHASEORDERAMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P706_ISFULLADVANCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168576484471306421)
,p_name=>'Set Quantity2_1'
,p_static_id=>'set-quantity'
,p_event_sequence=>530
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'QUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY2'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168576941792306421)
,p_event_id=>wwv_flow_imp.id(168576484471306421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,QUANTITY2',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return :QUANTITY2/mfactor;',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168556125118306413)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>190
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168556619065306413)
,p_event_id=>wwv_flow_imp.id(168556125118306413)
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
 p_id=>wwv_flow_imp.id(168599006340306430)
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_event_sequence=>830
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168600003359306430)
,p_event_id=>wwv_flow_imp.id(168599006340306430)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '   ',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P706_SUMOFAMOUNT'',amount_total);',
    '$s(''P706_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P706_SALESORDERAMOUNT'',totalamount_total);',
    '',
    '},400',
    ');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168599482516306430)
,p_event_id=>wwv_flow_imp.id(168599006340306430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'plsql_expression', ':AMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168595704879306428)
,p_name=>'set total'
,p_static_id=>'set-total'
,p_event_sequence=>800
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168596165532306428)
,p_event_id=>wwv_flow_imp.id(168595704879306428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,FOOTERAMOUNT',
  'plsql_expression', 'nvl(:amount,0)+nvl(:footeramount,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168574664182306419)
,p_name=>'Set Transaction'
,p_static_id=>'set-transaction'
,p_event_sequence=>500
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P706_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168575140195306421)
,p_event_id=>wwv_flow_imp.id(168574664182306419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P706_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P706_PARTYCODE,P706_LOCATIONCODE,P706_DOCTYPECODE,P706_COMPANYCODE,P706_SALESENQUIRYDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    'GetTransactionTypeCodeFor(:P706_PARTYCODE , :P706_LOCATIONCODE , :P706_DOCTYPECODE , :P706_COMPANYCODE , :P706_SALESENQUIRYDATE) as A   ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168577394750306421)
,p_name=>'Set Unit'
,p_static_id=>'set-unit'
,p_event_sequence=>550
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168577918127306421)
,p_event_id=>wwv_flow_imp.id(168577394750306421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT1,UNIT2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select GetMeasuringUnitNameFromItem(:itemcode) as unit1, GetMeasuringUnit2NameFromItem(:itemcode) as unit2,',
    'GetMeasuringUnitCodeFromItem(:itemcode) as rateunit from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168561965450306414)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>240
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168562446994306414)
,p_event_id=>wwv_flow_imp.id(168561965450306414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseInt(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P706_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168583980836306424)
,p_name=>'setRate'
,p_static_id=>'setrate'
,p_event_sequence=>640
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(727659172888472765)
,p_triggering_element=>'RATEINCLUSIVETAX'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168584521656306424)
,p_event_id=>wwv_flow_imp.id(168583980836306424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RATEINCLUSIVETAX',
  'plsql_expression', ':RATEINCLUSIVETAX',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168558364405306413)
,p_name=>'sset sno as from page item'
,p_static_id=>'sset-sno-as-from-page-item'
,p_event_sequence=>210
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168558900430306413)
,p_event_id=>wwv_flow_imp.id(168558364405306413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO,P706_SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select :p706_sno into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168534017626306402)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check revision'
,p_static_id=>'check-revision'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select tno into :P706_TNO from salesorder ',
'        where revisionsalesordertno = :P706_TNO',
'        and  revisionsalesordertno is not null;',
'',
'exception when others then',
'    null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>60252483825924095
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168536399476306403)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from salesenquirydetail where tno = :P706_TNO;',
'delete from salesenquirydetailfooter where tno = :P706_TNO;',
'delete from salesenquiryfooter where tno = :P706_TNO;',
'delete from salesenquirytac where tno = :P706_TNO;',
'delete from salesenquiryfn where tno = :P706_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(168528855108306399)
,p_internal_uid=>60254865675924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168534787031306403)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P706_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>60253253230924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168468229485306360)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(727659172888472765)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    if :ITEMCODE is not null then',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into salesenquirydetail (                 ',
'                    tno                    ,',
'                    sno                    ,',
'                    itemcode               ,',
'                    itemspecificationcode  ,',
'                    description            ,',
'                    quantity1              ,',
'                    quantity2              ,',
'                    ratemeasuringunitcode  ,',
'                    ',
'                  ',
'                    rate                   ,',
'                    amount                 ,',
'                    footeramount           ,',
'                    totalamount            ,',
'                    remark                 ,',
'                    lowertolerancepercent  ,',
'                    highertolerancepercent ',
'                     ',
'                    --taxrulecode            ',
'            )',
'            Values (',
'                :tno                    ,',
'                :sno                    ,',
'                :itemcode               ,',
'                :itemspecificationcode  ,',
'                :description            ,',
'                :quantity1              ,',
'                :quantity2              ,',
'                :ratemeasuringunitcode  ,',
'              ',
'             ',
'                :rate                   ,',
'                :amount                 ,',
'                :footeramount           ,',
'                :totalamount            ,',
'                :remark                 ,',
'                :lowertolerancepercent  ,',
'                :highertolerancepercent ',
'                   ',
'                  ',
'            );',
'        ',
'        when ''U'' then',
'            update salesenquirydetail Set',
'                    tno                     =		:tno                    ,',
'                    sno                     =		:sno                    ,',
'                    itemcode                =		:itemcode               ,',
'                    itemspecificationcode   =		:itemspecificationcode  ,',
'                    description             =		:description            ,',
'                    quantity1               =		:quantity1              ,',
'                    quantity2               =		:quantity2              ,',
'                    ratemeasuringunitcode   =		:ratemeasuringunitcode  ,',
'                ',
'                    rate                    =		:rate                   ,',
'                    amount                  =		:amount                 ,',
'                    footeramount            =		:footeramount           ,',
'                    totalamount             =		:totalamount            ,',
'                    remark                  =		:remark                 ,',
'                    lowertolerancepercent   =		:lowertolerancepercent  ,',
'                    highertolerancepercent  =		:highertolerancepercent ',
'                  ',
'            WHERE TNO = :P706_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From salesenquirydetail',
'            Where TNo = :P706_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'    end if;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60186695684924053
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168524727572306397)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1045459856659515802)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'FooterDetail - Save Interactive Grid Data'
,p_static_id=>'footerdetail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'N',
  'prevent_lost_updates', 'N',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60243193771924090
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168536032238306403)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P706_Tno is null then',
'        Select GlobalTno.NextVal into :P706_Tno From Dual;',
'     end if;',
'    ----',
'    if :P706_SALESENQUIRYNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P706_LocationCode,',
'					:P706_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P706_SALESENQUIRYDATE, ''DD-MM-RRRR'')',
'				);',
'        :P706_SALESENQUIRYNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P706_LocationCode,',
'                    :P706_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P706_SALESENQUIRYDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60254498437924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168535173214306403)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P706_TNO is null then',
'    :P706_TNO := GlobalTNo.nextval;',
'    :P706_FORMSTATUS := ''NEWRECORD'';',
'else',
'    ',
'    :P706_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'',
':P706_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P706_TNO), ''Status'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60253639413924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168535624413306403)
,p_process_sequence=>50
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
'       :P706_MODULEFLOW := ''YES'';',
'   else',
'       :P706_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P706_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P706_ONTHETABLE := ''YES'' ;',
'   else',
'       :P706_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60254090612924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168514021590306389)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1049609076160423931)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form E-Mail'
,p_static_id=>'initialize-form-e-mail'
,p_internal_uid=>60232487789924082
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168480197088306367)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1045101183995273219)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Sales Enquiry'
,p_static_id=>'initialize-form-sales-enquiry'
,p_internal_uid=>60198663287924060
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168537171094306403)
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
,p_internal_uid=>60255637293924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168480571517306367)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1045101183995273219)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Sales Enquiry'
,p_static_id=>'process-form-sales-enquiry'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60199037716924060
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168537592153306403)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveSalesEnquiryFooter'
,p_static_id=>'savesalesenquiryfooter'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update salesenquirydetail d',
'       set (footeramount,totalamount) = (',
'           select nvl(sum(f.footervalue),0),',
'                  nvl(d.amount,0) + nvl(sum(f.footervalue),0)',
'             from salesenquirydetailfooter f',
'            where f.tno=d.tno and f.sno=d.sno',
'       )',
'     where d.tno = :P706_TNO;',
'',
'    update salesenquiry h',
'       set (sumofamount,sumoffooteramount,salesenquiryamount) = (',
'           select nvl(sum(d.amount),0),nvl(sum(d.footeramount),0),nvl(sum(d.totalamount),0)',
'             from salesenquirydetail d where d.tno=h.tno',
'       ) where h.tno=:P706_TNO;',
'',
'    delete from salesenquiryfooter where tno = :P706_TNO;',
'    insert into salesenquiryfooter',
'        (tno ,',
'        SNO,',
'        FOOTERHEADCODE , ',
'        FOOTERVALUE )',
'        (   SELECT X.TNO,',
'                   GLOBALTNO.NEXTVAL,',
'                   X.FOOTERHEADCODE,',
'                   X.SUMOFVALUE',
'             FROM ',
'            (select ',
'                :P706_TNO AS TNO ,               ',
'                FOOTERHEADCODE , ',
'                sum(FOOTERVALUE) as sumofvalue ',
'            from salesenquirydetailfooter',
'            where tno = :P706_TNO',
'            group by FOOTERHEADCODE',
'            ) X',
'        );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60256058352924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9007062026092701)
,p_process_sequence=>115
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Sales Enquiry calculations before commit'
,p_static_id=>'verify-salesenquiry-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number; l_sa number:=0; l_sf number:=0; l_st number:=0;',
'procedure add_error(p varchar2) is begin l_count:=l_count+1; if l_count<=8 then l_errors:=l_errors||case when l_errors is null then null else '' | '' end||p; end if; end;',
'function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;',
'begin',
'for d in (select d.*,i.measuringunitcode2 unit2,nvl((select sum(f.footervalue) from salesenquirydetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs from salesenquirydetail d join item i on i.itemcode=d.itemcode where d.tno=:P706_TNO order by d.sno) loop',
'l_amount:=nvl(d.rate,0)*case when d.unit2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(d.unit2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end; l_footer:=d.fs;',
'if different(d.amount,l_amount,.01) then add_error(''SNO ''||d.sno||'' Amount expected ''||l_amount||'', found ''||nvl(d.amount,0)); end if;',
'if different(d.footeramount,l_footer,.01) then add_error(''SNO ''||d.sno||'' FD/Other expected ''||l_footer||'', found ''||nvl(d.footeramount,0)); end if;',
'if different(d.totalamount,l_amount+l_footer,.01) then add_error(''SNO ''||d.sno||'' Total expected ''||(l_amount+l_footer)||'', found ''||nvl(d.totalamount,0)); end if;',
'l_sa:=l_sa+nvl(d.amount,0); l_sf:=l_sf+nvl(d.footeramount,0); l_st:=l_st+nvl(d.totalamount,0); end loop;',
'for h in (select sumofamount,sumoffooteramount,salesenquiryamount from salesenquiry where tno=:P706_TNO) loop',
'if different(h.sumofamount,l_sa,.01) then add_error(''Summary Amount mismatch''); end if; if different(h.sumoffooteramount,l_sf,.01) then add_error(''Summary Footer mismatch''); end if; if different(h.salesenquiryamount,l_st,.01) then add_error(''Sales Enquiry Amount mismatch''); end if; end loop;',
'if l_errors is not null then raise_application_error(-20055,''Save blocked - Sales Enquiry calculation mismatch: ''||l_errors||''. No data from this save was committed.''); end if; end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>9007062026092701
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168536751162306403)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P706_TNO, :P706_SALESENQUIRYNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(168529634355306400)
,p_internal_uid=>60255217361924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168534348661306403)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P706_FORMSTATUS = ''NEWRECORD'' THEN',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P706_ALLOWEDBACK,:P706_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'        else',
'     :P706_ALLOWEDBACK       := :P706_SALESENQUIRYDATE ; ',
'    :P706_ALLOWEDFORWARD    := :P706_SALESENQUIRYDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60252814860924096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168505543514306385)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1049606345658423904)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Special Note - Save Interactive Grid Data'
,p_static_id=>'special-note-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60224009713924078
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(168501658373306382)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1045334671049315140)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Terms and Conditions - Save Interactive Grid Data'
,p_static_id=>'terms-and-conditions-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    if :TERMSANDCONDITIONHEADCODE is not null then',
'        if :sno is null then',
'            select globaltno.nextval into :sno from dual;',
'        end if;',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into salesenquirytac (                 ',
'                   TNO,',
'                   SNO,',
'                   TERMSANDCONDITIONHEADCODE,',
'                   TERMSANDCONDITION',
'                    --taxrulecode            ',
'            )',
'            Values (',
'                :tno                    ,',
'                :sno                    ,',
'                :TERMSANDCONDITIONHEADCODE               ,',
'                :TERMSANDCONDITION                    ',
'            );',
'        ',
'        when ''U'' then',
'            update salesenquirytac Set',
'                   TNO              = :tno,',
'                   SNO              = :sno,',
'                   TERMSANDCONDITIONHEADCODE = :TERMSANDCONDITIONHEADCODE,',
'                   TERMSANDCONDITION = :TERMSANDCONDITION',
'                  ',
'            WHERE TNO = :P706_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From salesenquirytac',
'            Where TNo = :P706_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'    end if;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60220124572924075
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
