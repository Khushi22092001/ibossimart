$ErrorActionPreference = 'Stop'
$client = (Get-Content -Raw "$PSScriptRoot/register_kpis.js").Replace("'", "''")
$css = (Get-Content -Raw "$PSScriptRoot/register_kpis.css").Replace("'", "''")
$sql = @'
whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
declare
 client_js varchar2(32767):='__CLIENT__';
 css varchar2(32767):='__CSS__';
 src clob;
begin
 for r in (select r.page_id,nvl(p.static_id,'R'||p.id) report_static,p.plug_name report_label from imart_mr_register r join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.id=r.region_id) loop
  src:='begin htp.p(q''^<style>'||css||'</style><section id="mr-register-kpis-'||r.page_id||'" class="mr-register-kpis" data-report-region="'||apex_escape.html_attribute(r.report_static)||'" data-report-label="'||apex_escape.html_attribute(r.report_label)||'" aria-label="Master KPIs"><div class="mr-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary><span class="fa fa-info-circle" aria-hidden="true"></span> How counts work</summary><p data-kpi-scope></p></details></section><script>'||client_js||'</script>^'');end;';
  update apex_260100.wwv_flow_page_plugs set plug_source=src where flow_id=105 and static_id='mr-kpi-shell-'||r.page_id;
 end loop;
 dbms_output.put_line('KPI panels styled; business sources and processes unchanged.');
end;
/
commit;
exit
'@
$sql.Replace('__CLIENT__',$client).Replace('__CSS__',$css).Replace('Select a status to explore your records','Select a card to explore your records') | Set-Content -Encoding utf8 "$PSScriptRoot/update_kpi_design.sql"
