set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
begin
wwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1100,
 p_name=>'ERP Activity & Audit Dashboard',
 p_alias=>'ACTIVITY-MONITORING',
 p_step_title=>'ERP Activity & Audit Dashboard',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_javascript_code_onload=>'apex.jQuery(document).on(''input change'', ''#P1100_FROM_input,#P1100_TO_input,#P1100_FROM,#P1100_TO'', function () {
  apex.item(''P1100_QUICK'').setValue(''CUSTOM'');
});
',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'04');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000001),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">ERP Activity & Audit Dashboard</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000002),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000002',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000003),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000004),
 p_plug_name=>'Common reporting filters',
 p_static_id=>'activity-92002610200000004',
 p_plug_template=>wwv_flow_imp.id(2664334895415463485),
 p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody',
 p_plug_display_sequence=>5,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000005),
 p_name=>'P1100_QUICK',
 p_item_sequence=>10,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Quick date selection',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'Y',
 p_item_default=>'TODAY',
 p_lov=>'STATIC:Today;TODAY,Yesterday;YESTERDAY,This Week;WEEK,This Month;MONTH,Previous Month;PREVIOUS,Custom;CUSTOM',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000006),
 p_name=>'P1100_FROM',
 p_item_sequence=>20,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Start date',
 p_display_as=>'NATIVE_DATE_PICKER_APEX',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_format_mask=>'DD-MM-YYYY',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('display_as','POPUP','max_date','NONE','min_date','NONE','multiple_months','N','show_time','N','use_defaults','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000007),
 p_name=>'P1100_TO',
 p_item_sequence=>30,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'End date',
 p_display_as=>'NATIVE_DATE_PICKER_APEX',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_format_mask=>'DD-MM-YYYY',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('display_as','POPUP','max_date','NONE','min_date','NONE','multiple_months','N','show_time','N','use_defaults','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000008),
 p_name=>'P1100_GRAIN',
 p_item_sequence=>40,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Time grouping',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_item_default=>'DAY',
 p_lov=>'STATIC:Hour;HOUR,Day;DAY,Month;MONTH',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000009),
 p_name=>'P1100_COMPANY',
 p_item_sequence=>50,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Company',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'Y',
 p_lov=>'select distinct company_code||'' - ''||company_name d,company_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and company_code is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000010),
 p_name=>'P1100_LOCATION',
 p_item_sequence=>60,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Location',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct location_code||'' - ''||location_name d,location_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and location_code is not null and ((select /*+ no_unnest */ apex_util.get_session_state(''P1100_COMPANY'') from dual) is null or company_code=(select /*+ no_unnest */ apex_util.get_session_state(''P1100_COMPANY'') from dual)) order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_lov_cascade_parent_items=>'P1100_COMPANY',
 p_ajax_items_to_submit=>'P1100_COMPANY',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000011),
 p_name=>'P1100_USER',
 p_item_sequence=>70,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'ERP user',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct user_name d,user_name r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and user_name is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000012),
 p_name=>'P1100_EMPLOYEE',
 p_item_sequence=>80,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Recorded employee code',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct employee_code d,employee_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and employee_code is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000013),
 p_name=>'P1100_MODULE',
 p_item_sequence=>90,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Module',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct module_code||'' - ''||module_name d,module_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and module_code is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000014),
 p_name=>'P1100_PAGE',
 p_item_sequence=>100,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Screen',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct to_char(page_id)||'' - ''||page_name d,to_char(page_id) r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and to_char(page_id) is not null and ((select /*+ no_unnest */ apex_util.get_session_state(''P1100_MODULE'') from dual) is null or module_code=(select /*+ no_unnest */ apex_util.get_session_state(''P1100_MODULE'') from dual)) order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_lov_cascade_parent_items=>'P1100_MODULE',
 p_ajax_items_to_submit=>'P1100_MODULE',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000015),
 p_name=>'P1100_ACTION',
 p_item_sequence=>110,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Operation',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct operation d,operation r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and operation is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000016),
 p_name=>'P1100_OUTCOME',
 p_item_sequence=>120,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Outcome',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'Y',
 p_lov=>'select distinct outcome d,outcome r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and outcome is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000017),
 p_name=>'P1100_SOURCE',
 p_item_sequence=>130,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Source',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct source_type d,source_type r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and source_type is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000018),
 p_name=>'P1100_TABLE',
 p_item_sequence=>140,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Entity',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_lov=>'select distinct table_name d,table_name r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and table_name is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000019),
 p_name=>'P1100_RECORD',
 p_item_sequence=>150,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Exact record key',
 p_display_as=>'NATIVE_TEXT_FIELD',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'N',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('trim_spaces','BOTH')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000020),
 p_name=>'P1100_DEPARTMENT',
 p_item_sequence=>85,
 p_item_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_prompt=>'Current department',
 p_display_as=>'NATIVE_SELECT_LIST',
 p_source_type=>'ALWAYS_NULL',
 p_field_template=>wwv_flow_imp.id(2318601014859922299),
 p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs',
 p_colspan=>3,
 p_begin_on_new_line=>'Y',
 p_lov=>'select distinct current_department_name d,current_department_code r from IMART_ACTIVITY_EVENTS_V where event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) as timestamp),''Asia/Kolkata'') and event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)+1 as timestamp),''Asia/Kolkata'') and current_department_code is not null order by 1',
 p_lov_display_null=>'YES',
 p_lov_null_text=>'All permitted / available',
 p_lov_display_extra=>'NO',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92002610200000021),
 p_button_sequence=>10,
 p_button_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_button_name=>'APPLY',
 p_button_action=>'SUBMIT',
 p_button_template_id=>wwv_flow_imp.id(4072362960822175091),
 p_button_image_alt=>'Apply / refresh',
 p_button_position=>'CHANGE',
 p_button_is_hot=>'Y');
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92002610200000022),
 p_button_sequence=>10,
 p_button_plug_id=>wwv_flow_imp.id(92002610200000004),
 p_button_name=>'CLEAR',
 p_button_action=>'SUBMIT',
 p_button_template_id=>wwv_flow_imp.id(4072362960822175091),
 p_button_image_alt=>'Clear filters',
 p_button_position=>'CLOSE',
 p_button_is_hot=>'N');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000023),
 p_process_sequence=>1,
 p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Validate and apply common scope',
 p_process_sql_clob=>'declare f date;t date;d date:=trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date));begin
 if :REQUEST=''CLEAR'' then
 apex_util.set_session_state(''P1100_FROM'',null);
