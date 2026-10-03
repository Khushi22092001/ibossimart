$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$client = Get-Content -Raw "$root/report_kpis_20261003.js"
# Reuse only component-scoped compact styles; omit old toolbar/global selectors.
$styles = (Get-Content "$root/transaction_kpis.css" | Where-Object { $_ -notmatch '^button\[' }) -join "`n"
$styles = $styles.Replace('.tx-register-kpis', '.coverage-register-kpis')
$styles = $styles.Replace('.coverage-register-kpis .mr-kpi-grid{min-height:87px}', '.coverage-register-kpis .mr-kpi-grid{min-height:0}')
$styles += "`n.coverage-register-kpis .mr-kpi-grid{grid-template-columns:repeat(auto-fit,minmax(180px,280px));min-height:0}.coverage-register-kpis .mr-kpi-card-details{min-width:0}.coverage-register-kpis .mr-kpi-share{overflow-wrap:anywhere}"
$sql = @'
whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
declare js clob:=q'~__CLIENT__~';css clob:=q'~__CSS__~';src clob;rid number;seq number:=0;n number:=0;found number;shell number;
begin
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 select count(*) into found from apex_260100.wwv_flow_processing where flow_id=105 and process_name='IMART_REPORT_KPIS';
 if found=0 then wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100300900001),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_REPORT_KPIS',p_static_id=>'imart-report-kpis',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_report_kpis.payload(to_number(apex_application.g_x01));end;');end if;
 select count(*) into found from apex_260100.wwv_flow_processing where flow_id=105 and process_name='IMART_REPORT_KPI_FILTER';
 if found=0 then wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100300900002),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_REPORT_KPI_FILTER',p_static_id=>'imart-report-kpi-filter',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_report_kpis.apply_filter(to_number(apex_application.g_x01),apex_application.g_x02,apex_application.g_x03);end;');end if;
 for r in(select c.*,p.plug_display_sequence,p.plug_display_point,p.plug_required_role,p.plug_display_condition_type,p.plug_display_when_condition,p.plug_display_when_cond2,p.function_body_language from imart_rkpi_config c join apex_260100.wwv_flow_page_plugs p on p.id=c.region_id and p.flow_id=105 where c.state='READY' order by c.page_id,c.region_id)loop
  seq:=seq+1;rid:=2026100300020000+seq;
  src:='begin htp.p(q''^<style>'||css||'</style><section id="coverage-kpis-'||r.region_id||'" class="coverage-register-kpis" data-kpi-region="'||r.region_id||'" data-report-region="'||apex_escape.html_attribute(r.region_static_id)||'" data-report-label="'||apex_escape.html_attribute(r.region_label)||'" aria-label="'||apex_escape.html_attribute(r.region_label)||' KPIs"><div class="mr-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary>How counts work</summary><p data-kpi-scope></p></details></section><script>'||js||'</script>^'');end;';
  select min(id) into shell from apex_260100.wwv_flow_page_plugs where flow_id=105 and page_id=r.page_id and static_id='coverage-kpi-shell-'||r.region_id;
  if shell is null then wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(rid),p_flow_id=>105,p_page_id=>r.page_id,p_plug_name=>'Register KPI Overview',p_static_id=>'coverage-kpi-shell-'||r.region_id,p_plug_template=>3371237801798025892,p_region_template_options=>'#DEFAULT#:t-Region--noUI',p_plug_display_sequence=>r.plug_display_sequence-1,p_plug_display_point=>r.plug_display_point,p_plug_source_type=>'NATIVE_PLSQL',p_plug_source=>src);
  else update apex_260100.wwv_flow_page_plugs set plug_source=src where id=shell and flow_id=105;end if;
  update apex_260100.wwv_flow_page_plugs set plug_required_role=r.plug_required_role,plug_display_condition_type=r.plug_display_condition_type,plug_display_when_condition=r.plug_display_when_condition,plug_display_when_cond2=r.plug_display_when_cond2,function_body_language=r.function_body_language where flow_id=105 and page_id=r.page_id and static_id='coverage-kpi-shell-'||r.region_id;
  update apex_260100.wwv_flow_page_plugs set plug_source=imart_report_kpis.report_sql(r.region_id),query_type='SQL',query_table=null,query_where=null,query_order_by=null where flow_id=105 and id=r.region_id;
  n:=n+1;
 end loop;
 wwv_flow_imp.component_end;
 dbms_output.put_line('NEW_REPORT_KPI_REGIONS='||n);
end;
/
commit;
exit
'@
$sql = $sql.Replace('__CLIENT__', $client).Replace('__CSS__', $styles)
[System.IO.File]::WriteAllText("$root/deploy_report_kpis_20261003.sql", $sql)
Write-Output 'Built isolated report KPI deployment; existing master/procurement KPIs are untouched.'
