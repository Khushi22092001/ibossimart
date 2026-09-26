prompt --application/pages/page_00279
begin
--   Manifest
--     PAGE: 00279
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
 p_id=>279
,p_name=>'Chart of Items'
,p_alias=>'CHART-OF-ITEMS'
,p_step_title=>'Chart of Items'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(220811071883303231)
,p_plug_name=>'Chart of Items'
,p_static_id=>'chart-of-items'
,p_region_name=>'COI'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status,  Level       As tlevel,',
'               parentcode,',
'               "ITEMNAME" As PARTYNAME,',
'               Null        As icon,',
'               "ITEMCODE" As PARTYCODE,',
'               TNO,',
'               Null        As tooltip,',
'              LINK        As link',
'           From (',
'                 Select A.TNO, ',
'                        A.ITEMTYPECODE AS ITEMCODE, ',
'                        A.ITEMTYPENAME AS ITEMNAME, ',
'                        A.PARENTCODE,',
'                ''f?p=''||:APP_ID||'':''||188||'':''||:APP_SESSION||''::::''||''P188_TNO,P188_FORMSTATUS,P188_CALLEDFROMPAGE''||'':''||A.TNO||'',''||''EDITRECORD''||'',''||''279''||'':NO)'' As link',
'                  From ITEMTYPE A',
'                Union All',
'                Select AA.TNO, AA.ITEMCODE, AA.ITEMNAME, AA.ITEMTYPE As PARENTCODE,',
'                ''f?p=''||:APP_ID||'':''||59||'':''||:APP_SESSION||''::::''||''P59_TNO,P59_FORMSTATUS,P59_CALLEDFROMPAGE''||'':''||AA.TNO||'',''||''EDITRECORD''||'',''||''279''||'':NO)'' As link',
'',
'            From ITEM AA',
'',
'          )  "ITEM"',
'         Where Level <= nvl(:P279_EXPANDLEVEL,1)',
'         Start With "PARENTCODE" Is Null',
'        Connect By Prior "ITEMCODE" = "PARENTCODE"',
'         Order Siblings By "ITEMNAME"',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_ajax_items_to_submit=>'P279_EXPANDLEVEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'icon_css_class_column', 'ICON',
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
 p_id=>wwv_flow_imp.id(210341093637130283)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(220811071883303231)
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
 p_id=>wwv_flow_imp.id(210341419054130284)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(220811071883303231)
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
 p_id=>wwv_flow_imp.id(220220449861409321)
,p_name=>'P279_EXPANDLEVEL'
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
 p_id=>wwv_flow_imp.id(211482149099699821)
,p_name=>'P279_SEARCH'
,p_item_sequence=>30
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_HR.BILOG.MGORICKI.DYNAMICTREE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'COI',
  'attribute_02', 'N',
  'attribute_03', '200')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210343206344130293)
,p_name=>'CONTRACT_ALL'
,p_static_id=>'contract-all'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(210341093637130283)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209402535950685708)
,p_event_id=>wwv_flow_imp.id(210343206344130293)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P279_EXPANDLEVEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '1')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210343774651130293)
,p_event_id=>wwv_flow_imp.id(210343206344130293)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(220811071883303231)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210344151214130293)
,p_name=>'EXPAND_ALL'
,p_static_id=>'expand-all'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(210341419054130284)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209402286414685705)
,p_event_id=>wwv_flow_imp.id(210344151214130293)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P279_EXPANDLEVEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '10')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210344621865130293)
,p_event_id=>wwv_flow_imp.id(210344151214130293)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-expand'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(220811071883303231)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210342366923130292)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P279_EXPANDLEVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210342831167130293)
,p_event_id=>wwv_flow_imp.id(210342366923130292)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(220811071883303231)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
