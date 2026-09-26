prompt --application/pages/page_00092
begin
--   Manifest
--     PAGE: 00092
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
 p_id=>92
,p_name=>'Footer Account List'
,p_alias=>'FOOTER-ACCOUNT-LIST'
,p_step_title=>'Footer Account List'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(578531831511546635)
,p_plug_name=>'Footer Account List'
,p_static_id=>'footer-account-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       B.MODULENAME AS MODULECODE,',
'       C.FOOTERHEADNAME AS FOOTERHEADCODE,',
'       D.PARTYNAME AS ACCOUNTCODE,',
'       A.REMARK,',
'       E.PARTYNAME AS FOOTERACCOUNTCODE,',
'       GETCOMPANYNAME(A.COMPANYCODE) AS COMPANYCODE,',
'       GETPARTYNAME(A.PARTYCODE) AS PARTYCODE,',
'       GETITEMNAME(A.ITEMCODE) AS ITEMCODE,',
'       GETDOCTYPENAME(A.DOCTYPECODE) AS DOCTYPECODE,',
'       GETLOCATIONNAME(A.LOCATIONCODE) AS LOCATIONCODE,',
'       F.FOOTERNATURENAME AS FOOTERNATURECODE,',
'       A.AMOUNTPERCENT,',
'       GETPARTYNAME(A.ACCOUNTCODESECOND) AS ACCOUNTCODESECOND,',
'       A.FOOTERPERCENT,',
'       A.DESPATCHCATEGORYCODE,',
'       A.OTHERCODE,',
'       A.ACCOUNTCODETHIRD,',
'       A.TDSMASTERCODE,',
'       G.NATUREOFSUPPLYNAME AS NATUREOFSUPPLYCODE,',
'       H.TRANSACTIONTYPENAME AS TRANSACTIONTYPECODE,',
'       A.CREATOR,',
'       to_char(A.CREATIONTIME,''DD-MM-YYYY HH24:MI:SS'') CREATIONTIME',
'  from FOOTERACCOUNT A, MODULE B, FOOTERHEAD C, PARTY D, PARTY E, FOOTERNATURE F, NATUREOFSUPPLY G, TRANSACTIONTYPE H',
'  wHERE A.MODULECODE = B.MODULECODE(+)',
'  AND A.FOOTERHEADCODE = C.FOOTERHEADCODE(+)',
'  AND A.ACCOUNTCODE = D.PARTYCODE(+)',
'  AND A.FOOTERACCOUNTCODE = E.PARTYCODE(+)',
'  AND A.FOOTERNATURECODE = F.FOOTERNATURECODE(+)',
'  AND A.NATUREOFSUPPLYCODE = G.NATUREOFSUPPLYCODE(+)',
'  AND A.TRANSACTIONTYPECODE = H.TRANSACTIONTYPECODE(+)',
' -- where a.companycode =:Global_companycode'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Footer Account List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(578531904854546635)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:93:&APP_SESSION.::&DEBUG.:RP:P93_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>145687049412322861
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578533526063546654)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Account '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578537543580546655)
,p_db_column_name=>'ACCOUNTCODESECOND'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Account Code Second'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578539150039546656)
,p_db_column_name=>'ACCOUNTCODETHIRD'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Account Code Third'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578537086689546655)
,p_db_column_name=>'AMOUNTPERCENT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Amount Percent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578534749492546654)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Company '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(577999793989914577)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>32
,p_column_identifier=>'X'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578540751412546656)
,p_db_column_name=>'CREATOR'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578538337469546656)
,p_db_column_name=>'DESPATCHCATEGORYCODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Despatch Category '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578535922265546655)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578534277490546654)
,p_db_column_name=>'FOOTERACCOUNTCODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Footer Account '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578533098262546654)
,p_db_column_name=>'FOOTERHEADCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Footer Head '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578536686272546655)
,p_db_column_name=>'FOOTERNATURECODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Footer Nature '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578537860138546655)
,p_db_column_name=>'FOOTERPERCENT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Footer Percent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578535530740546655)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Item '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578536334036546655)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578532753428546654)
,p_db_column_name=>'MODULECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Module '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578539861782546656)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Nature Of Supply'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578538700650546656)
,p_db_column_name=>'OTHERCODE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Other Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578535140101546655)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Party '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578533868316546654)
,p_db_column_name=>'REMARK'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578539482343546656)
,p_db_column_name=>'TDSMASTERCODE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Tds Master Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578532315803546643)
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
 p_id=>wwv_flow_imp.id(578540300496546656)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Transaction Type '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(578551572558610905)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1457068'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULECODE:FOOTERHEADCODE:ACCOUNTCODE:REMARK:FOOTERACCOUNTCODE:COMPANYCODE:DOCTYPECODE:LOCATIONCODE:FOOTERNATURECODE:ACCOUNTCODESECOND:FOOTERPERCENT:TDSMASTERCODE:NATUREOFSUPPLYCODE:TRANSACTIONTYPECODE:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(578541654360546657)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(578531831511546635)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&APP_SESSION.::&DEBUG.:93::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(578550131498574809)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(578531831511546635)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577999909904914578)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(578541654360546657)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(578000045145914579)
,p_event_id=>wwv_flow_imp.id(577999909904914578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(578531831511546635)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(578541919218546657)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(578531831511546635)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(578542386141546658)
,p_event_id=>wwv_flow_imp.id(578541919218546657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(578531831511546635)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
