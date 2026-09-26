prompt --application/pages/page_00509
begin
--   Manifest
--     PAGE: 00509
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
 p_id=>509
,p_name=>'HR - Dashboard'
,p_alias=>'HR-DASHBOARD'
,p_step_title=>'HR - Dashboard'
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
'.com_oracle_apex_d3_tree_node{',
'',
'  font-size: .8rem;',
'',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471031118495099617)
,p_plug_name=>'Active Employee'
,p_static_id=>'active-employee'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
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
 p_id=>wwv_flow_imp.id(441216062505574202)
,p_region_id=>wwv_flow_imp.id(471031118495099617)
,p_chart_type=>'combo'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441217722773574202)
,p_chart_id=>wwv_flow_imp.id(441216062505574202)
,p_static_id=>'active-employee'
,p_seq=>10
,p_name=>'Active Employee'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.FIN_YEAR, ',
'REPLACE(b.Fin_Year,''-'','''') FYCODE,',
'Count(DISTINCT A.TNO) As ActiveMember',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) <= B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > b.FIN_YEAR_END)',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate > b.FIN_YEAR_END)',
'   and a.employeecode not in (''AS'',''VAS'')',
' Group By b.fin_year',
'',
''))
,p_series_type=>'bar'
,p_series_name_column_name=>'ACTIVEMEMBER'
,p_items_value_column_name=>'ACTIVEMEMBER'
,p_items_label_column_name=>'FIN_YEAR'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'JavaScript:$s(''P509_FINYEAR'' ,&FYCODE. );'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441218308381574203)
,p_chart_id=>wwv_flow_imp.id(441216062505574202)
,p_static_id=>'new-hiring'
,p_seq=>20
,p_name=>'New Hiring'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.FIN_YEAR, ',
'REPLACE(b.Fin_Year,''-'','''') FYCODE,',
'Count(A.TNO) As NewHiring',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) = B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.dateofjoining Between b.FIN_YEAR_BIGIN And b.FIN_YEAR_END',
'   and a.employeecode not in (''AS'',''VAS'')',
' Group By b.fin_year',
''))
,p_series_type=>'line'
,p_items_value_column_name=>'NEWHIRING'
,p_items_label_column_name=>'FIN_YEAR'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'JavaScript:$s(''P509_FINYEAR'' ,&FYCODE. );'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441217149100574202)
,p_chart_id=>wwv_flow_imp.id(441216062505574202)
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
 p_id=>wwv_flow_imp.id(441216499899574202)
