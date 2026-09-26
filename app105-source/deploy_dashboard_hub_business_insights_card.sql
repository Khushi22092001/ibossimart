whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_source varchar2(32767) := q'~declare
  l_count                 pls_integer := 0;
  l_url                   varchar2(4000);
  l_icon                  varchar2(4000);
  l_has_business_insights boolean := false;

  procedure render_card(p_label varchar2, p_page number, p_icon varchar2) is
  begin
    l_count := l_count + 1;
    l_url := apex_page.get_url(
      p_page        => p_page,
      p_session     => v('APP_SESSION'),
      p_clear_cache => to_char(p_page));
    l_icon := case
      when instr(lower(nvl(p_icon,'')), 'fa-') > 0 then p_icon
      else 'fa-file-text-o'
    end;
    htp.p('<a class="hspl-directory-card hspl-directory-tone-' || mod(l_count - 1, 8) ||
          '" href="' || apex_escape.html_attribute(l_url) || '">');
    htp.p('<span class="hspl-directory-icon"><span class="fa ' ||
          apex_escape.html_attribute(l_icon) || '" aria-hidden="true"></span></span>');
    htp.p('<span class="hspl-directory-title">' || apex_escape.html(p_label) || '</span>');
    htp.p('<span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span>');
    htp.p('</a>');
  end render_card;
begin
  htp.p('<section class="hspl-directory-grid" aria-label="Dashboard shortcuts">');
  for r in (
    select myboxlabel, pageno, iconname, serialno
      from myboxtree_apexmenu
     where bossusercode = :GLOBAL_BOSSUSERCODE
       and companycode = :GLOBAL_COMPANYCODE
       and parentkey = 'BU:' || :GLOBAL_BOSSUSERCODE || '.C:' || :GLOBAL_COMPANYCODE || '.MG:134'
       and pageno is not null
     order by serialno, upper(myboxlabel)
  ) loop
    if upper(trim(r.myboxlabel)) = 'BUSINESS INSIGHTS' then
      l_has_business_insights := true;
    end if;
    render_card(r.myboxlabel, r.pageno, r.iconname);
  end loop;

  -- Sidebar navigation exposes this application page, but the legacy role-menu
  -- source can omit it. Add only the missing card and guard against duplicates.
  if not l_has_business_insights then
    render_card('Business Insights', 901, 'fa-line-chart');
  end if;

  if l_count = 0 then
    htp.p('<div class="hspl-directory-empty"><span class="fa fa-folder-open-o" aria-hidden="true"></span><b>No pages available</b><p>Your current role has no authorized pages in this section.</p></div>');
  end if;
  htp.p('</section>');
end;~';
begin
  update apex_260100.wwv_flow_page_plugs
     set plug_source = l_source,
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 826
     and id = 720000000000000007
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Dashboard hub region was not updated');
  end if;

  update apex_260100.wwv_flows
     set javascript_file_urls = regexp_replace(
           javascript_file_urls,
           '(#APP_FILES#hspl-theme[.]js[?]version=#APP_VERSION#[&]cb=)[^[:space:]]+',
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260924dashboardcard2'),
         css_file_urls = regexp_replace(
           css_file_urls,
           '(#APP_FILES#hspl-theme[.]css[?]version=#APP_VERSION#[&]cb=)[^[:space:]]+',
           '#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260924dashboardcard2'),
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Application cache URLs were not updated');
  end if;
end;
/
commit;

begin
  apex_util.set_security_group_id(4744311978888504);
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

select case when instr(plug_source, 'Business Insights') > 0 then 'YES' else 'NO' end as business_insights_fallback,
       case when instr(plug_source, 'l_has_business_insights') > 0 then 'YES' else 'NO' end as duplicate_guard
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 826
   and id = 720000000000000007
   and security_group_id = 4744311978888504;

exit
