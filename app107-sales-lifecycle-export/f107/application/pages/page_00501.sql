prompt --application/pages/page_00501
begin
--   Manifest
--     PAGE: 00501
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
 p_id=>501
,p_name=>'Portlet Revenue'
,p_alias=>'PORTLET-REVENUE'
,p_step_title=>'Portlet Revenue'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#R161123375362759032_jet{',
'    margin-top: 2rem;',
'}',
'#R161123533390759034_jet{',
'    margin-top: 2rem;',
'}',
'#R158247033530484815_jet{',
'    margin-top: 2rem;',
'}',
'#R160542601609573604_jet{',
'    margin-top: 2rem;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(611543341671835650)
,p_plug_name=>'Brand Cutsomer Revenue'
,p_static_id=>'brand-cutsomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>150
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451019062798262131)
,p_region_id=>wwv_flow_imp.id(611543341671835650)
,p_chart_type=>'bar'
,p_height=>'400'
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
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451020767079262133)
,p_chart_id=>wwv_flow_imp.id(451019062798262131)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P501_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P501_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'A.LOCATIONCODE AS LOCATIONCODE,A.PARTYCODE, GETPARTYNAME(A.PARTYCODE) AS PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'   And (:P501_ITEMGROUP Is Null',
'    Or X.ROOT_ID = :P501_ITEMGROUP)',
'   And (:P501_ITEM Is Null',
'    Or NVL(X.PARENTCODE,X.ITEMCODE) = :P501_ITEM)',
'   And (:P501_BRAND IS NULL OR A.ITEMCODE = :P501_BRAND)',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By a.PARTYcode,A.LOCATIONCODE',
'order by 6 desc'))
,p_ajax_items_to_submit=>'P501_BRAND'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_COMPANY,P174_STATUS,P174_LOCATION,P174_FROMDATE,P174_TODATE,P174_ITEM,P174_PARTY:&GLOBAL_COMPANYCODE.,ACTIVE,&LOCATIONCODE.,&FROMDATE.,&TODATE.,&P501_BRAND.,&PARTYCODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451019581671262131)
,p_chart_id=>wwv_flow_imp.id(451019062798262131)
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
 p_id=>wwv_flow_imp.id(451020173563262132)
,p_chart_id=>wwv_flow_imp.id(451019062798262131)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609246781842746851)
,p_plug_name=>'Brand Revenue'
,p_static_id=>'brand-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>140
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451002858965262118)
,p_region_id=>wwv_flow_imp.id(609246781842746851)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451003406846262119)
,p_chart_id=>wwv_flow_imp.id(451002858965262118)
,p_static_id=>'brand-revenue-bar-chart'
,p_seq=>10
,p_name=>'Brand Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.ITEMCODE As ITEMCODE,',
'       getitemNAME(A.ITEMCODE) As ItemName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'   And (:P501_ITEMGROUP Is Null',
'    Or X.ROOT_ID = :P501_ITEMGROUP)',
'   And (:P501_ITEM Is Null',
'    Or NVL(X.PARENTCODE,X.ITEMCODE) = :P501_ITEM)',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By a.itemcode',
''))
,p_ajax_items_to_submit=>'P501_BRAND'
,p_series_type=>'donut'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_BRAND'',&ITEMCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609702703972081732)
,p_plug_name=>'Item Cutomer Revenue'
,p_static_id=>'item-cutomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451007652153262126)
,p_region_id=>wwv_flow_imp.id(609702703972081732)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451009367550262127)
,p_chart_id=>wwv_flow_imp.id(451007652153262126)
,p_static_id=>'item-customer-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Customer Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P501_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P501_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'A.LOCATIONCODE AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.PARTYCODE = B.PARTYCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'   And (:P501_ITEMGROUP Is Null    Or X.ROOT_ID = :P501_ITEMGROUP)',
'   And (:P501_ITEM Is Null Or NVL(X.PARENTCODE,X.ITEMCODE) = :P501_ITEM)',
' Group By B.PARTYCODE, B.PARTYNAME,A.LOCATIONCODE',
' order by 6 desc'))
,p_ajax_items_to_submit=>'P501_ITEM,P501_MONTH,P501_QUARTER'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_COMPANY,P174_LOCATION,P174_STATUS,P174_FROMDATE,P174_TODATE,P174_PARTY:&GLOBAL_COMPANYCODE.,&LOCATIONCODE.,ACTIVE,&FROMDATE.,&TODATE.,&PARTYCODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451008231024262126)
,p_chart_id=>wwv_flow_imp.id(451007652153262126)
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
 p_id=>wwv_flow_imp.id(451008800233262126)
