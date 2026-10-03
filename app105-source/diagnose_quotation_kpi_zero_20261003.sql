whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set long 50000
set linesize 240
set pagesize 100
set serveroutput on
spool app105-source/verification/quotation-kpi-zero-diagnosis-20261003.txt
select region_id,page_id,key_expression,recent_predicate,mine_predicate from imart_rkpi_config where page_id=709;
select source_sql from imart_rkpi_config where page_id=709;
select p.id,p.plug_source from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id=709 and p.plug_source_type='NATIVE_IR';
begin apex_session.attach(p_app_id=>105,p_page_id=>709,p_session_id=>25499780530358);end;
/
select v('P709_FROMDATE') from_date,v('P709_TODATE') to_date,v('P709_COMPANY') company,v('P709_COMPANYCODE') company_code from dual;
declare c integer;q clob;n integer;b varchar2(128);seen varchar2(32767):='|';m varchar2(10);s varchar2(4000);amt number;val varchar2(4000);begin
 for r in(select region_id from imart_rkpi_config where page_id=709 and state='READY')loop
 q:=imart_report_kpis.count_sql(r.region_id);c:=dbms_sql.open_cursor;dbms_sql.parse(c,q,dbms_sql.native);
 for j in 1..regexp_count(q,':[A-Za-z][A-Za-z0-9_]*')loop
 b:=upper(regexp_substr(q,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
 if instr(seen,'|'||b||'|')=0 then val:=v(b);dbms_output.put_line('BIND '||b||'='||val);begin dbms_sql.bind_variable(c,':'||b,val);exception when others then if sqlcode<>-1006 then raise;end if;end;seen:=seen||b||'|';end if;
 end loop;
 dbms_sql.define_column(c,1,m,10);dbms_sql.define_column(c,2,s,4000);dbms_sql.define_column(c,3,amt);n:=dbms_sql.execute(c);
 while dbms_sql.fetch_rows(c)>0 loop dbms_sql.column_value(c,1,m);dbms_sql.column_value(c,2,s);dbms_sql.column_value(c,3,amt);dbms_output.put_line('CARD '||m||'='||amt);end loop;
 if v('P709_FROMDATE') is null then
 dbms_sql.bind_variable(c,':P709_FROMDATE',to_char(trunc(sysdate)-6,'DD-MM-YYYY'));
 n:=dbms_sql.execute(c);
 while dbms_sql.fetch_rows(c)>0 loop dbms_sql.column_value(c,1,m);dbms_sql.column_value(c,2,s);dbms_sql.column_value(c,3,amt);dbms_output.put_line('DEFAULT_DATE_DIAGNOSTIC '||m||'='||amt);end loop;
 end if;
 dbms_sql.close_cursor(c);
 end loop;
 apex_session.detach;
end;
/
spool off
exit
