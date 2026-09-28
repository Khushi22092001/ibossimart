whenever sqlerror exit failure rollback
set define off
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STATIC_FILES'
 order by column_name;

select count(*) as active_apex_imports
  from v$session session_info
  join v$sql sql_text
    on sql_text.sql_id = session_info.sql_id
   and sql_text.child_number = session_info.sql_child_number
 where session_info.status = 'ACTIVE'
   and session_info.type = 'USER'
   and session_info.audsid <> sys_context('USERENV', 'SESSIONID')
   and upper(sql_text.sql_fulltext) like '%WWV_FLOW_IMP%';

exit
