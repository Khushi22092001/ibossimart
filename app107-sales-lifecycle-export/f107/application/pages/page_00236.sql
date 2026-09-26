prompt --application/pages/page_00236
begin
--   Manifest
--     PAGE: 00236
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
 p_id=>236
,p_name=>'GSTR3B'
,p_alias=>'GSTR3B'
,p_step_title=>'GSTR3B'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.title { color: blue; font-size: 1rem ;font-weight: bold;};',
'',
'.text { color: black; font-size: .75rem ;};',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460499077976419271)
,p_plug_name=>'3.1 Details of Outward Supplies  and inward Supplies liable to reverse charge (other than those coverd by  table 3.1.1)'
,p_static_id=>'3-1-details-of-outward-supplies-and-inward-supplies-liable-to-reverse-charge-other-than-those-coverd-by-table'
,p_region_name=>'inline1'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>150
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326650165726504769)
,p_plug_name=>'3.2 Detail of Inter-State Supplies made to Unregistered Persons, Composition taxable Person UTN holders.'
,p_static_id=>'3-2-detail-of-inter-state-supplies-made-to-unregistered-persons-composition-taxable-person-utn-holders'
,p_region_name=>'inline2'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>160
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326651189202504779)
,p_plug_name=>'4  Eligible ITC '
,p_static_id=>'4-eligible-itc'
,p_region_name=>'inline3'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>170
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326651856608504786)
,p_plug_name=>'5.  Values of exempt , Nil Rated and NON GST Inward Supplies '
,p_static_id=>'5-values-of-exempt-nil-rated-and-non-gst-inward-supplies'
,p_region_name=>'inline4'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>180
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457780032572379883)
,p_plug_name=>'GSTR3B'
,p_static_id=>'gstr3b'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457780894323379891)
,p_plug_name=>'GSTR3OUTWARD'
,p_static_id=>'gstr3outward'
,p_parent_plug_id=>wwv_flow_imp.id(460499077976419271)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''(a) Outward taxable Supplies (Other ',
'      than Zero rated ,nill rated and  ',
'      Exempted'' as "Nature of Supplier",',
'       :P236_2A as "Total Taxable Value ",',
'       :P236_3A as "Integrated Tax",',
'       :P236_4A as "Cenral Tax",',
'       :P236_5A as "State / UT Tax",',
'       :P236_6A as "Cess"',
'from Dual',
'union all',
'select ''(b) Outward taxable Supplies (Zero ',
'       rated and exempted )'' as "Nature of Supplier",',
'       NULL as "Total Taxable Value ",',
'      NULL as "Integrated Tax",',
'       NULL as "Cenral Tax",',
'       NULL as "State / UT Tax",',
'       NULL as "Cess"',
'from Dual',
'union all',
'select ''(c) Other outward supplies (Nil rated ',
'      exempted ) '' as "Nature of Supplier",',
'        :P236_2C as "Total Taxable Value ",',
'       :P236_3C as "Integrated Tax",',
'       :P236_4C as "Cenral Tax",',
'       :P236_5C as "State / UT Tax",',
'       :P236_6C as "Cess"',
'from Dual',
'union all',
'select ''(d) Inward supplies (liable to reverse ',
'      charge) '' as "Nature of Supplier",',
'       :P236_2D as "Total Taxable Value ",',
'       :P236_3A_3 as "Integrated Tax",',
'       :P236_4a_3 as "Cenral Tax",',
'       :P236_5A_3 as "State / UT Tax",',
'       :P236_6a_3 as "Cess"',
'from Dual',
'union all',
'select ''(e) Non - GST outward supplier  '' as "Nature of Supplier",',
'       :P236_2E as "Total Taxable Value ",',
'       :P236_3E as "Integrated Tax",',
'       :P236_4E as "Cenral Tax",',
'       :P236_5E as "State / UT Tax",',
'       :P236_6E as "Cess"',
'from Dual;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P236_2A,P236_3A,P236_4A,P236_5A,P236_6A,P236_2C,P236_3C,P236_4C'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(460499315341419274)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>241478735309582541
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460499748319419278)
,p_db_column_name=>'Cenral Tax'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Cenral Tax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460500005579419280)
,p_db_column_name=>'Cess'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cess'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460499700124419277)
,p_db_column_name=>'Integrated Tax'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Integrated Tax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460499493998419275)
,p_db_column_name=>'Nature of Supplier'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nature Of Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460499900271419279)
,p_db_column_name=>'State / UT Tax'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'State &#x2F; Ut Tax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460499588912419276)
,p_db_column_name=>'Total Taxable Value '
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Total Taxable Value '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(460652906224090103)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'703826'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Nature of Supplier:Total Taxable Value :Integrated Tax:Cenral Tax:State / UT Tax:Cess'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326650414565504771)
,p_plug_name=>'Inter State'
,p_static_id=>'inter-state'
,p_parent_plug_id=>wwv_flow_imp.id(326650165726504769)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null , null as "Place of Supply (State / UT )" ,',
'        null as "Total Taxable value" ,',
'        null as "Amount of Integrated Tax "',
'from dual',
'/*',
'union all',
'select ''(1)'' as "(1)" ,',
'        ''(2)'' as "Place of Supply (State / UT )" ,',
'        ''(3)'' as "Total Taxable value" ,',
'        ''(4)'' as "Amount of Integrated Tax "',
'from dual',
'*/',
'union all',
'select ',
'    ''Supply Made To  '' || gettaxregistrationtypename(c.partycode) as Taxregistrationname ,',
'    getstatename(e.gststatecode) as statename ,',
'    sum(a.taxableamount) as Taxableamount ,',
'    sum((nvl(a.igst,0) + nvl(a.cgst,0) + nvl(a.sgst,0) + nvl(a.cess,0) ) )as taxamount',
'from ',
'    gstr3boutward a , party c , state e , natureofsupply ns ',
'where',
'     a.partycode = c.partycode ',
'     and c.officestatecode = e.statecode(+)',
'     and c.taxregistrationtypecode =''URD'' ',
'     and a.creator = user ',
'     and a.natureofsupplycode = ns.natureofsupplycode ',
'     and c.taxregistrationtypecode in (''URD'',''COMPOSIT'',''UIN'') ',
'     AND A.COMPANYCODE = :P236_COMPANYCODE ',
'group by   getstatename(e.gststatecode)  ,  ns.natureofsupplyname , gettaxregistrationtypename(c.partycode) '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Inter State'
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
 p_id=>wwv_flow_imp.id(326650450959504772)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>107629870927668039
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326651121557504778)
,p_db_column_name=>'Amount of Integrated Tax '
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Amount Of Integrated Tax '
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326650578392504773)
,p_db_column_name=>'NULL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326650659314504774)
,p_db_column_name=>'Place of Supply (State / UT )'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Place Of Supply (state &#x2F; Ut )'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326651030793504777)
,p_db_column_name=>'Total Taxable value'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Total Taxable Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(326696683145544978)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'894869'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NULL:Place of Supply (State / UT ):Amount of Integrated Tax :Total Taxable value'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326651310505504780)
,p_plug_name=>'Inter State'
,p_static_id=>'inter-state-2'
,p_parent_plug_id=>wwv_flow_imp.id(326651189202504779)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    ''(A)  ITC Available (whether in full or part)'' as a1,',
'    null as a2,',
'    null as a3,',
'    null as a4,',
'    null as a5    ',
'from dual ',
'union all',
'select ',
'    ''(1)  Import of goods '' as a1,',
'    :P236_3A_1 as a2,',
'    :P236_4A_1 as a3,',
'    :P236_5A_1 as a4,',
'    :P236_6A_1 as a5    ',
'from dual ',
'union all',
'select ',
'    ''(2)  Import of services '' as a1,',
'    :P236_3A_2 as a2,',
'    :P236_4A_2 as a3,',
'    :P236_5A_2 as a4,',
'    :P236_6A_2 as a5    ',
'from dual ',
'union all',
'select ',
'    ''(3)  Inward supplies liable to reverse    ',
'        charge ( Other than 1 & 2 '' as a1,',
'    :P236_3A_3 as a2,',
'    :P236_4A_3 as a3,',
'    :P236_5A_3 as a4,',
'    :P236_6A_3 as a5    ',
'from dual ',
'union all',
'select ',
'    ''(4)  Inward supplies from ISD '' as a1,',
'    null as a2,',
'    null as a3,',
'    null as a4,',
'    null as a5    ',
'from dual ',
'union all',
'select ',
'    ''(5)  All other ITC '' as a1,',
'    :P236_3A_5 as a2,',
'    :P236_4A_5 as a3,',
'    :P236_5A_5 as a4,',
'    :P236_6A_5 as a5    ',
'from dual ',
'union all',
'select ',
'    ''Total'' as a1,',
'    :P236_TOTAL3A as a2,',
'    :P236_TOTAL4A as a3,',
'    :P236_TOTAL5A as a4,',
'    :P236_TOTAL6A as a5    ',
'from dual '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Inter State'
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
 p_id=>wwv_flow_imp.id(326651432274504781)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>107630852242668048
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704400763617246)
,p_db_column_name=>'A1'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Detail'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704449404617247)
,p_db_column_name=>'A2'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Integrated Tax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704567022617248)
,p_db_column_name=>'A3'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Central Tax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704665389617249)
,p_db_column_name=>'A4'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'State / UT Tax'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704828084617250)
,p_db_column_name=>'A5'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Cess'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(326711177932621393)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'895014'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'A1:A2:A3:A4:A5'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326651997317504787)
,p_plug_name=>'Inter State'
,p_static_id=>'inter-state-3'
,p_parent_plug_id=>wwv_flow_imp.id(326651856608504786)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''From a Supplier under composition scheme , Exempt and Nil Rated'' as a1,',
'    :P236_5_1 as a2 , ',
'    :P236_5_2 as a3 ',
'from dual'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Inter State'
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
 p_id=>wwv_flow_imp.id(326652121180504788)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>107631541148668055
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704064657617243)
,p_db_column_name=>'A1'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Nature of Supplies'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704202290617244)
,p_db_column_name=>'A2'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Inter State Supplies'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(326704251222617245)
,p_db_column_name=>'A3'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Intra State Supplies'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(326711714026621396)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'895019'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'A1:A2:A3'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326649306871504760)
,p_plug_name=>'3.2'
,p_static_id=>'page_plug'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:t-Form--standardPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''3.2 Detail of Inter-State Supplies made to Unregistered Persons, Composition taxable Person UTN holders.'' as Title,',
'rpad(''Place of Supply (State / UT )'',45,unistr(''\00a0''))||''Total Taxable value''||''    ''||''Amount of Integrated Tax'' as Subtitle,',
'rpad(nvl(:P236_3A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||rpad(nvl(:P236_4A,0),50,unistr(''\00a0\00a0\00a0'')) ||',
'rpad(''State Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Cess Tax'' as Body,',
'rpad(nvl(:P236_5A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||nvl(:P236_6A,0) as secondarybody,',
'''u-color-7'' As CARD_COLOR',
'from dual'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P236_2A,P236_3A,P236_4A,P236_5A,P236_6A'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(228336591787120694)
,p_region_id=>wwv_flow_imp.id(326649306871504760)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_title_css_classes=>'&CARD_COLOR!ATTR.'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SUBTITLE'
,p_sub_title_css_classes=>'text'
,p_body_adv_formatting=>false
,p_body_column_name=>'BODY'
,p_body_css_classes=>'text'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARYBODY'
,p_second_body_css_classes=>'text'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(228337108670120694)
,p_card_id=>wwv_flow_imp.id(228336591787120694)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'javascript:openModal(''inline2'')'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326649557318504763)
,p_plug_name=>'4'
,p_static_id=>'page_plug-2'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:t-Form--standardPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>130
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''4. Eligible ITC '' as Title,',
'rpad(''Integrated Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Central Tax'' as Subtitle,',
'rpad(nvl(:P236_3A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||rpad(nvl(:P236_4A,0),50,unistr(''\00a0\00a0\00a0'')) ||',
'rpad(''State Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Cess Tax'' as Body,',
'rpad(nvl(:P236_5A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||nvl(:P236_6A,0) as secondarybody,',
'''u-color-7'' As CARD_COLOR',
'from dual'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P236_2A,P236_3A,P236_4A,P236_5A,P236_6A'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(228338171518120695)
,p_region_id=>wwv_flow_imp.id(326649557318504763)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_title_css_classes=>'&CARD_COLOR!ATTR.'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SUBTITLE'
,p_sub_title_css_classes=>'text'
,p_body_adv_formatting=>false
,p_body_column_name=>'BODY'
,p_body_css_classes=>'text'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARYBODY'
,p_second_body_css_classes=>'text'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(228338646009120695)
,p_card_id=>wwv_flow_imp.id(228338171518120695)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'javascript:openModal(''inline3'')'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(326649892921504766)
,p_plug_name=>'5'
,p_static_id=>'page_plug-3'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:t-Form--standardPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>140
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''5.Values of exempt , Nil Rated and NON GST Inward Supplies'' as Title,',
'''Nature Of Supplies''||'' ''||'' ''||'' ''||''Inter State Suplpies'' as Subtitle,',
'null as Body,',
'null as secondarybody,',
'''u-color-7'' As CARD_COLOR',
'from dual'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P236_2A,P236_3A,P236_4A,P236_5A,P236_6A'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(228339604663120696)
,p_region_id=>wwv_flow_imp.id(326649892921504766)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_title_css_classes=>'&CARD_COLOR!ATTR.'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SUBTITLE'
,p_sub_title_css_classes=>'text'
,p_body_adv_formatting=>false
,p_body_column_name=>'BODY'
,p_body_css_classes=>'text'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARYBODY'
,p_second_body_css_classes=>'text'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(228340162815120696)
,p_card_id=>wwv_flow_imp.id(228339604663120696)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'javascript:openModal(''inline4'')'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460498187629419262)
,p_plug_name=>'3.1'
,p_static_id=>'page_plug-4'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:t-Form--standardPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''3.1 Tax on outward and Reverse charge inward supply'' as Title,',
'rpad(''Integrated Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Central Tax'' as Subtitle,',
'rpad(nvl(:P236_3A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||rpad(nvl(:P236_4A,0),50,unistr(''\00a0\00a0\00a0'')) ||',
'rpad(''State Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Cess Tax'' as Body,',
'rpad(nvl(:P236_5A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||nvl(:P236_6A,0) as secondarybody,',
'''u-color-7'' As CARD_COLOR',
'from dual'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P236_2A,P236_3A,P236_4A,P236_5A,P236_6A'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(228364214430120711)
,p_region_id=>wwv_flow_imp.id(460498187629419262)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_title_css_classes=>'&CARD_COLOR!ATTR.'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SUBTITLE'
,p_sub_title_css_classes=>'text'
,p_body_adv_formatting=>false
,p_body_column_name=>'BODY'
,p_body_css_classes=>'text'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARYBODY'
,p_second_body_css_classes=>'text'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(228364740743120711)
,p_card_id=>wwv_flow_imp.id(228364214430120711)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'javascript:openModal(''inline1'')'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460501048209419291)
,p_plug_name=>'3.1.1'
,p_static_id=>'page_plug-5'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:t-Form--standardPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''3.1.1 Supplies notified under sec9(5) of the CGST Act, 2017'' as Title,',
'rpad(''Integrated Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Central Tax'' as Subtitle,',
'rpad(nvl(:P236_3A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||rpad(nvl(:P236_4A,0),50,unistr(''\00a0\00a0\00a0'')) ||',
'rpad(''State Tax'',45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0''))||''Cess Tax'' as Body,',
'rpad(nvl(:P236_5A,0),45,unistr(''\00a0\00a0\00a0\00a0\00a0\00a0'')) ||nvl(:P236_6A,0) as secondarybody,',
'''u-color-7'' As CARD_COLOR',
'from dual'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P236_2A,P236_3A,P236_4A,P236_5A,P236_6A'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(228368971480120714)
,p_region_id=>wwv_flow_imp.id(460501048209419291)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_title_css_classes=>'&CARD_COLOR!ATTR.'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SUBTITLE'
,p_sub_title_css_classes=>'text'
,p_body_adv_formatting=>false
,p_body_column_name=>'BODY'
,p_body_css_classes=>'text'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARYBODY'
,p_second_body_css_classes=>'text'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(228369461478120714)
,p_card_id=>wwv_flow_imp.id(228368971480120714)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'javascript:openModal(''inline1'')'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457781802313379900)
,p_plug_name=>'PageItems'
,p_static_id=>'pageitems'
,p_parent_plug_id=>wwv_flow_imp.id(457780032572379883)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(228348932286120702)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(457780032572379883)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457796746968379911)
,p_name=>'P236_2A'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'2a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323922064602893678)
,p_name=>'P236_2A_1'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_item_default=>'a. Outward Taxable Supplies ( other )'
,p_prompt=>'2a_1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460514903851419291)
,p_name=>'P236_2C'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460516237923419304)
,p_name=>'P236_2D'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460715188020367678)
,p_name=>'P236_2E'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457796793159379912)
,p_name=>'P236_3A'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'3a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323922216434893680)
,p_name=>'P236_3A_1'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_item_default=>'a. Outward Taxable Supplies ( other )'
,p_prompt=>'3a_1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323923078228893688)
,p_name=>'P236_3A_2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'3a 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460714461904367670)
,p_name=>'P236_3A_3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323923835695893696)
,p_name=>'P236_3A_5'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'3a 5'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460514975713419292)
,p_name=>'P236_3C'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460715283831367679)
,p_name=>'P236_3E'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457796960106379913)
,p_name=>'P236_4A'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'3a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323922450275893682)
,p_name=>'P236_4A_1'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'4a 1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323923306758893690)
,p_name=>'P236_4A_2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'4a 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460714611577367672)
,p_name=>'P236_4A_3'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323924042354893698)
,p_name=>'P236_4A_5'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'4a 5'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460515109855419293)
,p_name=>'P236_4C'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323921889709893676)
,p_name=>'P236_4DCCESS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_item_default=>'a. Outward Taxable Supplies ( other )'
,p_prompt=>'4dccess'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323921675476893674)
,p_name=>'P236_4DCCGST'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_item_default=>'a. Outward Taxable Supplies ( other )'
,p_prompt=>'4dccgst'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460714343855367669)
,p_name=>'P236_4DCIGST'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460514068696419283)
,p_name=>'P236_4DCSGST'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_item_default=>'a. Outward Taxable Supplies ( other )'
,p_prompt=>'4dcsgst'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460715379705367680)
,p_name=>'P236_4E'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457796981421379914)
,p_name=>'P236_5A'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'3a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323922698257893684)
,p_name=>'P236_5A_1'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'5a 1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323923450690893692)
,p_name=>'P236_5A_2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'5a 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460714809843367674)
,p_name=>'P236_5A_3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326662294774504751)
,p_name=>'P236_5A_5'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'5a 5'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460515254614419294)
,p_name=>'P236_5C'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460715564385367681)
,p_name=>'P236_5E'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326663436025504763)
,p_name=>'P236_5_1'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'5 1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326663627790504765)
,p_name=>'P236_5_2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'5 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457797115780379915)
,p_name=>'P236_6A'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'3a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323922891367893686)
,p_name=>'P236_6A_1'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'6a 1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323923683543893694)
,p_name=>'P236_6A_2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'6a 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460715144168367677)
,p_name=>'P236_6A_3'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326662451806504753)
,p_name=>'P236_6A_5'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'6a 5'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460515278560419295)
,p_name=>'P236_6C'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460715611941367682)
,p_name=>'P236_6E'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457793834886379898)
,p_name=>'P236_COMPANYCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457780032572379883)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT COMPANYNAME, COMPANYCODE FROM COMPANY'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457793400418379893)
,p_name=>'P236_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(457780032572379883)
,p_prompt=>'Fromdate'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457793949772379899)
,p_name=>'P236_STATECODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(457780032572379883)
,p_prompt=>'State'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select statename,statecode from state order by 1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457793421131379894)
,p_name=>'P236_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(457780032572379883)
,p_prompt=>'Fromdate'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326662615568504755)
,p_name=>'P236_TOTAL3A'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'Total3a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326662896895504757)
,p_name=>'P236_TOTAL4A'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'Total4a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326663020235504759)
,p_name=>'P236_TOTAL5A'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'Total5a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326663216138504761)
,p_name=>'P236_TOTAL6A'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(457781802313379900)
,p_prompt=>'Total6a'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(228370645625120715)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(228348932286120702)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228380626187120719)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P236_COMPANYCODE,P236_STATECODE,P236_FROMDATE,P236_TODATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '        delete from gstr3binward where creator = v(''APP_USER'');',
    ' 		delete from gstr3boutward where creator = v(''APP_USER'');',
    ' 		commit;',
    ' 		',
    ' 	  getoutwardtaxablesupply(:P236_fromdate , :P236_todate, :P236_companycode , :p236_STATECODE) ;',
    ' 	  getinwardtaxablesupply(:P236_fromdate , :P236_todate, :P236_companycode , :p236_STATECODE) ;',
    '  	COMMIT;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228380099316120719)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>510
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228379179416120718)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>490
,p_execute_on_page_init=>'N'
,p_name=>'set value 5_1'
,p_static_id=>'set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select SUM(A.TAXABLEAMOUNT) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode(+)',
    '  				and a.natureofsupplycode in (''6'',''2'',''3'',''4'') ',
    '  			--	and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTERSTATE''',
    '  			--	and a.taxregistrationtypecode =''RD'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228379662376120719)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>500
