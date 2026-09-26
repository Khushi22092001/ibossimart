prompt --application/pages/page_00511
begin
--   Manifest
--     PAGE: 00511
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
 p_id=>511
,p_name=>'D Customer Dashboard'
,p_alias=>'D-CUSTOMER-DASHBOARD'
,p_step_title=>'D Customer Dashboard'
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
'.t-Form-label{padding-top: 0px;padding-bottom: 0px;margin-top: 0px;margin-bottom: 0px;padding-right: 2px;margin-right:2px;width: 100%;}',
'',
'/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */',
'/* A track appears only when the grid columns exceed the available width. */',
'.a-IG .a-GV-bdy {',
'  overflow-x: auto !important;',
'}',
'',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457811401178156871)
,p_plug_name=>'12 Months Sales'
,p_static_id=>'12-months-sales'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_css_classes=>'monthsale'
,p_region_template_options=>'#DEFAULT#:i-h320:t-Region--textContent:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.Months,',
'    x.Amount',
'From ',
'(select ',
'       TO_CHAR(CCINVOICEDATE,''MONTH'')AS MONTHS,',
'       SUM(TOTALAMOUNT) AMOUNT',
'  from D_CUSTOMER_360VIEW_INVOICE',
'  WHERE PARTYCODE = :P511_CUSTOMERCODE',
'  GROUP BY TO_CHAR(CCINVOICEDATE,''MONTH'')',
')x',
'Where rownum<= 12'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450739123809055484)
,p_region_id=>wwv_flow_imp.id(457811401178156871)
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
 p_id=>wwv_flow_imp.id(450741375696055485)
,p_chart_id=>wwv_flow_imp.id(450739123809055484)
,p_static_id=>'sales'
,p_seq=>10
,p_name=>'Sales'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.PartyCode,',
'    x.Months,',
'    x.Amount',
'From ',
'(select ',
'       PARTYCODE,',
'       TO_CHAR(CCINVOICEDATE,''MON-YYYY'')AS MONTHS,',
'       TO_CHAR(CCINVOICEDATE,''YYYYMM'')AS MONTHSYY,',
'       SUM(TOTALAMOUNT) AMOUNT',
'  from D_CUSTOMER_360VIEW_INVOICE',
'  WHERE PARTYCODE = :P511_CUSTOMERCODE',
'  GROUP BY TO_CHAR(CCINVOICEDATE,''MON-YYYY''),PARTYCODE,TO_CHAR(CCINVOICEDATE,''YYYYMM'')',
'  ORDER BY TO_CHAR(CCINVOICEDATE,''YYYYMM'')',
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
,p_link_target=>'f?p=&APP_ID.:541:&SESSION.::&DEBUG.:541:P541_CUSTOMERCODE,P541_MONTH:&PARTYCODE.,&MONTHS.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450739634481055484)
,p_chart_id=>wwv_flow_imp.id(450739123809055484)
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
 p_id=>wwv_flow_imp.id(450740787508055484)
,p_chart_id=>wwv_flow_imp.id(450739123809055484)
,p_static_id=>'y'
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
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450740201335055484)
,p_chart_id=>wwv_flow_imp.id(450739123809055484)
,p_static_id=>'y-2'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457902817373524837)
,p_plug_name=>'Active Invoice'
,p_static_id=>'active-invoice'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
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
'      end as Invoice,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0))',
'      end as Amount',
'From  D_CUSTOMER_360VIEW_ACTIVEINVOICE a, party b',
'Where a.PartyCode = :P511_CUSTOMERCODE',
'  and a.partycode=b.partycode',
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
 p_id=>wwv_flow_imp.id(450746913558055488)
