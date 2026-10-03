whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/customer_branch_360_items.csv
select i.flow_step_id page_id,s.name page_name,s.alias page_alias,
       i.item_sequence,i.name item_name,i.prompt,i.display_as,
       i.source_type,i.source,i.item_default,i.item_default_type
  from apex_260100.wwv_flow_step_items i
  join apex_260100.wwv_flow_steps s
    on s.flow_id=i.flow_id and s.id=i.flow_step_id
 where i.flow_id=105 and i.flow_step_id in (906,907,908,909,910,911,912,913,914,915,916,917,918,919)
 order by i.flow_step_id,i.item_sequence,i.name;
spool off

spool app105-source/master-insights-plan/customer_branch_360_regions.csv
select p.page_id,s.name page_name,s.alias page_alias,p.plug_display_sequence,
       p.plug_name region_name,p.static_id region_static_id,p.plug_source_type,
       dbms_lob.substr(p.plug_source,3900,1) region_source_01,
       dbms_lob.substr(p.plug_source,3900,3901) region_source_02,
       dbms_lob.substr(p.plug_source,3900,7801) region_source_03,
       dbms_lob.substr(p.plug_source,3900,11701) region_source_04
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id=p.flow_id and s.id=p.page_id
 where p.flow_id=105 and p.page_id in (906,907,908,909,910,911,912,913,914,915,916,917,918,919)
 order by p.page_id,p.plug_display_sequence,p.id;
spool off

spool app105-source/master-insights-plan/imart_slc_360_source.csv
select name,type,line,text
  from user_source
 where name='IMART_SLC_360'
 order by type,line;
spool off

exit