apex_util.set_session_state(''P1100_TO'',null);
apex_util.set_session_state(''P1100_COMPANY'',null);
apex_util.set_session_state(''P1100_LOCATION'',null);
apex_util.set_session_state(''P1100_USER'',null);
apex_util.set_session_state(''P1100_EMPLOYEE'',null);
apex_util.set_session_state(''P1100_DEPARTMENT'',null);
apex_util.set_session_state(''P1100_MODULE'',null);
apex_util.set_session_state(''P1100_PAGE'',null);
apex_util.set_session_state(''P1100_ACTION'',null);
apex_util.set_session_state(''P1100_OUTCOME'',null);
apex_util.set_session_state(''P1100_SOURCE'',null);
apex_util.set_session_state(''P1100_TABLE'',null);
apex_util.set_session_state(''P1100_RECORD'',null);
 :P1100_QUICK:=''TODAY'';:P1100_GRAIN:=''DAY'';end if;
 case nvl(:P1100_QUICK,''CUSTOM'') when ''TODAY'' then f:=d;t:=d;when ''YESTERDAY'' then f:=d-1;t:=d-1;when ''WEEK'' then f:=trunc(d,''IW'');t:=d;when ''MONTH'' then f:=trunc(d,''MM'');t:=d;when ''PREVIOUS'' then f:=add_months(trunc(d,''MM''),-1);t:=trunc(d,''MM'')-1;when ''CUSTOM'' then f:=case when validate_conversion(:P1100_FROM as date,''FXDD-MM-YYYY'')=1 then to_date(:P1100_FROM,''FXDD-MM-YYYY'') when validate_conversion(:P1100_FROM as date,''FXYYYY-MM-DD'')=1 then to_date(:P1100_FROM,''FXYYYY-MM-DD'') end;t:=case when validate_conversion(:P1100_TO as date,''FXDD-MM-YYYY'')=1 then to_date(:P1100_TO,''FXDD-MM-YYYY'') when validate_conversion(:P1100_TO as date,''FXYYYY-MM-DD'')=1 then to_date(:P1100_TO,''FXYYYY-MM-DD'') end;else raise_application_error(-20840,''Invalid quick date selection'');end case;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 if :P1100_GRAIN not in (''HOUR'',''DAY'',''MONTH'') or :P1100_GRAIN is null then raise_application_error(-20840,''Choose Hour, Day or Month.'');end if;
 :P1100_FROM:=to_char(f,''DD-MM-YYYY'');:P1100_TO:=to_char(t,''DD-MM-YYYY'');
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(92002610200000024),
 p_branch_name=>'Applied reporting scope',
 p_branch_action=>'f?p=&APP_ID.:1100:&APP_SESSION.::&DEBUG.:RP',
 p_branch_point=>'AFTER_PROCESSING',
 p_branch_type=>'REDIRECT_URL',
 p_branch_sequence=>10);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000025),
 p_plug_name=>'Activity KPIs',
 p_static_id=>'activity-92002610200000025',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('declare r sys_refcursor;begin',
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
' htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''"><span>Total activity events</span><strong>''||to_char(nvl(r.total_events,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ROW_SUCCESS,1''))||''"><span>Successful row operations</span><strong>''||to_char(nvl(r.successful_row_operations,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OUTCOME,FAILURE''))||''"><span>Captured failure events</span><strong>''||to_char(nvl(r.failed_events,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''KEYED,1''))||''"><span>Distinct records affected</span><strong>''||to_char(nvl(r.distinct_records,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''SOURCE,APEX_USER''))||''"><span>Active ERP users</span><strong>''||to_char(nvl(r.active_users,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION,INSERT''))||''"><span>Insert events</span><strong>''||to_char(nvl(r.inserts,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION,UPDATE''))||''"><span>Update events</span><strong>''||to_char(nvl(r.updates,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION,DELETE''))||''"><span>Delete events</span><strong>''||to_char(nvl(r.deletes,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OUTCOME,OBSERVED''))||''"><span>Observed events</span><strong>''||to_char(nvl(r.observed_events,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''ACTION,LOGIN,OUTCOME,FAILURE''))||''"><span>Failed login events</span><strong>''||to_char(nvl(r.failed_logins,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OUTCOME,SUCCESS''))||''"><span>Successful events</span><strong>''||to_char(nvl(r.successful_events,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
'htp.p(''<a class="am-kpi" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''OTHEROPS,1''))||''"><span>Other operation events</span><strong>''||to_char(nvl(r.other_events,0),''FM999G999G999G990'')||''</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>'');',
' htp.p(''</div><p class="am-note">Successful row operations count only successful ROW_CHANGE events. Total events also include observed page access, authentication, errors and high-level business events. Missing history is not inactivity. <a href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115))||''">Counting rules and coverage</a></p>'');',
' end loop;',
'end;')),
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610208000000),
 p_plug_name=>'Activity trend',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:js-showMaximizeButton',
 p_plug_display_sequence=>20,
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_region_css_classes=>'am-trend-panel',
 p_plug_source=>'declare g varchar2(10);begin select case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end into g from dual;
 htp.p(''<div class="am-trend-intro"><h3>''||case g when ''HOUR'' then ''Hourly'' when ''MONTH'' then ''Monthly'' else ''Daily'' end||'' ERP operations</h3><p>Insert, update and delete events for ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||''. Single-day views use hourly detail.</p></div>'');end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000027),
 p_plug_name=>'Activity trend chart',
 p_static_id=>'activity-92002610200000027',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>false,
 p_parent_plug_id=>wwv_flow_imp.id(92002610208000000),
 p_plug_display_point=>'SUB_REGIONS',
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_JET_CHART');
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000026),
 p_region_id=>wwv_flow_imp.id(92002610200000027),
 p_chart_type=>'line',
 p_height=>'360',
 p_animation_on_display=>'none',
 p_animation_on_data_change=>'none',
 p_orientation=>'vertical',
 p_stack=>'off',
 p_legend_rendered=>'on',
 p_legend_position=>'bottom',
 p_tooltip_rendered=>'Y',
 p_show_series_name=>true,
 p_show_group_name=>true,
 p_show_value=>true,
 p_no_data_found_message=>'No captured events in this scope.');
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000028),
 p_chart_id=>wwv_flow_imp.id(92002610200000026),
 p_seq=>10,
 p_name=>'INSERT',
 p_data_source_type=>'SQL',
 p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select x.label,x.series,x.value,case length(x.label) when 13 then case when (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) then substr(x.label,12,2)||'':00'' else to_char(to_date(substr(x.label,1,10),''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'')||'' ''||substr(x.label,12,2)||'':00'' end when 10 then to_char(to_date(x.label,''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') else to_char(to_date(x.label||''-01'',''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') end display_label,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(series),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select to_char(b.bucket,case b.grain when ''MONTH'' then ''YYYY-MM'' when ''HOUR'' then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) label,o.series,nvl(c.value,0) value',
' from (',
' select case grain when ''MONTH'' then add_months(trunc(f,''MM''),level-1) when ''HOUR'' then f+(level-1)/24 else f+level-1 end bucket,grain',
' from (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) connect by level<=case grain when ''MONTH'' then months_between(trunc(t,''MM''),trunc(f,''MM''))+1 when ''HOUR'' then (t-f+1)*24 else t-f+1 end) b cross join (select ''INSERT'' series from dual union all select ''UPDATE'' from dual union all select ''DELETE'' from dual) o left join (select case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value',
' from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) p where e.operation in (''INSERT'',''UPDATE'',''DELETE'')',
' group by case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series',
' where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in (''INSERT'',''UPDATE'',''DELETE'')) order by label,series) x where x.series=''INSERT''')),
 p_series_type=>'line',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'DISPLAY_LABEL',
 p_items_value_column_name=>'VALUE',
 p_color=>'#1688ff',
 p_line_width=>2,
 p_marker_rendered=>'on',
 p_marker_shape=>'circle',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610208000002),
 p_chart_id=>wwv_flow_imp.id(92002610200000026),
 p_seq=>20,
 p_name=>'UPDATE',
 p_data_source_type=>'SQL',
 p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select x.label,x.series,x.value,case length(x.label) when 13 then case when (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) then substr(x.label,12,2)||'':00'' else to_char(to_date(substr(x.label,1,10),''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'')||'' ''||substr(x.label,12,2)||'':00'' end when 10 then to_char(to_date(x.label,''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') else to_char(to_date(x.label||''-01'',''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') end display_label,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(series),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select to_char(b.bucket,case b.grain when ''MONTH'' then ''YYYY-MM'' when ''HOUR'' then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) label,o.series,nvl(c.value,0) value',
' from (',
' select case grain when ''MONTH'' then add_months(trunc(f,''MM''),level-1) when ''HOUR'' then f+(level-1)/24 else f+level-1 end bucket,grain',
' from (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) connect by level<=case grain when ''MONTH'' then months_between(trunc(t,''MM''),trunc(f,''MM''))+1 when ''HOUR'' then (t-f+1)*24 else t-f+1 end) b cross join (select ''INSERT'' series from dual union all select ''UPDATE'' from dual union all select ''DELETE'' from dual) o left join (select case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value',
' from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) p where e.operation in (''INSERT'',''UPDATE'',''DELETE'')',
' group by case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series',
' where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in (''INSERT'',''UPDATE'',''DELETE'')) order by label,series) x where x.series=''UPDATE''')),
 p_series_type=>'line',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'DISPLAY_LABEL',
 p_items_value_column_name=>'VALUE',
 p_color=>'#00a884',
 p_line_width=>2,
 p_marker_rendered=>'on',
 p_marker_shape=>'circle',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610208000003),
 p_chart_id=>wwv_flow_imp.id(92002610200000026),
 p_seq=>30,
 p_name=>'DELETE',
 p_data_source_type=>'SQL',
 p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select x.label,x.series,x.value,case length(x.label) when 13 then case when (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) then substr(x.label,12,2)||'':00'' else to_char(to_date(substr(x.label,1,10),''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'')||'' ''||substr(x.label,12,2)||'':00'' end when 10 then to_char(to_date(x.label,''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') else to_char(to_date(x.label||''-01'',''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') end display_label,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(series),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select to_char(b.bucket,case b.grain when ''MONTH'' then ''YYYY-MM'' when ''HOUR'' then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) label,o.series,nvl(c.value,0) value',
' from (',
' select case grain when ''MONTH'' then add_months(trunc(f,''MM''),level-1) when ''HOUR'' then f+(level-1)/24 else f+level-1 end bucket,grain',
' from (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) connect by level<=case grain when ''MONTH'' then months_between(trunc(t,''MM''),trunc(f,''MM''))+1 when ''HOUR'' then (t-f+1)*24 else t-f+1 end) b cross join (select ''INSERT'' series from dual union all select ''UPDATE'' from dual union all select ''DELETE'' from dual) o left join (select case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value',
' from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) p where e.operation in (''INSERT'',''UPDATE'',''DELETE'')',
' group by case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series',
' where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in (''INSERT'',''UPDATE'',''DELETE'')) order by label,series) x where x.series=''DELETE''')),
 p_series_type=>'line',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'DISPLAY_LABEL',
 p_items_value_column_name=>'VALUE',
 p_color=>'#a855f7',
 p_line_width=>2,
 p_marker_rendered=>'on',
 p_marker_shape=>'circle',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000029),
 p_chart_id=>wwv_flow_imp.id(92002610200000026),
 p_axis=>'x',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000030),
 p_chart_id=>wwv_flow_imp.id(92002610200000026),
 p_axis=>'y',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610208000001),
 p_plug_name=>'Activity trend data',
 p_parent_plug_id=>wwv_flow_imp.id(92002610208000000),
 p_plug_display_point=>'SUB_REGIONS',
 p_plug_template=>wwv_flow_imp.id(3371237801798025892),
 p_region_template_options=>'#DEFAULT#:t-Region--noUI',
 p_plug_display_sequence=>20,
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('declare n number:=0;begin',
' htp.p(''<div class="am-trend-table-wrap"><table class="am-trend-table"><caption>Activity trend data — same period and filters as the chart</caption><thead><tr><th scope="col">Period starting</th><th scope="col">Insert</th><th scope="col">Update</th><th scope="col">Delete</th></tr></thead><tbody>'');',
' for r in (select label,max(case when series=''INSERT'' then value end) inserts,max(case when series=''UPDATE'' then value end) updates,max(case when series=''DELETE'' then value end) deletes from (select to_char(b.bucket,case b.grain when ''MONTH'' then ''YYYY-MM'' when ''HOUR'' then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) label,o.series,nvl(c.value,0) value',
' from (',
' select case grain when ''MONTH'' then add_months(trunc(f,''MM''),level-1) when ''HOUR'' then f+(level-1)/24 else f+level-1 end bucket,grain',
' from (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) connect by level<=case grain when ''MONTH'' then months_between(trunc(t,''MM''),trunc(f,''MM''))+1 when ''HOUR'' then (t-f+1)*24 else t-f+1 end) b cross join (select ''INSERT'' series from dual union all select ''UPDATE'' from dual union all select ''DELETE'' from dual) o left join (select case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value',
' from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual) f,(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual) t,case when :P1100_GRAIN=''MONTH'' then ''MONTH'' when (:P1100_GRAIN=''HOUR'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)<=6) or (:P1100_GRAIN=''DAY'' and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end from dual)=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end from dual)) then ''HOUR'' else ''DAY'' end grain from dual) p where e.operation in (''INSERT'',''UPDATE'',''DELETE'')',
' group by case p.grain when ''MONTH'' then trunc(e.local_timestamp,''MM'') when ''HOUR'' then trunc(e.local_timestamp,''HH24'') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series',
' where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in (''INSERT'',''UPDATE'',''DELETE'')) order by label,series) group by label order by label) loop',
' n:=n+1;',
' htp.p(''<tr><th scope="row">''||apex_escape.html(case length(r.label) when 13 then to_char(to_date(substr(r.label,1,10),''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'')||'' ''||substr(r.label,12,2)||'':00'' when 7 then to_char(to_date(r.label||''-01'',''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') else to_char(to_date(r.label,''YYYY-MM-DD''),''DD-MM-YYYY'',''NLS_DATE_LANGUAGE=English'') end)||''</th>'');',
' htp.p(''<td><a href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(r.label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(''INSERT''),''~NULL~''),''%'',''%25''),'','',''%2C'')))||''">''||to_char(r.inserts,''FM999G999G999G990'')||''</a></td>'');htp.p(''<td><a href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(r.label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(''UPDATE''),''~NULL~''),''%'',''%25''),'','',''%2C'')))||''">''||to_char(r.updates,''FM999G999G999G990'')||''</a></td>'');htp.p(''<td><a href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(r.label),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(''DELETE''),''~NULL~''),''%'',''%25''),'','',''%2C'')))||''">''||to_char(r.deletes,''FM999G999G999G990'')||''</a></td>'');',
' htp.p(''</tr>'');end loop;',
' if n=0 then htp.p(''<tr><td colspan="4">No captured insert, update or delete events match the selected filters.</td></tr>'');end if;',
' htp.p(''</tbody></table></div><p class="am-trend-note">Actual captured ERP events. Zero indicates no captured operation in that period. Select a point or count to view its events.</p>'');',
' end;')),
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000032),
 p_plug_name=>'Operation distribution',
 p_static_id=>'activity-92002610200000032',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>21,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>6,
 p_plug_new_grid_row=>true,
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_JET_CHART');
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000031),
 p_region_id=>wwv_flow_imp.id(92002610200000032),
 p_chart_type=>'donut',
 p_height=>'330',
 p_animation_on_display=>'none',
 p_animation_on_data_change=>'none',
 p_orientation=>'vertical',
 p_stack=>'off',
 p_legend_rendered=>'on',
 p_legend_position=>'bottom',
 p_tooltip_rendered=>'Y',
 p_show_series_name=>true,
 p_show_group_name=>true,
 p_show_value=>true,
 p_no_data_found_message=>'No captured events in this scope.');
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000033),
 p_chart_id=>wwv_flow_imp.id(92002610200000031),
 p_seq=>10,
 p_name=>'Operation distribution',
 p_data_source_type=>'SQL',
 p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''ACTION''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select operation label,operation series,count(*) value from IMART_ACTIVITY_SCOPE_V group by operation) x',
 p_series_type=>'donut',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'LABEL',
 p_items_value_column_name=>'VALUE',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000035),
 p_plug_name=>'Module activity (top 12 plus others)',
 p_static_id=>'activity-92002610200000035',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>22,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>6,
 p_plug_new_grid_row=>false,
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_JET_CHART');
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000034),
 p_region_id=>wwv_flow_imp.id(92002610200000035),
 p_chart_type=>'bar',
 p_height=>'330',
 p_animation_on_display=>'none',
 p_animation_on_data_change=>'none',
 p_orientation=>'horizontal',
 p_stack=>'on',
 p_legend_rendered=>'on',
 p_legend_position=>'bottom',
 p_tooltip_rendered=>'Y',
 p_show_series_name=>true,
 p_show_group_name=>true,
 p_show_value=>true,
 p_no_data_found_message=>'No captured events in this scope.');
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000036),
 p_chart_id=>wwv_flow_imp.id(92002610200000034),
 p_seq=>10,
 p_name=>'Module activity (top 12 plus others)',
 p_data_source_type=>'SQL',
 p_data_source=>'select x.label,x.series,x.value,case when drill_key=''~OTHER~'' then apex_page.get_url(p_page=>1103,p_clear_cache=>''RP'') else apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''MODULE''||'',''||replace(replace(nvl(to_char(drill_key),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''ACTION''||'',''||replace(replace(nvl(to_char(series),''~NULL~''),''%'',''%25''),'','',''%2C'')) end drill_url from (select case when r.rn<=12 then e.module_name else ''Other modules'' end label,e.operation series,count(*) value,case when r.rn<=12 then e.module_code else ''~OTHER~'' end drill_key
 from IMART_ACTIVITY_SCOPE_V e join (select module_code,row_number() over(order by count(*) desc,module_code) rn from IMART_ACTIVITY_SCOPE_V group by module_code) r on r.module_code=e.module_code
 group by case when r.rn<=12 then e.module_name else ''Other modules'' end,e.operation,case when r.rn<=12 then e.module_code else ''~OTHER~'' end) x',
 p_series_type=>'bar',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'LABEL',
 p_items_value_column_name=>'VALUE',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000037),
 p_chart_id=>wwv_flow_imp.id(92002610200000034),
 p_axis=>'x',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000038),
 p_chart_id=>wwv_flow_imp.id(92002610200000034),
 p_axis=>'y',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000040),
 p_plug_name=>'Top active ERP users',
 p_static_id=>'activity-92002610200000040',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>23,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>6,
 p_plug_new_grid_row=>true,
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_JET_CHART');
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000039),
 p_region_id=>wwv_flow_imp.id(92002610200000040),
 p_chart_type=>'bar',
 p_height=>'330',
 p_animation_on_display=>'none',
 p_animation_on_data_change=>'none',
 p_orientation=>'horizontal',
 p_stack=>'off',
 p_legend_rendered=>'off',
 p_legend_position=>'bottom',
 p_tooltip_rendered=>'Y',
 p_show_series_name=>true,
 p_show_group_name=>true,
 p_show_value=>true,
 p_no_data_found_message=>'No captured events in this scope.');
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000041),
 p_chart_id=>wwv_flow_imp.id(92002610200000039),
 p_seq=>10,
 p_name=>'Top active ERP users',
 p_data_source_type=>'SQL',
 p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''USER''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select user_name label,''Events'' series,count(*) value from IMART_ACTIVITY_SCOPE_V where source_type=''APEX_USER'' and user_name is not null group by user_name order by value desc,user_name fetch first 10 rows only) x',
 p_series_type=>'bar',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'LABEL',
 p_items_value_column_name=>'VALUE',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000042),
 p_chart_id=>wwv_flow_imp.id(92002610200000039),
 p_axis=>'x',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000043),
 p_chart_id=>wwv_flow_imp.id(92002610200000039),
 p_axis=>'y',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000045),
 p_plug_name=>'Company and location comparison',
 p_static_id=>'activity-92002610200000045',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>24,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>6,
 p_plug_new_grid_row=>false,
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_JET_CHART');
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000044),
 p_region_id=>wwv_flow_imp.id(92002610200000045),
 p_chart_type=>'bar',
 p_height=>'330',
 p_animation_on_display=>'none',
 p_animation_on_data_change=>'none',
 p_orientation=>'horizontal',
 p_stack=>'off',
 p_legend_rendered=>'off',
 p_legend_position=>'bottom',
 p_tooltip_rendered=>'Y',
 p_show_series_name=>true,
 p_show_group_name=>true,
 p_show_value=>true,
 p_no_data_found_message=>'No captured events in this scope.');
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000046),
 p_chart_id=>wwv_flow_imp.id(92002610200000044),
 p_seq=>10,
 p_name=>'Company and location comparison',
 p_data_source_type=>'SQL',
 p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''COMPANY''||'',''||replace(replace(nvl(to_char(drill_key),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''LOCATION''||'',''||replace(replace(nvl(to_char(drill_location),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select company_name||'' / ''||location_name label,''Events'' series,count(*) value,company_code drill_key,location_code drill_location from IMART_ACTIVITY_SCOPE_V group by company_name,location_name,company_code,location_code) x',
 p_series_type=>'bar',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'LABEL',
 p_items_value_column_name=>'VALUE',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000047),
 p_chart_id=>wwv_flow_imp.id(92002610200000044),
 p_axis=>'x',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000048),
 p_chart_id=>wwv_flow_imp.id(92002610200000044),
 p_axis=>'y',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000050),
 p_plug_name=>'Exception categories',
 p_static_id=>'activity-92002610200000050',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>25,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>6,
 p_plug_new_grid_row=>true,
 p_plug_source=>'',
 p_plug_source_type=>'NATIVE_JET_CHART');
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92002610200000049),
 p_region_id=>wwv_flow_imp.id(92002610200000050),
 p_chart_type=>'bar',
 p_height=>'330',
 p_animation_on_display=>'none',
 p_animation_on_data_change=>'none',
 p_orientation=>'horizontal',
 p_stack=>'off',
 p_legend_rendered=>'off',
 p_legend_position=>'bottom',
 p_tooltip_rendered=>'Y',
 p_show_series_name=>true,
 p_show_group_name=>true,
 p_show_value=>true,
 p_no_data_found_message=>'No captured events in this scope.');
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92002610200000051),
 p_chart_id=>wwv_flow_imp.id(92002610200000049),
 p_seq=>10,
 p_name=>'Exception categories',
 p_data_source_type=>'SQL',
 p_data_source=>'select x.label,x.series,x.value,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''EXCEPTION''||'',''||replace(replace(nvl(to_char(label),''~NULL~''),''%'',''%25''),'','',''%2C'')) drill_url from (select exception_reason label,''Events'' series,count(*) value from IMART_ACTIVITY_SCOPE_V where exception_reason is not null group by exception_reason) x',
 p_series_type=>'bar',
 p_series_name_column_name=>'SERIES',
 p_items_label_column_name=>'LABEL',
 p_items_value_column_name=>'VALUE',
 p_link_target=>'&DRILL_URL.',
 p_link_target_type=>'REDIRECT_URL',
 p_items_label_rendered=>false);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000052),
 p_chart_id=>wwv_flow_imp.id(92002610200000049),
 p_axis=>'x',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92002610200000053),
 p_chart_id=>wwv_flow_imp.id(92002610200000049),
 p_axis=>'y',
 p_is_rendered=>'on',
 p_format_scaling=>'none',
 p_decimal_places=>0,
 p_tick_label_rendered=>'on');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000054),
 p_plug_name=>'MIS reports',
 p_static_id=>'activity-92002610200000054',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>40,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('begin htp.p(''<div class="hspl-directory-grid am-directory">'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-0" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1101,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Daily Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-1" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1102,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">User Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-2" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1103,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Module Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-3" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1104,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Company Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-4" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1105,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Location Activity Summary</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-5" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1106,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">User × Module Matrix</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-6" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1107,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Company × Location Matrix</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-7" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1108,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Operation Activity MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-0" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1109,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Exception Activity MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-1" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1110,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Login and Session MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-2" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1111,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Master Data Change MIS</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''<a class="hspl-directory-card hspl-directory-tone-3" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1112,p_clear_cache=>''RP''))||''"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">Administrative Entity Audit</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>'');',
'htp.p(''</div>'');end;')),
 p_plug_source_type=>'NATIVE_PLSQL');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1101,
 p_name=>'Daily Activity Summary',
 p_alias=>'ACTIVITY-DAILY',
 p_step_title=>'Daily Activity Summary',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000055),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Daily Activity Summary</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000056),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000056',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000057),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000058),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000058',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000059),
 p_plug_name=>'Daily Activity Summary',
 p_static_id=>'am-report-1101-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select activity_period,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(company_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(location_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,case when regexp_like(to_char(module_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2,P1113_D3,P1113_V3,P1113_D4,P1113_V4'',p_values=>''PERIOD''||'',''||replace(replace(nvl(to_char(to_char(activity_period,case :P1100_GRAIN when ''HOUR'' then ''YYYY-MM-DD HH24'' when ''MONTH'' then ''YYYY-MM'' else ''YYYY-MM-DD'' end)),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''COMPANY''||'',''||replace(replace(nvl(to_char(company_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''LOCATION''||'',''||replace(replace(nvl(to_char(location_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''MODULE''||'',''||replace(replace(nvl(to_char(module_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) detail_url from (select case when :P1100_GRAIN=''HOUR'' then trunc(local_timestamp,''HH24'') when :P1100_GRAIN=''MONTH'' then trunc(local_timestamp,''MM'') else trunc(local_timestamp) end activity_period,company_name,location_name,module_name,company_code,location_code,module_code,count(*) total_events,',
' sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,',
' sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,',
' sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,',
' sum(case when operation=''INSERT'' then 1 else 0 end) inserts,',
' sum(case when operation=''UPDATE'' then 1 else 0 end) updates,',
' sum(case when operation=''DELETE'' then 1 else 0 end) deletes,',
' sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,',
' count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,',
' count(distinct record_identity) distinct_records,',
' sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity from IMART_ACTIVITY_SCOPE_V group by case when :P1100_GRAIN=''HOUR'' then trunc(local_timestamp,''HH24'') when :P1100_GRAIN=''MONTH'' then trunc(local_timestamp,''MM'') else trunc(local_timestamp) end,company_name,location_name,module_name,company_code,location_code,module_code)')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000060),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000060);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000061),
 p_db_column_name=>'ACTIVITY_PERIOD',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Activity Period',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000062),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000063),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000064),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000065),
 p_db_column_name=>'COMPANY_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Company Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000066),
 p_db_column_name=>'LOCATION_CODE',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Location Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000067),
 p_db_column_name=>'MODULE_CODE',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Module Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000068),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000069),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000070),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000071),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000072),
 p_db_column_name=>'INSERTS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000073),
 p_db_column_name=>'UPDATES',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000074),
 p_db_column_name=>'DELETES',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000075),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000076),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000077),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000078),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000079),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000080),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000081),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000082),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110130',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'ACTIVITY_PERIOD:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:COMPANY_CODE:LOCATION_CODE:MODULE_CODE:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY',
 p_sort_column_1=>'ACTIVITY_PERIOD',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1102,
 p_name=>'User Activity Summary',
 p_alias=>'ACTIVITY-USERS',
 p_step_title=>'User Activity Summary',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000083),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">User Activity Summary</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000084),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000084',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000085),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000086),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000086',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000087),
 p_plug_name=>'User Activity Summary',
 p_static_id=>'am-report-1102-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(company_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(location_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2,P1113_D3,P1113_V3'',p_values=>''USER''||'',''||replace(replace(nvl(to_char(user_name),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''COMPANY''||'',''||replace(replace(nvl(to_char(company_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''LOCATION''||'',''||replace(replace(nvl(to_char(location_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) detail_url from (select user_name,bossusercode,employee_code,current_employee_name,current_department_name,company_name,location_name,company_code,location_code,',