,p_chart_id=>wwv_flow_imp.id(451007652153262126)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(612123281703021070)
,p_plug_name=>'Item Revenue'
,p_static_id=>'item-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451028357561262138)
,p_region_id=>wwv_flow_imp.id(612123281703021070)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451028876237262138)
,p_chart_id=>wwv_flow_imp.id(451028357561262138)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P501_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P501_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'A.LOCATIONCODE AS LOCATIONCODE, ',
'Nvl(X.PARENTCODE, X.ITEMCODE) As PARENTCODE,',
'       getitemname(Nvl(X.PARENTCODE, X.ITEMCODE)) As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'   And (:P501_ITEMGROUP Is Null',
'    Or X.ROOT_ID = NVL(:P501_ITEMGROUP,:P501_SUBGROUP))',
'',
' Group By Nvl(X.PARENTCODE, X.ITEMCODE), A.LOCATIONCODE',
''))
,p_ajax_items_to_submit=>'P501_ITEM,P501_ITEMGROUP'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_ITEM'',&PARENTCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(612174317160777769)
,p_plug_name=>'item spec Customer Revenue'
,p_static_id=>'item-spec-customer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>170
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451032026600262143)
,p_region_id=>wwv_flow_imp.id(612174317160777769)
,p_chart_type=>'bar'
,p_height=>'400'
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
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451033738955262143)
,p_chart_id=>wwv_flow_imp.id(451032026600262143)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''01-''||NVL(TO_CHAR(to_date(:P501_MONTH,''YYYYMM''),''MM-RRRR''),TO_CHAR(SYSDATE,''MM-RRRR'')) AS FromDate,',
'TO_CHAR(last_day(to_date(:P501_MONTH,''YYYYMM'')),''DD-MM-RRRR'') as ToDate,',
'A.LOCATIONCODE AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c',
' Where  A.PARTYCODE = B.PARTYCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'   and (:P501_ITEMSPECIFICATION IS NULL OR A.ITEMSPECIFICATIONCODE = :P501_ITEMSPECIFICATION)',
' Group By B.PARTYCODE, B.PARTYNAME, A.LOCATIONCODE',
' order by 6 desc'))
,p_ajax_items_to_submit=>'P501_BRAND,P501_ITEMSPECIFICATION'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_COMPANY,P174_STATUS,P174_LOCATION,P174_FROMDATE,P174_TODATE,P174_ITEMSPECIFICATION,P174_DOCTYPE:&GLOBAL_COMPANYCODE.,ACTIVE,&LOCATIONCODE.,&FROMDATE.,&TODATE.,&P501_ITEMSPECIFICATION.,CHALANCUMINVOICE'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451032497265262143)
,p_chart_id=>wwv_flow_imp.id(451032026600262143)
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
 p_id=>wwv_flow_imp.id(451033110119262143)
