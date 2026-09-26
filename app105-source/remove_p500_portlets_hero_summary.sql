whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 500 only: remove the decorative hero and four summary shortcuts. */
declare
  l_html  clob;
  l_start pls_integer;
  l_end   pls_integer;
begin
  select plug_source
    into l_html
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and page_id = 500
     and static_id = 'p500-portlet-workspace'
     and security_group_id = 4744311978888504
   for update;

  l_start := dbms_lob.instr(l_html, '  <section class="p500-hero"');
  l_end := dbms_lob.instr(l_html, '  <section aria-labelledby="p500-portlets-title">');

  if l_start = 0 or l_end = 0 or l_end <= l_start then
    raise_application_error(-20001, 'Expected Page 500 hero/summary markup was not found');
  end if;

  l_html := dbms_lob.substr(l_html, l_start - 1, 1)
         || dbms_lob.substr(l_html, dbms_lob.getlength(l_html) - l_end + 1, l_end);

  update apex_260100.wwv_flow_page_plugs
     set plug_source = l_html,
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 500
     and static_id = 'p500-portlet-workspace'
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Page 500 workspace was not updated');
  end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case
         when dbms_lob.instr(plug_source, 'p500-hero') = 0
          and dbms_lob.instr(plug_source, 'p500-snapshot') = 0
          and dbms_lob.instr(plug_source, 'p500-portlet-grid') > 0
         then 'P500_HERO_SUMMARY_REMOVED'
         else 'P500_HERO_SUMMARY_CHECK_FAILED'
       end as deployment_check
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 500
   and static_id = 'p500-portlet-workspace'
   and security_group_id = 4744311978888504;
exit