,p_execute_on_page_init=>'N'
,p_name=>'set value 5_2'
,p_static_id=>'set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select SUM(A.TAXABLEAMOUNT)',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode(+)',
    '  				and a.natureofsupplycode in (''6'',''2'',''3'',''4'') ',
    '  		--		and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND NVL(A.CGST,0) + NVL(A.SGST,0)  = 0 ',
    '  					--and a.taxregistrationtypecode =''RD'' ',
    '  					AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228381148924120719)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set value 2A'
,p_static_id=>'set-value-2a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_2A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.taxableamount) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode = ''1''',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228376596008120717)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>310
,p_execute_on_page_init=>'N'
,p_name=>'set value 2a_1'
,p_static_id=>'set-value-2a-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_2A_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.taxableamount) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228383613713120720)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'set value 2C'
,p_static_id=>'set-value-2c'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_2C'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.taxableamount)',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode in (''2'',''3'') ',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228386159366120721)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>180
,p_execute_on_page_init=>'N'
,p_name=>'set value 2D'
,p_static_id=>'set-value-2d'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_2D'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '					sum(a.ReverseChargeAmount - nvl(b.LessForTaxable, 0) )',
    '							',
    '			from ReverseCharge a, Location L, (',
    '					select ',
    '							aa.TNo,',
    '							sum(aa.FooterValue) as LessForTaxable',
    '					from ReverseChargeDetailFooter aa, FooterHead bb ',
    '					where aa.FooterHeadCode = bb.FooterHeadCode',
    '							and bb.LessFromBillAmountForTaxable = ''YES''',
    '					group by aa.tno',
    '			) b, Voucher v',
    '			where a.LocationCode = L.LocationCode',
    '					and a.TNo = b.TNO(+)',
    '					and a.TNo = v.ModuleTNo',
    '					and a.ReverseChargeDate between :P236_FROMDATE and :P236_TODATE',
    '					and a.CompanyCode = :P236_COMPANYCODE',
    '					and (',
    '								NVL(GETMYPARAMETERVALUE(''GSTRETURNSSTATEWISE''),''NO'')  =''NO''',
    '								OR',
    '								l.STATECODE =:P236_STATECODE',
    '						)',
    '			;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228372142818120716)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>220
