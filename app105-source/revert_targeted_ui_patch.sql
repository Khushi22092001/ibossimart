whenever sqlerror exit failure rollback
set define off
prompt -- Revert only the 2026-09-14 targeted UI safety patch references.
declare
  l_css varchar2(32767);
  l_js  varchar2(32767);
begin
  select css_file_urls, javascript_file_urls
    into l_css, l_js
    from apex_260100.wwv_flows
   where id = 105
   for update;

  update apex_260100.wwv_flows
     set css_file_urls = replace(l_css, chr(10) || '#APP_FILES#hspl-ui-safety-20260914.css?cb=20260914f', ''),
         javascript_file_urls = replace(l_js, chr(10) || '#APP_FILES#hspl-ui-safety-20260914.js?cb=20260914f', '')
   where id = 105;
  commit;
end;
/
exit
