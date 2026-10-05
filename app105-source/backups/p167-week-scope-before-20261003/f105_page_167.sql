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
--     PAGE: 167
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00167
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>167);
end;
/
prompt --application/pages/page_00167
begin
wwv_flow_imp_page.create_page(
 p_id=>167
,p_name=>'Material Out Register'
,p_alias=>'MATERIAL-OUT-REGISTER'
,p_step_title=>'Material Out Register'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
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
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P167_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/materialoutregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P167_FROMDATE'').val());',
'  var toDate = new Date($(''#P167_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P167_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P167_COMPANY'').val() ==="" || $(''#P167_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P167_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P167_COMPANY'').val();',
'       global_companycode= $(''#P167_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +    ',
'      ''&P_LOCATION='' + $(''#P167_LOCATION'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P167_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P167_TODATE'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P167_DOCTYPE'').val() +',
'      ''&P_PARTY='' +$(''#P167_PARTY'').val() +',
'      ''&P_VEHICLENO='' +$(''#P167_VEHICLENO'').val() +',
'      ''&P_ITEM='' +$(''#P167_ITEM'').val() +',
'      ''&P_TRANSPORTER='' +$(''#P167_TRANSPORTER'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P167_ITEMSPECIFICATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'        ',
'      ;',
'  ',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P146_DOCTYPECODE'').getValue()==''CONVERSIONJOBOUTOFPREMISES'') {',
'                openModal(''StockStorageDetail'');',
'        }',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P167_BIREPORTURL'').val()',
'  var reportName =  ''materialoutregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P167_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P167_COMPANY'').val() ==="" || $(''#P167_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P167_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P167_COMPANY'').val();',
'       global_companycode= $(''#P167_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P167_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P167_LOCATION'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P167_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P167_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P167_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P167_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_VEHICLENO":"'' +$(''#P167_VEHICLENO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P167_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_TRANSPORTER":"'' +$(''#P167_TRANSPORTER'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P167_ITEMSPECIFICATION'').val() + ''",'' +',
'      ''"_paramsGLOBAL_COMPANYCODE":"'' +global_companycode;',
'     ',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'/* IMART_REGISTER_ACTIONS_V1: page-scoped, not a universal asset */',
'(function(){',
'  ''use strict'';',
'  function placeAddNew(){',
'    var hero=document.querySelector(''.t-Body-title.hspl-hero-card'');',
'    if(!hero)return;',
'    var filter=hero.querySelector(''.hspl-filter-trigger'');',
'    if(!filter)return;',
'    var add=hero.querySelector(''.hspl-hero-add-new'');',
'    if(!add){',
'      add=Array.prototype.find.call(document.querySelectorAll(''.t-Body-main .t-Button,.t-Body-content .t-Button''),function(el){',
'        return !hero.contains(el)&&String(el.textContent||el.getAttribute(''aria-label'')||'''').trim().toLowerCase()===''add new'';',
'      });',
'    }',
'    if(add){add.classList.add(''hspl-hero-add-new'');filter.insertAdjacentElement(''afterend'',add);}',
'  }',
'  if(document.readyState===''loading'')document.addEventListener(''DOMContentLoaded'',placeAddNew,{once:true});else placeAddNew();',
'  [100,400,1000,2000].forEach(function(ms){setTimeout(placeAddNew,ms);});',
'  document.addEventListener(''apexreadyend'',placeAddNew);',
'  if(window.apex&&apex.jQuery)apex.jQuery(document).on(''apexafterrefresh.imartRegisterActions'',placeAddNew);',
'})();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'/* IMART_REGISTER_COMPACT_V1: page-scoped, not a universal asset */',
'body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card{',
'  margin:0 8px 4px!important;padding:9px 14px!important;gap:10px!important;',
'  min-height:0!important;border-radius:0 0 12px 12px!important',
'}',
'body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-hero-icon{',
'  width:40px!important;height:40px!important;border-radius:10px!important',
'}',
'body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-hero-icon svg{width:21px!important;height:21px!important}',
'body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-page-title{font-size:1.2rem!important;line-height:1.15!important}',
'body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-page-desc{font-size:11.5px!important;margin-top:1px!important}',
'body:not(.t-PageBody--login) .t-Body-contentInner{padding-top:4px!important}',
'body:not(.t-PageBody--login) [id^="coverage-kpi-shell-"],',
'body:not(.t-PageBody--login) [id^="tx-kpi-shell-"]{margin-top:0!important;margin-bottom:4px!important}',
'body:not(.t-PageBody--login) .coverage-register-kpis,',
'body:not(.t-PageBody--login) .tx-register-kpis{margin:0 0 6px!important;padding:9px 10px!important;border-radius:12px!important}',
'body:not(.t-PageBody--login) .coverage-register-kpis .mr-kpi-grid,',
'body:not(.t-PageBody--login) .tx-register-kpis .mr-kpi-grid{',
'  grid-template-columns:repeat(auto-fit,minmax(min(100%,165px),1fr))!important;gap:7px!important;min-height:0!important',
'}',
'body:not(.t-PageBody--login) .coverage-register-kpis .mr-kpi-method,',
'body:not(.t-PageBody--login) .tx-register-kpis .mr-kpi-method{margin-top:4px!important}',
'body:not(.t-PageBody--login) .t-Body-contentInner .row:has(.coverage-register-kpis,.tx-register-kpis){margin-top:0!important;margin-bottom:0!important}',
'body:not(.t-PageBody--login) .hspl-hero-add-new{',
'  order:3!important;flex:none!important;margin-left:0!important;min-height:38px!important;',
'  border-radius:10px!important;background:#5d55d9!important;border-color:#5d55d9!important;color:#fff!important',
'}',
'body:not(.t-PageBody--login) .hspl-hero-card .hspl-filter-trigger{order:2!important;margin-left:auto!important}',
'@media(max-width:700px){',
' body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card{margin-inline:4px!important;padding:8px 10px!important;flex-wrap:wrap!important}',
' body:not(.t-PageBody--login) .coverage-register-kpis .mr-kpi-grid,',
' body:not(.t-PageBody--login) .tx-register-kpis .mr-kpi-grid{grid-template-columns:repeat(2,minmax(0,1fr))!important}',
'}',
'',
'/* IMART_REGISTER_GAP_3PX_V1: page-scoped register spacing */',
'body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card{',
'  margin-top:2px!important;margin-bottom:0!important;padding-top:8px!important;padding-bottom:8px!important',
'}',
'body:not(.t-PageBody--login) .t-Body-contentInner{padding-top:2px!important}',
'body:not(.t-PageBody--login) .coverage-register-kpis,',
'body:not(.t-PageBody--login) .tx-register-kpis{margin-bottom:2px!important}',
'body:not(.t-PageBody--login) .t-Body-contentInner .row:has(.imart-register-data){',
'  margin-top:0!important;padding-top:0!important',
'}',
'body:not(.t-PageBody--login) .t-Body-contentInner .imart-register-data{margin-top:0!important}',
'',
'/* IMART_REGISTER_GAP_3PX_V2: specificity correction, page-scoped */',
'body:not(.t-PageBody--login) #t_Body_content .t-Body-contentInner{padding-top:2px!important}',
'body:not(.t-PageBody--login) #t_Body_content .t-Body-contentInner div.t-IRR-region.imart-register-data{margin-top:0!important}',
'',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9567590108712768)
,p_plug_name=>'Register KPI Overview'
,p_static_id=>'coverage-kpi-shell-512288033104679057'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>29
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin htp.p(q''^<style>.coverage-register-kpis[hidden]{display:none!important}',
'.coverage-register-kpis{margin:0 0 18px;padding:22px;border:1px solid #e0e5f2;border-radius:18px;background:linear-gradient(120deg,#fff 65%,#faf9ff);box-shadow:0 4px 18px #24336205}',
'.coverage-register-kpis header{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;margin-bottom:20px}',
'.coverage-register-kpis .mr-kpi-heading{display:flex;align-items:center;gap:13px;min-width:0}',
'.coverage-register-kpis .mr-kpi-heading-icon{display:grid;place-items:center;width:44px;height:44px;flex:none;border-radius:13px;background:#eeecff;color:#6255d7;font-size:20px}',
'.coverage-register-kpis .mr-kpi-eyebrow{font-size:10px;font-weight:700;letter-spacing:1.4px;color:#847baf;display:block;margin-bottom:5px}',
'.coverage-register-kpis h2{font-size:19px;font-weight:700;line-height:1.3;color:#202a43;margin:0}',
'.coverage-register-kpis .mr-kpi-subtitle{font-size:12px;color:#79849b;margin:5px 0 0}',
'.coverage-register-kpis .mr-kpi-close{display:flex;align-items:center;gap:7px;flex:none;border:1px solid #e2e5f0;border-radius:9px;padding:8px 12px;background:#fff;color:#657089;font:inherit;font-size:12px;cursor:pointer}',
'.coverage-register-kpis .mr-kpi-close:hover{color:#5d50d2;border-color:#bcb5ee;background:#faf9ff}',
'.coverage-register-kpis .mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:14px}',
'.coverage-register-kpis .mr-inline-kpi{--kpi-accent:#6658d7;--kpi-tint:#efedff;--kpi-line:#e3defb;position:relative;overflow:hidden;display:flex;flex-direction:column;gap:0;min-width:0;width:100%;padding:17px 18px 14px;border:1px solid var(--kpi-line'
||');border-radius:13px;background:linear-gradient(125deg,#fff,var(--kpi-tint));font-family:inherit;text-align:left;cursor:pointer;color:#202a43;box-shadow:0 2px 5px #24336203}',
'.coverage-register-kpis .mr-inline-kpi[data-tone="success"]{--kpi-accent:#198a68;--kpi-tint:#edf9f3;--kpi-line:#d8eee4}',
'.coverage-register-kpis .mr-inline-kpi[data-tone="warning"]{--kpi-accent:#b87b19;--kpi-tint:#fff8e9;--kpi-line:#f0e4c7}',
'.coverage-register-kpis .mr-inline-kpi[data-tone="danger"]{--kpi-accent:#c55364;--kpi-tint:#fff0f2;--kpi-line:#f2dce2}',
'.coverage-register-kpis .mr-inline-kpi[data-tone="neutral"]{--kpi-accent:#738099;--kpi-tint:#f2f5fa;--kpi-line:#e0e5ee}',
'.coverage-register-kpis .mr-inline-kpi[data-tone="info"]{--kpi-accent:#397db7;--kpi-tint:#edf6ff;--kpi-line:#dceafa}',
'.coverage-register-kpis .mr-inline-kpi:hover{border-color:var(--kpi-accent);box-shadow:0 4px 14px #2433620a}',
'.coverage-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:var(--kpi-accent);box-shadow:inset 0 0 0 1px var(--kpi-accent),0 4px 14px #24336208}',
'.coverage-register-kpis .mr-inline-kpi:focus-visible,.coverage-register-kpis .mr-kpi-close:focus-visible{outline:2px solid #6658d7;outline-offset:3px}',
'.coverage-register-kpis .mr-inline-kpi:disabled{cursor:progress;opacity:.75}',
'.coverage-register-kpis .mr-kpi-card-top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:10px}',
'.coverage-register-kpis .mr-kpi-status{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;color:#606d85}',
'.coverage-register-kpis .mr-kpi-status::before{content:"";width:6px;height:6px;border-radius:50%;background:var(--kpi-accent);flex:none}',
'.coverage-register-kpis .mr-kpi-card-icon{display:grid;place-items:center;flex:none;width:31px;height:31px;border:1px solid var(--kpi-line);border-radius:9px;background:#ffffffb3;color:var(--kpi-accent);font-size:16px}',
'.coverage-register-kpis .mr-inline-kpi strong{font-size:32px;line-height:1.15;font-weight:700;letter-spacing:-.8px;color:#202a43;margin-bottom:5px}',
'.coverage-register-kpis .mr-kpi-share{font-size:11px;color:#8790a3;margin-bottom:13px}',
'.coverage-register-kpis .mr-kpi-card-bottom{display:flex;justify-content:space-between;align-items:center;border-top:1px solid var(--kpi-line);padding-top:10px;gap:10px;color:var(--kpi-accent);font-size:11px;font-weight:600}',
'.coverage-register-kpis .mr-kpi-selected{display:none}',
'.coverage-register-kpis [aria-pressed="true"] .mr-kpi-selected{display:inline}',
'.coverage-register-kpis [aria-pressed="true"] .mr-kpi-unselected{display:none}',
'.coverage-register-kpis .mr-kpi-method{margin-top:13px;color:#8790a3;font-size:11px}',
'.coverage-register-kpis .mr-kpi-method summary{cursor:pointer;list-style:none;display:inline-flex;align-items:center;gap:6px}',
'.coverage-register-kpis .mr-kpi-method summary::-webkit-details-marker{display:none}',
'.coverage-register-kpis .mr-kpi-method p{font-size:11px;line-height:1.6;color:#738099;margin:8px 0 0;max-width:1000px}',
'.coverage-register-kpis .mr-kpi-card-body{display:flex;align-items:flex-start;gap:17px;position:relative;padding:3px 0 0;min-height:100px}',
'.coverage-register-kpis .mr-kpi-card-details{display:flex;flex-direction:column;min-width:0;position:relative;z-index:1}',
'.coverage-register-kpis .mr-kpi-card-icon{width:45px;height:45px;border:0;border-radius:16px;background:var(--kpi-tint);font-size:24px}',
'.coverage-register-kpis .mr-kpi-status{font-size:13px;margin:5px 0 8px}',
'.coverage-register-kpis .mr-kpi-status::before{display:none}',
'.coverage-register-kpis .mr-kpi-share{margin-bottom:13px}',
'.coverage-register-kpis .mr-kpi-wave{position:absolute;right:0;bottom:18px;width:105px;height:39px;color:var(--kpi-accent);opacity:.65;pointer-events:none}',
'.coverage-register-kpis .mr-kpi-wave svg{display:block;width:100%;height:100%}',
'@media(max-width:1000px){.coverage-register-kpis .mr-kpi-wave{width:75px;opacity:.35}}',
'@media(max-width:650px){.coverage-register-kpis{padding:16px}.coverage-register-kpis h2{font-size:16px}.coverage-register-kpis .mr-kpi-heading-icon{display:none}.coverage-register-kpis .mr-kpi-grid{gap:10px}.coverage-register-kpis .mr-inline-kpi{padd'
||'ing:13px}.coverage-register-kpis .mr-inline-kpi strong{font-size:27px}.coverage-register-kpis .mr-kpi-card-top{flex-wrap:wrap;gap:6px}}',
'@media(max-width:380px){.coverage-register-kpis .mr-kpi-grid{grid-template-columns:1fr}}',
'.coverage-register-kpis{padding:12px;margin-bottom:12px}',
'.coverage-register-kpis header{gap:10px;margin-bottom:10px}',
'.coverage-register-kpis .mr-kpi-heading{gap:9px}',
'.coverage-register-kpis .mr-kpi-heading-icon{width:32px;height:32px;border-radius:10px;font-size:17px}',
'.coverage-register-kpis .mr-kpi-eyebrow{margin-bottom:2px;letter-spacing:1px}',
'.coverage-register-kpis h2{font-size:16px}',
'.coverage-register-kpis .mr-kpi-subtitle{margin-top:3px;font-size:11px}',
'.coverage-register-kpis .mr-kpi-grid{gap:9px}',
'.coverage-register-kpis .mr-inline-kpi{padding:7px 10px 6px;border-radius:10px}',
'.coverage-register-kpis .mr-kpi-card-body{min-height:0;gap:8px;padding:0}',
'.coverage-register-kpis .mr-kpi-card-icon{width:27px;height:27px;border-radius:9px;font-size:17px}',
'.coverage-register-kpis .mr-kpi-status{font-size:11px;line-height:1.3;margin:0 0 1px}',
'.coverage-register-kpis .mr-inline-kpi strong{font-size:22px;line-height:1.05;margin:0;letter-spacing:-.4px}',
'.coverage-register-kpis .mr-kpi-share{font-size:10px;line-height:1.3;margin:1px 0 2px}',
'.coverage-register-kpis .mr-kpi-card-bottom{padding-top:4px;gap:6px;font-size:10px;line-height:1.3}',
'.coverage-register-kpis .mr-kpi-card-bottom>.fa{font-size:11px;line-height:13px}',
'.coverage-register-kpis .mr-kpi-wave{width:48px;height:18px;bottom:5px;opacity:.3}',
'.coverage-register-kpis .mr-kpi-method{margin-top:8px}',
'.coverage-register-kpis .mr-kpi-grid{min-height:0}',
'',
'.coverage-register-kpis .mr-kpi-grid{grid-template-columns:repeat(auto-fit,minmax(180px,280px));min-height:0}.coverage-register-kpis .mr-kpi-card-details{min-width:0}.coverage-register-kpis .mr-kpi-share{overflow-wrap:anywhere}</style><section id="co'
||'verage-kpis-512288033104679057" class="coverage-register-kpis" data-kpi-region="512288033104679057" data-report-region="material-out-register" data-report-label="Material&#x20;Out&#x20;Register" data-page-items="&#x23;P167_FROMDATE,&#x23;P167_TODATE,'
||'&#x23;P167_COMPANY,&#x23;P167_LOCATION,&#x23;P167_DOCTYPE,&#x23;P167_VEHICLENO,&#x23;P167_PARTY,&#x23;P167_TRANSPORTER,&#x23;P167_ITEM,&#x23;P167_ITEMSPECIFICATION,&#x23;P167_MONO" aria-label="Material&#x20;Out&#x20;Register KPIs"><div class="mr-kpi-'
||'grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary>How counts work</summary><p data-kpi-scope></p></details></section><script>(function () {',
'  ''use strict'';',
'  if (window.IMARTReportKpis) return;',
'  var requests = {};',
'  function report(root) {',
'    var id = root.dataset.reportRegion;',
'    if (id && document.getElementById(id) && apex.region(id)) return apex.region(id);',
'    var matches = Array.from(document.querySelectorAll(''main .js-apex-region'')).filter(function (el) {',
'      return el.getAttribute(''aria-label'') === root.dataset.reportLabel && el.querySelector(''.a-IRR,.a-IG,.t-Report'') && apex.region(el.id);',
'    });',
'    if (matches.length === 1) { root.dataset.reportRegion = matches[0].id; return apex.region(matches[0].id); }',
'    return null;',
'  }',
'  function pageValues(root) {',
'    var names = [], values = [];',
'    (root.dataset.pageItems || '''').split('','').forEach(function (selector) {',
'      var name = selector.replace(/^#/, ''''), item, node, value;',
'      if (!name) return;',
'      node = document.getElementById(name + ''_input'') || document.getElementById(name) || document.querySelector(''[name="'' + name + ''"]'');',
'      if (!node) return;',
'      item = apex.item(name);',
'      value = ''value'' in node ? node.value : null;',
'      if ((value === null || value === undefined) && item) {',
'        try { value = item.getValue(); } catch (ignore) { value = null; }',
'      }',
'      if (Array.isArray(value)) value = value.join('':'');',
'      names.push(name);',
'      values.push(value === null || value === undefined || value === '''' ? ''__IMART_NULL__'' : String(value));',
'    });',
'    return {names: names, values: values};',
'  }',
'  function load(root) {',
'    var key = root.dataset.kpiRegion, content = root.querySelector(''[data-kpi-content]''), payload = {x01: key}, filters = pageValues(root);',
'    if (filters.names.length) { payload.f01 = filters.names; payload.f02 = filters.values; }',
'    if (requests[key]) requests[key].abort();',
'    root.setAttribute(''aria-busy'', ''true'');',
unistr('    if (!content.querySelector(''.mr-inline-kpi'')) content.textContent = ''Loading KPIs\2026'';'),
'    requests[key] = apex.server.process(''IMART_REPORT_KPIS'', payload, {',
'      dataType: ''json'', timeout: 15000,',
'      success: function (data) {',
'        root.querySelector(''[data-kpi-scope]'').textContent = data.scope;',
'        content.replaceChildren();',
'        data.cards.forEach(function (card) {',
'          if (card.mode === ''STATUS'' && (!card.status || /^NO[ _-]?STATUS$/i.test(card.label))) return;',
'          var el = document.createElement(''button''), body = document.createElement(''span''), icon = document.createElement(''span''),',
'            details = document.createElement(''span''), label = document.createElement(''span''), value = document.createElement(''strong''),',
'            note = document.createElement(''span''), bottom = document.createElement(''span''), action = document.createElement(''span''), arrow = document.createElement(''span'');',
'          var tone = ''info'', fa = ''fa-circle-o'', status = String(card.label).toUpperCase();',
'          if (card.mode === ''ALL'') { tone = ''total''; fa = ''fa-file-text-o''; }',
'          else if (card.mode === ''MINE'') { tone = ''total''; fa = ''fa-user''; }',
'          else if (card.mode === ''RECENT'') fa = ''fa-calendar'';',
'          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT|OVERDUE|LOSS|^NO$/.test(status)) { tone = ''danger''; fa = ''fa-ban''; }',
'          else if (/ACTIVE|CLOSED|COMPLETE|AUTHORI|^YES$|WIN/.test(status)) { tone = ''success''; fa = ''fa-check-circle-o''; }',
'          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = ''warning''; fa = ''fa-clock-o''; }',
'          el.type = ''button''; el.className = ''mr-inline-kpi''; el.dataset.tone = tone;',
'          el.setAttribute(''aria-pressed'', String(card.selected)); el.setAttribute(''aria-label'', card.label + '': '' + card.value);',
'          body.className = ''mr-kpi-card-body''; icon.className = ''mr-kpi-card-icon fa '' + fa; icon.setAttribute(''aria-hidden'', ''true'');',
'          details.className = ''mr-kpi-card-details''; label.className = ''mr-kpi-status''; label.textContent = card.label;',
'          value.textContent = card.value; note.className = ''mr-kpi-share''; note.textContent = card.note;',
'          details.append(label, value, note); body.append(icon, details);',
'          bottom.className = ''mr-kpi-card-bottom''; action.textContent = card.selected ? ''Showing records'' : ''View records'';',
'          arrow.className = ''fa fa-arrow-right''; arrow.setAttribute(''aria-hidden'', ''true''); bottom.append(action, arrow); el.append(body, bottom);',
'          el.addEventListener(''click'', function () {',
'            var api = report(root);',
'            if (!api) { apex.message.alert(''Report region unavailable. Please reload this page.''); return; }',
'            var buttons = Array.from(content.querySelectorAll(''button''));',
'            buttons.forEach(function (b) { b.disabled = true; });',
'            apex.server.process(''IMART_REPORT_KPI_FILTER'', {x01: key, x02: card.mode, x03: card.status}, {',
'              dataType: ''json'', timeout: 15000,',
'              success: function () {',
'                buttons.forEach(function (b) { b.setAttribute(''aria-pressed'', String(b === el)); b.querySelector(''.mr-kpi-card-bottom span'').textContent = b === el ? ''Showing records'' : ''View records''; });',
'                api.refresh();',
'              },',
'              error: function () { apex.message.alert(''KPI filter could not be applied. Please retry.''); },',
'              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }',
'            });',
'          });',
'          content.append(el);',
'        });',
'      },',
'      error: function (request, status) {',
'        if (status === ''abort'') return;',
'        if (!content.querySelector(''.mr-inline-kpi'')) {',
'          content.textContent = ''KPIs unavailable. '';',
'          var retry = document.createElement(''button''); retry.type = ''button''; retry.textContent = ''Retry'';',
'          retry.addEventListener(''click'', function () { load(root); }); content.append(retry);',
'        }',
'      },',
'      complete: function () { delete requests[key]; root.removeAttribute(''aria-busy''); }',
'    });',
'  }',
'  function listen() {',
'    var roots = Array.from(document.querySelectorAll(''.coverage-register-kpis''));',
'    roots.forEach(load);',
'    apex.jQuery(document).on(''apexafterrefresh.imartReportCoverage'', ''.js-apex-region'', function () {',
'      var region = this.id;',
'      roots.forEach(function (root) {',
'        if (root.dataset.reportRegion !== region) return;',
'        var key = root.dataset.kpiRegion;',
'        load(root);',
'      });',
'    });',
'  }',
'  window.IMARTReportKpis = {reload: function () { document.querySelectorAll(''.coverage-register-kpis'').forEach(load); }};',
'  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', listen, {once: true}); else listen();',
'})();',
'</script>^'');end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512286749995679044)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_css_classes=>'hspl-drawer'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512288033104679057)
,p_plug_name=>'Material Out Register'
,p_static_id=>'material-out-register'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rk_source.* from (Select A.TNO,',
'      a.LocationName,',
'      Upper(a.DocTypeName)as DocTypeName,',
'      a.MaterialOutNo,',
'      a.MaterialOutDate,',
'      a.PartyName,',
'      a.Transporter,',
'      a.VehicleNo,',
'      a.DriverName,',
'      a.ItemCode,',
'      a.ItemName||'' ~ ''||a.ItemSpecificationName as ItemDetail,',
'      a.UOM1,',
'      a.Quantity1,',
'      a.UOM2,',
'      a.Quantity2,',
'      Upper(a.Module) as Module,',
'      a.ModuleNo,',
'      a.ModuleDate,',
'      a.WeighmentNo,',
'      a.FirstWeight,',
'      a.SecondWeight,',
'      a.NetWeight,',
'      a.AcceptedWeight,',
'      a.creator,',
'',
'               ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||a.TNO||'',''||''MaterialOut''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" tit'
||'le="Action"></span</span></a>'' AS Print',
'',
'From  GATEOUTREGISTER_VIEW a',
'Where  trunc(a.MaterialOutDate) between :P167_FROMDATE and :P167_TODATE',
'      and ( :P167_COMPANY IS NULL OR instr('':''||:P167_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'      and ( :P167_LOCATION IS NULL OR instr('':''||:P167_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'      and ( :P167_DOCTYPE IS NULL OR instr('':''||:P167_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 )',
'',
'  --and (instr('':''||:P167_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  --and ( instr('':''||:P167_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  --and (instr('':''||:P167_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and a.VehicleNo like nvl(:P167_VEHICLENO,''%'')',
'  and ( :P167_PARTY IS NULL OR instr('':''||:P167_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P167_TRANSPORTER IS NULL OR instr('':''||:P167_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'  and ( :P167_ITEM IS NULL OR instr('':''||:P167_ITEM||'':'','':''||a.ItemCode||'':'') > 0 ) ',
'  and ( :P167_ITEMSPECIFICATION IS NULL OR instr('':''||:P167_ITEMSPECIFICATION||'':'','':''||a.ItemSpecificationCode||'':'') > 0 ) ',
'  --and a.materialOutNo  like nvl(:P167_MONO,''%'')',
'  order by a.tno desc',
') rk_source where ((select imart_report_kpis.selected_mode(512288033104679057) from dual)=''ALL'' or ((select imart_report_kpis.selected_mode(512288033104679057) from dual)=''STATUS'' and case when getdocumentstatuscode(''MATERIALOUT'',rk_source.tno)=''ACTI'
||'VE'' then ''ACTIVE'' else ''NON ACTIVE'' end=(select imart_report_kpis.selected_status(512288033104679057) from dual)) or ((select imart_report_kpis.selected_mode(512288033104679057) from dual)=''PROCESS'' and case',
'           when getdocumentstatuscode(''MATERIALOUT'',rk_source.tno)=''ACTIVE''',
'            and not exists(',
'              select 1',
'                from materialout m',
'                join ccinvoice c',
'                  on c.despatchadvicetno=m.referencetno',
'                  or c.despatchtno=m.referencetno',
'               where m.tno=rk_source.tno',
'            )',
'           then ''INVOICE NOT CREATED''',
'         end=(select imart_report_kpis.selected_status(512288033104679057) from dual)))'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Material Out Register'
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
 p_id=>wwv_flow_imp.id(502595044546936055)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:168:P168_TNO,P168_FORMSTATUS:#TNO#,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>63610175347238071
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454752235369918525)
,p_db_column_name=>'ACCEPTEDWEIGHT'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'ACCEPTE DWEIGHT'
,p_column_html_expression=>'<div style="display:block; width:60px">#ACCEPTEDWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(34782189596793221)
,p_db_column_name=>'CREATOR'
,p_display_order=>380
,p_column_identifier=>'AM'
,p_column_label=>'CREATOR'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454745376020918523)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454747822478918524)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'DRIVER NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRIVERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454751062804918525)
,p_db_column_name=>'FIRSTWEIGHT'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'FIRST WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:60px">#ACCEPTEDWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454748247684918524)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454752656684918526)
,p_db_column_name=>'ITEMDETAIL'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#ITEMDETAIL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454744999255918522)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454746263212918523)
,p_db_column_name=>'MATERIALOUTDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL OUT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MATERIALOUTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454745829471918523)
,p_db_column_name=>'MATERIALOUTNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'MATERIAL OUT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#MATERIALOUTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454749400812918524)
,p_db_column_name=>'MODULE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'REFERENCE'
,p_column_html_expression=>'<div style="display:block; width:100px">#MODULE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454750250363918525)
,p_db_column_name=>'MODULEDATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'MODULE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MODULEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454749832646918525)
,p_db_column_name=>'MODULENO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'MODULE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#MODULENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454751866552918525)
,p_db_column_name=>'NETWEIGHT'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'NET WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:60px">#ACCEPTEDWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454746577569918523)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291364939997173252)
,p_db_column_name=>'PRINT'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454749020577918524)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454564627610372563)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454751457647918525)
,p_db_column_name=>'SECONDWEIGHT'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'SECOND WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:60px">#ACCEPTEDWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448073280410731900)
,p_db_column_name=>'TNO'
,p_display_order=>360
,p_column_identifier=>'AK'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454746996921918523)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'TRANSPORTER'
,p_column_html_expression=>'<div style="display:block; width:200px">#TRANSPORTER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454564403859372561)
,p_db_column_name=>'UOM1'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454564476152372562)
,p_db_column_name=>'UOM2'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454747429099918524)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'VEHICLENO'
,p_column_html_expression=>'<div style="display:block; width:100px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454750629378918525)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'WEIGHMENT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#WEIGHMENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(502693966350194254)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'44590'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:DOCTYPENAME:MATERIALOUTDATE:MATERIALOUTNO:PARTYNAME:TRANSPORTER:VEHICLENO:DRIVERNAME:ITEMCODE:ITEMDETAIL:UOM1:QUANTITY1:UOM2:QUANTITY2:MODULE:MODULENO:MODULEDATE:FIRSTWEIGHT:SECONDWEIGHT:NETWEIGHT:ACCEPTEDWEIGHT:CREATOR'
,p_sort_column_1=>'MATERIALOUTDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DOCTYPENAME'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:FIRSTWEIGHT:SECONDWEIGHT:NETWEIGHT:ACCEPTEDWEIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(448651759013986535)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(512288033104679057)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:168:P168_FORMSTATUS:NEWRECORD'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(448639827015961420)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(512288033104679057)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/materialoutregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P167_FROMDATE=&P167_FROMDATE.&P167_TODATE=&P167_TODATE.&P167_LOCATION=&P167_LOCATION.&P167_DOCTYPE=&P167_DOCTYPE.&P167_ITEM=&P167_ITEM.&P167_ITEMSPECIFICATION=&P167_ITEMSPECIFICATION.&P167_TRANSPORTER=&P167_TRANSPORTER.&P167_PARTY=&P167_PARTY.&P167_VEHICLENO=&P167_VEHICLENO.&P167_MONO=&P167_MONO.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(448652466151987863)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(512288033104679057)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(448639461218961420)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(512288033104679057)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(448628545681961394)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448683222371181883)
,p_name=>'P167_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454565263754372567)
,p_name=>'P167_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''MATERIALOUT''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;'))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454743325559918528)
,p_name=>'P167_DOCTYPE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Doc Type'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''MATERIALOUT''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454741654838918527)
,p_name=>'P167_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_item_default=>'TRUNC(SYSDATE)-6'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454744493600918528)
,p_name=>'P167_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Material'
,p_placeholder=>'Material '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        e.ItemName||'' ( ''||e.ItemCode||'')'' as d,',
'        e.ItemCode r',
'From MaterialOutDetail a, Item e',
'Where a.ItemCode = e.itemCode',
''))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454745322812918529)
,p_name=>'P167_ITEMSPECIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        ee.ItemSpecificationName as d,',
'        ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P167_ITEM',
'and   e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P167_ITEM'
,p_ajax_items_to_submit=>'P167_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454742484264918527)
,p_name=>'P167_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''MATERIALOUT''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
'  ',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454742921700918528)
,p_name=>'P167_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov_language=>'PLSQL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'Select',
'      Distinct',
'      p.PartyName d,',
'      p.PartyCode r',
'From MaterialOut a, (select p.* from PARTY p where exists(select 1 from PARTYCOMPANY c where c.TNO=p.TNO and c.COMPANYCODE=:GLOBAL_COMPANYCODE)) p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448073223523731899)
,p_name=>'P167_TNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454742076776918527)
,p_name=>'P167_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P167_FROMDATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454743680395918528)
,p_name=>'P167_TRANSPORTER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Transporter'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      p.PartyName d,',
'      p.PartyCode r',
'From MaterialOut a, (select p.* from PARTY p where exists(select 1 from PARTYCOMPANY c where c.TNO=p.TNO and c.COMPANYCODE=:GLOBAL_COMPANYCODE)) p',
'Where a.TransporterCode = p.PartyCode'))
,p_cSize=>74
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454744096366918528)
,p_name=>'P167_VEHICLENO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(512286749995679044)
,p_prompt=>'Vehicle No'
,p_placeholder=>'Vehicle No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        a.VehicleNo',
'From (select * from MATERIALIN where COMPANYCODE=(select IMART_REFERENCE_SCOPE.company_code(:P167_TNO,null) from dual)) a',
'',
'Union',
'',
'Select',
'        Distinct',
'        a.VehicleNo',
'From MaterialOut a'))
,p_ajax_items_to_submit=>'P167_TNO'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(448640801274961427)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(448639461218961420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(448641324283961429)
,p_event_id=>wwv_flow_imp.id(448640801274961427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/materialoutregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"'
||'1","_paramsP_COMPANY":"&P167_COMPANY.","_paramsP_LOCATION":"&P167_LOCATION.","_paramsP_FROMDATE":"&P167_FROMDATE.","_paramsP_TODATE":"&P167_TODATE.","_paramsP_DOCTYPE":"&P167_DOCTYPE.","_paramsP_LOCATION":"&P167_LOCATION.","_paramsP_ITEM":"&P167_ITEM'
||'.","_paramsP_ITEMSPECIFICATION":"&P167_ITEMSPECIFICATION.","_paramsP_TRANSPORTER":"&P167_TRANSPORTER.","_paramsP_PARTY":"&P167_PARTY.","_paramsP_VEHICLENO":"&P167_VEHICLENO."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(448653158383989788)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(448653537674989788)
,p_event_id=>wwv_flow_imp.id(448653158383989788)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190908858327991085)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190909223847991086)
,p_event_id=>wwv_flow_imp.id(190908858327991085)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(448640454367961423)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'  if :P167_MONO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P167_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P167_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9655585168263439
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