,p_execute_on_page_init=>'N'
,p_name=>'set value 2e'
,p_static_id=>'set-value-2e'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_2E'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.taxableamount) ',
    '  		from ',
    '  				Gstr3boutward a ',
    '  		where',
    '  				a.natureofsupplycode in (''4'') ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  					and a.creator = V(''APP_USER'');')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228381645411120719)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set value 3A'
,p_static_id=>'set-value-3a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.igst) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode = ''1''',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228386581301120721)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>190
,p_execute_on_page_init=>'N'
,p_name=>'set value 3A_3'
,p_static_id=>'set-value-3a-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3A_5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '					sum(b.FooterValue )',
    '							',
    '			from ReverseCharge a, Location L, (',
    '					select ',
    '							aa.TNo,',
    '							sum(aa.FooterValue) as FooterValue',
    '					from ReverseChargeDetailFooter aa, FooterHead bb ',
    '					where aa.FooterHeadCode = bb.FooterHeadCode',
    '							and aa.FooterHeadCode = ''.IGST.''',
    '					group by aa.tno',
    '			) b, Voucher v',
    '			where a.LocationCode = L.LocationCode',
    '					and a.TNo = b.TNO(+)',
    '					and a.TNo = v.ModuleTNo',
    '					and a.ReverseChargeDate between :P236_FROMDATE and :P236_TODATE',
    '					and a.CompanyCode = :P236_COMPANYCODE',
    '					and (',
    '								NVL(GETMYPARAMETERVALUE(''GSTRETURNSSTATEWISE''),''NO'')  =''NO''',
    '		                        OR',
    '								l.STATECODE = :P236_STATECODE',
    '						)',
    '			',
    '		')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228387132505120721)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>320
