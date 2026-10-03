$ErrorActionPreference = 'Stop'
$client = (Get-Content -Raw "$PSScriptRoot/register_kpis.js").Replace("'", "''")
$sql = @'
whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
connect -name IMART
declare
 client_js varchar2(32767):='__CLIENT__';
 source_sql clob;
begin
 for r in (select * from imart_mr_register) loop
  if r.status_expression is not null then
   source_sql:='select mr_source.* from ('||regexp_replace(r.query_sql,';[[:space:]]*$','')||chr(10)||') mr_source where (select imart_register_kpis.selected_mode('||r.page_id||') from dual)=''ALL'' or nvl(trim(cast('||r.status_expression||' as varchar2(4000))),chr(1))=nvl((select imart_register_kpis.selected_status('||r.page_id||') from dual),chr(1))';
   update apex_260100.wwv_flow_page_plugs set plug_source=source_sql where flow_id=105 and id=r.region_id;
  end if;
  select plug_source into source_sql from imart_mr_status_backup where static_id='mr-kpi-shell-'||r.page_id;
  source_sql:=regexp_replace(source_sql,'<script>.*</script>','<script>'||client_js||'</script>',1,0,'n');
  source_sql:=replace(source_sql,'</style>','.mr-register-kpis .mr-inline-kpi{font-family:inherit;text-align:left;cursor:pointer;width:100%}.mr-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:#6155d9;background:#f0efff}.mr-register-kpis .mr-inline-kpi:focus-visible{outline:2px solid #6155d9;outline-offset:2px}</style>');
  update apex_260100.wwv_flow_page_plugs set plug_source=source_sql where flow_id=105 and static_id='mr-kpi-shell-'||r.page_id;
 end loop;
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100100960001),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_KPI_STATUS_FILTER',p_static_id=>'imart-kpi-status-filter',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_register_kpis.apply_status(to_number(apex_application.g_x01),apex_application.g_x02,apex_application.g_x03);end;');
 wwv_flow_imp.component_end;
end;
/
commit;
exit
'@
$sql.Replace('__CLIENT__',$client) | Set-Content -Encoding utf8 "$PSScriptRoot/update_status_kpis.sql"
