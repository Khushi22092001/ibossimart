prompt --application/pages/page_00247
begin
--   Manifest
--     PAGE: 00247
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
 p_id=>247
,p_name=>'Additional Business Place List'
,p_alias=>'ADDITIONAL-BUSINESS-PLACE-LIST'
,p_step_title=>'Additional Business Place List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(304280287698407087)
,p_plug_name=>'Additional Business Place List'
,p_static_id=>'additional-business-place-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ca.TNO,',
'       ca.SNO,',
'       p.PARTYNAME,',
'       ca.CUSTOMERADDRESSCODE,',
'       ca.NAME,',
'       ca.ADDRESS1,',
'       ca.ADDRESS2,',
'       ca.ADDRESS3,',
'       ca.CITYCODE,',
'       ct.CITYNAME,',
'       ca.STATECODE,',
'       st.STATENAME,',
'       ca.PINCODE,',
'       ca.CONTACTNO,',
'       ca.EMAILID,',
'       ca.ADDRESSTYPECODE,',
'       ca.GSTINNO,',
'       ca.PANNO',
'  ',
'  FROM PARTY p ',
'  LEFT JOIN CUSTOMERADDRESS ca ON p.TNO = ca.TNO',
'  JOIN CITY ct ON ca.CITYCODE = ct.CITYCODE',
'  JOIN STATE st ON st.STATECODE = ca.STATECODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Additional Business Place List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(304280336659407087)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:248:&APP_SESSION.::&DEBUG.:RP:P248_SNO:\#SNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>77299448014721989
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304282356762407099)
,p_db_column_name=>'ADDRESS1'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Address Line 1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304282743443407099)
,p_db_column_name=>'ADDRESS2'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Address Line 2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304283120743407100)
,p_db_column_name=>'ADDRESS3'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Address Line 3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304285490361407100)
,p_db_column_name=>'ADDRESSTYPECODE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Address Type '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304283497689407100)
,p_db_column_name=>'CITYCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Citycode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62618137883017319)
,p_db_column_name=>'CITYNAME'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'City Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304284731800407100)
,p_db_column_name=>'CONTACTNO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Contact No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304281582653407099)
,p_db_column_name=>'CUSTOMERADDRESSCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Customeraddresscode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304285182462407100)
,p_db_column_name=>'EMAILID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Email ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304285957682407101)
,p_db_column_name=>'GSTINNO'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'GSTIN No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304281944879407099)
,p_db_column_name=>'NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304286381052407101)
,p_db_column_name=>'PANNO'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'PAN No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62618085679017318)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304284345052407100)
,p_db_column_name=>'PINCODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Pin Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304281120664407099)
,p_db_column_name=>'SNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304283981992407100)
,p_db_column_name=>'STATECODE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Statecode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62618295248017320)
,p_db_column_name=>'STATENAME'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'State Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304280714954407092)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Party'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(304288012319414852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'773072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYNAME:ADDRESS1:ADDRESS2:ADDRESS3:CITYNAME:STATENAME:PINCODE:CONTACTNO:EMAILID:ADDRESSTYPECODE:GSTINNO:PANNO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304286881197407101)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(304280287698407087)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:248:&APP_SESSION.::&DEBUG.:248::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(303764639983233722)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(304280287698407087)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(303764911712233725)
,p_name=>'P247_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(552910174839065424)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(303764715063233723)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(303764885289233724)
,p_event_id=>wwv_flow_imp.id(303764715063233723)
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
