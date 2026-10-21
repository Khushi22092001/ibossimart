
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
--     PAGE: 1113
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_01113
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1113);
end;
/
prompt --application/pages/page_01113
begin
wwv_flow_imp_page.create_page(
 p_id=>1113
,p_name=>'User Activity Detail'
,p_alias=>'ACTIVITY-DETAIL'
,p_step_title=>'User Activity Detail'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Keep the Activity Detail action caption readable within eight character units. */',
'#R92002610200000426 .a-IRR-table .a-IRR-linkCol{min-width:calc(8ch + 2rem);width:calc(8ch + 2rem);white-space:normal!important}',
'#R92002610200000426 .a-IRR-table td.a-IRR-linkCol>a{display:inline-block;width:8ch;min-width:8ch;max-width:8ch;white-space:normal!important;word-break:normal;overflow-wrap:anywhere;line-height:1.35;text-align:center}',
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
'.am-trend-panel .t-Region{border:0;box-shadow:none;background:transparent;margin-bottom:0}',
'',
''))
,p_step_template=>wwv_flow_imp.id(95002006100926)
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000415)
,p_plug_name=>'Reporting scope'
,p_static_id=>'activity-92002610200000415'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>2
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' htp.p(''<div class="am-context"><p><strong>Reporting period:</strong> ''||apex_escape.html(v(''P1100_FROM''))||'' to ''||apex_escape.html(v(''P1100_TO''))||'' (Asia/Kolkata, inclusive dates). Organization: ''||apex_escape.html(nvl(v(''P1100_COMPANY''),''All perm'
||'itted companies''))||'' / ''||apex_escape.html(nvl(v(''P1100_LOCATION''),''All permitted locations''))||''.</p>'');',
' htp.p(''<p>Refreshed ''||to_char(systimestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZR'')||''. Counts describe captured activity, not productivity.</p>'');',
' htp.p(''<p>User: ''||apex_escape.html(nvl(v(''P1100_USER''),''All permitted''))||''; module: ''||apex_escape.html(nvl(v(''P1100_MODULE''),''All available''))||''; operation: ''||apex_escape.html(nvl(v(''P1100_ACTION''),''All captured''))||''; outcome: ''||apex_escape.h'
||'tml(nvl(v(''P1100_OUTCOME''),''All recorded''))||''.</p>'');',
' htp.p(''<nav class="am-actions" aria-label="Activity navigation">'');',
' htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100,p_clear_cache=>null))||''">Dashboard / filters</a>'');',
'htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1113,p_clear_cache=>''RP,1113''))||''">Activity detail</a>'');',
'htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1115,p_clear_cache=>null))||''">Definitions &amp; coverage</a>'');',
'htp.p(''<a class="t-Button" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>826,p_clear_cache=>null))||''">Dashboard hub</a>'');',
' htp.p(''<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000417)
,p_plug_name=>'Report definition'
,p_static_id=>'activity-92002610200000417'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>'<p>Event-level detail. Open an event for masked field comparisons, or Record history for the same entity and captured key. All drill filters narrow the shared authorized population.</p>'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000414)
,p_plug_name=>'Activity page identity'
,p_static_id=>'activity-page-identity'
,p_region_attributes=>'style="display:contents"'
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">User Activity Detail</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610200000426)
,p_plug_name=>'User Activity Detail'
,p_static_id=>'am-report-1113-30'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),''^[[:space:][:cntrl:]]*['
||'=+@-]'') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,ca'
||'se when regexp_like(to_char(current_employee_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),''^[[:'
||'space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(company_name'
||') else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'''
||'^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(page_name) else to_char(page_name) end page_nam'
||'e,case when regexp_like(to_char(form_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(ori'
||'ginal_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'
||'''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(table_name) else to_char(table_name) end table_n'
||'ame,case when regexp_like(to_char(record_key),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)|'
||'|to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_ses'
||'sion_id,case when regexp_like(to_char(apex_session_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),''^[[:space:][:cntrl:]]*[=+@-]'')'
||' then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case whe'
||'n regexp_like(to_char(transaction_id),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),''^[[:space:][:cntrl:]]*[=+@-]'') then chr(39)||'
||'to_char(exception_reason) else to_char(exception_reason) end exception_reason,apex_page.get_url(p_page=>1091,p_clear_cache=>''1091'',p_items=>''P1091_EVENT_ID'',p_values=>to_char(audit_event_id)) detail_url,apex_page.get_url(p_page=>1114,p_clear_cache=>'''
||'RP,1114'',p_items=>''P1114_EVENT'',p_values=>to_char(audit_event_id)) history_url from IMART_ACTIVITY_SCOPE_V where 1=1 and (:P1113_D1 is null or case :P1113_D1 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_co'
||'de),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),''~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl('
||'to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EX'
||'CEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),''~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nv'
||'l(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then to_char(local_timestamp,case length(:P1113_V1) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = rep'
||'lace(replace(:P1113_V1,''%2C'','',''),''%25'',''%''))',
'and (:P1113_D2 is null or case :P1113_D2 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),'''
||'~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_'
||'name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),'''
||'~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then'
||' to_char(local_timestamp,case length(:P1113_V2) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V2,''%2C'','',''),''%25'',''%''))',
'and (:P1113_D3 is null or case :P1113_D3 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),'''
||'~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_'
||'name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),'''
||'~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then'
||' to_char(local_timestamp,case length(:P1113_V3) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V3,''%2C'','',''),''%25'',''%''))',
'and (:P1113_D4 is null or case :P1113_D4 when ''USER'' then nvl(to_char(user_name),''~NULL~'') when ''COMPANY'' then nvl(to_char(company_code),''~NULL~'') when ''LOCATION'' then nvl(to_char(location_code),''~NULL~'') when ''MODULE'' then nvl(to_char(module_code),'''
||'~NULL~'') when ''PAGE'' then nvl(to_char(page_id),''~NULL~'') when ''ACTION'' then nvl(to_char(operation),''~NULL~'') when ''OUTCOME'' then nvl(to_char(outcome),''~NULL~'') when ''SOURCE'' then nvl(to_char(source_type),''~NULL~'') when ''TABLE'' then nvl(to_char(table_'
||'name),''~NULL~'') when ''RECORD'' then nvl(to_char(record_key),''~NULL~'') when ''EVENT'' then nvl(to_char(audit_event_id),''~NULL~'') when ''EXCEPTION'' then nvl(to_char(exception_reason),''~NULL~'') when ''ROW_SUCCESS'' then nvl(to_char(successful_row_operation),'''
||'~NULL~'') when ''KEYED'' then nvl(to_char(case when record_identity is not null then ''1'' else ''0'' end),''~NULL~'') when ''OTHEROPS'' then nvl(to_char(case when operation not in (''INSERT'',''UPDATE'',''DELETE'') then ''1'' else ''0'' end),''~NULL~'') when ''PERIOD'' then'
||' to_char(local_timestamp,case length(:P1113_V4) when 7 then ''YYYY-MM'' when 13 then ''YYYY-MM-DD HH24'' else ''YYYY-MM-DD'' end) end = replace(replace(:P1113_V4,''%2C'','',''),''%25'',''%''))'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(92002610200000427)
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.'
,p_no_data_found_message=>'No captured events match the selected filters and your permitted scope.'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_flashback=>'N'
,p_download_auth_scheme=>wwv_flow_imp.id(92002610209999999)
,p_download_formats=>'CSV:XLSX:HTML'
,p_enable_mail_download=>'N'
,p_detail_link=>'#HISTORY_URL#'
,p_detail_link_text=>'Record History'
,p_internal_uid=>92002610200000427
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000449)
,p_db_column_name=>'APEX_SESSION_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Apex Session Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000428)
,p_db_column_name=>'AUDIT_EVENT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Audit Event Id'
,p_column_link=>'#DETAIL_URL#'
,p_column_linktext=>'#AUDIT_EVENT_ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000448)
,p_db_column_name=>'AUDIT_SESSION_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Audit Session Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000431)
,p_db_column_name=>'BOSSUSERCODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Bossusercode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000435)
,p_db_column_name=>'COMPANY_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Company Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000451)
,p_db_column_name=>'CORRELATION_ID'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Correlation Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000434)
,p_db_column_name=>'CURRENT_DEPARTMENT_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Current Department Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000433)
,p_db_column_name=>'CURRENT_EMPLOYEE_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Current Employee Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000454)
,p_db_column_name=>'DETAIL_URL'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Event / detail'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000432)
,p_db_column_name=>'EMPLOYEE_CODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Employee Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000447)
,p_db_column_name=>'ERROR_CODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Error Code'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000442)
,p_db_column_name=>'EVENT_TYPE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Event Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000453)
,p_db_column_name=>'EXCEPTION_REASON'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Exception Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000439)
,p_db_column_name=>'FORM_NAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Form Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000455)
,p_db_column_name=>'HISTORY_URL'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Record history'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000429)
,p_db_column_name=>'LOCAL_TIMESTAMP'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Local Timestamp'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000436)
,p_db_column_name=>'LOCATION_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000437)
,p_db_column_name=>'MODULE_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Module Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000441)
,p_db_column_name=>'OPERATION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Operation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000440)
,p_db_column_name=>'ORIGINAL_ACTION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Original Action'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000446)
,p_db_column_name=>'OUTCOME'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Outcome'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000438)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000444)
,p_db_column_name=>'RECORD_KEY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Record Key'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000450)
,p_db_column_name=>'SOURCE_TYPE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000443)
,p_db_column_name=>'TABLE_NAME'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Table Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000452)
,p_db_column_name=>'TRANSACTION_ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Transaction Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000445)
,p_db_column_name=>'TRANSACTION_REFERENCE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Transaction Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(92002610200000430)
,p_db_column_name=>'USER_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'User Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(92002610200000456)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'AM111330'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'AUDIT_EVENT_ID:LOCAL_TIMESTAMP:USER_NAME:BOSSUSERCODE:EMPLOYEE_CODE:CURRENT_EMPLOYEE_NAME:CURRENT_DEPARTMENT_NAME:COMPANY_NAME:LOCATION_NAME:MODULE_NAME:PAGE_NAME:FORM_NAME:ORIGINAL_ACTION:OPERATION:EVENT_TYPE:TABLE_NAME:RECORD_KEY:TRANSACTION_REFERE'
||'NCE:OUTCOME:ERROR_CODE:AUDIT_SESSION_ID:APEX_SESSION_ID:SOURCE_TYPE:CORRELATION_ID:TRANSACTION_ID:EXCEPTION_REASON'
,p_sort_column_1=>'AUDIT_EVENT_ID'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000418)
,p_name=>'P1113_D1'
,p_item_sequence=>1
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000420)
,p_name=>'P1113_D2'
,p_item_sequence=>2
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000422)
,p_name=>'P1113_D3'
,p_item_sequence=>3
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000424)
,p_name=>'P1113_D4'
,p_item_sequence=>4
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000419)
,p_name=>'P1113_V1'
,p_item_sequence=>1
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000421)
,p_name=>'P1113_V2'
,p_item_sequence=>2
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000423)
,p_name=>'P1113_V3'
,p_item_sequence=>3
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92002610200000425)
,p_name=>'P1113_V4'
,p_item_sequence=>4
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92002610200000416)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize and validate shared reporting period'
,p_static_id=>'initialize-and-validate-shared-reporting-period'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare f date;t date;begin',
' if v(''P1100_FROM'') is null then apex_util.set_session_state(''P1100_FROM'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;',
' if v(''P1100_TO'') is null then apex_util.set_session_state(''P1100_TO'',to_char(trunc(cast(systimestamp at time zone ''Asia/Kolkata'' as date)),''DD-MM-YYYY''));end if;',
' f:=case when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXDD-MM-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_FROM'') as date,''F'
||'XYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_FROM''),''FXYYYY-MM-DD'') end;t:=case when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXDD-MM-YYYY'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXDD-M'
||'M-YYYY'') when validate_conversion(apex_util.get_session_state(''P1100_TO'') as date,''FXYYYY-MM-DD'')=1 then to_date(apex_util.get_session_state(''P1100_TO''),''FXYYYY-MM-DD'') end;',
' if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,''Choose a valid period of at most 366 days.'');end if;',
' apex_util.set_session_state(''P1100_FROM'',to_char(f,''DD-MM-YYYY''));apex_util.set_session_state(''P1100_TO'',to_char(t,''DD-MM-YYYY''));',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>92002610200000416
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
