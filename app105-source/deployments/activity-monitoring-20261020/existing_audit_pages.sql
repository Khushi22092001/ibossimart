
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
--   Export Type:     Component Export
--   Manifest
--     PAGE: 1090
--     PAGE: 1091
--     PAGE: 1093
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/pages/delete_01090
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1090);
end;
/
prompt --application/pages/page_01090
begin
wwv_flow_imp_page.create_page(
 p_id=>1090
,p_name=>'Audit Trail Inquiry'
,p_alias=>'AUDIT-TRAIL-INQUIRY'
,p_step_title=>'Audit Trail Inquiry'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':is(#audit-filters,#R91004000000000005){border:1px solid #dce4ed;border-radius:14px;overflow:hidden;box-shadow:0 3px 14px #12253e08;margin-bottom:24px}',
':is(#audit-filters,#R91004000000000005) .t-Region-header{background:#f6f9fc;border-bottom:1px solid #e3eaf2;padding:4px 8px}',
':is(#audit-filters,#R91004000000000005) .t-Region-title{font-weight:650;font-size:16px;color:#21344d}',
':is(#audit-filters,#R91004000000000005) .t-Region-body{padding:20px!important}',
':is(#audit-filters,#R91004000000000005) .t-Region-body .container{width:100%;padding:0}',
':is(#audit-filters,#R91004000000000005) .t-Region-body .container>.row{display:grid;grid-template-columns:repeat(4,minmax(0,1fr))!important;gap:18px 20px;margin:0 0 18px}',
':is(#audit-filters,#R91004000000000005) .t-Region-body .container>.row>.col{width:auto!important;max-width:none!important;padding:0!important;float:none;grid-column:auto!important;flex:none!important}',
':is(#audit-filters,#R91004000000000005) .t-Form-fieldContainer{display:flex;flex-direction:column;align-items:stretch;padding:0!important;margin:0!important;gap:6px}',
':is(#audit-filters,#R91004000000000005) .t-Form-labelContainer{width:100%;padding:0!important;text-align:left}',
':is(#audit-filters,#R91004000000000005) .t-Form-label{font-size:12px;font-weight:600;color:#52627a}',
':is(#audit-filters,#R91004000000000005) .t-Form-inputContainer{width:100%;padding:0!important}',
':is(#audit-filters,#R91004000000000005) .t-Form-itemWrapper{width:100%}',
':is(#audit-filters,#R91004000000000005) input,:is(#audit-filters,#R91004000000000005) select{min-height:40px;border-radius:8px;font-size:13px;width:100%}',
':is(#audit-filters,#R91004000000000005) .a-DatePicker{width:100%}',
':is(#audit-filters,#R91004000000000005) .a-Button--calendar{min-height:40px}',
':is(#audit-filters,#R91004000000000005) .t-Region-buttons{padding:14px 20px;border-top:1px solid #e3eaf2;background:#fafcff}',
':is(#audit-filters,#R91004000000000005) .t-Button{border-radius:8px;min-height:38px}',
':is(#audit-events,#R91004000000000023){border-radius:14px;overflow:hidden;border:1px solid #dce4ed;box-shadow:0 3px 14px #12253e08}',
'@media(max-width:1100px){:is(#audit-filters,#R91004000000000005) .t-Region-body .container>.row{grid-template-columns:repeat(2,minmax(0,1fr))!important}}',
'@media(max-width:640px){:is(#audit-filters,#R91004000000000005) .t-Region-body{padding:16px!important}:is(#audit-filters,#R91004000000000005) .t-Region-body .container>.row{grid-template-columns:minmax(0,1fr)!important;gap:14px}}',
':is(#audit-filters,#R91004000000000005) .t-Region-body>.container{display:grid!important;grid-template-columns:repeat(4,minmax(0,1fr))!important;gap:18px 20px!important;align-content:start!important;align-items:start!important;margin:0!important;padd'
||'ing:0!important}',
':is(#audit-filters,#R91004000000000005) .t-Region-body>.container>.row{display:contents!important}',
':is(#audit-filters,#R91004000000000005) .t-Region-body>.container>.row>.col{grid-column:auto!important;align-self:start!important;min-width:0!important}',
':is(#audit-filters,#R91004000000000005) .t-Form-fieldContainer{display:flex!important;flex-direction:column!important;align-items:stretch!important}',
':is(#audit-filters,#R91004000000000005) .t-Form-labelContainer{flex:none!important;max-width:none!important;width:100%!important;text-align:left!important}',
':is(#audit-filters,#R91004000000000005) .t-Form-inputContainer{flex:none!important;max-width:none!important;width:100%!important}',
'@media(max-width:1100px){:is(#audit-filters,#R91004000000000005) .t-Region-body>.container{grid-template-columns:repeat(2,minmax(0,1fr))!important}}',
'@media(max-width:640px){:is(#audit-filters,#R91004000000000005) .t-Region-body>.container{grid-template-columns:minmax(0,1fr)!important}}',
':is(#audit-filters,#R91004000000000005) .t-Region-body>.container{display:flex!important;flex-wrap:wrap!important;align-items:flex-start!important;gap:18px 20px!important}',
':is(#audit-filters,#R91004000000000005) .t-Region-body>.container>.row>.col{width:calc((100% - 60px)/4)!important;flex:0 0 calc((100% - 60px)/4)!important}',
'@media(max-width:1100px){:is(#audit-filters,#R91004000000000005) .t-Region-body>.container>.row>.col{width:calc((100% - 20px)/2)!important;flex:0 0 calc((100% - 20px)/2)!important}}',
'@media(max-width:640px){:is(#audit-filters,#R91004000000000005) .t-Region-body>.container>.row>.col{width:100%!important;flex:0 0 100%!important}}',
'/* Phase40: native collapsed filter panel, funnel in both states. */',
'#R91004000000000005 .t-Region-title::before{display:none!important;content:none!important}',
'#R91004000000000005 .a-Collapsible-icon::before{content:""!important;display:block!important;width:20px;height:20px;background:center/20px 20px no-repeat url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 0 24 24'' fill=''none'
||''' stroke=''%23545bd6'' stroke-width=''1.8'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cpath d=''M3 4h18l-7 8v6l-4 2v-8z''/%3E%3C/svg%3E")!important}',
'#R91004000000000005 .t-Button--hideShow{background:#edf0ff!important;color:#545bd6!important;width:38px;height:38px;display:flex;align-items:center;justify-content:center;cursor:pointer}',
'#R91004000000000005 .t-Region-titleButton{cursor:pointer;min-height:44px;width:100%;text-align:left}',
'#R91004000000000005 .t-Region-titleButton:focus-visible{outline:2px solid #545bd6;outline-offset:3px;border-radius:6px}',
'#R91004000000000005.is-collapsed .t-Region-header{border-bottom:0}',
'',
'/* Phase41: filter spacing, pointer focus and Reset icon. */',
'#R91004000000000005 .t-Region-header{column-gap:12px!important}',
'#R91004000000000005 .t-Region-headerItems--controls{margin:0!important;flex-shrink:0}',
'#R91004000000000005 .t-Region-title{margin:0!important}',
'#R91004000000000005 .t-Region-titleButton{width:auto!important;padding:4px 6px!important;border:0!important;background:transparent!important}',
'#R91004000000000005 .t-Region-titleButton:focus:not(:focus-visible){outline:none!important;box-shadow:none!important}',
'#R91004000000000005 .t-Region-titleButton:focus-visible{outline:2px solid #545bd6!important;outline-offset:2px;box-shadow:none!important;border-radius:6px}',
'#B91004000000000022,#B91005000000003901{display:inline-flex!important;align-items:center;justify-content:center;gap:8px;vertical-align:middle;padding:10px 16px!important;white-space:nowrap;min-height:42px}',
'#B91005000000003901{margin-inline-start:12px!important}',
'#B91005000000003901::before{content:"";display:block;flex:0 0 16px;width:16px;height:16px;background:center/16px 16px no-repeat url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 0 24 24'' fill=''none'' stroke=''%2352627a'' strok'
||'e-width=''1.8'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cpath d=''M3 11a9 9 0 1 1 2.6 7M3 4v7h7''/%3E%3C/svg%3E")}',
'@media(max-width:360px){#B91004000000000022,#B91005000000003901{padding:10px 12px!important}#B91005000000003901{margin-inline-start:10px!important}}',
'',
'/* Phase42: clean white audit reports and accessible section cards. */',
':is(#R91004000000000023){border:1px solid #dce4ef!important;border-radius:14px!important;box-shadow:0 3px 14px #12253e08!important;background:#fff!important;overflow:hidden;margin-bottom:20px}',
':is(#R91004000000000023) .t-Region-header{background:#f8faff!important;border-bottom:1px solid #e7edf5!important;padding:10px 16px!important;min-height:54px}',
':is(#R91004000000000023) .t-Region-title{font-size:16px!important;font-weight:650!important;color:#183153!important}',
':is(#R91004000000000023) .t-Region-body{background:#fff!important;padding:12px 14px!important}',
':is(#R91004000000000023) .t-Report-tableWrap{overflow-x:auto!important;border:1px solid #e5ebf3;border-radius:9px;scrollbar-width:thin;scrollbar-color:#bcc9dd #f4f7fb}',
':is(#R91004000000000023) .t-Report-report{border-collapse:separate!important;border-spacing:0!important;width:100%;font-size:13px!important;color:#33445e}',
':is(#R91004000000000023) .t-Report-report thead th{background:#f3f6fc!important;color:#294365!important;font-weight:650!important;font-size:12px!important;text-align:left!important;text-transform:capitalize;padding:13px 14px!important;border:0!import'
||'ant;border-bottom:1px solid #dce5f1!important;line-height:1.5;vertical-align:middle}',
':is(#R91004000000000023) .t-Report-report tbody tr,:is(#R91004000000000023) .t-Report-report tbody tr:nth-child(odd),:is(#R91004000000000023) .t-Report-report tbody tr:nth-child(even),:is(#R91004000000000023) .t-Report-report tbody td{background:#fff'
||'!important;background-image:none!important}',
':is(#R91004000000000023) .t-Report-report tbody td{padding:13px 14px!important;border:0!important;border-bottom:1px solid #e8edf4!important;text-align:left!important;vertical-align:top!important;line-height:1.55;color:#33445e;overflow-wrap:anywhere}',
':is(#R91004000000000023) .t-Report-report tbody tr:last-child td{border-bottom:0!important}',
':is(#R91004000000000023) .t-Report-report tbody tr:hover td{background:#fff!important}',
':is(#R91004000000000023) .t-Report-report a{color:#225ed4!important;font-weight:600;text-decoration:none}',
':is(#R91004000000000023) .t-Report-report a:hover{text-decoration:underline}',
':is(#R91004000000000023) .t-Report-report a:focus-visible{outline:2px solid #545bd6;outline-offset:3px;border-radius:3px}',
':is(#R91004000000000023) .t-Report-pagination{color:#63738b!important;font-size:12px;margin-top:10px}',
':is(#R91004000000000023) .t-Report-pagination a{display:inline-block;padding:6px 10px;border-radius:6px;color:#225ed4!important}',
':is(#R91004000000000023) .nodatafound{display:block;padding:16px 12px;color:#63738b;font-size:13px;line-height:1.6;background:#fff}',
'@media(max-width:640px){:is(#R91004000000000023) .t-Region-header{padding:9px 12px!important}:is(#R91004000000000023) .t-Region-body{padding:10px!important}:is(#R91004000000000023) .t-Report-report tbody td,:is(#R91004000000000023) .t-Report-report t'
||'head th{padding:11px 12px!important}}',
'#R91004000000000023 .t-Report-report{min-width:2500px}',
'#R91004000000000023 th#AUDIT_EVENT_ID,#R91004000000000023 td[headers="AUDIT_EVENT_ID"]{min-width:90px;white-space:nowrap}',
'#R91004000000000023 th#EVENT_TIMESTAMP,#R91004000000000023 td[headers="EVENT_TIMESTAMP"]{min-width:180px;font-variant-numeric:tabular-nums}',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a{display:inline-flex;align-items:center;padding:4px 8px;border-radius:6px;background:#eff5ff}',
'',
'/* Phase43: keep the full table grid without alternating row shading. */',
':is(#R91004000000000023) .t-Report-report thead th,:is(#R91004000000000023) .t-Report-report tbody td{border-right:1px solid #dce5f1!important;border-bottom:1px solid #dce5f1!important}',
':is(#R91004000000000023) .t-Report-report thead th:last-child,:is(#R91004000000000023) .t-Report-report tbody td:last-child{border-right:0!important}',
':is(#R91004000000000023) .t-Report-tableWrap{border:1px solid #dce5f1!important}',
'',
'/* Phase44: explicit View details event control. */',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a.audit-event-link{display:inline-flex!important;flex-direction:column;align-items:center;justify-content:center;gap:4px;min-width:90px;padding:8px 10px!important;border:1px solid #a9c5f5!important;bor'
||'der-radius:8px!important;background:#eaf2ff!important;color:#1d53b5!important;box-shadow:0 1px 2px #123a7010;cursor:pointer;text-decoration:none!important;white-space:nowrap}',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a.audit-event-link .audit-event-link-id{font-size:14px;line-height:1.25;font-weight:750}',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a.audit-event-link .audit-event-link-hint{display:inline-flex;align-items:center;gap:5px;font-size:10px;line-height:1.25;font-weight:600}',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a.audit-event-link .audit-event-link-icon{display:inline-block;width:13px;height:13px;background:center/13px 13px no-repeat url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 '
||'0 24 24'' fill=''none'' stroke=''%231d53b5'' stroke-width=''1.8'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cpath d=''M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12z''/%3E%3Ccircle cx=''12'' cy=''12'' r=''3''/%3E%3C/svg%3E")}',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a.audit-event-link:hover{background:#dceaff!important;border-color:#5f8fdd!important;box-shadow:0 2px 5px #123a7020;text-decoration:none!important}',
'#R91004000000000023 td[headers="AUDIT_EVENT_ID"] a.audit-event-link:focus-visible{outline:2px solid #545bd6!important;outline-offset:3px!important;box-shadow:0 0 0 3px #edf0ff}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(91004000000000023)
,p_name=>'Audit Events'
,p_static_id=>'audit-events'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select audit_event_id,event_timestamp,user_name,employee_code,nvl(resolved_module_code,''UNMAPPED'') module_code,page_name,form_name,action_type,event_type,transaction_reference,table_name,record_key,company_code,location_code,outcome,ip_address,apex_s'
||'ession_id,source_type,rawtohex(request_id) request_id,transaction_id,module_name',
'from IMART_AUDIT_EVENT_V',
'where event_timestamp>=from_tz(cast(to_date(apex_util.get_session_state(''P1090_DATE_FROM'') default null on conversion error,''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'') as timestamp),''Asia/Kolkata'')',
'and event_timestamp<from_tz(cast(to_date(apex_util.get_session_state(''P1090_DATE_TO'') default null on conversion error,''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'') as timestamp),''Asia/Kolkata'')+interval ''1'' day',
'and (:P1090_USER is null or user_name=:P1090_USER)',
'and (:P1090_EMPLOYEE is null or employee_code=:P1090_EMPLOYEE)',
'and (:P1090_MODULE is null or nvl(resolved_module_code,''UNMAPPED'')=:P1090_MODULE)',
'and (:P1090_FORM is null or form_name=:P1090_FORM)',
'and (:P1090_TABLE is null or table_name=:P1090_TABLE)',
'and (:P1090_TRANSACTION is null or instr(upper(transaction_reference),upper(trim(:P1090_TRANSACTION)))>0)',
'and (:P1090_ACTION is null or action_type=:P1090_ACTION)',
'and (:P1090_EVENT_TYPE is null or event_type=:P1090_EVENT_TYPE)',
'and (:P1090_COMPANY is null or company_code=:P1090_COMPANY)',
'and (:P1090_LOCATION is null or location_code=:P1090_LOCATION)',
'and (:P1090_OUTCOME is null or outcome=:P1090_OUTCOME)',
'and (:P1090_PAGE is null or to_char(page_id)=:P1090_PAGE)',
'and (:P1090_RECORD is null or instr(old_primary_key,trim(:P1090_RECORD))>0 or instr(new_primary_key,trim(:P1090_RECORD))>0)',
'and (:P1090_REQUEST_ID is null or rawtohex(request_id)=upper(trim(:P1090_REQUEST_ID)))',
'order by event_timestamp desc,audit_event_id desc'))
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1090_DATE_FROM,P1090_DATE_TO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No audit events match these filters. Adjust the filters or use Reset.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000031)
,p_query_column_id=>8
,p_column_alias=>'ACTION_TYPE'
,p_column_display_sequence=>80
,p_column_heading=>'action type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000040)
,p_query_column_id=>17
,p_column_alias=>'APEX_SESSION_ID'
,p_column_display_sequence=>170
,p_column_heading=>'apex session id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000024)
,p_query_column_id=>1
,p_column_alias=>'AUDIT_EVENT_ID'
,p_column_display_sequence=>10
,p_column_heading=>'audit event id'
,p_column_link=>'f?p=&APP_ID.:1091:&APP_SESSION.::&DEBUG.:1091:P1091_EVENT_ID:#AUDIT_EVENT_ID#'
,p_column_linktext=>'<span class="audit-event-link-id">#AUDIT_EVENT_ID#</span><span class="audit-event-link-hint"><span class="audit-event-link-icon" aria-hidden="true"></span>View details</span>'
,p_column_link_attr=>'class="audit-event-link" title="View audit event #AUDIT_EVENT_ID#"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'3'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000036)
,p_query_column_id=>13
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>130
,p_column_heading=>'company code'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000027)
,p_query_column_id=>4
,p_column_alias=>'EMPLOYEE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'employee code'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000025)
,p_query_column_id=>2
,p_column_alias=>'EVENT_TIMESTAMP'
,p_column_display_sequence=>20
,p_column_heading=>'event timestamp'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000032)
,p_query_column_id=>9
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>90
,p_column_heading=>'event type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000030)
,p_query_column_id=>7
,p_column_alias=>'FORM_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'form name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000039)
,p_query_column_id=>16
,p_column_alias=>'IP_ADDRESS'
,p_column_display_sequence=>160
,p_column_heading=>'ip address'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000037)
,p_query_column_id=>14
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>140
,p_column_heading=>'location code'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000028)
,p_query_column_id=>5
,p_column_alias=>'MODULE_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'module code'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91005000000003801)
,p_query_column_id=>21
,p_column_alias=>'MODULE_NAME'
,p_column_display_sequence=>51
,p_column_heading=>'Module Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000038)
,p_query_column_id=>15
,p_column_alias=>'OUTCOME'
,p_column_display_sequence=>150
,p_column_heading=>'outcome'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000029)
,p_query_column_id=>6
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'page name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000035)
,p_query_column_id=>12
,p_column_alias=>'RECORD_KEY'
,p_column_display_sequence=>120
,p_column_heading=>'record key'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000042)
,p_query_column_id=>19
,p_column_alias=>'REQUEST_ID'
,p_column_display_sequence=>190
,p_column_heading=>'request id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000041)
,p_query_column_id=>18
,p_column_alias=>'SOURCE_TYPE'
,p_column_display_sequence=>180
,p_column_heading=>'source type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000034)
,p_query_column_id=>11
,p_column_alias=>'TABLE_NAME'
,p_column_display_sequence=>110
,p_column_heading=>'table name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000043)
,p_query_column_id=>20
,p_column_alias=>'TRANSACTION_ID'
,p_column_display_sequence=>200
,p_column_heading=>'transaction id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000033)
,p_query_column_id=>10
,p_column_alias=>'TRANSACTION_REFERENCE'
,p_column_display_sequence=>100
,p_column_heading=>'transaction reference'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000026)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'user name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91004000000000005)
,p_plug_name=>'Audit Filters'
,p_static_id=>'audit-filters'
,p_region_css_classes=>'audit-filter-panel'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Form--labelsAbove:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>'<!-- Audit inquiry filters -->'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91005000000003901)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_button_name=>'RESET_FILTERS'
,p_static_id=>'reset-filters'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Reset'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:1090:&APP_SESSION.::&DEBUG.:RP,1090'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91004000000000022)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_button_name=>'SEARCH'
,p_static_id=>'search'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--hot'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Filters'
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(91005000000004501)
,p_branch_name=>'Audit filters reset report pagination'
,p_branch_action=>'f?p=&APP_ID.:1090:&APP_SESSION.::&DEBUG.:RP'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(91004000000000022)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000016)
,p_name=>'P1090_ACTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Action'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct action_type d,action_type r from IMART_AUDIT_EVENT_V where action_type is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Actions'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000018)
,p_name=>'P1090_COMPANY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select a.company_code||'' - ''||nvl((select max(companyname) from company m where m.companycode=a.company_code),a.company_code) d,a.company_code r from(select distinct company_code from IMART_AUDIT_EVENT_V where company_code is not null)a order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Companies'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000006)
,p_name=>'P1090_DATE_FROM'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_item_default=>'to_char(cast(systimestamp at time zone ''Asia/Kolkata'' as date)-7,''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
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
 p_id=>wwv_flow_imp.id(91004000000000007)
,p_name=>'P1090_DATE_TO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_item_default=>'to_char(cast(systimestamp at time zone ''Asia/Kolkata'' as date),''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_imp.id(91004000000000009)
,p_name=>'P1090_EMPLOYEE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Employee'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select a.employee_code||'' - ''||nvl((select max(employeename) from employee m where m.employeecode=a.employee_code),a.employee_code) d,a.employee_code r from(select distinct employee_code from IMART_AUDIT_EVENT_V where employee_code is not null)a orde'
||'r by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Employees'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000017)
,p_name=>'P1090_EVENT_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Event Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct event_type d,event_type r from IMART_AUDIT_EVENT_V where event_type is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Event Types'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000012)
,p_name=>'P1090_FORM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Form'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct form_name d,form_name r from IMART_AUDIT_EVENT_V where form_name is not null and (:P1090_MODULE is null or nvl(resolved_module_code,''UNMAPPED'')=:P1090_MODULE) order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Forms'
,p_lov_cascade_parent_items=>'P1090_MODULE'
,p_ajax_items_to_submit=>'P1090_MODULE'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000019)
,p_name=>'P1090_LOCATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select a.location_code||'' - ''||nvl((select max(locationname) from location m where m.locationcode=a.location_code),a.location_code) d,a.location_code r from(select distinct location_code from IMART_AUDIT_EVENT_V where location_code is not null and (:'
||'P1090_COMPANY is null or company_code=:P1090_COMPANY))a order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Locations'
,p_lov_cascade_parent_items=>'P1090_COMPANY'
,p_ajax_items_to_submit=>'P1090_COMPANY'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000010)
,p_name=>'P1090_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select max(module_name)||'' (''||nvl(resolved_module_code,''UNMAPPED'')||'')'' d,nvl(resolved_module_code,''UNMAPPED'') r from IMART_AUDIT_EVENT_V group by resolved_module_code order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Modules'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000020)
,p_name=>'P1090_OUTCOME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Outcome'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct outcome d,outcome r from IMART_AUDIT_EVENT_V where outcome is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Outcomes'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000011)
,p_name=>'P1090_PAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Page / Screen'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select to_char(page_id)||'' - ''||max(page_name) d,to_char(page_id) r from IMART_AUDIT_EVENT_V where page_id is not null and (:P1090_MODULE is null or nvl(resolved_module_code,''UNMAPPED'')=:P1090_MODULE) group by page_id order by page_id'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Pages'
,p_lov_cascade_parent_items=>'P1090_MODULE'
,p_ajax_items_to_submit=>'P1090_MODULE'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000015)
,p_name=>'P1090_RECORD'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Record key contains'
,p_placeholder=>'Optional search text'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'text_case', 'AS_IS',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000021)
,p_name=>'P1090_REQUEST_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Request ID'
,p_placeholder=>'32-character request ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'text_case', 'AS_IS',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000013)
,p_name=>'P1090_TABLE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Table'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct table_name d,table_name r from IMART_AUDIT_EVENT_V where table_name is not null and (:P1090_MODULE is null or nvl(resolved_module_code,''UNMAPPED'')=:P1090_MODULE) order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Tables'
,p_lov_cascade_parent_items=>'P1090_MODULE'
,p_ajax_items_to_submit=>'P1090_MODULE'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000014)
,p_name=>'P1090_TRANSACTION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'Transaction contains'
,p_placeholder=>'Optional search text'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'text_case', 'AS_IS',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000008)
,p_name=>'P1090_USER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(91004000000000005)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct user_name d,user_name r from IMART_AUDIT_EVENT_V where user_name is not null order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Users'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(91004000000001000)
,p_validation_name=>'Audit inquiry date range'
,p_static_id=>'audit-inquiry-date-range'
,p_validation_sequence=>10
,p_validation=>'declare f date;t date;begin f:=to_date(:P1090_DATE_FROM default null on conversion error,''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'');t:=to_date(:P1090_DATE_TO default null on conversion error,''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'');if f is null or '
||'t is null then return ''Select both dates using the calendar.'';end if;if f>t then return ''From Date must be on or before To Date.'';end if;return null;end;'
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(91004000000001001)
,p_process_sequence=>9999
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Audit inquiry search observation'
,p_static_id=>'audit-inquiry-search-observation'
,p_process_sql_clob=>'IMART_AUDIT.log_search;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>91004000000001001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(91005000000003902)
,p_process_sequence=>5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Normalize previous audit filter values'
,p_static_id=>'normalize-previous-audit-filter-values'
,p_process_sql_clob=>'declare n number;v varchar2(128);begin if regexp_like(:P1090_DATE_FROM,''^[0-9]{4}-[0-9]{2}-[0-9]{2}$'') then :P1090_DATE_FROM:=to_char(to_date(:P1090_DATE_FROM default null on conversion error,''YYYY-MM-DD''),''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'');e'
||'nd if;if regexp_like(:P1090_DATE_TO,''^[0-9]{4}-[0-9]{2}-[0-9]{2}$'') then :P1090_DATE_TO:=to_char(to_date(:P1090_DATE_TO default null on conversion error,''YYYY-MM-DD''),''DD-MON-YYYY'',''NLS_DATE_LANGUAGE=English'');end if;if :P1090_MODULE is not null then'
||' select count(distinct nvl(resolved_module_code,''UNMAPPED'')),max(nvl(resolved_module_code,''UNMAPPED'')) into n,v from IMART_AUDIT_EVENT_V where upper(module_name)=upper(trim(:P1090_MODULE));if n=1 then :P1090_MODULE:=v;end if;end if;end;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>91005000000003902
);
end;
/
prompt --application/pages/delete_01091
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1091);
end;
/
prompt --application/pages/page_01091
begin
wwv_flow_imp_page.create_page(
 p_id=>1091
,p_name=>'Audit Event Detail'
,p_alias=>'AUDIT-EVENT-DETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Audit Event Detail'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'/* Phase42: clean white audit reports and accessible section cards. */',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087){border:1px solid #dce4ef!important;border-radius:14px!important;box-shadow:0 3px 14px #12253e08!important;background:#fff!important;overflow:hidden;margin-bottom:20px}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-header{background:#f8faff!important;border-bottom:1px solid #e7edf5!important;padding:10px 16px!important;min-height:54px}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-title{font-size:16px!important;font-weight:650!important;color:#183153!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-body{background:#fff!important;padding:12px 14px!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-tableWrap{overflow-x:auto!important;border:1px solid #e5ebf3;border-radius:9px;scrollbar-width:thin;scrollbar-color:#bcc9dd #f4f7fb}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report{border-collapse:separate!important;border-spacing:0!important;width:100%;font-size:13px!important;color:#33445e}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report thead th{background:#f3f6fc!important;color:#294365!important;font-weight:650!important;font-size:12px!important;text-align:left!important;text-transform:capitalize;pad'
||'ding:13px 14px!important;border:0!important;border-bottom:1px solid #dce5f1!important;line-height:1.5;vertical-align:middle}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody tr,:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody tr:nth-child(odd),:is(#R91004000000002001,#R91004000000002004,#R9100400'
||'0000000087) .t-Report-report tbody tr:nth-child(even),:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody td{background:#fff!important;background-image:none!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody td{padding:13px 14px!important;border:0!important;border-bottom:1px solid #e8edf4!important;text-align:left!important;vertical-align:top!important;line-height:1.5'
||'5;color:#33445e;overflow-wrap:anywhere}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody tr:last-child td{border-bottom:0!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody tr:hover td{background:#fff!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report a{color:#225ed4!important;font-weight:600;text-decoration:none}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report a:hover{text-decoration:underline}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report a:focus-visible{outline:2px solid #545bd6;outline-offset:3px;border-radius:3px}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-pagination{color:#63738b!important;font-size:12px;margin-top:10px}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-pagination a{display:inline-block;padding:6px 10px;border-radius:6px;color:#225ed4!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .nodatafound{display:block;padding:16px 12px;color:#63738b;font-size:13px;line-height:1.6;background:#fff}',
'@media(max-width:640px){:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-header{padding:9px 12px!important}:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-body{padding:10px!important}:is(#R91004000'
||'000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody td,:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report thead th{padding:11px 12px!important}}',
'body.t-Dialog-page{background:#f5f8fc!important}',
'#R91004000000000044{display:none}',
'#R91004000000002001 .t-Report-report{table-layout:fixed}',
'#R91004000000002001 th#ATTRIBUTE,#R91004000000002001 td[headers="ATTRIBUTE"]{width:32%;font-weight:600;text-transform:capitalize;color:#304a70!important}',
'#R91004000000002001 td[headers="VALUE"]{font-weight:400;color:#33445e!important;overflow-wrap:anywhere;white-space:pre-wrap}',
'#R91004000000002004 .t-Report-report{min-width:1100px}',
'#R91004000000000087 .t-Report-report{min-width:1050px}',
'@media(max-width:640px){#R91004000000002001 th#ATTRIBUTE,#R91004000000002001 td[headers="ATTRIBUTE"]{width:38%}}',
'',
'/* Phase42b: keep all detail sections within easy reach. */',
'#R91004000000002001 .t-Region-body{max-height:360px!important;overflow-y:auto!important;scrollbar-width:thin;scrollbar-color:#bcc9dd #f4f7fb}',
'#R91004000000002001 thead th{position:sticky;top:0;z-index:1}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-title::before{content:""!important;display:inline-block!important;vertical-align:middle;width:30px;height:30px;margin-inline-end:10px;border-radius:8px;background:#eef3ff cent'
||'er/18px 18px no-repeat url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 0 24 24'' fill=''none'' stroke=''%23225ed4'' stroke-width=''1.7'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cpath d=''M6 3h8l4 4v14H6zM14 3v5h4M9 12h'
||'6M9 16h6''/%3E%3C/svg%3E")!important}',
'#R91004000000000087 .t-Region-title::before{background-image:url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 0 24 24'' fill=''none'' stroke=''%23225ed4'' stroke-width=''1.7'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cc'
||'ircle cx=''12'' cy=''12'' r=''9''/%3E%3Cpath d=''M12 7v5l3 2''/%3E%3C/svg%3E")!important}',
'',
'/* Phase43: keep the full table grid without alternating row shading. */',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report thead th,:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody td{border-right:1px solid #dce5f1!important;border-bottom:1px solid #dc'
||'e5f1!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report thead th:last-child,:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-report tbody td:last-child{border-right:0!important}',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Report-tableWrap{border:1px solid #dce5f1!important}',
'',
'/* Single detail-page scroll, with a consistently tinted Attribute column. */',
':is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-bodyWrap,:is(#R91004000000002001,#R91004000000002004,#R91004000000000087) .t-Region-body{max-height:none!important;height:auto!important;overflow:visible!important;overscroll-'
||'behavior:auto!important}',
'#R91004000000002001 .t-Report-report thead th{position:static!important}',
'#R91004000000002001 .t-Report-report th#ATTRIBUTE{background:#e9effa!important}',
'#R91004000000002001 .t-Report-report th#VALUE{background:#f8fafc!important}',
'#R91004000000002001 .t-Report-report tbody td[headers="ATTRIBUTE"]{background:#f0f4fc!important;background-image:none!important;color:#304a70!important}',
'#R91004000000002001 .t-Report-report tbody td[headers="VALUE"]{background:#fff!important;background-image:none!important;color:#33445e!important}',
'',
'/* Phase44: explicit View details event control. */',
'#R91004000000000087 td[headers="AUDIT_EVENT_ID"] a.audit-event-link{display:inline-flex!important;flex-direction:column;align-items:center;justify-content:center;gap:4px;min-width:90px;padding:8px 10px!important;border:1px solid #a9c5f5!important;bor'
||'der-radius:8px!important;background:#eaf2ff!important;color:#1d53b5!important;box-shadow:0 1px 2px #123a7010;cursor:pointer;text-decoration:none!important;white-space:nowrap}',
'#R91004000000000087 td[headers="AUDIT_EVENT_ID"] a.audit-event-link .audit-event-link-id{font-size:14px;line-height:1.25;font-weight:750}',
'#R91004000000000087 td[headers="AUDIT_EVENT_ID"] a.audit-event-link .audit-event-link-hint{display:inline-flex;align-items:center;gap:5px;font-size:10px;line-height:1.25;font-weight:600}',
'#R91004000000000087 td[headers="AUDIT_EVENT_ID"] a.audit-event-link .audit-event-link-icon{display:inline-block;width:13px;height:13px;background:center/13px 13px no-repeat url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 '
||'0 24 24'' fill=''none'' stroke=''%231d53b5'' stroke-width=''1.8'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cpath d=''M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12z''/%3E%3Ccircle cx=''12'' cy=''12'' r=''3''/%3E%3C/svg%3E")}',
'#R91004000000000087 td[headers="AUDIT_EVENT_ID"] a.audit-event-link:hover{background:#dceaff!important;border-color:#5f8fdd!important;box-shadow:0 2px 5px #123a7020;text-decoration:none!important}',
'#R91004000000000087 td[headers="AUDIT_EVENT_ID"] a.audit-event-link:focus-visible{outline:2px solid #545bd6!important;outline-offset:3px!important;box-shadow:0 0 0 3px #edf0ff}',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91004000000000044)
,p_plug_name=>'Event'
,p_static_id=>'event'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>5
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(91004000000002001)
,p_name=>'Event Details'
,p_static_id=>'event-metadata'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'with e as(select audit_event_id,event_timestamp,user_name,bossusercode,employee_code,nvl(resolved_module_code,''UNMAPPED'') module_code,module_name,module_mapping_source,module_code recorded_module_code,page_id,page_name,page_alias,form_name,action_typ'
||'e,event_type,source_type,outcome,table_name,old_primary_key,new_primary_key,parent_table,parent_key,transaction_reference,company_code,location_code,apex_session_id,ip_address,database_user,db_host,process_name,error_code,rawtohex(request_id) request'
||'_id,transaction_id,remarks,request_name,button_name,user_agent,client_identifier,db_module,db_action,server_host,background_job_id,current_schema_name,db_session_id from IMART_AUDIT_EVENT_V where audit_event_id=to_number(:P1091_EVENT_ID default null '
||'on conversion error)) select j.attribute,j.value from e,json_table(json_array(json_object(''label'' value ''audit event id'',''content'' value e.audit_event_id null on null returning clob),json_object(''label'' value ''event timestamp'',''content'' value e.event'
||'_timestamp null on null returning clob),json_object(''label'' value ''user name'',''content'' value e.user_name null on null returning clob),json_object(''label'' value ''bossusercode'',''content'' value e.bossusercode null on null returning clob),json_object(''l'
||'abel'' value ''employee code'',''content'' value e.employee_code null on null returning clob),json_object(''label'' value ''module code'',''content'' value e.module_code null on null returning clob),json_object(''label'' value ''module name'',''content'' value e.modu'
||'le_name null on null returning clob),json_object(''label'' value ''module source'',''content'' value e.module_mapping_source null on null returning clob),json_object(''label'' value ''recorded module code'',''content'' value e.recorded_module_code null on null r'
||'eturning clob),json_object(''label'' value ''page id'',''content'' value e.page_id null on null returning clob),json_object(''label'' value ''page name'',''content'' value e.page_name null on null returning clob),json_object(''label'' value ''page alias'',''content'' '
||'value e.page_alias null on null returning clob),json_object(''label'' value ''form name'',''content'' value e.form_name null on null returning clob),json_object(''label'' value ''action type'',''content'' value e.action_type null on null returning clob),json_obj'
||'ect(''label'' value ''event type'',''content'' value e.event_type null on null returning clob),json_object(''label'' value ''source type'',''content'' value e.source_type null on null returning clob),json_object(''label'' value ''outcome'',''content'' value e.outcome '
||'null on null returning clob),json_object(''label'' value ''table name'',''content'' value e.table_name null on null returning clob),json_object(''label'' value ''old primary key'',''content'' value e.old_primary_key null on null returning clob),json_object(''labe'
||'l'' value ''new primary key'',''content'' value e.new_primary_key null on null returning clob),json_object(''label'' value ''parent table'',''content'' value e.parent_table null on null returning clob),json_object(''label'' value ''parent key'',''content'' value e.pa'
||'rent_key null on null returning clob),json_object(''label'' value ''transaction reference'',''content'' value e.transaction_reference null on null returning clob),json_object(''label'' value ''company code'',''content'' value e.company_code null on null returnin'
||'g clob),json_object(''label'' value ''location code'',''content'' value e.location_code null on null returning clob),json_object(''label'' value ''apex session id'',''content'' value e.apex_session_id null on null returning clob),json_object(''label'' value ''ip ad'
||'dress'',''content'' value e.ip_address null on null returning clob),json_object(''label'' value ''database user'',''content'' value e.database_user null on null returning clob),json_object(''label'' value ''db host'',''content'' value e.db_host null on null returni'
||'ng clob),json_object(''label'' value ''process name'',''content'' value e.process_name null on null returning clob),json_object(''label'' value ''error code'',''content'' value e.error_code null on null returning clob),json_object(''label'' value ''request id'',''con'
||'tent'' value e.request_id null on null returning clob),json_object(''label'' value ''transaction id'',''content'' value e.transaction_id null on null returning clob),json_object(''label'' value ''remarks'',''content'' value e.remarks null on null returning clob),'
||'json_object(''label'' value ''request name'',''content'' value e.request_name null on null returning clob),json_object(''label'' value ''button name'',''content'' value e.button_name null on null returning clob),json_object(''label'' value ''user agent'',''content'' v'
||'alue e.user_agent null on null returning clob),json_object(''label'' value ''client identifier'',''content'' value e.client_identifier null on null returning clob),json_object(''label'' value ''db module'',''content'' value e.db_module null on null returning clo'
||'b),json_object(''label'' value ''db action'',''content'' value e.db_action null on null returning clob),json_object(''label'' value ''server host'',''content'' value e.server_host null on null returning clob),json_object(''label'' value ''background job id'',''conten'
||'t'' value e.background_job_id null on null returning clob),json_object(''label'' value ''current schema name'',''content'' value e.current_schema_name null on null returning clob),json_object(''label'' value ''db session id'',''content'' value e.db_session_id nul'
||'l on null returning clob) returning clob),''$[*]'' columns(position for ordinality,attribute varchar2(100) path ''$.label'',value varchar2(4000) path ''$.content''))j order by j.position'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002002)
,p_query_column_id=>1
,p_column_alias=>'ATTRIBUTE'
,p_column_display_sequence=>10
,p_column_heading=>'attribute'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002003)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>20
,p_column_heading=>'value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(91004000000002004)
,p_name=>'Field Changes'
,p_static_id=>'field-changes'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'select audit_change_id,column_name,data_type,old_state,dbms_lob.substr(old_value,1000,1) old_value,new_state,dbms_lob.substr(new_value,1000,1) new_value,capture_mode,dbms_lob.getlength(old_value) old_characters,dbms_lob.getlength(new_value) new_chara'
||'cters from IMART_AUDIT_CHANGE_V where audit_event_id=to_number(:P1091_EVENT_ID default null on conversion error) order by audit_change_id'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No field changes for this event.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002005)
,p_query_column_id=>1
,p_column_alias=>'AUDIT_CHANGE_ID'
,p_column_display_sequence=>10
,p_column_heading=>'audit change id'
,p_column_link=>'f?p=&APP_ID.:1093:&APP_SESSION.::&DEBUG.:1093:P1093_CHANGE_ID:#AUDIT_CHANGE_ID#'
,p_column_linktext=>'Full value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'3'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002012)
,p_query_column_id=>8
,p_column_alias=>'CAPTURE_MODE'
,p_column_display_sequence=>80
,p_column_heading=>'capture mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002006)
,p_query_column_id=>2
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'column name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002007)
,p_query_column_id=>3
,p_column_alias=>'DATA_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'data type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002014)
,p_query_column_id=>10
,p_column_alias=>'NEW_CHARACTERS'
,p_column_display_sequence=>100
,p_column_heading=>'new characters'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002010)
,p_query_column_id=>6
,p_column_alias=>'NEW_STATE'
,p_column_display_sequence=>60
,p_column_heading=>'new state'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002011)
,p_query_column_id=>7
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>70
,p_column_heading=>'new value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002013)
,p_query_column_id=>9
,p_column_alias=>'OLD_CHARACTERS'
,p_column_display_sequence=>90
,p_column_heading=>'old characters'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002008)
,p_query_column_id=>4
,p_column_alias=>'OLD_STATE'
,p_column_display_sequence=>40
,p_column_heading=>'old state'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002009)
,p_query_column_id=>5
,p_column_alias=>'OLD_VALUE'
,p_column_display_sequence=>50
,p_column_heading=>'old value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(91004000000000087)
,p_name=>'Related Transaction Timeline'
,p_static_id=>'related-transaction-timeline'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'select audit_event_id,event_timestamp,user_name,nvl(resolved_module_code,''UNMAPPED'') module_code,action_type,table_name,record_key,transaction_reference,outcome,module_name from IMART_AUDIT_EVENT_V e where exists(select 1 from IMART_AUDIT_EVENT_V cho'
||'sen where chosen.audit_event_id=to_number(:P1091_EVENT_ID default null on conversion error) and ((chosen.request_id is not null and e.request_id=chosen.request_id) or (chosen.transaction_id is not null and e.transaction_id=chosen.transaction_id) or ('
||'chosen.table_name=e.table_name and (chosen.record_key=e.record_key or chosen.old_primary_key=e.new_primary_key)) or (chosen.parent_table=e.table_name and chosen.parent_key=e.record_key) or (e.parent_table=chosen.table_name and e.parent_key=chosen.rec'
||'ord_key))) order by event_timestamp,audit_event_id'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No related events found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000092)
,p_query_column_id=>5
,p_column_alias=>'ACTION_TYPE'
,p_column_display_sequence=>50
,p_column_heading=>'action type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000088)
,p_query_column_id=>1
,p_column_alias=>'AUDIT_EVENT_ID'
,p_column_display_sequence=>10
,p_column_heading=>'audit event id'
,p_column_link=>'f?p=&APP_ID.:1091:&APP_SESSION.::&DEBUG.:1091:P1091_EVENT_ID:#AUDIT_EVENT_ID#'
,p_column_linktext=>'<span class="audit-event-link-id">#AUDIT_EVENT_ID#</span><span class="audit-event-link-hint"><span class="audit-event-link-icon" aria-hidden="true"></span>View details</span>'
,p_column_link_attr=>'class="audit-event-link" title="View audit event #AUDIT_EVENT_ID#"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'3'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000089)
,p_query_column_id=>2
,p_column_alias=>'EVENT_TIMESTAMP'
,p_column_display_sequence=>20
,p_column_heading=>'event timestamp'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000091)
,p_query_column_id=>4
,p_column_alias=>'MODULE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'module code'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91005000000003802)
,p_query_column_id=>10
,p_column_alias=>'MODULE_NAME'
,p_column_display_sequence=>51
,p_column_heading=>'Module Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000096)
,p_query_column_id=>9
,p_column_alias=>'OUTCOME'
,p_column_display_sequence=>90
,p_column_heading=>'outcome'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000094)
,p_query_column_id=>7
,p_column_alias=>'RECORD_KEY'
,p_column_display_sequence=>70
,p_column_heading=>'record key'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000093)
,p_query_column_id=>6
,p_column_alias=>'TABLE_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'table name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000095)
,p_query_column_id=>8
,p_column_alias=>'TRANSACTION_REFERENCE'
,p_column_display_sequence=>80
,p_column_heading=>'transaction reference'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000000090)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'user name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000000045)
,p_name=>'P1091_EVENT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(91004000000000044)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
end;
/
prompt --application/pages/delete_01093
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1093);
end;
/
prompt --application/pages/page_01093
begin
wwv_flow_imp_page.create_page(
 p_id=>1093
,p_name=>'Audit Field Values'
,p_alias=>'AUDIT-FIELD-VALUES'
,p_page_mode=>'MODAL'
,p_step_title=>'Audit Field Values'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(91004000000002026)
,p_name=>'Complete Stored Values'
,p_static_id=>'complete-stored-values'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'with c as(select old_value,new_value from IMART_AUDIT_CHANGE_V where audit_change_id=to_number(:P1093_CHANGE_ID default null on conversion error)),parts as(select level piece from dual connect by level<=(select greatest(1,ceil(nvl(dbms_lob.getlength('
||'old_value),0)/2000),ceil(nvl(dbms_lob.getlength(new_value),0)/2000)) from c)) select p.piece section_number,(p.piece-1)*2000+1 character_start,dbms_lob.substr(c.old_value,2000,(p.piece-1)*2000+1) old_value,dbms_lob.substr(c.new_value,2000,(p.piece-1)'
||'*2000+1) new_value from c,parts p where p.piece<=greatest(1,ceil(nvl(dbms_lob.getlength(c.old_value),0)/2000),ceil(nvl(dbms_lob.getlength(c.new_value),0)/2000)) order by p.piece'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002028)
,p_query_column_id=>2
,p_column_alias=>'CHARACTER_START'
,p_column_display_sequence=>20
,p_column_heading=>'character start'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002030)
,p_query_column_id=>4
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'new value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002029)
,p_query_column_id=>3
,p_column_alias=>'OLD_VALUE'
,p_column_display_sequence=>30
,p_column_heading=>'old value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002027)
,p_query_column_id=>1
,p_column_alias=>'SECTION_NUMBER'
,p_column_display_sequence=>10
,p_column_heading=>'section number'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(91004000000002017)
,p_name=>'Field Identity'
,p_static_id=>'field-identity'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'select audit_event_id,column_name,data_type,capture_mode,old_state,new_state,dbms_lob.getlength(old_value) old_characters,dbms_lob.getlength(new_value) new_characters from IMART_AUDIT_CHANGE_V where audit_change_id=to_number(:P1093_CHANGE_ID default '
||'null on conversion error)'
,p_required_role=>wwv_flow_imp.id(91004000000000002)
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002018)
,p_query_column_id=>1
,p_column_alias=>'AUDIT_EVENT_ID'
,p_column_display_sequence=>10
,p_column_heading=>'audit event id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002021)
,p_query_column_id=>4
,p_column_alias=>'CAPTURE_MODE'
,p_column_display_sequence=>40
,p_column_heading=>'capture mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002019)
,p_query_column_id=>2
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'column name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002020)
,p_query_column_id=>3
,p_column_alias=>'DATA_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'data type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002025)
,p_query_column_id=>8
,p_column_alias=>'NEW_CHARACTERS'
,p_column_display_sequence=>80
,p_column_heading=>'new characters'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002023)
,p_query_column_id=>6
,p_column_alias=>'NEW_STATE'
,p_column_display_sequence=>60
,p_column_heading=>'new state'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002024)
,p_query_column_id=>7
,p_column_alias=>'OLD_CHARACTERS'
,p_column_display_sequence=>70
,p_column_heading=>'old characters'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(91004000000002022)
,p_query_column_id=>5
,p_column_alias=>'OLD_STATE'
,p_column_display_sequence=>50
,p_column_heading=>'old state'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91004000000002015)
,p_plug_name=>'Stored Field Values'
,p_static_id=>'stored-field-values'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>5
,p_plug_source=>'<p>Stored before and after values are shown in consecutive 2,000-character sections. Masked values and attachment metadata retain their configured privacy policy.</p>'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91004000000002016)
,p_name=>'P1093_CHANGE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(91004000000002015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
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