,p_execute_on_page_init=>'N'
,p_name=>'set value 3a_1'
,p_static_id=>'set-value-3a-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3A_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.IGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  		--		and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.MODULECODE  IN (''PBPASS'') ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228389175809120722)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>360
,p_execute_on_page_init=>'N'
,p_name=>'set value 3a_2'
,p_static_id=>'set-value-3a-4'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3A_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.IGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  		--		and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.MODULECODE  IN (''JBPASS'') ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228391082903120723)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>400
,p_execute_on_page_init=>'N'
,p_name=>'set value 3a_5'
,p_static_id=>'set-value-3a-5'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3A_5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.IGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTERSTATE''',
    '  				AND A.COMPANYCODE = :P_COMPANYCODE ',
    '  			 and natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228384175050120720)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'set value 3C'
,p_static_id=>'set-value-3c'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3C'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.igst) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode in (''2'',''3'') ',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228372676069120716)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>230
,p_execute_on_page_init=>'N'
,p_name=>'set value 3e'
,p_static_id=>'set-value-3e'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_3E'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.IGST ) ',
    '  		from ',
    '  				Gstr3boutward a ',
    '  		where',
    '  				a.natureofsupplycode in (''4'') ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  					and a.creator = V(''APP_USER'');')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228382094389120719)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set value 4A'
,p_static_id=>'set-value-4a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.cgst) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode = ''1''',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228371103383120715)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>200
,p_execute_on_page_init=>'N'
,p_name=>'set value 4A_3'
,p_static_id=>'set-value-4a-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4A_3'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '					sum(b.FooterValue )',
    '							',
    '			from ReverseCharge a, Location L, (',
    '					select ',
    '							aa.TNo,',
    '							sum(aa.FooterValue) as FooterValue',
    '					from ReverseChargeDetailFooter aa, FooterHead bb ',
    '					where aa.FooterHeadCode = bb.FooterHeadCode',
    '							and aa.FooterHeadCode = ''.CGST.''',
    '					group by aa.tno',
    '			) b, Voucher v',
    '			where a.LocationCode = L.LocationCode',
    '					and a.TNo = b.TNO(+)',
    '					and a.TNo = v.ModuleTNo',
    '					and a.ReverseChargeDate between :P236_FROMDATE and :P236_TODATE',
    '					and a.CompanyCode = :P236_COMPANYCODE',
    '					and (',
    '								NVL(GETMYPARAMETERVALUE(''GSTRETURNSSTATEWISE''),''NO'')  =''NO''',
    '								OR',
    '								l.STATECODE = :P236_STATECODE',
    '						)',
    '			;',
    '			',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228387581924120722)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>330
