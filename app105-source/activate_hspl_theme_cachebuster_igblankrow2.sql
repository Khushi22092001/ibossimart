whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

begin
  update apex_260100.wwv_flows
     set javascript_file_urls = regexp_replace(
           javascript_file_urls,
           '#APP_FILES#hspl-theme[.]js[^[:space:]]*',
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260926igblankrow2'),
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where id = 105
     and security_group_id = 4744311978888504;
  commit;
end;
/

select id, javascript_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