,p_chart_id=>wwv_flow_imp.id(441216062505574202)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(451218833816190675)
,p_name=>'Active  Manpower'
,p_static_id=>'active-manpower'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>4
,p_display_column=>1
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select --B.FIN_YEAR,',
'       ''Active Member'' As Type,',
'     --  Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NoofEmployee,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
'  Where a.dateofjoining = B.FIN_DATE(+)',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > TO_DATE(:P509_MONTH,''YYYYMM''))',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate >TO_DATE(:P509_MONTH,''YYYYMM''))',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
'   And ( :P509_MONTH IS NULL OR Nvl(TO_NUMBER(to_char(b.FIN_DATE, ''RRRRMM'')), ''190001'') <=',
'       TO_NUMBER(:P509_MONTH))',
'',
'Union All',
'Select --B.FIN_YEAR,',
'       ''New Hiring'' As Type,',
'    --   Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NewHiring,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(A.dateofjoining) = B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And TO_CHAR(a.dateofjoining,''RRRRMM'') = :P509_MONTH',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
' Group By b.fin_year',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441197977529574191)
,p_query_column_id=>3
,p_column_alias=>'COST'
,p_column_display_sequence=>50
,p_column_heading=>'COST'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441197656872574191)
,p_query_column_id=>2
,p_column_alias=>'NOOFEMPLOYEE'
,p_column_display_sequence=>40
,p_column_heading=>'NO OF EMPLOYEE'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441197249415574191)
,p_query_column_id=>1
,p_column_alias=>'TYPE'
,p_column_display_sequence=>20
,p_column_heading=>'TYPE'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(471080261786856297)
,p_name=>'Department Wise Employee'
,p_static_id=>'department-wise-employee'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_template=>4072358936313175081
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_grid_column_css_classes=>'.region1{background-color: gainsboro;height: 240px;}'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTCODE,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTNAME,',
'       ''ACTIVE'' AS TYPE,',
'     --  Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NoofEmployee,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
'   Where a.dateofjoining = B.FIN_DATE(+)',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > b.FIN_YEAR_END)',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate > b.FIN_YEAR_END)',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
'   And ( :P509_MONTH IS NULL OR Nvl(TO_NUMBER(to_char(b.FIN_DATE, ''RRRRMM'')), ''190001'') <=',
'       TO_NUMBER(:P509_MONTH))',
'',
' Group By GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) ,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE)',
'Union All',
'Select --B.FIN_YEAR,',
'        GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTCODE,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTNAME,',
'       ''NEW JOINING'' AS TYPE,',
'    --   Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NewHiring,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) = B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And ( :P509_MONTH IS NULL OR TO_CHAR(a.dateofjoining,''RRRRMM'') = :P509_MONTH )',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
' Group By GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) ,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P509_FINYEAR'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441196411593574190)
,p_query_column_id=>5
,p_column_alias=>'COST'
,p_column_display_sequence=>50
,p_column_heading=>'Cost'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441194775278574190)
,p_query_column_id=>1
,p_column_alias=>'DEPARTMENTCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441195215966574190)
,p_query_column_id=>2
,p_column_alias=>'DEPARTMENTNAME'
,p_column_display_sequence=>20
,p_column_heading=>'Departmentname'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441195981566574190)
,p_query_column_id=>4
,p_column_alias=>'NOOFEMPLOYEE'
,p_column_display_sequence=>40
,p_column_heading=>'Noofemployee'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441195591158574190)
,p_query_column_id=>3
,p_column_alias=>'TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471029226329099598)
,p_plug_name=>'Department Wise Man Power'
,p_static_id=>'department-wise-man-power'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--stacked:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select --B.FIN_YEAR,',
' ',
'       GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTCODE,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTNAME,',
'     --  Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NoofEmployee,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
'  Where a.dateofjoining = B.FIN_DATE(+)',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > b.FIN_YEAR_END)',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate > b.FIN_YEAR_END)',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
'   And ( Nvl(TO_NUMBER(to_char(b.FIN_DATE, ''RRRRMM'')), ''190001'') <=',
'       TO_NUMBER(:P509_MONTH))',
'',
' Group By GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) ,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE)',
'Union All',
'Select --B.FIN_YEAR,',
'        GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTCODE,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTNAME,',
'',
'    --   Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NewHiring,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) = B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.dateofjoining Between b.FIN_YEAR_BIGIN And b.FIN_YEAR_END',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
' and ( to_char(b.fin_date,''YYYYMM'') = :P509_MONTH )',
' Group By GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) ,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE)'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P509_MONTH'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441211819224574200)
,p_region_id=>wwv_flow_imp.id(471029226329099598)
,p_chart_type=>'combo'
,p_title=>'Department Wise Active Employee'
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
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441214150883574201)
,p_chart_id=>wwv_flow_imp.id(441211819224574200)
,p_static_id=>'active-employee'
,p_seq=>10
,p_name=>'Active Employee '
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select --B.FIN_YEAR,',
' ',
'       GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTCODE,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTNAME,',
'     --  Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(DISTINCT A.TNO) As NoofEmployee,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
'  Where a.dateofjoining = B.FIN_DATE(+)',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > b.FIN_YEAR_END)',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate > b.FIN_YEAR_END)',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
'   And ( :P509_MONTH IS NULL OR Nvl(TO_NUMBER(to_char(b.FIN_DATE, ''RRRRMM'')), ''190001'') <=',
'       TO_NUMBER(:P509_MONTH))',
'',
' Group By GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) ,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE)'))
,p_series_type=>'bar'
,p_series_name_column_name=>'DEPARTMENTNAME'
,p_items_value_column_name=>'NOOFEMPLOYEE'
,p_items_z_column_name=>'COST'
,p_items_label_column_name=>'DEPARTMENTNAME'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441214718445574201)
,p_chart_id=>wwv_flow_imp.id(441211819224574200)
,p_static_id=>'new'
,p_seq=>20
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select --B.FIN_YEAR,',
'        GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTCODE,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE) AS DEPARTMENTNAME,',
'',
'    --   Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NewHiring,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) = B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.dateofjoining Between b.FIN_YEAR_BIGIN And b.FIN_YEAR_END',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
' and ( to_char(b.fin_date,''YYYYMM'') = :P509_MONTH )',
' Group By GETEMPLOYEEDEPARTMENTCODE(A.EMPLOYEECODE,B.FIN_DATE) ,',
'       GETEMPLOYEEDEPARTMENTNAME(A.EMPLOYEECODE,B.FIN_DATE)'))
,p_series_type=>'line'
,p_items_value_column_name=>'NEWHIRING'
,p_items_label_column_name=>'DEPARTMENTNAME'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441212329134574200)
,p_chart_id=>wwv_flow_imp.id(441211819224574200)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Department '
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
 p_id=>wwv_flow_imp.id(441212954346574200)
