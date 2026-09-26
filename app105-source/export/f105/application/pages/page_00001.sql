prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'InfoMart'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important;',
'  ',
'} ',
'',
'body {',
'  position: relative;',
'  background-color: #fff;',
'}',
'',
'body::before {',
'  content: "";',
'  position: fixed;',
'',
'  top: 0;',
'  left: 0;',
'  width: 100%;',
'  height: 100%;',
'  ',
'',
'//  background-image: url(''#APP_FILES#IRON-MART.jpg'');',
'background-image: url(''#APP_FILES#watermark_page-0001.jpg'');',
'  ',
'  background-repeat: no-repeat;',
'  background-position: center;',
'  background-size: 500px 620px;',
'',
unistr('  opacity: 0.10;        /* \D83D\DD25 watermark strength */'),
'  z-index: -1;          /* stays behind content */',
'  pointer-events: none; /* clicks pass through */',
'}',
'',
'/*body{',
'  background-image: url(''#APP_FILES#IRON-MART.jpg'');',
'  //background-image: url(''#APP_FILES#rama Group Logo no. 3.png'');  ',
'  background-position: center;',
'  background-size:cover;',
'    background-repeat: no-repeat; ',
'',
' background-size: 1380px 620px;',
' background-blend-mode: lighten;  ',
'  ',
'}',
'*/',
''))
,p_step_template=>wwv_flow_imp.id(212831217557091971)
,p_page_template_options=>'#DEFAULT#'
,p_browser_cache=>'N'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(574067901870959885)
,p_plug_name=>'Iron Mart'
,p_static_id=>'iron-mart'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(445637768519231833)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(445638070579231834)
,p_event_id=>wwv_flow_imp.id(445637768519231833)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp.component_end;
end;
/
