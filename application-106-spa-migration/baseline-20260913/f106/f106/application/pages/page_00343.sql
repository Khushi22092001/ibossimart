prompt --application/pages/page_00343
begin
--   Manifest
--     PAGE: 00343
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
 p_id=>343
,p_name=>'Employee Loan Receipt'
,p_alias=>'EMPLOYEE-LOAN-RECEIPT'
,p_step_title=>'Employee Loan Receipt'
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
 p_id=>wwv_flow_imp.id(688577660486903483)
,p_plug_name=>'Employee Loan Receipt'
,p_static_id=>'employee-loan-receipt'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	a.TNo,',
'    a.locationcode,',
'    a.companycode,',
'    getcompanyname(a.companycode) Company,',
'    getlocationname(a.locationcode) Location,',
'    a.Doctypecode,',
'    getDocTypeName(a.DocTypeCode) as DocType,',
'    a.Financialyearcode,',
'	a.LoanReceiptNo,',
'	a.LoanReceiptDate,',
'	substr(b.EmployeeName || '' ( '' || GetEmployeeEmployeeID(a.EmployeeCode, a.LoanReceiptDate) || '' )'', 1, 200) as EmployeeName,',
'	c.LoanTypeName,',
'	a.LoanReceiptAmount,',
'	d.PartyName as DrAccountName',
'From LoanReceipt a,',
'	Employee b, ',
'	LoanType c, ',
'	Party d',
'Where a.EmployeeCode = b.EmployeeCode(+)',
'	and a.LoanTypeCode = c.LoanTypeCode(+)',
'	and a.DrAccountCode = d.PartyCode(+)',
'	and GetLocationPrivilege(a.LocationCode, getmodulecodeforpageno(:APP_PAGE_ID), a.companycode) =''YES''',
'	and GetDoctypePrivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID), a.companycode) = ''YES''',
'',
'  ',
'  ',
'      -- filter',
'  and ( :P343_FROMDATE is null OR (a.LoanReceiptdate between :P343_FROMDATE and :P343_TODATE))',
'  and (:P343_COMPANY is null  OR (instr('':''||:P343_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0))',
'  and (:P343_LOCATION is null OR (instr('':''||:P343_LOCATION||'':'','':''||a.LocationCode||'':'') > 0))',
'  and (:P343_DOCTYPE is null  OR (instr('':''||:P343_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0))',
'  and (:P343_EMPLOYEE is null  OR (instr('':''||:P343_EMPLOYEE||'':'','':''||a.EMPLOYEECODE||'':'') > 0))',
' ',
'Order by ',
'         a.LoanReceiptDate DESC, a.LoanReceiptNo DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P343_COMPANY,P343_LOCATION,P343_FROMDATE,P343_TODATE,P343_DOCTYPE,P343_EMPLOYEE'
,p_prn_page_header=>'Cheque Receipt List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(688577786443903483)
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
,p_detail_link=>'f?p=&APP_ID.:344:&SESSION.::&DEBUG.:RP,344:P344_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>249592917244205499
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733483140718693)
,p_db_column_name=>'COMPANY'
,p_display_order=>110
,p_column_identifier=>'AU'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733344067718692)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>100
,p_column_identifier=>'AT'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733756695718696)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>140
,p_column_identifier=>'AX'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733690172718695)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>130
,p_column_identifier=>'AW'
,p_column_label=>'Doctypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483596248018483334)
,p_db_column_name=>'DRACCOUNTNAME'
,p_display_order=>80
,p_column_identifier=>'AR'
,p_column_label=>'Dr Account Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(572473782620814229)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>30
,p_column_identifier=>'AB'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733880329718697)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>150
,p_column_identifier=>'AY'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483596083316483333)
,p_db_column_name=>'LOANRECEIPTAMOUNT'
,p_display_order=>70
,p_column_identifier=>'AQ'
,p_column_label=>'Receipt Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483595930027483331)
,p_db_column_name=>'LOANRECEIPTDATE'
,p_display_order=>50
,p_column_identifier=>'AO'
,p_column_label=>'Loan Receipt Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483595834223483330)
,p_db_column_name=>'LOANRECEIPTNO'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Loan Receipt No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483596027178483332)
,p_db_column_name=>'LOANTYPENAME'
,p_display_order=>60
,p_column_identifier=>'AP'
,p_column_label=>'Loan Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733557110718694)
,p_db_column_name=>'LOCATION'
,p_display_order=>120
,p_column_identifier=>'AV'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214733223865718691)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>90
,p_column_identifier=>'AS'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(688582196949903506)
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
 p_id=>wwv_flow_imp.id(688584482880904826)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'321406'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANY:LOCATION:DOCTYPE:FINANCIALYEARCODE:LOANRECEIPTNO:LOANRECEIPTDATE:EMPLOYEENAME:LOANTYPENAME:LOANRECEIPTAMOUNT:DRACCOUNTNAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1120893343030772827)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(484577328593461757)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(688577660486903483)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:344:&SESSION.::&DEBUG.:344::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(484577763517461759)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(688577660486903483)
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
 p_id=>wwv_flow_imp.id(484571244156461691)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(1120893343030772827)
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
 p_id=>wwv_flow_imp.id(622833292112686988)
,p_name=>'P343_BIREPORTURL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1111244173727191911)
,p_name=>'P343_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
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
 p_id=>wwv_flow_imp.id(1111244295022191912)
,p_name=>'P343_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
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
,p_lov_cascade_parent_items=>'P343_COMPANY'
,p_ajax_items_to_submit=>'P343_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(572476129107814405)
,p_name=>'P343_EMPLOYEE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
,p_prompt=>'Employee'
,p_placeholder=>'Enter Employee Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.EmployeeName d,',
'a.EmployeeCode r',
'from Employee a',
'order by 1'))
,p_lov_cascade_parent_items=>'P343_COMPANY'
,p_ajax_items_to_submit=>'P343_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(1111338385977568750)
,p_name=>'P343_FROMDATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
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
 p_id=>wwv_flow_imp.id(614985879172101859)
,p_name=>'P343_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
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
 p_id=>wwv_flow_imp.id(688397227373252368)
,p_name=>'P343_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(623066973035267946)
,p_name=>'P343_TNO_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1111338803170568750)
,p_name=>'P343_TODATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1120893343030772827)
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
 p_id=>wwv_flow_imp.id(484579524854461845)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(484580020885461848)
,p_event_id=>wwv_flow_imp.id(484579524854461845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(484578584578461828)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(484579089972461840)
,p_event_id=>wwv_flow_imp.id(484578584578461828)
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
