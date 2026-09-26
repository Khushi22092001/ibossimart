prompt --application/pages/page_00515
begin
--   Manifest
--     PAGE: 00515
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
 p_id=>515
,p_name=>'Supplier Dashboard'
,p_alias=>'SUPPLIER-DASHBOARD'
,p_step_title=>'Supplier Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.customerinfo{background-color:#CAF279;}',
'.monthsale{background-color:#F7C872;height: 349px;}',
'.mytext{font-weight: 500;}',
'.cardtitle{font-size: 40px;font-family:''Calibri'';font-weight: 900;margin-bottom: 20px;}',
'.cardsubtitle{font-size: 20px;font-family:''Calibri'';font-weight: 700;}',
'.color1{background-color: #f84f4f;}',
'.color2{background-color: #b51212}',
'.color3{background-color: #12b5b5}',
'.color4{background-color: #75d9d9}',
'.color5{background-color: #cf98e0}',
'.color6{background-color: #a9e098}',
'.color7{background-color: #fbb1c7}',
'.color8{background-color: #b1fbe5}',
'.color9{background-color: #f48956}',
'.color10{background-color:#fefe69}',
'.region1{background-color: gainsboro;height: 240px;}',
'.hiddenscroll{overflow: hidden;}',
'.reportheight{height: 350px; overflow: auto !important;}',
'.h2+h3{margin-top: 0em;}',
'.caption{font-weight: bold;}',
'.captionvalue{font-weight: normal;}',
'.t-Form-label{padding-top: 0px;padding-bottom: 0px;margin-top: 0px;margin-bottom: 0px;padding-right: 2px;margin-right:2px;width: 100%;}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447463884603712180)
,p_plug_name=>'12 Months Purchase'
,p_static_id=>'12-months-purchase'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_css_classes=>'monthsale'
,p_region_template_options=>'#DEFAULT#:i-h320:t-Region--textContent:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433815146306943274)
,p_region_id=>wwv_flow_imp.id(447463884603712180)
,p_chart_type=>'bar'
,p_width=>'600'
,p_height=>'270'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433817437144943275)
,p_chart_id=>wwv_flow_imp.id(433815146306943274)
,p_static_id=>'purchase'
,p_seq=>10
,p_name=>'Purchase'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.Months,',
'    x.Amount,',
'    x.partyCode',
'From ',
'(select ',
'       partycode,',
'       TO_CHAR(PBPASSDATE,''MON-YYYY'')AS MONTHS,',
'       TO_CHAR(PBPASSDATE,''YYYYMM'')AS MONTHSYY,',
'       SUM(TOTALAMOUNT) AMOUNT',
'  from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'  WHERE PARTYCODE = :P515_SUPPLIERCODE',
'  GROUP BY TO_CHAR(PBPASSDATE,''MON-YYYY''),partycode,TO_CHAR(PBPASSDATE,''YYYYMM'')',
'  Order by TO_CHAR(PBPASSDATE,''YYYYMM'')',
')x',
'Where rownum<= 12'))
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTHS'
,p_color=>'#d03333'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_MONTH:&PARTYCODE.,&MONTHS.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433815661849943275)
,p_chart_id=>wwv_flow_imp.id(433815146306943274)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433816184792943275)
,p_chart_id=>wwv_flow_imp.id(433815146306943274)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433816826534943275)
,p_chart_id=>wwv_flow_imp.id(433815146306943274)
,p_static_id=>'y-2'
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447558644295080179)
,p_plug_name=>'12 Months Purchase'
,p_static_id=>'12-months-purchase-2'
,p_region_name=>'MYID'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_css_classes=>'reportheight '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select',
'     level',
'From dual',
'connect by level <= 13',
'*/',
'Select',
'     x.Months,',
'     x.Amount',
'From (',
'select ',
'       TO_CHAR(PBPASSDATE,''MON-YYYY'')AS MONTHS,',
'       TO_CHAR(PBPASSDATE,''YYYYMM'')AS MONTHSYY,',
'       SUM(TOTALAMOUNT) AMOUNT',
'  from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'  WHERE PARTYCODE = :P515_SUPPLIERCODE',
'  GROUP BY TO_CHAR(PBPASSDATE,''MON-YYYY''),TO_CHAR(PBPASSDATE,''YYYYMM'')',
'  ORDER BY TO_CHAR(PBPASSDATE,''YYYYMM'')',
'  )x',
'Where rownum <= 12',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: 0em;">12 Months Purchase</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(447558907777080182)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>16115528386084948
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442055649082935548)
,p_db_column_name=>'AMOUNT'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442055192567935548)
,p_db_column_name=>'MONTHS'
,p_display_order=>10
,p_column_identifier=>'D'
,p_column_label=>'Months'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(447788292548906565)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65768'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MONTHS:AMOUNT'
,p_sum_columns_on_break=>'AMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447543329790867392)
,p_plug_name=>'Active PO'
,p_static_id=>'active-po'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.PartyCode,',
'      Case When nvl(count(a.TNo),0) = 0 then ''-''',
'           else to_Char(nvl(count(a.TNo),0))',
'      end as ActivePO,',
'      Case when nvl(round(sum(a.TotalAmount),2),0) = 0 then ''-''',
'           else to_Char(nvl(round(sum(a.TotalAmount),2),0))',
'      end as Amount',
'From  D_SUPPLIER_360VIEW_ACTIVEPURCHASEORDERS a',
'Where a.PartyCode = :P515_SUPPLIERCODE',
'Group by a.PartyCode'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433818421488943276)
,p_region_id=>wwv_flow_imp.id(447543329790867392)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color4'
,p_title_adv_formatting=>false
,p_title_column_name=>'ACTIVEPO'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Active PO </H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433818976414943276)
,p_card_id=>wwv_flow_imp.id(433818421488943276)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:543:&SESSION.::&DEBUG.:543:P543_SUPPLIERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448132792566068390)
,p_plug_name=>'Ageing Summary'
,p_static_id=>'ageing-summary'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select COMPANYCODE,',
'       COMPANYNAME,',
'       LOCATIONCODE,',
'       LOCATIONNAME,',
'       DOCTYPECODE,',
'       DOCTYPENAME,',
'       PARTYCODE,',
'       PARTYNAME,',
'       COUNT0030,',
'       VALUE0030,',
'       COUNT3160,',
'       VALUE3160,',
'       COUNT6190,',
'       VALUE6190,',
'       COUNT91120,',
'       VALUE91120,',
'       COUNT121150,',
'       VALUE121150,',
'       COUNT151180,',
'       VALUE151180,',
'       ABOVE180COUNT,',
'       ABOVE180VALUE',
'  from D_SUPPLIER_360VIEW_ACTIVEPBPASSAGEWISE',
'  Where PartyCode = :P515_SUPPLIERCODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: 0em;">Ageing Summary</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(448133000953068392)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>16689621562073158
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442078876609935562)
,p_db_column_name=>'ABOVE180COUNT'
,p_display_order=>210
,p_column_identifier=>'AQ'
,p_column_label=>'Above_180'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_FROMAGE,P542_TOAGE:#PARTYCODE#,181,9999999999999'
,p_column_linktext=>'#ABOVE180COUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442079212849935562)
,p_db_column_name=>'ABOVE180VALUE'
,p_display_order=>220
,p_column_identifier=>'AR'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#ABOVE180VALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442070887714935559)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Companycode'
,p_column_html_expression=>'<div style="display:block; width:80px">#COMPANYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442071205802935559)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Companyname'
,p_column_html_expression=>'<div style="display:block; width:200px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442074078525935560)
,p_db_column_name=>'COUNT0030'
,p_display_order=>90
,p_column_identifier=>'AE'
,p_column_label=>'0_30'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_FROMAGE,P542_TOAGE,P542_SUPPLIERCODE:0,30,#PARTYCODE#'
,p_column_linktext=>'#COUNT0030#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442077247145935561)
,p_db_column_name=>'COUNT121150'
,p_display_order=>170
,p_column_identifier=>'AM'
,p_column_label=>'121_150'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_FROMAGE,P542_TOAGE:#PARTYCODE#,121,150'
,p_column_linktext=>'#COUNT121150#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442078084250935561)
,p_db_column_name=>'COUNT151180'
,p_display_order=>190
,p_column_identifier=>'AO'
,p_column_label=>'151_180'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_FROMAGE,P542_TOAGE:#PARTYCODE#,151,180'
,p_column_linktext=>'#COUNT151180#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442074825434935560)
,p_db_column_name=>'COUNT3160'
,p_display_order=>110
,p_column_identifier=>'AG'
,p_column_label=>'31_60'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_FROMAGE,P542_TOAGE:#PARTYCODE#,31,60'
,p_column_linktext=>'#COUNT3160#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442075591836935561)
,p_db_column_name=>'COUNT6190'
,p_display_order=>130
,p_column_identifier=>'AI'
,p_column_label=>'61_90'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_FROMAGE,P542_TOAGE:#PARTYCODE#,61,90'
,p_column_linktext=>'#COUNT6190#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442076429551935561)
,p_db_column_name=>'COUNT91120'
,p_display_order=>150
,p_column_identifier=>'AK'
,p_column_label=>'91_120'
,p_column_link=>'f?p=&APP_ID.:542:&SESSION.::&DEBUG.:542:P542_SUPPLIERCODE,P542_FROMAGE,P542_TOAGE:#PARTYCODE#,91,120'
,p_column_linktext=>'#COUNT91120#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442072394985935559)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doctypecode'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442072797695935560)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Doctypename'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442071685998935559)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Locationcode'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOCATIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442072065998935559)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Locationname'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442073245121935560)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Partycode'
,p_column_html_expression=>'<div style="display:block; width:50px">#PARTYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442073590988935560)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Partyname'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442074414570935560)
,p_db_column_name=>'VALUE0030'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE0030#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442077633122935561)
,p_db_column_name=>'VALUE121150'
,p_display_order=>180
,p_column_identifier=>'AN'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE121150#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442078472549935562)
,p_db_column_name=>'VALUE151180'
,p_display_order=>200
,p_column_identifier=>'AP'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE151180#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442075197861935560)
,p_db_column_name=>'VALUE3160'
,p_display_order=>120
,p_column_identifier=>'AH'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE3160#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442076060464935561)
,p_db_column_name=>'VALUE6190'
,p_display_order=>140
,p_column_identifier=>'AJ'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE6190#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(442076845651935561)
,p_db_column_name=>'VALUE91120'
,p_display_order=>160
,p_column_identifier=>'AL'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE91120#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(448313035576627876)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'66004'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COUNT0030:VALUE0030:COUNT3160:VALUE3160:COUNT6190:VALUE6190:COUNT91120:VALUE91120:COUNT121150:VALUE121150:COUNT151180:VALUE151180:ABOVE180COUNT:ABOVE180VALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447559857828080192)
,p_plug_name=>'Credit'
,p_static_id=>'credit'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_css_classes=>'region1'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--accent14:t-Region--hiddenOverflow'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447543571959867395)
,p_plug_name=>'Order Completed'
,p_static_id=>'order-completed'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.PartyCode,',
'      Case when nvl(Count(a.TNo),0) = 0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0))',
'      end as CompletedOrders,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0)) ',
'      end as Amount',
'From  D_SUPPLIER_360VIEW_PURCHASEORDERCOMPLETED a',
'Where a.PartyCode = :P515_SUPPLIERCODE',
'Group by a.PartyCode',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433821457680943278)
,p_region_id=>wwv_flow_imp.id(447543571959867395)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color8'
,p_title_adv_formatting=>false
,p_title_column_name=>'COMPLETEDORDERS'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Orders Completed </H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433821934137943278)
,p_card_id=>wwv_flow_imp.id(433821457680943278)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:532:&SESSION.::&DEBUG.:532:P532_SUPPLIERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447555300799080146)
,p_plug_name=>'Orders Delivered on Time'
,p_static_id=>'orders-delivered-on-time'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Case when a.PartyCode is null then ''-''',
'           else a.PartyCode',
'      end as PartyCode,',
'      case when nvl(Count(a.TNo),0) =  0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0))',
'      end as ODOT,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0))',
'      end as Amount',
'From  D_SUPPLIER_360VIEW_PURCHASEORDERSDELIVEREDONTIME a',
'Where a.PartyCode = :P515_SUPPLIERCODE',
'Group by Case when a.PartyCode is null then ''-''',
'           else a.PartyCode',
'      end',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'NO DATA FOUND'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433822969300943278)
,p_region_id=>wwv_flow_imp.id(447555300799080146)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color10'
,p_title_adv_formatting=>false
,p_title_column_name=>'ODOT'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Orders Delivered on Time</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433823421534943279)
,p_card_id=>wwv_flow_imp.id(433822969300943278)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:533:&SESSION.::&DEBUG.:533:P533_SUPPLIERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448302782606620691)
,p_plug_name=>'Outstanding Amount'
,p_static_id=>'outstanding-amount'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>100
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Case when a.PartyCode is null then ''-''',
'           else a.PartyCode',
'      end as PartyCode,',
'      case when nvl(Count(a.TNo),0) =  0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0))',
'      end as OverdueNos,',
'      Case when nvl(Sum(a.BALANCEAMOUNT),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.BALANCEAMOUNT),0))',
'      end as OverdueAmount',
'From  D_SUPPLIER_360VIEW_PENDINGPBPASS a',
'Where a.PartyCode = :P515_SUPPLIERCODE',
'Group by Case when a.PartyCode is null then ''-''',
'           else a.PartyCode',
'      end',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'NO DATA FOUND'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433840153810943290)
,p_region_id=>wwv_flow_imp.id(448302782606620691)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color10'
,p_title_adv_formatting=>false
,p_title_column_name=>'OVERDUENOS'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'OVERDUEAMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Outstanding Amount</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433840675256943290)
,p_card_id=>wwv_flow_imp.id(433840153810943290)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:529:&SESSION.::&DEBUG.:529:P529_SUPPLIERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448302555938620688)
,p_plug_name=>'Overdue Amount'
,p_static_id=>'overdue-amount'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Case when a.PartyCode is null then ''-''',
'           else a.PartyCode',
'      end as PartyCode,',
'      case when nvl(Count(a.TNo),0) =  0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0))',
'      end as OverdueNos,',
'      Case when nvl(Sum(a.BALANCEAMOUNT),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.BALANCEAMOUNT),0))',
'      end as Amount',
'From  D_SUPPLIER_360VIEW_OVERDUEPBPASS a',
'Where a.PartyCode = :P515_SUPPLIERCODE',
'Group by Case when a.PartyCode is null then ''-''',
'           else a.PartyCode',
'      end',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'NO DATA FOUND'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433838633245943289)
,p_region_id=>wwv_flow_imp.id(448302555938620688)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color5'
,p_title_adv_formatting=>false
,p_title_column_name=>'OVERDUENOS'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Overdue Amount</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433839179126943289)
,p_card_id=>wwv_flow_imp.id(433838633245943289)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:528:&SESSION.::&DEBUG.:528:P528_SUPPLIERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447543503099867394)
,p_plug_name=>'Pending for GRN'
,p_static_id=>'pending-for-grn'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.PartyCode,',
'      Case when nvl(Count(a.TNo),0) = 0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0)) ',
'      end as PendingforGRN,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0)) ',
'      end as Amount',
'From  D_SUPPLIER_360VIEW_PURCHASEORDERSPENDINGFORGRN a',
'Where a.PartyCode = :P515_SUPPLIERCODE',
'Group by a.PartyCode'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433819912851943277)
,p_region_id=>wwv_flow_imp.id(447543503099867394)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color7 '
,p_title_adv_formatting=>false
,p_title_column_name=>'PENDINGFORGRN'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Pending for GRN </H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433820440239943277)
,p_card_id=>wwv_flow_imp.id(433819912851943277)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:531:&SESSION.::&DEBUG.:531:P531_SUPPLIERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447463314128712174)
,p_plug_name=>'Profile'
,p_static_id=>'profile'
,p_parent_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_region_css_classes=>'customerinfo t-Form-label'
,p_region_template_options=>'#DEFAULT#:i-h240:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447462892155712170)
,p_plug_name=>'Supplier Dashboard'
,p_static_id=>'supplier-dashboard'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(433813732629943274)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_button_name=>'LASTRUN'
,p_static_id=>'lastrun'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'<p style="text-size:12px; color:#da1b1b;font-weight:bold">Last Run Date : &P515_LASTRUN.</p>'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442073768388935558)
,p_name=>'P515_ACTIVEPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Active PO :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442094627888935570)
,p_name=>'P515_ADDRESS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'Address :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>0
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442074534654935559)
,p_name=>'P515_DELIVEREDONTIME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Delivered on Time :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442095445319935570)
,p_name=>'P515_GSTNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'GST No :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>0
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442093394615935569)
,p_name=>'P515_IMAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'Image'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'width="70px" , height="90px"'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'SQL',
  'sql_statement', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '     d.ATTACHMENTBLOB --into :P515_IMAGE',
    'From ',
    '(Select',
    '      Distinct CompanyCode',
    'From  Party a, PartyCompany b',
    'where a.tno = b.TNo',
    '  and a.PartyCode = :P515_SUPPLIERCODE)x, Company c, CompanyAttributeDetail d',
    'Where c.TNo = d.TNo',
    '  and x.CompanyCode = c.CompanyCode',
    '  and d.COMPANYATTRIBUTECODE= ''COMPANYMONO'';')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442055491407935548)