,p_chart_id=>wwv_flow_imp.id(451032026600262143)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(611542349921835640)
,p_plug_name=>'Item Specification Revenue'
,p_static_id=>'item-specification-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>160
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451017306495262130)
,p_region_id=>wwv_flow_imp.id(611542349921835640)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451017831585262131)
,p_chart_id=>wwv_flow_imp.id(451017306495262130)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.ITEMSPECIFICATIONCODE As ITEMSPECIFICATIONCODE,',
'       getitemSPECIFICATIONNAME(A.ITEMCODE, A.ITEMSPECIFICATIONCODE) As ItemSpecificationName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'   And (:P501_ITEMGROUP Is Null',
'    Or X.ROOT_ID = :P501_ITEMGROUP)',
'   And (:P501_ITEM Is Null',
'    Or X.ITEMCODE = :P501_BRAND OR X.PARENTCODE = :P501_BRAND )',
' ',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By a.itemcode, a.itemspecificationcode',
''))
,p_ajax_items_to_submit=>'P501_BRAND,P501_ITEMGROUP,P501_ITEM'
,p_series_type=>'donut'
,p_series_name_column_name=>'ITEMSPECIFICATIONNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMSPECIFICATIONNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_ITEMSPECIFICATION'',&ITEMSPECIFICATIONCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609702204857081727)
,p_plug_name=>'Main Group Customer Revenue'
,p_static_id=>'main-group-customer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451004663370262119)
,p_region_id=>wwv_flow_imp.id(609702204857081727)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451006439962262122)
,p_chart_id=>wwv_flow_imp.id(451004663370262119)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P501_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P501_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'A.LOCATIONCODE AS LOCATIONCODE,',
'B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.PARTYCODE = B.PARTYCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'   And (:P501_ITEMGROUP Is Null  Or X.ROOT_ID = :P501_ITEMGROUP)',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By B.PARTYCODE, B.PARTYNAME,A.LOCATIONCODE',
'order by 6 desc',
'/*',
'Select',
'      b.PartyCode,',
'      GetPartyName(b.PartyCode) PartyName,',
'      sum(b.TotalAmount)Amount',
'From  BI_DateTime a, BI_SRevenue b',
'Where a.Fin_Date = b.CCInvoiceDate',
'  and b.ItemCode like nvl(:P501_ITEM,''%'')',
'  and To_Char(b.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'  and a.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'  and replace(a.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'Group by b.PartyCode',
'*/'))
,p_ajax_items_to_submit=>'P501_ITEM,P501_MONTH,P501_QUARTER'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_COMPANY,P174_LOCATION,P174_FROMDATE,P174_TODATE,P174_PARTY,P174_STATUS:&GLOBAL_COMPANYCODE.,&LOCATIONCODE.,&FROMDATE.,&TODATE.,&PARTYCODE.,ACTIVE'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451005814415262122)
,p_chart_id=>wwv_flow_imp.id(451004663370262119)
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
 p_id=>wwv_flow_imp.id(451005154574262120)
