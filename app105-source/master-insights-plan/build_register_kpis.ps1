$ErrorActionPreference = 'Stop'
$client = Get-Content -Raw "$PSScriptRoot/register_kpis.js"
$style = '.mr-register-kpis[hidden]{display:none!important}.mr-register-kpis{margin:0 0 16px;padding:18px;border:1px solid #dbe2f4;border-radius:16px;background:#fff}.mr-register-kpis header{display:flex;align-items:center;justify-content:space-between;gap:16px}.mr-register-kpis h2{font-size:18px;margin:0}.mr-register-kpis p{font-size:12px;color:#64748b;margin:8px 0 14px}.mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:12px}.mr-inline-kpi{display:flex;flex-direction:column;gap:8px;padding:16px;border:1px solid #e2e6f4;border-radius:12px;background:#f9faff}.mr-inline-kpi span{font-size:13px;color:#536280}.mr-inline-kpi strong{font-size:25px;color:#172033}.mr-inline-kpi small{font-size:11px;color:#64748b}.mr-kpi-close{border:1px solid #dbe2f4;border-radius:8px;padding:7px 12px;background:#fff;color:#514ac6;cursor:pointer}'
$clientSql = $client.Replace("'", "''")
$styleSql = $style.Replace("'", "''")
$source = @'
declare
 script_source varchar2(32767):='__JS__';
 css_source varchar2(32767):='__CSS__';
 base number; source_sql clob; registered number:=0;
begin
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100100960000),p_process_sequence=>1,
 p_process_point=>'ON_DEMAND',p_process_name=>'IMART_REGISTER_KPIS',p_static_id=>'imart-register-kpis',
 p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_register_kpis.payload(to_number(apex_application.g_x01)); end;');
 for r in (
   select c.register_page,min(p.id) keep(dense_rank first order by p.plug_display_sequence,p.id) report_id,
          min(p.plug_display_sequence) seq
   from imart_mr_catalog c join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.page_id=c.register_page
   where p.plug_source_type='NATIVE_IR' and p.query_type='SQL'
     and not exists(select 1 from apex_260100.wwv_flow_step_buttons b where b.flow_id=105 and b.flow_step_id=c.register_page and b.button_name='MASTER_KPI_CARDS')
   group by c.register_page
 ) loop
   base:=2026100200000000+r.register_page*100;
   source_sql:='begin htp.p(q''^<style>'||css_source||'</style><section id="mr-register-kpis-'||r.register_page||'" class="mr-register-kpis" hidden aria-label="Master KPIs"><header><h2 data-kpi-title>Master KPIs</h2><button type="button" class="mr-kpi-close" onclick="IMARTMasterKpis.close('||r.register_page||')" aria-label="Close KPI cards">Close</button></header><p data-kpi-scope></p><div class="mr-kpi-grid" data-kpi-content role="status"></div></section><script>'||script_source||'</script>^''); end;';
   wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(base),p_flow_id=>105,p_page_id=>r.register_page,p_plug_name=>'Master KPI Cards',
    p_static_id=>'mr-kpi-shell-'||r.register_page,p_plug_template=>3371237801798025892,
    p_region_template_options=>'#DEFAULT#:t-Region--noUI',p_plug_display_sequence=>r.seq-1,
    p_plug_source_type=>'NATIVE_PLSQL',p_plug_source=>source_sql,
    p_plug_display_condition_type=>'FUNCTION_BODY',p_plug_display_when_condition=>'begin for r in (select module_code from imart_mr_catalog where register_page=:APP_PAGE_ID) loop if imart_master_reports.allowed(r.module_code)=1 then return true; end if; end loop; return false; end;',p_plug_display_when_cond2=>'PLSQL');
   wwv_flow_imp_page.create_page_button(p_id=>wwv_flow_imp.id(base+1),p_flow_id=>105,p_flow_step_id=>r.register_page,p_button_sequence=>15,
    p_button_plug_id=>r.report_id,p_button_name=>'MASTER_KPI_CARDS',p_static_id=>'mr-kpi-button-'||r.register_page,
    p_button_action=>'DEFINED_BY_DA',p_button_template_options=>'#DEFAULT#:t-Button--iconLeft',
    p_button_template_id=>2082829544945815391,p_button_image_alt=>'KPI Cards',p_button_position=>'RIGHT_OF_IR_SEARCH_BAR',p_icon_css_classes=>'fa-chart-bar',
    p_button_condition_type=>'FUNCTION_BODY',p_button_condition=>'begin for r in (select module_code from imart_mr_catalog where register_page=:APP_PAGE_ID) loop if imart_master_reports.allowed(r.module_code)=1 then return true; end if; end loop; return false; end;',p_button_condition2=>'PLSQL',
    p_button_cattributes=>'onclick="IMARTMasterKpis.toggle('||r.register_page||');" aria-expanded="false" aria-controls="mr-register-kpis-'||r.register_page||'"');
   registered:=registered+1;
 end loop;
 wwv_flow_imp.component_end;
 dbms_output.put_line('REGISTERS_ONBOARDED='||registered);
end;
/
'@
$source = $source.Replace('__JS__', $clientSql).Replace('__CSS__', $styleSql)
[System.IO.File]::WriteAllText("$PSScriptRoot/register_kpis_components.sql", $source)
Write-Output 'Generated register KPI components.'