'count(*) total_events,',
' sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,',
' sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,',
' sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,',
' sum(case when operation=''INSERT'' then 1 else 0 end) inserts,',
' sum(case when operation=''UPDATE'' then 1 else 0 end) updates,',
' sum(case when operation=''DELETE'' then 1 else 0 end) deletes,',
' sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,',
' count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,',
' count(distinct record_identity) distinct_records,',
' sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity',
'from IMART_ACTIVITY_SCOPE_V group by user_name,bossusercode,employee_code,current_employee_name,current_department_name,company_name,location_name,company_code,location_code)')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000088),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000088);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000089),
 p_db_column_name=>'USER_NAME',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000090),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000091),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000092),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000093),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000094),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000095),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000096),
 p_db_column_name=>'COMPANY_CODE',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000097),
 p_db_column_name=>'LOCATION_CODE',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000098),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000099),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000100),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000101),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000102),
 p_db_column_name=>'INSERTS',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000103),
 p_db_column_name=>'UPDATES',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000104),
 p_db_column_name=>'DELETES',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000105),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000106),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000107),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000108),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000109),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000110),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000111),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000112),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110230',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:COMPANY_CODE:LOCATION_CODE:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY',
 p_sort_column_1=>'USER_NAME',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1103,
 p_name=>'Module Activity Summary',
 p_alias=>'ACTIVITY-MODULES',
 p_step_title=>'Module Activity Summary',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000113),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Module Activity Summary</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000114),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000114',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000115),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000116),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000116',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000117),
 p_plug_name=>'Module Activity Summary',
 p_static_id=>'am-report-1103-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>'select case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(module_mapping_source),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_mapping_source) else to_char(module_mapping_source) end module_mapping_source,case when regexp_like(to_char(module_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,case when regexp_like(to_char(page_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_id) else to_char(page_id) end page_id,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''MODULE''||'',''||replace(replace(nvl(to_char(module_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''PAGE''||'',''||replace(replace(nvl(to_char(page_id),''~NULL~''),''%'',''%25''),'','',''%2C'')) detail_url from (select module_name,page_name,form_name,module_mapping_source,module_code,page_id,
count(*) total_events,
 sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,
 sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,
 sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,
 sum(case when operation=''INSERT'' then 1 else 0 end) inserts,
 sum(case when operation=''UPDATE'' then 1 else 0 end) updates,
 sum(case when operation=''DELETE'' then 1 else 0 end) deletes,
 sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,
 count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by module_name,page_name,form_name,module_mapping_source,module_code,page_id)',
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000118),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000118);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000119),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000120),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000121),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000122),
 p_db_column_name=>'MODULE_MAPPING_SOURCE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Module Mapping Source',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000123),
 p_db_column_name=>'MODULE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Module Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000124),
 p_db_column_name=>'PAGE_ID',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Page Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000125),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000126),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000127),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000128),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000129),
 p_db_column_name=>'INSERTS',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000130),
 p_db_column_name=>'UPDATES',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000131),
 p_db_column_name=>'DELETES',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000132),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000133),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000134),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000135),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000136),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000137),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000138),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000139),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110330',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'MODULE_NAME:PAGE_NAME:FORM_NAME:MODULE_MAPPING_SOURCE:MODULE_CODE:PAGE_ID:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY',
 p_sort_column_1=>'MODULE_NAME',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1104,
 p_name=>'Company Activity Summary',
 p_alias=>'ACTIVITY-COMPANIES',
 p_step_title=>'Company Activity Summary',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000140),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Company Activity Summary</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000141),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000141',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000142),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000143),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000143',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000144),
 p_plug_name=>'Company Activity Summary',
 p_static_id=>'am-report-1104-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>'select case when regexp_like(to_char(company_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''COMPANY''||'',''||replace(replace(nvl(to_char(company_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) detail_url from (select company_code,company_name,
count(*) total_events,
 sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,
 sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,
 sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,
 sum(case when operation=''INSERT'' then 1 else 0 end) inserts,
 sum(case when operation=''UPDATE'' then 1 else 0 end) updates,
 sum(case when operation=''DELETE'' then 1 else 0 end) deletes,
 sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,
 count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by company_code,company_name)',
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000145),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000145);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000146),
 p_db_column_name=>'COMPANY_CODE',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Company Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000147),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000148),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000149),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000150),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000151),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000152),
 p_db_column_name=>'INSERTS',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000153),
 p_db_column_name=>'UPDATES',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000154),
 p_db_column_name=>'DELETES',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000155),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000156),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000157),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000158),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000159),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000160),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000161),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000162),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110430',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'COMPANY_CODE:COMPANY_NAME:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY',
 p_sort_column_1=>'COMPANY_CODE',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1105,
 p_name=>'Location Activity Summary',
 p_alias=>'ACTIVITY-LOCATIONS',
 p_step_title=>'Location Activity Summary',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000163),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Location Activity Summary</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000164),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000164',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000165),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000166),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000166',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000167),
 p_plug_name=>'Location Activity Summary',
 p_static_id=>'am-report-1105-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>'select case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(company_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''COMPANY''||'',''||replace(replace(nvl(to_char(company_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''LOCATION''||'',''||replace(replace(nvl(to_char(location_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) detail_url from (select company_name,location_code,location_name,company_code,
count(*) total_events,
 sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,
 sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,
 sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,
 sum(case when operation=''INSERT'' then 1 else 0 end) inserts,
 sum(case when operation=''UPDATE'' then 1 else 0 end) updates,
 sum(case when operation=''DELETE'' then 1 else 0 end) deletes,
 sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,
 count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by company_name,location_code,location_name,company_code)',
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000168),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000168);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000169),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000170),
 p_db_column_name=>'LOCATION_CODE',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Location Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000171),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000172),
 p_db_column_name=>'COMPANY_CODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Company Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000173),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000174),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000175),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000176),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000177),
 p_db_column_name=>'INSERTS',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000178),
 p_db_column_name=>'UPDATES',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000179),
 p_db_column_name=>'DELETES',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000180),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000181),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000182),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000183),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000184),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000185),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000186),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000187),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110530',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'COMPANY_NAME:LOCATION_CODE:LOCATION_NAME:COMPANY_CODE:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY',
 p_sort_column_1=>'COMPANY_NAME',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1106,
 p_name=>'User × Module Matrix',
 p_alias=>'ACTIVITY-USER-MODULE',
 p_step_title=>'User × Module Matrix',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000188),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">User × Module Matrix</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000189),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000189',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000190),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000191),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000191',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Searchable matrix equivalent. Row, column and grand totals are distinct aggregate rows; do not add totals to detail rows.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000192),
 p_plug_name=>'User × Module Matrix',
 p_static_id=>'am-report-1106-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>'select case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(module_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,case when regexp_like(to_char(row_kind),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(row_kind) else to_char(row_kind) end row_kind,case when row_kind=''Detail'' then apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''USER''||'',''||replace(replace(nvl(to_char(user_name),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''MODULE''||'',''||replace(replace(nvl(to_char(module_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) when row_kind=''Row total'' then apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''USER''||'',''||replace(replace(nvl(to_char(user_name),''~NULL~''),''%'',''%25''),'','',''%2C'')) when row_kind=''Column total'' then apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''MODULE''||'',''||replace(replace(nvl(to_char(module_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) else apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'') end detail_url from (select user_name,module_name,module_code,
count(*) total_events,
 sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,
 sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,
 sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,
 sum(case when operation=''INSERT'' then 1 else 0 end) inserts,
 sum(case when operation=''UPDATE'' then 1 else 0 end) updates,
 sum(case when operation=''DELETE'' then 1 else 0 end) deletes,
 sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,
 count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity,case when grouping(user_name)=1 and grouping(module_code)=1 then ''Grand total'' when grouping(user_name)=1 then ''Column total'' when grouping(module_code)=1 then ''Row total'' else ''Detail'' end row_kind
from IMART_ACTIVITY_SCOPE_V group by grouping sets ((user_name,module_name,module_code),(user_name),(module_name,module_code),()))',
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000193),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000193);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000194),
 p_db_column_name=>'USER_NAME',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000195),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000196),
 p_db_column_name=>'MODULE_CODE',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Module Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000197),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000198),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000199),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000200),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000201),
 p_db_column_name=>'INSERTS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000202),
 p_db_column_name=>'UPDATES',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000203),
 p_db_column_name=>'DELETES',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000204),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000205),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000206),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000207),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000208),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000209),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000210),
 p_db_column_name=>'ROW_KIND',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Row Kind',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000211),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000212),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110630',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'USER_NAME:MODULE_NAME:MODULE_CODE:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY:ROW_KIND',
 p_sort_column_1=>'USER_NAME',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1107,
 p_name=>'Company × Location Matrix',
 p_alias=>'ACTIVITY-COMPANY-LOCATION',
 p_step_title=>'Company × Location Matrix',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000213),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Company × Location Matrix</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000214),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000214',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000215),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000216),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000216',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Searchable matrix equivalent. Row, column and grand totals are distinct aggregate rows; do not add totals to detail rows.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000217),
 p_plug_name=>'Company × Location Matrix',
 p_static_id=>'am-report-1107-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(company_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(location_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,case when regexp_like(to_char(row_kind),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(row_kind) else to_char(row_kind) end row_kind,case when row_kind=''Detail'' then apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2'',p_values=>''COMPANY''||'',''||replace(replace(nvl(to_char(company_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''LOCATION''||'',''||replace(replace(nvl(to_char(location_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) when row_kind=''Row total'' then apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''COMPANY''||'',''||replace(replace(nvl(to_char(company_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) when row_kind=''Column total'' then apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1'',p_values=>''LOCATION''||'',''||replace(replace(nvl(to_char(location_code),''~NULL~''),''%'',''%25''),'','',''%2C'')) else apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'') end detail_url from (select company_name,location_name,company_code,location_code,',
