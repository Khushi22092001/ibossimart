prompt --application/pages/page_00500
begin
--   Manifest
--     PAGE: 00500
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
 p_id=>500
,p_name=>'Portlets'
,p_alias=>'PORTLETS'
,p_step_title=>'Portlets'
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
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'html.page-500 body,',
'body:has(.p500-workspace){background:#f5f7fc}',
'html.page-500 .t-Body-content{background:transparent}',
'html.page-500 #p500-portlet-workspace,',
'html.page-500 #p500-portlet-workspace .t-Region-body,',
'html.page-500 #p500-portlet-workspace .t-Region-wrap{background:transparent!important;border:0!important;box-shadow:none!important}',
'html.page-500 #p500-portlet-workspace .t-Region-header{display:none!important}',
'html.page-500 #p500-portlet-workspace .t-Region-body{padding:0!important}',
'',
'html.page-500 .p500-workspace{--p500-ink:#16244a;--p500-muted:#64749a;--p500-line:#e1e8f5;--p500-indigo:#5857dc;--p500-blue:#2876e8;max-width:1560px;margin:0 auto;padding:28px 24px 44px;color:var(--p500-ink);font-family:Inter,"Segoe UI",Arial,sans-se'
||'rif}',
'html.page-500 .p500-hero{position:relative;overflow:hidden;min-height:218px;display:flex;align-items:center;justify-content:space-between;gap:32px;padding:36px 42px;border:1px solid #e0e7f5;border-radius:22px;background:linear-gradient(112deg,#fff 0%'
||',#f8faff 58%,#eef2ff 100%);box-shadow:0 13px 30px rgba(38,57,111,.055)}',
'html.page-500 .p500-hero:before{content:"";position:absolute;right:-70px;bottom:-125px;width:450px;height:335px;border:1px solid rgba(88,87,220,.12);border-radius:54% 46% 0 0;transform:rotate(-12deg);box-shadow:-42px -18px 0 rgba(88,87,220,.035),-84p'
||'x -36px 0 rgba(88,87,220,.025)}',
'html.page-500 .p500-hero:after{content:"";position:absolute;right:142px;top:23px;width:104px;height:104px;border-radius:28px;background:linear-gradient(135deg,rgba(89,87,220,.13),rgba(37,119,232,.035));transform:rotate(45deg)}',
'html.page-500 .p500-hero-copy{position:relative;z-index:1;max-width:720px}',
'html.page-500 .p500-eyebrow{display:flex;align-items:center;gap:9px;margin:0 0 12px;color:#6577a3;font-size:12px;font-weight:800;letter-spacing:.08em;text-transform:uppercase}',
'html.page-500 .p500-eyebrow i{display:grid;place-items:center;width:29px;height:29px;color:var(--p500-indigo);border-radius:9px;background:#eaedff;font-size:14px}',
'html.page-500 .p500-hero h1{margin:0;color:var(--p500-ink);font-size:clamp(32px,3vw,46px);line-height:1.08;letter-spacing:-.045em;font-weight:800}',
'html.page-500 .p500-hero h1 span{color:#286de2}',
'html.page-500 .p500-hero p{margin:12px 0 0;color:#617296;font-size:16px;line-height:1.55}',
'html.page-500 .p500-hero-note{position:relative;z-index:1;max-width:275px;padding:8px 0 8px 22px;border-left:2px solid #9cadff;color:#334978;font-size:17px;line-height:1.46;font-weight:650}',
'html.page-500 .p500-hero-note:before{content:"\f10d";display:block;margin-bottom:8px;color:#5b58da;font-family:"Font APEX Small";font-size:17px}',
'',
'html.page-500 .p500-snapshot{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:14px;margin:18px 0 31px}',
'html.page-500 .p500-snapshot-card{min-height:79px;display:flex;align-items:center;gap:13px;padding:15px 17px;color:var(--p500-ink);text-decoration:none;border:1px solid var(--p500-line);border-radius:15px;background:#fff;box-shadow:0 7px 18px rgba(31'
||',54,106,.035);transition:transform .18s ease,box-shadow .18s ease,border-color .18s ease}',
'html.page-500 .p500-snapshot-card:hover{transform:translateY(-2px);border-color:#c8d4f7;box-shadow:0 13px 24px rgba(39,70,144,.09)}',
'html.page-500 .p500-snapshot-icon{display:grid;place-items:center;flex:0 0 42px;width:42px;height:42px;border-radius:13px;color:var(--p500-indigo);background:#eef1ff;font-size:18px}',
'html.page-500 .p500-snapshot-card:nth-child(2) .p500-snapshot-icon{color:#008d9b;background:#e7f8f8}',
'html.page-500 .p500-snapshot-card:nth-child(3) .p500-snapshot-icon{color:#a76a13;background:#fff5e5}',
'html.page-500 .p500-snapshot-card:nth-child(4) .p500-snapshot-icon{color:#2474d8;background:#edf5ff}',
'html.page-500 .p500-snapshot-card strong{display:block;font-size:14px;line-height:1.2}',
'html.page-500 .p500-snapshot-card span:last-child{display:block;margin-top:4px;color:var(--p500-muted);font-size:12px}',
'',
'html.page-500 .p500-section-head{display:flex;align-items:flex-end;justify-content:space-between;gap:16px;margin:0 0 18px}',
'html.page-500 .p500-section-title{display:flex;align-items:center;gap:13px}',
'html.page-500 .p500-section-title i{display:grid;place-items:center;width:40px;height:40px;color:var(--p500-indigo);border-radius:12px;background:#eef1ff;font-size:20px}',
'html.page-500 .p500-section-title h2{margin:0;color:var(--p500-ink);font-size:25px;line-height:1.12;letter-spacing:-.03em}',
'html.page-500 .p500-section-title p{margin:5px 0 0;color:var(--p500-muted);font-size:14px}',
'html.page-500 .p500-section-meta{margin:0 3px 2px;color:#7281a2;font-size:13px;font-weight:650}',
'',
'html.page-500 .p500-portlet-grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:18px}',
'html.page-500 .p500-portlet-card{--p500-accent:#5263df;--p500-wash:#edf1ff;--p500-layer:rgba(82,99,223,.12);position:relative;isolation:isolate;min-height:203px;overflow:hidden;display:flex;flex-direction:column;padding:21px 22px 17px;color:var(--p50'
||'0-ink);text-decoration:none;border:1px solid #e0e8f5;border-radius:17px;background:linear-gradient(135deg,#fff 0%,#fbfcff 70%,var(--p500-wash) 155%);box-shadow:0 9px 22px rgba(28,49,101,.045);transition:transform .2s ease,box-shadow .2s ease,border-c'
||'olor .2s ease}',
'html.page-500 .p500-portlet-card:before{content:"";position:absolute;z-index:-1;right:-47px;bottom:-83px;width:205px;height:150px;border:22px solid var(--p500-layer);border-radius:39px;transform:rotate(-20deg);box-shadow:-31px -18px 0 rgba(255,255,25'
||'5,.55)}',
'html.page-500 .p500-portlet-card:after{content:"";position:absolute;z-index:-1;left:0;right:0;top:0;height:3px;background:transparent;transition:background .2s ease}',
'html.page-500 .p500-portlet-card:hover{transform:translateY(-4px);border-color:#bcccf7;box-shadow:0 17px 32px rgba(39,63,133,.12)}',
'html.page-500 .p500-portlet-card:hover:after{background:var(--p500-accent)}',
'html.page-500 .p500-portlet-card--teal{--p500-accent:#0a9da0;--p500-wash:#e9fbfb;--p500-layer:rgba(10,157,160,.13)}',
'html.page-500 .p500-portlet-card--violet{--p500-accent:#7853dd;--p500-wash:#f2edff;--p500-layer:rgba(120,83,221,.13)}',
'html.page-500 .p500-portlet-card--amber{--p500-accent:#ad751f;--p500-wash:#fff7e9;--p500-layer:rgba(214,151,44,.13)}',
'html.page-500 .p500-portlet-card--green{--p500-accent:#239b63;--p500-wash:#edfbf4;--p500-layer:rgba(35,155,99,.12)}',
'html.page-500 .p500-portlet-card--rose{--p500-accent:#d65378;--p500-wash:#fff0f4;--p500-layer:rgba(214,83,120,.12)}',
'html.page-500 .p500-portlet-card--sky{--p500-accent:#2474d8;--p500-wash:#eef5ff;--p500-layer:rgba(36,116,216,.12)}',
'html.page-500 .p500-card-top{display:flex;align-items:flex-start;justify-content:space-between;gap:12px}',
'html.page-500 .p500-card-icon{display:grid;place-items:center;width:54px;height:54px;color:var(--p500-accent);border-radius:18px;background:var(--p500-wash);font-size:25px}',
'html.page-500 .p500-card-arrow{display:grid;place-items:center;width:35px;height:35px;color:var(--p500-accent);border:1px solid color-mix(in srgb,var(--p500-accent) 17%,white);border-radius:50%;background:rgba(255,255,255,.82);font-size:14px;box-shad'
||'ow:0 4px 10px rgba(37,57,108,.05)}',
'html.page-500 .p500-portlet-card h3{margin:20px 0 7px;font-size:18px;line-height:1.2;letter-spacing:-.022em}',
'html.page-500 .p500-portlet-card p{max-width:230px;margin:0;color:#637397;font-size:13px;line-height:1.5}',
'html.page-500 .p500-card-bottom{display:flex;align-items:center;gap:13px;margin-top:auto;padding-top:14px;color:var(--p500-accent);font-size:12px;font-weight:750}',
'html.page-500 .p500-card-number{padding-right:13px;border-right:1px solid #dbe3f3;font-variant-numeric:tabular-nums}',
'',
'html.page-500 .p500-workspace-strip{display:flex;align-items:center;gap:16px;margin-top:28px;padding:15px 18px;border:1px solid #e0e8f5;border-radius:17px;background:#fff;box-shadow:0 8px 20px rgba(31,51,100,.035)}',
'html.page-500 .p500-workspace-label{display:flex;align-items:center;gap:10px;min-width:230px;padding-right:17px;border-right:1px solid #e5ebf5}',
'html.page-500 .p500-workspace-label i{display:grid;place-items:center;width:34px;height:34px;border-radius:11px;color:var(--p500-indigo);background:#eef1ff;font-size:16px}',
'html.page-500 .p500-workspace-label strong{display:block;font-size:14px}',
'html.page-500 .p500-workspace-label span{display:block;margin-top:3px;color:var(--p500-muted);font-size:12px}',
'html.page-500 .p500-route{flex:1;display:flex;align-items:center;gap:9px;min-width:0;padding:8px 11px;color:#43567e;text-decoration:none;border-radius:10px;transition:background .18s ease}',
'html.page-500 .p500-route:hover{background:#f5f7ff}',
'html.page-500 .p500-route i{width:8px;height:8px;flex:0 0 8px;border-radius:50%;background:#5d68e8}',
'html.page-500 .p500-route:nth-of-type(3) i{background:#14aa9c}',
'html.page-500 .p500-route:nth-of-type(4) i{background:#ee9a28}',
'html.page-500 .p500-route b{display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;font-size:12px}',
'html.page-500 .p500-route small{display:block;margin-top:3px;color:#7b89a6;font-size:11px}',
'html.page-500 .p500-view-all{display:inline-flex;align-items:center;gap:8px;white-space:nowrap;padding:10px 13px;color:#3f52c5;text-decoration:none;border:1px solid #dbe2fa;border-radius:10px;background:#f9faff;font-size:12px;font-weight:750}',
'',
'@media(max-width:1150px){html.page-500 .p500-portlet-grid{grid-template-columns:repeat(2,minmax(0,1fr))}html.page-500 .p500-snapshot{grid-template-columns:repeat(2,minmax(0,1fr))}html.page-500 .p500-workspace-strip{flex-wrap:wrap}.p500-workspace-labe'
||'l{min-width:100%!important;border-right:0!important;border-bottom:1px solid #e5ebf5;padding-bottom:12px!important}}',
'@media(max-width:680px){html.page-500 .p500-workspace{padding:16px 12px 30px}html.page-500 .p500-hero{min-height:0;padding:27px 23px;align-items:flex-start;flex-direction:column}html.page-500 .p500-hero-note{font-size:14px}html.page-500 .p500-snapsho'
||'t,html.page-500 .p500-portlet-grid{grid-template-columns:1fr}html.page-500 .p500-section-head{align-items:flex-start;flex-direction:column}html.page-500 .p500-workspace-strip{align-items:stretch;flex-direction:column}.p500-route{min-height:42px}}',
'',
'html.page-500 .p500-portlet-region .t-Region-header{display:none!important}',
'html.page-500 .p500-portlet-region .t-Region-body{padding:0!important}',
'/* p500-portlets-compact-v1 */',
'',
'html.page-500 .p500-portlet-region{background:transparent!important;border:0!important;box-shadow:none!important}',
'html.page-500 .p500-workspace{padding:18px 20px 32px}',
'html.page-500 .p500-hero{box-sizing:border-box;min-height:162px;padding:22px 30px;gap:24px;border-radius:18px}',
'html.page-500 .p500-eyebrow{margin-bottom:7px;font-size:10px}',
'html.page-500 .p500-eyebrow i{width:25px;height:25px;font-size:12px}',
'html.page-500 .p500-hero h1{font-size:clamp(27px,2.3vw,36px)}',
'html.page-500 .p500-hero p{margin-top:7px;font-size:14px;line-height:1.48}',
'html.page-500 .p500-hero-note{max-width:225px;padding:5px 0 5px 16px;font-size:14px;line-height:1.4}',
'html.page-500 .p500-hero-note:before{margin-bottom:5px;font-size:14px}',
'html.page-500 .p500-snapshot{gap:12px;margin:12px 0 21px}',
'html.page-500 .p500-snapshot-card{min-height:62px;gap:11px;padding:10px 13px;border-radius:13px}',
'html.page-500 .p500-snapshot-icon{flex-basis:35px;width:35px;height:35px;border-radius:11px;font-size:15px}',
'html.page-500 .p500-snapshot-card strong{font-size:13px}',
'html.page-500 .p500-snapshot-card span:last-child{margin-top:3px;font-size:11px}',
'html.page-500 .p500-section-head{margin-bottom:13px}',
'html.page-500 .p500-section-title{gap:11px}',
'html.page-500 .p500-section-title i{width:35px;height:35px;border-radius:11px;font-size:17px}',
'html.page-500 .p500-section-title h2{font-size:22px}',
'html.page-500 .p500-section-title p{margin-top:3px;font-size:13px}',
'html.page-500 .p500-portlet-grid{gap:14px}',
'html.page-500 .p500-portlet-card{min-height:164px;padding:16px 17px 13px;border-radius:15px}',
'html.page-500 .p500-card-icon{width:44px;height:44px;border-radius:14px;font-size:21px}',
'html.page-500 .p500-card-arrow{width:31px;height:31px;font-size:12px}',
'html.page-500 .p500-portlet-card h3{margin:13px 0 5px;font-size:16px}',
'html.page-500 .p500-portlet-card p{font-size:12px;line-height:1.42}',
'html.page-500 .p500-card-bottom{gap:11px;padding-top:9px;font-size:11px}',
'html.page-500 .p500-workspace-strip{gap:13px;margin-top:19px;padding:11px 14px;border-radius:15px}',
'',
'',
'/* p500-portlets-top-gap-v1 */',
'html.page-500 .t-Body-contentInner{padding-top:4px!important}',
'html.page-500 .p500-workspace{padding-top:8px}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(450504317444518815)
,p_plug_name=>'Portlets workspace'
,p_static_id=>'p500-portlet-workspace'
,p_region_css_classes=>'p500-portlet-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<main class="p500-workspace" aria-label="Portlets workspace">',
'  <section aria-labelledby="p500-portlets-title">',
'    <div class="p500-portlet-grid">',
'      <a class="p500-portlet-card" href="f?p=&APP_ID.:501:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-area-chart" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidden="true"></i></div><h3>Re'
||unistr('venue</h3><p>Track revenue performance, trends and the metrics that matter.</p><div class="p500-card-bottom"><span class="p500-card-number">01</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--teal" href="f?p=&APP_ID.:502:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-cart-plus" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidden='
||unistr('"true"></i></div><h3>Purchase</h3><p>Manage purchasing activity and supplier performance in one view.</p><div class="p500-card-bottom"><span class="p500-card-number">02</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--violet" href="f?p=&APP_ID.:504:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-crosshairs" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidd'
||unistr('en="true"></i></div><h3>Sales Dashboard</h3><p>Monitor sales, orders and customer activity with clarity.</p><div class="p500-card-bottom"><span class="p500-card-number">03</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--amber" href="f?p=&APP_ID.:506:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-cart-arrow-down" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-'
||unistr('hidden="true"></i></div><h3>Purchase Dashboard</h3><p>See purchase metrics, suppliers and procurement progress.</p><div class="p500-card-bottom"><span class="p500-card-number">04</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--green" href="f?p=&APP_ID.:503:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-pie-chart" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidden'
||unistr('="true"></i></div><h3>Issue Analysis</h3><p>Identify trends, priorities and follow-up actions faster.</p><div class="p500-card-bottom"><span class="p500-card-number">05</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--rose" href="f?p=&APP_ID.:509:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-users" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidden="tru'
||unistr('e"></i></div><h3>HR Dashboard</h3><p>Bring people, workforce metrics and priorities together.</p><div class="p500-card-bottom"><span class="p500-card-number">06</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--amber" href="f?p=&APP_ID.:520:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-money" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidden="tr'
||unistr('ue"></i></div><h3>Account Dashboard</h3><p>Keep financial position and account summaries in focus.</p><div class="p500-card-bottom"><span class="p500-card-number">07</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'      <a class="p500-portlet-card p500-portlet-card--sky" href="f?p=&APP_ID.:521:&APP_SESSION.::::"><div class="p500-card-top"><i class="p500-card-icon fa fa-line-chart" aria-hidden="true"></i><i class="p500-card-arrow fa fa-arrow-right" aria-hidden='
||unistr('"true"></i></div><h3>Trade Analysis</h3><p>Compare trade performance and make better decisions.</p><div class="p500-card-bottom"><span class="p500-card-number">08</span><span>Open dashboard&nbsp; \2192</span></div></a>'),
'    </div>',
'  </section>',
'',
'  <section class="p500-workspace-strip" aria-label="Quick workspace routes">',
'    <div class="p500-workspace-label"><i class="fa fa-briefcase" aria-hidden="true"></i><span><strong>Quick routes</strong><span>Continue an operational workflow</span></span></div>',
'    <a class="p500-route" href="f?p=&APP_ID.:118:&APP_SESSION.::::"><i></i><span><b>Purchase Order</b><small>New document</small></span></a>',
'    <a class="p500-route" href="f?p=&APP_ID.:146:&APP_SESSION.::::"><i></i><span><b>Goods Receipt Note</b><small>New document</small></span></a>',
'    <a class="p500-route" href="f?p=&APP_ID.:143:&APP_SESSION.::::"><i></i><span><b>Purchase Bill</b><small>New document</small></span></a>',
'    <a class="p500-view-all" href="f?p=&APP_ID.:1:&APP_SESSION.::::">Open home <i class="fa fa-arrow-right" aria-hidden="true"></i></a>',
'  </section>',
'</main>',
''))
,p_list_id=>wwv_flow_imp.id(441319732137631757)
,p_list_template_id=>2886769488667748277
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441594540768231135)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441594954163231135)
,p_event_id=>wwv_flow_imp.id(441594540768231135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(55456239893090966)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(55852564912426317)
,p_event_id=>wwv_flow_imp.id(55456239893090966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
