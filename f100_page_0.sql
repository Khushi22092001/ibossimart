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
,p_default_workspace_id=>1516696681383506
,p_default_application_id=>100
,p_default_id_offset=>2605179468527258
,p_default_owner=>'SAGARDASHBOARD'
);
end;
/
 
prompt APPLICATION 100 - Imart- Development 
--
-- Application Export:
--   Application:     100
--   Name:            Imart- Development 
--   Date and Time:   15:52 Monday August 31, 2026
--   Exported By:     SAGARDASHBOARD
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 0
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00000
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>0);
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260829a'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#app-icon.css?version=#APP_VERSION#',
'#APP_FILES#rupee.css?version=#APP_VERSION#',
'#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260829a',
'#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260829a'))
,p_step_template=>4072355960268175073
,p_protection_level=>'D'
,p_page_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<img src="#APP_FILES#logo_new4.png" alt="Oracle"style=" width:30px;height:18px;"/>',
'InfoMart Release 1.0'))
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32011685442264986)
,p_plug_name=>'Global Search'
,p_static_id=>'global-search'
,p_region_name=>'global_search'
,p_region_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--sm'
,p_region_attributes=>'style="overflow:hidden; display:none;"'
,p_plug_template=>1660973136434625155
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SEARCH_REGION'
,p_ajax_items_to_submit=>'P0_NEW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'custom_layout', 'N',
  'lazy_loading', 'Y',
  'minimum_characters', '2',
  'no_query_entered_message', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<p class="margin-md" id="gs-info" style="border-radius: 10px; border: 1px dashed var(--ut-palette-primary-text); padding: 10px; color: #555454;">',
    '    <span id="header" style="font-size: 14px; font-weight: bold;">Global Search Functionality<span><br><br>',
    '    <span id="first_text" style="font-size: 14px; font-weight: normal;" >The ERP search interface allows users to locate available modules and specific transactions efficiently. Please adhere to the following guidelines:</span><br><br>',
    '    <span id="second_text" style="font-size: 14px; font-weight: normal;"><span style="font-weight: bold;">Initialization:</span> Enter a minimum of two characters to initiate the search process.<br>',
    '    <span style="font-weight: bold;">Transaction-Specific Search: </span>To locate a specific transaction, use the prefix <span style="font-weight:bold; color:red;">"TNO: [Transaction Number]"</span>. This format optimizes the search across all modul'
||'es for more accurate results. or user can directly enter the transaction no.</span>',
    '',
    '</p>')),
  'no_results_found_message', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<span class="u-textCenter"><h5>',
    'No data Found',
    '</h5></span>')),
  'results_per_page', '15',
  'results_per_page_type', 'STATIC',
  'search_as_you_type', 'Y',
  'search_page_item', 'P0_NEW',
  'show_result_count', 'N',
  'use_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(35217468657021082)
