prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'InfoMart | Operations workspace'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* Home: user-specific popular pages sourced from APEX activity history. */',
'(function () {',
'  function escapeHtml(value) {',
'    return String(value || '''').replace(/[&<>''"]/g, function (char) {',
'      return {''&'':''&amp;'',''<'':''&lt;'',''>'':''&gt;'',"''":''&#39;'',''"'':''&quot;''}[char];',
'    });',
'  }',
'  function pageUrl(pageId) {',
'    return ''f?p='' + $v(''pFlowId'') + '':'' + pageId + '':'' + $v(''pInstance'') + ''::::'';',
'  }',
'  function cardClass(index) {',
'    return ['''', '' imart-home-card--teal'', '' imart-home-card--amber'', '' imart-home-card--purple'', '' imart-home-card--rose''][index % 5];',
'  }',
'  function renderPopularPages(payload) {',
'    var pages = payload && payload.pages || [];',
'    if (!pages.length) return; // The curated operational shortcuts remain useful for a new user.',
'    var section = document.querySelector(''.imart-home-section'');',
'    var grid = section && section.querySelector(''.imart-home-grid'');',
'    if (!section || !grid) return;',
'    var heading = section.querySelector(''h2'');',
'    var description = section.querySelector(''.imart-home-section-head p'');',
'    var link = section.querySelector(''.imart-home-section-link'');',
'    if (heading) heading.textContent = ''Popular Pages'';',
'    if (description) description.textContent = ''Your most frequently used pages, based on your own activity.'';',
unistr('    if (link) { link.textContent = ''View all pages \2192''; link.href = ''f?p='' + $v(''pFlowId'') + '':1:'' + $v(''pInstance'') + ''::::''; }'),
'    grid.id = ''imart-popular-pages'';',
'    grid.innerHTML = pages.map(function (page, index) {',
'      var count = Number(page.visitCount) || 0;',
'      var label = count === 1 ? ''Visited once'' : ''Visited '' + count + '' times'';',
'      return ''<a class="imart-home-card'' + cardClass(index) + ''" href="'' + pageUrl(page.pageId) + ''">'' +',
unistr('        ''<span class="imart-home-card-icon">'' + (index % 2 ? ''\2197'' : ''\25A3'') + ''</span>'' +'),
'        ''<h3>'' + escapeHtml(page.pageName) + ''</h3>'' +',
unistr('        ''<p>'' + label + ''</p><span class="imart-home-card-arrow">\2192</span></a>'';'),
'    }).join('''');',
'  }',
'  function loadPopularPages() {',
'    if (!(window.apex && apex.server && document.querySelector(''.imart-home-section''))) return;',
'    apex.server.process(''GET_POPULAR_PAGES'', {}, { dataType: ''json'', success: renderPopularPages });',
'  }',
'  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', loadPopularPages, { once: true });',
'  else loadPopularPages();',
'}());',
'',
'',
'/* Home: full inbound workflow launcher with server-side rights checks. */',
'(function () {',
'  var modules = [',
unistr('    [''INDENT'', ''Indent'', ''\25A4''],'),
unistr('    [''ENQUIRY'', ''Purchase Enquiry'', ''\2315''],'),
unistr('    [''QUOTATION'', ''Purchase Quotation'', ''\25EB''],'),
unistr('    [''COMPARATIVESTATEMENT'', ''Comparative Statement'', ''\224B''],'),
unistr('    [''RATECONTRACT'', ''Rate Contract'', ''\20B9''],'),
unistr('    [''PURCHASEORDER'', ''Purchase Order'', ''\2301''],'),
unistr('    [''POAMENDMENT'', ''PO Amendment'', ''\270E''],'),
unistr('    [''LOADINGADVICE'', ''Loading Advice'', ''\21E3''],'),
unistr('    [''MATERIALIN'', ''Material In'', ''\2713''],'),
unistr('    [''GRN'', ''GRN'', ''\25A3''],'),
unistr('    [''FREIGHTADVICE'', ''Freight Advice'', ''\25B1''],'),
unistr('    [''PURCHASEBILL'', ''Purchase Bill'', ''\25E7''],'),
unistr('    [''PBPASS'', ''Purchase Bill Pass'', ''\2713''],'),
unistr('    [''PAYMENTADVICE'', ''Payment Advice'', ''\20B9''],'),
unistr('    [''VOUCHER'', ''Voucher Posting'', ''\25B0'']'),
'  ];',
'  function message(text) {',
'    if (window.apex && apex.message && apex.message.alert) apex.message.alert(text);',
'    else window.alert(text);',
'  }',
'  function openModule(moduleCode) {',
'    apex.server.process(''OPEN_INBOUND_WORKFLOW_MODULE'', {x01: moduleCode}, {',
'      dataType: ''json'',',
'      success: function (result) {',
'        if (!result || !result.allowed || !result.pageId) {',
unistr('          message(''You don\2019t have rights for this module.'');'),
'          return;',
'        }',
'        apex.navigation.redirect(''f?p='' + $v(''pFlowId'') + '':'' + result.pageId + '':'' + $v(''pInstance'') + ''::::'');',
'      },',
unistr('      error: function () { message(''You don\2019t have rights for this module.''); }'),
'    });',
'  }',
'  function renderLauncher() {',
'    var focus = document.querySelector(''.imart-home-focus'');',
'    var links = focus && focus.querySelector(''.imart-home-focus-links'');',
'    if (!focus || !links || links.dataset.workflowReady) return;',
'    links.dataset.workflowReady = ''true'';',
'    focus.querySelector(''.imart-home-kicker'').textContent = ''Workflow launcher'';',
'    focus.querySelector(''h2'').textContent = ''Keep the inbound cycle moving'';',
'    focus.querySelector(''p'').textContent = ''Start the right purchasing or inbound workflow. Access is checked for your user before the page opens.'';',
'    links.classList.add(''imart-home-workflow-grid'');',
'    links.innerHTML = modules.map(function (module, index) {',
'      return ''<button type="button" class="imart-home-workflow-card imart-home-workflow-card--'' + (index % 5) + ''" data-module="'' + module[0] + ''">'' +',
unistr('        ''<span class="imart-home-workflow-icon">'' + module[2] + ''</span><span>'' + module[1] + ''</span><b aria-hidden="true">\2192</b></button>'';'),
'    }).join('''');',
'    links.addEventListener(''click'', function (event) {',
'      var card = event.target.closest(''.imart-home-workflow-card'');',
'      if (card) openModule(card.getAttribute(''data-module''));',
'    });',
'  }',
'  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', renderLauncher, {once: true});',
'  else renderLauncher();',
'}());',
'',
'',
'/* Home: Order-to-Cash outward workflow launcher. */',
'(function () {',
'  var modules = [',
unistr('    [''SALESENQUIRY'', ''Sales Enquiry'', ''\2315''],'),
unistr('    [''SALESQUOTATION'', ''Sales Quotation'', ''\25EB''],'),
unistr('    [''PORECEIPT'', ''PO Receipt'', ''\25A3''],'),
unistr('    [''SALESORDER'', ''Sales Order'', ''\2301''],'),
unistr('    [''LOADINGADVICE'', ''Loading Advice'', ''\21E3''],'),
unistr('    [''DESPATCHADVICE'', ''Dispatch Advice'', ''\25B1''],'),
unistr('    [''CCINVOICE'', ''CC Invoice'', ''\25A4''],'),
unistr('    [''FREIGHTADVICE'', ''Freight Advice'', ''\20B9''],'),
unistr('    [''BILLRECEIPT'', ''Bill Receipt'', ''\2713'']'),
'  ];',
'',
'  function showNoRights() {',
'    if (window.apex && apex.message && apex.message.alert) {',
unistr('      apex.message.alert(''You don\2019t have rights for this module.'');'),
'    } else {',
unistr('      window.alert(''You don\2019t have rights for this module.'');'),
'    }',
'  }',
'',
'  function openModule(moduleCode) {',
'    apex.server.process(''OPEN_INBOUND_WORKFLOW_MODULE'', { x01: moduleCode }, {',
'      dataType: ''json'',',
'      success: function (result) {',
'        if (!result || !result.allowed || !result.pageId) {',
'          showNoRights();',
'          return;',
'        }',
'        apex.navigation.redirect(''f?p='' + $v(''pFlowId'') + '':'' + result.pageId + '':'' + $v(''pInstance'') + ''::::'');',
'      },',
'      error: showNoRights',
'    });',
'  }',
'',
'  function renderOutwardWorkflow() {',
'    var lower = document.querySelector(''.imart-home-lower'');',
'    if (!lower || lower.querySelector(''.imart-home-outward'')) return;',
'',
'    var section = document.createElement(''section'');',
'    section.className = ''imart-home-focus imart-home-outward'';',
'    section.setAttribute(''aria-label'', ''Order to Cash outward workflow'');',
'    section.innerHTML =',
'      ''<div class="imart-home-kicker">Order to Cash</div>'' +',
'      ''<h2>Keep the outward cycle moving</h2>'' +',
'      ''<p>Move from a sales enquiry through billing using the same role-based access checks as the Order to Cash module.</p>'' +',
'      ''<div class="imart-home-focus-links imart-home-workflow-grid imart-home-outward-grid"></div>'';',
'',
'    var day = lower.querySelector(''.imart-home-day'');',
'    if (day) lower.insertBefore(section, day);',
'    else lower.appendChild(section);',
'',
'    var links = section.querySelector(''.imart-home-outward-grid'');',
'    links.innerHTML = modules.map(function (module, index) {',
'      return ''<button type="button" class="imart-home-workflow-card imart-home-workflow-card--'' + (index % 5) + ''" data-module="'' + module[0] + ''">'' +',
unistr('        ''<span class="imart-home-workflow-icon">'' + module[2] + ''</span><span>'' + module[1] + ''</span><b aria-hidden="true">\2192</b></button>'';'),
'    }).join('''');',
'    links.addEventListener(''click'', function (event) {',
'      var card = event.target.closest(''.imart-home-workflow-card'');',
'      if (card) openModule(card.getAttribute(''data-module''));',
'    });',
'  }',
'',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', renderOutwardWorkflow, { once: true });',
'  } else {',
'    window.setTimeout(renderOutwardWorkflow, 0);',
'  }',
'}());',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body:has(.imart-home-shell){background:#f4f7fc}body:has(.imart-home-shell)::before{content:none!important;display:none!important}.imart-home-region,.imart-home-region .t-Region-body,.imart-home-region .t-Region-wrap{background:transparent!important;b'
||'order:0!important;box-shadow:none!important}.imart-home-region .t-Region-header{display:none!important}.imart-home-region .t-Region-body{padding:0!important}.imart-home-shell{--ink:#17213d;--muted:#66738f;--line:#e3e9f4;--blue:#2854d9;max-width:1520p'
||'x;margin:0 auto;padding:26px 24px 42px;color:var(--ink);font-family:Inter,"Segoe UI",sans-serif}.imart-home-hero{position:relative;isolation:isolate;min-height:325px;overflow:hidden;border-radius:24px;padding:42px 46px;display:grid;grid-template-colu'
||'mns:minmax(0,.95fr) minmax(390px,1.05fr);align-items:center;background:linear-gradient(123deg,#112b71 0%,#3155c7 47%,#705ee7 100%);box-shadow:0 20px 45px rgba(38,61,148,.22)}.imart-home-hero:before{content:"";position:absolute;z-index:-1;width:470px;'
||'height:470px;left:-175px;bottom:-320px;border:1px solid rgba(255,255,255,.20);border-radius:50%;box-shadow:0 0 0 48px rgba(255,255,255,.045),0 0 0 97px rgba(255,255,255,.04)}.imart-home-hero:after{content:"";position:absolute;z-index:-1;inset:0;backg'
||'round:radial-gradient(circle at 71% 8%,rgba(179,209,255,.50),transparent 28%),linear-gradient(90deg,rgba(6,18,58,.25),transparent 65%)}.imart-home-copy{position:relative;z-index:2;max-width:630px}.imart-home-eyebrow{margin:0 0 16px;display:inline-fle'
||'x;align-items:center;gap:9px;padding:8px 12px;border:1px solid rgba(255,255,255,.28);border-radius:999px;color:#fff;background:rgba(255,255,255,.11);font-weight:700;font-size:12px;letter-spacing:.07em;text-transform:uppercase}.imart-home-eyebrow:befo'
||'re{content:"";width:8px;height:8px;border-radius:50%;background:#77f0ce;box-shadow:0 0 0 4px rgba(119,240,206,.15)}.imart-home-hero h1{color:#fff;font-size:clamp(30px,3vw,48px);line-height:1.08;letter-spacing:-.045em;margin:0 0 13px;font-weight:800}.'
||'imart-home-hero p{margin:0;max-width:560px;color:rgba(243,247,255,.83);line-height:1.65;font-size:16px}.imart-home-hero-actions{display:flex;flex-wrap:wrap;gap:11px;margin-top:26px}.imart-home-primary,.imart-home-secondary{display:inline-flex;align-i'
||'tems:center;gap:9px;text-decoration:none;font-weight:750;font-size:14px;border-radius:10px;padding:12px 16px;transition:transform .18s ease}.imart-home-primary{color:#1d2b62;background:#fff;box-shadow:0 7px 18px rgba(6,17,55,.18)}.imart-home-secondar'
||'y{color:#fff;border:1px solid rgba(255,255,255,.3);background:rgba(255,255,255,.08)}.imart-home-primary:hover,.imart-home-secondary:hover{transform:translateY(-2px)}.imart-home-hero-art{position:absolute;pointer-events:none;z-index:1;right:0;inset-bl'
||'ock:0;width:58%;display:flex;align-items:flex-end}.imart-home-hero-art img{width:100%;height:100%;object-fit:cover;object-position:right center;mix-blend-mode:screen;opacity:.86;mask-image:linear-gradient(90deg,transparent 0%,black 23%,black 100%)}.i'
||'mart-home-meta{position:absolute;z-index:3;right:31px;bottom:25px;display:flex;gap:9px}.imart-home-meta span{color:#ecf1ff;font-size:12px;font-weight:650;padding:7px 10px;border-radius:8px;background:rgba(10,24,76,.35);backdrop-filter:blur(8px);borde'
||'r:1px solid rgba(255,255,255,.16)}.imart-home-section{margin-top:24px;padding:25px;border:1px solid var(--line);border-radius:18px;background:#fff;box-shadow:0 10px 25px rgba(27,47,96,.055)}.imart-home-section-head{display:flex;align-items:flex-start'
||';justify-content:space-between;gap:16px;margin-bottom:20px}.imart-home-section h2{margin:0;font-size:19px;line-height:1.2;letter-spacing:-.025em}.imart-home-section-head p{margin:5px 0 0;color:var(--muted);font-size:13px}.imart-home-section-link{colo'
||'r:var(--blue);font-size:13px;font-weight:750;text-decoration:none;white-space:nowrap}.imart-home-grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:13px}.imart-home-card{position:relative;min-height:139px;padding:18px;overflow:hidden'
||';display:flex;flex-direction:column;align-items:flex-start;text-decoration:none;color:var(--ink);border:1px solid #e3e8f2;border-radius:15px;background:linear-gradient(180deg,#fff,#fbfcff);transition:transform .18s ease,box-shadow .18s ease,border-co'
||'lor .18s ease}.imart-home-card:hover{transform:translateY(-4px);border-color:#b8c7f6;box-shadow:0 14px 25px rgba(47,73,155,.12)}.imart-home-card-icon{width:40px;height:40px;display:grid;place-items:center;color:var(--accent,#2854d9);border-radius:12p'
||'x;background:var(--wash,#edf2ff);font-size:18px}.imart-home-card h3{margin:17px 0 5px;font-size:14px}.imart-home-card p{margin:0;color:var(--muted);font-size:12px;line-height:1.45}.imart-home-card-arrow{position:absolute;right:16px;bottom:15px;color:'
||'var(--accent,#2854d9);font-size:18px}.imart-home-card--teal{--accent:#078e91;--wash:#e8f8f7}.imart-home-card--amber{--accent:#cd7a08;--wash:#fff6e5}.imart-home-card--rose{--accent:#dc476a;--wash:#fff0f3}.imart-home-card--purple{--accent:#6a53e6;--was'
||'h:#f0edff}.imart-home-lower{display:grid;grid-template-columns:minmax(0,1.2fr) minmax(340px,.8fr);gap:24px;margin-top:24px}.imart-home-focus{padding:24px;border-radius:18px;color:#eef3ff;background:linear-gradient(135deg,#172d6d,#273e91);box-shadow:0'
||' 12px 28px rgba(24,47,120,.16)}.imart-home-focus .imart-home-kicker{color:#9db9ff;font-size:12px;font-weight:750;letter-spacing:.08em;text-transform:uppercase}.imart-home-focus h2{margin:9px 0 8px;color:#fff;font-size:22px}.imart-home-focus p{margin:'
||'0;color:#c9d5fa;font-size:14px;line-height:1.6}.imart-home-focus-links{display:grid;grid-template-columns:repeat(3,1fr);gap:9px;margin-top:20px}.imart-home-focus-links a{display:flex;align-items:center;justify-content:space-between;min-height:48px;pa'
||'dding:0 12px;color:#fff;text-decoration:none;font-size:13px;font-weight:700;border:1px solid rgba(255,255,255,.17);border-radius:10px;background:rgba(255,255,255,.08)}.imart-home-day{padding:24px;border:1px solid var(--line);border-radius:18px;backgr'
||'ound:#fff}.imart-home-day h2{margin:0 0 7px;font-size:19px}.imart-home-day>p{margin:0;color:var(--muted);font-size:13px;line-height:1.55}.imart-home-day-list{margin:18px 0 0;padding:0;list-style:none}.imart-home-day-list li{display:flex;align-items:c'
||'enter;gap:10px;padding:11px 0;border-top:1px solid #eef1f6;color:#43506d;font-size:13px;font-weight:650}.imart-home-day-list i{width:23px;height:23px;display:grid;place-items:center;color:#0d9984;border-radius:50%;background:#e7f8f2;font-size:11px}@m'
||'edia(max-width:1100px){.imart-home-grid{grid-template-columns:repeat(2,minmax(0,1fr))}.imart-home-hero{grid-template-columns:1fr}.imart-home-hero-art{width:60%;opacity:.5}.imart-home-lower{grid-template-columns:1fr}}@media(max-width:680px){.imart-hom'
||'e-shell{padding:14px 12px 26px}.imart-home-hero{min-height:390px;padding:30px 24px;border-radius:18px}.imart-home-hero-art{width:100%;opacity:.32}.imart-home-meta{right:18px;bottom:17px}.imart-home-section{padding:18px;border-radius:15px}.imart-home-'
||'grid{grid-template-columns:1fr}.imart-home-section-head{flex-direction:column}.imart-home-focus-links{grid-template-columns:1fr}}',
'',
'/* Full-width, rights-aware workflow launcher on Home. */',
'.imart-home-lower:has(.imart-home-workflow-grid) { grid-template-columns: 1fr !important; }',
'.imart-home-focus:has(.imart-home-workflow-grid) { grid-column: 1 / -1 !important; }',
'.imart-home-workflow-grid { grid-template-columns: repeat(5, minmax(0, 1fr)) !important; gap: 10px !important; }',
'.imart-home-workflow-card { min-width: 0; min-height: 56px; display: flex; align-items: center; gap: 10px; padding: 10px 12px; color: #fff; font: inherit; font-size: 13px; font-weight: 700; text-align: left; cursor: pointer; border: 1px solid rgba(25'
||'5,255,255,.18); border-radius: 11px; background: rgba(255,255,255,.08); transition: transform .16s ease, background .16s ease, border-color .16s ease; }',
'.imart-home-workflow-card:hover, .imart-home-workflow-card:focus-visible { transform: translateY(-2px); background: rgba(255,255,255,.16); border-color: rgba(255,255,255,.36); outline: 0; }',
'.imart-home-workflow-card span:nth-child(2) { min-width: 0; flex: 1; line-height: 1.25; }',
'.imart-home-workflow-card b { font-size: 18px; font-weight: 700; }',
'.imart-home-workflow-icon { width: 29px; height: 29px; flex: 0 0 29px; display: grid; place-items: center; color: #18316f; border-radius: 8px; background: #d9e6ff; font-size: 15px; }',
'.imart-home-workflow-card--1 .imart-home-workflow-icon { background: #c9f1ed; color: #087b78; }',
'.imart-home-workflow-card--2 .imart-home-workflow-icon { background: #fff0c8; color: #a85c00; }',
'.imart-home-workflow-card--3 .imart-home-workflow-icon { background: #eadfff; color: #6744c2; }',
'.imart-home-workflow-card--4 .imart-home-workflow-icon { background: #ffdbe6; color: #b7355b; }',
'@media (max-width: 1100px) { .imart-home-workflow-grid { grid-template-columns: repeat(3, minmax(0, 1fr)) !important; } }',
'@media (max-width: 680px) { .imart-home-workflow-grid { grid-template-columns: 1fr !important; } }',
'',
'',
'/* Home full-canvas layout. */',
'body:not(.t-PageBody--login) .imart-home-region .t-Region-body {',
'  padding:0!important;',
'}',
'body:not(.t-PageBody--login) .imart-home-shell {',
'  max-width:none!important;',
'  margin:0!important;',
'  padding:0 0 24px!important;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(222311421388558335)
,p_page_template_options=>'#DEFAULT#'
,p_browser_cache=>'N'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(583548105702426249)
,p_plug_name=>'Iron Mart'
,p_static_id=>'iron-mart'
,p_region_css_classes=>'imart-home-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<main class="imart-home-shell" aria-label="InfoMart operations workspace"><section class="imart-home-hero"><div class="imart-home-copy"><div class="imart-home-eyebrow">Operations workspace</div><h1>Make every movement<br>matter.</h1><p>One calm start'
||unistr('ing point for purchasing, incoming goods and inventory operations\2014built to help you move from plan to action without the clutter.</p><div class="imart-home-hero-actions"><a class="imart-home-primary" href="f?p=&APP_ID.:117:&APP_SESSION.::::">Open pur')
||unistr('chase orders <span aria-hidden="true">\2192</span></a><a class="imart-home-secondary" href="f?p=&APP_ID.:145:&APP_SESSION.::::">View GRN register <span aria-hidden="true">\2197</span></a></div></div><div class="imart-home-hero-art"><img src="#APP_FILES#imart')
||unistr('-home-operations-hero.png" alt=""></div><div class="imart-home-meta"><span>IMART workspace</span><span>FY 26\201327</span></div></section><section class="imart-home-section"><div class="imart-home-section-head"><div><h2>Start where the work is</h2><p>Dir')
||unistr('ect access to the operational registers your team uses every day.</p></div><a class="imart-home-section-link" href="f?p=&APP_ID.:117:&APP_SESSION.::::">Browse purchasing \2192</a></div><div class="imart-home-grid"><a class="imart-home-card" href="f?p=&AP')
||unistr('P_ID.:117:&APP_SESSION.::::"><span class="imart-home-card-icon">\25A3</span><h3>Purchase orders</h3><p>Create, review and track supplier commitments.</p><span class="imart-home-card-arrow">\2192</span></a><a class="imart-home-card imart-home-card--teal" href')
||unistr('="f?p=&APP_ID.:145:&APP_SESSION.::::"><span class="imart-home-card-icon">\21E3</span><h3>Goods receipt notes</h3><p>Receive materials and keep the inbound flow moving.</p><span class="imart-home-card-arrow">\2192</span></a><a class="imart-home-card imart-hom')
||unistr('e-card--amber" href="f?p=&APP_ID.:142:&APP_SESSION.::::"><span class="imart-home-card-icon">\25EB</span><h3>Purchase bills</h3><p>Review bills with the right purchasing context.</p><span class="imart-home-card-arrow">\2192</span></a><a class="imart-home-card')
||unistr(' imart-home-card--purple" href="f?p=&APP_ID.:407:&APP_SESSION.::::"><span class="imart-home-card-icon">\25C8</span><h3>Stock statement</h3><p>See inventory positions when you need them.</p><span class="imart-home-card-arrow">\2192</span></a><a class="imart-h')
||unistr('ome-card imart-home-card--rose" href="f?p=&APP_ID.:68:&APP_SESSION.::::"><span class="imart-home-card-icon">\21E2</span><h3>Material in</h3><p>Follow every inbound material movement.</p><span class="imart-home-card-arrow">\2192</span></a><a class="imart-home')
||unistr('-card imart-home-card--teal" href="f?p=&APP_ID.:129:&APP_SESSION.::::"><span class="imart-home-card-icon">\2713</span><h3>Requisitions</h3><p>Move approved requirements into procurement.</p><span class="imart-home-card-arrow">\2192</span></a><a class="imart-')
||unistr('home-card imart-home-card--amber" href="f?p=&APP_ID.:107:&APP_SESSION.::::"><span class="imart-home-card-icon">\2301</span><h3>Indent register</h3><p>Keep demand intake visible and accountable.</p><span class="imart-home-card-arrow">\2192</span></a><a class=')
||unistr('"imart-home-card imart-home-card--purple" href="f?p=&APP_ID.:151:&APP_SESSION.::::"><span class="imart-home-card-icon">\25A4</span><h3>Bill pass</h3><p>Route purchase bill passes with confidence.</p><span class="imart-home-card-arrow">\2192</span></a></div><')
||'/section><div class="imart-home-lower"><section class="imart-home-focus"><div class="imart-home-kicker">Workflow launcher</div><h2>Keep the inbound cycle moving</h2><p>Use the flow that matches the next decision your team needs to make.</p><div class'
||unistr('="imart-home-focus-links"><a href="f?p=&APP_ID.:118:&APP_SESSION.::::">New PO <span>\2192</span></a><a href="f?p=&APP_ID.:146:&APP_SESSION.::::">New GRN <span>\2192</span></a><a href="f?p=&APP_ID.:143:&APP_SESSION.::::">New bill <span>\2192</span></a></div></sec')
||unistr('tion><aside class="imart-home-day"><h2>Your workspace, ready</h2><p>Choose a register above to continue a workflow or create a new document from the launcher.</p><ul class="imart-home-day-list"><li><i>\2713</i>Shortcuts lead to the live IMART pages</li><')
||unistr('li><i>\2713</i>Designed for focused, low-friction work</li><li><i>\2713</i>Your role determines available actions</li></ul></aside></div></main>')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455117972350698197)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455118274410698198)
,p_event_id=>wwv_flow_imp.id(455117972350698197)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
