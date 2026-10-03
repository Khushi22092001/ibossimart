whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
create table imart_mr_creation_backup as select id,static_id,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and (id in (select region_id from imart_mr_register) or static_id like 'mr-kpi-shell-%');
create table imart_mr_creation_pkg_backup as select type,line,text from user_source where name='IMART_REGISTER_KPIS';
create table imart_mr_creation as
select r.page_id,c.table_name,r.identity_column,
 (select min(u.column_name) keep(dense_rank first order by case u.column_name when 'CREATIONTIME' then 1 when 'CREATEDON' then 2 when 'DATECREATED' then 3 else 4 end) from user_tab_columns u where u.table_name=upper(c.table_name) and u.column_name in ('CREATIONTIME','CREATEDON','DATECREATED','DATECRATED') and u.data_type in ('DATE','TIMESTAMP','TIMESTAMP WITH TIME ZONE','TIMESTAMP WITH LOCAL TIME ZONE')) created_column,
 (select max(u.column_name) from user_tab_columns u where u.table_name=upper(c.table_name) and u.column_name='CREATOR') creator_column
from imart_mr_register r join imart_mr_catalog c on c.module_code=r.module_code;
@app105-source/master-insights-plan/register_status_package.sql
declare n number;begin select count(*) into n from user_errors where name='IMART_REGISTER_KPIS';if n>0 then raise_application_error(-20001,'KPI package compile failed');end if;end;
/
declare src clob; cur integer; n integer:=0;
begin
 -- Parse all generated sources first. Only publish when every register is valid.
 for r in (select * from imart_mr_register) loop
  src:='select mr_source.* from ('||regexp_replace(r.query_sql,';[[:space:]]*$','')||chr(10)||') mr_source where ((select imart_register_kpis.selected_mode('||r.page_id||') from dual)=''ALL''';
  if r.status_expression is not null then src:=src||' or ((select imart_register_kpis.selected_mode('||r.page_id||') from dual)=''STATUS'' and nvl(trim(cast('||r.status_expression||' as varchar2(4000))),chr(1))=nvl((select imart_register_kpis.selected_status('||r.page_id||') from dual),chr(1)))';end if;
  src:=src||' or ((select imart_register_kpis.selected_mode('||r.page_id||') from dual)=''RECENT'' and '||imart_register_kpis.creation_test(r.page_id,'RECENT')||') or ((select imart_register_kpis.selected_mode('||r.page_id||') from dual)=''MINE'' and '||imart_register_kpis.creation_test(r.page_id,'MINE')||'))';
  cur:=dbms_sql.open_cursor;
  begin dbms_sql.parse(cur,src,dbms_sql.native);dbms_sql.close_cursor(cur);
  exception when others then dbms_sql.close_cursor(cur);raise_application_error(-20004,'Page '||r.page_id||': '||sqlerrm);end;
  update apex_260100.wwv_flow_page_plugs set plug_source=src where flow_id=105 and id=r.region_id;
  n:=n+1;
 end loop;
 dbms_output.put_line('Creation filters parsed and published for '||n||' master registers.');
end;
/
commit;
@app105-source/master-insights-plan/update_kpi_design.sql
