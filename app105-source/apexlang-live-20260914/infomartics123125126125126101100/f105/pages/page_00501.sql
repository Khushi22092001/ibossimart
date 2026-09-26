prompt --application/pages/page_00501
begin
--   Manifest
--     PAGE: 00501
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
 p_id=>wwv_flow_imp.id(594521648031666536)
,p_plug_name=>'Brand Cutsomer Revenue'
,p_static_id=>'brand-cutsomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433997369158093017)
,p_region_id=>wwv_flow_imp.id(594521648031666536)
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
 p_id=>wwv_flow_imp.id(433999073439093019)
,p_chart_id=>wwv_flow_imp.id(433997369158093017)
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
 p_id=>wwv_flow_imp.id(433997888031093017)
,p_chart_id=>wwv_flow_imp.id(433997369158093017)
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
 p_id=>wwv_flow_imp.id(433998479923093018)
,p_chart_id=>wwv_flow_imp.id(433997369158093017)
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
 p_id=>wwv_flow_imp.id(592225088202577737)
,p_plug_name=>'Brand Revenue'
,p_static_id=>'brand-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433981165325093004)
,p_region_id=>wwv_flow_imp.id(592225088202577737)
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
 p_id=>wwv_flow_imp.id(433981713206093005)
,p_chart_id=>wwv_flow_imp.id(433981165325093004)
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
 p_id=>wwv_flow_imp.id(592681010331912618)
,p_plug_name=>'Item Cutomer Revenue'
,p_static_id=>'item-cutomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433985958513093012)
,p_region_id=>wwv_flow_imp.id(592681010331912618)
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
 p_id=>wwv_flow_imp.id(433987673910093013)
,p_chart_id=>wwv_flow_imp.id(433985958513093012)
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
 p_id=>wwv_flow_imp.id(433986537384093012)
,p_chart_id=>wwv_flow_imp.id(433985958513093012)
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
 p_id=>wwv_flow_imp.id(433987106593093012)
,p_chart_id=>wwv_flow_imp.id(433985958513093012)
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
 p_id=>wwv_flow_imp.id(595101588062851956)
,p_plug_name=>'Item Revenue'
,p_static_id=>'item-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(434006663921093024)
,p_region_id=>wwv_flow_imp.id(595101588062851956)
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
 p_id=>wwv_flow_imp.id(434007182597093024)
,p_chart_id=>wwv_flow_imp.id(434006663921093024)
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
 p_id=>wwv_flow_imp.id(595152623520608655)
,p_plug_name=>'item spec Customer Revenue'
,p_static_id=>'item-spec-customer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(434010332960093029)
,p_region_id=>wwv_flow_imp.id(595152623520608655)
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
 p_id=>wwv_flow_imp.id(434012045315093029)
,p_chart_id=>wwv_flow_imp.id(434010332960093029)
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
 p_id=>wwv_flow_imp.id(434010803625093029)
,p_chart_id=>wwv_flow_imp.id(434010332960093029)
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
 p_id=>wwv_flow_imp.id(434011416479093029)
,p_chart_id=>wwv_flow_imp.id(434010332960093029)
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
 p_id=>wwv_flow_imp.id(594520656281666526)
,p_plug_name=>'Item Specification Revenue'
,p_static_id=>'item-specification-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433995612855093016)
,p_region_id=>wwv_flow_imp.id(594520656281666526)
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
 p_id=>wwv_flow_imp.id(433996137945093017)
,p_chart_id=>wwv_flow_imp.id(433995612855093016)
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
 p_id=>wwv_flow_imp.id(592680511216912613)
,p_plug_name=>'Main Group Customer Revenue'
,p_static_id=>'main-group-customer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433982969730093005)
,p_region_id=>wwv_flow_imp.id(592680511216912613)
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
 p_id=>wwv_flow_imp.id(433984746322093008)
,p_chart_id=>wwv_flow_imp.id(433982969730093005)
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
 p_id=>wwv_flow_imp.id(433984120775093008)