'count(*) total_events,',
' sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,',
' sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,',
' sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,',
' sum(case when operation=''INSERT'' then 1 else 0 end) inserts,',
' sum(case when operation=''UPDATE'' then 1 else 0 end) updates,',
' sum(case when operation=''DELETE'' then 1 else 0 end) deletes,',
' sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,',
' count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,',
' count(distinct record_identity) distinct_records,',
' sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity,case when grouping(company_code)=1 and grouping(location_code)=1 then ''Grand total'' when grouping(company_code)=1 then ''Column total'' when grouping(location_code)=1 then ''Row total'' else ''Detail'' end row_kind',
'from IMART_ACTIVITY_SCOPE_V group by grouping sets ((company_name,location_name,company_code,location_code),(company_name,company_code),(location_name,location_code),()))')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000218),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000218);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000219),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000220),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000221),
 p_db_column_name=>'COMPANY_CODE',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Company Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000222),
 p_db_column_name=>'LOCATION_CODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Location Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000223),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000224),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000225),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000226),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000227),
 p_db_column_name=>'INSERTS',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000228),
 p_db_column_name=>'UPDATES',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000229),
 p_db_column_name=>'DELETES',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000230),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000231),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000232),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000233),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000234),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000235),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000236),
 p_db_column_name=>'ROW_KIND',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Row Kind',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000237),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000238),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110730',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'COMPANY_NAME:LOCATION_NAME:COMPANY_CODE:LOCATION_CODE:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY:ROW_KIND',
 p_sort_column_1=>'COMPANY_NAME',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1108,
 p_name=>'Operation Activity MIS',
 p_alias=>'ACTIVITY-OPERATIONS',
 p_step_title=>'Operation Activity MIS',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000239),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Operation Activity MIS</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000240),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000240',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000241),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000242),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000242',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000243),
 p_plug_name=>'Operation Activity MIS',
 p_static_id=>'am-report-1108-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>'select case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(module_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113'',p_items=>''P1113_D1,P1113_V1,P1113_D2,P1113_V2,P1113_D3,P1113_V3'',p_values=>''ACTION''||'',''||replace(replace(nvl(to_char(operation),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''MODULE''||'',''||replace(replace(nvl(to_char(module_code),''~NULL~''),''%'',''%25''),'','',''%2C'')||'',''||''USER''||'',''||replace(replace(nvl(to_char(user_name),''~NULL~''),''%'',''%25''),'','',''%2C'')) detail_url from (select operation,original_action,module_name,company_name,location_name,user_name,module_code,
count(*) total_events,
 sum(case when outcome=''SUCCESS'' then 1 else 0 end) successful_events,
 sum(case when outcome=''FAILURE'' then 1 else 0 end) failed_events,
 sum(case when outcome=''OBSERVED'' then 1 else 0 end) observed_events,
 sum(case when operation=''INSERT'' then 1 else 0 end) inserts,
 sum(case when operation=''UPDATE'' then 1 else 0 end) updates,
 sum(case when operation=''DELETE'' then 1 else 0 end) deletes,
 sum(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then 1 else 0 end) other_events,
 count(distinct case when source_type=''APEX_USER'' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by operation,original_action,module_name,company_name,location_name,user_name,module_code)',
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000244),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000244);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000245),
 p_db_column_name=>'OPERATION',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000246),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000247),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000248),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000249),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000250),
 p_db_column_name=>'USER_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000251),
 p_db_column_name=>'MODULE_CODE',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Module Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000252),
 p_db_column_name=>'TOTAL_EVENTS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Total Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000253),
 p_db_column_name=>'SUCCESSFUL_EVENTS',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Successful Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000254),
 p_db_column_name=>'FAILED_EVENTS',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Failed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000255),
 p_db_column_name=>'OBSERVED_EVENTS',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Observed Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000256),
 p_db_column_name=>'INSERTS',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Inserts',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000257),
 p_db_column_name=>'UPDATES',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Updates',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000258),
 p_db_column_name=>'DELETES',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Deletes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000259),
 p_db_column_name=>'OTHER_EVENTS',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Other Events',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000260),
 p_db_column_name=>'ACTIVE_USERS',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Active Users',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000261),
 p_db_column_name=>'DISTINCT_RECORDS',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Distinct Records',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000262),
 p_db_column_name=>'SUCCESSFUL_ROW_OPERATIONS',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Successful Row Operations',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000263),
 p_db_column_name=>'FIRST_ACTIVITY',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'First Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000264),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000265),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000266),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110830',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'OPERATION:ORIGINAL_ACTION:MODULE_NAME:COMPANY_NAME:LOCATION_NAME:USER_NAME:MODULE_CODE:TOTAL_EVENTS:SUCCESSFUL_EVENTS:FAILED_EVENTS:OBSERVED_EVENTS:INSERTS:UPDATES:DELETES:OTHER_EVENTS:ACTIVE_USERS:DISTINCT_RECORDS:SUCCESSFUL_ROW_OPERATIONS:FIRST_ACTIVITY:LAST_ACTIVITY',
 p_sort_column_1=>'OPERATION',
 p_sort_direction_1=>'ASC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1109,
 p_name=>'Exception Activity MIS',
 p_alias=>'ACTIVITY-EXCEPTIONS',
 p_step_title=>'Exception Activity MIS',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000267),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Exception Activity MIS</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000268),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000268',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000269),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000270),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000270',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured failures, deletions and administrative entity changes. These are descriptive categories; deletions are not classified as security incidents. No configured risk score was verified.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000271),
 p_plug_name=>'Exception Activity MIS',
 p_static_id=>'am-report-1109-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url from IMART_ACTIVITY_SCOPE_V where exception_reason is not null')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000272),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000272);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000273),
 p_db_column_name=>'AUDIT_EVENT_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Event Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_column_link=>'#DETAIL_URL#',
 p_column_linktext=>'#AUDIT_EVENT_ID#',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000274),
 p_db_column_name=>'LOCAL_TIMESTAMP',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Local Timestamp',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000275),
 p_db_column_name=>'USER_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000276),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000277),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000278),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000279),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000280),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000281),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000282),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000283),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000284),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000285),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000286),
 p_db_column_name=>'OPERATION',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000287),
 p_db_column_name=>'EVENT_TYPE',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Event Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000288),
 p_db_column_name=>'TABLE_NAME',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Table Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000289),
 p_db_column_name=>'RECORD_KEY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Record Key',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000290),
 p_db_column_name=>'TRANSACTION_REFERENCE',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Transaction Reference',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000291),
 p_db_column_name=>'OUTCOME',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Outcome',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000292),
 p_db_column_name=>'ERROR_CODE',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Error Code',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000293),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000294),
 p_db_column_name=>'APEX_SESSION_ID',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Apex Session Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000295),
 p_db_column_name=>'SOURCE_TYPE',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Source Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000296),
 p_db_column_name=>'CORRELATION_ID',
 p_display_order=>240,
 p_column_identifier=>'X',
 p_column_label=>'Correlation Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000297),
 p_db_column_name=>'TRANSACTION_ID',
 p_display_order=>250,
 p_column_identifier=>'Y',
 p_column_label=>'Transaction Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000298),
 p_db_column_name=>'EXCEPTION_REASON',
 p_display_order=>260,
 p_column_identifier=>'Z',
 p_column_label=>'Exception Reason',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000299),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>270,
 p_column_identifier=>'AA',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000300),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM110930',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERENCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON',
 p_sort_column_1=>'AUDIT_EVENT_ID',
 p_sort_direction_1=>'DESC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1110,
 p_name=>'Login and Session MIS',
 p_alias=>'ACTIVITY-SESSIONS',
 p_step_title=>'Login and Session MIS',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000301),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Login and Session MIS</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000302),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000302',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000303),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000304),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000304',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Actual authentication events permitted by the existing organizational grants. Missing organization context can exclude login events. Session observation and last activity are reported separately below; no inferred logout or duration.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000305),
 p_plug_name=>'Login and Session MIS',
 p_static_id=>'am-report-1110-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url from IMART_ACTIVITY_SCOPE_V where event_type=''AUTHENTICATION''')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000306),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000306);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000307),
 p_db_column_name=>'AUDIT_EVENT_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Event Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_column_link=>'#DETAIL_URL#',
 p_column_linktext=>'#AUDIT_EVENT_ID#',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000308),
 p_db_column_name=>'LOCAL_TIMESTAMP',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Local Timestamp',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000309),
 p_db_column_name=>'USER_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000310),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000311),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000312),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000313),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000314),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000315),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000316),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000317),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000318),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000319),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000320),
 p_db_column_name=>'OPERATION',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000321),
 p_db_column_name=>'EVENT_TYPE',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Event Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000322),
 p_db_column_name=>'TABLE_NAME',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Table Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000323),
 p_db_column_name=>'RECORD_KEY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Record Key',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000324),
 p_db_column_name=>'TRANSACTION_REFERENCE',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Transaction Reference',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000325),
 p_db_column_name=>'OUTCOME',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Outcome',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000326),
 p_db_column_name=>'ERROR_CODE',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Error Code',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000327),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000328),
 p_db_column_name=>'APEX_SESSION_ID',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Apex Session Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000329),
 p_db_column_name=>'SOURCE_TYPE',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Source Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000330),
 p_db_column_name=>'CORRELATION_ID',
 p_display_order=>240,
 p_column_identifier=>'X',
 p_column_label=>'Correlation Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000331),
 p_db_column_name=>'TRANSACTION_ID',
 p_display_order=>250,
 p_column_identifier=>'Y',
 p_column_label=>'Transaction Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000332),
 p_db_column_name=>'EXCEPTION_REASON',
 p_display_order=>260,
 p_column_identifier=>'Z',
 p_column_label=>'Exception Reason',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000333),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>270,
 p_column_identifier=>'AA',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000334),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM111030',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERENCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON',
 p_sort_column_1=>'AUDIT_EVENT_ID',
 p_sort_direction_1=>'DESC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000335),
 p_plug_name=>'Observed authenticated sessions',
 p_static_id=>'am-report-1110-40',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>40,
 p_plug_source=>'select s.audit_session_id,case when regexp_like(to_char(s.user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(s.user_name) else to_char(s.user_name) end user_name,case when regexp_like(to_char(max(e.company_name)),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(max(e.company_name)) else to_char(max(e.company_name)) end company_name,
 cast(s.observed_at at time zone ''Asia/Kolkata'' as timestamp) session_started,
 cast(min(case when e.event_type=''AUTHENTICATION'' and e.original_action in (''LOGOUT'',''SESSION_EXPIRED'') and e.event_timestamp>=s.observed_at then e.event_timestamp end) at time zone ''Asia/Kolkata'' as timestamp) session_end,
 max(e.local_timestamp) last_activity,
 round((cast(min(case when e.event_type=''AUTHENTICATION'' and e.original_action in (''LOGOUT'',''SESSION_EXPIRED'') and e.event_timestamp>=s.observed_at then sys_extract_utc(e.event_timestamp) end) as date)-cast(sys_extract_utc(s.observed_at) as date))*1440,2) session_minutes,
 case when count(case when e.event_type=''AUTHENTICATION'' and e.original_action in (''LOGOUT'',''SESSION_EXPIRED'') and e.event_timestamp>=s.observed_at then 1 end)>0 then ''Recorded end within selected period'' else ''No recorded end within selected period'' end end_status
 from IMART_ACTIVITY_SCOPE_V e join IMART_AUDIT_SESSION s on s.audit_session_id=e.audit_session_id and s.application_id=105 and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name
 group by s.audit_session_id,s.user_name,s.observed_at',
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000336),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'N',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000336);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000337),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000338),
 p_db_column_name=>'USER_NAME',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000339),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000340),
 p_db_column_name=>'SESSION_STARTED',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Session Started',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000341),
 p_db_column_name=>'SESSION_END',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Session End',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000342),
 p_db_column_name=>'LAST_ACTIVITY',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Last Activity',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000343),
 p_db_column_name=>'SESSION_MINUTES',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Session Minutes',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G990D00',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000344),
 p_db_column_name=>'END_STATUS',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'End Status',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000345),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM111040',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_SESSION_ID:USER_NAME:COMPANY_NAME:SESSION_STARTED:SESSION_END:LAST_ACTIVITY:SESSION_MINUTES:END_STATUS',
 p_sort_column_1=>'AUDIT_SESSION_ID',
 p_sort_direction_1=>'DESC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1111,
 p_name=>'Master Data Change MIS',
 p_alias=>'ACTIVITY-MASTERS',
 p_step_title=>'Master Data Change MIS',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000346),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Master Data Change MIS</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000347),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000347',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000348),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000349),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000349',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Row changes to entities identified by the current MODULE.MASTERTABLENAME directory mapping. Current classification is not an historical classification snapshot.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000350),
 p_plug_name=>'Master Data Change MIS',
 p_static_id=>'am-report-1111-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url from IMART_ACTIVITY_SCOPE_V where event_type=''ROW_CHANGE'' and master_mapping is not null')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000351),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000351);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000352),
 p_db_column_name=>'AUDIT_EVENT_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Event Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_column_link=>'#DETAIL_URL#',
 p_column_linktext=>'#AUDIT_EVENT_ID#',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000353),
 p_db_column_name=>'LOCAL_TIMESTAMP',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Local Timestamp',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000354),
 p_db_column_name=>'USER_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000355),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000356),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000357),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000358),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000359),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000360),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000361),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000362),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000363),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000364),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000365),
 p_db_column_name=>'OPERATION',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000366),
 p_db_column_name=>'EVENT_TYPE',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Event Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000367),
 p_db_column_name=>'TABLE_NAME',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Table Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000368),
 p_db_column_name=>'RECORD_KEY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Record Key',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000369),
 p_db_column_name=>'TRANSACTION_REFERENCE',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Transaction Reference',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000370),
 p_db_column_name=>'OUTCOME',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Outcome',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000371),
 p_db_column_name=>'ERROR_CODE',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Error Code',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000372),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000373),
 p_db_column_name=>'APEX_SESSION_ID',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Apex Session Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000374),
 p_db_column_name=>'SOURCE_TYPE',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Source Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000375),
 p_db_column_name=>'CORRELATION_ID',
 p_display_order=>240,
 p_column_identifier=>'X',
 p_column_label=>'Correlation Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000376),
 p_db_column_name=>'TRANSACTION_ID',
 p_display_order=>250,
 p_column_identifier=>'Y',
 p_column_label=>'Transaction Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000377),
 p_db_column_name=>'EXCEPTION_REASON',
 p_display_order=>260,
 p_column_identifier=>'Z',
 p_column_label=>'Exception Reason',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000378),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>270,
 p_column_identifier=>'AA',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000379),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM111130',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERENCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON',
 p_sort_column_1=>'AUDIT_EVENT_ID',
 p_sort_direction_1=>'DESC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1112,
 p_name=>'Administrative Entity Audit',
 p_alias=>'ACTIVITY-PRIVILEGED',
 p_step_title=>'Administrative Entity Audit',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000380),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Administrative Entity Audit</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000381),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000381',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000382),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000383),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000383',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Captured changes to the verified user and role-assignment entities. Historical actor privileges were not recorded, so this report does not assert that each actor was privileged.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000384),
 p_plug_name=>'Administrative Entity Audit',
 p_static_id=>'am-report-1112-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url from IMART_ACTIVITY_SCOPE_V where event_type=''ROW_CHANGE'' and table_name in (''BOSSUSER'',''BOSSUSERROLE'')')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000385),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000385);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000386),
 p_db_column_name=>'AUDIT_EVENT_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Event Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_column_link=>'#DETAIL_URL#',
 p_column_linktext=>'#AUDIT_EVENT_ID#',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000387),
 p_db_column_name=>'LOCAL_TIMESTAMP',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Local Timestamp',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000388),
 p_db_column_name=>'USER_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000389),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000390),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000391),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000392),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000393),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000394),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000395),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000396),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000397),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000398),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000399),
 p_db_column_name=>'OPERATION',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000400),
 p_db_column_name=>'EVENT_TYPE',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Event Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000401),
 p_db_column_name=>'TABLE_NAME',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Table Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000402),
 p_db_column_name=>'RECORD_KEY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Record Key',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000403),
 p_db_column_name=>'TRANSACTION_REFERENCE',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Transaction Reference',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000404),
 p_db_column_name=>'OUTCOME',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Outcome',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000405),
 p_db_column_name=>'ERROR_CODE',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Error Code',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000406),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000407),
 p_db_column_name=>'APEX_SESSION_ID',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Apex Session Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000408),
 p_db_column_name=>'SOURCE_TYPE',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Source Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000409),
 p_db_column_name=>'CORRELATION_ID',
 p_display_order=>240,
 p_column_identifier=>'X',
 p_column_label=>'Correlation Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000410),
 p_db_column_name=>'TRANSACTION_ID',
 p_display_order=>250,
 p_column_identifier=>'Y',
 p_column_label=>'Transaction Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000411),
 p_db_column_name=>'EXCEPTION_REASON',
 p_display_order=>260,
 p_column_identifier=>'Z',
 p_column_label=>'Exception Reason',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000412),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>270,
 p_column_identifier=>'AA',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000413),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM111230',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERENCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON',
 p_sort_column_1=>'AUDIT_EVENT_ID',
 p_sort_direction_1=>'DESC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1113,
 p_name=>'User Activity Detail',
 p_alias=>'ACTIVITY-DETAIL',
 p_step_title=>'User Activity Detail',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000414),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">User Activity Detail</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000415),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000415',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000416),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000417),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000417',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>Event-level detail. Open an event for masked field comparisons, or Record history for the same entity and captured key. All drill filters narrow the shared authorized population.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000418),
 p_name=>'P1113_D1',
 p_item_sequence=>1,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000419),
 p_name=>'P1113_V1',
 p_item_sequence=>1,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000420),
 p_name=>'P1113_D2',
 p_item_sequence=>2,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000421),
 p_name=>'P1113_V2',
 p_item_sequence=>2,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000422),
 p_name=>'P1113_D3',
 p_item_sequence=>3,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000423),
 p_name=>'P1113_V3',
 p_item_sequence=>3,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000424),
 p_name=>'P1113_D4',
 p_item_sequence=>4,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000425),
 p_name=>'P1113_V4',
 p_item_sequence=>4,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000426),
 p_plug_name=>'User Activity Detail',
 p_static_id=>'am-report-1113-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url,apex_page.get_url(p_page=>1114,p_clear_cache=>''RP,1114'',p_items=>''P1114_EVENT'',p_values=>to_char(audit_event_id)) history_url from IMART_ACTIVITY_SCOPE_V where 1=1 and (:P1113_D1 is null or case :P1113_D1 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),''~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),''~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then to_char(local_timestamp,case length(:P1113_V1) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V1,''%2C'','',''),''%25'',''%''))',
