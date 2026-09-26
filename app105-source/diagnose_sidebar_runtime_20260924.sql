whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 1000
set lines 4000
set long 100000
set longchunksize 100000
set trimspool on
connect -name IMART

prompt === APPLICATION SIDEBAR CONFIG ===
select nav_list_template_options,
       javascript_file_urls,
       css_file_urls,
       files_version
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

prompt === GLOBAL/PAGE READY OR CLICK ACTIONS REFERENCING NAV STATE ===
select e.page_id,
       e.id as event_id,
       e.name as event_name,
       e.bind_event_type,
       a.id as action_id,
       a.action_sequence,
       a.server_condition_type,
       json_value(a.attributes, '$.js_code' returning varchar2(4000)) as js_code
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a
    on a.event_id = e.id
   and a.flow_id = e.flow_id
 where e.flow_id = 105
   and (
        lower(nvl(json_value(a.attributes, '$.js_code' returning varchar2(4000)), ' ')) like '%js-nav%'
     or lower(nvl(json_value(a.attributes, '$.js_code' returning varchar2(4000)), ' ')) like '%t_body_nav%'
     or lower(nvl(json_value(a.attributes, '$.js_code' returning varchar2(4000)), ' ')) like '%navcontrol%'
   )
 order by e.page_id, e.id, a.action_sequence;

prompt === APPLICATION PROCESS/COMPUTATION CODE REFERENCING NAV STATE ===
select id, flow_step_id as page_id, process_sequence, process_name,
       process_type, substr(process_sql_clob,1,4000) as process_code
  from apex_260100.wwv_flow_step_processing
 where flow_id = 105
   and (
        lower(nvl(process_sql_clob,to_clob(' '))) like '%js-nav%'
     or lower(nvl(process_sql_clob,to_clob(' '))) like '%t_body_nav%'
     or lower(nvl(process_sql_clob,to_clob(' '))) like '%navcontrol%'
   )
 order by flow_step_id, process_sequence;

prompt === ACTIVE SIDEBAR STATIC FILES ===
select file_name, dbms_lob.getlength(file_content) as bytes, last_updated_on
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and lower(file_name) like '%nav%'
 order by file_name;

exit