,p_region_id=>wwv_flow_imp.id(457902817373524837)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color10'
,p_title_adv_formatting=>false
,p_title_column_name=>'INVOICE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Active Invoice</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450747387411055488)
,p_card_id=>wwv_flow_imp.id(450746913558055488)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:526:&SESSION.::&DEBUG.:526:P526_CUSTOMERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(458480309140513081)
,p_plug_name=>'Ageing Summary'
,p_static_id=>'ageing-summary'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>130
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
'       COUNT0007,',
'       VALUE0007,',
'       COUNT0815,',
'       VALUE0815,',
'       COUNT1622,',
'       VALUE1622,',
'       COUNT2329,',
'       VALUE2329,',
'       COUNT3036,',
'       VALUE3036,',
'       COUNT3743,',
'       VALUE3743,',
'       ABOVE43COUNT,',
'       ABOVE43VALUE',
'  from D_CUSTOMER_360VIEW_ACTIVEINVOICEAGEWISE',
'  Where PARTYCODE = :P511_CUSTOMERCODE'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Ageing Summary'
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
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: 0em;">Ageing Summary</h3>'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471461912280250143)
,p_heading=>'0-7 Days'
,p_static_id=>'0-7-days'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471462111685250145)
,p_heading=>'16 - 22 Days'
,p_static_id=>'16-22-days'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471462183701250146)
,p_heading=>'23 - 29 Days'
,p_static_id=>'23-29-days'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471462370895250147)
,p_heading=>'30 - 36 Days'
,p_static_id=>'30-36-days'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471462445677250148)
,p_heading=>'37 - 43 Days'
,p_static_id=>'37-43-days'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471461980690250144)
,p_heading=>'8-15 Days'
,p_static_id=>'8-15-days'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(471462567391250149)
,p_heading=>'Above 43 Days'
,p_static_id=>'above-43-days'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471461730822250141)
,p_name=>'ABOVE43COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ABOVE43COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'NO'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462567391250149)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471461800041250142)
,p_name=>'ABOVE43VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ABOVE43VALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462567391250149)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471232731459426271)
,p_name=>'COMPANYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPANYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Companycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471232847588426272)
,p_name=>'COMPANYNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPANYNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Companyname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233536574426279)
,p_name=>'COUNT0007'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT0007'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471461912280250143)
,p_use_group_for=>'HEADING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233746106426281)
,p_name=>'COUNT0815'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT0815'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471461980690250144)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233967562426283)
,p_name=>'COUNT1622'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT1622'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462111685250145)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471234079441426285)
,p_name=>'COUNT2329'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT2329'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462183701250146)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471461349317250137)
,p_name=>'COUNT3036'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT3036'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462370895250147)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471461533574250139)
,p_name=>'COUNT3743'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT3743'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462445677250148)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233146027426275)
,p_name=>'DOCTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doctypecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233244930426276)
,p_name=>'DOCTYPENAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCTYPENAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Doctypename'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471232908046426273)
,p_name=>'LOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Locationcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233058229426274)
,p_name=>'LOCATIONNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATIONNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Locationname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233359702426277)
,p_name=>'PARTYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Partycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233465720426278)
,p_name=>'PARTYNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233658367426280)
,p_name=>'VALUE0007'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE0007'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471461912280250143)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471233819756426282)
,p_name=>'VALUE0815'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE0815'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471461980690250144)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471234008492426284)
,p_name=>'VALUE1622'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE1622'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462111685250145)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471234227886426286)
,p_name=>'VALUE2329'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE2329'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462183701250146)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471461442583250138)
,p_name=>'VALUE3036'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE3036'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462370895250147)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471461619531250140)
,p_name=>'VALUE3743'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE3743'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(471462445677250148)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(471232607225426270)
,p_internal_uid=>22767534194261922
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(471467261922256755)
,p_interactive_grid_id=>wwv_flow_imp.id(471232607225426270)
,p_static_id=>'190666'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(471467472009256755)
,p_report_id=>wwv_flow_imp.id(471467261922256755)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471468296563256760)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(471232731459426271)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471469221694256765)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(471232847588426272)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471470172611256768)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(471232908046426273)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471471042355256770)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(471233058229426274)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471471940904256772)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(471233146027426275)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471472823404256773)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(471233244930426276)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471473703546256775)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(471233359702426277)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471474575255256777)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(471233465720426278)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471475549611256779)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(471233536574426279)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471476390623256781)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(471233658367426280)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471477364457256783)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(471233746106426281)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471478249088256785)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(471233819756426282)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471479094097256787)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(471233967562426283)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471480055420256788)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(471234008492426284)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471480799270256790)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(471234079441426285)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471481735920256793)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(471234227886426286)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471482605764256795)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(471461349317250137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471483569984256796)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(471461442583250138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471484426127256798)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(471461533574250139)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471485370016256800)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(471461619531250140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471486216237256802)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(471461730822250141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471487143975256805)
,p_view_id=>wwv_flow_imp.id(471467472009256755)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(471461800041250142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457907374402524883)
,p_plug_name=>'Credit'
,p_static_id=>'credit'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
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
 p_id=>wwv_flow_imp.id(457810408730156861)
