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
 
prompt APPLICATION 100 - Imart
--
-- Application Export:
--   Application:     100
--   Name:            Imart
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 321
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00321
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>321);
end;
/
prompt --application/pages/page_00321
begin
wwv_flow_imp_page.create_page(
 p_id=>321
,p_name=>'PURCHASEBILLDETAILFOOTER'
,p_alias=>'PURCHASEBILLDETAILFOOTER'
,p_page_mode=>'MODAL'
,p_step_title=>'PURCHASEBILLDETAILFOOTER'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* P2P_FOOTER_RECORD_CALC_V1: preserve configured formula, return to its row. */',
'(function(){',
' var p=Number(apex.env.APP_PAGE_ID),regionId=p===199?''Detail_Footer'':p===321||p===323?''DetailFooter'':''FooterDetail'';',
' function raw(v){return v&&typeof v===''object''&&''v'' in v?v.v:v;}',
' function num(v){return Number(String(raw(v)||0).replace(/,/g,''''))||0;}',
' function view(){try{return apex.region(regionId).widget().interactiveGrid(''getViews'',''grid'');}catch(ignore){return null;}}',
' function bind(){var v=view();if(!v||!v.model||v.model.hsplFooterRecordCalc)return;var m=v.model,states={},busy=false,applying=false;m.hsplFooterRecordCalc=true;',
'  function val(r,f){return raw(m.getValue(r,f));}',
'  function validity(id,state,message){if(m.setValidity)m.setValidity(state,id,''FOOTERVALUE'',message);}',
'  function totals(){var sum=0,included=0;m.forEach(function(r,i,id){var meta=m.getRecordMetadata(id)||{};if(!meta.deleted&&!meta.agg){sum+=num(val(r,''FOOTERVALUE''));if(p===199&&String(val(r,''INCLUDEWITHTAXABLEAMOUNT'')).toUpperCase()===''YES'')included+'
||'=num(val(r,''FOOTERVALUE''));}});apex.item(''P''+p+''_DFTOTALAMOUNT'').setValue(sum,null,true);',
'   if(p===199){try{var parent=apex.region(''Detail_Region'').widget().interactiveGrid(''getViews'',''grid'').model,sno=apex.item(''P199_SNO'').getValue();parent.forEach(function(r,i,id){var meta=parent.getRecordMetadata(id)||{};if(!meta.deleted&&!meta.agg&&S'
||'tring(raw(parent.getValue(r,''SNO'')))===String(sno)){var base=num(parent.getValue(r,''AMOUNT''));apex.item(''P199_DFAMOUNT_1'').setValue(base,null,true);apex.item(''P199_DFAMOUNT'').setValue(base+included,null,true);}});}catch(ignore){} }',
'  }',
'  function pump(){var current=view();if(busy||!current||current.model!==m)return;var id=Object.keys(states).find(k=>states[k].pending);if(!id)return;var s=states[id],r=m.getRecord(id);if(!r||(m.getRecordMetadata(id)||{}).deleted){delete states[id];pu'
||'mp();return;}var revision=s.revision,tno=val(r,''TNO''),sno=val(r,''SNO'');busy=true;',
'   apex.server.process(''P''+p+''_FOOTER_CALCULATE'',{x01:JSON.stringify({head:val(r,''FOOTERHEADCODE''),legend:val(r,''LEGENDSCODE''),percent:num(val(r,''FOOTERPERCENT'')),value:num(val(r,''FOOTERVALUE'')),amount:num(apex.item(''P''+p+''_DFAMOUNT'').getValue())})},'
||'{dataType:''json''}).done(function(result){',
'    var current=view();if(!current||current.model!==m||s.revision!==revision||m.getRecord(id)!==r||(m.getRecordMetadata(id)||{}).deleted||String(tno)!==String(val(r,''TNO''))||String(sno)!==String(val(r,''SNO'')))return;',
'    applying=true;try{m.setValue(r,''FOOTERVALUE'',String(result.value));s.pending=false;s.error=false;validity(id,''valid'');totals();}finally{applying=false;}',
'   }).fail(function(){if(s.revision===revision){s.pending=false;s.error=true;validity(id,''error'',''Retry this footer calculation before saving.'');apex.message.showErrors([{type:''error'',location:''page'',message:''Footer calculation failed. Retry this foo'
||'ter percentage or legend before saving.'',unsafe:false}]);}}).always(function(){busy=false;pump();});',
'  }',
'  m.subscribe({onChange:function(type,data){if(applying)return;if(type===''set''&&data){var r=data.record||m.getRecord(data.recordId);if(r){var id=m.getRecordId(r),s=states[id]||(states[id]={revision:0});s.revision++;',
'   if(p===199&&data.field===''FOOTERHEADCODE''){applying=true;try{m.setValue(r,''INCLUDEWITHTAXABLEAMOUNT'',[''.CGST.'',''.SGST.'',''.IGST.''].includes(String(val(r,''FOOTERHEADCODE'')))?''NO'':''YES'');}finally{applying=false;}}',
'   if([''FOOTERPERCENT'',''LEGENDSCODE''].includes(data.field)){s.pending=true;s.error=false;validity(id,''error'',''Wait for the footer calculation to finish.'');clearTimeout(s.timer);s.timer=setTimeout(pump,25);}else if(data.field===''FOOTERVALUE''){s.pendin'
||'g=false;s.error=false;validity(id,''valid'');}}}totals();}});',
'  m.hsplFooterBlocked=function(){return busy||Object.keys(states).some(id=>m.getRecord(id)&&!(m.getRecordMetadata(id)||{}).deleted&&(states[id].pending||states[id].error));};totals();',
' }',
' apex.jQuery(bind);apex.jQuery(document).on(''interactivegridviewmodelcreate.p2pFooterCalc apexafterrefresh.p2pFooterCalc'',bind);',
' apex.jQuery(document).on(''apexbeforepagesubmit.p2pFooterCalc'',function(event,request){if(![''SAVE'',''CREATE''].includes(request))return;var v=view();if(v&&v.model&&v.model.hsplFooterBlocked&&v.model.hsplFooterBlocked()){event.preventDefault();apex.mess'
||'age.showErrors([{type:''error'',location:''page'',message:''Wait for FD calculations to finish before saving.'',unsafe:false}]);return false;}});',
'}());',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'/* P321_HIDE_REDUNDANT_DETAIL_FOOTER_BACK_V1',
' * The dialog title bar already provides its navigation control. */',
'html.page-321 #back {',
'  display: none !important;',
'}',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'650'
,p_dialog_width=>'720'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(623641364814592879)
,p_plug_name=>'DetailFooter'
,p_static_id=>'detailfooter'
,p_region_name=>'DetailFooter'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
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
'       INCLUDEDWITHRATE,',
'       LEGENDSCODE,',
'       SN',
'  from PURCHASEBILLDETAILFOOTER',
'  where tno = :P321_TNO',
'  and sno = :P321_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P321_TNO,P321_SNO'
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
 p_id=>wwv_flow_imp.id(187911372164430933)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(187911504936430934)
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
 p_id=>wwv_flow_imp.id(623641947307592885)
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
 p_id=>wwv_flow_imp.id(623642048140592886)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footerpercent'
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
 p_id=>wwv_flow_imp.id(623642137637592887)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footervalue'
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
 p_id=>wwv_flow_imp.id(623642295986592889)
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
 p_id=>wwv_flow_imp.id(623642393148592890)
,p_name=>'INCLUDEDWITHRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDEDWITHRATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Includedwithrate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(623642575837592891)
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
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(600562003841461692)
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
 p_id=>wwv_flow_imp.id(623641568715592881)
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
 p_id=>wwv_flow_imp.id(623641868420592884)
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
 p_id=>wwv_flow_imp.id(623642678949592892)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sn'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(623641738777592883)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
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
 p_id=>wwv_flow_imp.id(623642257730592888)
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
 p_id=>wwv_flow_imp.id(623641631798592882)
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
,p_default_expression=>'P321_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(623641457805592880)
,p_internal_uid=>463263929148168188
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
 p_id=>wwv_flow_imp.id(623697322323779940)
,p_interactive_grid_id=>wwv_flow_imp.id(623641457805592880)
,p_static_id=>'1604148'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(623697580853779940)
,p_report_id=>wwv_flow_imp.id(623697322323779940)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(190854586383676523)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(187911372164430933)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623698038850779941)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(623641568715592881)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623698904744779943)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(623641631798592882)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623699854708779946)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(623641738777592883)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623700701580779952)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(623641868420592884)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623701643914779954)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(623641947307592885)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623702498354779957)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(623642048140592886)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623703473598779961)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(623642137637592887)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623704338055779963)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(623642257730592888)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623705288682779966)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(623642295986592889)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623706179702779968)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(623642393148592890)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623707085105779971)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(623642575837592891)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(623707970538779973)
,p_view_id=>wwv_flow_imp.id(623697580853779940)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(623642678949592892)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190821870942471076)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(623641364814592879)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(623720115225790901)
,p_name=>'P321_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(623641364814592879)
,p_prompt=>'DFAMT'
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
 p_id=>wwv_flow_imp.id(623720192808790902)
,p_name=>'P321_DFTOTALAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(623641364814592879)
,p_prompt=>'DFTOTAL'
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
 p_id=>wwv_flow_imp.id(623720289848790903)
,p_name=>'P321_FVALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(623641364814592879)
,p_prompt=>'FVALUE'
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
 p_id=>wwv_flow_imp.id(187911252865430932)
,p_name=>'P321_SNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(623641364814592879)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187911172078430931)
,p_name=>'P321_TNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(623641364814592879)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190828359195490562)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_triggering_element=>'LEGENDSCODE,FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190828808680490563)
,p_event_id=>wwv_flow_imp.id(190828359195490562)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,LEGENDSCODE,FOOTERPERCENT,P321_DFAMOUNT',
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
    '			and a.modulecode = ''PURCHASEBILL''',
    '			and c.modulecode = ''PURCHASEBILL''',
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
    '			and a.modulecode = ''PURCHASEBILL''',
    '			and c.modulecode = ''PURCHASEBILL''',
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
    '			and a.modulecode = ''PURCHASEBILL''',
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
    '    tTotalDetailAmount := :P321_DFAMOUNT;',
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
    '		  						:footervalue := nvl(round(fvalue,3),0);',
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
 p_id=>wwv_flow_imp.id(190829311200490563)
,p_event_id=>wwv_flow_imp.id(190828359195490562)
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
 p_id=>wwv_flow_imp.id(190831869555495450)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190832295193495450)