,p_chart_id=>wwv_flow_imp.id(451004663370262119)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609246423971746847)
,p_plug_name=>'Main Group Revenue'
,p_static_id=>'main-group-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451000803323262110)
,p_region_id=>wwv_flow_imp.id(609246423971746847)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451001271397262112)
,p_chart_id=>wwv_flow_imp.id(451000803323262110)
,p_static_id=>'item-group-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Group Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select x.root_id,',
'       getitemname(x.root_id) As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'--   And :P501_ITEMGROUP Is Null',
'--    Or X.ROOT_ID = &P501_ITEMGROUP',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By x.root_id'))
,p_ajax_items_to_submit=>'P501_ITEMGROUP,P501_ITEM'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_ITEMGROUP'',&ROOT_ID.);javascript:$s(''P501_ITEMGROUPNAME'',&ROOT_NAME.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(612122861065021066)
,p_plug_name=>'Revenue'
,p_static_id=>'revenue'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent14:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs:margin-top-none:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(612123123675021068)
,p_plug_name=>'Revenue by HalfYearly'
,p_static_id=>'revenue-by-halfyearly'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent3:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451022062951262134)
,p_region_id=>wwv_flow_imp.id(612123123675021068)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451022622780262135)
,p_chart_id=>wwv_flow_imp.id(451022062951262134)
,p_static_id=>'halfyear-pie-chart'
,p_seq=>10
,p_name=>'HalfYear Pie Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.FIN_HALF_YEAR_NAME, ',
'       a.FIN_HALF_YEAR, ',
'	   Sum(c.TotalAmount) Amount',
'  From BI_DateTime a, BI_Srevenue c',
' Where a.Fin_Date = c.CCInvoiceDate',
'   And Replace(a.Fin_Year, ''-'', '''') Like nvl(:P501_FINYEAR, ''%'')',
' Group By a.FIN_HALF_YEAR_NAME, a.FIN_HALF_YEAR',
' Order By 2'))
,p_ajax_items_to_submit=>'P501_FINYEAR'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FIN_HALF_YEAR_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_FIN_HALFYEAR'',&FIN_HALF_YEAR.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(612123232891021069)
,p_plug_name=>'Revenue by Months'
,p_static_id=>'revenue-by-months'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P501_MONTH,P501_FIN_HALFYEAR,P501_FINYEAR,P501_ITEM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451023897550262136)
,p_region_id=>wwv_flow_imp.id(612123232891021069)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withoutRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'on'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_time_axis_type=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451026221963262137)
,p_chart_id=>wwv_flow_imp.id(451023897550262136)
,p_static_id=>'by-product'
,p_seq=>20
,p_name=>'By Product'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(xx.month,''MON-YYYY''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(xx.month,''MON-YYYY'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,xx.*',
'  From (Select b.Fin_Qtr,',
'               b.Fin_Month,',
'               x.root_id,',
'               getitemname(x.root_id) As item,',
'               To_Char(a.CCInvoiceDate, ''MON-YYYY'') As Month,',
'               To_Char(a.CCInvoiceDate, ''YYYYMM'') As Monthyy,',
'               Sum(a.TotalAmount) Amount',
'          From BI_SRevenue a,',
'               BI_DateTime b,',
'               (Select ITEMCODE,',
'                       parentcode,',
'                       RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                       Level,',
'                       CONNECT_BY_ROOT itemcode As root_id,',
'                       --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                       CONNECT_BY_ISLEAF As leaf',
'                  From item a',
'                 Start With parentcode Is Null',
'                Connect By parentcode = Prior itemcode',
'                 Order Siblings By itemcode) x',
'         Where A.ITEMCODE = X.ITEMCODE',
'           And a.CCInvoiceDate = b.Fin_date',
'        --and b.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'        --and b.Fin_year like nvl(:P501_FINYEAR,''%'')',
'           and (b.Fin_Qtr = :P501_FIN_QTR or :P501_FIN_QTR is null)',
'          and (replace(b.Fin_year,''-'','''') = :P501_FINYEAR or :P501_FINYEAR is null)',
'        ',
'         Group By b.Fin_Qtr,',
'                  b.Fin_Month,',
'                  To_Char(a.CCInvoiceDate, ''MON-YYYY''),',
'                  To_Char(a.CCInvoiceDate, ''YYYYMM''),',
'                  getitemname(x.root_id),',
'                  x.root_id',
'         Order By To_Char(a.CCInvoiceDate, ''YYYYMM'')) xx',
'where root_id=''217''',
' Order By root_id',
''))
,p_ajax_items_to_submit=>'P501_MONTH,P501_FIN_HALFYEAR,P501_FINYEAR,P501_ITEM'
,p_series_type=>'bar'
,p_series_name_column_name=>'ITEM'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTHYY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P116_MONTH'',&MONTHYY.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451025618327262137)
,p_chart_id=>wwv_flow_imp.id(451023897550262136)
,p_static_id=>'finished-goods'
,p_seq=>10
,p_name=>'Finished Goods'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select --APEX_UTIL.PREPARE_URL',
'--(''f?p=&APP_ID.:56:&APP_SESSION.::::P56_COMPANY,P56_FROMDATE,P56_TODATE:1,'' || to_date(xx.month,''MON-YYYY'')|| '','' ||LAST_DAY(to_date(xx.month,''MON-YYYY''))) AS LINK ,',
'TO_CHAR(to_date(xx.month,''MON-YYYY''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(xx.month,''MON-YYYY'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,',
'xx.*',
'  From (Select b.Fin_Qtr,',
'               b.Fin_Month,',
'               x.root_id,',
'               getitemname(x.root_id) As item,',
'               To_Char(a.CCInvoiceDate, ''MON-YYYY'') As Month,',
'               To_Char(a.CCInvoiceDate, ''YYYYMM'') As Monthyy,',
'               Sum(a.TotalAmount) Amount',
'          From BI_SRevenue a,',
'               BI_DateTime b,',
'               (Select ITEMCODE,',
'                       parentcode,',
'                       RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                       Level,',
'                       CONNECT_BY_ROOT itemcode As root_id,',
'                       --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                       CONNECT_BY_ISLEAF As leaf',
'                  From item a',
'                 Start With parentcode Is Null',
'                Connect By parentcode = Prior itemcode',
'                 Order Siblings By itemcode) x',
'         Where A.ITEMCODE = X.ITEMCODE',
'           And a.CCInvoiceDate = b.Fin_date',
'        --and b.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'        --and b.Fin_year like nvl(:P501_FINYEAR,''%'')',
'           and (b.Fin_Qtr = :P501_FIN_QTR or :P501_FIN_QTR is null)',
'          and (replace(b.Fin_year,''-'','''') = :P501_FINYEAR or :P501_FINYEAR is null)',
'        ',
'         Group By b.Fin_Qtr,',
'                  b.Fin_Month,',
'                  To_Char(a.CCInvoiceDate, ''MON-YYYY''),',
'                  To_Char(a.CCInvoiceDate, ''YYYYMM''),',
'                  getitemname(x.root_id),',
'                  x.root_id',
'',
'         Order By To_Char(a.CCInvoiceDate, ''YYYYMM'')) xx',
'--where root_id=''223''',
'-- Order By XX.MONTHYY --root_id',
''))
,p_ajax_items_to_submit=>'P501_FIN_HALFYEAR,P501_MONTH,P501_FIN_HALFYEAR,P501_FINYEAR,P501_ITEM'
,p_series_type=>'bar'
,p_series_name_column_name=>'ITEM'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTHYY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_MONTH'',&MONTHYY.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451026768648262137)
,p_chart_id=>wwv_flow_imp.id(451023897550262136)
,p_static_id=>'waste-scrap'
,p_seq=>30
,p_name=>'Waste & Scrap'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(xx.month,''MON-YYYY''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(xx.month,''MON-YYYY'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE, xx.*',
'  From (Select b.Fin_Qtr,',
'               b.Fin_Month,',
'               x.root_id,',
'               getitemname(x.root_id) As item,',
'               To_Char(a.CCInvoiceDate, ''MON-YYYY'') As Month,',
'               To_Char(a.CCInvoiceDate, ''YYYYMM'') As Monthyy,',
'               Sum(a.TotalAmount) Amount',
'          From BI_SRevenue a,',
'               BI_DateTime b,',
'               (Select ITEMCODE,',
'                       parentcode,',
'                       RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                       Level,',
'                       CONNECT_BY_ROOT itemcode As root_id,',
'                      -- ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                       CONNECT_BY_ISLEAF As leaf',
'                  From item a',
'                 Start With parentcode Is Null',
'                Connect By parentcode = Prior itemcode',
'                 Order Siblings By itemcode) x',
'         Where A.ITEMCODE = X.ITEMCODE',
'           And a.CCInvoiceDate = b.Fin_date',
'        --and b.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'        --and b.Fin_year like nvl(:P501_FINYEAR,''%'')',
'           and (b.Fin_Qtr = :P501_FIN_QTR or :P501_FIN_QTR is null)',
'          and (replace(b.Fin_year,''-'','''') = :P501_FINYEAR or :P501_FINYEAR is null)',
'        ',
'         Group By b.Fin_Qtr,',
'                  b.Fin_Month,',
'                  To_Char(a.CCInvoiceDate, ''MON-YYYY''),',
'                  To_Char(a.CCInvoiceDate, ''YYYYMM''),',
'                  getitemname(x.root_id),',
'                  x.root_id',
'         Order By To_Char(a.CCInvoiceDate, ''YYYYMM'')) xx',
'where root_id=''235''',
' Order By root_id',
''))
,p_ajax_items_to_submit=>'P501_MONTH,P501_FIN_HALFYEAR,P501_FINYEAR,P501_ITEM'
,p_series_type=>'bar'
,p_series_name_column_name=>'ITEM'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTHYY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P116_MONTH'',&MONTHYY.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451024391295262136)
,p_chart_id=>wwv_flow_imp.id(451023897550262136)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'off'
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
 p_id=>wwv_flow_imp.id(451025019086262137)
