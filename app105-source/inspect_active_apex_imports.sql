set serveroutput on
connect -name IMART

declare
  l_active_import_count pls_integer;
begin
  execute immediate q'[
    select count(*)
      from v$session session_info
      join v$sql sql_text
        on sql_text.sql_id = session_info.sql_id
       and sql_text.child_number = session_info.sql_child_number
     where session_info.status = 'ACTIVE'
       and session_info.type = 'USER'
       and session_info.audsid <> sys_context('USERENV', 'SESSIONID')
       and upper(sql_text.sql_fulltext) like '%WWV_FLOW_IMP%'
  ]' into l_active_import_count;

  dbms_output.put_line('ACTIVE_APEX_IMPORTS=' || l_active_import_count);
exception
  when others then
    dbms_output.put_line('ACTIVE_APEX_IMPORTS=UNKNOWN (' || sqlerrm || ')');
end;
/

exit
