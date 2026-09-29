whenever sqlerror exit sql.sqlcode rollback
set define off serveroutput on
connect -name IMART
declare
  l_active number;
begin
  select count(*) into l_active
    from v$session s join v$sql q on q.sql_id=s.sql_id and q.child_number=s.sql_child_number
   where s.status='ACTIVE' and s.type='USER'
     and s.audsid<>sys_context('USERENV','SESSIONID')
     and upper(q.sql_fulltext) like '%WWV_FLOW_IMP%';
  if l_active>0 then raise_application_error(-20001,'An APEX import is active; no changes made.'); end if;
  dbms_output.put_line('ACTIVE_APEX_IMPORTS=0');
end;
/
@@deploy_detail_compact_css_20260929.sql
@@activate_detail_compact_20260929.sql
