connect -name IMART
set pagesize 100 linesize 240 trimspool on
column list_name format a30
column business_insights_rule format a24
select list_name,
       case when instr(upper(list_query),'BUSINESS INSIGHTS')>0 then 'PRESENT' else 'MISSING' end business_insights_rule,
       case when instr(upper(list_query),'''901'' PAGENO')>0 then 'PAGE 901' else 'TARGET MISSING' end target_check,
       case when instr(upper(list_query),'MG:134')>0 then 'DASHBOARD PARENT' else 'PARENT MISSING' end parent_check
  from apex_application_lists
 where application_id=105 and list_name='IronMart';

prompt === SQL parse ===
set serveroutput on
declare
  l_cursor integer;
  l_sql clob;
begin
  select list_query into l_sql
    from apex_application_lists
   where application_id=105 and list_name='IronMart';
  l_cursor:=dbms_sql.open_cursor;
  dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);
  dbms_output.put_line('OK: IronMart sidebar SQL parsed successfully');
exception when others then
  if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
  raise;
end;
/
exit
