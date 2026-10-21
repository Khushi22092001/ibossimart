
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
--   Export Type:     Component Export
--   Manifest
--     PAGE: 76
--     PAGE: 77
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/pages/delete_00076
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>76);
end;
/
prompt --application/pages/page_00076
begin
wwv_flow_imp_page.create_page(
 p_id=>76
,p_name=>'Module Location List'
,p_alias=>'MODULE-LOCATION-LIST'
,p_step_title=>'Module Location List'
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
'<!-- IMART_REGISTER_INITIAL_PAINT_20261006: only register page 76 -->',
'<style id="imart-register-initial-paint-76">',
'',
'html.page-76 #R583680671318364752 .a-IRR-table th.a-IRR-header{font-size:10.5px!important;font-weight:700!important;letter-spacing:.08em!important;line-height:1.35!important;padding:7px 12px!important;border:1px solid #e7e9f0!important;background-col'
||'or:#e6e8f7!important}',
'html.page-76 #R583680671318364752 .a-IRR-table th.a-IRR-header .a-IRR-headerLink{font-size:10.5px!important;font-weight:700!important;letter-spacing:.08em!important;color:#5b5bd6!important}',
'html.page-76 #R583680671318364752 .a-IRR-table tbody td{font-size:12px!important;padding:7px 12px!important;border:1px solid #e7e9f0!important;line-height:1.32!important}',
'html.page-76 #R583680671318364752 .a-IRR-table td:not(:has(input,select,textarea,button)) :is(div,span,a):not(.fa):not(.a-Icon){font-size:inherit!important}',
'html.page-76 #R583680671318364752 .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]){background-color:#f3f6fc!important}',
'html.page-76 #R583680671318364752 .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]){background-color:#fff!important}',
'',
'/* IMART106_HEADER_LABEL_CENTER: keep existing link height/padding/colors. */',
'html.page-76 #R583680671318364752 .a-IRR-table th.a-IRR-header > .a-IRR-headerLink{display:block!important;align-content:center!important;}',
'html.page-76 #R583680671318364752 .a-IRR-table th.a-IRR-header.u-tR > .a-IRR-headerLink{justify-content:flex-end;}',
'html.page-76 #R583680671318364752 .a-IRR-table th.a-IRR-header.u-tC > .a-IRR-headerLink{justify-content:center;}',
'</style>',
'',
'<!-- IMART_REGISTER_STATIC_TRACKS_20261006 -->',
'<link rel="stylesheet" href="/ords/#APP_FILES#imart-register-static-tracks-20261006.css" data-imart-register-tracks="76">',
'',
'<!-- IMART105_NATIVE_FILL_1010_BEGIN -->',
'<style>',
'/* Length-only column math; table-cell percentage math may resolve as auto. */',
'@supports (width:1cqw) and (container-type:inline-size){',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-tableContainer{container-type:inline-size;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))){--imart-fill-base-0:0px;--imart-fill-w-0:0;--imart-fill-base-1:0px;--imart-fill-w-1:0;--imart-fill-base-2:0px;--imart-fill-w-2:0;--imart-fill-base-3:0px;--imart-fill-w-3:0;--imart-fill-base-4:0px;--imart-fill-w-4:0;--imart-fill-b'
||'ase-5:0px;--imart-fill-w-5:0;--imart-fill-total:calc(var(--imart-fill-base-0) + var(--imart-fill-base-1) + var(--imart-fill-base-2) + var(--imart-fill-base-3) + var(--imart-fill-base-4) + var(--imart-fill-base-5));--imart-fill-weight:calc(var(--imart'
||'-fill-w-0) + var(--imart-fill-w-1) + var(--imart-fill-w-2) + var(--imart-fill-w-3) + var(--imart-fill-w-4) + var(--imart-fill-w-5));}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th[id="R583680671318364752_LINK"]){--imart-fill-base-0:48px;--imart-fill-w-0:0;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th[id="C497676474573873408"]){--imart-fill-base-1:200px;--imart-fill-w-1:0;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):not(:has(th:is([id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C497676934104873412"]))):has(th[id="C497676474573873408"]){--imart-fill-w-1:1;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th[id="C497676650169873409"]){--imart-fill-base-2:240px;--imart-fill-w-2:2;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):not(:has(th:is([id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C497676934104873412"]))):has(th[id="C497676650169873409"]){--imart-fill-w-2:1;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th[id="C497676729339873410"]){--imart-fill-base-3:409px;--imart-fill-w-3:3;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):not(:has(th:is([id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C497676934104873412"]))):has(th[id="C497676729339873410"]){--imart-fill-w-3:1;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th[id="C497676834747873411"]){--imart-fill-base-4:324px;--imart-fill-w-4:2;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):not(:has(th:is([id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C497676934104873412"]))):has(th[id="C497676834747873411"]){--imart-fill-w-4:1;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th[id="C497676934104873412"]){--imart-fill-base-5:220px;--imart-fill-w-5:1;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):not(:has(th:is([id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C497676934104873412"]))):has(th[id="C497676934104873412"]){--imart-fill-w-5:1;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))):has(th:is([id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C497676934104873412"])){width:max(100cqw,var(--imart-fill-total))!important;min-width:var(--imart-fill-tot'
||'al)!important;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))) :is(th[id="R583680671318364752_LINK"],td[headers~="R583680671318364752_LINK"]){width:max(48px,calc(48px + max(0px,100cqw - var(--imart-fill-total))*var(--imart-fill-w-0)/max(1,var(--imart-fill-weight))))!important;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))) :is(th[id="C497676474573873408"],td[headers~="C497676474573873408"]){width:max(200px,calc(200px + max(0px,100cqw - var(--imart-fill-total))*var(--imart-fill-w-1)/max(1,var(--imart-fill-weight))))!important;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))) :is(th[id="C497676650169873409"],td[headers~="C497676650169873409"]){width:max(240px,calc(240px + max(0px,100cqw - var(--imart-fill-total))*var(--imart-fill-w-2)/max(1,var(--imart-fill-weight))))!important;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))) :is(th[id="C497676729339873410"],td[headers~="C497676729339873410"]){width:max(409px,calc(409px + max(0px,100cqw - var(--imart-fill-total))*var(--imart-fill-w-3)/max(1,var(--imart-fill-weight))))!important;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))) :is(th[id="C497676834747873411"],td[headers~="C497676834747873411"]){width:max(324px,calc(324px + max(0px,100cqw - var(--imart-fill-total))*var(--imart-fill-w-4)/max(1,var(--imart-fill-weight))))!important;}',
'html.page-76 #R583680671318364752.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R583680671318364752_LINK"],[id="C497676474573873408"],[id="C497676650169873409"],[id="C497676729339873410"],[id="C497676834747873411"],[id="C4976'
||'76934104873412"])))) :is(th[id="C497676934104873412"],td[headers~="C497676934104873412"]){width:max(220px,calc(220px + max(0px,100cqw - var(--imart-fill-total))*var(--imart-fill-w-5)/max(1,var(--imart-fill-weight))))!important;}',
'}',
'</style>',
'<!-- IMART105_NATIVE_FILL_1010_END -->'))
,p_javascript_file_urls=>'#APP_FILES#imart-register-finder-all.js?initial105=1&v=20261005a'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'/* IMART_REGISTER_FINDER_ALL_V1 */',
'IMARTRegisterFinder.init({"pageId":76,"regionSelector":"#R583680671318364752","process":"IMART_REGISTER_RECORD_FINDER_ALL","title":"Search Module Location Records","placeholder":"Search module location records...","description":"Type to find and open'
||' any module location available to your user","columns":[{"key":"record","label":"Module Location No","width":"39.0%"},{"key":"code","label":"Code","width":"18.6%"},{"key":"description","label":"Description","width":"42.4%"}]});',
'/* IMART_COMPLETED_76_0_INITIAL_COLLAPSE: native presentation only. */',
'(function(){',
' var panel=document.getElementById(''R583680671318364752_control_panel'');',
' if(!panel)return;',
' apex.theme.closeRegion(''R583680671318364752_control_panel'');',
' document.getElementById(''R583680671318364752'').setAttribute(''data-imart-initial-collapse'',''ready'');',
'})();',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
'#APP_FILES#imart-register-finder-all.css?v=20261005a'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
'',
'/* IMART_MASTER_CARD_COMPACT_20261005: ONLY master list 76; existing KPIs, maximum four desktop tracks. */',
'html #t_Body_content #mr-register-kpis-76{margin:0 0 3px!important;padding:6px 8px!important;border-radius:10px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(min(100%,270px),270px))!important;grid-auto-columns:auto!important;max-width:1104px!important;justify-content:start!important;g'
||'ap:8px!important;min-height:0!important;align-items:start!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-inline-kpi{box-sizing:border-box!important;width:100%!important;min-width:0!important;max-width:none!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!im'
||'portant;border-radius:9px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-card-icon{width:26px!important;height:26px!important;border-radius:8px!important;font-size:14px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-inline-kpi strong{margin:0!important;font-size:22px!important;line-height:1!important;letter-spacing:-.3px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}',
'@media(max-width:580px){html #t_Body_content #mr-register-kpis-76 .mr-kpi-grid{grid-template-columns:minmax(0,270px)!important}}',
'',
'/* IMART_COMPLETED_76_0_REGISTER_PREVIEW_V1: ONLY KPI group mr-register-kpis-76. Initial native disclosure, no delayed collapse. */',
'#imart-register-76-breadcrumb{margin:0 0 3px;padding:0 2px;color:#64748b;font-size:11px;line-height:18px}',
'#imart-register-76-breadcrumb ol{display:flex;align-items:center;flex-wrap:wrap;gap:7px;list-style:none;padding:0;margin:0}',
'#imart-register-76-breadcrumb li+li::before{content:"/";margin-right:7px;color:#94a3b8}',
'#imart-register-76-breadcrumb [aria-current="page"]{color:#334155;font-weight:600}',
'#imart-register-76-kpi-disclosure{margin:0 0 3px;border:1px solid #e0e5f2;border-radius:10px;background:linear-gradient(120deg,#fff 65%,#faf9ff)}',
'#imart-register-76-kpi-disclosure>summary{display:flex;align-items:center;gap:8px;min-height:34px;padding:7px 11px;box-sizing:border-box;cursor:pointer;list-style:none;font-size:12px;font-weight:600;color:#596781}',
'#imart-register-76-kpi-disclosure>summary::-webkit-details-marker{display:none}',
'#imart-register-76-kpi-disclosure>summary>.fa{color:#6658d7;font-size:14px}',
'#imart-register-76-kpi-disclosure>summary:focus-visible{outline:2px solid #6658d7;outline-offset:2px;border-radius:9px}',
'#imart-register-76-kpi-disclosure .imart-register-76-kpi-caption{font-size:11px;font-weight:400;color:#8790a3;margin-left:6px}',
'#imart-register-76-kpi-disclosure .imart-register-76-kpi-show,#imart-register-76-kpi-disclosure .imart-register-76-kpi-hide{margin-left:auto;font-size:11px;color:#6658d7}',
'#imart-register-76-kpi-disclosure .imart-register-76-kpi-hide{display:none}',
'#imart-register-76-kpi-disclosure[open] .imart-register-76-kpi-show{display:none}',
'#imart-register-76-kpi-disclosure[open] .imart-register-76-kpi-hide{display:inline}',
'#imart-register-76-kpi-disclosure .imart-register-76-kpi-chevron{width:6px;height:6px;border-right:1.5px solid currentColor;border-bottom:1.5px solid currentColor;transform:rotate(45deg);margin:0 3px 3px 6px}',
'#imart-register-76-kpi-disclosure[open] .imart-register-76-kpi-chevron{transform:rotate(225deg);margin-bottom:0}',
'html #t_Body_content #mr-register-kpis-76{margin:0!important;border:0!important;box-shadow:none!important;padding:4px 8px 6px!important;background:transparent!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(min(100%,270px),270px))!important;grid-auto-columns:auto!important;max-width:1104px!important;justify-content:start!important;g'
||'ap:8px!important;min-height:0!important;align-items:start!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-inline-kpi{box-sizing:border-box!important;width:100%!important;min-width:0!important;max-width:none!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!im'
||'portant;border-radius:9px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-card-icon{width:26px!important;height:26px!important;border-radius:8px!important;font-size:14px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-inline-kpi strong{margin:0!important;font-size:22px!important;line-height:1!important;letter-spacing:-.3px!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}',
'html #t_Body_content #mr-register-kpis-76 .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}',
'/* Report highlight settings stay native and available. Collapse initial content before native initialization; expansion restores it. */',
'#R583680671318364752:not([data-imart-initial-collapse="ready"]) #R583680671318364752_control_panel>.a-MediaBlock-content{display:none!important}',
'#R583680671318364752:not([data-imart-initial-collapse="ready"]) #R583680671318364752_control_panel>.a-IRR-reportSummaryContainer{display:block!important}',
'',
'/* IMART_COMPLETED_76_0_NATIVE_COLLAPSED_SUMMARY_V1: retain the native highlight summary when initialized closed. */',
'#R583680671318364752_control_panel.is-collapsed>.a-IRR-reportSummaryContainer{display:block!important}',
'',
'@media(max-width:580px){html #t_Body_content #mr-register-kpis-76 .mr-kpi-grid{grid-template-columns:minmax(0,270px)!important}}',
'',
'/* IMART_KPI_POINTER_FOCUS_20261005: only existing KPI summary controls. */',
'html #t_Body_content #imart-register-76-kpi-disclosure>summary,',
'html #t_Body_content #imart-register-76-kpi-disclosure>summary *{user-select:none;-webkit-user-select:none}',
'html #t_Body_content #imart-register-76-kpi-disclosure>summary:focus:not(:focus-visible){outline:none!important;box-shadow:none!important}',
''))
,p_step_template=>wwv_flow_imp.id(95002006000005)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(583680671318364752)
,p_plug_name=>'Module Location List'
,p_static_id=>'module-location-list'
,p_region_css_classes=>'imart-register-data imart-sizing-off'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mr_source.* from (select ',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.MODULECODE Order By A.MODULECODE) = 1 Then',
'          A.MODULECODE',
'         Else',
'          Null',
'       End MODULECODE,',
'      Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.MODULECODE , d.locationname Order By A.MODULECODE , d.locationname) = 1 Then',
'          d.locationname',
'         Else',
'          Null',
'       End locationname,',
'       A.REMARK,',
'       A.CREATOR,',
'       to_char(A.CREATIONTIME,''DD-MM-YYYY HH24:MI:SS'') CREATIONTIME,',
'       A.TNO,',
'       A.COMPANYCODE,',
'       B.COMPANYNAME,',
'        C.LOCATIONCODE',
'  from MODULELOCATION A,  COMPANY B, MODULELOCATIONDETAIL C, LOCATION D',
'  WHERE A.COMPANYCODE = B.COMPANYCODE(+)',
'    and A.TNO = C.TNO(+)',
'    and c.locationcode = d.locationcode(+)',
'    and a.companycode = :GLOBAL_COMPANYCODE',
'  Order By A.MODULECODE  , d.locationname desc',
') mr_source where ((select imart_register_kpis.selected_mode(76) from dual)=''ALL'' or ((select imart_register_kpis.selected_mode(76) from dual)=''STATUS'' and nvl(trim(cast((select ds.documentstatuscode from documentstatusdetail ds where ds.modulecode='''
||'MODULELOCATION'' and ds.moduletno=mr_source.TNO fetch first 1 row only) as varchar2(4000))),chr(1))=nvl((select imart_register_kpis.selected_status(76) from dual),chr(1))) or ((select imart_register_kpis.selected_mode(76) from dual)=''RECENT'' and exist'
||'s(select 1 from MODULELOCATION mr_created where mr_created.TNO=mr_source.TNO and mr_created.CREATIONTIME >= sysdate-7 and mr_created.CREATIONTIME <= sysdate)) or ((select imart_register_kpis.selected_mode(76) from dual)=''MINE'' and exists(select 1 fro'
||'m MODULELOCATION mr_created where mr_created.TNO=mr_source.TNO and upper(trim(mr_created.CREATOR))=upper(trim(:APP_USER)))))'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Module Location List'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(497676428645873407)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.::P77_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>58691559446175423
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497677105716873414)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497677241583873415)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Companyname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497676934104873412)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>110
,p_column_identifier=>'E'
,p_column_label=>'Creationtime'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497676834747873411)
,p_db_column_name=>'CREATOR'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Creator'
,p_column_html_expression=>'<span class="imart-text-value" title="#CREATOR!ATTR#">#CREATOR!HTML#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497677339087873416)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497676650169873409)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Locationname'
,p_column_html_expression=>'<span class="imart-text-value" title="#LOCATIONNAME!ATTR#">#LOCATIONNAME!HTML#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497676474573873408)
,p_db_column_name=>'MODULECODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497676729339873410)
,p_db_column_name=>'REMARK'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Remark'
,p_column_html_expression=>'<span class="imart-long-value" title="#REMARK!ATTR#">#REMARK!HTML#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(497677042205873413)
,p_db_column_name=>'TNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(498705994628813733)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'597212'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULECODE:LOCATIONNAME:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026100200007600)
,p_plug_name=>'Master KPI Cards'
,p_static_id=>'mr-kpi-shell-76'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>9
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin htp.p(q''^<style>.mr-register-kpis[hidden]{display:none!important}',
'button[aria-controls^="mr-register-kpis-"]{display:inline-flex;align-items:center;justify-content:center;gap:7px;margin-right:4px;padding:8px 11px!important;min-height:0;border:1px solid #c5bfee!important;border-radius:9px!important;background:linear'
||'-gradient(135deg,#fff,#f5f3ff)!important;color:#6255d7!important;font-weight:600!important;font-size:13px!important;box-shadow:0 2px 5px #5846c80c!important}',
'button[aria-controls^="mr-register-kpis-"]::before{content:"";display:block;flex:none;width:15px;height:15px;background:linear-gradient(currentColor,currentColor) left bottom/3px 7px no-repeat,linear-gradient(currentColor,currentColor) center bottom/'
||'3px 13px no-repeat,linear-gradient(currentColor,currentColor) right bottom/3px 10px no-repeat}',
'button[aria-controls^="mr-register-kpis-"]:hover{border-color:#9687e7!important;background:#eeebff!important}',
'button[aria-controls^="mr-register-kpis-"][aria-expanded="true"]{border-color:#a89de6!important;background:#f2efff!important;color:#5846c8!important}',
'button[aria-controls^="mr-register-kpis-"]:focus-visible{outline:2px solid #6658d7;outline-offset:3px}',
'.mr-register-kpis{margin:0 0 18px;padding:22px;border:1px solid #e0e5f2;border-radius:18px;background:linear-gradient(120deg,#fff 65%,#faf9ff);box-shadow:0 4px 18px #24336205}',
'.mr-register-kpis header{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;margin-bottom:20px}',
'.mr-register-kpis .mr-kpi-heading{display:flex;align-items:center;gap:13px;min-width:0}',
'.mr-register-kpis .mr-kpi-heading-icon{display:grid;place-items:center;width:44px;height:44px;flex:none;border-radius:13px;background:#eeecff;color:#6255d7;font-size:20px}',
'.mr-register-kpis .mr-kpi-eyebrow{font-size:10px;font-weight:700;letter-spacing:1.4px;color:#847baf;display:block;margin-bottom:5px}',
'.mr-register-kpis h2{font-size:19px;font-weight:700;line-height:1.3;color:#202a43;margin:0}',
'.mr-register-kpis .mr-kpi-subtitle{font-size:12px;color:#79849b;margin:5px 0 0}',
'.mr-register-kpis .mr-kpi-close{display:flex;align-items:center;gap:7px;flex:none;border:1px solid #e2e5f0;border-radius:9px;padding:8px 12px;background:#fff;color:#657089;font:inherit;font-size:12px;cursor:pointer}',
'.mr-register-kpis .mr-kpi-close:hover{color:#5d50d2;border-color:#bcb5ee;background:#faf9ff}',
'.mr-register-kpis .mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:14px}',
'.mr-register-kpis .mr-inline-kpi{--kpi-accent:#6658d7;--kpi-tint:#efedff;--kpi-line:#e3defb;position:relative;overflow:hidden;display:flex;flex-direction:column;gap:0;min-width:0;width:100%;padding:17px 18px 14px;border:1px solid var(--kpi-line);bord'
||'er-radius:13px;background:linear-gradient(125deg,#fff,var(--kpi-tint));font-family:inherit;text-align:left;cursor:pointer;color:#202a43;box-shadow:0 2px 5px #24336203}',
'.mr-register-kpis .mr-inline-kpi[data-tone="success"]{--kpi-accent:#198a68;--kpi-tint:#edf9f3;--kpi-line:#d8eee4}',
'.mr-register-kpis .mr-inline-kpi[data-tone="warning"]{--kpi-accent:#b87b19;--kpi-tint:#fff8e9;--kpi-line:#f0e4c7}',
'.mr-register-kpis .mr-inline-kpi[data-tone="danger"]{--kpi-accent:#c55364;--kpi-tint:#fff0f2;--kpi-line:#f2dce2}',
'.mr-register-kpis .mr-inline-kpi[data-tone="neutral"]{--kpi-accent:#738099;--kpi-tint:#f2f5fa;--kpi-line:#e0e5ee}',
'.mr-register-kpis .mr-inline-kpi[data-tone="info"]{--kpi-accent:#397db7;--kpi-tint:#edf6ff;--kpi-line:#dceafa}',
'.mr-register-kpis .mr-inline-kpi:hover{border-color:var(--kpi-accent);box-shadow:0 4px 14px #2433620a}',
'.mr-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:var(--kpi-accent);box-shadow:inset 0 0 0 1px var(--kpi-accent),0 4px 14px #24336208}',
'.mr-register-kpis .mr-inline-kpi:focus-visible,.mr-register-kpis .mr-kpi-close:focus-visible{outline:2px solid #6658d7;outline-offset:3px}',
'.mr-register-kpis .mr-inline-kpi:disabled{cursor:progress;opacity:.75}',
'.mr-register-kpis .mr-kpi-card-top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:10px}',
'.mr-register-kpis .mr-kpi-status{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;color:#606d85}',
'.mr-register-kpis .mr-kpi-status::before{content:"";width:6px;height:6px;border-radius:50%;background:var(--kpi-accent);flex:none}',
'.mr-register-kpis .mr-kpi-card-icon{display:grid;place-items:center;flex:none;width:31px;height:31px;border:1px solid var(--kpi-line);border-radius:9px;background:#ffffffb3;color:var(--kpi-accent);font-size:16px}',
'.mr-register-kpis .mr-inline-kpi strong{font-size:32px;line-height:1.15;font-weight:700;letter-spacing:-.8px;color:#202a43;margin-bottom:5px}',
'.mr-register-kpis .mr-kpi-share{font-size:11px;color:#8790a3;margin-bottom:13px}',
'.mr-register-kpis .mr-kpi-card-bottom{display:flex;justify-content:space-between;align-items:center;border-top:1px solid var(--kpi-line);padding-top:10px;gap:10px;color:var(--kpi-accent);font-size:11px;font-weight:600}',
'.mr-register-kpis .mr-kpi-selected{display:none}',
'.mr-register-kpis [aria-pressed="true"] .mr-kpi-selected{display:inline}',
'.mr-register-kpis [aria-pressed="true"] .mr-kpi-unselected{display:none}',
'.mr-register-kpis .mr-kpi-method{margin-top:13px;color:#8790a3;font-size:11px}',
'.mr-register-kpis .mr-kpi-method summary{cursor:pointer;list-style:none;display:inline-flex;align-items:center;gap:6px}',
'.mr-register-kpis .mr-kpi-method summary::-webkit-details-marker{display:none}',
'.mr-register-kpis .mr-kpi-method p{font-size:11px;line-height:1.6;color:#738099;margin:8px 0 0;max-width:1000px}',
'.mr-register-kpis .mr-kpi-card-body{display:flex;align-items:flex-start;gap:17px;position:relative;padding:3px 0 0;min-height:100px}',
'.mr-register-kpis .mr-kpi-card-details{display:flex;flex-direction:column;min-width:0;position:relative;z-index:1}',
'.mr-register-kpis .mr-kpi-card-icon{width:45px;height:45px;border:0;border-radius:16px;background:var(--kpi-tint);font-size:24px}',
'.mr-register-kpis .mr-kpi-status{font-size:13px;margin:5px 0 8px}',
'.mr-register-kpis .mr-kpi-status::before{display:none}',
'.mr-register-kpis .mr-kpi-share{margin-bottom:13px}',
'.mr-register-kpis .mr-kpi-wave{position:absolute;right:0;bottom:18px;width:105px;height:39px;color:var(--kpi-accent);opacity:.65;pointer-events:none}',
'.mr-register-kpis .mr-kpi-wave svg{display:block;width:100%;height:100%}',
'@media(max-width:1000px){.mr-register-kpis .mr-kpi-wave{width:75px;opacity:.35}}',
'@media(max-width:650px){.mr-register-kpis{padding:16px}.mr-register-kpis h2{font-size:16px}.mr-register-kpis .mr-kpi-heading-icon{display:none}.mr-register-kpis .mr-kpi-grid{gap:10px}.mr-register-kpis .mr-inline-kpi{padding:13px}.mr-register-kpis .mr'
||'-inline-kpi strong{font-size:27px}.mr-register-kpis .mr-kpi-card-top{flex-wrap:wrap;gap:6px}}',
'@media(max-width:380px){.mr-register-kpis .mr-kpi-grid{grid-template-columns:1fr}}',
'.mr-register-kpis{padding:12px;margin-bottom:12px}',
'.mr-register-kpis header{gap:10px;margin-bottom:10px}',
'.mr-register-kpis .mr-kpi-heading{gap:9px}',
'.mr-register-kpis .mr-kpi-heading-icon{width:32px;height:32px;border-radius:10px;font-size:17px}',
'.mr-register-kpis .mr-kpi-eyebrow{margin-bottom:2px;letter-spacing:1px}',
'.mr-register-kpis h2{font-size:16px}',
'.mr-register-kpis .mr-kpi-subtitle{margin-top:3px;font-size:11px}',
'.mr-register-kpis .mr-kpi-grid{gap:9px}',
'.mr-register-kpis .mr-inline-kpi{padding:7px 10px 6px;border-radius:10px}',
'.mr-register-kpis .mr-kpi-card-body{min-height:0;gap:8px;padding:0}',
'.mr-register-kpis .mr-kpi-card-icon{width:27px;height:27px;border-radius:9px;font-size:17px}',
'.mr-register-kpis .mr-kpi-status{font-size:11px;line-height:1.3;margin:0 0 1px}',
'.mr-register-kpis .mr-inline-kpi strong{font-size:22px;line-height:1.05;margin:0;letter-spacing:-.4px}',
'.mr-register-kpis .mr-kpi-share{font-size:10px;line-height:1.3;margin:1px 0 2px}',
'.mr-register-kpis .mr-kpi-card-bottom{padding-top:4px;gap:6px;font-size:10px;line-height:1.3}',
'.mr-register-kpis .mr-kpi-card-bottom>.fa{font-size:11px;line-height:13px}',
'.mr-register-kpis .mr-kpi-wave{width:48px;height:18px;bottom:5px;opacity:.3}',
'.mr-register-kpis .mr-kpi-method{margin-top:8px}',
'.mr-register-kpis .mr-kpi-grid{min-height:87px}',
'</style><nav id="imart-register-76-breadcrumb" aria-label="Breadcrumb"><ol><li>Home</li><li>Setup &amp; Admin</li><li aria-current="page">Module Location List</li></ol></nav><details id="imart-register-76-kpi-disclosure"><summary><span class="fa fa-b'
||'ar-chart" aria-hidden="true"></span><span>KPIs <span class="imart-register-76-kpi-caption">Record summary</span></span><span class="imart-register-76-kpi-show">Show KPIs</span><span class="imart-register-76-kpi-hide">Hide KPIs</span><span class="imar'
||'t-register-76-kpi-chevron" aria-hidden="true"></span></summary><section id="mr-register-kpis-76" class="mr-register-kpis" data-report-region="module-location-list" data-report-label="Module&#x20;Location&#x20;List" aria-label="Master KPIs"><div class'
||'="mr-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary><span class="fa fa-info-circle" aria-hidden="true"></span> How counts work</summary><p data-kpi-scope></p></details></section></details><script>(function () {',
'  ''use strict'';',
'  if (window.IMARTMasterKpis) return;',
'  var currentRequest = null;',
'  function section(page) { return document.getElementById(''mr-register-kpis-'' + page); }',
'  function reportId(root) {',
'    var id = root.dataset.reportRegion;',
'    if (id && document.getElementById(id) && apex.region(id)) return id;',
'    var reports = Array.from(document.querySelectorAll(''main .js-apex-region'')).filter(function (el) {',
'      return el.querySelector(''.a-IRR,.a-IG'') && apex.region(el.id);',
'    });',
'    var named = reports.filter(function (el) { return el.getAttribute(''aria-label'') === root.dataset.reportLabel; });',
'    return named.length === 1 ? named[0].id : reports.length === 1 ? reports[0].id : null;',
'  }',
'  function load(page) {',
'    var root = section(page);',
'    if (!root) return;',
'    if (currentRequest) currentRequest.abort();',
'    var content = root.querySelector(''[data-kpi-content]'');',
unistr('    if (!content.querySelector(''button'')) content.textContent = ''Loading KPIs\2026'';'),
'    root.setAttribute(''aria-busy'', ''true'');',
'    currentRequest = apex.server.process(''IMART_REGISTER_KPIS'', {x01: String(page)}, {',
'      dataType: ''json'', timeout: 15000,',
'      success: function (data) {',
'        root.dataset.reportRegion = reportId(root) || data.region;',
'        root.querySelector(''[data-kpi-scope]'').textContent = data.scope;',
'        content.replaceChildren();',
'        var total = Number(String(data.cards[0].value).replace(/[^0-9.-]/g, ''''));',
'        data.cards.forEach(function (card) {',
'          if (card.mode === ''STATUS'' && (card.status == null || /^NO[ _-]?STATUS$/i.test(String(card.label).trim()))) return;',
'          var el = document.createElement(''button''), label = document.createElement(''span''),',
'            value = document.createElement(''strong''), share = document.createElement(''span''),',
'            top = document.createElement(''span''), icon = document.createElement(''span''),',
'            bottom = document.createElement(''span''), action = document.createElement(''span''), arrow = document.createElement(''span''),',
'            body = document.createElement(''span''), details = document.createElement(''span''), wave = document.createElement(''span'');',
'          var status = String(card.label).toUpperCase(), tone = ''info'', iconName = ''fa-circle-o'';',
'          if (card.mode === ''ALL'') { tone = ''total''; iconName = ''fa-th-large''; }',
'          else if (card.mode === ''RECENT'') { tone = ''info''; iconName = ''fa-calendar''; }',
'          else if (card.mode === ''MINE'') { tone = ''total''; iconName = ''fa-user''; }',
'          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT/.test(status)) { tone = ''danger''; iconName = ''fa-ban''; }',
'          else if (/^ACTIVE$|CLOSED|COMPLETE|APPROV|AUTHORI/.test(status)) { tone = ''success''; iconName = ''fa-check-circle-o''; }',
'          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = ''warning''; iconName = ''fa-clock-o''; }',
'          else if (/NO STATUS/.test(status)) { tone = ''neutral''; iconName = ''fa-minus-circle''; }',
'          el.className = ''mr-inline-kpi''; el.dataset.tone = tone;',
'          label.className = ''mr-kpi-status''; label.textContent = card.mode === ''ALL'' ? ''Total records'' : card.label.replace(/[_-]/g, '' '').toLowerCase().replace(/\b\w/g, function (s) { return s.toUpperCase(); });',
'          top.className = ''mr-kpi-card-top''; icon.className = ''mr-kpi-card-icon fa '' + (card.mode === ''ALL'' ? ''fa-file-text-o'' : iconName); icon.setAttribute(''aria-hidden'', ''true'');',
'          el.type = ''button''; el.setAttribute(''aria-pressed'', String(card.selected));',
'          el.setAttribute(''aria-label'', card.label + '': '' + card.value);',
'          value.textContent = card.value; share.className = ''mr-kpi-share'';',
'          var count = Number(String(card.value).replace(/[^0-9.-]/g, ''''));',
'          share.textContent = card.note || (card.mode === ''ALL'' ? ''All records in this scope'' : (total ? (count / total * 100).toFixed(1) : ''0'') + ''% of total records'');',
'          bottom.className = ''mr-kpi-card-bottom''; action.innerHTML = ''<span class="mr-kpi-unselected">View records</span><span class="mr-kpi-selected">Showing records</span>'';',
'          arrow.className = ''fa fa-arrow-right''; arrow.setAttribute(''aria-hidden'', ''true''); bottom.append(action, arrow);',
'          el.addEventListener(''click'', function () {',
'            var buttons = content.querySelectorAll(''button'');',
'            buttons.forEach(function (b) { b.disabled = true; });',
'            apex.server.process(''IMART_KPI_STATUS_FILTER'', {x01: String(page), x02: card.mode, x03: card.status}, {',
'              dataType: ''json'', timeout: 15000,',
'              success: function () {',
'                buttons.forEach(function (b) { b.setAttribute(''aria-pressed'', String(b === el)); });',
'                var id = reportId(root), report = id && apex.region(id);',
'                if (id) root.dataset.reportRegion = id;',
'                if (report) report.refresh();',
'                else apex.message.alert(''The register could not be refreshed. Please reload this page.'');',
'              },',
'              error: function () { apex.message.alert(''KPI filter could not be applied. Please retry.''); },',
'              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }',
'            });',
'          });',
'          details.className = ''mr-kpi-card-details''; details.append(label, value, share);',
'          body.className = ''mr-kpi-card-body''; body.append(icon, details);',
'          wave.className = ''mr-kpi-wave''; wave.setAttribute(''aria-hidden'', ''true'');',
'          wave.innerHTML = ''<svg viewBox="0 0 120 44" fill="none" focusable="false"><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13" stroke="currentColor" stroke-width="1.2"/><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72'
||' 9 84 19 S98 26 119 13 V44 H1 Z" fill="currentColor" opacity=".06"/></svg>'';',
'          body.append(wave); el.append(body, bottom); content.append(el);',
'        });',
'      },',
'      error: function (request, status) {',
'        if (status !== ''abort'' && !content.querySelector(''.mr-inline-kpi'')) {',
'          content.textContent = ''KPIs could not be loaded. '';',
'          var retry = document.createElement(''button'');',
'          retry.type = ''button''; retry.textContent = ''Retry'';',
'          retry.addEventListener(''click'', function () { load(page); });',
'          content.append(retry);',
'        }',
'      },',
'      complete: function () { currentRequest = null; root.removeAttribute(''aria-busy''); }',
'    });',
'  }',
'  function listen() {',
'    var initial = document.querySelector(''.mr-register-kpis'');',
'    if (initial) load(Number(initial.id.replace(''mr-register-kpis-'', '''')));',
'    apex.jQuery(document).on(''apexafterrefresh.imartMasterKpis'', ''.js-apex-region'', function () {',
'    var root = document.querySelector(''.mr-register-kpis'');',
'    if (!root) return;',
'    var page = Number(root.id.replace(''mr-register-kpis-'', ''''));',
'    if (root.dataset.reportRegion === this.id) load(page);',
'  }); }',
'  window.IMARTMasterKpis = {reload: load};',
'  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', listen, {once: true});',
'  else listen();',
'})();',
'</script>^'');end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>'begin for r in (select module_code from imart_mr_catalog where register_page=:APP_PAGE_ID) loop if imart_master_reports.allowed(r.module_code)=1 then return true; end if; end loop; return false; end;'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95002006010076)
,p_plug_name=>'Register initial approved title'
,p_static_id=>'register-initial-approved-title'
,p_region_name=>'imart-initial-title-76'
,p_region_attributes=>'style="display:contents"'
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="hspl-hero-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"></path><p'
||'ath d="M14 3v5h5M9 13h6M9 17h6M9 9h1"></path></svg></div><div class="hspl-title-block"><h1 class="hspl-page-title">Module Location List</h1></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583683730670364753)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(583680671318364752)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:77:&APP_SESSION.::&DEBUG.:77::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583687205019378643)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(583680671318364752)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(581194897827297365)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583683730670364753)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(581195040710297366)
,p_event_id=>wwv_flow_imp.id(581194897827297365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(583680671318364752)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583683990997364753)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(583680671318364752)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583684542831364753)
,p_event_id=>wwv_flow_imp.id(583683990997364753)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(583680671318364752)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2026100502000076)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART_REGISTER_RECORD_FINDER_ALL'
,p_static_id=>'imart-register-record-finder-all'
,p_process_sql_clob=>'begin IMART_REGISTER_FINDER.search;end;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2026100502000076
);
end;
/
prompt --application/pages/delete_00077
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>77);
end;
/
prompt --application/pages/page_00077
begin
wwv_flow_imp_page.create_page(
 p_id=>77
,p_name=>'Module Location Master'
,p_alias=>'MODULE-LOCATION-MASTER'
,p_page_mode=>'MODAL'
,p_step_title=>'Module Location Master'
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
,p_css_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'900'
,p_dialog_chained=>'N'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(583676263033364748)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(590603838027368057)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       LOCATIONCODE,',
'       REMARK,',
'       SNO',
'  from MODULELOCATIONDETAIL',
'  where tno = :P77_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P77_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detail'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590604525273368064)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590604617437368065)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590604069676368060)
,p_name=>'LOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select locationname , locationcode from location'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590604220314368061)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590604357251368063)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590604323359368062)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590603952303368059)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P77_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(590603944584368058)
,p_internal_uid=>150217599333441534
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(591180533824830476)
,p_interactive_grid_id=>wwv_flow_imp.id(590603944584368058)
,p_static_id=>'1507942'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(591180728871830476)
,p_report_id=>wwv_flow_imp.id(591180533824830476)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591181192117830477)
,p_view_id=>wwv_flow_imp.id(591180728871830476)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(590603952303368059)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591182130400830479)
,p_view_id=>wwv_flow_imp.id(591180728871830476)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(590604069676368060)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591183041377830482)
,p_view_id=>wwv_flow_imp.id(591180728871830476)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(590604220314368061)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591183899468830484)
,p_view_id=>wwv_flow_imp.id(591180728871830476)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(590604323359368062)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591184797689830489)
,p_view_id=>wwv_flow_imp.id(591180728871830476)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(590604357251368063)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591185712739830491)
,p_view_id=>wwv_flow_imp.id(591180728871830476)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(590604525273368064)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(861347523830133306)
,p_plug_name=>'Fields'
,p_static_id=>'fields'
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(726929244575615139)
,p_plug_name=>'Module Location Master'
,p_static_id=>'module-location-master'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       MODULECODE,',
'       REMARK,',
'       CREATOR,',
'       CREATIONTIME',
'  from MODULELOCATION'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583697588678401381)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583698758734401382)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583697951338401382)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583699574660401382)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583700013462401382)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Flow'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P2_TNO1.'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583699238385401382)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583700789083401382)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583698413339401382)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583700354246401382)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Status'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P77_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861464299194012989)
,p_name=>'P77_CALLEDFROMPAGE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_item_default=>'2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(726933903874615142)
,p_name=>'P77_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_source_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(726935526267615143)
,p_name=>'P77_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_source_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_default=>'select to_char(sysdate,''DD-MM-YYYY HH24:MI:SS'') from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Creation Time'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_display_when=>'P77_MODULECODE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(726935162541615143)
,p_name=>'P77_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_source_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_default=>'select :GLOBAL_LOGINNAME from Dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Creator'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861465876699032397)
,p_name=>'P77_FORMSTATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000771)
,p_name=>'P77_IMART_SAVE_OP_ID'
,p_item_sequence=>999999
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000775)
,p_name=>'P77_IMART_STATUS_DONE'
,p_item_sequence=>1000002
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000774)
,p_name=>'P77_IMART_STATUS_START'
,p_item_sequence=>1000001
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000776)
,p_name=>'P77_IMART_WORKFLOW_START'
,p_item_sequence=>1000003
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(726934368899615142)
,p_name=>'P77_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_source_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_prompt=>'Module Code'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        A.MODULENAME, ',
'        A.MODULECODE ',
'        FROM MODULE A ',
'        ORDER BY A.MODULECODE DESC'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861465468705029035)
,p_name=>'P77_MODULEFLOW'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861465181417025158)
,p_name=>'P77_ONTHETABLE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861464818460020579)
,p_name=>'P77_PASSFAILREMARK'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(726934767917615142)
,p_name=>'P77_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_source_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861466191275034670)
,p_name=>'P77_STATUS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P2_TNO1), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861464572544015310)
,p_name=>'P77_STATUSRIGHT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(861347523830133306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(726933515311615141)
,p_name=>'P77_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_item_source_plug_id=>wwv_flow_imp.id(726929244575615139)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583717579182427135)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583697588678401381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583717989262427135)
,p_event_id=>wwv_flow_imp.id(583717579182427135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583722234134444818)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583722553412444819)
,p_event_id=>wwv_flow_imp.id(583722234134444818)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583697951338401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583723074137444819)
,p_event_id=>wwv_flow_imp.id(583722234134444818)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583697951338401382)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P77_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583723584512444819)
,p_event_id=>wwv_flow_imp.id(583722234134444818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583697951338401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583727118559446463)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583728038872446464)
,p_event_id=>wwv_flow_imp.id(583727118559446463)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583700789083401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583727448477446463)
,p_event_id=>wwv_flow_imp.id(583727118559446463)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583700789083401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583724015074445338)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583724859117445339)
,p_event_id=>wwv_flow_imp.id(583724015074445338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583698413339401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583724375103445338)
,p_event_id=>wwv_flow_imp.id(583724015074445338)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583698413339401382)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P77_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583725389719445339)
,p_event_id=>wwv_flow_imp.id(583724015074445338)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583698413339401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583725788894445873)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583726659219445875)
,p_event_id=>wwv_flow_imp.id(583725788894445873)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583700354246401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583726162290445874)
,p_event_id=>wwv_flow_imp.id(583725788894445873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583700354246401382)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583713840023425050)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583700354246401382)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583716229822425054)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P77_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583715712983425054)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583717200904425056)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P77_IMART_STATUS_DONE',
  'items_to_submit', 'P77_TNO,P77_STATUS,P77_IMART_SAVE_OP_ID,P77_IMART_STATUS_START',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ack_keys clob;procedure ack_business is begin',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P77_TNO,:P77_STATUS);',
    'end;begin',
    'select json_array(to_char(:P77_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.begin_status(:P77_IMART_SAVE_OP_ID,GetModuleCodeForPageNo(:APP_PAGE_ID),:P77_TNO,:P77_STATUS,''P77_TNO'',ack_keys);',
    'ack_business;',
    'imart_save_ack.finish_status(:P77_IMART_SAVE_OP_ID);',
    ':P77_IMART_STATUS_DONE:=:P77_IMART_SAVE_OP_ID;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583714188352425050)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''#STATUS span'').text($v(''P77_STATUS''));')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583714665269425053)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583715179820425053)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583716669558425054)