,p_region_id=>wwv_flow_imp.id(32011685442264986)
,p_search_config_id=>wwv_flow_imp.id(36201462233548216)
,p_use_as_initial_result=>false
,p_display_sequence=>10
,p_name=>'Module Search'
,p_static_id=>'module-search'
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(35217530807021083)
,p_region_id=>wwv_flow_imp.id(32011685442264986)
,p_search_config_id=>wwv_flow_imp.id(36201984636556777)
,p_use_as_initial_result=>false
,p_display_sequence=>20
,p_name=>'Transaction Search'
,p_static_id=>'transaction-search'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(850000000000000004)
,p_plug_name=>'Master Form Presentation'
,p_static_id=>'master-form-presentation'
,p_region_name=>'hspl-master-form-assets'
,p_plug_display_sequence=>999
,p_plug_source=>'<link rel="stylesheet" href="#APP_FILES#hspl-master-forms.css?cb=20260831o"><script src="#APP_FILES#hspl-master-forms.js?cb=20260831s"></script>'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(530622053478765210)
,p_plug_name=>'TITLE'
,p_static_id=>'title'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_region_attributes=>'Style="font-size : 50px";'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#APP_FILES#app-icon.css?version=#APP_VERSION#">',
'<link rel="stylesheet" href="#APP_FILES#rupee.css?version=#APP_VERSION#">',
'<link rel="stylesheet" href="#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260829b">',
'<link rel="stylesheet" href="#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260829b">',
'<script src="#APP_FILES#hspl-drawer-adapter.js?cb=20260831e"></script>',
'<script src="#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260829b"></script>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3592550109028601)
,p_name=>'P0_APPUSER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(530622053478765210)
,p_item_default=>'V(''APP_USER'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3592619640028602)
,p_name=>'P0_COMPANYCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(530622053478765210)
,p_item_default=>'v(''GLOBAL_COMPANYCODE'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35217316235021081)
,p_name=>'P0_NEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(32011685442264986)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_placeholder=>'-- Enter Module Name or Transaction No to Search--'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(284751912973396793)
,p_name=>'P0_PARTYCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(530622053478765210)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32011849817264988)
,p_name=>'P0_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32011685442264986)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530622144825765211)
,p_name=>'P0_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(530622053478765210)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select page_title from apex_application_pages ',
'where application_id=:APP_ID ',
'and page_id=:APP_PAGE_ID;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>':APP_PAGE_NAME'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'Style="font-size : 18px"; "text-align: center'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--boldDisplay'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35217613317021084)
,p_name=>'Close the global_search Region on click'
,p_static_id=>'close-the-global-search-region-on-click'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35217773504021085)
,p_event_id=>wwv_flow_imp.id(35217613317021084)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(document).on(''click'', ''.ui-widget-overlay'', function() {',
    '    apex.theme.closeRegion(''global_search'');',
    '     $s(''P0_NEW'', ''''); ',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35217798492021086)
,p_name=>'Custom DA for Open Dialog and set Focus'
,p_static_id=>'custom-da-for-open-dialog-and-set-focus'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#global_search'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogopen'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35217950404021087)
,p_event_id=>wwv_flow_imp.id(35217798492021086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''#P0_NEW'').focus();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(291078613747482325)
,p_name=>'menu tooltip'
,p_static_id=>'menu-tooltip'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291078714434482326)
,p_event_id=>wwv_flow_imp.id(291078613747482325)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#t_TreeNav").treeView("option", "tooltip", {',
    '    content: function(cb, node) {',
    '        return node.label;',
    '    }',
    '} );',
    '$("#t_TreeNav").tooltip("option", "items", ".a-TreeView-content");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(291078996104482329)
,p_name=>'menu tooltip_1'
,p_static_id=>'menu-tooltip-2'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291079126874482330)
,p_event_id=>wwv_flow_imp.id(291078996104482329)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'try {',
    '',
    '  //Tooltip for Menu Text',
    '  $("#t_TreeNav").treeView("option", "tooltip", {',
    '    content: function (cb, node) {',
    '      var ttText;',
    '',
    '      // Only display the tooltip if the menu is collapsed ...',
    '      if ($(".js-navCollapsed ").length > 0) {',
    '        ttText = node.label;',
    '      }',
    '      else {',
    '        ttText = "";',
    '      }',
    '      return ttText;',
    '    },',
    '    position: {',
    '      my: "left+5 center", at: "right center"',
    '    }',
    '  });',
    '',
    '  //This tells the tooltip to show up for the whole node content including the icon.',
    '  $("#t_TreeNav").tooltip("option", "items", ".a-TreeView-content");',
    '}',
    'catch (err) {',
    '  // Do nothing ...',
    '',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(563694814390266075)
,p_name=>'Notification'
,p_static_id=>'notification'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(563694915130266076)
,p_event_id=>wwv_flow_imp.id(563694814390266075)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-apex-notification'
,p_action=>'PLUGIN_APEX.NOTIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    "refresh": 0,',
    '    "mainIcon": "fa-bell",',
    '    "mainIconColor": "white",',
    '    "mainIconBackgroundColor": "rgba(70,70,70,0.9)",',
    '    "mainIconBlinking": false,',
    '    "counterBackgroundColor": "rgb(232, 55, 55 )",',
    '    "counterFontColor": "white",',
    '    "linkTargetBlank": false,',
    '    "showAlways": false,',
    '    "browserNotifications": {',
    '        "enabled": true,',
    '        "cutBodyTextAfter": 100,',
    '        "link": false',
    '    },',
    '    "accept": {',
    '        "color": "#44e55c",',
    '        "icon": "fa-check"',
    '    },',
    '    "decline": {',
    '        "color": "#b73a21",',
    '        "icon": "fa-close"',
    '    },',
    '    "hideOnRefresh": true',
    '}')),
  'attribute_02', 'notification-menu',
  'attribute_04', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select ''fa-wrench'' As NOTE_ICON,',
    '       ''#10779f'' As NOTE_ICON_COLOR,',
    '       b.modulename As NOTE_HEADER,',
    '       A.MENULABEL || ''-'' || TO_CHAR(A.QUEUEDATE, ''DD-MM-RRRR HH24:MI'') ||'' Remark : ''||',
    '       (Select aa.remark',
    '          From passfail aa',
    '         Where aa.tokenno < a.tokenno',
    '           And aa.moduletno = a.ModuleTNo',
    '           And Rownum = 1) As NOTE_TEXT,',
    '          null as NOTE_LINK,',
    '          --''f?p='' || :APP_ID || '':'' ||to_char(b.entrypageno) || '':'' ||:APP_SESSION || ''::NO::'' || ''P'' ||to_char(b.entrypageno) ||''_TNO,P'' ||to_char(b.entrypageno) ||''_CALLEDFROMPAGE,P''||to_char(b.entrypageno)||''_FORMSTATUS'' || '':'' ||A.MODULETNO || '''
||','' || :APP_PAGE_ID||'',''||''CALLED''||'':NO'' As NOTE_LINK, ',
    '       ',
    '       ''#10779f'' As NOTE_COLOR,',
    '       --NULL AS NOTE_ACCEPT,',
    '       --Order By aa.moduletno, aa.tokenno Desc) As NOTE_ACCEPT,',
    '       --''javascript:alert("Declined");void(0);'' As NOTE_DECLINE,',
    '       Null As NOTE_ACCEPT,',
    '       Null As NOTE_DECLINE,',
    '       0    As NO_BROWSER_NOTIFICATION',
    '  From ONTHETABLE_APEX a, Module b',
    ' Where a.modulecode = b.modulecode',
    '--order by a.QUEUEDATE desc',
    '')),
  'attribute_05', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(594090541356899208)
,p_name=>'sideMenuExpandCollapse'
,p_static_id=>'sidemenuexpandcollapse'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(594090670719899209)
,p_event_id=>wwv_flow_imp.id(594090541356899208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#t_Body_nav").show();',
    '//$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')))).to_clob
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
