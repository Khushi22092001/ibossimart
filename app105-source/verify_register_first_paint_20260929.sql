whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on
connect -name IMART

select file_name, mime_type, file_charset
  from apex_application_static_files
 where application_id = 105
   and file_name in ('hspl-register-first-paint.css', 'hspl-register-first-paint.js')
 order by file_name;

select css_file_urls, javascript_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

declare
  l_asset_count number;
  l_css varchar2(32767);
  l_js varchar2(32767);
begin
  select count(*) into l_asset_count
    from apex_application_static_files
   where application_id = 105
     and file_name in ('hspl-register-first-paint.css', 'hspl-register-first-paint.js');
  select css_file_urls, javascript_file_urls into l_css, l_js
    from apex_260100.wwv_flows
   where id = 105 and security_group_id = 4744311978888504;
  if l_asset_count <> 2
     or instr(l_css, '#APP_FILES#hspl-register-first-paint.css?cb=20260929v2') = 0
     or instr(l_js, '#APP_FILES#hspl-register-first-paint.js?cb=20260929v2') <> 1 then
    raise_application_error(-20001, 'Register first-paint deployment is incomplete or not first in JavaScript order');
  end if;
end;
/
prompt REGISTER_FIRST_PAINT_VERIFIED
exit
