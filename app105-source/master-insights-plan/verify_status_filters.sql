whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART
spool app105-source/master-insights-plan/status_filter_verification.txt
declare
 cur integer;q clob;payload clob;expected number;actual number;n integer;b varchar2(128);seen varchar2(32767);
 status_value varchar2(4000);failed number:=0;passed number:=0;
begin
 for r in (select r.*,p.plug_source live_sql from imart_mr_register r join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.id=r.region_id order by r.page_id) loop
  begin
   apex_session.attach(p_app_id=>105,p_page_id=>r.page_id,p_session_id=>3275667854335);
   apex_json.initialize_clob_output;imart_register_kpis.payload(r.page_id);payload:=apex_json.get_clob_output;
   for k in 0..case when r.status_expression is not null and json_exists(payload,'$.cards[1]') then 1 else 0 end loop
    select to_number(replace(case when k=0 then json_value(payload,'$.cards[0].value') else json_value(payload,'$.cards[1].value') end,',','')) into expected from dual;
    select json_value(payload,'$.cards[1].status') into status_value from dual;
    apex_collection.create_or_truncate_collection('MR_KPI_105_'||r.page_id);
    apex_collection.add_member(p_collection_name=>'MR_KPI_105_'||r.page_id,p_c001=>case when k=0 then 'ALL' else 'STATUS' end,p_c002=>status_value);
    q:='select '||case when r.identity_column is not null then 'count(distinct '||dbms_assert.simple_sql_name(r.identity_column)||')' else 'count(*)' end||' from ('||regexp_replace(r.live_sql,';[[:space:]]*$','')||chr(10)||')';
    cur:=dbms_sql.open_cursor;dbms_sql.parse(cur,q,dbms_sql.native);seen:='|';
    for j in 1..regexp_count(q,':[A-Za-z][A-Za-z0-9_]*') loop
     b:=upper(regexp_substr(q,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
     if instr(seen,'|'||b||'|')=0 then
      begin dbms_sql.bind_variable(cur,':'||b,v(b));exception when others then if sqlcode<>-1006 then raise;end if;end;
      seen:=seen||b||'|';
     end if;
    end loop;
    dbms_sql.define_column(cur,1,actual);n:=dbms_sql.execute(cur);n:=dbms_sql.fetch_rows(cur);dbms_sql.column_value(cur,1,actual);dbms_sql.close_cursor(cur);
    if actual<>expected then raise_application_error(-20004,'Card/filter count mismatch');end if;
   end loop;
   apex_collection.create_or_truncate_collection('MR_KPI_105_'||r.page_id);
   apex_collection.add_member(p_collection_name=>'MR_KPI_105_'||r.page_id,p_c001=>'ALL');
   apex_json.free_output;apex_session.detach;passed:=passed+1;dbms_output.put_line('PASS page='||r.page_id);
  exception when others then
   if cur is not null and dbms_sql.is_open(cur) then dbms_sql.close_cursor(cur);end if;
   failed:=failed+1;dbms_output.put_line('FAIL page='||r.page_id||' '||sqlerrm);apex_json.free_output;apex_session.detach;
  end;
 end loop;
 commit;dbms_output.put_line('PASSED='||passed||'; FAILED='||failed);
 if failed>0 then raise_application_error(-20005,'Status filter verification failed');end if;
end;
/
spool off
exit
