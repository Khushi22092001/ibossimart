whenever sqlerror exit failure rollback
set define off
set serveroutput on size unlimited
set pagesize 200 linesize 260 trimspool on
connect -name IMART

prompt === Live Business Insights and dashboard page inventory ===
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and page_id between 901 and 933
 order by page_id;

prompt === Business Insights region source contains P&L? ===
select page_id, region_name,
       case when instr(upper(region_source),'PROFIT AND LOSS') > 0 then 'YES' else 'NO' end has_profit_loss
  from apex_application_page_regions
 where application_id = 105 and page_id = 901;

prompt === Invalid legacy privilege conditions carried into HSPL ===
select page_id, region_name, condition_type, substr(condition_expression1,1,180) condition_expression1
  from apex_application_page_regions
 where application_id = 105
   and page_id between 901 and 933
   and (condition_expression1 like '%PageID Between 690 And 702%'
        or condition_expression1 like '%PageID Between 708 And 721%')
 order by page_id, display_sequence;

prompt === JET chart region runtime smoke test ===
select page_id, region_id, region_name, source_type
  from apex_application_page_regions
 where application_id=105 and page_id in (907,920)
   and upper(source_type) like '%CHART%'
 order by page_id, display_sequence;

declare
  l_sid number;
  l_ctx apex_exec.t_context;
  l_rows pls_integer;
  l_open boolean;
begin
  apex_session.create_session(p_app_id=>105,p_page_id=>907,p_username=>'BOSS');
  apex_util.set_session_state('P907_FROMDATE','01-04-2026');
  apex_util.set_session_state('P907_TODATE','24-09-2026');
  apex_util.set_session_state('P907_AGEBASIS','DUE');
  for r in (
    select region_id, region_name
      from apex_application_page_regions
     where application_id=105 and page_id=907 and upper(source_type) like '%CHART%'
     order by display_sequence
  ) loop
    begin
      l_open := false;
      l_ctx := apex_region.open_query_context(p_page_id=>907,p_region_id=>r.region_id);
      l_open := true;
      l_rows := 0;
      while apex_exec.next_row(l_ctx) loop l_rows := l_rows + 1; end loop;
      apex_exec.close(l_ctx);
      l_open := false;
      dbms_output.put_line('OK 907/'||r.region_id||' '||r.region_name||' rows='||l_rows);
    exception when others then
      if l_open then apex_exec.close(l_ctx); end if;
      dbms_output.put_line('ERR 907/'||r.region_id||' '||r.region_name||': '||sqlerrm);
    end;
  end loop;
  apex_session.delete_session;
end;
/

declare
  l_ctx apex_exec.t_context;
  l_rows pls_integer;
  l_open boolean;
begin
  apex_session.create_session(p_app_id=>105,p_page_id=>920,p_username=>'BOSS');
  apex_util.set_session_state('P920_FROMDATE','01-04-2026');
  apex_util.set_session_state('P920_TODATE','24-09-2026');
  apex_util.set_session_state('P920_AGEBASIS','DUE');
  for r in (
    select region_id, region_name
      from apex_application_page_regions
     where application_id=105 and page_id=920 and upper(source_type) like '%CHART%'
     order by display_sequence
  ) loop
    begin
      l_open := false;
      l_ctx := apex_region.open_query_context(p_page_id=>920,p_region_id=>r.region_id);
      l_open := true;
      l_rows := 0;
      while apex_exec.next_row(l_ctx) loop l_rows := l_rows + 1; end loop;
      apex_exec.close(l_ctx);
      l_open := false;
      dbms_output.put_line('OK 920/'||r.region_id||' '||r.region_name||' rows='||l_rows);
    exception when others then
      if l_open then apex_exec.close(l_ctx); end if;
      dbms_output.put_line('ERR 920/'||r.region_id||' '||r.region_name||': '||sqlerrm);
    end;
  end loop;
  apex_session.delete_session;
end;
/
exit