,p_event_id=>wwv_flow_imp.id(190831869555495450)
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
    '$s("P321_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190826557889481803)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190826950180481803)
,p_event_id=>wwv_flow_imp.id(190826557889481803)
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
    '$s("P321_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190831108610493814)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190831438313493815)
,p_event_id=>wwv_flow_imp.id(190831108610493814)
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
    '$s("P321_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190823787113479364)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190824207300479365)
,p_event_id=>wwv_flow_imp.id(190823787113479364)
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
 p_id=>wwv_flow_imp.id(190827624143488869)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190827972212488869)
,p_event_id=>wwv_flow_imp.id(190827624143488869)
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
 p_id=>wwv_flow_imp.id(190824557085480572)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(623641364814592879)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190824976831480573)
,p_event_id=>wwv_flow_imp.id(190824557085480572)
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
    'model.forEach(function(igrow,index,id) {',
    'meta = model.getRecordMetadata(id);',
    '    n_amt = parseInt(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt) && !meta.agg) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P321_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(187911798443430937)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'close dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P321_FVALUE',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>27534269786006245
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(187911591932430935)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(623641364814592879)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DetailFooter - Save Interactive Grid Data'
,p_static_id=>'detailfooter-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>27534063275006243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90661119474507253)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'P321_FOOTER_CALCULATE'
,p_static_id=>'p321-footer-calculate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare j json_object_t:=json_object_t.parse(apex_application.g_x01);l_head varchar2(30):=j.get_string(''head'');l_legend varchar2(30):=j.get_string(''legend'');l_percent number:=j.get_number(''percent'');l_value number:=j.get_number(''value'');l_amount numb'
||'er:=j.get_number(''amount'');begin',
'declare	',
'	cursor cFooterSchemeDetail is',
'		select a.* ',
'		from FooterSchemeList a, FooterSchemeList c',
'		where a.tno = c.tno',
'			and a.Status = ''ACTIVE''',
'			and c.FooterHeadCode = l_head',
'			and a.sno < c.sno ',
'			and a.companycode = :global_CompanyCode',
'			and a.financialyearcode = :global_financialyearcode',
'			and a.modulecode = ''PURCHASEBILL''',
'			and c.modulecode = ''PURCHASEBILL''',
'		order by a.sno;',
'	vFooterSchemeDetail cFooterSchemeDetail%ROWTYPE;',
'	',
'	cursor c3FooterSchemeDetail is',
'		select a.* ',
'		from FooterSchemeList a, FooterSchemeList c',
'		where a.tno = c.tno',
'			and a.Status = ''ACTIVE''',
'			and c.FooterHeadCode = l_head',
'			and a.companycode = :global_CompanyCode',
'			and a.financialyearcode = :global_financialyearcode',
'			and a.modulecode = ''PURCHASEBILL''',
'			and c.modulecode = ''PURCHASEBILL''',
'		order by a.sno;',
'	v3FooterSchemeDetail c3FooterSchemeDetail%ROWTYPE;',
'',
'',
'	cursor c2FooterSchemeDetail is',
'		select a.* ',
'		from FooterSchemeList a',
'		where a.Status = ''ACTIVE''',
'			and a.FooterHeadCode = l_head',
'			and a.companycode = :global_CompanyCode',
'			and a.financialyearcode = :global_financialyearcode',
'			and a.modulecode = ''PURCHASEBILL''',
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
'    tTotalDetailAmount := l_amount;',
'',
'  open c2FooterSchemeDetail;',
'  fetch c2FooterSchemeDetail into v2FooterSchemeDetail;',
'  if c2FooterSchemeDetail%FOUND then',
'  		if length(nvl(v2FooterSchemeDetail.Formula,''''))>0 then',
'  				myFormula := v2FooterSchemeDetail.Formula;',
'  				myFormula := replace(myFormula, ''.A.'', nvl(tTotalDetailAmount,0) );',
'  				for vFooterSchemeDetail  in cFooterSchemeDetail ',
'  				loop',
'					if l_head = vFooterSchemeDetail.FooterHeadCode then',
'							isFound := ''YES'';',
'							myFormula := replace(myFormula, vFooterSchemeDetail.FooterHeadCode, nvl(l_value,0) );',
'							exit;',
'					end if;',
'  				end loop;',
'  				',
'  					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(l_percent,0) );',
'  			',
'  				for v3FooterSchemeDetail  in c3FooterSchemeDetail ',
'  				loop',
'  						myFormula := replace(myFormula, v3FooterSchemeDetail.FooterHeadCode, ''0'' );',
'  				end loop;',
'  				if (l_legend is null and NVL(GetMYparametervalue(''LEGENDS''),''YES'') = ''NO'') then ',
'					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(l_percent,0));',
'					l_value := getvalue(myformula);',
'			    end if;',
'',
'                ',
'',
'		  		if (l_legend is not null and  NVL(GetMyparametervalue(''LEGENDS''),''NO'')= ''YES'') then ',
'		  				select getvalue(myFormula) into  fvalue 	from dual;',
'',
'                          ',
'                      ',
'		  				if l_legend = ''PRA'' then ',
'		  					 	l_value := nvl(round(fvalue,0),0);',
'		  					',
'',
'                                 ',
'                                ',
'		  				end if;',
'		  				',
'		  				if l_legend = ''PRD'' then ',
'		  						l_value := (-1)* nvl(round(fvalue,0),0);',
'		  					',
'		  				end if;',
'							if l_legend is null then ',
'									myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(l_percent,0));',
'							end if;',
'							if l_legend = ''PAA'' then ',
'		  						l_value := nvl(round(fvalue,3),0);',
'							end if;',
'							',
'							if l_legend = ''PAD'' then ',
'		  						l_value := (-1)* nvl(round(fvalue,2),0);',
'							end if;',
'		  		END IF;',
'		  	',
'  			',
'  		end if;',
' end if;',
' end;',
'apex_json.open_object;apex_json.write(''value'',l_value);apex_json.close_object;end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>98202609283210003
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