'and (:P1113_D2 is null or case :P1113_D2 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),''~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),''~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then to_char(local_timestamp,case length(:P1113_V2) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V2,''%2C'','',''),''%25'',''%''))',
'and (:P1113_D3 is null or case :P1113_D3 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),''~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),''~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then to_char(local_timestamp,case length(:P1113_V3) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V3,''%2C'','',''),''%25'',''%''))',
'and (:P1113_D4 is null or case :P1113_D4 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),''~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),''~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then to_char(local_timestamp,case length(:P1113_V4) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V4,''%2C'','',''),''%25'',''%''))')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000427),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#HISTORY_URL#',
 p_detail_link_text=>'Record history',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000427);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000428),
 p_db_column_name=>'AUDIT_EVENT_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Event Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_column_link=>'#DETAIL_URL#',
 p_column_linktext=>'#AUDIT_EVENT_ID#',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000429),
 p_db_column_name=>'LOCAL_TIMESTAMP',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Local Timestamp',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000430),
 p_db_column_name=>'USER_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000431),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000432),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000433),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000434),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000435),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000436),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000437),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000438),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000439),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000440),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000441),
 p_db_column_name=>'OPERATION',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000442),
 p_db_column_name=>'EVENT_TYPE',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Event Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000443),
 p_db_column_name=>'TABLE_NAME',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Table Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000444),
 p_db_column_name=>'RECORD_KEY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Record Key',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000445),
 p_db_column_name=>'TRANSACTION_REFERENCE',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Transaction Reference',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000446),
 p_db_column_name=>'OUTCOME',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Outcome',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000447),
 p_db_column_name=>'ERROR_CODE',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Error Code',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000448),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000449),
 p_db_column_name=>'APEX_SESSION_ID',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Apex Session Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000450),
 p_db_column_name=>'SOURCE_TYPE',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Source Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000451),
 p_db_column_name=>'CORRELATION_ID',
 p_display_order=>240,
 p_column_identifier=>'X',
 p_column_label=>'Correlation Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000452),
 p_db_column_name=>'TRANSACTION_ID',
 p_display_order=>250,
 p_column_identifier=>'Y',
 p_column_label=>'Transaction Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000453),
 p_db_column_name=>'EXCEPTION_REASON',
 p_display_order=>260,
 p_column_identifier=>'Z',
 p_column_label=>'Exception Reason',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000454),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>270,
 p_column_identifier=>'AA',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000455),
 p_db_column_name=>'HISTORY_URL',
 p_display_order=>280,
 p_column_identifier=>'AB',
 p_column_label=>'Record history',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000456),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM111330',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERENCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON',
 p_sort_column_1=>'AUDIT_EVENT_ID',
 p_sort_direction_1=>'DESC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1114,
 p_name=>'Record Audit History',
 p_alias=>'ACTIVITY-RECORD-HISTORY',
 p_step_title=>'Record Audit History',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000457),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Record Audit History</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000458),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000458',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000459),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000460),
 p_plug_name=>'Report definition',
 p_static_id=>'activity-92002610200000460',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'<p>History for the exact authorized entity and recorded key, within the selected period. Deleted records are represented only by captured events and available historical values. No current-row reconstruction.</p>',
 p_plug_source_type=>'NATIVE_STATIC');
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000461),
 p_name=>'P1114_EVENT',
 p_item_sequence=>1,
 p_display_as=>'NATIVE_HIDDEN',
 p_protection_level=>'S',
 p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000462),
 p_plug_name=>'Record Audit History',
 p_static_id=>'am-report-1114-30',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_plug_display_sequence=>30,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url from IMART_ACTIVITY_SCOPE_V e where exists(select 1 from IMART_ACTIVITY_EVENTS_V chosen where chosen.audit_event_id=to_number(:P1114_EVENT default null on conversion error) and chosen.table_name=e.table_name and chosen.record_identity is not null and chosen.record_identity=e.record_identity)')),
 p_plug_source_type=>'NATIVE_IR',
 p_plug_query_options=>'DERIVED_REPORT_COLUMNS');
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000463),
 p_max_row_count=>'1000000',
 p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.',
 p_max_rows_per_page=>'1000',
 p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
 p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_report_list_mode=>'TABS',
 p_lazy_loading=>false,
 p_show_detail_link=>'C',
 p_detail_link=>'#DETAIL_URL#',
 p_detail_link_text=>'View details',
 p_show_flashback=>'N',
 p_show_download=>'Y',
 p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999),
 p_download_formats=>'CSV:XLSX:HTML',
 p_enable_mail_download=>'N',
 p_show_notify=>'N',
 p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.',
 p_internal_uid=>92002610200000463);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000464),
 p_db_column_name=>'AUDIT_EVENT_ID',
 p_display_order=>10,
 p_column_identifier=>'A',
 p_column_label=>'Audit Event Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_column_link=>'#DETAIL_URL#',
 p_column_linktext=>'#AUDIT_EVENT_ID#',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000465),
 p_db_column_name=>'LOCAL_TIMESTAMP',
 p_display_order=>20,
 p_column_identifier=>'B',
 p_column_label=>'Local Timestamp',
 p_column_type=>'DATE',
 p_column_alignment=>'LEFT',
 p_format_mask=>'DD-MM-YYYY HH24:MI:SS',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000466),
 p_db_column_name=>'USER_NAME',
 p_display_order=>30,
 p_column_identifier=>'C',
 p_column_label=>'User Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000467),
 p_db_column_name=>'BOSSUSERCODE',
 p_display_order=>40,
 p_column_identifier=>'D',
 p_column_label=>'Bossusercode',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000468),
 p_db_column_name=>'EMPLOYEE_CODE',
 p_display_order=>50,
 p_column_identifier=>'E',
 p_column_label=>'Employee Code',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000469),
 p_db_column_name=>'CURRENT_EMPLOYEE_NAME',
 p_display_order=>60,
 p_column_identifier=>'F',
 p_column_label=>'Current Employee Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000470),
 p_db_column_name=>'CURRENT_DEPARTMENT_NAME',
 p_display_order=>70,
 p_column_identifier=>'G',
 p_column_label=>'Current Department Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000471),
 p_db_column_name=>'COMPANY_NAME',
 p_display_order=>80,
 p_column_identifier=>'H',
 p_column_label=>'Company Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000472),
 p_db_column_name=>'LOCATION_NAME',
 p_display_order=>90,
 p_column_identifier=>'I',
 p_column_label=>'Location Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000473),
 p_db_column_name=>'MODULE_NAME',
 p_display_order=>100,
 p_column_identifier=>'J',
 p_column_label=>'Module Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000474),
 p_db_column_name=>'PAGE_NAME',
 p_display_order=>110,
 p_column_identifier=>'K',
 p_column_label=>'Page Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000475),
 p_db_column_name=>'FORM_NAME',
 p_display_order=>120,
 p_column_identifier=>'L',
 p_column_label=>'Form Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000476),
 p_db_column_name=>'ORIGINAL_ACTION',
 p_display_order=>130,
 p_column_identifier=>'M',
 p_column_label=>'Original Action',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000477),
 p_db_column_name=>'OPERATION',
 p_display_order=>140,
 p_column_identifier=>'N',
 p_column_label=>'Operation',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000478),
 p_db_column_name=>'EVENT_TYPE',
 p_display_order=>150,
 p_column_identifier=>'O',
 p_column_label=>'Event Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000479),
 p_db_column_name=>'TABLE_NAME',
 p_display_order=>160,
 p_column_identifier=>'P',
 p_column_label=>'Table Name',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000480),
 p_db_column_name=>'RECORD_KEY',
 p_display_order=>170,
 p_column_identifier=>'Q',
 p_column_label=>'Record Key',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000481),
 p_db_column_name=>'TRANSACTION_REFERENCE',
 p_display_order=>180,
 p_column_identifier=>'R',
 p_column_label=>'Transaction Reference',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000482),
 p_db_column_name=>'OUTCOME',
 p_display_order=>190,
 p_column_identifier=>'S',
 p_column_label=>'Outcome',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000483),
 p_db_column_name=>'ERROR_CODE',
 p_display_order=>200,
 p_column_identifier=>'T',
 p_column_label=>'Error Code',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000484),
 p_db_column_name=>'AUDIT_SESSION_ID',
 p_display_order=>210,
 p_column_identifier=>'U',
 p_column_label=>'Audit Session Id',
 p_column_type=>'NUMBER',
 p_column_alignment=>'RIGHT',
 p_format_mask=>'999G999G999G990',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000485),
 p_db_column_name=>'APEX_SESSION_ID',
 p_display_order=>220,
 p_column_identifier=>'V',
 p_column_label=>'Apex Session Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000486),
 p_db_column_name=>'SOURCE_TYPE',
 p_display_order=>230,
 p_column_identifier=>'W',
 p_column_label=>'Source Type',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000487),
 p_db_column_name=>'CORRELATION_ID',
 p_display_order=>240,
 p_column_identifier=>'X',
 p_column_label=>'Correlation Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000488),
 p_db_column_name=>'TRANSACTION_ID',
 p_display_order=>250,
 p_column_identifier=>'Y',
 p_column_label=>'Transaction Id',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000489),
 p_db_column_name=>'EXCEPTION_REASON',
 p_display_order=>260,
 p_column_identifier=>'Z',
 p_column_label=>'Exception Reason',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'ESCAPE_SC');
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000490),
 p_db_column_name=>'DETAIL_URL',
 p_display_order=>270,
 p_column_identifier=>'AA',
 p_column_label=>'Event / detail',
 p_column_type=>'STRING',
 p_column_alignment=>'LEFT',
 p_use_as_row_header=>'N',
 p_available_clientside=>'N',
 p_display_text_as=>'HIDDEN');
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000491),
 p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,
 p_report_alias=>'AM111430',
 p_status=>'PUBLIC',
 p_is_default=>'Y',
 p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERENCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON',
 p_sort_column_1=>'AUDIT_EVENT_ID',
 p_sort_direction_1=>'DESC');