,p_event_id=>wwv_flow_imp.id(583713840023425050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P77_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583720422697444123)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583720787463444124)
,p_event_id=>wwv_flow_imp.id(583720422697444123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583699238385401382)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P77_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583721277952444124)
,p_event_id=>wwv_flow_imp.id(583720422697444123)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583699574660401382)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P77_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583721779336444124)
,p_event_id=>wwv_flow_imp.id(583720422697444123)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583700013462401382)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P77_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583711414697423842)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583699574660401382)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583712280930423843)
,p_event_id=>wwv_flow_imp.id(583711414697423842)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P77_PASSFAILREMARK,P77_TNO1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						and a.ModuleTNo = :P77_TNO1',
    '						AND D.BOSSUSERNAME = :APP_USER',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100);',
    '    tModulecode Varchar2(30);',
    'begin',
    '',
    '    select DISTINCT ',
    '    	d.ModuleCode, :P130_JOBBILLNO',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = :P77_PASSFAILREMARK',
    '				where a.TNo = vPassFail.TNo;',
    '				',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583712826906423843)
,p_event_id=>wwv_flow_imp.id(583711414697423842)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583713303932423845)
,p_event_id=>wwv_flow_imp.id(583711414697423842)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583711818352423842)
,p_event_id=>wwv_flow_imp.id(583711414697423842)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P77_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583709056200422836)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583699238385401382)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583710029749422836)
,p_event_id=>wwv_flow_imp.id(583709056200422836)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P77_IMART_STATUS_DONE',
  'items_to_submit', 'P77_PASSFAILREMARK,P77_TNO1,P77_IMART_SAVE_OP_ID,P77_TNO,P77_IMART_WORKFLOW_START',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ack_keys clob;procedure ack_business is begin',
    'DECLARE',
    '  tModuleCode  Varchar2(30) := GetModuleCodeForPageNo(:APP_PAGE_ID);',
    '  TMP          vARCHAR2(100) ;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P77_TNO1',
    '				AND D.BOSSUSERNAME = :APP_USER',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select DISTINCT ',
    '    	d.ModuleCode, :P130_JOBBILLNO',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = :P77_PASSFAILRREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, :P77_TNO1 , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;',
    'end;begin',
    'select json_array(to_char(:P77_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.begin_v2(:P77_IMART_SAVE_OP_ID,''P77_TNO'',ack_keys,''STATUS'');',
    'ack_business;',
    'select json_array(to_char(:P77_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.finish_v2(:P77_IMART_SAVE_OP_ID,ack_keys);',
    ':P77_IMART_STATUS_DONE:=:P77_IMART_SAVE_OP_ID;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583710538570422837)
