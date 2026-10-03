whenever sqlerror exit sql.sqlcode rollback
set define off feedback off
connect -name IMART
set sqlformat csv
spool app105-source/verification/register-inventory-20260929.csv
select s.id page_id, s.name page_name, s.alias page_alias,
       p.plug_name region_name, p.plug_source_type region_type
from apex_260100.wwv_flow_steps s
join apex_260100.wwv_flow_page_plugs p on p.flow_id=s.flow_id and p.page_id=s.id
where s.flow_id=105 and s.security_group_id=4744311978888504
and p.plug_source_type in ('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT','NATIVE_STATIC')
and (lower(s.name) like '%register%' or lower(s.name) like '%list%' or p.plug_source_type in ('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT'))
order by s.id, p.plug_display_sequence;
spool off
exit
