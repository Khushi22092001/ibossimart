whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
connect -name IMART
alter session set nls_date_format='DD-MM-YYYY';
spool app105-source/verification/report-kpi-benchmark-20261003.txt
declare c integer;q clob;n integer;b varchar2(128);seen varchar2(32767);m varchar2(10);s varchar2(4000);amt number;started number;elapsed number;val varchar2(4000);msg varchar2(4000);card_count number;
begin
 for r in(select region_id,page_id,module_code from imart_rkpi_config where state='READY' order by page_id,region_id)loop
  apex_session.attach(p_app_id=>105,p_page_id=>r.page_id,p_session_id=>25499780530358);
  q:=imart_report_kpis.count_sql(r.region_id);c:=dbms_sql.open_cursor;started:=dbms_utility.get_time;seen:='|';card_count:=0;
  begin
   dbms_sql.parse(c,q,dbms_sql.native);
   for j in 1..regexp_count(q,':[A-Za-z][A-Za-z0-9_]*')loop
    b:=upper(regexp_substr(q,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
    if instr(seen,'|'||b||'|')=0 then
     val:=v(b);
     if val is null and regexp_like(b,'FROMDATE$|FROM_DATE$') then val:=to_char(trunc(sysdate)-3,'DD-MM-YYYY');end if;
     if val is null and regexp_like(b,'TODATE$|TO_DATE$') then val:=to_char(trunc(sysdate),'DD-MM-YYYY');end if;
     begin dbms_sql.bind_variable(c,':'||b,val);exception when others then if sqlcode<>-1006 then raise;end if;end;
     seen:=seen||b||'|';
    end if;
   end loop;
   dbms_sql.define_column(c,1,m,10);dbms_sql.define_column(c,2,s,4000);dbms_sql.define_column(c,3,amt);n:=dbms_sql.execute(c);
   while dbms_sql.fetch_rows(c)>0 loop dbms_sql.column_value(c,1,m);dbms_sql.column_value(c,2,s);dbms_sql.column_value(c,3,amt);card_count:=card_count+1;dbms_output.put_line('CARD '||r.page_id||' '||m||' '||s||'='||amt);end loop;
   elapsed:=(dbms_utility.get_time-started)*10;dbms_output.put_line('BENCH '||r.page_id||' '||r.module_code||' ms='||elapsed||' cards='||card_count);
   if elapsed>2500 then update imart_rkpi_config set state='REVIEW',issue='Performance preflight exceeded 2500ms: '||elapsed||'ms' where region_id=r.region_id;end if;
  exception when others then msg:=sqlerrm;update imart_rkpi_config set state='REVIEW',issue=msg where region_id=r.region_id;dbms_output.put_line('ERROR '||r.page_id||' '||msg);end;
  dbms_sql.close_cursor(c);apex_session.detach;
 end loop;
end;
/
commit;
spool off
exit