,p_execute_on_page_init=>'N'
,p_name=>'set value 4a_1'
,p_static_id=>'set-value-4a-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4A_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.CGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  			--	and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  					AND A.MODULECODE = ''PBPASS'' ',
    '  				AND A.COMPANYCODE = :P_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228389607846120722)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>370
,p_execute_on_page_init=>'N'
,p_name=>'set value 4a_2'
,p_static_id=>'set-value-4a-4'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4A_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '		select sum(a.CGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  			--	and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.MODULECODE IN (''JBPASS'') ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228391599191120723)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>410
,p_execute_on_page_init=>'N'
,p_name=>'set value 4a_5'
,p_static_id=>'set-value-4a-5'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4A_5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.CGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  			--	AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  						AND A.TRANSACTIONTYPECODE !=''IMPORT''',
    '  				 and a.natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228384667273120720)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'set value 4C'
,p_static_id=>'set-value-4c'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4C'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.cgst) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode in (''2'',''3'') ',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228376151042120717)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>300
,p_execute_on_page_init=>'N'
,p_name=>'set value 4DCCESS'
,p_static_id=>'set-value-4dccess'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4DCCESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.CESS) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator =USER  ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and NVL(c.ITCELIGIBILITYCODE,''ABC'') != ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  			 and natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228375646688120717)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>290
,p_execute_on_page_init=>'N'
,p_name=>'set value 4DCCGST'
,p_static_id=>'set-value-4dccgst'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4DCCGST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.CGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator =USER  ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and NVL(c.ITCELIGIBILITYCODE,''ABC'') != ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  			 and natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228374679462120717)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>270
,p_execute_on_page_init=>'N'
,p_name=>'set value 4DCIGST'
,p_static_id=>'set-value-4dcigst'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4DCIGST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.IGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator =USER  ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and NVL(c.ITCELIGIBILITYCODE,''ABC'') != ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  			 and natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228375135434120717)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>280
,p_execute_on_page_init=>'N'
,p_name=>'set value 4DCSGST'
,p_static_id=>'set-value-4dcsgst'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4DCSGST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.SGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator =USER  ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and NVL(c.ITCELIGIBILITYCODE,''ABC'') != ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  			 and natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;',
    '  		')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228373173899120716)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>240
,p_execute_on_page_init=>'N'
,p_name=>'set value 4e'
,p_static_id=>'set-value-4e'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_4E'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.CGST )',
    '  		from ',
    '  				Gstr3boutward a ',
    '  		where',
    '  				a.natureofsupplycode in (''4'') ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  					and a.creator = V(''APP_USER'');')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228382609153120720)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set value 5A'
,p_static_id=>'set-value-5a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.sgst) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode = ''1''',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228371610931120715)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>210
,p_execute_on_page_init=>'N'
,p_name=>'set value 5A_3'
,p_static_id=>'set-value-5a-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5A_3'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '					sum(b.FooterValue )',
    '							',
    '			from ReverseCharge a, Location L, (',
    '					select ',
    '							aa.TNo,',
    '							sum(aa.FooterValue) as FooterValue',
    '					from ReverseChargeDetailFooter aa, FooterHead bb ',
    '					where aa.FooterHeadCode = bb.FooterHeadCode',
    '							and aa.FooterHeadCode = ''.SGST.''',
    '					group by aa.tno',
    '			) b, Voucher v',
    '			where a.LocationCode = L.LocationCode',
    '					and a.TNo = b.TNO(+)',
    '					and a.TNo = v.ModuleTNo',
    '					and a.ReverseChargeDate between :P236_FROMDATE and :P236_TODATE',
    '					and a.CompanyCode = :P236_COMPANYCODE',
    '					and (',
    '								NVL(GETMYPARAMETERVALUE(''GSTRETURNSSTATEWISE''),''NO'')  =''NO''',
    '								OR',
    '								l.STATECODE = :P236_STATECODE',
    '						)',
    '			;',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228388124078120722)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>340
