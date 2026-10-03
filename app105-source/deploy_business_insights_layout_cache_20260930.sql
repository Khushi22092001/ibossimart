whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_js varchar2(32767);
begin
  select javascript_file_urls
    into l_js
    from apex_260100.wwv_flows
   where id = 105 and security_group_id = 4744311978888504
   for update;

  l_js := regexp_replace(l_js,
    '(#APP_FILES#hspl-theme[.]js[^[:space:]]*cb=)[^[:space:]]+',
    '\1' || '20260930dashlayout1');

  update apex_260100.wwv_flows
     set javascript_file_urls = l_js,
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'App 105 asset configuration was not updated');
  end if;
  commit;
end;
/
exit