,p_chart_id=>wwv_flow_imp.id(433982969730093005)
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
 p_id=>wwv_flow_imp.id(433983460934093006)
,p_chart_id=>wwv_flow_imp.id(433982969730093005)
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
 p_id=>wwv_flow_imp.id(592224730331577733)
,p_plug_name=>'Main Group Revenue'
,p_static_id=>'main-group-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433979109683092996)
,p_region_id=>wwv_flow_imp.id(592224730331577733)
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
 p_id=>wwv_flow_imp.id(433979577757092998)
,p_chart_id=>wwv_flow_imp.id(433979109683092996)
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
 p_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(595101430034851954)
,p_plug_name=>'Revenue by HalfYearly'
,p_static_id=>'revenue-by-halfyearly'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(434000369311093020)
,p_region_id=>wwv_flow_imp.id(595101430034851954)
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
 p_id=>wwv_flow_imp.id(434000929140093021)
,p_chart_id=>wwv_flow_imp.id(434000369311093020)
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
 p_id=>wwv_flow_imp.id(595101539250851955)
,p_plug_name=>'Revenue by Months'
,p_static_id=>'revenue-by-months'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(434002203910093022)
,p_region_id=>wwv_flow_imp.id(595101539250851955)
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
 p_id=>wwv_flow_imp.id(434004528323093023)
,p_chart_id=>wwv_flow_imp.id(434002203910093022)
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
 p_id=>wwv_flow_imp.id(434003924687093023)
,p_chart_id=>wwv_flow_imp.id(434002203910093022)
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
 p_id=>wwv_flow_imp.id(434005075008093023)
,p_chart_id=>wwv_flow_imp.id(434002203910093022)
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
 p_id=>wwv_flow_imp.id(434002697655093022)
,p_chart_id=>wwv_flow_imp.id(434002203910093022)
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
 p_id=>wwv_flow_imp.id(434003325446093023)
,p_chart_id=>wwv_flow_imp.id(434002203910093022)
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
 p_id=>wwv_flow_imp.id(592816611239999213)
,p_plug_name=>'Revenue by Quarters'
,p_static_id=>'revenue-by-quarters'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433988981764093013)
,p_region_id=>wwv_flow_imp.id(592816611239999213)
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
 p_id=>wwv_flow_imp.id(433989552377093013)
,p_chart_id=>wwv_flow_imp.id(433988981764093013)
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
 p_id=>wwv_flow_imp.id(592817918883999226)
,p_plug_name=>'Sub Group Customer Revenue'
,p_static_id=>'sub-group-customer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433992630076093015)
,p_region_id=>wwv_flow_imp.id(592817918883999226)
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
 p_id=>wwv_flow_imp.id(433994259117093016)
,p_chart_id=>wwv_flow_imp.id(433992630076093015)
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
 p_id=>wwv_flow_imp.id(433993704650093016)
,p_chart_id=>wwv_flow_imp.id(433992630076093015)
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
 p_id=>wwv_flow_imp.id(433993061172093015)
,p_chart_id=>wwv_flow_imp.id(433992630076093015)
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
 p_id=>wwv_flow_imp.id(592817536704999222)
,p_plug_name=>'Sub Group  Revenue'
,p_static_id=>'sub-group-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(433990794195093014)
,p_region_id=>wwv_flow_imp.id(592817536704999222)
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
 p_id=>wwv_flow_imp.id(433991321612093015)
,p_chart_id=>wwv_flow_imp.id(433990794195093014)
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
 p_id=>wwv_flow_imp.id(595103480228851975)
,p_plug_name=>'Yearly Revenue'
,p_static_id=>'yearly-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(595101167424851952)
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
 p_id=>wwv_flow_imp.id(434008487260093025)
,p_region_id=>wwv_flow_imp.id(595103480228851975)
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
 p_id=>wwv_flow_imp.id(434008985790093027)
