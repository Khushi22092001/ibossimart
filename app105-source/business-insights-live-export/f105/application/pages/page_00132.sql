prompt --application/pages/page_00132
begin
--   Manifest
--     PAGE: 00132
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
 p_id=>132
,p_name=>'Weighment  List'
,p_alias=>'WEIGHMENT-LIST'
,p_step_title=>'Weighment  List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(595188795335788960)
,p_plug_name=>'Weighment  List'
,p_static_id=>'weighment-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       WEIGHMENTNO,',
'       WEIGHMENTDATE,',
'       COMPANYVEHICLECODE,',
'       MATERIALINTNO,',
'       DESPATCHADVICETNO,',
'       PURCHASERETURNTNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       CHALLANGROSSWEIGHT,',
'       CHALLANNETWEIGHT,',
'       CHALLANTAREWEIGHT,',
'       FIRSTWEIGHT,',
'       FIRSTWEIGHTTIME,',
'       SECONDWEIGHT,',
'       SECONDWEIGHTTIME,',
'       NETWEIGHT,',
'       ACCEPTEDWEIGHT,',
'       REMARK,',
'       VEHICLENO,',
'       VEHICLETYPECODE,',
'       WEIGHBRIDGECODE,',
'       TRANSPORTERCODE,',
'       CREATOR,',
'       SECONDWEIGHBRIEDGECODE,',
'       FROMLOCATIONCODE,',
'       TOLOCATIONCODE,',
'       CREATORFORSECONDWEIGHT,',
'       ISCANCELED,',
'       CANCELREMARK,',
'       CREATIONTIME,',
'       CREATIONTIMEFORSECONDWEIGHT,',
'                   ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||Tno||'',''||''WeighMent''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" tit'
||'le="Action"></span</span></a>'' AS Print',
'',
'  from WEIGHMENT',
'  order by WEIGHMENTDATE desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Weighment  List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(595188939997788960)
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
,p_detail_link=>'f?p=&APP_ID.:133:&APP_SESSION.::&DEBUG.:RP:P133_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>154802594746862436
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595197743284788969)
,p_db_column_name=>'ACCEPTEDWEIGHT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Accepted Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595202508850788970)
,p_db_column_name=>'CANCELREMARK'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Cancel Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595194479875788965)
,p_db_column_name=>'CHALLANGROSSWEIGHT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Challan Gross Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595194940547788966)
,p_db_column_name=>'CHALLANNETWEIGHT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Challan Net Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595195270101788966)
,p_db_column_name=>'CHALLANTAREWEIGHT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Challan Tare Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595189714102788963)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595192123088788964)
,p_db_column_name=>'COMPANYVEHICLECODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Company Vehicle'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595202887847788971)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595203322816788971)
,p_db_column_name=>'CREATIONTIMEFORSECONDWEIGHT'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Creation Time For Second Weight'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595200092268788970)
,p_db_column_name=>'CREATOR'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595201661256788970)
,p_db_column_name=>'CREATORFORSECONDWEIGHT'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Creator for Second Weight'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595192865987788964)
,p_db_column_name=>'DESPATCHADVICETNO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Despatch Advice No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595190848654788964)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595190130487788963)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595195684742788966)
,p_db_column_name=>'FIRSTWEIGHT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'First Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595196049256788966)
,p_db_column_name=>'FIRSTWEIGHTTIME'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'First Weight Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595200845777788970)
,p_db_column_name=>'FROMLOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'From Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595202106327788970)
,p_db_column_name=>'ISCANCELED'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Is Canceled'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595193692971788965)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595194089490788965)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Item Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595190543398788964)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595192487593788964)
,p_db_column_name=>'MATERIALINTNO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Materialin No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595197322706788969)
,p_db_column_name=>'NETWEIGHT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Net Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(303333824578845535)
,p_db_column_name=>'PRINT'
,p_display_order=>46
,p_column_identifier=>'AK'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595193331368788965)
,p_db_column_name=>'PURCHASERETURNTNO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Purchase Return No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595198098627788969)
,p_db_column_name=>'REMARK'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595200521944788970)
,p_db_column_name=>'SECONDWEIGHBRIEDGECODE'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Second Weigh Briedge Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595196492766788966)
,p_db_column_name=>'SECONDWEIGHT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Second Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595196848573788967)
,p_db_column_name=>'SECONDWEIGHTTIME'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Second Weight Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595189313253788961)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595201337403788970)
,p_db_column_name=>'TOLOCATIONCODE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'To Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595199681546788969)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595198487562788969)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Vehicle No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595198859965788969)
,p_db_column_name=>'VEHICLETYPECODE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Vehicle type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595199284493788969)
,p_db_column_name=>'WEIGHBRIDGECODE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Weigh Bridge Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595191674171788964)
,p_db_column_name=>'WEIGHMENTDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Weighment Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595191334484788964)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Weighment No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(595207184516838591)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1548209'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:COMPANYCODE:LOCATIONCODE:DOCTYPECODE:WEIGHMENTNO:WEIGHMENTDATE:COMPANYVEHICLECODE:MATERIALINTNO:DESPATCHADVICETNO:PURCHASERETURNTNO:ITEMCODE:ITEMSPECIFICATIONCODE:CHALLANGROSSWEIGHT:CHALLANNETWEIGHT:CHALLANTAREWEIGHT:FIRSTWEIGHT:FIRSTWEIGHTTIME'
||':SECONDWEIGHT:SECONDWEIGHTTIME:NETWEIGHT:ACCEPTEDWEIGHT:REMARK:VEHICLENO:VEHICLETYPECODE:TRANSPORTERCODE:ISCANCELED:CANCELREMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595203839157788971)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(595188795335788960)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:133:&APP_SESSION.::&DEBUG.:133::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(594403700217218465)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(595188795335788960)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447962639596502304)
,p_name=>'P132_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(444158894204553210)
,p_name=>'Hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444159001042553211)
,p_event_id=>wwv_flow_imp.id(444158894204553210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
