whenever sqlerror exit sql.sqlcode rollback
set define off pagesize 500 linesize 300 trimspool on
connect -name IMART
spool app105-source/verification/detail-form-inventory-20260929.txt
select distinct s.id page_id,s.name page_name,m.modulecode,m.pageno register_page
  from apex_260100.wwv_flow_steps s
  left join module m on m.entrypageno=s.id and m.isactive='YES'
 where s.flow_id=105 and exists
       (select 1 from apex_260100.wwv_flow_page_plugs t
         where t.flow_id=s.flow_id and t.page_id=s.id and lower(t.region_name)='tabcontainer')
   and exists (select 1 from apex_260100.wwv_flow_page_plugs r
         where r.flow_id=s.flow_id and r.page_id=s.id and r.plug_source_type='NATIVE_IG')
 order by s.id;
select distinct s.id page_id, s.name page_name, s.alias page_alias,
       m.modulecode, m.pageno register_page,
       r.plug_name region_name, r.region_name static_id
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_page_plugs r on r.flow_id=s.flow_id and r.page_id=s.id
  left join module m on m.entrypageno=s.id and m.isactive='YES'
 where s.flow_id=105 and s.security_group_id=4744311978888504
   and r.plug_source_type='NATIVE_IG'
   and (exists (select 1 from apex_260100.wwv_flow_page_plugs t
                 where t.flow_id=s.flow_id and t.page_id=s.id
                   and lower(t.region_name)='tabcontainer')
        or lower(r.plug_name) like '%detail%')
 order by s.id, r.plug_name;
select m.modulecode,m.modulename,m.entrypageno form_page,m.pageno register_page,
       m.modulegroupcode
  from module m where m.isactive='YES' and m.entrypageno is not null
 order by m.entrypageno,m.modulecode;
spool off
exit
