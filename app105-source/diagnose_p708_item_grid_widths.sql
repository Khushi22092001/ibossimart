whenever sqlerror exit sql.sqlcode rollback
set pagesize 200
set linesize 240
connect -name IMART

select table_name
  from all_tables
 where owner = 'APEX_260100'
   and table_name like 'WWV_FLOW_IG%'
 order by table_name;

select r.id report_id,
       r.interactive_grid_id,
       r.name,
       r.type,
       r.application_user,
       r.base_report_id,
       v.id view_id,
       v.view_type
  from apex_260100.wwv_flow_ig_reports r
  join apex_260100.wwv_flow_ig_report_views v
    on v.report_id = r.id
 where r.flow_id = 105
   and r.page_id = 708
 order by r.id, v.id;

select r.id report_id,
       r.interactive_grid_id,
       v.id view_id,
       c.display_seq,
       c.column_id,
       c.width,
       c.is_visible
  from apex_260100.wwv_flow_ig_reports r
  join apex_260100.wwv_flow_ig_report_views v
    on v.report_id = r.id
  join apex_260100.wwv_flow_ig_report_columns c
    on c.view_id = v.id
 where r.flow_id = 105
   and r.page_id = 708
 order by r.id, v.id, c.display_seq;

exit
