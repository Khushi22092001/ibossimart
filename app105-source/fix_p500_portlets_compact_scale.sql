whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 500 only: compact the workspace without changing its structure or links. */
declare
  l_css clob;
  l_compact_css clob := q'~
html.page-500 .p500-portlet-region{background:transparent!important;border:0!important;box-shadow:none!important}
html.page-500 .p500-workspace{padding:18px 20px 32px}
html.page-500 .p500-hero{box-sizing:border-box;min-height:162px;padding:22px 30px;gap:24px;border-radius:18px}
html.page-500 .p500-eyebrow{margin-bottom:7px;font-size:10px}
html.page-500 .p500-eyebrow i{width:25px;height:25px;font-size:12px}
html.page-500 .p500-hero h1{font-size:clamp(27px,2.3vw,36px)}
html.page-500 .p500-hero p{margin-top:7px;font-size:14px;line-height:1.48}
html.page-500 .p500-hero-note{max-width:225px;padding:5px 0 5px 16px;font-size:14px;line-height:1.4}
html.page-500 .p500-hero-note:before{margin-bottom:5px;font-size:14px}
html.page-500 .p500-snapshot{gap:12px;margin:12px 0 21px}
html.page-500 .p500-snapshot-card{min-height:62px;gap:11px;padding:10px 13px;border-radius:13px}
html.page-500 .p500-snapshot-icon{flex-basis:35px;width:35px;height:35px;border-radius:11px;font-size:15px}
html.page-500 .p500-snapshot-card strong{font-size:13px}
html.page-500 .p500-snapshot-card span:last-child{margin-top:3px;font-size:11px}
html.page-500 .p500-section-head{margin-bottom:13px}
html.page-500 .p500-section-title{gap:11px}
html.page-500 .p500-section-title i{width:35px;height:35px;border-radius:11px;font-size:17px}
html.page-500 .p500-section-title h2{font-size:22px}
html.page-500 .p500-section-title p{margin-top:3px;font-size:13px}
html.page-500 .p500-portlet-grid{gap:14px}
html.page-500 .p500-portlet-card{min-height:164px;padding:16px 17px 13px;border-radius:15px}
html.page-500 .p500-card-icon{width:44px;height:44px;border-radius:14px;font-size:21px}
html.page-500 .p500-card-arrow{width:31px;height:31px;font-size:12px}
html.page-500 .p500-portlet-card h3{margin:13px 0 5px;font-size:16px}
html.page-500 .p500-portlet-card p{font-size:12px;line-height:1.42}
html.page-500 .p500-card-bottom{gap:11px;padding-top:9px;font-size:11px}
html.page-500 .p500-workspace-strip{gap:13px;margin-top:19px;padding:11px 14px;border-radius:15px}
~';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 500
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(l_css, 'p500-portlets-compact-v1') = 0 then
    l_css := l_css || chr(10) || '/* p500-portlets-compact-v1 */' || chr(10) || l_compact_css;
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 500
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Page 500 CSS was not updated');
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
exit