,p_chart_id=>wwv_flow_imp.id(441211819224574200)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Employee'
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
 p_id=>wwv_flow_imp.id(441213507684574200)
,p_chart_id=>wwv_flow_imp.id(441211819224574200)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(451484646871552878)
,p_name=>'ESIC Contribution'
,p_static_id=>'esic-contribution'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_template=>4072358936313175081
,p_display_sequence=>100
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_column=>5
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select dp.DepartmentCode,',
'       RPAD('' . '', (Level - 1) * 2) || getdepartmentname(z.DEPARTMENTCODE) As TREE,',
'       z.EmployeeESI,',
'       z.EmployerESI',
'  From (Select m.DepartmentCode,',
'               Sum(a.EARNEDESICEMPLOYEECONTRIBUTION) As EmployeeESI,',
'               Sum(a.EARNEDESICCOMPCONTRIBUTION) As EmployerESI',
'          From SalaryEngineDetail a, MyEmployeeInclude m',
'         Where TO_CHAR(a.SalaryFromDate, ''YYYYMM'') = :P509_MONTH',
'           And a.StaffType != ''HAMAL''',
'           And a.EmployeeCode = m.ChildCode',
'         Group By m.DepartmentCode',
'        ',
'        ) z,',
'       Department dp',
' Where z.DepartmentCode = dp.DepartmentCode',
'   And Level <= 2',
' Start With dp.ParentCode Is Null',
'Connect By Prior dp.DepartmentCode = dp.ParentCode',
' Order By Level, TREE',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P509_MONTH'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441205177164574196)
,p_query_column_id=>1
,p_column_alias=>'DEPARTMENTCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441206064589574196)
,p_query_column_id=>3
,p_column_alias=>'EMPLOYEEESI'
,p_column_display_sequence=>30
,p_column_heading=>'Employeeesi'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441206436487574196)
,p_query_column_id=>4
,p_column_alias=>'EMPLOYERESI'
,p_column_display_sequence=>40
,p_column_heading=>'Employeresi'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441205616944574196)
,p_query_column_id=>2
,p_column_alias=>'TREE'
,p_column_display_sequence=>20
,p_column_heading=>'DEPARTMENT NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(451219717169190683)
,p_name=>'Gender Wise Manpower'
,p_static_id=>'gender-wise-manpower'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_template=>4072358936313175081
,p_display_sequence=>70
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_column=>5
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  a.gender,',
'       ''Active Member'' As Type,',
'     --  Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NoofEmployee,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
'  Where a.dateofjoining = B.FIN_DATE(+)',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > TO_DATE(:P509_MONTH,''YYYYMM''))',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate >TO_DATE(:P509_MONTH,''YYYYMM''))',
'   AND A.EMPLOYEECODE NOT IN (''AS'',''VAS'')',
'   And ( :P509_MONTH IS NULL OR Nvl(TO_NUMBER(to_char(b.FIN_DATE, ''RRRRMM'')), ''190001'') <=',
'       TO_NUMBER(:P509_MONTH))',
'',
' Group By a.gender',
'Union All',
'Select a.gender,',
'       ''New Hiring'' As Type,',
'    --   Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(A.TNO) As NewHiring,',
'       Sum(a.monthlyctc) As Cost',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) = B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And ( :P509_MONTH IS NULL OR TO_CHAR(a.dateofjoining,''RRRRMM'')= :P509_MONTH )',
' Group By a.gender',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441200053098574193)
,p_query_column_id=>4
,p_column_alias=>'COST'
,p_column_display_sequence=>40
,p_column_heading=>'COST'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441198812672574192)
,p_query_column_id=>1
,p_column_alias=>'GENDER'
,p_column_display_sequence=>10
,p_column_heading=>'GENDER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441199660479574192)
,p_query_column_id=>3
,p_column_alias=>'NOOFEMPLOYEE'
,p_column_display_sequence=>30
,p_column_heading=>'NO OF EMPLOYEE'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441199218226574192)
,p_query_column_id=>2
,p_column_alias=>'TYPE'
,p_column_display_sequence=>20
,p_column_heading=>'TYPE'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471028805691099594)
,p_plug_name=>'Manpower'
,p_static_id=>'manpower'
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
 p_id=>wwv_flow_imp.id(471029177517099597)
