set define off echo off feedback off pagesize 0 linesize 32767 trimspool on serveroutput on size unlimited
spool .theme-analysis-900-100/component-sql/master-dependency-audit.txt
declare
 c integer; n integer:=0; failed integer:=0; q clob;
begin
 for r in (
  select r.page_id, 'REGION' kind, r.region_id id, r.region_name name, r.region_source src from apex_application_page_regions r
  where r.application_id=100 and r.page_id in (select page_id from apex_application_pages where application_id=100 and lower(page_name) like '%master%')
  union all
  select i.page_id,'ITEM_LOV',i.item_id,i.item_name,i.lov_definition from apex_application_page_items i
  where i.application_id=100 and i.page_id in (select page_id from apex_application_pages where application_id=100 and lower(page_name) like '%master%')
  union all
  select g.page_id,'GRID_LOV',g.column_id,g.name,g.lov_source from apex_appl_page_ig_columns g
  where g.application_id=100 and g.page_id in (select page_id from apex_application_pages where application_id=100 and lower(page_name) like '%master%')
  union all
  select 0,'SHARED_LOV',lov_id,list_of_values_name,list_of_values_query from apex_application_lovs where application_id=100
 ) loop
  if regexp_like(r.src,'^\s*(select|with)\s','i') then
   n:=n+1;c:=dbms_sql.open_cursor;
   q:=regexp_replace(trim(r.src),';\s*$','');
   q:=replace(replace(replace(q,'&APP_ID.','100'),'&SESSION.','0'),'&APP_SESSION.','0');
   begin
    dbms_sql.parse(c,q,dbms_sql.native);
   exception when others then
    failed:=failed+1;
    dbms_output.put_line(r.page_id||'|'||r.kind||'|'||r.id||'|'||r.name||'|'||replace(sqlerrm,chr(10),' '));
   end;
   dbms_sql.close_cursor(c);
  end if;
 end loop;
 dbms_output.put_line('TOTAL_QUERIES='||n||' FAILED='||failed);
end;
/
spool off
set feedback on