,p_execute_on_page_init=>'N'
,p_name=>'set value 5a_1'
,p_static_id=>'set-value-5a-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5A_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.SGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				--and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  					and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  					AND A.MODULECODE = ''PBPASS'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228390156791120723)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>380
,p_execute_on_page_init=>'N'
,p_name=>'set value 5a_2'
,p_static_id=>'set-value-5a-4'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5A_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.SGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				--and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  					and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.MODULECODE IN (''JBPASS'' ) ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228392163813120723)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>420
,p_execute_on_page_init=>'N'
,p_name=>'set value 5a_5'
,p_static_id=>'set-value-5a-5'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5A_5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.SGST) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  			--	AND A.TRANSACTIONTYPECODE =''INTRASTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  						AND A.TRANSACTIONTYPECODE !=''IMPORT''',
    '  				 and a.natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228385082259120721)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_name=>'set value  5C'
,p_static_id=>'set-value-5c'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5C'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.sgst) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode in (''2'',''3'') ',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228373607250120716)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>250
,p_execute_on_page_init=>'N'
,p_name=>'set value 5e'
,p_static_id=>'set-value-5e'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_5E'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.SGST )',
    '  		from ',
    '  				Gstr3boutward a ',
    '  		where',
    '  				a.natureofsupplycode in (''4'') ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  					and a.creator = V(''APP_USER'');')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228383173379120720)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set value 6A'
,p_static_id=>'set-value-6a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_6A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.cess) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode = ''1''',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228388594819120722)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>350
,p_execute_on_page_init=>'N'
,p_name=>'set value 6a_1'
,p_static_id=>'set-value-6a-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_6A_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.CESS)',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  			--	and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  					and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.MODULECODE = ''PBPASS'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228390635171120723)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>390
,p_execute_on_page_init=>'N'
,p_name=>'set value 6a_2'
,p_static_id=>'set-value-6a-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_6A_2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	select sum(a.CESS) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  			--	and c.ITCELIGIBILITYCODE = ''INELIGIBLE''',
    '  					and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  				AND A.TRANSACTIONTYPECODE =''IMPORT''',
    '  				AND A.MODULECODE IN (''JBPASS'') ',
    '  				AND A.COMPANYCODE = :P_COMPANYCODE ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228392602683120724)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>430
