$ErrorActionPreference='Stop'
$root='C:/Users/shree/Documents/git projects/ibosssagar/app105-source'
$client=(Get-Content -Raw "$root/master-insights-plan/register_kpis.js").Replace('IMARTMasterKpis','IMARTTransactionKpis').Replace('mr-register-kpis','tx-register-kpis').Replace('IMART_REGISTER_KPIS','IMART_TRANSACTION_KPIS').Replace('IMART_KPI_STATUS_FILTER','IMART_TX_KPI_FILTER').Replace('NON.?ACTIVE|INACTIVE|CANCEL|REJECT','NON.?ACTIVE|INACTIVE|CANCEL|REJECT|OVERDUE').Replace("/^ACTIVE$|CLOSED|COMPLETE|APPROV|AUTHORI/","/^ACTIVE$|CLOSED|COMPLETE|FULLY ORDERED|AUTHORI/")
$css=(Get-Content -Raw "$root/master-insights-plan/register_kpis.css").Replace('.mr-register-kpis','.tx-register-kpis')
$client=$client.Replace("el.className = 'mr-inline-kpi';", "if (card.status === 'DONE') { tone = 'success'; iconName = 'fa-check-circle-o'; } else if (card.status === 'APPROVAL' || card.status === 'PENDING' || card.status === 'PARTIAL') { tone = 'warning'; iconName = 'fa-clock-o'; } el.className = 'mr-inline-kpi';")
$client=$client.Replace("return s.toUpperCase(); });", "return s.toUpperCase(); }).replace(/\bPo\b/g, 'PO').replace(/\bGrn\b/g, 'GRN');")
$client | Set-Content -Encoding utf8 "$root/transaction_kpis.js"
$css | Set-Content -Encoding utf8 "$root/transaction_kpis.css"
$sql=@'
whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
declare
 client_js varchar2(32767):='__JS__';css varchar2(32767):='__CSS__';src clob;report_src clob;c integer;
begin
 -- Parse every proposed report before modifying any live component.
 for r in(select * from imart_tx_kpi_config)loop c:=dbms_sql.open_cursor;dbms_sql.parse(c,imart_transaction_kpis.report_sql(r.page_id),dbms_sql.native);dbms_sql.close_cursor(c);end loop;
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100117320001),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_TRANSACTION_KPIS',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_transaction_kpis.payload(to_number(apex_application.g_x01));end;');
 wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100117320002),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_TX_KPI_FILTER',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_transaction_kpis.apply_filter(to_number(apex_application.g_x01),apex_application.g_x02,apex_application.g_x03);end;');
 for r in(select c.*,p.plug_display_sequence,p.plug_display_point,nvl(p.static_id,'R'||p.id) report_static from imart_tx_kpi_config c join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.id=c.region_id)loop
 report_src:=imart_transaction_kpis.report_sql(r.page_id);
 src:='begin htp.p(q''^<style>'||css||'</style><section id="tx-register-kpis-'||r.page_id||'" class="tx-register-kpis" data-report-region="'||apex_escape.html_attribute(r.report_static)||'" data-report-label="'||apex_escape.html_attribute(r.region_label)||'" aria-label="Transaction KPIs"><div class="mr-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary><span class="fa fa-info-circle" aria-hidden="true"></span> How counts work</summary><p data-kpi-scope></p></details></section><script>'||client_js||'</script>^'');end;';
 wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(2026100117330000+r.page_id),p_flow_id=>105,p_page_id=>r.page_id,p_plug_name=>'Transaction KPI Cards',p_static_id=>'tx-kpi-shell-'||r.page_id,p_plug_template=>3371237801798025892,p_region_template_options=>'#DEFAULT#:t-Region--noUI',p_plug_display_sequence=>r.plug_display_sequence-1,p_plug_display_point=>r.plug_display_point,p_plug_source_type=>'NATIVE_PLSQL',p_plug_source=>src);
 update apex_260100.wwv_flow_page_plugs set plug_source=report_src where flow_id=105 and id=r.region_id;
 end loop;
 wwv_flow_imp_shared.clear_cache;wwv_flow_imp.component_end;
end;
/
commit;
exit
'@
$sql.Replace('__JS__',$client.Replace("'","''")).Replace('__CSS__',$css.Replace("'","''")) | Set-Content -Encoding utf8 "$root/deploy_transaction_kpis.sql"
