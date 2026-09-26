prompt --application/pages/page_00284
begin
--   Manifest
--     PAGE: 00284
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
 p_id=>284
,p_name=>'Employee Gate Pass List'
,p_alias=>'EMPLOYEE-GATE-PASS-LIST'
,p_step_title=>'Employee Gate Pass List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(219219779842966370)
,p_plug_name=>'Employee Gate Pass List'
,p_static_id=>'employee-gate-pass-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       getcompanyname(COMPANYCODE) company,',
'       FINANCIALYEARCODE,',
'       getlocationname(LOCATIONCODE) location,',
'       getdoctypename(DOCTYPECODE) doctype,',
'       EMPLOYEEGATEPASSNO,',
'       EMPLOYEEGATEPASSDATE,',
'       BRANCHCODE,',
'       getemployeename(EMPLOYEECODE) employee,',
'       getemployeename(REPORTTOEMPLOYEECODE) reporttoemployee,',
'       PURPOSE,',
'       OUTPASSTYPECODE,',
'       COMMINGBACK,',
'       to_char(REQUESTEDOUTTIME,''DD-MM-YYYY HH:MI:SS'') REQUESTEDOUTTIME,',
'       to_char(REQUESTEDINTIME,''DD-MM-YYYY HH:MI:SS'') REQUESTEDINTIME,',
'       to_char(ACTUALOUTTIME,''DD-MM-YYYY HH:MI:SS'') ACTUALOUTTIME,',
'       to_char(ACTUALINTIME,''DD-MM-YYYY HH:MI:SS'') ACTUALINTIME,',
'       ',
'       REMARK,',
'       CREATOR,',
'       CREATIONTIME',
'  from EMPLOYEEGATEPASS'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Employee Gate Pass List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(219219899672966370)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:285:&APP_SESSION.::&DEBUG.:RP:P285_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>9679523472596001
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211376837649342501)
,p_db_column_name=>'ACTUALINTIME'
,p_display_order=>60
,p_column_identifier=>'AB'
,p_column_label=>'Actual In Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211376734188342500)
,p_db_column_name=>'ACTUALOUTTIME'
,p_display_order=>50
,p_column_identifier=>'AA'
,p_column_label=>'Actual Out Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219223390900966376)
,p_db_column_name=>'BRANCHCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Branchcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219225381218966376)
,p_db_column_name=>'COMMINGBACK'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Comming Back'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211376918866342502)
,p_db_column_name=>'COMPANY'
,p_display_order=>70
,p_column_identifier=>'AC'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219228197151966378)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219227786388966378)
,p_db_column_name=>'CREATOR'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211377178102342504)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>90
,p_column_identifier=>'AE'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211377256435342505)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219222979791966375)
,p_db_column_name=>'EMPLOYEEGATEPASSDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Employee Gate Pass Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219222664587966375)
,p_db_column_name=>'EMPLOYEEGATEPASSNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Employee Gate Pass No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219221426762966375)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211377090373342503)
,p_db_column_name=>'LOCATION'
,p_display_order=>80
,p_column_identifier=>'AD'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219225037926966376)
,p_db_column_name=>'OUTPASSTYPECODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Out Pass Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219224664269966376)
,p_db_column_name=>'PURPOSE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Purpose'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219227409364966377)
,p_db_column_name=>'REMARK'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211377349406342506)
,p_db_column_name=>'REPORTTOEMPLOYEE'
,p_display_order=>110
,p_column_identifier=>'AG'
,p_column_label=>'Report To Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211376612905342499)
,p_db_column_name=>'REQUESTEDINTIME'
,p_display_order=>40
,p_column_identifier=>'Z'
,p_column_label=>'Requested In Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211376510606342498)
,p_db_column_name=>'REQUESTEDOUTTIME'
,p_display_order=>30
,p_column_identifier=>'Y'
,p_column_label=>'Requested Out Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219220668518966374)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(219229065720967691)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'96887'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FINANCIALYEARCODE:EMPLOYEEGATEPASSNO:EMPLOYEEGATEPASSDATE:ACTUALINTIME:ACTUALOUTTIME:REQUESTEDINTIME:REQUESTEDOUTTIME:BRANCHCODE:PURPOSE:OUTPASSTYPECODE:COMMINGBACK:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219228699798966378)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(219219779842966370)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:285:&APP_SESSION.::&DEBUG.:285::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(218327138063845697)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(219219779842966370)
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
 p_id=>wwv_flow_imp.id(218327002557845696)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(219219779842966370)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(218326923962845695)
,p_name=>'P284_TNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211581444067507177)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211581841142507179)
,p_event_id=>wwv_flow_imp.id(211581444067507177)
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
