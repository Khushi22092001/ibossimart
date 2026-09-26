prompt --application/pages/page_00115
begin
--   Manifest
--     PAGE: 00115
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
 p_id=>115
,p_name=>'Item Quality List'
,p_alias=>'ITEM-QUALITY-LIST'
,p_step_title=>'Item Quality List'
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
 p_id=>wwv_flow_imp.id(588884606095317622)
,p_plug_name=>'Item Quality List'
,p_static_id=>'item-quality-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       A.SNO,',
'       A.SERIALNO,',
'       A.QUALITYCODE,',
'       A.ITEMCODE,',
'       A.ITEMSPECIFICATIONCODE,',
'       A.MINIMUMVALUE,',
'       A.MAXIMUMVALUE,',
'       A.TOLERANCE,',
'       A.DEDUCTIONONFREIGHT,',
'       A.DEDUCTIONONBILL,',
'       A.DEDUCTIONVARIATIONTYPE,',
'       A.DEDUCTIONMETHODCODE,',
'       A.BONUSONBILL,',
'       A.MEASURINGUNITCODE,',
'       A.PARAMETERSPECIFICATION,',
'       A.CREATOR,',
'       to_char(A.CREATIONTIME,''DD-MON-YYYY HH24:MI:SS'') CREATIONTIME,',
'       A.REMARK',
'  from ITEMQUALITY A',
'  Order By A.TNO Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Item Quality List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(588884703438317622)
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
,p_detail_link=>'f?p=&APP_ID.:116:&APP_SESSION.::&DEBUG.:RP:P116_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>148498358187391098
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588890291579317630)
,p_db_column_name=>'BONUSONBILL'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Bonus On Bill'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587577959274017755)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>56
,p_column_identifier=>'T'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588891529543317631)
,p_db_column_name=>'CREATOR'
,p_display_order=>36
,p_column_identifier=>'Q'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588889860839317630)
,p_db_column_name=>'DEDUCTIONMETHODCODE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Deduction Method Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588889145187317627)
,p_db_column_name=>'DEDUCTIONONBILL'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Deduction On Bill'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588888720217317627)
,p_db_column_name=>'DEDUCTIONONFREIGHT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Deduction On Freight'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588889494430317630)
,p_db_column_name=>'DEDUCTIONVARIATIONTYPE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Deduction Variation Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588886715164317626)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Item Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588887064970317627)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Item Specification Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588887908104317627)
,p_db_column_name=>'MAXIMUMVALUE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Maximum Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588890693349317631)
,p_db_column_name=>'MEASURINGUNITCODE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Measuring Unit Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588887541438317627)
,p_db_column_name=>'MINIMUMVALUE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Minimum Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588891063416317631)
,p_db_column_name=>'PARAMETERSPECIFICATION'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Parameter Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588886284992317626)
,p_db_column_name=>'QUALITYCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Quality Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588892276235317631)
,p_db_column_name=>'REMARK'
,p_display_order=>26
,p_column_identifier=>'S'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588885937286317626)
,p_db_column_name=>'SERIALNO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588885465314317626)
,p_db_column_name=>'SNO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588885059946317624)
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
 p_id=>wwv_flow_imp.id(588888250080317627)
,p_db_column_name=>'TOLERANCE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Tolerance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(588942714452458638)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1485564'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:SNO:SERIALNO:QUALITYCODE:ITEMCODE:ITEMSPECIFICATIONCODE:MINIMUMVALUE:MAXIMUMVALUE:TOLERANCE:DEDUCTIONONFREIGHT:DEDUCTIONONBILL:DEDUCTIONVARIATIONTYPE:DEDUCTIONMETHODCODE:BONUSONBILL:MEASURINGUNITCODE:PARAMETERSPECIFICATION:REMARK:CREATOR:CREATION'
||'TIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(588892822196317631)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(588884606095317622)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:116:&APP_SESSION.::&DEBUG.:116::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(588899915168357932)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(588884606095317622)
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
 p_id=>wwv_flow_imp.id(587578054536017756)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(588892822196317631)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587578236283017757)
,p_event_id=>wwv_flow_imp.id(587578054536017756)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(588884606095317622)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(588893102625317631)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(588884606095317622)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(588893593534317631)
,p_event_id=>wwv_flow_imp.id(588893102625317631)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(588884606095317622)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
