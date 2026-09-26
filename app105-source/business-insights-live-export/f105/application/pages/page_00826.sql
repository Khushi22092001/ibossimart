prompt --application/pages/page_00826
begin
--   Manifest
--     PAGE: 00826
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>826
,p_name=>'Dashboard'
,p_alias=>'DASHBOARD-HUB'
,p_step_title=>'Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(720000000000000007)
,p_plug_name=>'Dashboard pages'
,p_static_id=>'hspl-directory-content'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count                 pls_integer := 0;',
'  l_url                   varchar2(4000);',
'  l_icon                  varchar2(4000);',
'  l_has_business_insights boolean := false;',
'',
'  procedure render_card(p_label varchar2, p_page number, p_icon varchar2) is',
'  begin',
'    l_count := l_count + 1;',
'    l_url := apex_page.get_url(',
'      p_page        => p_page,',
'      p_session     => v(''APP_SESSION''),',
'      p_clear_cache => to_char(p_page));',
'    l_icon := case',
'      when instr(lower(nvl(p_icon,'''')), ''fa-'') > 0 then p_icon',
'      else ''fa-file-text-o''',
'    end;',
'    htp.p(''<a class="hspl-directory-card hspl-directory-tone-'' || mod(l_count - 1, 8) ||',
'          ''" href="'' || apex_escape.html_attribute(l_url) || ''">'');',
'    htp.p(''<span class="hspl-directory-icon"><span class="fa '' ||',
'          apex_escape.html_attribute(l_icon) || ''" aria-hidden="true"></span></span>'');',
'    htp.p(''<span class="hspl-directory-title">'' || apex_escape.html(p_label) || ''</span>'');',
'    htp.p(''<span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span>'');',
'    htp.p(''</a>'');',
'  end render_card;',
'begin',
'  htp.p(''<section class="hspl-directory-grid" aria-label="Dashboard shortcuts">'');',
'  for r in (',
'    select myboxlabel, pageno, iconname, serialno',
'      from myboxtree_apexmenu',
'     where bossusercode = :GLOBAL_BOSSUSERCODE',
'       and companycode = :GLOBAL_COMPANYCODE',
'       and parentkey = ''BU:'' || :GLOBAL_BOSSUSERCODE || ''.C:'' || :GLOBAL_COMPANYCODE || ''.MG:134''',
'       and pageno is not null',
'     order by serialno, upper(myboxlabel)',
'  ) loop',
'    if upper(trim(r.myboxlabel)) = ''BUSINESS INSIGHTS'' then',
'      l_has_business_insights := true;',
'    end if;',
'    render_card(r.myboxlabel, r.pageno, r.iconname);',
'  end loop;',
'',
'  -- Sidebar navigation exposes this application page, but the legacy role-menu',
'  -- source can omit it. Add only the missing card and guard against duplicates.',
'  if not l_has_business_insights then',
'    render_card(''Business Insights'', 901, ''fa-line-chart'');',
'  end if;',
'',
'  if l_count = 0 then',
'    htp.p(''<div class="hspl-directory-empty"><span class="fa fa-folder-open-o" aria-hidden="true"></span><b>No pages available</b><p>Your current role has no authorized pages in this section.</p></div>'');',
'  end if;',
'  htp.p(''</section>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp.component_end;
end;
/
