prompt --application/pages/page_00209
begin
--   Manifest
--     PAGE: 00209
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
 p_id=>209
,p_name=>'Item Account List'
,p_alias=>'ITEMACCOUNT-REPORT'
,p_step_title=>'Item Account List'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(458601199900634153)
,p_plug_name=>'Item Account List'
,p_static_id=>'item-account-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       MODULECODE,',
'       ITEMCODE,',
'       ACCOUNTCODE,',
'       REMARK,',
'       ITEMACCOUNTCODE,',
'       ITEMSPECIFICATIONCODE,',
'       COMPANYCODE,',
'       PARTYCODE,',
'       CREATOR,',
'       DESPATCHCATEGORYCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       PANDLACCOUNTCODE,',
'       INCOMEACCOUNTCODE,',
'       TRANSACTIONTYPECODE,',
'       NATUREOFSUPPLYCODE,',
'       CREATIONTIME',
'  from ITEMACCOUNT'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Itemaccount_report'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(458601302142634153)
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
,p_detail_link=>'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:211:P211_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>10136229111469805
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458602847614634204)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458604443517634206)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458608470106634207)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>55
,p_column_identifier=>'R'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458605222075634206)
,p_db_column_name=>'CREATOR'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458605618484634206)
,p_db_column_name=>'DESPATCHCATEGORYCODE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Dispatch Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458606443309634206)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458607255894634206)
,p_db_column_name=>'INCOMEACCOUNTCODE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Income Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458603619617634204)
,p_db_column_name=>'ITEMACCOUNTCODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Item Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458602467922634204)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458604069987634204)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Item Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458606006403634206)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458602023098634203)
,p_db_column_name=>'MODULECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458608023224634207)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>45
,p_column_identifier=>'Q'
,p_column_label=>'Nature of Supply'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458606792683634206)
,p_db_column_name=>'PANDLACCOUNTCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Pandl Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458604774881634206)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458603197806634204)
,p_db_column_name=>'REMARK'
,p_display_order=>65
,p_column_identifier=>'E'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458601642316634198)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(458607604968634207)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>35
,p_column_identifier=>'P'
,p_column_label=>'Transaction Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(458609437140637359)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'101444'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:MODULECODE:ITEMCODE:ACCOUNTCODE:REMARK:ITEMACCOUNTCODE:ITEMSPECIFICATIONCODE:COMPANYCODE:PARTYCODE:CREATOR:DESPATCHCATEGORYCODE:LOCATIONCODE:DOCTYPECODE:PANDLACCOUNTCODE:INCOMEACCOUNTCODE:TRANSACTIONTYPECODE:NATUREOFSUPPLYCODE:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(458983300835097064)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(458601199900634153)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(458983389946097065)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(458601199900634153)
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
wwv_flow_imp.component_end;
end;
/
