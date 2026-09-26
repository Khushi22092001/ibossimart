prompt --application/pages/page_00901
begin
--   Manifest
--     PAGE: 00901
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
 p_id=>901
,p_name=>'Business Insights'
,p_alias=>'BUSINESS-INSIGHTS'
,p_step_title=>'Business Insights'
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
'html.page-901 body,html.page-901 .t-Body-content{background:#f5f7fc!important}',
'html.page-901 .t-Body-contentInner{padding-top:8px!important}',
'html.page-901 #business-insights-cards,html.page-901 #business-insights-cards .t-Region-body,html.page-901 #business-insights-cards .t-Region-wrap{border:0!important;background:transparent!important;box-shadow:none!important}',
'html.page-901 #business-insights-cards>.t-Region-header{display:none!important}',
'html.page-901 #business-insights-cards .t-Region-body{padding:0 0 24px!important}',
'html.page-901 .bi-workspace{--bi-ink:#16244a;--bi-muted:#64749a;--bi-line:#e0e8f5;max-width:1560px;margin:0 auto;padding:8px 20px 36px;color:var(--bi-ink)}',
'html.page-901 .bi-section-head{display:flex;align-items:flex-end;justify-content:space-between;gap:16px;margin:0 0 14px}',
'html.page-901 .bi-section-title{display:flex;align-items:center;gap:11px}',
'html.page-901 .bi-section-title>i{display:grid;place-items:center;width:35px;height:35px;color:#5857dc;border-radius:11px;background:#eef1ff;font-size:17px}',
'html.page-901 .bi-section-title h2{margin:0;color:var(--bi-ink);font-size:22px;line-height:1.12;letter-spacing:-.03em}',
'html.page-901 .bi-section-title p{margin:3px 0 0;color:var(--bi-muted);font-size:13px}',
'html.page-901 .bi-section-meta{margin:0 3px 2px;color:#7281a2;font-size:12px;font-weight:700}',
'html.page-901 .bi-portlet-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:14px}',
'html.page-901 .bi-portlet-card{--bi-accent:#5263df;--bi-wash:#edf1ff;--bi-layer:rgba(82,99,223,.12);position:relative;isolation:isolate;min-height:164px;overflow:hidden;display:flex;flex-direction:column;padding:16px 17px 13px;color:var(--bi-ink);tex'
||'t-decoration:none;border:1px solid var(--bi-line);border-radius:15px;background:linear-gradient(135deg,#fff 0%,#fbfcff 70%,var(--bi-wash) 155%);box-shadow:0 9px 22px rgba(28,49,101,.045)}',
'html.page-901 .bi-portlet-card:before{content:"";position:absolute;z-index:-1;right:-47px;bottom:-83px;width:205px;height:150px;border:22px solid var(--bi-layer);border-radius:39px;transform:rotate(-20deg);box-shadow:-31px -18px 0 rgba(255,255,255,.5'
||'5)}',
'html.page-901 a.bi-portlet-card{cursor:pointer;transition:transform .2s ease,box-shadow .2s ease,border-color .2s ease}',
'html.page-901 a.bi-portlet-card:hover{transform:translateY(-4px);border-color:#bcccf7;box-shadow:0 17px 32px rgba(39,63,133,.12)}',
'html.page-901 .bi-portlet-card--coming{filter:saturate(.72);cursor:default}',
'html.page-901 .bi-portlet-card--teal{--bi-accent:#0a9da0;--bi-wash:#e9fbfb;--bi-layer:rgba(10,157,160,.13)}',
'html.page-901 .bi-portlet-card--violet{--bi-accent:#7853dd;--bi-wash:#f2edff;--bi-layer:rgba(120,83,221,.13)}',
'html.page-901 .bi-portlet-card--amber{--bi-accent:#ad751f;--bi-wash:#fff7e9;--bi-layer:rgba(214,151,44,.13)}',
'html.page-901 .bi-portlet-card--green{--bi-accent:#239b63;--bi-wash:#edfbf4;--bi-layer:rgba(35,155,99,.12)}',
'html.page-901 .bi-portlet-card--sky{--bi-accent:#2474d8;--bi-wash:#eef5ff;--bi-layer:rgba(36,116,216,.12)}',
'html.page-901 .bi-card-top{display:flex;align-items:flex-start;justify-content:space-between;gap:12px}',
'html.page-901 .bi-card-icon{display:grid;place-items:center;width:44px;height:44px;color:var(--bi-accent);border-radius:14px;background:var(--bi-wash);font-size:21px}',
'html.page-901 .bi-card-arrow,html.page-901 .bi-card-status{display:grid;place-items:center;min-width:31px;height:31px;color:var(--bi-accent);border:1px solid color-mix(in srgb,var(--bi-accent) 17%,white);border-radius:50%;background:rgba(255,255,255,'
||'.82);font-size:12px;box-shadow:0 4px 10px rgba(37,57,108,.05)}',
'html.page-901 .bi-portlet-card h3{margin:13px 0 5px;color:var(--bi-ink);font-size:16px;line-height:1.2;letter-spacing:-.022em}',
'html.page-901 .bi-portlet-card p{margin:0;color:#637397;font-size:12px;line-height:1.42}',
'html.page-901 .bi-card-bottom{display:flex;align-items:center;gap:11px;margin-top:auto;padding-top:9px;color:var(--bi-accent);font-size:11px;font-weight:750}',
'html.page-901 .bi-card-number{padding-right:11px;border-right:1px solid #dbe3f3;font-variant-numeric:tabular-nums}',
'html.page-901 .bi-card-status{width:auto;min-width:0;height:auto;padding:4px 8px;border-radius:99px;color:#77839d;border-color:#e1e7f1;background:#f7f9fc;font-size:10px;font-weight:750;box-shadow:none}',
'@media(max-width:980px){html.page-901 .bi-portlet-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}',
'@media(max-width:620px){html.page-901 .bi-workspace{padding:6px 12px 28px}html.page-901 .bi-section-head{align-items:flex-start;flex-direction:column}html.page-901 .bi-portlet-grid{grid-template-columns:1fr}}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'06'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309012000)
,p_plug_name=>'Business Insights'
,p_static_id=>'business-insights-cards'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<main class="bi-workspace" aria-label="Business Insights">',
'  <section aria-labelledby="bi-portlets-title">',
'    <div class="bi-section-head"><div class="bi-section-title"><i class="fa fa-th-large" aria-hidden="true"></i><span><h2 id="bi-portlets-title">Insight workspaces</h2><p>Choose a live dashboard or see what is being prepared next.</p></span></div><p '
||unistr('class="bi-section-meta">6 live workspaces \00B7 1 coming soon</p></div>'),
'    <div class="bi-portlet-grid">',
'      <a class="bi-portlet-card" href="f?p=&APP_ID.:902:&APP_SESSION.::&DEBUG.:902::"><div class="bi-card-top"><i class="bi-card-icon fa fa-calculator" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hidden="true"></i></div><h3'
||'>Accounts</h3><p>Review trial balance, account hierarchy and debit-credit control.</p><div class="bi-card-bottom"><span class="bi-card-number">01</span><span>Open trial balance &#8594;</span></div></a>',
'      <a class="bi-portlet-card bi-portlet-card--violet" href="f?p=&APP_ID.:904:&APP_SESSION.::::"><div class="bi-card-top"><i class="bi-card-icon fa fa-area-chart" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hidden="true">'
||'</i></div><h3>Profit and Loss Summary</h3><p>Review revenue, cost, margin and monthly profitability with drill-through analysis.</p><div class="bi-card-bottom"><span class="bi-card-number">02</span><span>Open P&amp;L summary &#8594;</span></div></a>',
'      <a class="bi-portlet-card bi-portlet-card--teal" href="f?p=&APP_ID.:934:&APP_SESSION.::&DEBUG.:934::"><div class="bi-card-top"><i class="bi-card-icon fa fa-cart-plus" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hidden'
||'="true"></i></div><h3>Purchase Command Centre</h3><p>Procurement pulse, sourcing, purchase-to-pay execution, supplier performance and exception control.</p><div class="bi-card-bottom"><span class="bi-card-number">03</span><span>Open command centre &#'
||'8594;</span></div></a>',
'      <a class="bi-portlet-card bi-portlet-card--amber" href="f?p=&APP_ID.:940:&APP_SESSION.::&DEBUG.:940::"><div class="bi-card-top"><i class="bi-card-icon fa fa-line-chart" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hidd'
||'en="true"></i></div><h3>Purchase Analytics</h3><p>Analyse spend trends, supplier concentration, delivery performance, item rates and procurement exceptions.</p><div class="bi-card-bottom"><span class="bi-card-number">04</span><span>Open purchase anal'
||'ytics &#8594;</span></div></a>',
'      <a class="bi-portlet-card bi-portlet-card--violet" href="f?p=&APP_ID.:721:&APP_SESSION.::&DEBUG.:721::"><div class="bi-card-top"><i class="bi-card-icon fa fa-line-chart" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hid'
||'den="true"></i></div><h3>Sales Lifecycle</h3><p>Follow sales movement from enquiry to fulfilment and collection.</p><div class="bi-card-bottom"><span class="bi-card-number">05</span><span>Open control tower &#8594;</span></div></a>',
'      <a class="bi-portlet-card bi-portlet-card--green" href="f?p=&APP_ID.:907:&APP_SESSION.::::"><div class="bi-card-top"><i class="bi-card-icon fa fa-arrow-circle-down" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hidden="'
||'true"></i></div><h3>Receivable</h3><p>Monitor outstanding customer balances and collection progress.</p><div class="bi-card-bottom"><span class="bi-card-number">06</span><span>Open command centre &#8594;</span></div></a>',
'      <a class="bi-portlet-card bi-portlet-card--amber" href="f?p=&APP_ID.:920:&APP_SESSION.::::"><div class="bi-card-top"><i class="bi-card-icon fa fa-arrow-circle-up" aria-hidden="true"></i><i class="bi-card-arrow fa fa-arrow-right" aria-hidden="tr'
||'ue"></i></div><h3>Payable</h3><p>Track supplier obligations, due dates and payment readiness.</p><div class="bi-card-bottom"><span class="bi-card-number">07</span><span>Open command centre &#8594;</span></div></a>',
'      <div class="bi-portlet-card bi-portlet-card--sky bi-portlet-card--coming" aria-disabled="true"><div class="bi-card-top"><i class="bi-card-icon fa fa-cubes" aria-hidden="true"></i><span class="bi-card-status">Coming soon</span></div><h3>Inventor'
||'y</h3><p>Bring stock position, movement and availability into one view.</p><div class="bi-card-bottom"><span class="bi-card-number">08</span><span>In preparation</span></div></div>',
'    </div>',
'  </section>',
'</main>'))
);
wwv_flow_imp.component_end;
end;
/
