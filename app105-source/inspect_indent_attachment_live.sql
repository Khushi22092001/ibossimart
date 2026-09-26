whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 500
set lines 3000
set long 20000
set longchunksize 20000
set trimspool on
connect -name IMART

prompt === PAGE 108 KEY PROCESSES ===
select id,
       process_sequence,
       process_point,
       process_type,
       process_name,
       substr(process_sql_clob, 1, 4000) as process_code
  from apex_260100.wwv_flow_step_processing
 where flow_id = 105
   and flow_step_id = 108
   and (
        lower(process_name) like '%tno%'
     or lower(nvl(process_sql_clob, to_clob(' '))) like '%p108_tno%'
   )
 order by process_point, process_sequence, id;

prompt === PAGE 108 ATTACHMENT BUTTON ===
select id,
       button_name,
       button_action,
       redirect_url,
       button_sequence
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 108
   and id = 38638257909424854;

prompt === PAGE 108 ATTACHMENT REGION ===
select id,
       plug_name,
       plug_source_type,
       ajax_items_to_submit,
       substr(plug_source, 1, 4000) as region_source
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 108
   and id = 1126326824023815957;

prompt === PAGE 63 FORM PROCESSES ===
select id,
       process_sequence,
       process_point,
       process_type,
       process_name,
       substr(process_sql_clob, 1, 4000) as process_code
  from apex_260100.wwv_flow_step_processing
 where flow_id = 105
   and flow_step_id = 63
 order by process_point, process_sequence, id;

exit
