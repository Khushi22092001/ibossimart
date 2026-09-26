set define off
set heading on
connect -name IMART
select nav_list_template_options,
       case when instr(javascript_file_urls,'hspl-sidebar-state.js?cb=20260925sbstate49')>0 then 'YES' else 'NO' end as js_v49,
       case when instr(css_file_urls,'hspl-sidebar-state.css?cb=20260925sbstate49')>0 then 'YES' else 'NO' end as css_v49,
       case when instr(javascript_file_urls,'hspl-theme.js?version=#APP_VERSION#&cb=20260924directory5')>0 then 'YES' else 'NO' end as theme_js_directory5,
       case when instr(css_file_urls,'hspl-theme.css?version=#APP_VERSION#&cb=20260924directory3')>0 then 'YES' else 'NO' end as theme_css_directory3
  from apex_260100.wwv_flows
 where id=105
   and security_group_id=4744311978888504;

select count(*) as experimental_processes
  from apex_260100.wwv_flow_processing
 where flow_id=105
   and process_name in ('HSPL_SIDEBAR_STATE','HSPL_SIDEBAR_BOOT');

select count(*) as enabled_legacy_sidebar_collapse_actions
  from apex_260100.wwv_flow_page_da_actions a
 where a.flow_id = 105
   and nvl(a.server_condition_type, 'X') <> 'NEVER'
   and exists (
     select 1
       from apex_260100.wwv_flow_page_da_events e
      where e.id = a.event_id
        and e.flow_id = 105
        and e.bind_event_type = 'ready'
   )
   and instr(trim(json_value(a.attributes, '$.js_code')),
     '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");') = 1;
exit