end;
/
begin
wwv_flow_imp_page.create_page(
 p_id=>1115,
 p_name=>'Activity Definitions & Coverage',
 p_alias=>'ACTIVITY-COVERAGE',
 p_step_title=>'Activity Definitions & Coverage',
 p_step_template=>wwv_flow_imp.id(95002006100926),
 p_required_role=>wwv_flow_imp.id(91004000000000002),
 p_protection_level=>'C',
 p_warn_on_unsaved_changes=>'N',
 p_autocomplete_on_off=>'OFF',
 p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('/* All selectors belong to the Activity pages; colors inherit the ERP theme. */',
'.am-context p,.am-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-actions{display:flex;flex-wrap:wrap;gap:.65rem;margin-block:1rem}',
'.am-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1rem}',
'.am-kpi{display:flex;flex-direction:column;gap:.7rem;padding:1.25rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);background:var(--ut-component-background-color,#fff);color:var(--ut-body-text-color);text-decoration:none;min-width:0}',
'.am-kpi strong{font-size:2rem;font-variant-numeric:tabular-nums;color:var(--ut-palette-primary)}',
'.am-kpi small{color:var(--ut-palette-primary);display:flex;justify-content:space-between}',
'.am-kpi:hover{border-color:var(--ut-palette-primary);text-decoration:none}',
'.am-kpi:focus-visible{outline:2px solid var(--ut-palette-primary);outline-offset:3px}',
'.am-directory{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem;margin-block:1rem}',
'.am-directory .hspl-directory-card{display:flex;align-items:center;gap:1rem;border:1px solid var(--ut-component-border-color,#ddd);border-radius:var(--ut-component-border-radius,.75rem);padding:1.25rem;text-decoration:none;color:var(--ut-body-text-color);background:var(--ut-component-background-color,#fff)}',
'.am-directory .hspl-directory-icon,.am-directory .hspl-directory-arrow{color:var(--ut-palette-primary)}',
'.am-directory .hspl-directory-title{flex:1;font-weight:600}.am-coverage{max-width:80ch;line-height:1.7}',
'@media(max-width:1000px){.am-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:600px){.am-kpis,.am-directory{grid-template-columns:minmax(0,1fr)}.am-actions .t-Button{flex:1 1 auto}}',
'@media print{.am-actions,.a-IRR-toolbar{display:none!important}.am-kpis{grid-template-columns:repeat(3,minmax(0,1fr))}}',
'.am-trend-panel .am-trend-intro{padding:0 1rem .5rem}',
'.am-trend-intro h3{font-size:1rem;margin:.25rem 0 .65rem;font-weight:600}',
'.am-trend-intro p,.am-trend-note{color:var(--ut-body-text-color);line-height:1.6}',
'.am-trend-table-wrap{max-height:26rem;overflow:auto;margin:0 1rem}',
'.am-trend-table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}',
'.am-trend-table caption{text-align:left;padding:.6rem 0;color:var(--ut-body-text-color);font-size:.85rem}',
'.am-trend-table th,.am-trend-table td{padding:.8rem 1rem;border-bottom:1px solid var(--ut-component-border-color,#e5e7eb);text-align:right}',
'.am-trend-table th:first-child{text-align:left}',
'.am-trend-table thead th{position:sticky;top:0;background:var(--ut-component-background-color,#fff);font-weight:600}',
'.am-trend-table a{color:inherit;text-decoration:underline;text-decoration-color:transparent;text-underline-offset:.2em}',
'.am-trend-table a:hover,.am-trend-table a:focus-visible{text-decoration-color:currentColor;color:var(--ut-palette-primary)}',
'.am-trend-note{font-size:.8rem;padding:.5rem 1rem;margin:0}',
'.am-trend-panel .t-Region .t-Region-header{display:none}',
'@media(max-width:600px){.am-trend-table-wrap{margin:0}.am-trend-table th,.am-trend-table td{padding:.7rem .5rem}}',
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'')),
 p_page_component_map=>'18');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000492),
 p_plug_name=>'Activity page identity',
 p_region_attributes=>'style="display:contents"',
 p_plug_template=>wwv_flow_imp.id(95001071000503),
 p_plug_display_sequence=>1,
 p_plug_display_point=>'REGION_POSITION_01',
 p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">Activity Definitions & Coverage</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000493),
 p_plug_name=>'Reporting scope',
 p_static_id=>'activity-92002610200000493',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>2,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>'begin
 htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All permitted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');
 htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');
 htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.html(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');
 htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');
 htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');
htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');
 htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000494),
 p_process_sequence=>1,
 p_process_point=>'BEFORE_HEADER',
 p_process_type=>'NATIVE_PLSQL',
 p_process_name=>'Initialize and validate shared reporting period',
 p_process_sql_clob=>'declare f date;t date;begin
 if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;
 f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;
 apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));