,p_execute_on_page_init=>'N'
,p_name=>'set value 6a_5'
,p_static_id=>'set-value-6a-4'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_6A_5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.CESS) ',
    '  		from ',
    '  				Gstr3Binward a , footernature c ',
    '  		where',
    '  		',
    '  				 a.creator = user ',
    '  				and a.footernaturecode = c.footernaturecode',
    '  				and c.ITCELIGIBILITYCODE = ''INPUTS''',
    '  			--	AND A.TRANSACTIONTYPECODE =''INTERSTATE''',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE ',
    '  						AND A.TRANSACTIONTYPECODE !=''IMPORT''',
    '  		',
    '  				 and natureofsupplycode not in (''6'',''2'',''3'',''4'') ',
    '  		;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228385607232120721)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_name=>'set value 6C'
,p_static_id=>'set-value-6c'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_6C'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.cess) ',
    '	from ',
    '			Gstr3boutward a ',
    '	where',
    '	a.natureofsupplycode in (''2'',''3'') ',
    '	and a.taxregistrationtypecode =''RD'' ',
    '	and a.creator = V(''APP_USER'')',
    '	AND A.COMPANYCODE = :P236_COMPANYCODE',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228374110786120716)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>260
,p_execute_on_page_init=>'N'
,p_name=>'set value 6e'
,p_static_id=>'set-value-6e'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_6E'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(a.CESS )',
    '  		from ',
    '  				Gstr3boutward a ',
    '  		where',
    '  				a.natureofsupplycode in (''4'') ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				and a.taxregistrationtypecode =''RD'' ',
    '  				AND A.COMPANYCODE = :P236_COMPANYCODE',
    '  					and a.creator = V(''APP_USER'');')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228377123881120717)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>450
