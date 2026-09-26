prompt --application/pages/page_00517
begin
--   Manifest
--     PAGE: 00517
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>517
,p_name=>'Product Detail'
,p_alias=>'PRODUCT-DETAIL'
,p_step_title=>'Product Detail'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.background1{background-color: gainsboro;}',
'#MYID .t-Form-label {font-weight: bold;}',
'#MYID .apex-item-display-only {font-weight: normal;}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471518194467566196)
,p_plug_name=>'Product Details'
,p_static_id=>'product-details'
,p_region_name=>'MYID'
,p_region_css_classes=>'background1'
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--stacked:t-Region--hiddenOverflow:t-Form--standardPadding:t-Form--stretchInputs:t-Form--leftLabels'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459574321539005689)
,p_name=>'P517_BULKDENSITY'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Bulk Density :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459572708698005689)
,p_name=>'P517_CONSUMPTIONACC'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Cons A/c :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459573155043005689)
,p_name=>'P517_CWIPACC'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'CWIP A/c :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459570722148005688)
,p_name=>'P517_DEPARTMENT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Department :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459375085685840189)
,p_name=>'P517_HSNCODE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'HSN Code :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459573515396005689)
,p_name=>'P517_ISEQUIPMENT'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Is Equipment :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459569940728005688)
,p_name=>'P517_ITEMCATEGORY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Item Category :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459569586375005688)
,p_name=>'P517_ITEMCLASS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Item Class :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459567177649005687)
,p_name=>'P517_ITEMCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Item Code :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459568322544005687)
,p_name=>'P517_ITEMGROUP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Group Name :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459567521905005687)
,p_name=>'P517_ITEMNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Item Name :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459571995350005688)
,p_name=>'P517_ITEMNATURE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Item Nature :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459568802353005687)
,p_name=>'P517_ITEMSPECIFICATIONCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459374975255840188)
,p_name=>'P517_ITEMSPECIFICATIONNAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Specification :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459568002712005687)
,p_name=>'P517_ITEMTYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Item Type :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459570395342005688)
,p_name=>'P517_LOCATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Location :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459375182790840190)
,p_name=>'P517_MULTIPLYINGFACTOR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Multipl Fact :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459566371195005686)
,p_name=>'P517_PRODUCTCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459571163208005688)
,p_name=>'P517_PUOM'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Main Unit :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459574734988005689)
,p_name=>'P517_REMARK'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Remark :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459573946656005689)
,p_name=>'P517_SERIALNOREQUIRED'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Serial No Req :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459572347172005689)
,p_name=>'P517_STOCKACC'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Stock A/c :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459571511230005688)
,p_name=>'P517_SUOM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_prompt=>'Sub Unit :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459566756964005687)
,p_name=>'P517_TNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(471518194467566196)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451086771803709584)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451087139515709584)
,p_event_id=>wwv_flow_imp.id(451086771803709584)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(450891965382117689)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Products Detail'
,p_static_id=>'fetch-products-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      e.ItemCode,',
'      e.ItemName,',
'      e.ItemClassificationCode,',
'      GetItemName(e.ParentCode),',
'      ic.ItemClassName,',
'      icc.ItemCategoryName,',
'      GetLocationName(e.LocationCode),',
'      GetDepartmentName(e.DepartmentCode),',
'      mu1.MeasuringUnitName AS PUOM,',
'      mu2.MeasuringUnitName AS SUOM,',
'      GetPartyName(e.StockAccountCode),',
'      GetPartyName(e.ConsumptionAccountCode),',
'      GetPartyName(e.CWIPAccountCode),',
'      inn.ItemNatureName,',
'      e.IsEquipment,',
'      e.SerialNoRequired,',
'      e.BulkDensity,',
'      e.Remark,',
'      ee.ItemSpecificationName,',
'      ee.HSNCode,',
'      ee.Multiplyingfactor',
'      Into',
'      :P517_ITEMCODE,',
'      :P517_ITEMNAME,',
'      :P517_ITEMTYPE,',
'      :P517_ITEMGROUP,',
'      :P517_ITEMCLASS,',
'      :P517_ITEMCATEGORY,',
'      :P517_LOCATION,',
'      :P517_DEPARTMENT,',
'      :P517_PUOM,',
'      :P517_SUOM,',
'      :P517_STOCKACC,',
'      :P517_CONSUMPTIONACC,',
'      :P517_CWIPACC,',
'      :P517_ITEMNATURE,',
'      :P517_ISEQUIPMENT,',
'      :P517_SERIALNOREQUIRED,',
'      :P517_BULKDENSITY,',
'      :P517_REMARK,',
'      :P517_ITEMSPECIFICATIONNAME,',
'      :P517_HSNCODE,',
'      :P517_MULTIPLYINGFACTOR',
'From  Item e, ItemSpecification ee, ItemClass ic, ItemCategory icc, MeasuringUnit mu1, MeasuringUnit mu2, ItemNature inn',
'Where e.TNo = ee.TNo',
'  and e.ItemClassCode = ic.ItemClassCode(+)',
'  and e.ItemCategoryCode = icc.ItemCategoryCode(+)',
'  and e.MeasuringUnitCode1 = mu1.MeasuringUnitCode',
'  and e.MeasuringUnitCode2 = mu2.MeasuringUnitCode(+)',
'  and e.ItemNatureCode = inn.ItemNatureCode(+)',
'  and e.ItemCode LIKE NVL(:P517_PRODUCTCODE,''%'')',
'  and ee.ItemSpecificationCode LIKE NVL(:P517_ITEMSPECIFICATIONCODE,''%'')',
'  ;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2426892350953341
);
wwv_flow_imp.component_end;
end;
/
