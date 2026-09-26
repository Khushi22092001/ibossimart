whenever sqlerror exit failure rollback
set define off
set serveroutput on size unlimited
set pagesize 300 linesize 260 trimspool on
connect -name IMART

prompt === Purchase page and region inventory ===
select p.page_id, p.page_name, count(r.region_id) region_count,
       sum(case when upper(r.source_type) like '%CHART%' then 1 else 0 end) chart_count,
       sum(case when upper(r.source_type) like '%REPORT%' or upper(r.source_type) like '%IR%' then 1 else 0 end) report_count
  from apex_application_pages p
  left join apex_application_page_regions r
    on r.application_id=p.application_id and r.page_id=p.page_id
 where p.application_id=105 and p.page_id between 934 and 940
 group by p.page_id,p.page_name
 order by p.page_id;

prompt === Region source types ===
select page_id, source_type, count(*) region_count
  from apex_application_page_regions
 where application_id=105 and page_id between 934 and 940
 group by page_id,source_type
 order by page_id,source_type;

declare
  l_ctx apex_exec.t_context;
  l_open boolean;
  l_rows pls_integer;

  procedure set_common(p_page number) is
    l_prefix varchar2(10) := 'P'||p_page||'_';
    l_exists number;
    procedure set_if_present(p_name varchar2, p_value varchar2) is
    begin
      select count(*) into l_exists
        from apex_application_page_items
       where application_id=105 and page_id=p_page and item_name=p_name;
      if l_exists > 0 then apex_util.set_session_state(p_name,p_value); end if;
    end;
  begin
    apex_util.set_session_state('GLOBAL_COMPANYCODE','1');
    apex_util.set_session_state('GLOBAL_COMPANYNAME','IRONMART PRIVATE LIMITED');
    apex_util.set_session_state('GLOBAL_FINANCIALYEARCODE','26-27');
    apex_util.set_session_state('GLOBAL_FINANCIALYEARBEGIN','01-04-2026');
    apex_util.set_session_state('GLOBAL_FINANCIALYEAREND','31-03-2027');
    apex_util.set_session_state('GLOBAL_BOSSUSERCODE','1');
    apex_util.set_session_state('GLOBAL_BOSSUSERNAME','BOSS');
    set_if_present(l_prefix||'FROMDATE','01-04-2026');
    set_if_present(l_prefix||'TODATE','24-09-2026');
    set_if_present(l_prefix||'PANEL',null);
    set_if_present(l_prefix||'COMPANY',null);
    set_if_present(l_prefix||'LOCATION',null);
  end;
begin
  for p in 934..940 loop
    apex_session.create_session(p_app_id=>105,p_page_id=>p,p_username=>'BOSS');
    set_common(p);
    dbms_output.put_line('--- PAGE '||p||' ---');
    for r in (
      select region_id, region_name, source_type
        from apex_application_page_regions
       where application_id=105
         and page_id=p
         and (upper(source_type) like '%CHART%'
              or upper(source_type) like '%REPORT%'
              or upper(source_type) like '%IR%'
              or upper(source_type) like '%CARDS%')
       order by display_sequence, region_id
    ) loop
      begin
        l_open := false;
        l_rows := 0;
        l_ctx := apex_region.open_query_context(p_page_id=>p,p_region_id=>r.region_id);
        l_open := true;
        while apex_exec.next_row(l_ctx) loop
          l_rows := l_rows + 1;
          exit when l_rows >= 10000;
        end loop;
        apex_exec.close(l_ctx);
        l_open := false;
        dbms_output.put_line('OK|'||p||'|'||r.region_id||'|'||r.source_type||'|'||replace(r.region_name,'|','/')||'|rows='||l_rows);
      exception when others then
        if l_open then apex_exec.close(l_ctx); end if;
        dbms_output.put_line('ERR|'||p||'|'||r.region_id||'|'||r.source_type||'|'||replace(r.region_name,'|','/')||'|'||sqlerrm);
      end;
    end loop;
    apex_session.delete_session;
  end loop;
end;
/
exit
