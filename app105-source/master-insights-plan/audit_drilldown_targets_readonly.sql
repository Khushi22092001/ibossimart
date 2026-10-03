whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/drilldown_page_items.csv
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
       i.item_default_type,
       i.lov,
       i.named_lov,
       i.display_when_type,
       i.display_when
  from apex_260100.wwv_flow_step_items i
  join apex_260100.wwv_flow_steps s
    on s.flow_id = i.flow_id
   and s.id = i.flow_step_id
 where i.flow_id = 105
   and i.flow_step_id in (
       10,11,103,117,127,141,142,144,145,151,160,170,174,
       198,210,260,281,283,291,298,327,329,362,376,378,
       379,384,388,403,404,407,519,722,723,929,934,937,939,941
   )
 order by i.flow_step_id, i.item_sequence, i.name;
spool off

spool app105-source/master-insights-plan/drilldown_page_buttons.csv
select b.flow_step_id page_id,
       s.name page_name,
       s.alias page_alias,
       b.button_sequence,
       b.button_name,
       b.button_image_alt,
       b.button_action,
       b.button_redirect_url,
       b.button_condition_type,
       b.button_condition
  from apex_260100.wwv_flow_step_buttons b
  join apex_260100.wwv_flow_steps s
    on s.flow_id = b.flow_id
   and s.id = b.flow_step_id
 where b.flow_id = 105
   and b.flow_step_id in (
       10,11,103,117,127,141,142,144,145,151,160,170,174,
       198,210,260,281,283,291,298,327,329,362,376,378,
       379,384,388,403,404,407,519,722,723,929,934,937,939,941
   )
 order by b.flow_step_id, b.button_sequence, b.button_name;
spool off

exit
