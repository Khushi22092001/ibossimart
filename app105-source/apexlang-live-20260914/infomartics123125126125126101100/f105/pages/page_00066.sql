prompt --application/pages/page_00066
begin
--   Manifest
--     PAGE: 00066
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
 p_id=>66
,p_name=>'Account Opening List'
,p_alias=>'ACCOUNT-OPENING-LIST'
,p_step_title=>'Account Opening List'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(878952046850884426)
,p_plug_name=>'Account Opening List'
,p_static_id=>'account-opening-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
' a.tno                   ,',
'  a.locationcode          ,',
'  b.locationname ,',
'  c.doctypename ,',
'  a.doctypecode           ,',
'  a.accountopeningno      ,',
'  a.accountopeningdate    ,',
'  a.companycode           ,',
'  a.financialyearcode     ,',
'  a.accountcode           ,',
'  Getpartyname(a.AccountCode) as AccountName,',
'  case when a.openingamount < 0 then',
'  a.openingamount*(-1)',
'  else',
'  0',
'  end as OpeningDr,',
'  case when a.openingamount >= 0 then',
'  a.openingamount',
'  else',
'  0',
'  end as OpeningCr         ,',
'  a.remark                ,',
'  a.jobtypecode           ,',
'  a.itemcode              ,',
'  getItemName(a.itemcode) as ItemName,',
'  a.billno                ,',
'  a.billdate              ,',
'  a.billamount            ,',
'  a.excisedoctypecode     ,',
'  a.paidamount            ,',
'  a.deductedamount        ,',
'  a.despatchcategorycode  ,',
'  Getpartyname(a.agentcode) as AgentCode,',
'  a.billduedate           ,',
'  a.billquantity1         ,',
'  a.creator               ,',
'  to_char(a.creationtime,''DD-MM-YYYY HH:MI:SS'') as "Creation Time"         ,',
'  a.creationdate          ',
'from accountopening a , location b , doctype c',
'where a.locationcode = b.locationcode',
'and a.doctypecode = c.doctypecode'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Account Opening List'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(878952179403884427)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:67:P67_TNO:#TNO#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>446107323961660653
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947537851031098)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>'Account Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947601795031099)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'Account Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947239561031095)
,p_db_column_name=>'ACCOUNTOPENINGDATE'
,p_display_order=>120
,p_column_identifier=>'O'
,p_column_label=>'Opening Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947156589031094)
,p_db_column_name=>'ACCOUNTOPENINGNO'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Opening No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948911766031112)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>290
,p_column_identifier=>'AF'
,p_column_label=>'Agent Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948435804031107)
,p_db_column_name=>'BILLAMOUNT'
,p_display_order=>240
,p_column_identifier=>'AA'
,p_column_label=>'Bill Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948332242031106)
,p_db_column_name=>'BILLDATE'
,p_display_order=>230
,p_column_identifier=>'Z'
,p_column_label=>'Bill Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948985715031113)
,p_db_column_name=>'BILLDUEDATE'
,p_display_order=>300
,p_column_identifier=>'AG'
,p_column_label=>'Bill Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948260279031105)
,p_db_column_name=>'BILLNO'
,p_display_order=>220
,p_column_identifier=>'Y'
,p_column_label=>'Bill No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824949114921031114)
,p_db_column_name=>'BILLQUANTITY1'
,p_display_order=>310
,p_column_identifier=>'AH'
,p_column_label=>'Bill Quantity1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947364973031096)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>130
,p_column_identifier=>'P'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824949245303031115)
,p_db_column_name=>'CREATIONDATE'
,p_display_order=>320
,p_column_identifier=>'AI'
,p_column_label=>'Creation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(878952815755884434)
,p_db_column_name=>'CREATOR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(848750736951771373)
,p_db_column_name=>'Creation Time'
,p_display_order=>350
,p_column_identifier=>'AL'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948747178031110)
,p_db_column_name=>'DEDUCTEDAMOUNT'
,p_display_order=>270
,p_column_identifier=>'AD'
,p_column_label=>'Deducted Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948803691031111)
,p_db_column_name=>'DESPATCHCATEGORYCODE'
,p_display_order=>280
,p_column_identifier=>'AE'
,p_column_label=>'Despatch Category Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947020750031093)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Doc Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(848750508036771371)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>340
,p_column_identifier=>'AK'
,p_column_label=>'Doc Type Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948498904031108)
,p_db_column_name=>'EXCISEDOCTYPECODE'
,p_display_order=>250
,p_column_identifier=>'AB'
,p_column_label=>'Excise Doc Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947449097031097)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>140
,p_column_identifier=>'Q'
,p_column_label=>'Financial Year Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947915039031102)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>190
,p_column_identifier=>'V'
,p_column_label=>'Item Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948118538031104)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>210
,p_column_identifier=>'X'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824947843810031101)
,p_db_column_name=>'JOBTYPECODE'
,p_display_order=>180
,p_column_identifier=>'U'
,p_column_label=>'Job Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824946954341031092)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Location Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(848750427473771370)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>330
,p_column_identifier=>'AJ'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(857997101358645167)
,p_db_column_name=>'OPENINGCR'
,p_display_order=>370
,p_column_identifier=>'AN'
,p_column_label=>'Opening-Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(857997050896645166)
,p_db_column_name=>'OPENINGDR'
,p_display_order=>360
,p_column_identifier=>'AM'
,p_column_label=>'Opening-Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(824948636618031109)
,p_db_column_name=>'PAIDAMOUNT'
,p_display_order=>260
,p_column_identifier=>'AC'
,p_column_label=>'Paid Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(878952684185884432)
,p_db_column_name=>'REMARK'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(878952527885884431)
,p_db_column_name=>'TNO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(879419836993999787)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'402567'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATIONNAME:DOCTYPENAME:ACCOUNTOPENINGDATE:ACCOUNTOPENINGNO:ACCOUNTNAME:OPENINGDR:OPENINGCR:AGENTCODE:BILLNO:BILLDATE:BILLAMOUNT:BILLDUEDATE:ITEMNAME:CREATOR:Creation Time:REMARK'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573216531883458756)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(878952046850884426)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:67::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(572358170394149201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(878952046850884426)
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
 p_id=>wwv_flow_imp.id(572358301615149202)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(573216531883458756)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(572358418681149203)
,p_event_id=>wwv_flow_imp.id(572358301615149202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878952046850884426)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
