whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/existing_master_360_pages.csv
select id page_id, name page_name, alias page_alias, page_mode,
       last_updated_on, last_updated_by
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and (id between 510 and 543
        or id between 722 and 726
        or id between 906 and 939)
 order by id;
spool off

spool app105-source/master-insights-plan/existing_master_360_items.csv
select i.flow_step_id page_id,
       s.name page_name,
       s.alias page_alias,
       i.item_sequence,
       i.name item_name,
       i.prompt,
       i.display_as,
       i.source_type,
       i.source,
       i.item_default,
       i.item_default_type
  from apex_260100.wwv_flow_step_items i
  join apex_260100.wwv_flow_steps s
    on s.flow_id=i.flow_id and s.id=i.flow_step_id
 where i.flow_id = 105
   and i.flow_step_id in (
       510,511,512,513,514,515,522,524,525,526,527,528,529,
       530,531,532,533,536,537,538,541,542,543,724,725,726,
       906,908,909,921,922,923,935,936,937,939
   )
 order by i.flow_step_id, i.item_sequence, i.name;
spool off

spool app105-source/master-insights-plan/existing_master_360_processes.csv
select pr.flow_step_id page_id,
       s.name page_name,
       pr.process_sequence,
       pr.process_point,
       pr.process_type,
       pr.process_name,
       dbms_lob.substr(pr.process_sql_clob,3900,1) process_source_01,
       dbms_lob.substr(pr.process_sql_clob,3900,3901) process_source_02,
       dbms_lob.substr(pr.process_sql_clob,3900,7801) process_source_03
  from apex_260100.wwv_flow_step_processing pr
  join apex_260100.wwv_flow_steps s
    on s.flow_id=pr.flow_id and s.id=pr.flow_step_id
 where pr.flow_id = 105
   and pr.flow_step_id in (
       510,511,512,513,514,515,522,524,525,526,527,528,529,
       530,531,532,533,536,537,538,541,542,543,724,725,726,
       906,908,909,921,922,923,935,936,937,939
   )
 order by pr.flow_step_id, pr.process_sequence, pr.id;
spool off

spool app105-source/master-insights-plan/existing_master_360_regions.csv
select p.page_id,
       s.name page_name,
       s.alias page_alias,
       p.plug_display_sequence,
       p.plug_name region_name,
       p.static_id region_static_id,
       p.plug_source_type,
       p.query_table,
       dbms_lob.substr(p.plug_source,3900,1) region_source_01,
       dbms_lob.substr(p.plug_source,3900,3901) region_source_02,
       dbms_lob.substr(p.plug_source,3900,7801) region_source_03,
       dbms_lob.substr(p.plug_source,3900,11701) region_source_04
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id=p.flow_id and s.id=p.page_id
 where p.flow_id = 105
   and p.page_id in (
       510,511,512,513,514,515,522,524,525,526,527,528,529,
       530,531,532,533,536,537,538,541,542,543,724,725,726,
       906,908,909,921,922,923,935,936,937,939
   )
 order by p.page_id, p.plug_display_sequence, p.id;
spool off

exit
