prompt --application/pages/page_00341
begin
--   Manifest
--     PAGE: 00341
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>341
,p_name=>'Leave Scheme List'
,p_alias=>'LEAVE-SCHEME-LIST'
,p_step_title=>'Leave Scheme List'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1164001627298571129)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(731685944754701785)
,p_plug_name=>'Leave Scheme'
,p_static_id=>'leave-scheme'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'LEAVESCHEME'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P341_COMPANY,P341_LOCATION,P341_FROMDATE,P341_TODATE,P341_DOCTYPE,P341_EMPLOYEE'
,p_prn_page_header=>'Cheque Receipt List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(731686070711701785)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:342:&SESSION.::&DEBUG.:RP,342:P342_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>292701201512003801
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143325136283127)
,p_db_column_name=>'APPLIEDONWARD'
,p_display_order=>50
,p_column_identifier=>'AV'
,p_column_label=>'Appliedonward'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143660496283130)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>80
,p_column_identifier=>'AY'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143712228283131)
,p_db_column_name=>'CREATOR'
,p_display_order=>90
,p_column_identifier=>'AZ'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143539060283129)
,p_db_column_name=>'INCASHMENTSALARYHEADCODE'
,p_display_order=>70
,p_column_identifier=>'AX'
,p_column_label=>'Incashmentsalaryheadcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483142967446283123)
,p_db_column_name=>'LEAVESCHEMECODE'
,p_display_order=>10
,p_column_identifier=>'AR'
,p_column_label=>'Leaveschemecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483142998191283124)
,p_db_column_name=>'LEAVESCHEMENAME'
,p_display_order=>20
,p_column_identifier=>'AS'
,p_column_label=>'Leaveschemename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143194694283126)
,p_db_column_name=>'REMARK'
,p_display_order=>40
,p_column_identifier=>'AU'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143149304283125)
,p_db_column_name=>'SHORTNAME'
,p_display_order=>30
,p_column_identifier=>'AT'
,p_column_label=>'Shortname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483143394943283128)
,p_db_column_name=>'STAFFTYPECODE'
,p_display_order=>60
,p_column_identifier=>'AW'
,p_column_label=>'Stafftypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(731690481217701808)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'K'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(731692767148703128)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'321406'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'APPLIEDONWARD:CREATIONTIME:CREATOR:INCASHMENTSALARYHEADCODE:LEAVESCHEMECODE:LEAVESCHEMENAME:REMARK:SHORTNAME:STAFFTYPECODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(483453305313431743)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(731685944754701785)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:342:&SESSION.::&DEBUG.:342::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(483453761617431743)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(731685944754701785)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(483448277437431733)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>7
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(665942732725485121)
,p_name=>'P341_BIREPORTURL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1154353614339990044)
,p_name=>'P341_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PFCHALLAN''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  ;'))
,p_cSize=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1154353735634990045)
,p_name=>'P341_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_prompt=>'Doc Type'
,p_placeholder=>'Enter Doc Type Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.DocTypeName d,',
'a.DocTypeCode r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c',
'where a.DocTypeCode = b.DocTypeCode',
'and b.tno = c.tno',
'and c.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'and (',
'     not exists(',
'         select ',
'             aa.TNo',
'         from ModulePrivilege aa, ModulePrivilegeDocType bb, BossUser cc',
'         where aa.tno = bb.tno',
'             and aa.BossUserCode = cc.BossUserCode',
'             and cc.LoginName = :GLOBAL_LOGINNAME',
'             and aa.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'             and aa.CompanyCode = :global_CompanyCode',
'     )',
'     or',
'     exists(',
'         select ',
'             aa.TNo',
'         from ModulePrivilege aa, ModulePrivilegeDocType bb, BossUser cc',
'         where aa.tno = bb.tno',
'             and aa.BossUserCode = cc.BossUserCode',
'             and cc.LoginName = :GLOBAL_LOGINNAME',
'             and aa.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'             and bb.DocTypeCode = a.DocTypeCode',
'             and aa.CompanyCode = :global_CompanyCode',
'     )',
')',
'order by a.DocTypeName'))
,p_lov_cascade_parent_items=>'P341_COMPANY'
,p_ajax_items_to_submit=>'P341_DOCTYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(615585569720612538)
,p_name=>'P341_EMPLOYEE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_prompt=>'Doc Type'
,p_placeholder=>'Enter Employee Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.EmployeeName d,',
'a.EmployeeCode r',
'from Employee a',
'order by 1'))
,p_lov_cascade_parent_items=>'P341_COMPANY'
,p_ajax_items_to_submit=>'P341_DOCTYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1154447826590366883)
,p_name=>'P341_FROMDATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_item_default=>'Trunc(Sysdate)-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658095319784899992)
,p_name=>'P341_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_prompt=>'Location'
,p_placeholder=>'Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	a.LocationName d,',
'	a.LocationCode r',
'From Location a, ModuleLocationDetail b , ModuleLocation c',
'Where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'	and c.CompanyCode = :GLOBAL_COMPANYCODE',
'	and (',
'		not exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'		or',
'		exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'			and bb.LocationCode = a.LocationCode',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'	)',
'Order by a.LocationName'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(731512282051050396)
,p_name=>'P341_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(666176413648066079)
,p_name=>'P341_TNO_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1154448243783366883)
,p_name=>'P341_TODATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1164001627298571129)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(483455655315431744)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(483456134697431744)
,p_event_id=>wwv_flow_imp.id(483455655315431744)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(483454761123431743)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(483455250103431744)
,p_event_id=>wwv_flow_imp.id(483454761123431743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