,p_chart_id=>wwv_flow_imp.id(451023897550262136)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'off'
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
 p_id=>wwv_flow_imp.id(609838304880168327)
,p_plug_name=>'Revenue by Quarters'
,p_static_id=>'revenue-by-quarters'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent5:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>9
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451010675404262127)
,p_region_id=>wwv_flow_imp.id(609838304880168327)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451011246017262127)
,p_chart_id=>wwv_flow_imp.id(451010675404262127)
,p_static_id=>'quater-pie-chart'
,p_seq=>10
,p_name=>'Quater Pie Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.Fin_Qtr_Name,',
'      a.Fin_Qtr,',
'      sum(c.TotalAmount)Amount',
'From  BI_DateTime a, BI_Srevenue c',
'Where a.Fin_Date = c.CCInvoiceDate',
'  and replace(a.Fin_Year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'  and (:P501_FIN_HALFYEAR IS NULL OR A.FIN_HALF_YEAR = :P501_FIN_HALFYEAR)',
'Group by a.Fin_Qtr_Name,',
'         a.Fin_Qtr',
'Order by 2'))
,p_ajax_items_to_submit=>'P501_FINYEAR'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FIN_QTR_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_FIN_QTR'',&FIN_QTR.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609839612524168340)
,p_plug_name=>'Sub Group Customer Revenue'
,p_static_id=>'sub-group-customer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'ITEM_IS_ZERO'
,p_plug_display_when_condition=>'P501_FINYEAR'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451014323716262129)
,p_region_id=>wwv_flow_imp.id(609839612524168340)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451015952757262130)
,p_chart_id=>wwv_flow_imp.id(451014323716262129)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  TO_CHAR(to_date(:P501_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P501_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'A.LOCATIONCODE AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode IS NULL',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.PARTYCODE = B.PARTYCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'',
'   And  (:P501_SUBGROUP IS NULL OR ( X.root_id = :P501_ITEMGROUP) OR (X.PARENTCODE = :P501_SUBGROUP )  )',
'        ',
'   ',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By B.PARTYCODE, B.PARTYNAME, A.LOCATIONCODE',
' order by 6 desc',
'',
''))
,p_ajax_items_to_submit=>'P501_ITEM,P501_MONTH,P501_QUARTER,P501_SUBGROUP,P501_ITEMGROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_COMPANYCODE,P174_LOCATION,P174_STATUS,P174_PARTY,P174_FROMDATE,P174_TODATE:&GLOBAL_COMPANYCODE.,&LOCATIONCODE.,ACTIVE,&PARTYCODE.,&FROMDATE.,&TODATE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451015398290262130)
,p_chart_id=>wwv_flow_imp.id(451014323716262129)
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
 p_id=>wwv_flow_imp.id(451014754812262129)
