whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 300
set long 200000
set longchunksize 200000
connect -name IMART

select s.id page_id, s.name page_name, s.inline_css
  from apex_260100.wwv_flow_steps s
 where s.flow_id=105
   and s.id=118
   and s.security_group_id=4744311978888504;

select p.id, p.plug_name, p.static_id, p.plug_template,
       p.plug_template_options
  from apex_260100.wwv_flow_page_plugs p
 where p.flow_id=105
   and p.id=53134147830550917
   and p.security_group_id=4744311978888504;

exit
