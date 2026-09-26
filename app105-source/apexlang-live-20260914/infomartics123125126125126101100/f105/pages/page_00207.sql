prompt --application/pages/page_00207
begin
--   Manifest
--     PAGE: 00207
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
 p_id=>207
,p_name=>'Reverse Charge Register'
,p_alias=>'REVERSE-CHARGE-REGISTER'
,p_step_title=>'Reverse Charge Register'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(546606997576356360)
,p_plug_name=>'Reverse Charge List'
,p_static_id=>'reverse-charge-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       getcompanyname(COMPANYCODE) companyname,',
'       FINANCIALYEARCODE,',
'       getlocationname(LOCATIONCODE) locationname,',
'       getdoctypename(DOCTYPECODE) doctypename,',
'       getpartyname(PARTYCODE) partyname,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       REVERSECHARGEAMOUNT,',
'       REMARK,',
'       ITEMWISEFOOTER,',
'       REVERSECHARGEDATE,',
'       REVERSECHARGENO,',
'       TRANSACTIONTYPECODE,',
'       CREATIONTIME,',
'       CREATOR,',
'       MODULECODE,',
'       MODULETNO,',
'       NATUREOFSUPPLYCODE,',
'       FOOTERNATURECODE,',
'       SUPPLIERCODE,',
'       SUPPLIERNAME,',
'       REVERSECHARGEFOOTERNATURECODE',
'  from REVERSECHARGE'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Reverse Charge List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(546607074423356360)
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
,p_detail_link=>'f?p=&APP_ID.:208:&SESSION.::&DEBUG.:RP,208:P208_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>115163695032361126
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(433261462901690601)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>33
,p_column_identifier=>'X'
,p_column_label=>'Companyname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546613047075356375)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546613499908356375)
,p_db_column_name=>'CREATOR'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(433261725575690603)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>53
,p_column_identifier=>'Z'
,p_column_label=>'Doctypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546608288723356374)
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
 p_id=>wwv_flow_imp.id(546615047497356377)
,p_db_column_name=>'FOOTERNATURECODE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Footernaturecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546611471856356375)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Itemwisefooter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(433261623492690602)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>43
,p_column_identifier=>'Y'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546613826181356375)
,p_db_column_name=>'MODULECODE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546614262080356375)
,p_db_column_name=>'MODULETNO'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546614672126356376)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Natureofsupplycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(433261754693690604)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>63
,p_column_identifier=>'AA'
,p_column_label=>'Partyname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546611053446356374)
,p_db_column_name=>'REMARK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546610634006356374)
,p_db_column_name=>'REVERSECHARGEAMOUNT'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Reversechargeamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546611890240356375)
,p_db_column_name=>'REVERSECHARGEDATE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Reversechargedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546616271084356377)
,p_db_column_name=>'REVERSECHARGEFOOTERNATURECODE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Reversechargefooternaturecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546612268806356375)
,p_db_column_name=>'REVERSECHARGENO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Reversechargeno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546609900148356374)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Sumofamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546610230266356374)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Sumoffooteramount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546615482783356377)
,p_db_column_name=>'SUPPLIERCODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Suppliercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546615870365356377)
,p_db_column_name=>'SUPPLIERNAME'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Suppliername'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546607418912356369)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(546612648002356375)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Transactiontypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(546620206434360941)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'997540'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FINANCIALYEARCODE:COMPANYNAME:DOCTYPENAME:LOCATIONNAME:PARTYNAME:SUMOFAMOUNT:SUMOFFOOTERAMOUNT:REVERSECHARGEAMOUNT:REMARK:ITEMWISEFOOTER:REVERSECHARGEDATE:REVERSECHARGENO:TRANSACTIONTYPECODE:CREATIONTIME:CREATOR:MODULECODE:MODULETNO:NATUREOFSUPPLYCOD'
||'E:FOOTERNATURECODE:SUPPLIERCODE:SUPPLIERNAME:REVERSECHARGEFOOTERNATURECODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(441554608027413699)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(546606997576356360)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:208:&SESSION.::&DEBUG.:208:P208_FORMSTATUS:NEWRECORD'
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
 p_id=>wwv_flow_imp.id(441554956546414644)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(546606997576356360)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(546487978993360751)
,p_name=>'P207_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(546606997576356360)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441555163113416477)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441555480748416478)
,p_event_id=>wwv_flow_imp.id(441555163113416477)
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