,p_chart_id=>wwv_flow_imp.id(434008487260093025)
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
 p_id=>wwv_flow_imp.id(592233658688577837)
,p_name=>'P501_BRAND'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592225088202577737)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(594852252550639022)
,p_name=>'P501_BRANDNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(594521648031666536)
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
 p_id=>wwv_flow_imp.id(583135013406383365)
,p_name=>'P501_FINYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(595103480228851975)
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
 p_id=>wwv_flow_imp.id(583111624977383350)
,p_name=>'P501_FIN_HALFYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(595101430034851954)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592840789935999327)
,p_name=>'P501_FIN_QTR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592816611239999213)
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
 p_id=>wwv_flow_imp.id(583129598009383361)
,p_name=>'P501_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(595101588062851956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(592229020792577827)
,p_name=>'P501_ITEMGROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592224730331577733)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(591790908082156847)
,p_name=>'P501_ITEMGROUPNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592680511216912613)
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
 p_id=>wwv_flow_imp.id(594829189693639007)
,p_name=>'P501_ITEMNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592681010331912618)
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
 p_id=>wwv_flow_imp.id(594557911098666647)
,p_name=>'P501_ITEMSPECIFICATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(594520656281666526)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(594878325686639042)
,p_name=>'P501_ITEMSPECIFICATIONNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(595152623520608655)
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
 p_id=>wwv_flow_imp.id(583123199718383358)
,p_name=>'P501_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(595101539250851955)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(583123584580383358)
,p_name=>'P501_QUARTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(595101539250851955)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(594524597457666617)
,p_name=>'P501_SELECTEDMONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(592224730331577733)
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
 p_id=>wwv_flow_imp.id(592845290126999338)
,p_name=>'P501_SUBGROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592817536704999222)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(594842055912639012)
,p_name=>'P501_SUBGROUPNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(592817918883999226)
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
 p_id=>wwv_flow_imp.id(434031960291093042)
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
 p_id=>wwv_flow_imp.id(434032513474093044)
,p_event_id=>wwv_flow_imp.id(434031960291093042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_BRANDNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434033533519093044)
,p_event_id=>wwv_flow_imp.id(434031960291093042)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594521648031666536)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434033991878093044)
,p_event_id=>wwv_flow_imp.id(434031960291093042)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594520656281666526)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434034516741093044)
,p_event_id=>wwv_flow_imp.id(434031960291093042)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595152623520608655)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434033026955093044)
,p_event_id=>wwv_flow_imp.id(434031960291093042)
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
 p_id=>wwv_flow_imp.id(434034882521093045)
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
 p_id=>wwv_flow_imp.id(434035390900093045)
,p_event_id=>wwv_flow_imp.id(434034882521093045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMSPECIFICATIONNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434036408285093045)
,p_event_id=>wwv_flow_imp.id(434034882521093045)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595152623520608655)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434035935508093045)
,p_event_id=>wwv_flow_imp.id(434034882521093045)
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
 p_id=>wwv_flow_imp.id(434017272522093035)
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
 p_id=>wwv_flow_imp.id(434017802723093035)
,p_event_id=>wwv_flow_imp.id(434017272522093035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEM,P501_ITEMGROUP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434018291762093036)
,p_event_id=>wwv_flow_imp.id(434017272522093035)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592224730331577733)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434018762453093036)
,p_event_id=>wwv_flow_imp.id(434017272522093035)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595152623520608655)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434019285470093036)
,p_event_id=>wwv_flow_imp.id(434017272522093035)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595101588062851956)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434019757427093036)
,p_event_id=>wwv_flow_imp.id(434017272522093035)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592225088202577737)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434020265756093037)
,p_event_id=>wwv_flow_imp.id(434017272522093035)
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
 p_id=>wwv_flow_imp.id(434020655979093037)
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
 p_id=>wwv_flow_imp.id(434021715282093037)