,p_name=>'P515_LASTRUN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
'FROM D_SUPPLIER_360VIEW'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442072590490935558)
,p_name=>'P515_LEDGERBALANCE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Ledger Balance :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442074115992935559)
,p_name=>'P515_ORDERCOMPLETED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Order Completed :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442071749735935558)
,p_name=>'P515_OUTSTANDINGAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Outstanding Amount :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442072143666935558)
,p_name=>'P515_OVERDUEAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Overdue Amount :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442095003220935570)
,p_name=>'P515_PANNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'PAN No :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>0
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442093801620935570)
,p_name=>'P515_PARTYCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'Code:'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>0
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442137573474128083)
,p_name=>'P515_PENDINGGRN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Pending GRN:'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442094192387935570)
,p_name=>'P515_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'Status :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442055137502935547)
,p_name=>'P515_SUPPLIERCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(447462892155712170)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442093060698935569)
,p_name=>'P515_SUPPLIERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(447463314128712174)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442073381838935558)
,p_name=>'P515_TOTALDISCOUNTVALUE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Discount Value :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(442072921624935558)
,p_name=>'P515_TOTALRETURNVALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(447559857828080192)
,p_prompt=>'Return Value :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434063389813539223)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434063797509539224)
,p_event_id=>wwv_flow_imp.id(434063389813539223)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(433841397902943290)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Supplier Detail'
,p_static_id=>'fetch-supplier-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'          a.PartyCode,',
'          a.PartyName,',
'          dsd.DocumentStatusCode,',
'          a.OfficeAddress1||''''||a.OfficeAddress2||''''||GetCityName(a.OfficeCityCode)||'', ''||GetStateName(a.OfficeStateCode) ,',
'          GetPartyAttributeValue(a.PartyCode,''PANNO''),',
'          GetPartyAttributeValue(a.PartyCode,''GSTINNO'')',
'          into :P515_PARTYCODE,:P515_SUPPLIERNAME,:P515_STATUS,:P515_ADDRESS, :P515_PANNO,:P515_GSTNO',
'    From  Party a, DocumentStatusDetail dsd',
'    Where PartyCode = :P515_SUPPLIERCODE',
'      and a.TNo = dsd.ModuleTNo(+)',
';',
'',
'Select',
'      nvl(OutStandingAmount,0),',
'      nvl(OverdueAmount,0),',
'      nvl(ledgerBalance,0),',
'      nvl(TotalReturnValue,0),',
'      nvl(TotalDiscountValue,0),',
'      nvl(ActivePOValue,0),',
'      nvl(PendingForGRN,0),',
'      nvl(OrdersCompleted,0),',
'      nvl(OrdersDeliveredonTime,0)',
'      into',
'      :P515_OUTSTANDINGAMOUNT,',
'      :P515_OVERDUEAMOUNT,',
'      :P515_LEDGERBALANCE,',
'      :P515_TOTALRETURNVALUE,',
'      :P515_TOTALDISCOUNTVALUE,',
'      :P515_ACTIVEPO,',
'      :P515_PENDINGGRN,',
'      :P515_ORDERCOMPLETED,',
'      :P515_DELIVEREDONTIME',
'From  D_SUPPLIER_360VIEW',
'Where SupplierCode = :P515_SUPPLIERCODE',
';'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2398018511948056
);
wwv_flow_imp.component_end;
end;
/