end;',
 p_process_clob_language=>'PLSQL');
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000495),
 p_plug_name=>'Coverage and counting rules',
 p_static_id=>'activity-92002610200000495',
 p_plug_template=>wwv_flow_imp.id(4072358936313175081),
 p_region_template_options=>'#DEFAULT#:t-Region--scrollBody',
 p_plug_display_sequence=>10,
 p_plug_item_display_point=>'ABOVE',
 p_plug_grid_column_span=>12,
 p_plug_new_grid_row=>true,
 p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('<div class="am-coverage"><h2>What this dashboard measures</h2><p>Canonical captured audit events, filtered by recorded organization and your existing access grants. All pages share the Dashboard filters. Event outcomes SUCCESS, FAILURE and OBSERVED remain separate; observed approvals, page views and session ends are not successful transaction claims.</p><h3>Available</h3><ul><li>Event, user, module, company, location and operation summaries.</li><li>Searchable user × module and company × location matrices with separate total rows.</li><li>Failures, deletions, current mapped master changes and user/role-entity changes.</li><li>Event detail and masked historical field comparisons using existing audit dialogs.</li><li>Authorized native CSV, XLSX and HTML export; browser Print. Strings that could become spreadsheet formulas receive an apostrophe prefix.</li></ul><h3>Historical limits</h3><p>Capture observed from 04-10-2026. Missing company/location context remains excluded for company-only viewers. Current company, location and module labels are directory enrichment, not historical snapshots. High-level business events and row changes are distinct units; use Successful row operations for successful database row changes. Active ERP users means distinct recorded APEX_USER usernames, not database jobs.</p><h3>Unavailable until verified</h3><ul><li>Registered/inactive users: a complete user-to-organization membership relationship has not been verified. No activity does not prove inactivity.</li><li>Historical employee names, department and actor role: no verified snapshots. Recorded employee codes and explicitly labeled current employee/department names are available.</li><li>Submodule hierarchy and policy risk classifications: no verified mapping or configured risk/working-hour thresholds.</li><li>Privileged actor assertions: user and role-entity changes are shown; historical role membership is not inferred from username.</li><li>Failed logins lacking permitted organization context remain restricted. Session duration and concurrency are not inferred from ordinary page views.</li><li>Scheduled delivery: no verified authorized audit-report subscription/recipient service. Needs an approved recipient directory, per-recipient scope, credential-safe mail/print configuration, job ownership and retention policy. Existing task jobs are not audit delivery jobs.</li><li>Server PDF generation is not claimed; use browser Print unless approved print infrastructure is configured.</li></ul><h3>Security</h3><p>Audit Inquiry Access controls these pages. Central IMART_AUDIT.can_read controls all events; filters only narrow that scope. Downloads additionally require can_export for every organization in the selected population. No new grants, business records, audit policies or capture triggers are introduced. Application-wide Session State Protection is currently disabled in the existing ERP. Page/item checksum settings are configured, but do not enforce URL integrity until the application setting is reviewed separately. Central server-side organization checks remain enforced.</p><h3>Counting and boundaries</h3><p>Total events counts event IDs once. Failure events are recorded failures, not asserted unique attempts. Distinct records include table and key. Field rows never multiply event totals. Start date is inclusive; end date ends at the next midnight in Asia/Kolkata. Maximum period: 366 days. Matrix totals are not additional detail events. Top users shows ten actors by volume and does not measure productivity.</p></div>')),
 p_plug_source_type=>'NATIVE_STATIC');
end;
/
begin
wwv_flow_imp_shared.create_security_scheme(p_id=>wwv_flow_imp.id(92002610209999999),p_name=>'Activity export permitted scope',p_scheme_type=>'NATIVE_FUNCTION_BODY',p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('plsql_function_body','declare n number;begin if not imart_audit.can_inquire then return false;end if;select count(*) into n from (select distinct company_code,location_code from IMART_ACTIVITY_SCOPE_V) where imart_audit.can_export(company_code,location_code)<>1;return n=0;end;')).to_clob,p_caching=>'NOCACHE',p_error_message=>'Your audit grants do not permit export for this reporting scope.');
wwv_flow_imp.import_end;
commit;
end;
/
