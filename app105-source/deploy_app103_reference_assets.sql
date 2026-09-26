whenever sqlerror exit failure rollback
set define off
prompt -- Copy the proven App 103 navigation and drawer adapter into App 105.
declare
  l_nav_css blob;
  l_nav_js  blob;
  l_drawer_js blob;
begin
  select file_content into l_nav_css
    from apex_application_static_files
   where application_id = 103
     and file_name = 'hspl-nav-hierarchy-v22.css';

  select file_content into l_nav_js
    from apex_application_static_files
   where application_id = 103
     and file_name = 'hspl-nav-hierarchy-v22.js';

  select file_content into l_drawer_js
    from apex_application_static_files
   where application_id = 103
     and file_name = 'hspl-drawer-adapter.js';

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART'
  );

  wwv_flow_imp_shared.create_app_static_file(
    p_id           => wwv_flow_imp.id(7711000000000001),
    p_file_name    => 'hspl-nav-hierarchy-v22.css',
    p_mime_type    => 'text/css',
    p_file_charset => 'utf-8',
    p_file_content => l_nav_css
  );

  wwv_flow_imp_shared.create_app_static_file(
    p_id           => wwv_flow_imp.id(7711000000000002),
    p_file_name    => 'hspl-nav-hierarchy-v22.js',
    p_mime_type    => 'application/javascript',
    p_file_charset => 'utf-8',
    p_file_content => l_nav_js
  );

  wwv_flow_imp_shared.create_app_static_file(
    p_id           => wwv_flow_imp.id(7711000000000003),
    p_file_name    => 'hspl-drawer-adapter.js',
    p_mime_type    => 'application/javascript',
    p_file_charset => 'utf-8',
    p_file_content => l_drawer_js
  );

  wwv_flow_imp.component_end;
  commit;
end;
/

prompt -- Load the reference assets after the application theme.
declare
  l_css varchar2(32767);
  l_js  varchar2(32767);
begin
  select css_file_urls, javascript_file_urls
    into l_css, l_js
    from apex_260100.wwv_flows
   where id = 105
   for update;

  l_css := regexp_replace(l_css, '([[:space:]]*#APP_FILES#hspl-nav-hierarchy-v22\.css[^[:space:]]*)', '');
  l_css := regexp_replace(l_css, '([[:space:]]*#APP_FILES#hspl-nav-final\.css[^[:space:]]*)', '');
  l_js  := regexp_replace(l_js,  '([[:space:]]*#APP_FILES#hspl-nav-hierarchy-v22\.js[^[:space:]]*)', '');
  l_js  := regexp_replace(l_js,  '([[:space:]]*#APP_FILES#hspl-drawer-adapter\.js[^[:space:]]*)', '');

  update apex_260100.wwv_flows
     set css_file_urls = rtrim(l_css) || chr(10) || '#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260911bd' || chr(10) || '#APP_FILES#hspl-nav-final.css?cb=20260911bf',
         javascript_file_urls = rtrim(l_js) || chr(10) || '#APP_FILES#hspl-nav-hierarchy-v22.js?cb=20260911bd'
   where id = 105;

  commit;
end;
/

exit
