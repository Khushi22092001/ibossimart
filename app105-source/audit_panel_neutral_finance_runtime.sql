whenever sqlerror exit failure rollback
set define off verify off feedback off serveroutput on size unlimited pagesize 500 linesize 260 trimspool on
connect -name IMART

declare
  l_ctx apex_exec.t_context;
  l_open boolean;
  l_rows pls_integer;
  l_exists number;

  procedure set_if_present(p_page number, p_suffix varchar2, p_value varchar2) is
    l_name varchar2(50) := 'P'||p_page||'_'||p_suffix;
  begin
    select count(*) into l_exists from apex_application_page_items
     where application_id=105 and page_id=p_page and item_name=l_name;
    if l_exists>0 then apex_util.set_session_state(l_name,p_value); end if;
  end;
begin
  for p in (select column_value page_id from table(sys.odcinumberlist(903,910,914,915,918,919,923,926,928,929,932,933))) loop
    apex_session.create_session(p_app_id=>105,p_page_id=>p.page_id,p_username=>'BOSS');
    apex_util.set_session_state('GLOBAL_COMPANYCODE','1');
    apex_util.set_session_state('GLOBAL_COMPANYNAME','IRONMART PRIVATE LIMITED');
    apex_util.set_session_state('GLOBAL_FINANCIALYEARCODE','26-27');
    apex_util.set_session_state('GLOBAL_FINANCIALYEARBEGIN','01-04-2026');
    apex_util.set_session_state('GLOBAL_FINANCIALYEAREND','31-03-2027');
    apex_util.set_session_state('GLOBAL_BOSSUSERCODE','1');
    set_if_present(p.page_id,'FROMDATE','01-04-2026');
    set_if_present(p.page_id,'TODATE','24-09-2026');
    set_if_present(p.page_id,'AGEBASIS','DUE');
    set_if_present(p.page_id,'COMPANY',null);
    set_if_present(p.page_id,'LOCATION',null);
    dbms_output.put_line('--- PAGE '||p.page_id||' ---');
    for r in (
      select region_id,region_name,source_type
        from apex_application_page_regions
       where application_id=105 and page_id=p.page_id
         and (upper(source_type) like '%CHART%'
           or upper(source_type) like '%REPORT%'
           or upper(source_type) like '%IR%'
           or upper(source_type) like '%CARDS%')
       order by display_sequence,region_id
    ) loop
      begin
        l_open := false;
        l_rows := 0;
        l_ctx := apex_region.open_query_context(p_page_id=>p.page_id,p_region_id=>r.region_id);
        l_open := true;
        while apex_exec.next_row(l_ctx) loop l_rows:=l_rows+1; exit when l_rows>=100; end loop;
        apex_exec.close(l_ctx);
        l_open := false;
        dbms_output.put_line('OK|'||p.page_id||'|'||replace(r.region_name,'|','/')||'|rows='||l_rows);
      exception when others then
        if l_open then apex_exec.close(l_ctx); end if;
        dbms_output.put_line('ERR|'||p.page_id||'|'||replace(r.region_name,'|','/')||'|'||sqlerrm);
      end;
    end loop;
    apex_session.delete_session;
  end loop;
end;
/
exit