,p_execute_on_page_init=>'N'
,p_name=>'set value total3a'
,p_static_id=>'set-value-total3a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_TOTAL3A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_COMPANYCODE,P236_FROMDATE,P236_TODATE,P236_STATECODE,P236_3A_1,P236_3A_2,P236_3A_3,P236_3A_5',
  'plsql_expression', 'nvl(:P236_3A_1,0) +  nvl(:P236_3A_2,0)+ nvl(:P236_3A_3,0)  + nvl(:P236_3A_5,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228377615823120718)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>460
,p_execute_on_page_init=>'N'
,p_name=>'set value total4a'
,p_static_id=>'set-value-total4a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_TOTAL4A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_4A_1,P236_4A_2,P236_4A_3,P236_4A_5',
  'plsql_expression', 'nvl(:P236_4A_1,0) +  nvl(:P236_4A_2,0)+ nvl(:P236_4A_3,0)  + nvl(:P236_4A_5,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228378126499120718)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>470
,p_execute_on_page_init=>'N'
,p_name=>'set value total5a'
,p_static_id=>'set-value-total5a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_TOTAL5A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_5A_1,P236_5A_2,P236_5A_3,P236_5A_5',
  'plsql_expression', 'nvl(:P236_5A_1,0) +  nvl(:P236_5A_2,0)+ nvl(:P236_5A_3,0)  + nvl(:P236_5A_5,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(228378646744120718)
,p_event_id=>wwv_flow_imp.id(228370645625120715)
,p_event_result=>'TRUE'
,p_action_sequence=>480
,p_execute_on_page_init=>'N'
,p_name=>'set value total6a'
,p_static_id=>'set-value-total6a'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236_TOTAL6A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P236_5A_1,P236_5A_2,P236_5A_3,P236_5A_5',
  'plsql_expression', 'nvl(:P236_6A_1,0) +  nvl(:P236_6A_2,0)+ nvl(:P236_6A_3,0)  + nvl(:P236_6A_5,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(228370246903120714)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert Values in Page Items'
,p_static_id=>'insert-values-in-page-items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'--- Prepare Data',
'',
'        delete from gstr3binward where creator = v(''APP_USER'');',
' 		delete from gstr3boutward where creator = v(''APP_USER'');',
' 		commit;',
' 		',
' 	  getoutwardtaxablesupply(:P236_fromdate , :P236_todate, :P236_companycode , :p236_STATECODE) ;',
' 	  getinwardtaxablesupply(:P236_fromdate , :P236_todate, :P236_companycode , :p236_STATECODE) ;',
'  	COMMIT;',
'----',
'',
'    select sum(a.taxableamount) into :P236_2A',
'  		from ',
'  				Gstr3boutward a ',
'  		where',
'  				a.natureofsupplycode = ''1''',
'  				and a.taxregistrationtypecode =''RD'' ',
'  				and a.creator = V(''APP_USER'') ',
'  				AND A.COMPANYCODE = :Global_companyCode',
'  		;',
'',
'     select sum(a.igst) into :P236_3A',
'  		from ',
'  				Gstr3boutward a ',
'  		where',
'  				a.natureofsupplycode = ''1''',
'  				and a.taxregistrationtypecode =''RD'' ',
'  				and a.creator = V(''APP_USER'') ',
'  				AND A.COMPANYCODE = :Global_companyCode ;',
'     ',
'     select sum(a.CGST) into :P236_4A',
'  		from ',
'  				Gstr3boutward a ',
'  		where',
'  				a.natureofsupplycode = ''1''',
'  				and a.taxregistrationtypecode =''RD'' ',
'  				AND A.COMPANYCODE = :GLOBAL_COMPANYCODE ',
'  					and a.creator = V(''APP_USER'')',
'  		;',
'',
'',
'      select sum(a.SGST) into :P236_5A',
'  		from ',
'  				Gstr3boutward a ',
'  		where',
'  				a.natureofsupplycode = ''1''',
'  				and a.taxregistrationtypecode =''RD'' ',
'  				AND A.COMPANYCODE = :global_COMPANYCODE ',
'  					and a.creator = V(''APP_USER'')',
'  		;',
'  		',
'     select sum(a.cess) into :P236_6A',
'  		from ',
'  				Gstr3boutward a ',
'  		where',
'  				a.natureofsupplycode = ''1''',
'  				and a.taxregistrationtypecode =''RD'' ',
'  				AND A.COMPANYCODE = :global_COMPANYCODE',
'  					and a.creator = V(''APP_USER'')',
'  		;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9349666871283981
);
wwv_flow_imp.component_end;
end;
/
