
prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
end;
/

prompt APPLICATION 105 - Imart
--
-- Application Export:
--   Application:     105
--   Name:            Imart
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 1100
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_01100
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1100);
end;
/
prompt --application/pages/page_01100
begin
wwv_flow_imp_page.create_page(
 p_id=>1100
,p_name=>'ERP Activity & Audit Dashboard'
,p_alias=>'ACTIVITY-MONITORING'
,p_step_title=>'ERP Activity & Audit Dashboard'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'apex.jQuery(''#P1100_FROM,#P1100_TO'').on(''change'',function(){apex.item(''P1100_QUICK'').setValue(''CUSTOM'');});'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-bod'
||'y-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-co'
||'lor);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
''))
,p_step_template=>wwv_flow_imp.id(95002006100926)
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000002)
,p_plug_name=>'Reporting scope'
,p_static_id=>'activity-92002610200000002'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>2
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All perm'
||'itted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');',
' htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MON-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');',
' htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.h'
||'tml(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');',
' htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');',
' htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');',
'htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113''))||''">Activity detail</a>'');',
'htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');',
'htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');',
' htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000004)
,p_plug_name=>'Common reporting filters'
,p_static_id=>'activity-92002610200000004'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>5
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000025)
,p_plug_name=>'Activity KPIs'
,p_static_id=>'activity-92002610200000025'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare r sys_refcursor;begin',
' for r in (select count(*) total_events,',
' sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,',
' sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,',
' sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,',
' sum(case when operation=''INSERT'' then 1 else 0 end) inserts,',
' sum(case when operation=''UPDATE'' then 1 else 0 end) updates,',
' sum(case when operation=''DELETE'' then 1 else 0 end) deletes,',
' sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,',
' count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,',
' count(distinct record_identity) distinct_records,',
' sum(successful_row_operation) successful_row_operations,sum(case when original_action=''LOGIN'' and outcome=''FAILURE'' then 1 else 0 end) failed_logins from IMART_ACTIVITY_SCOPE_V) loop',
' htp.p(''<div class="am-kpis">'');',
' htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113''))||''"><span>Total activity events</span><strong>''||to_char(nvl(r.total_events,0),''FM999G999G999G990'')||''</strong><small>View captured a'
||'ctivity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ROW_SUCCESS,1''))||''"><span>Successful row operations</span><strong>''||to_char(nvl(r.successful_r'
||'ow_operations,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OUTCOME,FAILURE''))||''"><span>Captured failure events</span><strong>''||to_char(nvl(r.failed_event'
||'s,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''KEYED,1''))||''"><span>Distinct records affected</span><strong>''||to_char(nvl(r.distinct_records,0'
||'),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''SOURCE,APEX_USER''))||''"><span>Active ERP users</span><strong>''||to_char(nvl(r.active_users,0),''F'
||'M999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION,INSERT''))||''"><span>Insert events</span><strong>''||to_char(nvl(r.inserts,0),''FM999G999G99'
||'9G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION,UPDATE''))||''"><span>Update events</span><strong>''||to_char(nvl(r.updates,0),''FM999G999G99'
||'9G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION,DELETE''))||''"><span>Delete events</span><strong>''||to_char(nvl(r.deletes,0),''FM999G999G99'
||'9G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OUTCOME,OBSERVED''))||''"><span>Observed events</span><strong>''||to_char(nvl(r.observed_events,0),'
||'''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''ACTION,LOGIN,OUTCOME,FAILURE''))||''"><span>Failed login events</span><strong>''|'
||'|to_char(nvl(r.failed_logins,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OUTCOME,SUCCESS''))||''"><span>Successful events</span><strong>''||to_char(nvl(r.successful_events,'
||'0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OTHEROPS,1''))||''"><span>Other operation events</span><strong>''||to_char(nvl(r.other_events,0),''F'
||'M999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
' htp.p(''</div><p class="am-note">Successful row operations count only successful ROW_CHANGE events. Total events also include observed page access, authentication, errors and high-level business events. Missing history is not inactivity. <a href="''||'
||'apex_escape.html_attribute(apex_page.get_url(p_page=>1115))||''">Counting rules and coverage</a></p>'');',
' end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000027)
,p_plug_name=>'Activity trend'
,p_static_id=>'activity-92002610200000027'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000026)
,p_region_id=>wwv_flow_imp.id(92002610200000027)
,p_chart_type=>'line'
,p_height=>'330'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
,p_no_data_found_message=>'No captured events in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000028)
,p_chart_id=>wwv_flow_imp.id(92002610200000026)
,p_static_id=>'activity-trend'
,p_seq=>10
,p_name=>'Activity trend'
,p_data_source_type=>'SQL'
,p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||re'
||'place(replace(nvl(to_char(series),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select to_char(local_timestamp,case apex_util.get_session_state(''P1100_GRAIN'') when ''HOUR'' then ''YYYY-MM-DD HH24'' when ''MONTH'' then ''YYYY-MM'' else ''YYYY-MM-DD'' end) la'
||'bel,operation series,count(*) value from IMART_ACTIVITY_SCOPE_V group by to_char(local_timestamp,case apex_util.get_session_state(''P1100_GRAIN'') when ''HOUR'' then ''YYYY-MM-DD HH24'' when ''MONTH'' then ''YYYY-MM'' else ''YYYY-MM-DD'' end),operation) x'
,p_series_type=>'line'
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'&DRILL_URL.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000029)
,p_chart_id=>wwv_flow_imp.id(92002610200000026)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000030)
,p_chart_id=>wwv_flow_imp.id(92002610200000026)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000032)
,p_plug_name=>'Operation distribution'
,p_static_id=>'activity-92002610200000032'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>21
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000031)
,p_region_id=>wwv_flow_imp.id(92002610200000032)
,p_chart_type=>'donut'
,p_height=>'330'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No captured events in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000033)
,p_chart_id=>wwv_flow_imp.id(92002610200000031)
,p_static_id=>'operation-distribution'
,p_seq=>10
,p_name=>'Operation distribution'
,p_data_source_type=>'SQL'
,p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select operation label,o'
||'peration series,count(*) value from IMART_ACTIVITY_SCOPE_V group by operation) x'
,p_series_type=>'donut'
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'&DRILL_URL.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000035)
,p_plug_name=>'Module activity (top 12 plus others)'
,p_static_id=>'activity-92002610200000035'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>22
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000034)
,p_region_id=>wwv_flow_imp.id(92002610200000035)
,p_chart_type=>'bar'
,p_height=>'330'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No captured events in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000036)
,p_chart_id=>wwv_flow_imp.id(92002610200000034)
,p_static_id=>'module-activity-top-12-plus-others'
,p_seq=>10
,p_name=>'Module activity (top 12 plus others)'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.label,x.series,x.value,case when drill_key=''~OTHER~'' then apex_page.get_url(p_page=>1103,p_clear_cache=>''RP'') else apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''MODULE''||'','''
||'||replace(replace(nvl(to_char(drill_key),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(series),''~NULL~''),''%'',''%25''),'','',''%2C'')) end drill_url from (select case when r.rn<=12 then e.module_name else ''Other modules'' e'
||'nd label,e.operation series,count(*) value,case when r.rn<=12 then e.module_code else ''~OTHER~'' end drill_key',
' from IMART_ACTIVITY_SCOPE_V e join (select module_code,row_number() over(order by count(*) desc,module_code) rn from IMART_ACTIVITY_SCOPE_V group by module_code) r on r.module_code=e.module_code',
' group by case when r.rn<=12 then e.module_name else ''Other modules'' end,e.operation,case when r.rn<=12 then e.module_code else ''~OTHER~'' end) x'))
,p_series_type=>'bar'
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'&DRILL_URL.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000037)
,p_chart_id=>wwv_flow_imp.id(92002610200000034)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000038)
,p_chart_id=>wwv_flow_imp.id(92002610200000034)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000040)
,p_plug_name=>'Top active ERP users'
,p_static_id=>'activity-92002610200000040'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>23
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000039)
,p_region_id=>wwv_flow_imp.id(92002610200000040)
,p_chart_type=>'bar'
,p_height=>'330'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
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
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No captured events in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000041)
,p_chart_id=>wwv_flow_imp.id(92002610200000039)
,p_static_id=>'top-active-erp-users'
,p_seq=>10
,p_name=>'Top active ERP users'
,p_data_source_type=>'SQL'
,p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''USER''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select user_name label,''Ev'
||'ents'' series,count(*) value from IMART_ACTIVITY_SCOPE_V where source_type=''APEX_USER'' and user_name is not null group by user_name order by value desc,user_name fetch first 10 rows only) x'
,p_series_type=>'bar'
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'&DRILL_URL.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000042)
,p_chart_id=>wwv_flow_imp.id(92002610200000039)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000043)
,p_chart_id=>wwv_flow_imp.id(92002610200000039)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000045)
,p_plug_name=>'Company and location comparison'
,p_static_id=>'activity-92002610200000045'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>24
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000044)
,p_region_id=>wwv_flow_imp.id(92002610200000045)
,p_chart_type=>'bar'
,p_height=>'330'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
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
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No captured events in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000046)
,p_chart_id=>wwv_flow_imp.id(92002610200000044)
,p_static_id=>'company-and-location-comparison'
,p_seq=>10
,p_name=>'Company and location comparison'
,p_data_source_type=>'SQL'
,p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''COMPANY''||'',''||replace(replace(nvl(to_char(drill_key),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''LOCATION''||'
||''',''||replace(replace(nvl(to_char(drill_location),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select company_name||'' / ''||location_name label,''Events'' series,count(*) value,company_code drill_key,location_code drill_location from IMART_ACTIVITY_S'
||'COPE_V group by company_name,location_name,company_code,location_code) x'
,p_series_type=>'bar'
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'&DRILL_URL.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000047)
,p_chart_id=>wwv_flow_imp.id(92002610200000044)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000048)
,p_chart_id=>wwv_flow_imp.id(92002610200000044)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000050)
,p_plug_name=>'Exception categories'
,p_static_id=>'activity-92002610200000050'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>25
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000049)
,p_region_id=>wwv_flow_imp.id(92002610200000050)
,p_chart_type=>'bar'
,p_height=>'330'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
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
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No captured events in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000051)
,p_chart_id=>wwv_flow_imp.id(92002610200000049)
,p_static_id=>'exception-categories'
,p_seq=>10
,p_name=>'Exception categories'
,p_data_source_type=>'SQL'
,p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''EXCEPTION''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select exception_reas'
||'on label,''Events'' series,count(*) value from IMART_ACTIVITY_SCOPE_V where exception_reason is not null group by exception_reason) x'
,p_series_type=>'bar'
,p_series_name_column_name=>'SERIES'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'&DRILL_URL.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000052)
,p_chart_id=>wwv_flow_imp.id(92002610200000049)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000053)
,p_chart_id=>wwv_flow_imp.id(92002610200000049)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000054)
,p_plug_name=>'MIS reports'
,p_static_id=>'activity-92002610200000054'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin htp.p(''<div class="hspl-directory-grid am-directory">'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-0" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1101))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Daily Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-1" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1102))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">User Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-2" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1103))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Module Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-3" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1104))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Company Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-4" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1105))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Location Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-5" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1106))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||unistr('ory-title">User \00D7 Module Matrix</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');'),
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-6" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1107))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||unistr('ory-title">Company \00D7 Location Matrix</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');'),
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-7" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1108))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Operation Activity MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-0" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1109))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Exception Activity MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-1" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1110))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Login and Session MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-2" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1111))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Master Data Change MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-3" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1112))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-direct'
||'ory-title">Administrative Entity Audit</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''</div>'');end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000001)
,p_plug_name=>'Activity page identity'
,p_static_id=>'activity-page-identity'
,p_region_attributes=>'style="display:contents"'
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">ERP Activity & Audit Dashboard</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92002610200000021)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_button_action=>'SUBMIT'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply / refresh'
,p_button_position=>'CHANGE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92002610200000022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_action=>'SUBMIT'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Clear filters'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(92002610200000024)
,p_branch_name=>'Applied reporting scope'
,p_branch_action=>'f?p=&APP_ID.:1100:&APP_SESSION.::&DEBUG.:RP'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000015)
,p_name=>'P1100_ACTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Operation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct operation d,operation r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100'
||'_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM'
||'-DD'') end+1 as timestamp),''Asia/Kolkata'') and operation is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000009)
,p_name=>'P1100_COMPANY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct company_code||'' - ''||company_name d,company_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_ut'
||'il.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_s'
||'tate(''P1100_TO''),''FXYYYY-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and company_code is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000020)
,p_name=>'P1100_DEPARTMENT'
,p_item_sequence=>85
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Current department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct current_department_name d,current_department_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_u'
||'til.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_'
||'state(''P1100_TO''),''FXYYYY-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and current_department_code is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000012)
,p_name=>'P1100_EMPLOYEE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Recorded employee code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct employee_code d,employee_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_stat'
||'e(''P1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''F'
||'XYYYY-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and employee_code is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000006)
,p_name=>'P1100_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Start date'
,p_format_mask=>'YYYY-MM-DD'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(92002610200000008)
,p_name=>'P1100_GRAIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_item_default=>'DAY'
,p_prompt=>'Time grouping'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Hour;HOUR,Day;DAY,Month;MONTH'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000010)
,p_name=>'P1100_LOCATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct location_code||'' - ''||location_name d,location_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex'
||'_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_sessio'
||'n_state(''P1100_TO''),''FXYYYY-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and location_code is not null and (apex_util.get_session_state(''P1100_COMPANY'') is null or company_code=apex_util.get_session_state(''P1100_COMPANY'')) order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_lov_cascade_parent_items=>'P1100_COMPANY'
,p_ajax_items_to_submit=>'P1100_COMPANY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000013)
,p_name=>'P1100_MODULE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct module_code||'' - ''||module_name d,module_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.'
||'get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_stat'
||'e(''P1100_TO''),''FXYYYY-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and module_code is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000016)
,p_name=>'P1100_OUTCOME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Outcome'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct outcome d,outcome r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FRO'
||'M''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'''
||') end+1 as timestamp),''Asia/Kolkata'') and outcome is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000014)
,p_name=>'P1100_PAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Screen'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct to_char(page_id)||'' - ''||page_name d,to_char(page_id) r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(ap'
||'ex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_sess'
||'ion_state(''P1100_TO''),''FXYYYY-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and to_char(page_id) is not null and (apex_util.get_session_state(''P1100_MODULE'') is null or module_code=apex_util.get_session_state(''P1100_MODULE'')) order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_lov_cascade_parent_items=>'P1100_MODULE'
,p_ajax_items_to_submit=>'P1100_MODULE'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000005)
,p_name=>'P1100_QUICK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_item_default=>'TODAY'
,p_prompt=>'Quick date selection'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Today;TODAY,Yesterday;YESTERDAY,This Week;WEEK,This Month;MONTH,Previous Month;PREVIOUS,Custom;CUSTOM'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000019)
,p_name=>'P1100_RECORD'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Exact record key'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000017)
,p_name=>'P1100_SOURCE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Source'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct source_type d,source_type r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P'
||'1100_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYY'
||'Y-MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and source_type is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000018)
,p_name=>'P1100_TABLE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'Entity'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct table_name d,table_name r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P11'
||'00_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-'
||'MM-DD'') end+1 as timestamp),''Asia/Kolkata'') and table_name is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000007)
,p_name=>'P1100_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'End date'
,p_format_mask=>'YYYY-MM-DD'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(92002610200000011)
,p_name=>'P1100_USER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(92002610200000004)
,p_prompt=>'ERP user'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct user_name d,user_name r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100'
||'_FROM''),''FXYYYY-MM-DD'') end as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast(case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM'
||'-DD'') end+1 as timestamp),''Asia/Kolkata'') and user_name is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All permitted / available'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000003)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize and validate shared reporting period'
,p_static_id=>'initialize-and-validate-shared-reporting-period'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare f date;t date;begin',
' if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''YYYY-MM-DD''));end if;',
' if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''YYYY-MM-DD''));end if;',
' f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') '
||'as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;',
' if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>92002610200000003
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000023)
,p_process_sequence=>1
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate and apply common scope'
,p_static_id=>'validate-and-apply-common-scope'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare f date;t date;d date:=trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date));begin',
' if :REQUEST=''CLEAR'' then',
' apex_util.set_session_state(''P1100_FROM'',null);',
'apex_util.set_session_state(''P1100_TO'',null);',
'apex_util.set_session_state(''P1100_COMPANY'',null);',
'apex_util.set_session_state(''P1100_LOCATION'',null);',
'apex_util.set_session_state(''P1100_USER'',null);',
'apex_util.set_session_state(''P1100_EMPLOYEE'',null);',
'apex_util.set_session_state(''P1100_DEPARTMENT'',null);',
'apex_util.set_session_state(''P1100_MODULE'',null);',
'apex_util.set_session_state(''P1100_PAGE'',null);',
'apex_util.set_session_state(''P1100_ACTION'',null);',
'apex_util.set_session_state(''P1100_OUTCOME'',null);',
'apex_util.set_session_state(''P1100_SOURCE'',null);',
'apex_util.set_session_state(''P1100_TABLE'',null);',
'apex_util.set_session_state(''P1100_RECORD'',null);',
' :P1100_QUICK:=''TODAY'';:P1100_GRAIN:=''DAY'';end if;',
' case nvl(:P1100_QUICK,''CUSTOM'') when ''TODAY'' then f:=d;t:=d;when ''YESTERDAY'' then f:=d-1;t:=d-1;when ''WEEK'' then f:=trunc(d,''IW'');t:=d;when ''MONTH'' then f:=trunc(d,''MM'');t:=d;when ''PREVIOUS'' then f:=add_months(trunc(d,''MM''),-1);t:=trunc(d,''MM'')-1;wh'
||'en ''CUSTOM'' then f:=to_date(:P1100_FROM default null on conversion error,''FXYYYY-MM-DD'');t:=to_date(:P1100_TO default null on conversion error,''FXYYYY-MM-DD'');else raise_application_error(-20840,''Invalid quick date selection'');end case;',
' if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;',
' if :P1100_GRAIN not in (''HOUR'',''DAY'',''MONTH'') or :P1100_GRAIN is null then raise_application_error(-20840,''Choose Hour, Day or Month.'');end if;',
' :P1100_FROM:=to_char(f,''YYYY-MM-DD'');:P1100_TO:=to_char(t,''YYYY-MM-DD'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>92002610200000023
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