,p_chart_id=>wwv_flow_imp.id(451014323716262129)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(609839230345168336)
,p_plug_name=>'Sub Group  Revenue'
,p_static_id=>'sub-group-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'ITEM_IS_ZERO'
,p_plug_display_when_condition=>'P501_FINYEAR'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451012487835262128)
,p_region_id=>wwv_flow_imp.id(609839230345168336)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451013015252262129)
,p_chart_id=>wwv_flow_imp.id(451012487835262128)
,p_static_id=>'item-group-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Group Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select x.root_id,',
'       getitemname(x.root_id) As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode IS NULL --= NVL(:P501_SUBGROUP,:P501_ITEMGROUP)',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P501_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P501_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P501_FINYEAR,''%'')',
'   And  (:P501_SUBGROUP IS NULL OR ( X.root_id = :P501_ITEMGROUP) OR (X.PARENTCODE = :P501_SUBGROUP )  )',
'        ',
'--   And :P501_ITEMGROUP Is Null',
'--    Or X.ROOT_ID = &P501_ITEMGROUP',
'--   And (&P501_ITEMGROUP Is Null Or',
'--instr('':'' || &P501_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By x.root_id'))
,p_ajax_items_to_submit=>'P501_SUBGROUP,P501_ITEMGROUP,P501_MONTH'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P501_SUBGROUP'',&ROOT_ID.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(612125173869021089)
,p_plug_name=>'Yearly Revenue'
,p_static_id=>'yearly-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(612122861065021066)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451030180900262139)
,p_region_id=>wwv_flow_imp.id(612125173869021089)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451030679430262141)
,p_chart_id=>wwv_flow_imp.id(451030180900262139)
,p_static_id=>'yearly-revenue'
,p_seq=>10
,p_name=>'Yearly Revenue'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.Fin_Year FYNAME,',
'      REPLACE(a.Fin_Year,''-'','''') FYCODE,',
'      sum(TotalAmount)Amount',
'From  BI_DateTime a, BI_SRevenue b',
'Where a.Fin_Date = b.CCInvoiceDate',
'Group by a.Fin_Year'))
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FYNAME'
,p_items_short_desc_column_name=>'FYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'JavaScript:$s(''P501_FINYEAR'' ,&FYCODE. );'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(609255352328746951)
,p_name=>'P501_BRAND'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609246781842746851)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(611873946190808136)
,p_name=>'P501_BRANDNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(611543341671835650)
,p_prompt=>'Brandname'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
 p_id=>wwv_flow_imp.id(600156707046552479)
,p_name=>'P501_FINYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(612125173869021089)
,p_prompt=>'F.Year'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600133318617552464)
,p_name=>'P501_FIN_HALFYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(612123123675021068)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(609862483576168441)
,p_name=>'P501_FIN_QTR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609838304880168327)
,p_prompt=>'Quarter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600151291649552475)
,p_name=>'P501_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(612123281703021070)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(609250714432746941)
,p_name=>'P501_ITEMGROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609246423971746847)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(608812601722325961)
,p_name=>'P501_ITEMGROUPNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609702204857081727)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
 p_id=>wwv_flow_imp.id(611850883333808121)
,p_name=>'P501_ITEMNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609702703972081732)
,p_prompt=>'Itemname'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
 p_id=>wwv_flow_imp.id(611579604738835761)
,p_name=>'P501_ITEMSPECIFICATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(611542349921835640)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(611900019326808156)
,p_name=>'P501_ITEMSPECIFICATIONNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(612174317160777769)
,p_prompt=>'Itemspecificationname'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
 p_id=>wwv_flow_imp.id(600144893358552472)
,p_name=>'P501_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(612123232891021069)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600145278220552472)
,p_name=>'P501_QUARTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(612123232891021069)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(611546291097835731)
,p_name=>'P501_SELECTEDMONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(609246423971746847)
,p_prompt=>'Selectedmonth'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
 p_id=>wwv_flow_imp.id(609866983767168452)
,p_name=>'P501_SUBGROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609839230345168336)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(611863749552808126)
,p_name=>'P501_SUBGROUPNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(609839612524168340)
,p_prompt=>'Subgroupname'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451053653931262156)
,p_name=>'CHANGE BRAND'
,p_static_id=>'change-brand'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_BRAND'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451054207114262158)
,p_event_id=>wwv_flow_imp.id(451053653931262156)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_BRANDNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451055227159262158)
,p_event_id=>wwv_flow_imp.id(451053653931262156)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(611543341671835650)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451055685518262158)
,p_event_id=>wwv_flow_imp.id(451053653931262156)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(611542349921835640)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451056210381262158)
,p_event_id=>wwv_flow_imp.id(451053653931262156)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612174317160777769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451054720595262158)
,p_event_id=>wwv_flow_imp.id(451053653931262156)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_BRANDNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_BRAND',
  'sql_query', 'SELECT ITEMNAME FROM ITEM WHERE ITEMCODE = :P501_BRAND ;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451056576161262159)
,p_name=>'CHANGE ITEM SPECIFICATION'
,p_static_id=>'change-item-specification'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMSPECIFICATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451057084540262159)
,p_event_id=>wwv_flow_imp.id(451056576161262159)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMSPECIFICATIONNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451058101925262159)
,p_event_id=>wwv_flow_imp.id(451056576161262159)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612174317160777769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451057629148262159)
,p_event_id=>wwv_flow_imp.id(451056576161262159)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMSPECIFICATIONNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_ITEMSPECIFICATION',
  'sql_query', 'SELECT ITEMSPECIFICATIONNAME FROM ITEMSPECIFICATION WHERE ITEMSPECIFICATIONCODE = :P501_ITEMSPECIFICATION;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451038966162262149)
,p_name=>'Change Month'
,p_static_id=>'change-month'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_MONTH'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451039496363262149)
,p_event_id=>wwv_flow_imp.id(451038966162262149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEM,P501_ITEMGROUP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451039985402262150)
,p_event_id=>wwv_flow_imp.id(451038966162262149)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609246423971746847)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451040456093262150)
,p_event_id=>wwv_flow_imp.id(451038966162262149)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612174317160777769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451040979110262150)
,p_event_id=>wwv_flow_imp.id(451038966162262149)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612123281703021070)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451041451067262150)
,p_event_id=>wwv_flow_imp.id(451038966162262149)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609246781842746851)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451041959396262151)
,p_event_id=>wwv_flow_imp.id(451038966162262149)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_SELECTEDMONTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_MONTH',
  'sql_query', 'SELECT TO_CHAR(TO_DATE(:P501_MONTH,''YYYYMM''),''MON-RRRR'') FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451042349619262151)
,p_name=>'CLEAR'
,p_static_id=>'clear'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMGROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451043408922262151)
,p_event_id=>wwv_flow_imp.id(451042349619262151)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_SUBGROUP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451042920527262151)
,p_event_id=>wwv_flow_imp.id(451042349619262151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMGROUPNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'SELECT ITEMNAME FROM ITEM WHERE ITEMCODE=:P501_ITEMGROUP;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451050807722262153)
,p_name=>'CLICK SUBGROUP'
,p_static_id=>'click-subgroup'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_SUBGROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451051336429262153)
,p_event_id=>wwv_flow_imp.id(451050807722262153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_SUBGROUPNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451052303008262156)
,p_event_id=>wwv_flow_imp.id(451050807722262153)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609839612524168340)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451052799268262156)
,p_event_id=>wwv_flow_imp.id(451050807722262153)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612123281703021070)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451053248606262156)
,p_event_id=>wwv_flow_imp.id(451050807722262153)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609702703972081732)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451051801832262156)
,p_event_id=>wwv_flow_imp.id(451050807722262153)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_SUBGROUPNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_SUBGROUP',
  'sql_query', 'SELECT ITEMNAME FROM ITEM WHERE ITEMCODE=:P501_SUBGROUP;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451062370405262160)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451062895917262161)
,p_event_id=>wwv_flow_imp.id(451062370405262160)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451058491093262159)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451059012285262159)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451060011828262160)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609702703972081732)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451060452474262160)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609246781842746851)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451060956334262160)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(611543341671835650)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451061457435262160)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(611542349921835640)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451061974923262160)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612174317160777769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451059464588262160)
,p_event_id=>wwv_flow_imp.id(451058491093262159)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_ITEM',
  'sql_query', 'SELECT ITEMNAME FROM ITEM WHERE ITEMCODE = :P501_ITEM;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451047076815262152)
,p_name=>'Refresh item Customer '
,p_static_id=>'refresh-item-customer'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMGROUP'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451048078956262152)
,p_event_id=>wwv_flow_imp.id(451047076815262152)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609702703972081732)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451048566339262152)
,p_event_id=>wwv_flow_imp.id(451047076815262152)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612174317160777769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451047569030262152)
,p_event_id=>wwv_flow_imp.id(451047076815262152)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_ITEM',
  'sql_query', 'select null FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451044667320262151)
,p_name=>'Refresh item Region'
,p_static_id=>'refresh-item-region'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMGROUP'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451045730269262152)
,p_event_id=>wwv_flow_imp.id(451044667320262151)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612123281703021070)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451046219799262152)
,p_event_id=>wwv_flow_imp.id(451044667320262151)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609702204857081727)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451045226135262151)
,p_event_id=>wwv_flow_imp.id(451044667320262151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P501_ITEM',
  'sql_query', 'select null FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451046653347262152)
,p_event_id=>wwv_flow_imp.id(451044667320262151)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMGROUPNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'SELECT ITEMNAME FROM ITEM WHERE ITEMCODE=:P501_ITEMGROUP;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451049898947262153)
,p_name=>'Refresh  Item Specification Region'
,p_static_id=>'refresh-item-specification-region'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMGROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451050434262262153)
,p_event_id=>wwv_flow_imp.id(451049898947262153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609246781842746851)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451034806768262146)
,p_name=>'Refresh Month Chart'
,p_static_id=>'refresh-month-chart'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_FIN_HALFYEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451035292376262147)
,p_event_id=>wwv_flow_imp.id(451034806768262146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_MONTH,P501_ITEM,P501_FIN_QTR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451035676364262148)
,p_event_id=>wwv_flow_imp.id(451034806768262146)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609838304880168327)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451036182245262148)
,p_event_id=>wwv_flow_imp.id(451034806768262146)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612123232891021069)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451036742205262148)
,p_event_id=>wwv_flow_imp.id(451034806768262146)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612123281703021070)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451037238414262149)
,p_event_id=>wwv_flow_imp.id(451034806768262146)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612174317160777769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451037552770262149)
,p_name=>'Refresh Quarter Chart'
,p_static_id=>'refresh-quarter-chart'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_FINYEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451038061524262149)
,p_event_id=>wwv_flow_imp.id(451037552770262149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_FIN_HALFYEAR,P501_MONTH,P501_ITEM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451038634012262149)
,p_event_id=>wwv_flow_imp.id(451037552770262149)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(612123123675021068)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451048963825262152)
,p_name=>'Refresh Sub Group Customer'
,p_static_id=>'refresh-sub-group-customer'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMGROUP'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451049525274262153)
,p_event_id=>wwv_flow_imp.id(451048963825262152)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609839612524168340)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451043813669262151)
,p_name=>'REFRESH SUBGROUP'
,p_static_id=>'refresh-subgroup'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_ITEMGROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451044286183262151)
,p_event_id=>wwv_flow_imp.id(451043813669262151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(609839230345168336)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