,p_plug_name=>'Customer Dashboard'
,p_static_id=>'customer-dashboard'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(458650072513065379)
,p_plug_name=>'InActive Invoice'
,p_static_id=>'inactive-invoice'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>110
,p_plug_grid_column_span=>6
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
'      end as Invoice,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0))',
'      end as Amount',
'From  D_CUSTOMER_360VIEW_INACTIVEINVOICE a',
'Where a.PartyCode = :P511_CUSTOMERCODE',
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
 p_id=>wwv_flow_imp.id(450764264222055505)
,p_region_id=>wwv_flow_imp.id(458650072513065379)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color5'
,p_title_adv_formatting=>false
,p_title_column_name=>'INVOICE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> InActive Invoice</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450764753908055505)
,p_card_id=>wwv_flow_imp.id(450764264222055505)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:527:&SESSION.::&DEBUG.:527:P527_CUSTOMERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(458650299181065382)
,p_plug_name=>'InActive Orders'
,p_static_id=>'inactive-orders'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>140
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Case when a.VendorCode is null then ''-''',
'           else a.VendorCode',
'      end as VendorCode,',
'      case when nvl(Count(a.TNo),0) =  0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0))',
'      end as Invoice,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0))',
'      end as Amount',
'From  D_CUSTOMER_360VIEW_INACTIVEORDERS a',
'Where a.VendorCode = :P511_CUSTOMERCODE',
'Group by Case when a.VendorCode is null then ''-''',
'           else a.VendorCode',
'      end',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'NO DATA FOUND'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(450765730535055506)
,p_region_id=>wwv_flow_imp.id(458650299181065382)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color10'
,p_title_adv_formatting=>false
,p_title_column_name=>'INVOICE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> InActive Orders</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450766229300055506)
,p_card_id=>wwv_flow_imp.id(450765730535055506)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:94:P94_CUSTOMERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457890846365312083)
,p_plug_name=>'Last Order'
,p_static_id=>'last-order'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Max(A.SALESORDERDATE) LastOrderDate,',
'       Trunc(Sysdate) - Max(A.SALESORDERDATE) || '' Days Ago'' As DaysAgo,',
'       ''Last Order'' as Title,',
'       '''' as SubTitle',
'From  D_CUSTOMER_360VIEW_PENDINGORDERS a, PARTY B',
'Where B.PARTYCODE = a.vendorcode(+)',
'  AND B.PARTYCode = :P511_CUSTOMERCODE',
'Group by B.PARTYCode'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(450742384229055485)
,p_region_id=>wwv_flow_imp.id(457890846365312083)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color4'
,p_title_adv_formatting=>false
,p_title_column_name=>'LASTORDERDATE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DAYSAGO'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Last Order </H4>'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SUBTITLE'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450742947348055486)
,p_card_id=>wwv_flow_imp.id(450742384229055485)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:522:&SESSION.::&DEBUG.:522:P522_CUSTOMERCODE:&VENDORCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471463134374250155)
,p_plug_name=>'Ledger Balance'
,p_static_id=>'ledger-balance'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select getaccountbalancewithdrcr(A.CUSTOMERCODE,Trunc(a.lastrundate) ,''CO'',''1'') AS Balance',
'FROM D_CUSTOMER_360VIEW a',
'WHERE A.CUSTOMERCODE = :P511_CUSTOMERCODE'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(450768721399055507)
,p_region_id=>wwv_flow_imp.id(471463134374250155)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color5'
,p_title_adv_formatting=>false
,p_title_column_name=>'BALANCE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Ledger Balance </H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450769262385055508)
,p_card_id=>wwv_flow_imp.id(450768721399055507)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:523:&SESSION.::&DEBUG.:RP,523:P523_PARTY:&P511_CUSTOMERCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457891088534312086)
,p_plug_name=>'Overdue Invoices'
,p_static_id=>'overdue-invoices'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      b.PartyCode,',
'      Case when nvl(Count(a.TNo),0) = 0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0))',
'      end as Invoice,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0)) ',
'      end as Amount',
'From  D_CUSTOMER_360VIEW_OVERDUEINVOICE a, party b',
'Where b.partycode = a.partycode(+)',
'  and b.PartyCode = :P511_CUSTOMERCODE',
'Group by b.PartyCode',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(450745429116055487)
,p_region_id=>wwv_flow_imp.id(457891088534312086)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color8'
,p_title_adv_formatting=>false
,p_title_column_name=>'INVOICE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Overdue Invoices </H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450745951014055487)
,p_card_id=>wwv_flow_imp.id(450745429116055487)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:524:&SESSION.::&DEBUG.:524:P524_CUSTOMERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471462583857250150)
,p_plug_name=>'Pending Sales Order'
,p_static_id=>'pending-sales-order'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB:t-Form--large'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      B.PartyCode,',
'      Case When nvl(count(a.TNo),0) = 0 then ''-''',
'           else to_Char(nvl(count(a.TNo),0))',
'      end as PendingSO,',
'      case when nvl(round(sum(a.quantity1),3),0) = 0 and nvl(round(sum(a.quantity2),3),0) = 0 then ''-''',
'           when nvl(round(sum(a.quantity1),3),0) != 0 and nvl(round(sum(a.quantity2),3),0) != 0 then',
'            ''P Quantity : ''||to_char(sum(a.quantity1)) ||'' S Quantity ''||to_char(sum(a.quantity2))',
'           when nvl(round(sum(a.quantity1),3),0) != 0 and nvl(round(sum(a.quantity2),3),0) = 0 then',
'            ''P Quantity : ''||to_char(sum(a.quantity1))',
'      end as Quantity,',
'      Case when nvl(round(sum(a.TotalAmount),2),0) = 0 then ''-''',
'           else to_Char(nvl(round(sum(a.TotalAmount),2),0))',
'      end as Amount',
'From  D_CUSTOMER_360VIEW_PENDINGORDERS a, PARTY B',
'Where B.PARTYCODE = a.vendorcode(+)',
'  AND B.PARTYCode = :P511_CUSTOMERCODE',
'Group by B.PARTYCode'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(450767209030055507)
,p_region_id=>wwv_flow_imp.id(471462583857250150)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color4'
,p_title_adv_formatting=>false
,p_title_column_name=>'PENDINGSO'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Pending Sales Order </H4>'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'QUANTITY'
,p_second_body_css_classes=>'cardsubtitle'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450767711862055507)
,p_card_id=>wwv_flow_imp.id(450767209030055507)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:522:&SESSION.::&DEBUG.:522:P522_CUSTOMERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(457810830703156865)
,p_plug_name=>'Profile'
,p_static_id=>'profile'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
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
 p_id=>wwv_flow_imp.id(457891019674312085)