,p_plug_name=>'Month Wise Active Employee'
,p_static_id=>'month-wise-active-employee'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent7:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct Replace(B.FIN_YEAR, ''-'', '''') As FINYEAR,',
'                To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR'') As Month,',
'                To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'') As Monthyy,',
'                Count(Distinct A.EMPLOYEECODE) As ACTIVE',
'  From BI_DATETIME B, EMPLOYEE A',
' Where (Replace(B.FIN_YEAR, ''-'', '''') =:P509_FINYEAR OR :P509_FINYEAR IS NULL )',
'   And TO_DATE(B.FIN_MONTH_END_DATE, ''DD-MM-RRRR'') >=',
'       TO_DATE(A.DATEOFJOINING, ''DD-MM-RRRR'')',
' Group By Replace(B.FIN_YEAR, ''-'', ''''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'')',
'',
'UNION ALL',
'Select Distinct Replace(B.FIN_YEAR, ''-'', '''') As FINYEAR,',
'                To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR'') As Month,',
'                To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'') As Monthyy,',
'                Count(Distinct A.EMPLOYEECODE) As NEWJOINING',
'  From BI_DATETIME B, EMPLOYEE A',
' Where (Replace(B.FIN_YEAR, ''-'', '''') = :P509_FINYEAR OR :P509_FINYEAR IS NULL )',
'   And TO_DATE(A.DATEOFJOINING, ''DD-MM-RRRR'') Between',
'       TO_DATE(B.FIN_MONTH_START_DATE, ''DD-MM-RRRR'') And',
'       TO_DATE(B.FIN_MONTH_END_DATE, ''DD-MM-RRRR'')',
'',
' Group By Replace(B.FIN_YEAR, ''-'', ''''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'')',
'Order By 3',
''))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P509_MONTH'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441207948573574197)
,p_region_id=>wwv_flow_imp.id(471029177517099597)
,p_chart_type=>'combo'
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
 p_id=>wwv_flow_imp.id(441209657768574198)