,p_event_id=>wwv_flow_imp.id(434020655979093037)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_SUBGROUP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434021226887093037)
,p_event_id=>wwv_flow_imp.id(434020655979093037)
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
 p_id=>wwv_flow_imp.id(434029114082093039)
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
 p_id=>wwv_flow_imp.id(434029642789093039)
,p_event_id=>wwv_flow_imp.id(434029114082093039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_SUBGROUPNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434030609368093042)
,p_event_id=>wwv_flow_imp.id(434029114082093039)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592817918883999226)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434031105628093042)
,p_event_id=>wwv_flow_imp.id(434029114082093039)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595101588062851956)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434031554966093042)
,p_event_id=>wwv_flow_imp.id(434029114082093039)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592681010331912618)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434030108192093042)
,p_event_id=>wwv_flow_imp.id(434029114082093039)
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
 p_id=>wwv_flow_imp.id(434040676765093046)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434041202277093047)
,p_event_id=>wwv_flow_imp.id(434040676765093046)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434036797453093045)
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
 p_id=>wwv_flow_imp.id(434037318645093045)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_ITEMNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434038318188093046)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592681010331912618)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434038758834093046)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592225088202577737)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434039262694093046)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594521648031666536)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434039763795093046)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594520656281666526)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434040281283093046)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595152623520608655)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434037770948093046)
,p_event_id=>wwv_flow_imp.id(434036797453093045)
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
 p_id=>wwv_flow_imp.id(434025383175093038)
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
 p_id=>wwv_flow_imp.id(434026385316093038)
,p_event_id=>wwv_flow_imp.id(434025383175093038)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592681010331912618)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434026872699093038)
,p_event_id=>wwv_flow_imp.id(434025383175093038)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595152623520608655)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434025875390093038)
,p_event_id=>wwv_flow_imp.id(434025383175093038)
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
 p_id=>wwv_flow_imp.id(434022973680093037)
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
 p_id=>wwv_flow_imp.id(434024036629093038)
,p_event_id=>wwv_flow_imp.id(434022973680093037)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595101588062851956)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434024526159093038)
,p_event_id=>wwv_flow_imp.id(434022973680093037)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592680511216912613)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434023532495093037)
,p_event_id=>wwv_flow_imp.id(434022973680093037)
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
 p_id=>wwv_flow_imp.id(434024959707093038)
,p_event_id=>wwv_flow_imp.id(434022973680093037)
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
 p_id=>wwv_flow_imp.id(434028205307093039)
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
 p_id=>wwv_flow_imp.id(434028740622093039)
,p_event_id=>wwv_flow_imp.id(434028205307093039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592225088202577737)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434013113128093032)
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
 p_id=>wwv_flow_imp.id(434013598736093033)
,p_event_id=>wwv_flow_imp.id(434013113128093032)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_MONTH,P501_ITEM,P501_FIN_QTR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434013982724093034)
,p_event_id=>wwv_flow_imp.id(434013113128093032)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592816611239999213)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434014488605093034)
,p_event_id=>wwv_flow_imp.id(434013113128093032)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595101539250851955)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434015048565093034)
,p_event_id=>wwv_flow_imp.id(434013113128093032)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595101588062851956)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434015544774093035)
,p_event_id=>wwv_flow_imp.id(434013113128093032)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595152623520608655)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434015859130093035)
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
 p_id=>wwv_flow_imp.id(434016367884093035)
,p_event_id=>wwv_flow_imp.id(434015859130093035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_FIN_HALFYEAR,P501_MONTH,P501_ITEM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434016940372093035)
,p_event_id=>wwv_flow_imp.id(434015859130093035)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(595101430034851954)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434027270185093038)
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
 p_id=>wwv_flow_imp.id(434027831634093039)
,p_event_id=>wwv_flow_imp.id(434027270185093038)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592817918883999226)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434022120029093037)
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
 p_id=>wwv_flow_imp.id(434022592543093037)
,p_event_id=>wwv_flow_imp.id(434022120029093037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(592817536704999222)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