,p_plug_name=>'Total Invoice Billed'
,p_static_id=>'total-invoice-billed'
,p_parent_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      b.PartyCode,',
'      Case when nvl(Count(a.TNo),0) = 0 then ''-''',
'           else to_char(nvl(Count(a.TNo),0)) ',
'      end as Invoice,',
'      Case when nvl(Sum(a.TotalAmount),0) = 0 then ''-''',
'           else to_char(nvl(Sum(a.TotalAmount),0)) ',
'      end as Amount',
'From  D_CUSTOMER_360VIEW_INVOICE a, party b',
'Where b.partycode = a.partycode(+)',
'  and b.PartyCode = :P511_CUSTOMERCODE',
'Group by b.PartyCode'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(450743970182055486)
,p_region_id=>wwv_flow_imp.id(457891019674312085)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color7 '
,p_title_adv_formatting=>false
,p_title_column_name=>'INVOICE'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'AMOUNT'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Total Invoice Billed </H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(450744414243055486)
,p_card_id=>wwv_flow_imp.id(450743970182055486)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:525:&SESSION.::&DEBUG.:525:P525_CUSTOMERCODE:&PARTYCODE.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(450735228832055481)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_button_name=>'LASTRUN'
,p_static_id=>'lastrun'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'<p style="text-size:12px; color:#da1b1b;font-weight:bold">Last Run Date : &P511_LASTRUN.</p>'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457813022349156868)
,p_name=>'P511_ADDRESS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
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
 p_id=>wwv_flow_imp.id(458251245618696482)
,p_name=>'P511_CREDITDAYS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Credit Days :'
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
 p_id=>wwv_flow_imp.id(458251054247696480)
,p_name=>'P511_CREDITLIMIT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Credit Limit :'
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
 p_id=>wwv_flow_imp.id(457811560461156863)
,p_name=>'P511_CUSTOMERCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457812616732156864)
,p_name=>'P511_CUSTOMERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(458250806125696478)
,p_name=>'P511_CYCLEDAYS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Cycle Days :'
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
 p_id=>wwv_flow_imp.id(458239979262696481)
,p_name=>'P511_GSTNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
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
 p_id=>wwv_flow_imp.id(457813312149156871)