,p_chart_id=>wwv_flow_imp.id(441207948573574197)
,p_static_id=>'months-bar-chart'
,p_seq=>10
,p_name=>'Months Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.FIN_YEAR,',
'       To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR'') As Month,',
'       To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'') As Monthyy,',
'       ',
'       Replace(b.Fin_Year, ''-'', '''') FYCODE,',
'       Count(Distinct A.TNO) As ActiveMember',
'--       Count(A.TNO) As ActiveMember',
'  From EMPLOYEE A, BI_DATETIME B, DocumentstatusDetail c',
' Where Trunc(C.STATUSTIME) <= B.FIN_DATE',
'   And a.tno = c.moduletno(+)',
'   And c.documentstatuscode = ''ACTIVE''',
'   And Not Exists (Select aa.tno',
'          From Resignation aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.resignationdate > b.FIN_YEAR_END)',
'   And Not Exists (Select aa.tno',
'          From Termination aa',
'         Where aa.employeecode = a.employeecode',
'           And aa.Terminationdate > b.FIN_YEAR_END)',
'   And a.employeecode Not In (''AS'', ''VAS'')',
'   And (Replace(B.FIN_YEAR, ''-'', '''') = :P509_FINYEAR Or',
'        :P509_FINYEAR Is Null)',
'   And TO_DATE(B.FIN_MONTH_END_DATE, ''DD-MM-RRRR'') >=',
'       TO_DATE(A.DATEOFJOINING, ''DD-MM-RRRR'')',
' Group By b.fin_year,',
'          To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'')',
''))
,p_ajax_items_to_submit=>'P509_MONTH'
,p_series_type=>'bar'
,p_items_value_column_name=>'ACTIVEMEMBER'
,p_items_label_column_name=>'MONTH'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P509_MONTH'',&MONTHYY.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441210211174574199)
,p_chart_id=>wwv_flow_imp.id(441207948573574197)
,p_static_id=>'new-hiring'
,p_seq=>20
,p_name=>'New Hiring'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct Replace(B.FIN_YEAR, ''-'', '''') As FINYEAR,',
'                To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR'') As Month,',
'                To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'') As Monthyy,',
'                Count(Distinct A.EMPLOYEECODE) As NEWJOINING',
'  From BI_DATETIME B, EMPLOYEE A',
' Where (Replace(B.FIN_YEAR, ''-'', '''') = :P509_FINYEAR OR :P509_FINYEAR IS NULL )',
'   And TO_DATE(A.DATEOFJOINING, ''DD-MM-RRRR'') Between',
'       TO_DATE(B.FIN_MONTH_START_DATE, ''DD-MM-RRRR'') And',
'       TO_DATE(B.FIN_MONTH_END_DATE, ''DD-MM-RRRR'')',
'',
' Group By Replace(B.FIN_YEAR, ''-'', ''''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''MON-RRRR''),',
'          To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM'')',
'Order By TO_NUMBER(To_Char(B.FIN_MONTH_END_DATE, ''RRRRMM''))',
''))
,p_ajax_items_to_submit=>'P509_MONTH'
,p_series_type=>'line'
,p_series_name_column_name=>'NEWJOINING'
,p_items_value_column_name=>'NEWJOINING'
,p_items_label_column_name=>'MONTH'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441208401320574198)
,p_chart_id=>wwv_flow_imp.id(441207948573574197)
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
 p_id=>wwv_flow_imp.id(441208969359574198)
,p_chart_id=>wwv_flow_imp.id(441207948573574197)
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
 p_id=>wwv_flow_imp.id(471029068301099596)
