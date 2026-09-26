whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 240
connect -name IMART

/* Read-only inventory of every Dropzone upload region. */
select p.page_id,
       s.name page_name,
       p.plug_name region_name,
       p.static_id,
       p.id region_id,
       p.plug_template
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id=p.flow_id and s.id=p.page_id
   and s.security_group_id=p.security_group_id
 where p.flow_id=105
   and p.security_group_id=4744311978888504
   and p.plug_source_type='PLUGIN_DE.DANIELH.DROPZONE2'
 order by p.page_id, p.plug_display_sequence;

exit