,p_name=>'P511_IMAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
,p_item_default=>'#APP_FILES#home.svg'
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
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(458752636402366140)
,p_name=>'P511_LASTRUN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(457810408730156861)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
'FROM D_CUSTOMER_360VIEW'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(458251503506696485)
,p_name=>'P511_LEDGERBALANCE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Ledger Balance :'
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
 p_id=>wwv_flow_imp.id(458251337418696483)
,p_name=>'P511_OVERUNDER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Over Under :'
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
 p_id=>wwv_flow_imp.id(458239899506696480)
,p_name=>'P511_PANNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
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
 p_id=>wwv_flow_imp.id(458479318690513052)
,p_name=>'P511_PARTYCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
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
 p_id=>wwv_flow_imp.id(458251413305696484)
,p_name=>'P511_PENDINGORDER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Pending Order :'
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
 p_id=>wwv_flow_imp.id(457812953482156867)
,p_name=>'P511_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(457810830703156865)
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
 p_id=>wwv_flow_imp.id(458250937410696479)
,p_name=>'P511_UNPAIDINVOICE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Unpaid Invoice :'
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
 p_id=>wwv_flow_imp.id(458251178502696481)
,p_name=>'P511_UNPOSTEDINVOICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Unposted Invoice :'
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
 p_id=>wwv_flow_imp.id(458251653701696486)
,p_name=>'P511_UNPOSTEDRETURN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(457907374402524883)
,p_prompt=>'Unposted Return :'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451082707136706187)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451083161624706187)
,p_event_id=>wwv_flow_imp.id(451082707136706187)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(450769989326055508)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Customer Detail'
,p_static_id=>'fetch-customer-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'          a.PartyCode,',
'          a.PartyName,',
'          dsd.DocumentStatusCode,',
'          a.OfficeAddress1||''''||a.OfficeAddress2||''''||GetCityName(a.OfficeCityCode)||'', ''||GetStateName(a.OfficeStateCode) ,',
'          GetPartyAttributeValue(a.PartyCode,''PANNO''),',
'          GetPartyAttributeValue(a.PartyCode,''GSTINNO'')',
'          into :P511_PARTYCODE,:P511_CUSTOMERNAME,:P511_STATUS,:P511_ADDRESS, :P511_PANNO,:P511_GSTNO',
'    From  Party a, DocumentStatusDetail dsd',
'    Where PartyCode = :P511_CUSTOMERCODE',
'      and dsd.modulecode=''PARTY''',
'      and a.TNo = dsd.ModuleTNo(+)',
';',
'',
'Select',
'      nvl(a.CreditDays,0),',
'      nvl(a.CreditAmount,0),',
'      Case When round(sum(b.TotalAmount),2) > nvl(a.CreditAmount,0) then round(sum(b.TotalAmount),2) - nvl(a.CreditAmount,0)||'' (Over)''',
'           else round(sum(b.TotalAmount),2) - nvl(a.CreditAmount,0)||'' (Under)''',
'      end OverUnder',
'      into',
'      :P511_CREDITDAYS,',
'      :P511_CREDITLIMIT,',
'      :P511_OVERUNDER',
'From  Party a, D_CUSTOMER_360VIEW_INVOICE b',
'Where a.PartyCode = :P511_CUSTOMERCODE',
'  and a.PartyCode = b.PartyCode(+)',
'Group by a.CreditDays,',
'      a.CreditAmount',
';',
'',
'Select',
'      round(nvl(a.LEDGERBALANCE,0),2),',
'      round(nvl(a.PENDINGORDERS,0),2)',
'      into ',
'      :P511_LEDGERBALANCE,',
'      :P511_PENDINGORDER',
'From  D_CUSTOMER_360VIEW a, PARTY B',
'Where b.partycode = a.customerCode(+)',
'  and b.PARTYCODE = :P511_CUSTOMERCODE',
';',
'',
'Select',
'      round(nvl(sum(TOTALAMOUNT),0),2) into :P511_UNPOSTEDINVOICE',
'From  D_CUSTOMER_360VIEW_INACTIVEINVOICE a, Party b',
'Where b.partycode = a.partycode(+)',
'  and b.PartyCode = :P511_CUSTOMERCODE',
';',
'',
'Select',
'      round(nvl(sum(TOTALAMOUNT),0),2) into :P511_UNPAIDINVOICE',
'From  D_CUSTOMER_360VIEW_PENDINGINVOICE a, party b',
'Where b.partycode = a.partycode(+)',
'  and b.PartyCode = :P511_CUSTOMERCODE',
';',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2304916294891160
);
wwv_flow_imp.component_end;
end;
/