,p_plug_name=>'Organisation Chart'
,p_static_id=>'organisation-chart'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--standardPadding:t-Form--stretchInputs'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.tno As Id,',
'       C.tno As PARENT_ID,',
'       (Select Count(AA.CHILDCODE)',
'          From MYEMPLOYEEINCLUDE AA',
'         Where AA.DEPARTMENTCODE = B.DEPARTMENTCODE) As NoOfEmp,',
'       (Select Sum(bb.monthlyctc)',
'          From MyEmployeeInclude aa, Employee Bb',
'         Where aa.CHILDCODE = bb.employeecode',
'           And AA.DEPARTMENTCODE = B.DEPARTMENTCODE) As Cost,',
'       B.DepartmentName AS DisplayName,',
'       Null As Link,',
'       Null As Infostring',
'  From DEPARTMENT B, Department c',
' Where B.PARENTCODE = C.DEPARTMENTCODE(+)',
' '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.D3.COLL.TREE'
,p_ajax_items_to_submit=>'P509_MONTH'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'DEFAULT',
  'attribute_04', 'N',
  'attribute_11', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '  "trdur":                       500,',
    '  "css_class_node":              "com_oracle_apex_d3_tree_node",',
    '  "css_class_leafnode":          "com_oracle_apex_d3_tree_leafnode",',
    '  "css_class_link":              "com_oracle_apex_d3_tree_link",',
    '  "circle_radius_min":           05,',
    '  "circle_radius_max":           05,',
    '  "legend_column_width":         500,',
    '  "root_label":                  "PBS",',
    '  "show_coll_child_cnt":         true,',
    '  "show_coll_child_template":    " (#CNT#)",',
    '  "offset_scrollbars":           20, ',
    '  "margin":                      {"top": 20, "right": 500, "bottom": 20, "left": 120}',
    '}')),
  'attribute_12', 'DISPLAYNAME',
  'attribute_13', 'NOOFEMP',
  'attribute_14', 'ID',
  'attribute_15', 'PARENT_ID',
  'attribute_16', 'PARENT_ID',
  'attribute_18', 'COST',
  'attribute_19', '180',
  'attribute_20', 'Y',
  'attribute_24', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(451483736752552869)
