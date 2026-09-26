set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);
end;
/

prompt Importing Application 105 Page 108 (Indent) blank-row navigation fix
@app105-source/export/f105/application/pages/page_00108.sql

commit;
exit
