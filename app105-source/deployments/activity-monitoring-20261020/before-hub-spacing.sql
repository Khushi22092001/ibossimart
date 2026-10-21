
prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
end;
/

prompt APPLICATION 105 - Imart
--
-- Application Export:
--   Application:     105
--   Name:            Imart
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 826
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00826
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>826);
end;
/
prompt --application/pages/page_00826
begin
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
'</script>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'/* Dashboard filter first paint 20261003 */',
'(function(){function reveal(){requestAnimationFrame(function(){requestAnimationFrame(function(){document.documentElement.classList.add(''hspl-dash-filter-ready'');});});}if(window.apex&&apex.jQuery){apex.jQuery(reveal);}else if(document.readyState!==''l'
||'oading''){reveal();}else{document.addEventListener(''DOMContentLoaded'',reveal,{once:true});}window.addEventListener(''load'',reveal,{once:true});})();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'/* Dashboard filter first paint 20261003: reserve layout until widgets finish. */',
'html:not(.hspl-dash-filter-ready) .ds-dash-filters,',
'html:not(.hspl-dash-filter-ready) .ds-filterdrawer,',
'html:not(.hspl-dash-filter-ready) #t_Body_actions {visibility:hidden!important;pointer-events:none!important;}',
'',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
''))
,p_step_template=>wwv_flow_imp.id(95002006100926)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610209999000)
,p_plug_name=>'Activity Monitoring shortcut'
,p_static_id=>'activity-monitoring-shortcut'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' if imart_audit.can_inquire then',
' htp.p(''<section class="hspl-directory-grid" aria-label="Activity Monitoring dashboard shortcut"><a class="hspl-directory-card hspl-directory-tone-4 hspl-dashboard-card" data-hspl-card-index="5" href="''||apex_escape.html_attribute(apex_page.get_url(p'
||'_page=>1100))||''"><span class="hspl-directory-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></span><span class="hspl-directory-title">Activity Monitoring</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true'
||unistr('"></span><span class="hspl-dashboard-description">Review recorded ERP activity, audit changes and management reports.</span><span class="hspl-dashboard-meta">ACTIVITY \00B7 AUDIT \00B7 MIS</span></a></section>'');'),
' end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95002006300826)
,p_plug_name=>'Header initial approved identity'
,p_static_id=>'header-initial-approved-identity'
,p_region_name=>'imart-initial-header-826'
,p_region_attributes=>'style="display:contents"'
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="hspl-hero-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"></path><p'
||'ath d="M14 3v5h5M9 13h6M9 17h6M9 9h1"></path></svg></div><div class="hspl-title-block"><h1 class="hspl-page-title">Dashboard</h1><p class="hspl-page-desc">Move directly to the dashboards available for your role.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
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
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