,p_name=>'PF Contribution'
,p_static_id=>'pf-contribution'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_template=>4072358936313175081
,p_display_sequence=>90
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>4
,p_display_column=>1
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select dp.DepartmentCode,',
'       RPAD('' . '', (Level - 1) * 2) || getdepartmentname(z.DEPARTMENTCODE) As TREE,',
'       z.EmployeePF,',
'       z.EmployerPF',
'  From (Select m.DepartmentCode,',
'               Sum(a.EARNEDPFCOMPCONTRIBUTION) As EmployeePF,',
'               Sum(a.EARNEDPFEMPLOYEECONTRIBUTION) As EmployerPF',
'          From SalaryEngineDetail a, MyEmployeeInclude m',
'         Where TO_CHAR(a.SalaryFromDate, ''YYYYMM'') = :P509_MONTH',
'           And a.StaffType != ''HAMAL''',
'           And a.EmployeeCode = m.ChildCode',
'         Group By m.DepartmentCode',
'        ',
'        ) z,',
'       Department dp',
' Where z.DepartmentCode = dp.DepartmentCode',
'   And Level <= 2',
' Start With dp.ParentCode Is Null',
'Connect By Prior dp.DepartmentCode = dp.ParentCode',
' Order By Level, TREE',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P509_MONTH'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441203191246574194)
,p_query_column_id=>1
,p_column_alias=>'DEPARTMENTCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441204031555574195)
,p_query_column_id=>3
,p_column_alias=>'EMPLOYEEPF'
,p_column_display_sequence=>30
,p_column_heading=>'EMPLOYEE CONTRIBUTION'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441204463602574195)
,p_query_column_id=>4
,p_column_alias=>'EMPLOYERPF'
,p_column_display_sequence=>40
,p_column_heading=>'EMPLOYER CONTRIBUTION'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441203667614574195)
,p_query_column_id=>2
,p_column_alias=>'TREE'
,p_column_display_sequence=>20
,p_column_heading=>'DEPARTMENT NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(451483038198552862)
,p_name=>'Remuneration'
,p_static_id=>'remuneration'
,p_parent_plug_id=>wwv_flow_imp.id(471028805691099594)
,p_template=>4072358936313175081
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select dp.DepartmentCode,',
'       RPAD('' . '', (Level - 1) * 2) || getdepartmentname(z.DEPARTMENTCODE) As TREE,',
'       z.SalaryAmount,',
'       z.OTAmount,',
'       z.TotalSALOTAmount',
'  From (Select m.DepartmentCode,',
'               Sum(a.NetEarning) - Sum(a.otamount) As SalaryAmount,',
'               Sum(a.otamount) As OTAmount,',
'               Sum(a.NetEarning) As TotalSALOTAmount',
'          From SalaryEngineDetail a, MyEmployeeInclude m',
'         Where TO_CHAR(a.SalaryFromDate, ''YYYYMM'') = :P509_MONTH    ',
'           And a.StaffType != ''HAMAL''',
'           And a.EmployeeCode = m.ChildCode',
'         Group By m.DepartmentCode',
'        ',
'        ) z,',
'       Department dp',
' Where z.DepartmentCode = dp.DepartmentCode',
'   And Level <= 2',
' Start With dp.ParentCode Is Null',
'Connect By Prior dp.DepartmentCode = dp.ParentCode',
' Order By Level, TREE',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P509_MONTH'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441200857609574193)
,p_query_column_id=>1
,p_column_alias=>'DEPARTMENTCODE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441202017702574194)
,p_query_column_id=>4
,p_column_alias=>'OTAMOUNT'
,p_column_display_sequence=>40
,p_column_heading=>'OVERTIME'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441201646669574194)
,p_query_column_id=>3
,p_column_alias=>'SALARYAMOUNT'
,p_column_display_sequence=>30
,p_column_heading=>'SALERY'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441202387108574194)
,p_query_column_id=>5
,p_column_alias=>'TOTALSALOTAMOUNT'
,p_column_display_sequence=>50
,p_column_heading=>'TOTAL SALARY + OT'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441201177994574193)
,p_query_column_id=>2
,p_column_alias=>'TREE'
,p_column_display_sequence=>20
,p_column_heading=>'DEPARTMENT NAME'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451418898198044257)
,p_name=>'P509_FINYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(471031118495099617)
,p_prompt=>'YEAR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451400195569044247)
,p_name=>'P509_FIN_QTR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(471029068301099596)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451413431795044254)
,p_name=>'P509_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(471029226329099598)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451406808119044251)
,p_name=>'P509_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(471029177517099597)
,p_prompt=>'MONTH'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451407259772044251)
,p_name=>'P509_QUARTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(471029177517099597)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441224194932574205)
,p_name=>'FINYEARCHANGE'
,p_static_id=>'finyearchange'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P509_FINYEAR'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441224740956574205)
,p_event_id=>wwv_flow_imp.id(441224194932574205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471029177517099597)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441600941225238270)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441601274020238271)
,p_event_id=>wwv_flow_imp.id(441600941225238270)
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
 p_id=>wwv_flow_imp.id(441220320273574204)
,p_name=>'Month Wise  Active Emp P509_month Change'
,p_static_id=>'month-wise-active-emp-p509-month-change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P509_MONTH'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441220803991574204)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471029226329099598)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441221348062574204)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(451219717169190683)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441221771072574204)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471080261786856297)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441222341238574205)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(451218833816190675)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441222781878574205)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(451483038198552862)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441223344188574205)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(451483736752552869)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441223855118574205)
,p_event_id=>wwv_flow_imp.id(441220320273574204)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-7'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(451484646871552878)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441219434158574203)
,p_name=>'Refresh Month Chart'
,p_static_id=>'refresh-month-chart'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P509_FIN_QTR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441219966335574204)
,p_event_id=>wwv_flow_imp.id(441219434158574203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P509_MONTH'
);
wwv_flow_imp.component_end;
end;
/
