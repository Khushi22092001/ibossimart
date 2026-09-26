whenever sqlerror exit failure rollback
set define off verify off feedback off serveroutput on size unlimited pagesize 300 linesize 260 trimspool on
connect -name IMART

prompt === SLC identity and hidden compatibility scope ===
select p.page_id,p.page_name,p.page_alias
  from apex_application_pages p
 where p.application_id=105 and p.page_id in (721,722,723,724,725,726)
 order by p.page_id;

select page_id,item_name,display_as,label
  from apex_application_page_items
 where application_id=105 and page_id=721 and item_name='P721_PANEL';

select object_name,status
  from user_objects
 where object_name='IMART_SLC_360'
 order by object_type;

prompt === SLC report/chart/card runtime ===
declare
  l_ctx apex_exec.t_context;
  l_open boolean;
  l_rows pls_integer;
begin
  apex_session.create_session(p_app_id=>105,p_page_id=>721,p_username=>'BOSS');
  apex_util.set_session_state('GLOBAL_COMPANYCODE','1');
  apex_util.set_session_state('GLOBAL_COMPANYNAME','IRONMART PRIVATE LIMITED');
  apex_util.set_session_state('GLOBAL_FINANCIALYEARCODE','26-27');
  apex_util.set_session_state('GLOBAL_FINANCIALYEARBEGIN','01-04-2026');
  apex_util.set_session_state('GLOBAL_FINANCIALYEAREND','31-03-2027');
  apex_util.set_session_state('GLOBAL_BOSSUSERCODE','1');
  apex_util.set_session_state('GLOBAL_BOSSUSERNAME','BOSS');
  apex_util.set_session_state('P721_FROMDATE','01-04-2026');
  apex_util.set_session_state('P721_TODATE','24-09-2026');
  apex_util.set_session_state('P721_COMPANY',null);
  apex_util.set_session_state('P721_LOCATION',null);
  apex_util.set_session_state('P721_PANEL',null);
  for r in (
    select region_id,region_name,source_type
      from apex_application_page_regions
     where application_id=105 and page_id=721
       and (upper(source_type) like '%CHART%'
         or upper(source_type) like '%REPORT%'
         or upper(source_type) like '%IR%'
         or upper(source_type) like '%CARDS%')
     order by display_sequence,region_id
  ) loop
    begin
      l_open := false;
      l_rows := 0;
      l_ctx := apex_region.open_query_context(p_page_id=>721,p_region_id=>r.region_id);
      l_open := true;
      while apex_exec.next_row(l_ctx) loop
        l_rows := l_rows + 1;
        exit when l_rows >= 250;
      end loop;
      apex_exec.close(l_ctx);
      l_open := false;
      dbms_output.put_line('OK|721|'||r.region_id||'|'||r.source_type||'|'||replace(r.region_name,'|','/')||'|rows='||l_rows);
    exception when others then
      if l_open then apex_exec.close(l_ctx); end if;
      dbms_output.put_line('ERR|721|'||r.region_id||'|'||r.source_type||'|'||replace(r.region_name,'|','/')||'|'||sqlerrm);
    end;
  end loop;
  apex_session.delete_session;
end;
/
exit
