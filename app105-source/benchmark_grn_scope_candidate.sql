whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
connect -name IMART
spool app105-source/grn_kpi_scope_comparison.txt
begin apex_session.attach(p_app_id=>105,p_page_id=>145,p_session_id=>549415161481);end;
/
declare r imart_tx_kpi_config%rowtype;q clob;s clob;cur integer;ret integer;b varchar2(128);seen varchar2(32767);started number;n number;
type vals is table of number index by pls_integer;oldvals vals;newvals vals;
procedure run_query(p_scope clob,p_kind varchar2) is begin
q:='with tx_flags as (select /*+ materialize */ * from ('||r.classifier_sql||')) select count(*),sum(approval),sum(review),sum(pending),sum(partial),sum(done) from ('||p_scope||') tx_scope left join tx_flags on tx_flags.tno=tx_scope.tno';
cur:=dbms_sql.open_cursor;dbms_sql.parse(cur,q,dbms_sql.native);seen:='|';
for j in 1..regexp_count(q,':[A-Za-z][A-Za-z0-9_]*')loop
b:=upper(regexp_substr(q,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
if instr(seen,'|'||b||'|')=0 then begin dbms_sql.bind_variable(cur,':'||b,v(b));exception when others then if sqlcode<>-1006 then raise;end if;end;seen:=seen||b||'|';end if;end loop;
for j in 1..6 loop dbms_sql.define_column(cur,j,n);end loop;
started:=dbms_utility.get_time;ret:=dbms_sql.execute(cur);ret:=dbms_sql.fetch_rows(cur);
dbms_output.put_line(p_kind||'_ELAPSED_MS='||(dbms_utility.get_time-started)*10);
for j in 1..6 loop dbms_sql.column_value(cur,j,n);if p_kind='OLD' then oldvals(j):=n;else newvals(j):=n;end if;dbms_output.put_line(p_kind||'['||j||']='||n);end loop;dbms_sql.close_cursor(cur);
end;
begin
select * into r from imart_tx_kpi_config where page_id=145;
s:='select distinct a.tno '||substr(r.source_sql,instr(lower(r.source_sql),'from grn a,'),instr(lower(r.source_sql),'order by a.grnno')-instr(lower(r.source_sql),'from grn a,'));
s:=replace(s,'getmodulecodeforpageno(:APP_PAGE_ID)','(select getmodulecodeforpageno(:APP_PAGE_ID) from dual)');
s:=replace(s,'GETMODULECODEFORPAGENO(:APP_PAGE_ID)','(select getmodulecodeforpageno(:APP_PAGE_ID) from dual)');
s:=replace(s,'getlocationprivilege(a.locationcode,(select getmodulecodeforpageno(:APP_PAGE_ID) from dual),A.COMPANYCODE,:GLOBAL_LOGINNAME)','(select getlocationprivilege(a.locationcode,(select getmodulecodeforpageno(:APP_PAGE_ID) from dual),A.COMPANYCODE,:GLOBAL_LOGINNAME) from dual)');
s:=replace(s,'getdoctypeprivilege(a.doctypecode,(select getmodulecodeforpageno(:APP_PAGE_ID) from dual),A.COMPANYCODE,:GLOBAL_LOGINNAME)','(select getdoctypeprivilege(a.doctypecode,(select getmodulecodeforpageno(:APP_PAGE_ID) from dual),A.COMPANYCODE,:GLOBAL_LOGINNAME) from dual)');
s:=replace(s,'getcompanyprivilege(A.COMPANYCODE,(select getmodulecodeforpageno(:APP_PAGE_ID) from dual),:GLOBAL_LOGINNAME)','(select getcompanyprivilege(A.COMPANYCODE,(select getmodulecodeforpageno(:APP_PAGE_ID) from dual),:GLOBAL_LOGINNAME) from dual)');
dbms_output.put_line('RANGE='||v('P145_FROMDATE')||'..'||v('P145_TODATE'));
oldvals(1):=1227;oldvals(2):=2;oldvals(3):=22;oldvals(4):=15;oldvals(5):=0;oldvals(6):=1212;
run_query('select distinct tno from ('||r.source_sql||')','NEW');
for j in 1..6 loop if nvl(oldvals(j),-1)<>nvl(newvals(j),-1) then raise_application_error(-20001,'Count mismatch '||j);end if;end loop;
dbms_output.put_line('PASS all six card counts unchanged');
end;
/
spool off
exit
