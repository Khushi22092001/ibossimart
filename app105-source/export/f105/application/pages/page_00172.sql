prompt --application/pages/page_00172
begin
--   Manifest
--     PAGE: 00172
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
 p_id=>172
,p_name=>'Terms & Condistion HeadList'
,p_alias=>'TERMS-CONDISTION-HEADLIST'
,p_step_title=>'Terms & Condistion HeadList'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609174684093545011)
,p_plug_name=>'Terms & Condistion HeadList'
,p_static_id=>'terms-condistion-headlist'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITIONHEADNAME,',
'       REMARK,',
'       CREATOR,',
'       SERIALNO,',
'       CREATIONTIME',
'  from TERMSANDCONDITIONHEAD'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Terms & Condistion HeadList'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(609174762385545011)
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
,p_detail_link=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP,:P173_TNO,P173_FORMSTATUS:\#TNO#\,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>168788417134618487
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609178037040545024)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>54
,p_column_identifier=>'H'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609176787130545023)
,p_db_column_name=>'CREATOR'
,p_display_order=>24
,p_column_identifier=>'E'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609175963567545023)
,p_db_column_name=>'REMARK'
,p_display_order=>14
,p_column_identifier=>'C'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609177163589545023)
,p_db_column_name=>'SERIALNO'
,p_display_order=>34
,p_column_identifier=>'F'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609175549380545023)
,p_db_column_name=>'TERMSANDCONDITIONHEADCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Terms and Condition Head'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609176401031545023)
,p_db_column_name=>'TERMSANDCONDITIONHEADNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Terms and Condition Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(609175234392545019)
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
 p_id=>wwv_flow_imp.id(609260360486797923)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1688741'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TERMSANDCONDITIONHEADCODE:TERMSANDCONDITIONHEADNAME:SERIALNO:CREATOR:CREATIONTIME:REMARK'
,p_sort_column_1=>'TERMSANDCONDITIONHEADCODE'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(609293624498934795)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(609174684093545011)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:173:P173_FORMSTATUS:NEWRECORD'
,p_button_css_classes=>'button-15'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(609293246117933540)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(609174684093545011)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp.component_end;
end;
/
