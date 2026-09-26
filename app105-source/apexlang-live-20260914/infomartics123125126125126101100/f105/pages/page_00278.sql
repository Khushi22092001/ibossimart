prompt --application/pages/page_00278
begin
--   Manifest
--     PAGE: 00278
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>278
,p_name=>'Chart of Account'
,p_alias=>'CHART-OF-ACCOUNT'
,p_step_title=>'Chart of Accounts'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202452540887876880)
,p_plug_name=>'Chart of Account'
,p_static_id=>'chart-of-account'
,p_region_name=>'COA'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status,  Level       As tlevel,',
'               parentcode,',
'               "PARTYNAME" As PARTYNAME,',
'               Null        As icon,',
'               "PARTYCODE" As PARTYCODE,',
'               TNO,',
'               Null        As tooltip,',
'               ''f?p=''||:APP_ID||'':''||49||'':''||:APP_SESSION||''::::''||''P49_TNO,P49_FORMSTATUS,P49_CALLEDFROMPAGE''||'':''||TNO||'',''||''EDITRECORD''||'',''||''278''||'':NO)'' As link',
'           From  "PARTY"',
'         Where Level <= nvl(:P278_EXPANDLEVEL,1)',
'         Start With "PARENTCODE" Is Null',
'        Connect By Prior "PARTYCODE" = "PARENTCODE"',
'         Order Siblings By "PARTYNAME"'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_ajax_items_to_submit=>'P278_EXPANDLEVEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'icon_type_css_class', 'a-Icon',
  'link_column', 'LINK',
  'node_id_column', 'PARTYCODE',
  'node_label_column', 'PARTYNAME',
  'node_value_column', 'PARTYCODE',
  'parent_key_column', 'PARENTCODE',
  'start_tree_with', 'NULL',
  'tree_hierarchy', 'SQL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(202452968551876880)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(202452540887876880)
,p_button_name=>'CONTRACT_ALL'
,p_static_id=>'contract-all'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'t-Button--gapLeft:t-Button--gapRight'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Collapse All'
,p_button_position=>'RIGHT_OF_TITLE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(202454314384876883)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(202452540887876880)
,p_button_name=>'EXPAND_ALL'
,p_static_id=>'expand-all'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Expand All'
,p_button_position=>'RIGHT_OF_TITLE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201860443828982952)
,p_name=>'P278_EXPANDLEVEL'
,p_item_sequence=>20
,p_prompt=>'Expand Level'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(201861425927982962)
,p_name=>'P278_SEARCH'
,p_item_sequence=>30
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_HR.BILOG.MGORICKI.DYNAMICTREE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'COA',
  'attribute_02', 'N',
  'attribute_03', '200')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202453381944876882)
,p_name=>'CONTRACT_ALL'
,p_static_id=>'contract-all'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(202452968551876880)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201860960951982957)
,p_event_id=>wwv_flow_imp.id(202453381944876882)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P278_EXPANDLEVEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '1')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202453880814876883)
,p_event_id=>wwv_flow_imp.id(202453381944876882)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202452540887876880)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202454682210876883)
,p_name=>'EXPAND_ALL'
,p_static_id=>'expand-all'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(202454314384876883)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201860864959982956)
,p_event_id=>wwv_flow_imp.id(202454682210876883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P278_EXPANDLEVEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '10')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202455166652876883)
,p_event_id=>wwv_flow_imp.id(202454682210876883)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-expand'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202452540887876880)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(201860599972982953)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P278_EXPANDLEVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201860704890982954)
,p_event_id=>wwv_flow_imp.id(201860599972982953)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(202452540887876880)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
