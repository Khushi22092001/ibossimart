whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set pagesize 1000
connect -name IMART
set sqlformat csv
spool app105-source/verification/module-kpi-targets-20261003.csv
select m.modulecode,m.modulename,m.mastertablename,m.detailtablename,m.pageno,m.entrypageno,s.name page_name,p.id region_id,p.plug_name,p.plug_source_type,p.query_type,p.static_id,
case when exists(select 1 from apex_260100.wwv_flow_page_plugs k where k.flow_id=105 and k.page_id=s.id and (k.static_id like 'tx-kpi-shell-%' or k.static_id like 'mr-kpi-shell-%')) then 'PRESENT' else 'MISSING' end coverage
from module m join apex_260100.wwv_flow_steps s on s.flow_id=105 and to_char(s.id)=trim(m.pageno)
join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.page_id=s.id
where m.isactive='YES' and p.plug_source_type in ('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT')
and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing','i')
order by s.id,p.plug_display_sequence;
spool off
set sqlformat default
set serveroutput on size unlimited
spool app105-source/verification/missing-kpi-columns-20261003.txt
declare c integer;n integer;d dbms_sql.desc_tab2;
begin
 for r in (select distinct s.id page_id,m.modulecode,p.id region_id,p.plug_name,p.plug_source,p.query_type,p.plug_source_type
 from module m join apex_260100.wwv_flow_steps s on s.flow_id=105 and to_char(s.id)=trim(m.pageno)
 join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.page_id=s.id
 where m.isactive='YES' and p.plug_source_type in ('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT')
 and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing','i')
 and not exists(select 1 from apex_260100.wwv_flow_page_plugs k where k.flow_id=105 and k.page_id=s.id and (k.static_id like 'tx-kpi-shell-%' or k.static_id like 'mr-kpi-shell-%'))
 order by s.id) loop
  dbms_output.put_line('PAGE='||r.page_id||' MODULE='||r.modulecode||' REGION='||r.region_id||' TYPE='||r.plug_source_type||' QUERY='||r.query_type);
  if r.query_type='SQL' then
   c:=dbms_sql.open_cursor;
   begin
    dbms_sql.parse(c,r.plug_source,dbms_sql.native);dbms_sql.describe_columns2(c,n,d);
    for j in 1..n loop dbms_output.put_line(d(j).col_name||' TYPE='||d(j).col_type);end loop;
   exception when others then dbms_output.put_line('PARSE_ERROR='||sqlerrm);end;
   dbms_sql.close_cursor(c);
  end if;
 end loop;
end;
/
spool off
exit