,p_event_id=>wwv_flow_imp.id(583709056200422836)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583710974655422837)
,p_event_id=>wwv_flow_imp.id(583709056200422836)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583709468257422836)
,p_event_id=>wwv_flow_imp.id(583709056200422836)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P77_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583680103622364751)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(583697951338401382)
,p_internal_uid=>143293758371438227
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(590604795443368067)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from MODULELOCATIONDETAIL',
'where tno = :P77_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(583697951338401382)
,p_internal_uid=>150218450192441543
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(590604707152368066)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(590603838027368057)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>150218361901441542
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583718739421439879)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Form Status And TNO'
,p_static_id=>'get-form-status-and-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     if :P77_TNO is null then',
'            :P77_FORMSTATUS := ''NEWRECORD'';',
'        else',
'            :P77_FORMSTATUS := ''EDITRECORD'';',
'        end if;',
'',
'    if :P77_TNO is null then',
'',
'        select globaltno.nextval into :P77_TNO from dual;',
'',
'    end if; ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>143332394170513355
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583718995184440614)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get On The Table'
,p_static_id=>'get-on-the-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P77_MODULEFLOW := ''YES'';',
'   else',
'       :P77_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P77_TNO1 and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P77_ONTHETABLE := ''YES'' ;',
'   else',
'       :P77_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>143332649933514090
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25268389412899200)
,p_process_sequence=>95
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART_DOCUMENT_HISTORY'
,p_static_id=>'imart-document-history'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_doc varchar2(4000);l_root varchar2(128):=''MODULELOCATION'';l_record varchar2(4000);l_tno varchar2(100);l_links clob;',
' l_mode varchar2(20):=apex_application.g_x01;',
' l_key varchar2(100):=apex_application.g_x02;',
' l_after number:=to_number(apex_application.g_x03 default null on conversion error);',
' l_snapshot number:=to_number(apex_application.g_x04 default null on conversion error);',
' l_sort varchar2(10):=case when apex_application.g_x05=''OLDEST'' then ''OLDEST'' else ''NEWEST'' end;',
' l_filter varchar2(20):=nvl(apex_application.g_x06,''ALL'');',
' l_company varchar2(128);l_location varchar2(128);l_count number:=0;l_more boolean:=false;',
' l_json clob;l_pos pls_integer:=1;',
' function label_for(p_table varchar2,p_column varchar2) return varchar2 is v varchar2(500);',
' begin',
'  select max(regexp_replace(label,''<[^>]+>'','''')) into v from apex_application_page_items',
'  where application_id=105 and page_id=77 and item_source=p_column and label is not null;',
'  return coalesce(v,case p_column when ''QUANTITY1'' then ''Primary Quantity'' when ''QUANTITY2'' then ''Secondary Quantity''',
'    when ''ITEMSPECS'' then ''Item Specification'' when ''TNO'' then ''Document ID'' when ''SNO'' then ''Line ID''',
'    when ''IMART_AUDIT_ROW_ID'' then ''Audit Row ID'' when ''ITEMCODE'' then ''Item'' else initcap(replace(p_column,''_'','' '')) end);',
' end;',
' function actor_name(p_code varchar2,p_user varchar2) return varchar2 is v varchar2(255);',
' begin select max(coalesce(e.employeename,b.bossusername)) into v from bossuser b left join employee e on e.employeecode=b.employeecode',
' where b.bossusercode=p_code or (p_code is null and upper(b.loginname)=upper(p_user));',
' return coalesce(v,p_user,p_code,''Unknown user'');end;',
' function readable(p_field varchar2,p_value clob) return varchar2 is v varchar2(500);k varchar2(500):=dbms_lob.substr(p_value,500,1);',
' begin',
'  if k is null then return null;end if;',
'  case p_field',
'   when ''PARTYCODE'' then select max(partyname) into v from party where partycode=k;',
'   when ''ITEMCODE'' then select max(itemname) into v from item where itemcode=k;',
'   when ''LOCATIONCODE'' then select max(locationname) into v from location where locationcode=k;',
'   when ''DOCTYPECODE'' then select max(doctypename) into v from doctype where doctypecode=k;',
'   when ''EMPLOYEECODE'' then select max(employeename) into v from employee where employeecode=k;',
'   when ''ITEMSPECIFICATIONCODE'' then select max(itemspecificationname) into v from itemspecification where itemspecificationcode=k;',
'   else return null;',
'  end case;return v;',
' end;',
' function item_context(p_line varchar2) return varchar2 is begin return case when p_line is not null then ''Detail Line ''||p_line end;end;',
'begin',
' apex_json.initialize_clob_output;',
' apex_json.open_object;',
' if :APP_ID<>105 or :APP_PAGE_ID<>77 or not imart_audit.can_inquire then',
'  apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this user.'');',
' else',
'  begin select COMPANYCODE,cast(null as varchar2(128)),json_object(''TNO'' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')),to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,''''''),json_array(json_object(''t'' value ''MODULELOCATION'',''c'' value ''TNO'',''v'
||''' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')),json_object(''t'' value ''MODULELOCATIONDETAIL'',''c'' value ''TNO'',''v'' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) returning clob) into l_company,l_location,l_record,l_tno,l_links fr'
||'om MODULELOCATION where TNO=to_number(:P77_TNO default null on conversion error);l_doc:=l_record;',
'  exception when no_data_found then l_doc:=null;when too_many_rows then l_doc:=null;end;',
'  if l_doc is null then apex_json.write(''status'',''empty'');apex_json.write(''message'',''History is available after this record has been saved.'');',
'  elsif imart_audit.can_read(l_company,l_location)<>1 then',
'   apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this document.'');',
'  else',
'   -- A sequence boundary is not an audit row; authorize only the document''s candidate rows below.',
'   if l_snapshot is null then select nvl(max(audit_event_id),0) into l_snapshot from imart_audit_event;end if;',
'   apex_json.write(''status'',''ok'');apex_json.write(''snapshot'',to_char(l_snapshot));',
'   if l_mode=''LIST'' then',
'    apex_json.open_array(''activities'');',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     , grouped as (',
'      select activity_key,max(audit_event_id) sort_id,min(event_timestamp) first_time,max(event_timestamp) last_time,',
'      max(user_name) user_name,max(bossusercode) bossusercode,max(rawtohex(request_id)) request_id,max(transaction_id) transaction_id,',
'      sum(field_count) change_count,',
'      count(*) event_count,',
'      case when max(case when table_name=l_root and action_type=''INSERT'' and event_type=''ROW_CHANGE'' then 1 else 0 end)=1 then ''CREATED''',
'       when max(case when action_type=''APPROVE'' then 1 else 0 end)=1 then ''APPROVED''',
'       when max(case when action_type=''REJECT'' then 1 else 0 end)=1 then ''REJECTED''',
'       when max(case when action_type=''CANCEL'' then 1 else 0 end)=1 then ''CANCELLED''',
'       when max(case when table_name=l_root and action_type=''DELETE'' then 1 else 0 end)=1 then ''DELETED''',
'       when max(case when action_type=''SUBMIT'' then 1 else 0 end)=1 and max(case when event_type=''ROW_CHANGE'' then 1 else 0 end)=0 then ''SUBMITTED''',
'       else ''UPDATED'' end activity_type',
'      from eligible e group by activity_key',
'     ) select * from grouped where (l_filter=''ALL'' or activity_type=l_filter)',
'     and (l_after is null or (l_sort=''NEWEST'' and sort_id<l_after) or (l_sort=''OLDEST'' and sort_id>l_after))',
'     order by case when l_sort=''NEWEST'' then -sort_id else sort_id end fetch first 21 rows only',
'    ) loop',
'     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;',
'     apex_json.open_object;apex_json.write(''key'',r.activity_key);apex_json.write(''cursor'',to_char(r.sort_id));',
'     apex_json.write(''type'',r.activity_type);apex_json.write(''changes'',r.change_count);apex_json.write(''events'',r.event_count);',
'     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));apex_json.write(''login'',r.user_name);',
'     apex_json.write(''time'',to_char(r.first_time at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''lastTime'',to_char(r.last_time at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''request'',r.request_id);apex_json.write(''transaction'',r.transaction_id);apex_json.close_object;',
'    end loop;',
'    apex_json.close_array;apex_json.write(''more'',l_more);',
'   elsif l_mode=''DETAIL'' then',
'    apex_json.open_array(''changes'');',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     select c.*,e.action_type,e.record_key,e.event_timestamp,e.user_name,e.bossusercode,e.outcome,',
'     coalesce(json_value(e.record_key,''$.SNO''),(select coalesce(dbms_lob.substr(z.new_value,100,1),dbms_lob.substr(z.old_value,100,1))',
'       from imart_audit_event h join imart_audit_change z on z.audit_event_id=h.audit_event_id',
'       where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'       and h.audit_event_id<=e.audit_event_id and z.column_name=''SNO''',
'       order by h.audit_event_id desc,z.audit_change_id desc fetch first 1 row only)) line_id',
'     from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id',
'     where e.activity_key=l_key and (l_after is null or c.audit_change_id>l_after)',
'     order by c.audit_change_id fetch first 21 rows only',
'    ) loop',
'     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;',
'     apex_json.open_object;apex_json.write(''id'',to_char(r.audit_change_id));apex_json.write(''event'',to_char(r.audit_event_id));',
'     apex_json.write(''table'',r.table_name);apex_json.write(''field'',r.column_name);apex_json.write(''label'',label_for(r.table_name,r.column_name));',
'     apex_json.write(''action'',r.action_type);apex_json.write(''record'',r.record_key);apex_json.write(''line'',r.line_id);',
'     apex_json.write(''item'',item_context(r.line_id));',
'     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));',
'     apex_json.write(''time'',to_char(r.event_timestamp at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''old'',dbms_lob.substr(r.old_value,2000,1));apex_json.write(''new'',dbms_lob.substr(r.new_value,2000,1));',
'     if r.old_state=''VALUE'' and r.capture_mode=''FULL'' then apex_json.write(''oldLabel'',readable(r.column_name,r.old_value));end if;',
'     if r.new_state=''VALUE'' and r.capture_mode=''FULL'' then apex_json.write(''newLabel'',readable(r.column_name,r.new_value));end if;',
'     apex_json.write(''oldState'',r.old_state);apex_json.write(''newState'',r.new_state);apex_json.write(''mode'',r.capture_mode);',
'     apex_json.write(''long'',greatest(nvl(dbms_lob.getlength(r.old_value),0),nvl(dbms_lob.getlength(r.new_value),0))>2000);',
'     apex_json.close_object;',
'    end loop;',
'    apex_json.close_array;apex_json.write(''more'',l_more);',
'    apex_json.open_array(''events'');',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     select audit_event_id,action_type,table_name,record_key,outcome,event_type,event_timestamp,remarks,user_name,bossusercode',
'     from eligible e where activity_key=l_key and not exists(select 1 from imart_audit_change c where c.audit_event_id=e.audit_event_id)',
'     order by audit_event_id',
'    ) loop',
'     apex_json.open_object;apex_json.write(''event'',to_char(r.audit_event_id));apex_json.write(''action'',r.action_type);',
'     apex_json.write(''table'',r.table_name);apex_json.write(''record'',r.record_key);apex_json.write(''outcome'',r.outcome);',
'     apex_json.write(''time'',to_char(r.event_timestamp at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));apex_json.write(''remarks'',r.remarks);apex_json.close_object;',
'    end loop;apex_json.close_array;',
'   elsif l_mode=''VALUE'' then',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     select c.old_value,c.new_value from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id',
'     where e.activity_key=l_key and c.audit_change_id=l_after',
'    ) loop apex_json.write(''old'',r.old_value);apex_json.write(''new'',r.new_value);end loop;',
'   else raise_application_error(-20001,''Unsupported history request'');end if;',
'  end if;',
' end if;',
' apex_json.close_object;l_json:=apex_json.get_clob_output;',
' while l_pos<=dbms_lob.getlength(l_json) loop sys.htp.prn(dbms_lob.substr(l_json,8000,l_pos));l_pos:=l_pos+8000;end loop;',
' apex_json.free_output;',
'exception when others then',
' apex_json.free_output;',
' apex_json.open_object;apex_json.write(''status'',''error'');apex_json.write(''message'',''History could not be loaded. Retry or open Audit Trail.'');apex_json.close_object;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>25268389412899200
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000772)
,p_process_sequence=>-1000000
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART save receipt begin'
,p_static_id=>'imart-save-receipt-begin'
,p_process_sql_clob=>'declare ack_keys clob;begin select json_array(to_char(:P77_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.begin_v2(:P77_IMART_SAVE_OP_ID,''P77_TNO'',ack_keys);end;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>99061010105000772
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000773)
,p_process_sequence=>1000000
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART save receipt finish'
,p_static_id=>'imart-save-receipt-finish'
,p_process_sql_clob=>'declare ack_keys clob;begin select json_array(to_char(:P77_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.finish_v2(:P77_IMART_SAVE_OP_ID,ack_keys);end;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Document saved.'
,p_internal_uid=>99061010105000773
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583718366943438938)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(726929244575615139)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Module Location Master'
,p_static_id=>'initialize-form-module-location-master'
,p_internal_uid=>143332021692512414
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583733533735454988)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(726929244575615139)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Module Location Master'
,p_static_id=>'process-form-module-location-master'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>143347188484528464
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
