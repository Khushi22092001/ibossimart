prompt --application/pages/page_00069
begin
--   Manifest
--     PAGE: 00069
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
 p_id=>69
,p_name=>'Material In'
,p_alias=>'MATERIAL-IN'
,p_step_title=>'Material In'
,p_warn_on_unsaved_changes=>'N'
,p_html_page_onload=>'class="hspl-mi"'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#myfunctions#MIN#.js',
'#APP_FILES#hspl-material-in.js?cb=20260902e'))
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
'  var bireporturl = $(''#P69_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/MaterialIN.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P69_TNO'').val() ',
'      ;',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P69_BIREPORTURL'').val()',
'  var reportName =  ''MaterialIN.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P69_TNO'').val() ',
'      ;',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function(){',
'function initMaterialIn(){',
' var tabs=document.getElementById(''tabcontainer''), holder=tabs&&tabs.querySelector(''.t-TabsRegion-items''), hero=document.querySelector(''.hspl-mi-hero-side''), actions=document.getElementById(''R709101833409087154'');',
' if(actions&&hero&&!hero.contains(actions))hero.appendChild(actions);',
' if(!holder)return;',
' var labels={''SR_General_tab'':''Overview'',''SR_Detail_tab'':''Items'',''SR_PersonalBelonging_tab'':''Personal Belonging'',''SR_R1018763291200999338_tab'':''Attachments''};',
' var tabNames=[''Overview'',''Items'',''Personal Belonging'',''Attachments''];holder.querySelectorAll(''.t-Tabs>.t-Tabs-item .t-Tabs-link'').forEach(function(link,i){var s=link.querySelector(''span'');if(s&&tabNames[i])s.textContent=tabNames[i];});',
' var old=document.querySelector(''.mi-summary'');if(old)old.remove();',
' var assistant=holder.querySelector(''.mi-assistant'');',
' if(!assistant){assistant=document.createElement(''aside'');assistant.className=''mi-assistant'';assistant.innerHTML=''<header><span class="fa fa-file-text-o"></span><b>Document Assistant</b><button type="button" class="mi-assistant-toggle" aria-label="Co'
||'llapse assistant" aria-expanded="true"><span class="fa fa-chevron-right"></span></button></header><div class="mi-assistant-body"><section class="mi-status"><div><small>Status</small><strong>Draft</strong></div><div><small>Completion</small><b class="'
||'mi-percent">0%</b><div class="mi-progress"><i></i></div></div></section><div class="mi-warning"><span class="fa fa-info-circle"></span><div><b><span class="mi-missing">6</span> required fields are missing</b><p>Complete the required information to cr'
||'eate this transaction.</p></div></div><section class="mi-context"><h3><span class="fa fa-file-text-o"></span>Document Context</h3><dl><dt>Company</dt><dd>IRONMART PRIVATE LIMITED</dd><dt>Financial Year</dt><dd>26-27</dd><dt>Created By</dt><dd>boss</d'
||unistr('d><dt>Creation Date</dt><dd class="mi-created">\2014</dd><dt>Last Updated</dt><dd>\2014</dd></dl></section><section class="mi-help"><h3><span class="fa fa-lightbulb-o"></span>Quick Help</h3><p>Receive, verify and record incoming material against a reference ')
||'document.</p></section></div>'';holder.appendChild(assistant);',
' assistant.querySelector(''.mi-created'').textContent=new Date().toLocaleDateString(''en-GB'');',
' assistant.querySelector(''.mi-assistant-toggle'').addEventListener(''click'',function(){var c=holder.classList.toggle(''mi-assistant-collapsed'');this.setAttribute(''aria-expanded'',String(!c));this.setAttribute(''aria-label'',c?''Expand assistant'':''Collapse a'
||'ssistant'');});',
' }',
' var general=document.getElementById(''General'');',
' if(general&&!general.querySelector(''.mi-message'')){var msg=document.createElement(''div'');msg.className=''mi-message'';msg.innerHTML=''<span class="fa fa-info-circle"></span><span>Complete <b class="mi-message-missing">6</b> required fields before creat'
||'ing</span><button type="button" aria-label="Dismiss"><span class="fa fa-times"></span></button>'';var body=general.querySelector(''.t-Region-body'');if(body)body.insertBefore(msg,body.firstChild);msg.querySelector(''button'').onclick=function(){msg.hidden'
||'=true;};}',
' var req=[[''P69_LOCATIONCODE'',''Location''],[''P69_DOCTYPECODE'',''Doc Type''],[''P69_MATERIALINDATE'',''Material In Date''],[''P69_PARTYCODE'',''Party''],[''P69_REFDOCTYPECODE'',''Ref Doc Type''],[''P69_REFDOCNO'',''Ref Doc No'']];',
' function value(id){var e=document.getElementById(id);return e?(e.value||e.textContent||'''').trim():'''';}',
' function update(){var done=req.filter(function(r){return value(r[0]);}).length,p=Math.round(done/req.length*100),missing=req.length-done,a=holder.querySelector(''.mi-assistant'');if(!a)return;a.querySelector(''.mi-percent'').textContent=p+''%'';a.querySel'
||'ector(''.mi-progress i'').style.width=p+''%'';a.querySelector(''.mi-missing'').textContent=missing;var m=general&&general.querySelector(''.mi-message-missing'');if(m)m.textContent=missing;}',
' req.forEach(function(r){var e=document.getElementById(r[0]);if(e&&!e.dataset.miBound){e.dataset.miBound=''1'';e.addEventListener(''change'',update);e.addEventListener(''input'',update);}});update();',
'}',
'if(document.readyState===''loading'')document.addEventListener(''DOMContentLoaded'',initMaterialIn);else initMaterialIn();document.addEventListener(''apexreadyend'',initMaterialIn);document.addEventListener(''apexafterrefresh'',initMaterialIn);',
'})();',
'',
'',
'(function(){',
' function initProcessCanvas(){',
'  var holder=document.querySelector(''#tabcontainer>.t-TabsRegion-items''); if(!holder)return;',
'  var canvas=holder.querySelector(''.mi-process-canvas'');',
'  if(!canvas){',
'   canvas=document.createElement(''aside''); canvas.className=''mi-process-canvas'';',
'   canvas.innerHTML=''<header><span class="fa fa-tasks"></span><div><b>Process Canvas</b><small>Material receipt progress</small></div></header><section class="mi-canvas-progress"><div><span>Form completion</span><b class="mi-canvas-percent">0%</b></d'
||'iv><i><em></em></i></section><nav aria-label="Material In process"><button type="button" data-tab="SR_General_tab"><span>1</span><div><b>Material In</b><small>Basic information</small></div><i class="fa fa-chevron-right"></i></button><button type="bu'
||'tton" data-tab="SR_Detail_tab"><span>2</span><div><b>Detail</b><small>Material items</small></div><i class="fa fa-chevron-right"></i></button><button type="button" data-tab="SR_PersonalBelonging_tab"><span>3</span><div><b>Personal Belonging</b><small'
||'>Personnel & ownership</small></div><i class="fa fa-chevron-right"></i></button><button type="button" data-tab="SR_R1018763291200999338_tab"><span>4</span><div><b>Attachment</b><small>Documents & files</small></div><i class="fa fa-chevron-right"></i>'
||'</button></nav><footer><span class="fa fa-info-circle"></span><span><b class="mi-canvas-missing">6</b> required fields remaining</span></footer>'';',
'   holder.insertBefore(canvas,holder.querySelector(''.a-Tabs-panel''));',
'   canvas.querySelectorAll(''button[data-tab]'').forEach(function(btn){btn.addEventListener(''click'',function(){canvas.querySelectorAll(''button[data-tab]'').forEach(function(x){x.classList.remove(''is-active'');x.setAttribute(''aria-current'',''false'');});btn'
||'.classList.add(''is-active'');btn.setAttribute(''aria-current'',''step'');var link=document.querySelector(''#''+btn.dataset.tab+'' .t-Tabs-link'');if(link)link.click();});});',
'  }',
'  function sync(){',
'   var req=[''P69_LOCATIONCODE'',''P69_DOCTYPECODE'',''P69_MATERIALINDATE'',''P69_PARTYCODE'',''P69_REFDOCTYPECODE'',''P69_REFDOCNO''];',
'   var done=req.filter(function(id){var e=document.getElementById(id);return e&&String(e.value||'''').trim();}).length;',
'   var pct=Math.round(done/req.length*100),missing=req.length-done;',
'   canvas.querySelector(''.mi-canvas-percent'').textContent=pct+''%'';canvas.querySelector(''.mi-canvas-progress em'').style.width=pct+''%'';canvas.querySelector(''.mi-canvas-missing'').textContent=missing;',
'   var activeLink=document.querySelector(''#tabcontainer>.t-TabsRegion-items>.t-Tabs .t-Tabs-link[aria-selected="true"],#tabcontainer>.t-TabsRegion-items>.t-Tabs .t-Tabs-item.is-active .t-Tabs-link,#tabcontainer>.t-TabsRegion-items>.t-Tabs .a-Tabs-sel'
||'ected .t-Tabs-link'');var active=activeLink&&activeLink.closest(''.t-Tabs-item'');',
'   canvas.querySelectorAll(''button[data-tab]'').forEach(function(b){var on=active&&active.id===b.dataset.tab;b.classList.toggle(''is-active'',!!on);b.setAttribute(''aria-current'',on?''step'':''false'');});',
'  }',
'  var topLinks=document.querySelectorAll(''#tabcontainer>.t-TabsRegion-items>.t-Tabs .t-Tabs-link'');topLinks.forEach(function(l,i){if(!l.dataset.canvasBound){l.dataset.canvasBound=''1'';l.addEventListener(''click'',function(){var buttons=canvas.querySelec'
||'torAll(''button[data-tab]'');buttons.forEach(function(x){x.classList.remove(''is-active'');x.setAttribute(''aria-current'',''false'');});if(buttons[i]){buttons[i].classList.add(''is-active'');buttons[i].setAttribute(''aria-current'',''step'');}setTimeout(sync,0);}'
||');}});if(!canvas.querySelector(''button.is-active'')&&canvas.querySelector(''button[data-tab]''))canvas.querySelector(''button[data-tab]'').classList.add(''is-active'');',
'  [''P69_LOCATIONCODE'',''P69_DOCTYPECODE'',''P69_MATERIALINDATE'',''P69_PARTYCODE'',''P69_REFDOCTYPECODE'',''P69_REFDOCNO''].forEach(function(id){var e=document.getElementById(id);if(e&&!e.dataset.canvasProgress){e.dataset.canvasProgress=''1'';e.addEventListener('
||'''change'',sync);e.addEventListener(''input'',sync);}});sync();',
' }',
' if(document.readyState===''loading'')document.addEventListener(''DOMContentLoaded'',initProcessCanvas);else initProcessCanvas();document.addEventListener(''apexreadyend'',initProcessCanvas);document.addEventListener(''apexafterrefresh'',initProcessCanvas);',
'})();',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
'#APP_FILES#hspl-purchase-order.css?cb=20260901a',
'#APP_FILES#hspl-material-in.css?cb=20260902e'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body.hspl-mi{font-family:inherit!important;color:var(--ut-body-text-color,#172b4d)}',
'body.hspl-mi .t-Body-contentInner{padding:12px 16px 24px!important}body.hspl-mi .t-Body-contentInner>.container{max-width:1800px;margin:auto}',
'body.hspl-mi .hspl-po-hero{padding:6px 4px 10px!important;margin:0!important;min-height:auto!important;align-items:center!important}body.hspl-mi .hspl-mi-hero-icon{width:50px!important;height:50px!important;border-radius:12px!important}body.hspl-mi .'
||'hspl-po-title{font:700 1.75rem/1.15 inherit!important}body.hspl-mi .hspl-po-subtitle{margin-top:2px!important;font-family:inherit!important}',
'body.hspl-mi .hspl-mi-hero-side{display:flex!important;flex-direction:column!important;align-items:flex-end!important;gap:8px!important}body.hspl-mi .hspl-mi-hero-side #R717089552420977799{display:block!important;position:static!important;width:auto!'
||'important;background:transparent!important;border:0!important;box-shadow:none!important}body.hspl-mi .hspl-mi-hero-side .t-ButtonRegion-wrap{padding:0!important}body.hspl-mi .hspl-mi-hero-side .t-ButtonRegion-col{display:flex!important;gap:8px!import'
||'ant;justify-content:flex-end!important}body.hspl-mi .hspl-mi-hero-side .t-Button{width:auto!important;min-width:96px!important;height:40px!important;padding:0 14px!important;display:inline-flex!important;align-items:center!important;justify-content:c'
||'enter!important;gap:7px!important;border-radius:8px!important;font-family:inherit!important}body.hspl-mi .hspl-mi-hero-side .t-Button:after{content:attr(aria-label);font-weight:650;font-size:.86rem}body.hspl-mi .hspl-mi-hero-side #B302134303067031142'
||'{min-width:110px!important}',
'body.hspl-mi #tabcontainer,body.hspl-mi #tabcontainer>.t-TabsRegion-items{background:transparent!important;border:0!important;box-shadow:none!important;overflow:visible!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items{display:grid!important;g'
||'rid-template-columns:minmax(0,1fr) 300px;grid-template-rows:auto auto;gap:12px 16px;align-items:start}',
'body.hspl-mi #tabcontainer .apex-rds-slider{display:none!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs{grid-column:1/3;grid-row:1;display:flex!important;flex-direction:row!important;gap:8px!important;padding:0 10px!important;height'
||':54px!important;overflow-x:auto!important;background:var(--ut-component-background-color,#fff)!important;border-bottom:1px solid var(--ut-component-border-color,#d8e0eb)!important;border-radius:10px 10px 0 0!important;white-space:nowrap!important;pos'
||'ition:static!important}',
'body.hspl-mi #tabcontainer .t-Tabs-item{width:auto!important;margin:0!important}body.hspl-mi #tabcontainer .t-Tabs-link{position:relative!important;display:flex!important;align-items:center!important;gap:9px!important;min-height:54px!important;paddin'
||'g:0 18px!important;border:0!important;border-radius:0!important;background:transparent!important;color:var(--ut-component-text-muted-color,#52637d)!important;font-family:inherit!important;font-weight:600!important}body.hspl-mi #tabcontainer .t-Tabs-l'
||'ink:before{font-family:''Font APEX Small''!important;color:inherit;font-size:1rem}body.hspl-mi #SR_General_tab .t-Tabs-link:before{content:''\e014''}body.hspl-mi #SR_Detail_tab .t-Tabs-link:before{content:''\e0d6''}body.hspl-mi #SR_PersonalBelonging_tab .t'
||'-Tabs-link:before{content:''\e0a1''}body.hspl-mi #SR_R1018763291200999338_tab .t-Tabs-link:before{content:''\e082''}body.hspl-mi #tabcontainer .t-Tabs-item.is-active .t-Tabs-link,body.hspl-mi #tabcontainer .t-Tabs-item.a-Tabs-selected .t-Tabs-link{color:'
||'var(--ut-palette-primary,#2457f5)!important;box-shadow:inset 0 -3px 0 var(--ut-palette-primary,#2457f5)!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.a-Tabs-panel{grid-column:1;grid-row:2;min-width:0!important;margin:0!important}',
'body.hspl-mi .mi-message{display:flex;align-items:center;gap:10px;margin:0 0 12px;padding:10px 14px;border:1px solid color-mix(in srgb,var(--ut-palette-primary,#2457f5) 24%,white);border-radius:8px;background:var(--ut-palette-primary-10,#eef5ff);colo'
||'r:inherit;font-size:.84rem}body.hspl-mi .mi-message>.fa{color:var(--ut-palette-primary,#2457f5);font-size:1rem}body.hspl-mi .mi-message button{margin-left:auto;border:0;background:transparent;color:inherit;cursor:pointer}',
'body.hspl-mi #General{background:transparent!important;border:0!important;box-shadow:none!important}body.hspl-mi #General>.t-Region-bodyWrap>.t-Region-body{padding:0!important}body.hspl-mi #General>.t-Region-bodyWrap>.t-Region-body>.container>.row{di'
||'splay:flex!important;flex-wrap:wrap!important;gap:12px!important}body.hspl-mi #General>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col-12{width:100%!important;max-width:100%!important;flex:0 0 100%!important}body.hspl-mi #General>.t-Region-bod'
||'yWrap>.t-Region-body>.container>.row>.col-6{width:calc(50% - 6px)!important;max-width:calc(50% - 6px)!important;flex:0 0 calc(50% - 6px)!important;min-width:0!important}',
'body.hspl-mi #General .t-Region:not(#General){border:1px solid var(--ut-component-border-color,#d8e0eb)!important;border-radius:10px!important;box-shadow:0 1px 4px rgba(15,23,42,.04)!important;overflow:hidden!important;margin:0!important;background:v'
||'ar(--ut-component-background-color,#fff)!important}body.hspl-mi #General .t-Region:not(#General)>.t-Region-header{min-height:44px!important;padding:0 14px!important;background:var(--ut-component-background-color,#fff)!important;border-bottom:1px soli'
||'d var(--ut-component-border-color,#e2e8f0)!important}body.hspl-mi #General .t-Region-title{font:700 .96rem/1.2 inherit!important;color:inherit!important}body.hspl-mi #General .t-Region:not(#General)>.t-Region-bodyWrap>.t-Region-body{padding:8px 10px '
||'7px!important}body.hspl-mi #General .t-Form-fieldContainer{padding:4px 5px 7px!important;margin:0!important}body.hspl-mi #General .t-Form-labelContainer,body.hspl-mi #General .t-Form-inputContainer{width:100%!important;max-width:none!important;float:'
||'none!important;padding:0!important}body.hspl-mi #General .t-Form-labelContainer{text-align:left!important;margin-bottom:4px!important}body.hspl-mi #General .t-Form-label{font:600 .78rem/1.25 inherit!important;color:inherit!important}body.hspl-mi #Gen'
||'eral input,body.hspl-mi #General select,body.hspl-mi #General textarea,body.hspl-mi #General button{font-family:inherit!important}body.hspl-mi #General input.apex-item-text,body.hspl-mi #General select.apex-item-select,body.hspl-mi #General .apex-ite'
||'m-group--popup-lov{min-height:38px!important}body.hspl-mi #R604170100592634558>.t-Region-bodyWrap>.t-Region-body>.container>.row{display:grid!important;grid-template-columns:repeat(2,minmax(0,1fr))!important;gap:0 10px!important}body.hspl-mi #R604170'
||'100592634558>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col{width:100%!important;max-width:none!important}body.hspl-mi #R604170513601634562{width:100%!important}',
'body.hspl-mi .mi-assistant{grid-column:2;grid-row:2;position:sticky;top:10px;border:1px solid var(--ut-component-border-color,#d8e0eb);border-radius:10px;background:var(--ut-component-background-color,#fff);box-shadow:0 1px 5px rgba(15,23,42,.05);ove'
||'rflow:hidden;font-family:inherit}body.hspl-mi .mi-assistant>header{height:50px;display:grid;grid-template-columns:24px 1fr 30px;align-items:center;padding:0 12px;border-bottom:1px solid var(--ut-component-border-color,#e2e8f0);font-size:.96rem}body.h'
||'spl-mi .mi-assistant>header>.fa,body.hspl-mi .mi-context h3 .fa,body.hspl-mi .mi-help h3 .fa{color:var(--ut-palette-primary,#2457f5)}body.hspl-mi .mi-assistant-toggle{height:30px;width:30px;border:0;background:transparent;color:inherit;cursor:pointer'
||';border-radius:6px}body.hspl-mi .mi-assistant-body{padding:13px}body.hspl-mi .mi-status{display:grid;grid-template-columns:1fr 1.35fr;gap:12px;align-items:center;padding:0 0 12px}body.hspl-mi .mi-status>div+div{border-left:1px solid var(--ut-componen'
||'t-border-color,#e2e8f0);padding-left:14px}body.hspl-mi .mi-status small{display:block;color:var(--ut-component-text-muted-color,#64748b);margin-bottom:5px}body.hspl-mi .mi-status strong{display:inline-block;padding:4px 12px;border:1px solid #f5c47a;b'
||'order-radius:999px;background:#fff7e8;color:#9a5200;font-size:.8rem}body.hspl-mi .mi-percent{font-size:1.15rem;color:var(--ut-palette-primary,#2457f5)}body.hspl-mi .mi-progress{height:6px;margin-top:6px;border-radius:999px;background:var(--ut-compone'
||'nt-border-color,#e8edf5);overflow:hidden}body.hspl-mi .mi-progress i{display:block;height:100%;width:0;background:var(--ut-palette-primary,#2457f5);border-radius:inherit;transition:width .2s}',
'body.hspl-mi .mi-warning{display:flex;gap:10px;padding:12px;border-radius:8px;background:var(--ut-palette-primary-10,#eef5ff);line-height:1.4;font-size:.8rem}body.hspl-mi .mi-warning>.fa{color:var(--ut-palette-primary,#2457f5);margin-top:2px}body.hsp'
||'l-mi .mi-warning p{margin:4px 0 0;color:var(--ut-component-text-muted-color,#52637d)}body.hspl-mi .mi-context,body.hspl-mi .mi-help{margin-top:14px;padding-top:12px;border-top:1px solid var(--ut-component-border-color,#e2e8f0)}body.hspl-mi .mi-contex'
||'t h3,body.hspl-mi .mi-help h3{display:flex;align-items:center;gap:9px;margin:0 0 9px;font:700 .9rem/1.2 inherit}body.hspl-mi .mi-context dl{display:grid;grid-template-columns:1fr 1.2fr;margin:0;font-size:.76rem}body.hspl-mi .mi-context dt,body.hspl-m'
||'i .mi-context dd{margin:0;padding:7px 0;border-bottom:1px solid var(--ut-component-border-color,#edf0f4)}body.hspl-mi .mi-context dt{color:var(--ut-component-text-muted-color,#64748b)}body.hspl-mi .mi-context dd{text-align:right;overflow:hidden;text-'
||'overflow:ellipsis;white-space:nowrap}body.hspl-mi .mi-help p{margin:0 0 3px 24px;font-size:.78rem;line-height:1.45;color:var(--ut-component-text-muted-color,#52637d)}',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items.mi-assistant-collapsed{grid-template-columns:minmax(0,1fr) 52px}body.hspl-mi .mi-assistant-collapsed .mi-assistant>header{grid-template-columns:1fr;padding:0 10px}body.hspl-mi .mi-assistant-collapsed .mi'
||'-assistant>header>b,body.hspl-mi .mi-assistant-collapsed .mi-assistant>header>.fa,body.hspl-mi .mi-assistant-collapsed .mi-assistant-body{display:none}body.hspl-mi .mi-assistant-collapsed .mi-assistant-toggle .fa{transform:rotate(180deg)}',
'@media(max-width:1100px){body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:minmax(0,1fr)}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs{grid-column:1}body.hspl-mi .mi-assistant{grid-column:1;grid-row:3;position:static}body.'
||'hspl-mi #General>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col-6{width:100%!important;max-width:100%!important;flex-basis:100%!important}}',
'/* Region header title visibility */',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerItems--title{display:flex!important;align-items:center!important;gap:10px!important;min-width:0!important;overflow:visible!important}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title,body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title *{display:inline!important;visibility:visible!important;opacity:1!important;color:var(--ut-b'
||'ody-text-color,#172b4d)!important;font-family:inherit!important;font-size:.96rem!important;font-weight:700!important;line-height:1.25!important;text-indent:0!important;clip:auto!important;position:static!important;width:auto!important;height:auto!imp'
||'ortant;overflow:visible!important}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerIcon{display:inline-flex!important;visibility:visible!important;opacity:1!important;flex:0 0 auto!important}',
'',
'/* Compact Fiori region headers */',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header{',
'  min-height:40px!important;',
'  height:40px!important;',
'  padding:0 12px!important;',
'  background:var(--ut-palette-primary-10,#f5f8ff)!important;',
'  border:0!important;',
'  box-shadow:none!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerItems{',
'  height:40px!important;',
'  display:flex!important;',
'  align-items:center!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerItems--title{',
'  gap:8px!important;',
'  padding:0!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerIcon{',
'  width:26px!important;',
'  height:26px!important;',
'  min-width:26px!important;',
'  display:inline-flex!important;',
'  align-items:center!important;',
'  justify-content:center!important;',
'  border-radius:7px!important;',
'  background:#eef4ff!important;',
'  color:var(--ut-palette-primary,#2457f5)!important;',
'  margin:0!important;',
'  padding:0!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title{',
'  margin:0!important;',
'  padding:0!important;',
'  font-size:.9rem!important;',
'  line-height:1!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-bodyWrap>.t-Region-body{',
'  padding-top:10px!important;',
'}',
'',
'/* Comfortable, unclipped region headers */',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header{',
'  height:auto!important;',
'  min-height:48px!important;',
'  padding:0 16px!important;',
'  background:#fff!important;',
'  border:0!important;',
'  box-shadow:inset 0 -1px 0 rgba(36,87,245,.10)!important;',
'  overflow:visible!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerItems{',
'  display:flex!important;',
'  align-items:center!important;',
'  height:48px!important;',
'  min-height:48px!important;',
'  padding:0!important;',
'  margin:0!important;',
'  position:static!important;',
'  transform:none!important;',
'  overflow:visible!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerItems--title{',
'  display:flex!important;',
'  align-items:center!important;',
'  gap:10px!important;',
'  height:48px!important;',
'  padding:0!important;',
'  margin:0!important;',
'  position:static!important;',
'  transform:none!important;',
'  overflow:visible!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerIcon{',
'  width:28px!important;',
'  height:28px!important;',
'  min-width:28px!important;',
'  display:inline-flex!important;',
'  align-items:center!important;',
'  justify-content:center!important;',
'  position:static!important;',
'  transform:none!important;',
'  margin:0!important;',
'  padding:0!important;',
'  border-radius:8px!important;',
'  background:#eef4ff!important;',
'  overflow:visible!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title,',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title *{',
'  margin:0!important;',
'  padding:0!important;',
'  position:static!important;',
'  transform:none!important;',
'  font-size:.95rem!important;',
'  line-height:1.3!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-bodyWrap>.t-Region-body{',
'  padding:12px 14px 10px!important;',
'}',
'',
'/* Keep region icon beside title */',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title{',
'  display:flex!important;',
'  flex-direction:row!important;',
'  align-items:center!important;',
'  justify-content:flex-start!important;',
'  gap:10px!important;',
'  height:48px!important;',
'  min-height:48px!important;',
'  width:auto!important;',
'  overflow:visible!important;',
'  white-space:nowrap!important;',
'}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title>.t-Icon,',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title>.t-Region-headerIcon,',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerIcon{',
'  position:static!important;',
'  inset:auto!important;',
'  float:none!important;',
'  flex:0 0 28px!important;',
'  margin:0!important;',
'  transform:none!important;',
'  vertical-align:middle!important;',
'}',
'',
'/* Remove ghost icon tile before region title */',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title::before,',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerItems--title::before{content:none!important;display:none!important;background:none!important;width:0!important;height:0!important;margin:0!important;padding:0!important}',
'',
'/* One clean icon beside each region title */',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-headerIcon{display:none!important}',
'body.hspl-mi #General .t-Region:not(#General)>.t-Region-header .t-Region-title::before{content:''\f15b''!important;display:inline-flex!important;align-items:center!important;justify-content:center!important;width:28px!important;height:28px!important;mi'
||'n-width:28px!important;margin:0 10px 0 0!important;padding:0!important;border-radius:8px!important;background:#eef4ff!important;color:var(--ut-palette-primary,#2457f5)!important;font-family:''Font APEX Small'',''FontAwesome''!important;font-size:14px!imp'
||'ortant;font-weight:400!important;line-height:1!important}',
'',
'/* Keep Interactive Grid horizontal scrollbar available */',
'body.hspl-mi #SR_Detail .a-GV-w-scroll{',
'  overflow-x:scroll!important;',
'  overflow-y:auto!important;',
'  scrollbar-gutter:stable!important;',
'  max-width:100%!important;',
'  padding-bottom:2px!important;',
'}',
'body.hspl-mi #SR_Detail .a-GV-table,',
'body.hspl-mi #SR_Detail .a-GV-headerGroup{min-width:max-content!important}',
'body.hspl-mi #SR_Detail .a-GV-bdy{min-width:100%!important}',
'body.hspl-mi #SR_Detail .a-IG-contentContainer,',
'body.hspl-mi #SR_Detail .a-GV{max-width:100%!important;overflow:hidden!important}',
'body.hspl-mi #SR_Detail .a-GV-w-scroll::-webkit-scrollbar{height:12px!important}',
'body.hspl-mi #SR_Detail .a-GV-w-scroll::-webkit-scrollbar-track{background:#eef2f7!important;border-radius:8px!important}',
'body.hspl-mi #SR_Detail .a-GV-w-scroll::-webkit-scrollbar-thumb{background:#9aa9bd!important;border:3px solid #eef2f7!important;border-radius:8px!important}',
'',
'body.hspl-mi #SR_Detail .a-GV-w-scroll>.a-GV-table,',
'body.hspl-mi #SR_Detail .a-GV-w-scroll table{min-width:2200px!important;width:2200px!important}',
'body.hspl-mi #SR_Detail .a-GV-w-scroll{overflow-x:scroll!important;display:block!important}',
'',
'body.hspl-mi #SR_Detail .a-GV-w-hdr{overflow-x:scroll!important;overflow-y:hidden!important;max-width:100%!important}',
'body.hspl-mi #SR_Detail .a-GV-w-hdr table{min-width:2200px!important;width:2200px!important}',
'body.hspl-mi #SR_Detail .a-GV-w-hdr::-webkit-scrollbar{height:12px!important}',
'body.hspl-mi #SR_Detail .a-GV-w-hdr::-webkit-scrollbar-track{background:#eef2f7!important}',
'body.hspl-mi #SR_Detail .a-GV-w-hdr::-webkit-scrollbar-thumb{background:#9aa9bd!important;border:3px solid #eef2f7!important;border-radius:8px!important}',
'',
'/* Horizontal scrollbar for Personal Belonging and Attachment */',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-scroll,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-scroll,',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-hdr,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-hdr{overflow-x:scroll!important;overflow-y:hidden!important;max-width:100%!important;scrollbar-gutter:stable!important}',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-scroll table,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-scroll table,',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-hdr table,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-hdr table{min-width:2200px!important;width:2200px!important}',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-scroll::-webkit-scrollbar,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-scroll::-webkit-scrollbar,',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-hdr::-webkit-scrollbar,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-hdr::-webkit-scrollbar{height:12px!important}',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-scroll::-webkit-scrollbar-track,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-scroll::-webkit-scrollbar-track,',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-hdr::-webkit-scrollbar-track,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-hdr::-webkit-scrollbar-track{background:#eef2f7!important}',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-scroll::-webkit-scrollbar-thumb,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-scroll::-webkit-scrollbar-thumb,',
'body.hspl-mi #SR_PersonalBelonging .a-GV-w-hdr::-webkit-scrollbar-thumb,',
'body.hspl-mi #SR_R1018763291200999338 .a-GV-w-hdr::-webkit-scrollbar-thumb{background:#9aa9bd!important;border:3px solid #eef2f7!important;border-radius:8px!important}',
'',
'/* Attachment dialog shell (dialog content is in Page 63 iframe) */',
'body.hspl-mi .ui-dialog{border:1px solid #d9e2ef!important;border-radius:14px!important;box-shadow:0 24px 64px rgba(15,35,75,.22)!important;overflow:hidden!important;background:#fff!important;font-family:inherit!important}',
'body.hspl-mi .ui-dialog .ui-dialog-titlebar{height:58px!important;padding:0 20px!important;display:flex!important;align-items:center!important;background:#fff!important;border:0!important;border-bottom:1px solid #e4eaf2!important}',
'body.hspl-mi .ui-dialog .ui-dialog-title{display:flex!important;align-items:center!important;gap:10px!important;font:700 1.08rem/1.2 inherit!important;color:#172b4d!important}',
'body.hspl-mi .ui-dialog .ui-dialog-title:before{content:''\f0c6'';display:inline-flex!important;align-items:center!important;justify-content:center!important;width:32px!important;height:32px!important;border-radius:8px!important;background:#eef4ff!impo'
||'rtant;color:#2457f5!important;font-family:''FontAwesome''!important;font-size:15px!important;font-weight:400!important}',
'body.hspl-mi .ui-dialog .ui-dialog-titlebar-close{right:16px!important;border-radius:7px!important}',
'body.hspl-mi .ui-dialog .ui-dialog-content{padding:0!important;background:#fff!important}',
'body.hspl-mi .ui-widget-overlay{background:#102a56!important;opacity:.28!important;backdrop-filter:blur(2px)!important}',
'',
'/* Integrated Process Canvas */',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:218px minmax(0,1fr) 300px!important;grid-template-rows:auto auto!important;gap:12px 14px!important}',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs{grid-column:1/4!important;grid-row:1!important}',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items>.a-Tabs-panel{grid-column:2!important;grid-row:2!important}',
'body.hspl-mi .mi-assistant{grid-column:3!important;grid-row:2!important}',
'body.hspl-mi .mi-process-canvas{grid-column:1!important;grid-row:2!important;position:sticky;top:10px;align-self:start;border:1px solid var(--ut-component-border-color,#d8e0eb);border-radius:10px;background:var(--ut-component-background-color,#fff);b'
||'ox-shadow:0 1px 5px rgba(15,23,42,.05);overflow:hidden;font-family:inherit}',
'body.hspl-mi .mi-process-canvas>header{display:grid;grid-template-columns:28px 1fr;align-items:center;gap:9px;padding:14px;border-bottom:1px solid var(--ut-component-border-color,#e2e8f0)}body.hspl-mi .mi-process-canvas>header>.fa{display:grid;place-'
||'items:center;width:28px;height:28px;border-radius:7px;background:#eef4ff;color:var(--ut-palette-primary,#2457f5)}body.hspl-mi .mi-process-canvas>header b,body.hspl-mi .mi-process-canvas>header small{display:block}body.hspl-mi .mi-process-canvas>heade'
||'r small{margin-top:2px;color:var(--ut-component-text-muted-color,#64748b);font-size:.72rem}',
'body.hspl-mi .mi-canvas-progress{padding:12px 14px 8px}body.hspl-mi .mi-canvas-progress>div{display:flex;justify-content:space-between;align-items:center;font-size:.76rem;color:var(--ut-component-text-muted-color,#64748b)}body.hspl-mi .mi-canvas-prog'
||'ress b{font-size:.94rem;color:var(--ut-palette-primary,#2457f5)}body.hspl-mi .mi-canvas-progress>i{display:block;height:6px;margin-top:7px;border-radius:999px;background:#e8edf5;overflow:hidden}body.hspl-mi .mi-canvas-progress em{display:block;width:'
||'0;height:100%;border-radius:inherit;background:var(--ut-palette-primary,#2457f5);transition:width .2s}',
'body.hspl-mi .mi-process-canvas nav{display:grid;gap:3px;padding:6px 8px 10px}body.hspl-mi .mi-process-canvas nav button{display:grid;grid-template-columns:30px minmax(0,1fr) 14px;align-items:center;gap:9px;width:100%;min-height:54px;padding:7px 8px;'
||'border:1px solid transparent;border-radius:8px;background:transparent;color:var(--ut-body-text-color,#172b4d);font-family:inherit;text-align:left;cursor:pointer}body.hspl-mi .mi-process-canvas nav button>span{display:grid;place-items:center;width:28p'
||'x;height:28px;border:1px solid #cbd7e6;border-radius:50%;font-size:.78rem;font-weight:700}body.hspl-mi .mi-process-canvas nav button b,body.hspl-mi .mi-process-canvas nav button small{display:block;overflow:hidden;text-overflow:ellipsis;white-space:n'
||'owrap}body.hspl-mi .mi-process-canvas nav button b{font-size:.8rem}body.hspl-mi .mi-process-canvas nav button small{margin-top:2px;color:var(--ut-component-text-muted-color,#64748b);font-size:.69rem}body.hspl-mi .mi-process-canvas nav button>.fa{colo'
||'r:#93a4bb;font-size:.68rem}body.hspl-mi .mi-process-canvas nav button:hover{background:#f7f9fc}body.hspl-mi .mi-process-canvas nav button.is-active{border-color:#b9d0ff;background:#eef4ff;color:#1746a2;box-shadow:inset 3px 0 0 var(--ut-palette-primar'
||'y,#2457f5)}body.hspl-mi .mi-process-canvas nav button.is-active>span{border-color:var(--ut-palette-primary,#2457f5);background:var(--ut-palette-primary,#2457f5);color:#fff}',
'body.hspl-mi .mi-process-canvas>footer{display:flex;align-items:center;gap:8px;padding:10px 12px;border-top:1px solid var(--ut-component-border-color,#e2e8f0);background:#f8fafc;color:var(--ut-component-text-muted-color,#64748b);font-size:.72rem}body'
||'.hspl-mi .mi-process-canvas>footer>.fa{color:var(--ut-palette-primary,#2457f5)}',
'@media(max-width:1400px){body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:190px minmax(0,1fr) 260px!important}}',
'@media(max-width:1180px){body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:190px minmax(0,1fr)!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs{grid-column:1/3!important}body.hspl-mi .mi-assistant{display:none!impor'
||'tant}}',
'@media(max-width:900px){body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:1fr!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs,body.hspl-mi #tabcontainer>.t-TabsRegion-items>.a-Tabs-panel{grid-column:1!important}.mi'
||'-process-canvas{display:none!important}}',
'',
'/* Process Canvas is the single progress surface */',
'body.hspl-mi .mi-assistant{display:none!important}',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:218px minmax(0,1fr)!important;grid-template-rows:auto auto!important}',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs{grid-column:1/3!important}',
'body.hspl-mi #tabcontainer>.t-TabsRegion-items>.a-Tabs-panel{grid-column:2!important}',
'@media(max-width:1100px){body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:190px minmax(0,1fr)!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs{grid-column:1/3!important}}',
'@media(max-width:900px){body.hspl-mi #tabcontainer>.t-TabsRegion-items{grid-template-columns:1fr!important}body.hspl-mi #tabcontainer>.t-TabsRegion-items>.t-Tabs,body.hspl-mi #tabcontainer>.t-TabsRegion-items>.a-Tabs-panel{grid-column:1!important}}',
'',
'/* Action buttons */@keyframes miGlow{50%{box-shadow:0 7px 20px #1858d75c}}@keyframes miPop{65%{transform:scale(1.1)}}body.hspl-mi .hspl-mi-hero-side .t-Button{position:relative!important;overflow:hidden!important;border:1px solid!important;transitio'
||'n:.2s ease!important}body.hspl-mi .hspl-mi-hero-side .t-Button:before{content:'''';position:absolute;inset:-50%;background:linear-gradient(110deg,transparent 38%,#ffffff55 50%,transparent 62%);transform:translateX(-75%);transition:transform .55s ease;p'
||'ointer-events:none}body.hspl-mi .hspl-mi-hero-side .t-Button:hover:before{transform:translateX(75%)}body.hspl-mi .hspl-mi-hero-side .t-Button:hover{transform:translateY(-3px)!important;filter:saturate(1.08)}body.hspl-mi .hspl-mi-hero-side .t-Button:h'
||'over .t-Icon{animation:miPop .35s ease}body.hspl-mi .hspl-mi-hero-side .t-Button:active{transform:scale(.96)!important;filter:none}body.hspl-mi .hspl-mi-hero-side #B582697446456499279{background:#fff!important;border-color:#b8c7dc!important;color:#24'
||'466f!important;box-shadow:0 2px 6px #23466f12!important}body.hspl-mi .hspl-mi-hero-side #B582697446456499279:hover{background:#f4f7fb!important;box-shadow:0 7px 16px #23466f26!important}body.hspl-mi .hspl-mi-hero-side #B582698702990499279{background:'
||'linear-gradient(135deg,#2874f0,#1858d7)!important;border-color:#1858d7!important;color:#fff!important;animation:miGlow 2.8s ease-in-out infinite}body.hspl-mi .hspl-mi-hero-side #B582698702990499279:hover{animation:none;box-shadow:0 10px 22px #1858d75'
||'5!important}body.hspl-mi .hspl-mi-hero-side #B302134303067031142{background:linear-gradient(135deg,#625ee8,#4e49cf)!important;border-color:#4e49cf!important;color:#fff!important;box-shadow:0 5px 13px #4e49cf3b!important}body.hspl-mi .hspl-mi-hero-sid'
||'e #B302134303067031142:hover{box-shadow:0 10px 22px #4e49cf52!important}body.hspl-mi .mi-process-canvas nav button{transition:.2s ease!important}body.hspl-mi .mi-process-canvas nav button:hover{transform:translateX(3px)!important;background:#f2f6fd!i'
||'mportant;border-color:#dbe6f5!important;box-shadow:0 3px 10px #173b7a12}body.hspl-mi .mi-process-canvas nav button>.fa{transition:.2s}body.hspl-mi .mi-process-canvas nav button:hover>.fa{transform:translateX(2px)}body.hspl-mi .mi-process-canvas nav b'
||'utton:active{transform:scale(.98)!important}@media(prefers-reduced-motion:reduce){body.hspl-mi .t-Button,body.hspl-mi .mi-process-canvas nav button{animation:none!important;transition:none!important;transform:none!important}}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1026751010212889983)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_parent_plug_id=>wwv_flow_imp.id(579900513166851959)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       --A.SNO,',
'       --DESCRIPTION,',
'       B.PARTYATTRIBUTENAME,',
'       A.ATTRIBUTEVALUE,',
'       A.ATTACHMENTBLOB,',
'       A.FILENAME,',
'       A.ATTRIBUTECODE,',
'       A.moduletno,',
'       A.modulesno',
'  from MODULEATTACHMENT A, PARTYATTRIBUTE B',
'  Where A.ATTRIBUTECODE = PARTYATTRIBUTECODE',
'    AND A.moduletno = :P69_TNO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P69_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Attachment'
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
 p_id=>wwv_flow_imp.id(1026751754787889991)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULESNO:#MODULESNO##SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>586365409536963467
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1026752324273889996)
,p_db_column_name=>'ATTACHMENTBLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Attachmentblob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(746367735992760304)
,p_db_column_name=>'ATTRIBUTECODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Attributecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(873966610515704679)
,p_db_column_name=>'ATTRIBUTEVALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Attribute Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1026752395513889997)
,p_db_column_name=>'FILENAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(747763878720891374)
,p_db_column_name=>'MODULESNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Modulesno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(747763779532891373)
,p_db_column_name=>'MODULETNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(873966570279704678)
,p_db_column_name=>'PARTYATTRIBUTENAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Attribute Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1026751914090889992)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1029397344185865445)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1060643170088488385)
,p_plug_name=>'CommonFields'
,p_static_id=>'commonfields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579900566383851960)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(579900513166851959)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       PACKINGTYPECODE,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       QUANTITY2,',
'       ISWEIGHTTAKEN,',
'       PURCHASEORDERTNO,',
'       JOBORDERTNO,',
'       PACKINGNOS,',
'       ISEXCISABLE,',
'       REMARK,',
'       '' '' as EQ,',
'       GetMeasuringUnitNameFromItem(itemcode) as Unit1,',
'       GetMeasuringUnit2NameFromItem(itemcode) as Unit2,',
'       null as balance',
'  from MATERIALINDETAIL',
'  where tno = :P69_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P69_TNO'
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
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(604171041829634567)
,p_heading=>'Item Specification'
,p_static_id=>'item-specification'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(606208745075247870)
,p_heading=>'Packing'
,p_static_id=>'packing'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(604171073839634568)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(604171203046634569)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582885775655836429)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582885906890836430)
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
 p_id=>wwv_flow_imp.id(447055278599861594)
,p_name=>'BALANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Balance'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(579901317907851967)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(604171041829634567)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582889100696836462)
,p_name=>'EQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EQ'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'EQ'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''EquipmentDetail'')'
,p_link_text=>'&EQ.'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
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
,p_default_type=>'STATIC'
,p_default_expression=>'<a href="javascript:openModal(''EquipmentDetail'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">EQ</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579902037455851974)
,p_name=>'ISEXCISABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISEXCISABLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Is Excisable'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901643470851970)
,p_name=>'ISWEIGHTTAKEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISWEIGHTTAKEN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Is Weight Taken'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579900992909851964)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(604171041829634567)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select getitemname(a.itemcode) d, a.itemcode r    ',
'from materialindetail a ',
'where tno = :P69_TNO  '))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P69_TNO'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901119378851965)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(604171041829634567)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE',
'from itemspecification',
'where tno in (select tno from item where itemcode = :ITEMCODE )'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO,ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901746763851972)
,p_name=>'JOBORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Job order No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901903490851973)
,p_name=>'PACKINGNOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGNOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'NOs'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(606208745075247870)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901205133851966)
,p_name=>'PACKINGTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(606208745075247870)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select PACKINGTYPENAME , PACKINGTYPECODE from packingtype'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'PACKINGTYPECODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901702053851971)
,p_name=>'PURCHASEORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Purchase Order No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
,p_lov_source=>'SELECT PURCHASEORDERNO , TNO FROM PURCHASEORDER'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901444264851968)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(604171073839634568)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579901471126851969)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(604171203046634569)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582885407092836425)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582885541975836426)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579900907898851963)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(579900789350851962)
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
,p_default_expression=>'P69_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(606208080012247864)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(604171073839634568)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(606208145964247865)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(604171203046634569)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(579900687283851961)
,p_internal_uid=>139514342032925437
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'    };',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(582890952849837366)
,p_interactive_grid_id=>wwv_flow_imp.id(579900687283851961)
,p_static_id=>'1425047'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(582891209748837369)
,p_report_id=>wwv_flow_imp.id(582890952849837366)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(447124401149537820)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(447055278599861594)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582891647316837373)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(579900789350851962)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582892609110837376)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(579900907898851963)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582893516131837378)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(579900992909851964)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>240
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582894365580837380)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(579901119378851965)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>521
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582895285631837382)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(579901205133851966)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582896232312837384)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(579901317907851967)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582897052648837391)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(579901444264851968)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582897966058837396)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(579901471126851969)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582898911076837398)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(579901643470851970)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582899831116837400)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(579901702053851971)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582900709292837402)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(579901746763851972)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582901592772837404)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(579901903490851973)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582902471725837406)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(579902037455851974)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582903418364837409)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(582885407092836425)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582904246517837411)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(582885541975836426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582935047704091351)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(582885775655836429)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583498477552047571)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(582889100696836462)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607032519561023388)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(606208080012247864)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607033348670023390)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(606208145964247865)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(438985008540697985)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(579901444264851968)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(438985111995699315)
,p_view_id=>wwv_flow_imp.id(582891209748837369)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(579901471126851969)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(582888056154836452)
,p_plug_name=>'EquipmentDetail'
,p_static_id=>'equipmentdetail'
,p_region_name=>'EquipmentDetail'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       SNO,',
'       STOREINREPAIRINGITEMTNO,',
'       EQUIPMENTTNO,',
'       REMARK',
'  from MATERIALINEQUIPMENTDETAIL',
'  where tno = :P69_TNO',
'  and sno = :P69_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(579900566383851960)
,p_ajax_items_to_submit=>'P69_TNO,P69_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'EquipmentDetail'
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
 p_id=>wwv_flow_imp.id(582889205867836463)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582889282979836464)
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
 p_id=>wwv_flow_imp.id(582888624001836457)
,p_name=>'EQUIPMENTTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EQUIPMENTTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Equipmenttno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582888667652836458)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(582888388425836455)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_imp.id(579900907898851963)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582888508685836456)
,p_name=>'STOREINREPAIRINGITEMTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOREINREPAIRINGITEMTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Storeinrepairingitemtno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582888269100836454)
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
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_imp.id(579900789350851962)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(582888217474836453)
,p_internal_uid=>142501872223909929
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
 p_id=>wwv_flow_imp.id(583484597562016786)
,p_interactive_grid_id=>wwv_flow_imp.id(582888217474836453)
,p_static_id=>'1430983'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(583484832436016788)
,p_report_id=>wwv_flow_imp.id(583484597562016786)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583485287264016789)
,p_view_id=>wwv_flow_imp.id(583484832436016788)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(582888269100836454)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583486231620016791)
,p_view_id=>wwv_flow_imp.id(583484832436016788)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(582888388425836455)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583487102620016793)
,p_view_id=>wwv_flow_imp.id(583484832436016788)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(582888508685836456)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583487982842016795)
,p_view_id=>wwv_flow_imp.id(583484832436016788)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(582888624001836457)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583488856884016797)
,p_view_id=>wwv_flow_imp.id(583484832436016788)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(582888667652836458)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(583508075531074373)
,p_view_id=>wwv_flow_imp.id(583484832436016788)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(582889205867836463)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(717089552420977799)
,p_plug_name=>'Flow Buttons'
,p_static_id=>'flow-buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604170100592634558)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604170318130634560)
,p_plug_name=>'Inward Detail'
,p_static_id=>'inward-detail'
,p_parent_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(582619246559415227)
,p_plug_name=>'Material In'
,p_static_id=>'material-in'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(579900513166851959)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       MATERIALINNO,',
'       TO_DATE(MATERIALINDATE,''DD-MM-RRRR'') AS MATERIALINDATE,',
'       PARTYCODE,',
'       PURCHASEORDERTNO,',
'       JOBORDERTNO,',
'       DELIVERYORDERTNO,',
'       TRANSPORTERCODE,',
'       DRIVERNAME,',
'       VEHICLETYPECODE,',
'       VEHICLENO,',
'       UNIONNAME,',
'       MINESCODE,',
'       REFDOCTYPECODE,',
'       REFDOCNO,',
'       REFDOCDATE,',
'       REFDOCAMOUNT,',
'       SALETAXFORMTYPECODE,',
'       ISWEIGHTTAKEN,',
'       ISGRNPREPARED,',
'       FREIGHTTYPECODE,',
'       CCINVOICETNO,',
'       RAKETNO,',
'       FORM59NO,',
'       FORM59TOKENDATE,',
'       FORM59TOKENNO,',
'       LRNO,',
'       GATEPASSTNO,',
'       LRDATE,',
'       DELIVERYORDERSNO,',
'       MATERIALINTRANSITTNO,',
'       GROSSWEIGHT,',
'       TAREWEIGHT,',
'       NETWEIGHT,',
'       TOMODULECODE,',
'       TOMODULETNO,',
'       GATEINTIME,',
'       GATEOUTTIME,',
'       ISEXCISABLE,',
'       TAXVEHICLENO,',
'       MPARTYCODE,',
'       MBILLNO,',
'       MBILLDATE,',
'       REPORTINGTIME,',
'       DRIVERMOBILENO,',
'       PREDELIVERYINSPECTIONTNO,',
'       INTERUNITTRANSFERCCINVOICETNO,',
'       WORKORDERTNO,',
'       LIFTINGFROMCITYCODE,',
'       MODULETNO,',
'       MODULECODE,',
'       BURNINGALLOWEDPERCENT,',
'       DELIVERYANDPAYMENTSCHEDULETNO,',
'       DELIVERYANDPAYMENTSCHEDULESNO,',
'       ASSETTRANFERORDERTNO,',
'       EQUIPMENTTRANSFERNOTETNO,',
'       SHIFTINGADVICETNO,',
'       SHIFTINGTNO,',
'       GATEREPORTINGTIME,',
'       NOSOFPACKAGES,',
'       OLDVEHICLENO,',
'       PORTGRNTNO,',
'       REMARK,',
'       CREATOR,',
'       DELIVERYINTIMATIONTNO,',
'       NVL(getdocumentstatuscode(getmodulecodeforpageno(:APP_PAGE_ID),TNO),''Status'') as Status,',
'       loadingadvicetno',
'  from MATERIALIN'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579900513166851959)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(582886098843836432)
,p_plug_name=>'Personal Belonging'
,p_static_id=>'personal-belonging'
,p_region_name=>'PersonalBelonging'
,p_parent_plug_id=>wwv_flow_imp.id(579900513166851959)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SERIALNO,',
'       ATTRIBUTECODE,',
'       ATTRIBUTEVALUE,',
'       REMARK',
'  from MATERIALINACTIVITY',
'  where tno = :P69_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P69_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Personal Belonging'
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
 p_id=>wwv_flow_imp.id(582886959879836441)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582887057975836442)
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
 p_id=>wwv_flow_imp.id(582886572326836437)
,p_name=>'ATTRIBUTECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTRIBUTECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Attribute Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PARTYATTRIBUTENAME, PARTYATTRIBUTECODE FROM PARTYATTRIBUTE',
'ORDER BY 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'ATTRIBUTECODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582886727185836438)
,p_name=>'ATTRIBUTEVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTRIBUTEVALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Attribute Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(582886761384836439)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(582886919513836440)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582886451824836436)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582886427938836435)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(582886301284836434)
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
,p_default_expression=>'P69_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(582886242287836433)
,p_internal_uid=>142499897036909909
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
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(582950255764415639)
,p_interactive_grid_id=>wwv_flow_imp.id(582886242287836433)
,p_static_id=>'1425640'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(582950483808415639)
,p_report_id=>wwv_flow_imp.id(582950255764415639)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582951007772415641)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(582886301284836434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582951928360415644)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(582886427938836435)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582952765647415646)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(582886451824836436)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582953648000415648)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(582886572326836437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582954595306415650)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(582886727185836438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582955514059415652)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(582886761384836439)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582956401623415654)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(582886919513836440)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(582958761383419368)
,p_view_id=>wwv_flow_imp.id(582950483808415639)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(582886959879836441)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604170350920634561)
,p_plug_name=>'Reference'
,p_static_id=>'reference'
,p_parent_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604170513601634562)
,p_plug_name=>'Transportation Info'
,p_static_id=>'transportation-info'
,p_parent_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(302134303067031142)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(594494436696778894)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1026751010212889983)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULETNO:&P69_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582888789722836459)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(582888056154836452)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582697446456499279)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582698702990499279)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582697858588499279)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582699484683499279)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582699866292499279)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P69_TNO.'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579900363935851958)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(579900566383851960)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_static_id=>'GETITEM'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582699089555499279)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582697124097499279)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582698322593499279)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(582700245430499280)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(717089552420977799)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_static_id=>'STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P69_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P69_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(582670367445415248)
,p_branch_name=>'Go To Page 68'
,p_branch_action=>'f?p=&APP_ID.:68:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(582697858588499279)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452813656835344526)
,p_name=>'P69_ALLOWEDBACK'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452813944494350967)
,p_name=>'P69_ALLOWEDFORWARD'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582642845621415234)
,p_name=>'P69_ASSETTRANFERORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'ASSETTRANFERORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(444739672823806642)
,p_name=>'P69_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582641653958415234)
,p_name=>'P69_BURNINGALLOWEDPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'BURNINGALLOWEDPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1052464419849863218)
,p_name=>'P69_CALLEDFROMPAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_default=>'68'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447055587478861597)
,p_name=>'P69_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582629713609415230)
,p_name=>'P69_CCINVOICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(604170318130634560)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Cc Invoice No'
,p_source=>'CCINVOICETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P69_CCINVOICENO'
,p_lov_cascade_parent_items=>'P69_LOCATIONCODE,P69_PARTYCODE'
,p_ajax_items_to_submit=>'P69_LOCATIONCODE,P69_PARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(497678401597873427)
,p_name=>'P69_CODESCHEME'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582620855856415227)
,p_name=>'P69_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582646936300415236)
,p_name=>'P69_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582642450875415234)
,p_name=>'P69_DELIVERYANDPAYMENTSCHEDULESNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'DELIVERYANDPAYMENTSCHEDULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582642144611415234)
,p_name=>'P69_DELIVERYANDPAYMENTSCHEDULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'DELIVERYANDPAYMENTSCHEDULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64813531102925425)
,p_name=>'P69_DELIVERYINTIMATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(604170100592634558)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Delivery Intimation No'
,p_source=>'DELIVERYINTIMATIONTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P69_DELIVERYINTIMATION'
,p_lov_cascade_parent_items=>'P69_PARTYCODE'
,p_ajax_items_to_submit=>'P69_PARTYCODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582632944126415231)
,p_name=>'P69_DELIVERYORDERSNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'DELIVERYORDERSNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582623741227415228)
,p_name=>'P69_DELIVERYORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'DELIVERYORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582620532566415227)
,p_name=>'P69_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(604170100592634558)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOCTYPE'
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
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582638917142415233)
,p_name=>'P69_DRIVERMOBILENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Driver Mobile No'
,p_source=>'DRIVERMOBILENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(582624517768415228)
,p_name=>'P69_DRIVERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Driver Name'
,p_source=>'DRIVERNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(582643257807415235)
,p_name=>'P69_EQUIPMENTTRANSFERNOTETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'EQUIPMENTTRANSFERNOTETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582621272422415227)
,p_name=>'P69_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582630493988415230)
,p_name=>'P69_FORM59NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'FORM59NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582630917536415230)
,p_name=>'P69_FORM59TOKENDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'FORM59TOKENDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582631289643415231)
,p_name=>'P69_FORM59TOKENNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'FORM59TOKENNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1054747538322430956)
,p_name=>'P69_FORMSTATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P69_TNO is null then',
'		return(''NEWRECORD'');',
'	else',
'		return(''EDITRECORD'');',
'	End if;',
'	end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582629322498415230)
,p_name=>'P69_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select FREIGHTTYPENAME , FREIGHTTYPECODE from freighttype WHERE MODULECODE=''GRN'''
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
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582635725906415232)
,p_name=>'P69_GATEINTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'GATEINTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582636056285415232)
,p_name=>'P69_GATEOUTTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'GATEOUTTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582632143175415231)
,p_name=>'P69_GATEPASSTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(604170318130634560)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Gate Pass No'
,p_source=>'GATEPASSTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select gatepassno , tno from gatepass',
'where getdocumentstatuscode(''GATEPASS'',TNO) = ''ACTIVE'''))
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582644509322415235)
,p_name=>'P69_GATEREPORTINGTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'GATEREPORTINGTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582633710898415231)
,p_name=>'P69_GROSSWEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Gross Weight'
,p_format_mask=>'999999999.999'
,p_source=>'GROSSWEIGHT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582639732226415233)
,p_name=>'P69_INTERUNITTRANSFERCCINVOICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'INTERUNITTRANSFERCCINVOICETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582636467640415232)
,p_name=>'P69_ISEXCISABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'ISEXCISABLE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582628869740415230)
,p_name=>'P69_ISGRNPREPARED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'ISGRNPREPARED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582628543634415230)
,p_name=>'P69_ISWEIGHTTAKEN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'ISWEIGHTTAKEN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582623274608415228)
,p_name=>'P69_JOBORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(604170318130634560)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Job Order No'
,p_source=>'JOBORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select joborderno , tno from joborder    ',
'where doctypecode = ''CONVERSIONJOBOUTOFPREMISES''',
'and getdocumentstatuscode(''JOBORDER'',TNO) = ''ACTIVE'''))
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582640514119415234)
,p_name=>'P69_LIFTINGFROMCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'LIFTINGFROMCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(604170182856634559)
,p_name=>'P69_LOADINGADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(604170318130634560)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Loading Advice No'
,p_post_element_text=>'<a href="f?p=&APP_ID.:155:&SESSION.::NO:RP,155:P155_TNO,P155_CALLEDFROMPAGE,P155_FORMSTATUS,P155_CALLEDFROMTNO:&P69_LOADINGADVICETNO.,69,CALLED,&P69_TNO."><span class="fa fa-magic"></span></a>'
,p_source=>'LOADINGADVICETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P69_LOADINGADVICETNO'
,p_lov_cascade_parent_items=>'P69_LOCATIONCODE,P69_PARTYCODE'
,p_ajax_items_to_submit=>'P69_LOCATIONCODE,P69_DOCTYPECODE,P69_LOADINGADVICETNO,P69_PARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582620129061415227)
,p_name=>'P69_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(604170100592634558)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationName as d,',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID',
'   -- and getdocumentstatuscode(''LOCATION'',a.TNO) = ''ACTIVE'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582632495872415231)
,p_name=>'P69_LRDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'LR Date'
,p_source=>'LRDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P69_MATERIALINDATE',
  'min_date', 'ITEM',
  'min_item', 'P69_PODATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582631696825415231)
,p_name=>'P69_LRNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'LR No'
,p_source=>'LRNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(582622090201415228)
,p_name=>'P69_MATERIALINDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(604170100592634558)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Material In Date'
,p_source=>'MATERIALINDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P69_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P69_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582621737101415227)
,p_name=>'P69_MATERIALINNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(604170100592634558)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Material In No'
,p_source=>'MATERIALINNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
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
 p_id=>wwv_flow_imp.id(582633300223415231)
,p_name=>'P69_MATERIALINTRANSITTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MATERIALINTRANSITTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582638117087415233)
,p_name=>'P69_MBILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MBILLDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582637659960415233)
,p_name=>'P69_MBILLNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MBILLNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582626054149415229)
,p_name=>'P69_MINESCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MINESCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582641285769415234)
,p_name=>'P69_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1062542520320976550)
,p_name=>'P69_MODULEFLOW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582640902643415234)
,p_name=>'P69_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582637279303415233)
,p_name=>'P69_MPARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'MPARTYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582634461571415232)
,p_name=>'P69_NETWEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Net Weight'
,p_format_mask=>'999999999.999'
,p_source=>'NETWEIGHT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582645331783415235)
,p_name=>'P69_NOSOFPACKAGES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'NOSOFPACKAGES'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582645696892415235)
,p_name=>'P69_OLDVEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'OLDVEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1062542427230976549)
,p_name=>'P69_ONTHETABLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582622482724415228)
,p_name=>'P69_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(604170100592634558)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P69_PARTY'
,p_lov_cascade_parent_items=>'P69_LOCATIONCODE,P69_DOCTYPECODE'
,p_ajax_items_to_submit=>'P69_LOCATIONCODE,P69_DOCTYPECODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>30
,p_colspan=>6
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1062474345358837117)
,p_name=>'P69_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(501248803206516517)
,p_name=>'P69_PODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(604170318130634560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582646091787415236)
,p_name=>'P69_PORTGRNTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'PORTGRNTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582639262250415233)
,p_name=>'P69_PREDELIVERYINSPECTIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'PREDELIVERYINSPECTIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582622861738415228)
,p_name=>'P69_PURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(604170318130634560)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Purchase Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:118:&SESSION.::NO:RP,118:P118_TNO,P118_CALLEDFROMPAGE,P118_FORMSTATUS,P118_CALLEDFROMTNO:&P69_PURCHASEORDERTNO.,69,CALLED,&P69_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'PURCHASEORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P69_PURCHASEORDERTNO_1'
,p_lov_cascade_parent_items=>'P69_PARTYCODE'
,p_ajax_items_to_submit=>'P69_PARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582630050540415230)
,p_name=>'P69_RAKETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'RAKETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582627693428415229)
,p_name=>'P69_REFDOCAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(604170350920634561)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Ref Doc Amount'
,p_source=>'REFDOCAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582627329593415229)
,p_name=>'P69_REFDOCDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(604170350920634561)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Ref Doc Date'
,p_source=>'REFDOCDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P69_MATERIALINDATE',
  'min_date', 'ITEM',
  'min_item', 'P69_PODATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582626887533415229)
,p_name=>'P69_REFDOCNO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(604170350920634561)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Ref Doc No'
,p_source=>'REFDOCNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
,p_grid_label_column_span=>4
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582626461204415229)
,p_name=>'P69_REFDOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(604170350920634561)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Ref Doc Type'
,p_source=>'REFDOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select doctypename , doctypecode from doctype   ',
'where ISUSEDASREFDOCTYPE = ''YES'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>4
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582646493511415236)
,p_name=>'P69_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(582638480775415233)
,p_name=>'P69_REPORTINGTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'REPORTINGTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582628048464415230)
,p_name=>'P69_SALETAXFORMTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'SALETAXFORMTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582643709613415235)
,p_name=>'P69_SHIFTINGADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'SHIFTINGADVICETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582644054265415235)
,p_name=>'P69_SHIFTINGTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'SHIFTINGTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582887363235836445)
,p_name=>'P69_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(579900566383851960)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579900318544851957)
,p_name=>'P69_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P69_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1062474181713837116)
,p_name=>'P69_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582634119370415232)
,p_name=>'P69_TAREWEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Tare Weight'
,p_format_mask=>'999999999.999'
,p_source=>'TAREWEIGHT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582636923816415232)
,p_name=>'P69_TAXVEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'TAXVEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582619672898415227)
,p_name=>'P69_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582634933289415232)
,p_name=>'P69_TOMODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'TOMODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582635334315415232)
,p_name=>'P69_TOMODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'TOMODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582624131256415228)
,p_name=>'P69_TRANSPORTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Transporter'
,p_source=>'TRANSPORTERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode from party   ',
'where partytypecode = ''TRANSPORTER'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582625661996415229)
,p_name=>'P69_UNIONNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'UNIONNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(490579633865102491)
,p_name=>'P69_VALID'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(1060643170088488385)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582625308172415229)
,p_name=>'P69_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Vehicle No'
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582624854211415229)
,p_name=>'P69_VEHICLETYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(604170513601634562)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_prompt=>'Vehicle Type'
,p_source=>'VEHICLETYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select VEHICLETYPENAME , VEHICLETYPECODE from vehicletype'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(582640134376415234)
,p_name=>'P69_WORKORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_item_source_plug_id=>wwv_flow_imp.id(582619246559415227)
,p_source=>'WORKORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(497678535161873428)
,p_name=>'check codescheme'
,p_static_id=>'check-codescheme'
,p_event_sequence=>430
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_MATERIALINDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(497678576476873429)
,p_event_id=>wwv_flow_imp.id(497678535161873428)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_PARTYCODE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_CODESCHEME'
,p_client_condition_expression=>'AUTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(497678757961873430)
,p_event_id=>wwv_flow_imp.id(497678535161873428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_CODESCHEME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CODESCHEME  from codescheme',
    '    where companycode = :global_companycode',
    '    and modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    and FINANCIALYEARCODE = :global_FINANCIALYEARCODE;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(185181588918627278)
,p_name=>'Check LR'
,p_static_id=>'check-lr'
,p_event_sequence=>410
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_LRNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(185181645874627279)
,p_event_id=>wwv_flow_imp.id(185181588918627278)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_FINANCIALYEARCODE,P69_PARTYCODE,P69_REFDOCTYPECODE,P69_REFDOCNO,P69_LRNO,P69_TRANSPORTERCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ',
    '    tmp number;',
    '    tmp1 number;',
    'begin',
    '',
    '',
    '    select count(*) into tmp from materialin',
    '    where FINANCIALYEARCODE = :P69_FINANCIALYEARCODE',
    '    and TRANSPORTERCODE = :P69_TRANSPORTERCODE',
    '    and LRNO = :P69_LRNO;',
    '',
    '   ',
    '',
    '    if nvl(tmp , 0)> 0   then ',
    '        raise_application_error(-20000,''LR NO is already used in Matrial In.'');',
    '    end if;',
    '   ',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604171730694634574)
,p_name=>'Check Pending Qty'
,p_static_id=>'check-pending-qty'
,p_event_sequence=>240
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604537716999679925)
,p_event_id=>wwv_flow_imp.id(604171730694634574)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,P69_VALID',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P69_PURCHASEORDERTNO,QUANTITY1,P69_TNO,P69_VALID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    '    tmp1 number;',
    '    ptolerance number :=0;',
    'begin',
    '',
    '    select nvl(HIGHERTOLERANCEPERCENT,0) into ptolerance  from purchaseorderdetail ',
    '    where tno=:P69_PURCHASEORDERTNO',
    '    and ITEMCODE=:ITEMCODE',
    '    and ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE;',
    '',
    '    if :P69_FORMSTATUS = ''NEWRECORD'' then',
    '        tmp := GETPENDINGLOADQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO)',
    '                + (GETPENDINGLOADQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO)* (ptolerance/100));',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '            :Quantity1 := 0;',
    '            :P69_VALID := ''Quantity1 cannot be greater than LOADING Quantity1.'';',
    '            raise_application_error(-20000,''Quantity1 cannot be greater than LOADING Quantity1.'');',
    '        end if;',
    '',
    '    else',
    '        tmp := GETPENDINGLOADQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO)',
    '                + (GETPENDINGLOADQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO)* (ptolerance/100));',
    '',
    '        select sum(quantity1) into tmp1 from materialindetail ',
    '        where itemcode = :ITEMCODE',
    '        and ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
    '        and tno = :P69_TNO;',
    '        ',
    '        if :QUANTITY1 > tmp+tmp1 then',
    '            :Quantity1 := 0;',
    '            :P69_VALID := ''Quantity1 cannot be greater than LOADING Quantity1.'';',
    '            raise_application_error(-20000,''Quantity1 cannot be greater than LOADING Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P69_LOADINGADVICETNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447961866434502296)
,p_event_id=>wwv_flow_imp.id(604171730694634574)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_VALID',
  'items_to_submit', 'QUANTITY1,BALANCE,P69_VALID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if to_number(:QUANTITY1) > to_number(:BALANCE) then ',
    '    --:Quantity1 := 0;',
    '    :P69_VALID := ''ENTERED QUANTITY IS GREATER THAN BALANCE QUANTITY.'';',
    '    raise_application_error(-20000 , ''ENTERED QUANTITY IS GREATER THAN BALANCE QUANTITY.''|| :QUANTITY1 ||''-''|| :BALANCE);',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64814623891925436)
,p_event_id=>wwv_flow_imp.id(604171730694634574)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'pending from delivery intimation '
,p_static_id=>'pending-from-delivery-intimation'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,P69_VALID',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P69_PURCHASEORDERTNO,QUANTITY1,P69_TNO,P69_VALID,P69_DELIVERYINTIMATIONTNO,P69_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    '    tmp1 number;',
    '    ptolerance number :=0;',
    'begin',
    '    select Quantity1 * nvl(HIGHERTOLERANCEPERCENT,0)/100 into ptolerance  from purchaseorderdetail ',
    '    where tno=:P69_PURCHASEORDERTNO',
    '    and ITEMCODE=:ITEMCODE',
    '    and ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE;',
    '',
    '    if :P69_FORMSTATUS = ''NEWRECORD'' then',
    '        --   raise_application_error(-20003,:P69_DELIVERYINTIMATIONTNO);   ',
    '        select sum(quantity1) + ptolerance into tmp',
    '        from deliveryintimationdetail a',
    '        where a.tno = :P69_DELIVERYINTIMATIONTNO',
    '          and ITEMCODE=:ITEMCODE',
    '          and ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE',
    '        ;',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '            :Quantity1 := 0;',
    '            :P69_VALID := ''Quantity1 cannot be greater than Delivery Intimation Quantity1.'';',
    '            raise_application_error(-20000,''Quantity1 cannot be greater than Delivery Intimation Quantity1.'');',
    '        end if;',
    '',
    '    else',
    '     ',
    '        select sum(a.quantity1) into tmp1 from materialindetail a, materialin b',
    '        where a.tno = b.tno',
    '         and a.itemcode = :ITEMCODE',
    '        and a.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
    '        and b.deliveryintimationtno = :P69_DELIVERYINTIMATIONTNO;',
    '        ',
    '        if nvl(:QUANTITY1,0) + nvl(tmp1,0) > tmp then',
    '            :Quantity1 := 0;',
    '            :P69_VALID := ''Quantity1 cannot be greater than Delivery Intimation Quantity1.'';',
    '            raise_application_error(-20000,''Quantity1 cannot be greater than Delivery Intimation Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P69_DELIVERYINTIMATIONTNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(457760155164787589)
,p_name=>'Check ref no'
,p_static_id=>'check-ref-no'
,p_event_sequence=>400
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_REFDOCNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457760224064787590)
,p_event_id=>wwv_flow_imp.id(457760155164787589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_FINANCIALYEARCODE,P69_PARTYCODE,P69_REFDOCTYPECODE,P69_REFDOCNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ',
    '    tmp number;',
    '    tmp1 number;',
    'begin',
    '',
    '',
    '    select count(*) into tmp from materialin',
    '    where FINANCIALYEARCODE = :P69_FINANCIALYEARCODE',
    '    and PARTYCODE = :P69_PARTYCODE',
    '    and REFDOCTYPECODE = :P69_REFDOCTYPECODE',
    '    and REFDOCNO = :P69_REFDOCNO;',
    '',
    '    select count(*) into tmp1 from grn    ',
    '    where FINANCIALYEARCODE = :P69_FINANCIALYEARCODE',
    '    and PARTYCODE = :P69_PARTYCODE',
    '    and REFDOCTYPECODE = :P69_REFDOCTYPECODE',
    '    and REFDOCNO = :P69_REFDOCNO;',
    '',
    '    if nvl(tmp , 0)> 0   then ',
    '        raise_application_error(-20000,''REF DOC NO is already used in Matrial In.'');',
    '    end if;',
    '    if nvl(tmp1 , 0)> 0   then ',
    '        raise_application_error(-20000,''REF DOC NO is already used in GRN.'');',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(493317182753379885)
,p_name=>'delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>420
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(493317314691379886)
,p_event_id=>wwv_flow_imp.id(493317182753379885)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from MATERIALINDETAIL a',
    '    where not exists (',
    '        select 1 from MATERIALIN  aa  ',
    '        where aa.tno = a.tno',
    '    ) ;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582725284148611156)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582725647354611156)
,p_event_id=>wwv_flow_imp.id(582725284148611156)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582697858588499279)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582726180935611156)
,p_event_id=>wwv_flow_imp.id(582725284148611156)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582697858588499279)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P69_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604538305834679931)
,p_event_id=>wwv_flow_imp.id(582725284148611156)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582697858588499279)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from grn a',
'where a.materialintno = :P69_TNO;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582726680122611156)
,p_event_id=>wwv_flow_imp.id(582725284148611156)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582697858588499279)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(591699970326086650)
,p_name=>'Disable fields on Selection'
,p_static_id=>'disable-fields-on-selection'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_DOCTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(591700098784086651)
,p_event_id=>wwv_flow_imp.id(591699970326086650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//function disablefield(pageItem){',
    '//    //$s(pageItem,'''');//Setting null value to the field',
    '//    apex.item(pageItem).disable(); // Disabling the field',
    '//}',
    '//function enablefield(pageItem){',
    '//    apex.item(pageItem).enable(); // Enabling the field',
    '//}',
    '//Disabling all the fields when doctype code is selected',
    'disablefield(''P69_JOBORDERTNO'');',
    'disablefield(''P69_PURCHASEORDERTNO'');',
    'disablefield(''P69_DELIVERYANDPAYMENTSCHEDULETNO'');',
    'disablefield(''P69_ASSETTRANFERORDERTNO'');',
    'disablefield(''P69_EQUIPMENTTRANSFERNOTETNO'');',
    'disablefield(''P69_GATEPASSTNO'');',
    'disablefield(''P69_CCINVOICETNO'');',
    'disablefield(''P69_PREDELIVERYINSPECTIONTNO'');',
    '',
    '',
    '// Providing Conditions to Enable Fields',
    'if ($v(''P69_DOCTYPECODE'') == ''CONVERSIONJOBOUTOFPREMISES''){',
    '    enablefield(''P69_JOBORDERTNO'');',
    '}else if($v(''P69_DOCTYPECODE'')==''PURCHASE''){',
    '    enablefield(''P69_PURCHASEORDERTNO'');',
    '    enablefield(''P69_PREDELIVERYINSPECTIONTNO'');',
    '    enablefield(''P69_DELIVERYANDPAYMENTSCHEDULETNO'');',
    '}',
    'else if($v(''P69_DOCTYPECODE'')== ''SALERETURN''){',
    '    enablefield(''P69_CCINVOICETNO'');',
    '}',
    'else if($v(''P69_DOCTYPECODE'')== ''CONVERSIONJOBOUTOFPREMISES''){',
    '    enablefield(''P69_JOBORDERTNO'');',
    '}',
    'else if($v(''P69_DOCTYPECODE'')== ''RETURNGP''){',
    '    enablefield(''P69_GATEPASSTNO'');',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582730198349613992)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582731132306613992)
,p_event_id=>wwv_flow_imp.id(582730198349613992)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582697124097499279)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582730545851613992)
,p_event_id=>wwv_flow_imp.id(582730198349613992)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582697124097499279)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582727063418612037)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582728023124612037)
,p_event_id=>wwv_flow_imp.id(582727063418612037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582698322593499279)
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
 p_id=>wwv_flow_imp.id(582727499566612037)
,p_event_id=>wwv_flow_imp.id(582727063418612037)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582698322593499279)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P69_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604538229204679930)
,p_event_id=>wwv_flow_imp.id(582727063418612037)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582698322593499279)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from grn a',
'where a.materialintno = :P69_TNO;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582728450413612037)
,p_event_id=>wwv_flow_imp.id(582727063418612037)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582698322593499279)
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
 p_id=>wwv_flow_imp.id(582728940558612938)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582729759022612938)
,p_event_id=>wwv_flow_imp.id(582728940558612938)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582700245430499280)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582729255278612938)
,p_event_id=>wwv_flow_imp.id(582728940558612938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582700245430499280)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582719158075606261)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(582700245430499280)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582722051525606268)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582700245430499280)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582721612104606267)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582700245430499280)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582720084234606264)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P69_TNO,:P69_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582720609919606264)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P69_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(596723009250907756)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582700245430499280)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582721122223606266)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(717089552420977799)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582719588889606263)
,p_event_id=>wwv_flow_imp.id(582719158075606261)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582723480859610190)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582723847491610190)
,p_event_id=>wwv_flow_imp.id(582723480859610190)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582699089555499279)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582724390119610190)
,p_event_id=>wwv_flow_imp.id(582723480859610190)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582699484683499279)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582724934422610190)
,p_event_id=>wwv_flow_imp.id(582723480859610190)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(582699866292499279)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582717351596604755)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(582699484683499279)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582718264426604756)
,p_event_id=>wwv_flow_imp.id(582717351596604755)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_COMPANYCODE,P69_PURCHASEORDERNO',
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
    '						and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '						and d.LoginName = User',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P60_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = '':P''||to_char(:APP_PAGE_ID)||''_PASSFAILREMARK''',
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
 p_id=>wwv_flow_imp.id(582718781715604756)
,p_event_id=>wwv_flow_imp.id(582717351596604755)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582717834941604756)
,p_event_id=>wwv_flow_imp.id(582717351596604755)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577952903315219047)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(582697124097499279)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577953010645219048)
,p_event_id=>wwv_flow_imp.id(577952903315219047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(614568774706739873)
,p_name=>'Get item from CCInv'
,p_static_id=>'get-item-from-ccinv'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(579900363935851958)
,p_condition_element=>'P69_CCINVOICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(614568887835739874)
,p_event_id=>wwv_flow_imp.id(614568774706739873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_PURCHASEORDERTNO,P69_DELIVERYANDPAYMENTSCHEDULETNO,P69_CCINVOICETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--raise_application_error(-20003,:P118_DOCTYPECODE);',
    'begin',
    '    if :P69_CCINVOICETNO is not null then ',
    '',
    '        delete from MATERIALINDETAIL where tno = :P69_TNO;',
    '',
    '',
    '         --raise_application_error(-20003,:P69_CCINVOICETNO);',
    '        for vloop in (',
    '        select ',
    '        			:P69_TNO as tno,',
    '        			b.itemcode,',
    '        			b.itemspecificationcode,',
    '        			globaltno.nextval as sno,',
    '                    b.quantity1,',
    '                    A.TNO AS PTNO',
    '        from ',
    '        			ccinvoice a, ',
    '        			ccinvoicedetail b,',
    '        			item e,',
    '        			itemspecification ee',
    '        where',
    '        			a.tno = b.tno',
    '        			and b.itemcode = e.itemcode',
    '                    and b.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        			and b.itemspecificationcode = ee.itemspecificationcode',
    '        			and a.tno = :P69_CCINVOICETNO',
    '        			',
    '        		',
    '        ) loop',
    '            insert into MATERIALINDETAIL',
    '                (',
    '                    TNO,',
    '                    ITEMCODE,',
    '                    ITEMSPECIFICATIONCODE,',
    '                    SNO,',
    '                    Quantity1,',
    '                    PURCHASEORDERTNO',
    '                ) values',
    '                (',
    '                    vloop.tno,',
    '                     vloop.itemcode,',
    '                     vloop.itemspecificationcode,',
    '                     vloop.sno,',
    '                     vloop.quantity1,',
    '                     null',
    '                );',
    '        end loop;',
    '        --end if;',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(615065474222842625)
,p_event_id=>wwv_flow_imp.id(614568774706739873)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(579900566383851960)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64814364550925433)
,p_name=>'Get item from deliveryIntimation'
,p_static_id=>'get-item-from-deliveryintimation'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(579900363935851958)
,p_condition_element=>'P69_DELIVERYINTIMATIONTNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64814434808925434)
,p_event_id=>wwv_flow_imp.id(64814364550925433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_PURCHASEORDERTNO,P69_DELIVERYANDPAYMENTSCHEDULETNO,P69_CCINVOICETNO,P69_DOCTYPECODE,P69_LOADINGADVICETNO,P69_DELIVERYINTIMATIONTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--raise_application_error(-20003,:P118_DOCTYPECODE);',
    'begin',
    '    if :P69_DELIVERYINTIMATIONTNO is not null  then ',
    '',
    '        delete from MATERIALINDETAIL where tno = :P69_TNO;',
    '',
    '',
    '        -- raise_application_error(-20003,:P69_DELIVERYINTIMATIONTNO);',
    '        for vloop in (',
    '        select ',
    '        			:P69_TNO as tno,',
    '        			b.itemcode,',
    '        			b.itemspecificationcode,',
    '        			globaltno.nextval as sno,',
    '                    b.quantity1,',
    '                    A.TNO AS PTNO',
    '        from ',
    '        			DeliveryIntimation a, ',
    '        			DeliveryIntimationdetail b,',
    '        			item e,',
    '        			itemspecification ee',
    '        where',
    '        			a.tno = b.tno',
    '        			and b.itemcode = e.itemcode',
    '                    and b.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        			and b.itemspecificationcode = ee.itemspecificationcode',
    '        			and a.tno = :P69_DELIVERYINTIMATIONTNO',
    '        			',
    '        		',
    '        ) loop',
    '        --raise_application_error(-20003,''q ''||vloop.quantity1);',
    '            insert into MATERIALINDETAIL',
    '                (',
    '                    TNO,',
    '                    ITEMCODE,',
    '                    ITEMSPECIFICATIONCODE,',
    '                    SNO,',
    '                    Quantity1,',
    '                    PURCHASEORDERTNO',
    '                ) values',
    '                (',
    '                    vloop.tno,',
    '                     vloop.itemcode,',
    '                     vloop.itemspecificationcode,',
    '                     vloop.sno,',
    '                     vloop.quantity1,',
    '                     null',
    '                );',
    '        end loop;',
    '        --end if;',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64814520976925435)
,p_event_id=>wwv_flow_imp.id(64814364550925433)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(579900566383851960)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(444370128995721427)
,p_name=>'Get Item from Job Order'
,p_static_id=>'get-item-from-job-order'
,p_event_sequence=>310
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(579900363935851958)
,p_condition_element=>'P69_JOBORDERTNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444370185456721428)
,p_event_id=>wwv_flow_imp.id(444370128995721427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_JOBORDERTNO,P69_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P69_JOBORDERTNO is not null then ',
    '        insert into materialindetail',
    '        (',
    '            tno,',
    '            sno,',
    '            itemcode,',
    '            itemspecificationcode,',
    '            description,',
    '            quantity1,',
    '            quantity2,',
    '            JOBORDERTNO',
    '        )',
    '        (',
    '            select ',
    '                :P69_TNO,',
    '                globaltno.nextval,',
    '                itemcode,',
    '                itemspecificationcode,',
    '                description,',
    '                quantity1,',
    '                quantity2,',
    '                :P69_JOBORDERTNO',
    '            from joborderdetail',
    '            where tno = :P69_JOBORDERTNO',
    '            and itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        );',
    '',
    '        insert into materialindetail',
    '        (',
    '            tno,',
    '            sno,',
    '            itemcode,',
    '            itemspecificationcode,',
    '            quantity1,',
    '            quantity2',
    '        )',
    '        (',
    '            select ',
    '                :P69_TNO,',
    '                globaltno.nextval,',
    '                itemcode,',
    '                itemspecificationcode,',
    '                quantity1,',
    '                quantity2',
    '            from bomdetail',
    '            where tno in (',
    '                select distinct bomcode from joborderdetail ',
    '                where tno = :P69_JOBORDERTNO',
    '            )',
    '        );',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444370367448721429)
,p_event_id=>wwv_flow_imp.id(444370128995721427)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(579900566383851960)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(459200399558572686)
,p_name=>'Get item from loadingadvice'
,p_static_id=>'get-item-from-loadingadvice'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(579900363935851958)
,p_condition_element=>'P69_LOADINGADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(459200479452572687)
,p_event_id=>wwv_flow_imp.id(459200399558572686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_PURCHASEORDERTNO,P69_DELIVERYANDPAYMENTSCHEDULETNO,P69_CCINVOICETNO,P69_DOCTYPECODE,P69_LOADINGADVICETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :P69_LOADINGADVICETNO IS NOT NULL THEN',
    '        -- Clear existing detail',
    '        DELETE FROM MATERIALINDETAIL WHERE TNO = :P69_TNO;',
    '        -- Bulk insert from LoadingAdvice',
    '        INSERT INTO MATERIALINDETAIL (',
    '            TNO,',
    '            SNO,',
    '            ITEMCODE,',
    '            ITEMSPECIFICATIONCODE,',
    '            DESCRIPTION,',
    '            QUANTITY1,',
    '            QUANTITY2,',
    '            PURCHASEORDERTNO',
    '        )',
    '        SELECT',
    '            :P69_TNO,',
    '            GLOBALTNO.NEXTVAL,',
    '            B.ITEMCODE,',
    '            B.ITEMSPECIFICATIONCODE,',
    '            B.DESCRIPTION,',
    '            B.QUANTITY1,',
    '            B.QUANTITY2,',
    '            NULL AS PURCHASEORDERTNO',
    '        FROM  LOADINGADVICE       A',
    '        JOIN  LOADINGADVICEDETAIL B  ON  B.TNO = A.TNO',
    '        JOIN  ITEM                E  ON  E.ITEMCODE = B.ITEMCODE',
    '                                     AND E.ITEMNATURECODE != ''SERVICES''',
    '        JOIN  ITEMSPECIFICATION   EE ON  EE.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
    '        WHERE A.TNO = :P69_LOADINGADVICETNO;',
    '',
    '    END IF;',
    '',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        ROLLBACK;',
    '        RAISE;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(459200634248572688)
,p_event_id=>wwv_flow_imp.id(459200399558572686)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(579900566383851960)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(590602335443368042)
,p_name=>'Get item from PO'
,p_static_id=>'get-item-from-po'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(579900363935851958)
,p_condition_element=>'P69_PURCHASEORDERTNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(590602383402368043)
,p_event_id=>wwv_flow_imp.id(590602335443368042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_PURCHASEORDERTNO,P69_DELIVERYANDPAYMENTSCHEDULETNO,P69_LOADINGADVICETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*',
    'Select a.tno,',
    '       b.itemcode,',
    '       b.itemspecificationcode,',
    '       getpendingpoquantity1(b.itemcode,',
    '                             b.itemspecificationcode,',
    '                             b.purchaseordertno),',
    '       c.quantity1',
    '  From materialin a,',
    '       materialindetail b,',
    '       (Select bb.purchaseordertno,',
    '               bb.itemcode,',
    '               bb.itemspecificationcode,',
    '               Sum(bb.quantity1) Quantity1',
    '          From materialin aa, materialindetail bb',
    '         Where aa.tno = bb.tno',
    '           And Not Exists',
    '         (Select 1',
    '                  From grn xx, grndetail yy',
    '                 Where xx.tno = yy.tno',
    '                   And xx.materialintno = aa.tno',
    '                   And yy.itemcode = bb.itemcode',
    '                   And yy.itemspecificationcode = bb.itemspecificationcode)',
    '         Group By bb.purchaseordertno, bb.itemcode, bb.itemspecificationcode',
    '        ',
    '        ) c',
    ' Where a.tno = b.tno',
    '   And b.purchaseordertno = c.purchaseordertno',
    '   And b.itemcode = c.itemcode',
    '   And b.itemspecificationcode = c.itemspecificationcode',
    '*/',
    '',
    '',
    '--raise_application_error(-20003,:P118_DOCTYPECODE);',
    'begin',
    '    if :P69_PURCHASEORDERTNO is not null and :P69_LOADINGADVICETNO is null and :P69_DELIVERYINTIMATIONTNO is null then',
    '',
    '        delete from MATERIALINDETAIL where tno = :P69_TNO;',
    '',
    '        for vloop in (',
    '        select ',
    '        			:P69_TNO as tno,',
    '        			b.itemcode,',
    '        			b.itemspecificationcode,',
    '        			globaltno.nextval as sno,',
    '                    b.quantity1,',
    '                    A.TNO AS PTNO',
    '        from ',
    '        			purchaseorder a, ',
    '        			Purchaseorderdetail b,',
    '        			item e,',
    '        			itemspecification ee',
    '        where',
    '        			a.tno = b.tno',
    '        			and b.itemcode = e.itemcode',
    '                    and b.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        			and b.itemspecificationcode = ee.itemspecificationcode',
    '        			and a.tno = :P69_PURCHASEORDERTNO',
    '        			and :P69_DELIVERYANDPAYMENTSCHEDULETNO is null ',
    '        		',
    '        ) loop',
    '            insert into MATERIALINDETAIL',
    '                (',
    '                    TNO,',
    '                    ITEMCODE,',
    '                    ITEMSPECIFICATIONCODE,',
    '                    SNO,',
    '                    Quantity1,',
    '                    PURCHASEORDERTNO',
    '                ) values',
    '                (',
    '                    vloop.tno,',
    '                     vloop.itemcode,',
    '                     vloop.itemspecificationcode,',
    '                     vloop.sno,',
    '                     null,',
    '                     vloop.PTNO',
    '                );',
    '        end loop;',
    '        --end if;',
    '',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(590602505444368044)
,p_event_id=>wwv_flow_imp.id(590602335443368042)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(579900566383851960)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582722740962608719)
,p_name=>'Go Back To Called Form'
,p_static_id=>'go-back-to-called-form'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(582697446456499279)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457097312817425719)
,p_event_id=>wwv_flow_imp.id(582722740962608719)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P69_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(590602182849368041)
,p_event_id=>wwv_flow_imp.id(582722740962608719)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from MATERIALINDETAIL a',
    '    where not exists (',
    '        select 1 from MATERIALIN  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P69_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582723050568608719)
,p_event_id=>wwv_flow_imp.id(582722740962608719)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P69_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P69_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    '',
    'url = url.replace("#P2002_TNO#", y);',
    '//window.alert(x);',
    '//window.alert(y);',
    '//window.alert(url);',
    '',
    '',
    '//call',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582888930554836460)
,p_name=>'Hide'
,p_static_id=>'hide'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(582888789722836459)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582889016362836461)
,p_event_id=>wwv_flow_imp.id(582888930554836460)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(582888056154836452)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(444369563738721421)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>300
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444369604740721422)
,p_event_id=>wwv_flow_imp.id(444369563738721421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582887660099836448)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582887825905836449)
,p_event_id=>wwv_flow_imp.id(582887660099836448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499823099263593204)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>450
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(582886098843836432)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499823180456593205)
,p_event_id=>wwv_flow_imp.id(499823099263593204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ( $(''#ATTRIBUTECODE'').val() === '''' ){',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_PersonalBelonging"].moveNext();',
    '    }')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582715218379602569)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(582699089555499279)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582716094509602569)
,p_event_id=>wwv_flow_imp.id(582715218379602569)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_TNO,P69_COMPANYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = '':P''||:APP_PAGE_ID||''_TNo''',
    '				and d.LoginName = User',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
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
    '				a.remark = '':P''||:APP_PAGE_ID||''_PASSFAILREMARK''',
    '			where a.TNo = vPassFail.TNo;',
    '			',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, '':P''||:APP_PAGE_ID||''_TNo'' , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582716577980602569)
,p_event_id=>wwv_flow_imp.id(582715218379602569)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582715548243602569)
,p_event_id=>wwv_flow_imp.id(582715218379602569)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(591700565296086656)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(594494436696778894)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(591700704410086657)
,p_event_id=>wwv_flow_imp.id(591700565296086656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1026751010212889983)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447055429579861595)
,p_name=>'Set Balance'
,p_static_id=>'set-balance'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447055514291861596)
,p_event_id=>wwv_flow_imp.id(447055429579861595)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'BALANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_PURCHASEORDERTNO,ITEMCODE,ITEMSPECIFICATIONCODE,P69_TNO,P69_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '               ',
    '                GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO , :P69_MATERIALINDATE) ',
    '                 + ( GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO , :P69_MATERIALINDATE)*(nvl(a.HIGHERTOLERANCEPERCENT,0)/100))',
    '                -  nvl(d.quantity1,0)  - NVL(c.quantity1,0)',
    '                as balance',
    '            from PurchaseOrderDetail a ',
    '            ,',
    '             ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.QUANTITY1) QUANTITY1, ',
    '                      SUM(CC.QUANTITY2) QUANTITY2',
    '             FROM loadingadvice Bb , loadingadvicedetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             and bb.tno <> :P69_LOADINGADVICETNO',
    '             And Not Exists',
    '                  (Select 1',
    '                     From materialin xx',
    '                    Where xx.loadingadvicetno = bb.tno) AND Not Exists',
    '                  (Select 1 From grn xx Where xx.loadingadvicetno = bb.tno)',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) C ,',
    '              ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.QUANTITY1) QUANTITY1, ',
    '                      SUM(CC.QUANTITY2) QUANTITY2',
    '             FROM materialin Bb , materialindetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             And Not Exists',
    '           (Select 1 From grn xx Where xx.materialintno = bb.tno)',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) D',
    '            where a.tno = :P69_PURCHASEORDERTNO',
    '            and a.tno = C.purchaseordertno(+)',
    '            and a.itemcode = c.itemcode(+)',
    '            and a.itemspecificationcode = c.itemspecificationcode(+)',
    '            and a.tno = D.purchaseordertno(+)',
    '            and a.itemcode = D.itemcode(+)',
    '            and a.itemspecificationcode = D.itemspecificationcode(+)',
    '            --and a.quantity1 - nvl(c.quantity1,0)- nvl(d.quantity1,0) > 0',
    '            and GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P69_PURCHASEORDERTNO , :P69_MATERIALINDATE) -  nvl(d.quantity1,0)  - NVL(c.quantity1,0) > 0',
    '            and a.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '          ',
    '            and a.itemcode = :itemcode',
    '            and a.itemspecificationcode = :itemspecificationcode;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64813938689925429)
,p_name=>'Set Data'
,p_static_id=>'set-data'
,p_event_sequence=>480
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_DELIVERYINTIMATIONTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64814301623925432)
,p_event_id=>wwv_flow_imp.id(64813938689925429)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_LOADINGADVICETNO'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P69_DELIVERYINTIMATIONTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64814034694925430)
,p_event_id=>wwv_flow_imp.id(64813938689925429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_PURCHASEORDERTNO,P69_FREIGHTTYPECODE,P69_TRANSPORTERCODE,P69_VEHICLETYPECODE,P69_VEHICLENO,P69_DRIVERNAME,P69_DRIVERMOBILENO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_DELIVERYINTIMATIONTNO,P69_PARTYCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '   PurchaseOrderTno,',
    '   FreighttypeCode,',
    '   TransporterCode,',
    '   VehicletypeCode,',
    '   VehicleNo,',
    '   DriverName,',
    '   DriverMobileNo',
    'From DeliveryIntimation',
    'Where tno = :P69_DELIVERYINTIMATIONTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502722626544667389)
,p_name=>'set decimal qty1'
,p_static_id=>'set-decimal-qty'
,p_event_sequence=>250
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502722715333667390)
,p_event_id=>wwv_flow_imp.id(502722626544667389)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502722793124667391)
,p_name=>'set decimal qty1_1'
,p_static_id=>'set-decimal-qty-2'
,p_event_sequence=>260
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502722873595667392)
,p_event_id=>wwv_flow_imp.id(502722793124667391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455853666628080992)
,p_name=>'set modulecode '
,p_static_id=>'set-modulecode'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_JOBORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455853723963080993)
,p_event_id=>wwv_flow_imp.id(455853666628080992)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_MODULECODE,P69_MODULETNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_JOBORDERTNO',
  'sql_query', 'select ''JOBORDER'',:P69_JOBORDERTNO  FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455853818413080994)
,p_name=>'set modulecode _1'
,p_static_id=>'set-modulecode-2'
,p_event_sequence=>390
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_PURCHASEORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455853912413080995)
,p_event_id=>wwv_flow_imp.id(455853818413080994)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_MODULECODE,P69_MODULETNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_PURCHASEORDERTNO',
  'sql_query', 'select ''PURCHASEORDER'',:P69_PURCHASEORDERTNO  FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455853460570080990)
,p_name=>'set modulecode and tno'
,p_static_id=>'set-modulecode-and-tno'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455853471621080991)
,p_event_id=>wwv_flow_imp.id(455853460570080990)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_MODULECODE,P69_MODULETNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_LOADINGADVICETNO',
  'sql_query', 'select ''LOADINGADVICE'',:P69_LOADINGADVICETNO FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455853986052080996)
,p_name=>'set modulecode  for ccinvoice'
,p_static_id=>'set-modulecode-for-ccinvoice'
,p_event_sequence=>370
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_CCINVOICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455854083732080997)
,p_event_id=>wwv_flow_imp.id(455853986052080996)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_MODULECODE,P69_MODULETNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_CCINVOICETNO',
  'sql_query', 'select ''CCINVOICE'',:P69_CCINVOICETNO  FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455854228095080998)
,p_name=>'set modulecode  for GATEPASS'
,p_static_id=>'set-modulecode-for-gatepass'
,p_event_sequence=>380
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_GATEPASSTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455854298679080999)
,p_event_id=>wwv_flow_imp.id(455854228095080998)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_MODULECODE,P69_MODULETNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_GATEPASSTNO',
  'sql_query', 'select ''GATEPASS'',:P69_GATEPASSTNO  FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(606208493945247868)
,p_name=>'Set Net Weight'
,p_static_id=>'set-net-weight'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_TAREWEIGHT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(606208568068247869)
,p_event_id=>wwv_flow_imp.id(606208493945247868)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_NETWEIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_GROSSWEIGHT,P69_TAREWEIGHT',
  'plsql_expression', 'nvl(:P69_GROSSWEIGHT,0)-nvl(:P69_TAREWEIGHT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604171518910634572)
,p_name=>'Set Other Details'
,p_static_id=>'set-other-details'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_LOADINGADVICETNO'
,p_condition_element=>'P69_LOADINGADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604171610367634573)
,p_event_id=>wwv_flow_imp.id(604171518910634572)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_FREIGHTTYPECODE,P69_VEHICLENO,P69_DRIVERMOBILENO,P69_TRANSPORTERCODE,P69_VEHICLETYPECODE,P69_DRIVERNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select FREIGHTTYPECODE , VEHICLENO , DRIVERMOBILENO , ISSUEDTOPARTYCODE , VEHICLETYPE , ',
    'DRIVERNAME from loadingadvice',
    'where tno = :P69_LOADINGADVICETNO',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582887465414836446)
,p_name=>'Set P69_SNO'
,p_static_id=>'set-p69-sno'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582887637656836447)
,p_event_id=>wwv_flow_imp.id(582887465414836446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'sql_query', 'select :SNO from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(582887942722836450)
,p_name=>'Set Page Item SNO'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(582887946094836451)
,p_event_id=>wwv_flow_imp.id(582887942722836450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "SNO");',
    '',
    'apex.item( "P69_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604170636020634563)
,p_name=>'Set PO'
,p_static_id=>'set-po'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604170649892634564)
,p_event_id=>wwv_flow_imp.id(604170636020634563)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_PURCHASEORDERTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select PURCHASEORDERTNO from loadingadvice',
    'where tno = :P69_LOADINGADVICETNO',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(501248945693516518)
,p_name=>'set podate'
,p_static_id=>'set-podate'
,p_event_sequence=>460
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_PURCHASEORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501248990319516519)
,p_event_id=>wwv_flow_imp.id(501248945693516518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_PODATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P69_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select PURCHASEORDERDATE from purchaseorder     ',
    'where tno = :P69_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604170759098634565)
,p_name=>'Set Quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>230
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604170852098634566)
,p_event_id=>wwv_flow_imp.id(604170759098634565)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,QUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return nvl(:QUANTITY1,0)*nvl(mfactor,0);',
    '    exception when others then  ',
    '        null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447528232707890417)
,p_name=>'Set Quantity1'
,p_static_id=>'set-quantity-2'
,p_event_sequence=>270
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'QUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'UNIT2'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447528363027890418)
,p_event_id=>wwv_flow_imp.id(447528232707890417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,QUANTITY2,QUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    if  mfactor != 0 then',
    '        return nvl(:QUANTITY2,0)/nvl(mfactor,0);',
    '    else ',
    '        return nvl(:QUANTITY1,0);',
    '    end if;',
    '    exception when others then  ',
    '        null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'QUANTITY2'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(454184582734282633)
,p_name=>'set sno seq'
,p_static_id=>'set-sno-seq'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(582886098843836432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(454184682850282634)
,p_event_id=>wwv_flow_imp.id(454184582734282633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450573753531186993)
,p_name=>'Set Units'
,p_static_id=>'set-units'
,p_event_sequence=>330
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450573832759186994)
,p_event_id=>wwv_flow_imp.id(450573753531186993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT1,UNIT2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select  GetMeasuringUnitNameFromItem(:itemcode) unit1 ,',
    ' GetMeasuringUnit2NameFromItem(:itemcode) unit2 from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(501249080101516520)
,p_name=>'skip balance'
,p_static_id=>'skip-balance'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(579900566383851960)
,p_triggering_element=>'DESCRIPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501249195571516521)
,p_event_id=>wwv_flow_imp.id(501249080101516520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PACKINGTYPECODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(497678775648873431)
,p_name=>'tab move'
,p_static_id=>'tab-move'
,p_event_sequence=>440
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(497678953417873432)
,p_event_id=>wwv_flow_imp.id(497678775648873431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '      apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '',
    '',
    '         ',
    '',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501248728740516516)
,p_event_id=>wwv_flow_imp.id(497678775648873431)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', ' $("#GETITEM").focus();')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(185181754918627280)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check LR No'
,p_static_id=>'check-lr-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tmp number;',
'    tmp1 number;',
'begin',
'',
'    select count(*) into tmp from materialin',
'    where FINANCIALYEARCODE = :P69_FINANCIALYEARCODE',
'    and TRANSPORTERCODE = :P69_TRANSPORTERCODE',
'    and LRNO = :P69_LRNO;',
'',
'    if nvl(tmp , 0)> 0   then ',
'        raise_application_error(-20000,''LR NO is already used in Matrial In.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(582698702990499279)
,p_internal_uid=>17262736452499838
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(501249449834516523)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check Net weight and sum of quantity'
,p_static_id=>'check-net-weight-and-sum-of-quantity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number := 0;',
'begin',
'    select sum(quantity1) into tmp',
'    from materialindetail',
'    where tno = :P69_TNO;',
'',
'    if :P69_NETWEIGHT > 0 then',
'',
'        if tmp <> :P69_NETWEIGHT then ',
'            raise_application_error(-20000 , ''Net weight and Sum of quantity are not equal'');',
'        end if; ',
'',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>62264580634818539
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(502726601282667429)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check Net weight and sum of quantity_1'
,p_static_id=>'check-net-weight-and-sum-of-quantity-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number := 0;',
'begin',
'    select sum(quantity1) into tmp',
'    from materialindetail',
'    where tno = :P69_TNO;',
'',
'    if :P69_NETWEIGHT > 0 then',
'',
'        if tmp <> :P69_NETWEIGHT then ',
'            raise_application_error(-20000 , ''Net weight and Sum of quantity are not equal'');',
'        end if; ',
'',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(582698322593499279)
,p_process_when_type=>'NEVER'
,p_internal_uid=>63741732082969445
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(501249283031516522)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check Ref No'
,p_static_id=>'check-ref-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tmp number;',
'    tmp1 number;',
'begin',
'',
'',
'    select count(*) into tmp from materialin',
'    where FINANCIALYEARCODE = :P69_FINANCIALYEARCODE',
'    and PARTYCODE = :P69_PARTYCODE',
'    and REFDOCTYPECODE = :P69_REFDOCTYPECODE',
'    and REFDOCNO = :P69_REFDOCNO;',
'',
'    select count(*) into tmp1 from grn    ',
'    where FINANCIALYEARCODE = :P69_FINANCIALYEARCODE',
'    and PARTYCODE = :P69_PARTYCODE',
'    and REFDOCTYPECODE = :P69_REFDOCTYPECODE',
'    and REFDOCNO = :P69_REFDOCNO;',
'',
'    if nvl(tmp , 0)> 0   then ',
'        raise_application_error(-20000,''REF DOC NO is already used in Matrial In.'');',
'    end if;',
'    if nvl(tmp1 , 0)> 0   then ',
'        raise_application_error(-20000,''REF DOC NO is already used in GRN.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(582698702990499279)
,p_internal_uid=>62264413831818538
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(614568649006739872)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create PO By CCinv'
,p_static_id=>'create-po-by-ccinv'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'		cursor cMaterialIn is',
'				select',
'						a.TNo,',
'						a.MaterialInNo,',
'						a.MaterialInDate,',
'						a.CompanyCode,',
'						a.FinancialYearCode,',
'						a.CCInvoiceTNo,',
'						a.DocTypeCode,',
'						a.PurchaseOrderTNo,',
'						a.FreightTypeCode',
'				from MaterialIn a',
'				where a.TNo = :P69_TNO',
'						and a.CCInvoiceTNo is not null',
'						and a.PurchaseOrderTNo is null						',
'		;',
'		vMaterialIn cMaterialIn%ROWTYPE;',
'		Intno number;',
'		Potno number;',
'BEGIN',
'    if :P69_CCINVOICETNO is not null then',
'        ',
'    		open cMaterialIn;',
'    		fetch cMaterialIn into vMaterialIn;',
'      	if cMaterialIn%FOUND then',
'    				select',
'    						globaltno.nextval into Intno',
'    				from dual;',
'    				',
'    				select',
'    						globaltno.nextval into Potno',
'    				from dual;',
'    				',
'    				Insert into Indent(',
'    						TNo,',
'    						CompanyCode,',
'    						FinancialYearCode,',
'    						LocationCode,',
'    						DocTypeCode,',
'    						IndentNo,',
'    						IndentDate,',
'    						DepartmentCode',
'    				) select',
'    						Intno,',
'    						:global_CompanyCode,',
'    						:global_FinancialYearCode,',
'    						a.LocationCode,',
'    						''SALERETURN'',',
'    						a.CCInvoiceNo,',
'    						vMaterialIn.MaterialInDate,',
'    						NVL( getMyParameterValue(''SALEDEPARTMENT'') , ''SALE'')',
'    				from CCInvoice a',
'    				where a.TNO = vMaterialIn.CCInvoiceTNo',
'    				;',
'    				',
'    				Insert into IndentDetail(',
'    						TNo,',
'    						SNo,',
'    						ItemCode,',
'    						ItemSpecificationCode,',
'    						Quantity1,',
'    						Quantity2,',
'    						IndentQuantity1,',
'    						IndentQuantity2',
'    				) select',
'    						Intno,',
'    						globaltno.nextval,',
'    						a.ItemCode,',
'    						a.ItemSpecificationCode,',
'    						a.Quantity1,',
'    						a.Quantity2,',
'    						a.Quantity1,',
'    						a.Quantity2  					',
'    				from CCInvoiceDetail a',
'    				where a.TNo = vMaterialIn.CCInvoiceTNo',
'    				;',
'    				',
'    				Insert into PurchaseOrder(',
'    						TNo,',
'    						CompanyCode,',
'    						FinancialYearCode,',
'    						LocationCode,',
'    						DocTypeCode,',
'    						PurchaseOrderNo,',
'    						PurchaseOrderDate,',
'    						PartyCode,',
'    						CurrencyUnitCode,',
'    						CurrencyValue,',
'    						ItemWiseFooter,',
'    						SumOfAmount,',
'    						SumOfFooterAmount,',
'    						PurchaseOrderAmount,',
'    						FreightTypeCode,',
'    						-- Added Indent at 23-jun-2022',
'    						IndentTNo',
'    				) select',
'    						Potno,',
'    						:global_CompanyCode,',
'    						:global_FinancialYearCode,',
'    						a.LocationCode,',
'    						''SALERETURN'',',
'    						a.CCInvoiceNo,',
'    						vMaterialIn.MaterialInDate,',
'    						a.PartyCode,',
'    						a.CurrencyUnitCode,',
'    						a.CurrencyValue,',
'    						a.ItemWiseFooter,',
'    						a.SumOfAmount,',
'    						a.SumOfFooterAmount,',
'    						a.CCInvoiceAmount,',
'    						vMaterialIn.FreightTypeCode,',
'    						Intno',
'    				from CCInvoice a',
'    				where a.TNo = vMaterialIn.CCInvoiceTNo',
'    				;',
'    				',
'    				insert into PurchaseOrderDetail(',
'    						 TNO,                    ',
'    						 SNO,                    ',
'    						 INDENTTNO,',
'    						 ITEMCODE,',
'    						 ITEMSPECIFICATIONCODE,',
'    						 DESCRIPTION,',
'    						 QUANTITY1,',
'    						 QUANTITY2,',
'    						 RATEMEASURINGUNITCODE,',
'    						 RATE,',
'    						 AMOUNT,',
'    						 FOOTERAMOUNT,',
'    						 TOTALAMOUNT,',
'    						 SHORTAGEDEDUCTIONFROM  ,',
'    						 SHORTAGETOLERANCEMETHOD      ',
'    				) select',
'    						Potno,',
'    						globaltno.nextval,',
'    						-- Discarded on 23-jun-2022 because no Indent No required in Purchase order Detail in case of Sale Return',
'    						',
'    						Intno,',
'    						a.ItemCode,',
'    						a.ItemSpecificationCode,',
'    						a.Description,',
'    						a.Quantity1,',
'    						a.Quantity2,',
'    						a.RateMeasuringUnitcode,',
'    						a.Rate,',
'    						a.Amount,',
'    						a.FooterAmount,',
'    						a.TotalAmount,',
'    						''SUPPLIER'',',
'    						''NONE''',
'    				from CCInvoiceDetail a',
'    				where a.TNo = vMaterialIn.CCInvoiceTNo				',
'    				;',
'    				',
'    				Insert into PurchaseOrderDetailFooter(',
'    						TNO,',
'    						SNO,',
'    						FOOTERHEADCODE,',
'    						FOOTERPERCENT,',
'    						FOOTERVALUE,',
'    						SERIALNO       ',
'    				) select',
'    							Potno,',
'    							c.SNo,',
'    							a.FooterHeadCode,',
'    							a.FooterPercent,',
'    							a.FooterValue,',
'    							a.SerialNo',
'    					from CCInvoiceDetailFooter a, CCInvoiceDetail b, PurchaseOrderDetail c',
'    					where a.TNo = b.TNo',
'    							and a.SNo = b.SNo',
'    							and b.ItemCode = c.ItemCode',
'    							and b.ItemSpecificationCode = c.ItemSpecificationCode',
'    							and a.TNo = vMaterialIn.CCInvoiceTNo',
'    							and b.TNo = vMaterialIn.CCInvoiceTNo',
'    							and c.TNo = Potno						',
'    				;',
'    				',
'    				Insert into PurchaseOrderFooter(',
'    						TNO,',
'    						FOOTERHEADCODE,',
'    						FOOTERPERCENT,',
'    						FOOTERVALUE,',
'    						SERIALNO       ',
'    				) select',
'    							Potno,',
'    							a.FooterHeadCode,',
'    							a.FooterPercent,',
'    							a.FooterValue,',
'    							a.SerialNo',
'    					from CCInvoiceFooter a',
'    					where a.TNo = vMaterialIn.CCInvoiceTNo',
'    				;',
'    				',
'    				Update MaterialIn a',
'    						set a.PurchaseOrderTNo = Potno',
'    						where a.TNO = :P69_TNO',
'    				;	',
'    				Update MaterialInDetail a',
'    						set a.PurchaseOrderTNo = Potno',
'    						where a.TNO = :P69_TNO',
'    				;	',
'    				',
'      	end if;',
'      	close cMaterialIn;',
'    end if;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
,p_internal_uid=>174182303755813348
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(48028184527854960)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create PO By CCinv and Loading Advice (SALES RETURN)'
,p_static_id=>'create-po-by-ccinv-and-loading-advice-sales-return'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    tInTno          NUMBER;',
'    tPoTno          NUMBER;',
'    tSumAmount      NUMBER := 0;',
'    tSumFooter      NUMBER := 0;',
'    vMat            MaterialIn%ROWTYPE;',
'BEGIN',
'    -- 1. Initial Validation & Header Fetch',
'    IF :P69_CCINVOICETNO IS NOT NULL AND :P69_LOADINGADVICETNO IS NOT NULL THEN',
'        BEGIN',
'            SELECT MaterialInDate, CCInvoiceTNo, LoadingAdviceTNo, FreightTypeCode ',
'            INTO vMat.MaterialInDate, vMat.CCInvoiceTNo, vMat.LoadingAdviceTNo, vMat.FreightTypeCode',
'            FROM MaterialIn ',
'            WHERE TNo = :P69_TNO AND PurchaseOrderTNo IS NULL;',
'        EXCEPTION WHEN NO_DATA_FOUND THEN RETURN;',
'        END;',
'',
'        tInTno := globaltno.NEXTVAL;',
'        tPoTno := globaltno.NEXTVAL;',
'',
'        -- 2. Indent Header & Detail',
'        INSERT INTO Indent (TNo, CompanyCode, FinancialYearCode, LocationCode, DocTypeCode, IndentNo, IndentDate, DepartmentCode)',
'        SELECT tInTno, :GLOBAL_COMPANYCODE, :GLOBAL_FINANCIALYEARCODE, LocationCode, ''SALERETURN'', CCInvoiceNo, vMat.MaterialInDate, ',
'               NVL(getMyParameterValue(''SALEDEPARTMENT''), ''SALE'')',
'        FROM CCInvoice WHERE TNO = vMat.CCInvoiceTNo;',
'',
'        INSERT INTO IndentDetail (TNo, SNo, ItemCode, ItemSpecificationCode, Quantity1, Quantity2, IndentQuantity1, IndentQuantity2)',
'        SELECT tInTno, globaltno.NEXTVAL, ItemCode, ItemSpecificationCode, Quantity1, Quantity2, Quantity1, Quantity2',
'        FROM LoadingAdviceDetail WHERE TNo = vMat.LoadingAdviceTNo;',
'',
'        -- 3. PO Header (Initial)',
'        INSERT INTO PurchaseOrder (TNo, CompanyCode, FinancialYearCode, LocationCode, DocTypeCode, PurchaseOrderNo, PurchaseOrderDate, PartyCode, ',
'                                   CurrencyUnitCode, CurrencyValue, ItemWiseFooter, FreightTypeCode, IndentTNo, SumOfAmount, SumOfFooterAmount, PurchaseOrderAmount)',
'        SELECT tPoTno, :GLOBAL_COMPANYCODE, :GLOBAL_FINANCIALYEARCODE, LocationCode, ''SALERETURN'', CCInvoiceNo, vMat.MaterialInDate, PartyCode, ',
'               CurrencyUnitCode, CurrencyValue, ItemWiseFooter, vMat.FreightTypeCode, tInTno, 0, 0, 0',
'        FROM CCInvoice WHERE TNo = vMat.CCInvoiceTNo;',
'',
'        -- 4. PO Detail',
'        INSERT INTO PurchaseOrderDetail (TNO, SNO, INDENTTNO, ITEMCODE, ITEMSPECIFICATIONCODE, DESCRIPTION, QUANTITY1, QUANTITY2, ',
'                                         RATEMEASURINGUNITCODE, RATE, AMOUNT, SHORTAGEDEDUCTIONFROM, SHORTAGETOLERANCEMETHOD)',
'        SELECT tPoTno, a.SNo, tInTno, a.ItemCode, a.ItemSpecificationCode, a.Description, a.Quantity1, a.Quantity2, ',
'               ccd.RateMeasuringUnitcode, ccd.Rate, NVL(a.Quantity1,0) * NVL(ccd.Rate,0), ''SUPPLIER'', ''NONE''',
'        FROM LoadingAdviceDetail a ',
'        JOIN CCInvoiceDetail ccd ON a.ITEMCODE = ccd.ITEMCODE AND a.ITEMSPECIFICATIONCODE = ccd.ITEMSPECIFICATIONCODE',
'        WHERE a.TNo = vMat.LoadingAdviceTNo AND ccd.TNO = vMat.CCInvoiceTNo;',
'',
'        -- 5. PO Detail Footer (Taxes)',
'        INSERT INTO PurchaseOrderDetailFooter (tno, sno,  footerheadcode, footerpercent, footervalue, serialno, legendscode)',
'        SELECT ',
'            tPoTno, pod.SNO, trf.FooterHeadCode, trf.TaxRate,',
'            ROUND(((pod.AMOUNT * trf.TaxRate) / 100), 2),',
'            ROW_NUMBER() OVER (PARTITION BY pod.SNO ORDER BY trf.FooterHeadCode), trd.LegendsCode',
'        FROM PurchaseOrderDetail pod',
'        JOIN ITEMSPECIFICATION its ON its.ITEMSPECIFICATIONCODE = pod.ITEMSPECIFICATIONCODE',
'        JOIN CCInvoice cci ON cci.TNO = vMat.CCInvoiceTNo',
'        JOIN PARTY p ON p.PartyCode = cci.PartyCode',
'        JOIN TaxRule tr ON tr.TransactionTypeCode = cci.TransactionTypeCode AND tr.TaxRegistrationTypeCode = p.TaxRegistrationTypeCode',
'        JOIN TaxRuleHSN hsn ON hsn.TNO = tr.TNO AND hsn.HSNCODE = its.HSNCODE',
'        JOIN TaxRuleDetail trd ON trd.TNO = tr.TNO',
'        JOIN TaxRuleDetailFooter trf ON trf.TNO = trd.TNO AND trf.SNO = trd.SNO',
'        WHERE pod.TNo = tPoTno;',
'',
'        -- 6. NEW CLAUSE: Update Detail Line Totals (FooterAmount & TotalAmount)',
'        UPDATE PurchaseOrderDetail pod',
'        SET (pod.FOOTERAMOUNT, pod.TOTALAMOUNT) = (',
'            SELECT SUM(NVL(pdf.FOOTERVALUE, 0)), pod.AMOUNT + SUM(NVL(pdf.FOOTERVALUE, 0))',
'            FROM PurchaseOrderDetailFooter pdf',
'            WHERE pdf.TNO = pod.TNO AND pdf.SNO = pod.SNO',
'        )',
'        WHERE pod.TNO = tPoTno;',
'',
'        -- 7. Global Aggregate Totals',
'        SELECT SUM(NVL(AMOUNT, 0)), SUM(NVL(FOOTERAMOUNT, 0)) ',
'        INTO tSumAmount, tSumFooter ',
'        FROM PurchaseOrderDetail WHERE TNO = tPoTno;',
'',
'        -- 8. Final Header Updates',
'        UPDATE PurchaseOrder ',
'        SET SumOfAmount = tSumAmount,',
'            SumOfFooterAmount = tSumFooter,',
'            PurchaseOrderAmount = tSumAmount + tSumFooter',
'        WHERE TNo = tPoTno;',
'',
'        UPDATE MaterialIn SET PurchaseOrderTNo = tPoTno WHERE TNO = :P69_TNO;',
'        UPDATE MaterialInDetail SET PurchaseOrderTNo = tPoTno WHERE TNO = :P69_TNO;',
'        ',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>30561172402625644
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(452813194371342882)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P69_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13828325171644898
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582889584055836467)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete records'
,p_static_id=>'delete-records'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from MATERIALINDETAIL where tno = :P69_TNO;',
'delete from MATERIALINACTIVITY where tno = :P69_TNO;',
'delete from MATERIALINEQUIPMENTDETAIL where tno = :P69_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(582697858588499279)
,p_internal_uid=>142503238804909943
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582886018796836431)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(579900566383851960)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'   ',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'             /*if nvl(:Quantity1,0) = 0 then',
'        raise_application_error(-20001, '' Please Enter Primary Quantity-''||:ITEMCODE) ;',
'    end if; */',
'            Insert Into MATERIALINDETAIL (                 ',
'                    TNO,',
'                    ITEMCODE,',
'                    ITEMSPECIFICATIONCODE,',
'                    PACKINGTYPECODE,',
'                    DESCRIPTION,',
'                    QUANTITY1,',
'                    QUANTITY2,',
'                    REMARK,',
'                    SNO,',
'                    ISWEIGHTTAKEN,',
'                    PURCHASEORDERTNO,',
'                    JOBORDERTNO,',
'                    PACKINGNOS,',
'                    ISEXCISABLE',
'',
'            )',
'            Values (',
'                :TNO,',
'                :ITEMCODE,',
'                :ITEMSPECIFICATIONCODE,',
'                :PACKINGTYPECODE,',
'                :DESCRIPTION,',
'                :QUANTITY1,',
'                :QUANTITY2,',
'                :REMARK,',
'                :SNO,',
'                :ISWEIGHTTAKEN,',
'                :PURCHASEORDERTNO,',
'                :JOBORDERTNO,',
'                :PACKINGNOS,',
'                :ISEXCISABLE',
'            );',
'        ',
'        when ''U'' then',
'        /* if nvl(:Quantity1,0) = 0 then',
'        raise_application_error(-20001, '' Please Enter Primary Quantity-''||:ITEMCODE) ;',
'    end if; */',
'    ',
'            update MATERIALINDETAIL Set',
'                  TNO=:TNO,',
'                    ITEMCODE=:ITEMCODE,',
'                    ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'                    PACKINGTYPECODE=:PACKINGTYPECODE,',
'                    DESCRIPTION=:DESCRIPTION,',
'                    QUANTITY1=:QUANTITY1,',
'                    QUANTITY2=:QUANTITY2,',
'                    REMARK=:REMARK,',
'                    SNO=:SNO,',
'                    ISWEIGHTTAKEN=:ISWEIGHTTAKEN,',
'                    PURCHASEORDERTNO=:PURCHASEORDERTNO,',
'                    JOBORDERTNO=:JOBORDERTNO,',
'                    PACKINGNOS=:PACKINGNOS,',
'                    ISEXCISABLE=:ISEXCISABLE',
'            WHERE TNO = :P69_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From MATERIALINDETAIL',
'            Where TNo = :P69_TNO',
'              and SNO = :P69_SNO',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>142499673545909907
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582889381400836465)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(582888056154836452)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'EquipmentDetail - Save Interactive Grid Data'
,p_static_id=>'equipmentdetail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>142503036149909941
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582710647139544174)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetOnTheTable'
,p_static_id=>'getonthetable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P69_MODULEFLOW := ''YES'';',
'   else',
'       :P69_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P69_ONTHETABLE := ''YES'' ;',
'   else',
'       :P69_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>142324301888617650
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582710388738543186)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'gettno'
,p_static_id=>'gettno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P69_TNO IS NULL then',
'        :P69_FORMSTATUS := ''NEWRECORD'';',
'        select globaltno.nextval into :P69_TNO from dual;',
'      else ',
'        :P69_FORMSTATUS := ''EDITRECORD'';',
'    end if;',
'',
'    ',
'',
'    exception when others then  ',
'        null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>142324043487616662
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582670895800415251)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(582619246559415227)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Material In'
,p_static_id=>'initialize-form-material-in'
,p_internal_uid=>142284550549488727
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582887154932836443)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(582886098843836432)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Personal Belonging - Save Interactive Grid Data'
,p_static_id=>'personal-belonging-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>142500809681909919
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582731803338617822)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_static_id=>'prepare-url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(2000);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>142345458087691298
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582671318957415251)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(582619246559415227)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Material In'
,p_static_id=>'process-form-material-in'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'N',
  'return_primary_keys_after_insert', 'Y',
  'table_name', 'MATERIALIN',
  'target_type', 'TABLE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>142284973706488727
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582731494450616753)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P69_TNO, :P69_MATERIALINNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(582698702990499279)
,p_internal_uid=>142345149199690229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(452814155373351912)
,p_process_sequence=>140
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P69_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P69_ALLOWEDBACK,:P69_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'else',
'     :P69_ALLOWEDBACK       := :P69_MATERIALINDATE ; ',
'    :P69_ALLOWEDFORWARD    := :P69_MATERIALINDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13829286173653928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(582889518655836466)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Doc No'
,p_static_id=>'set-doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    --tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tModuleCode varchar2(30) := ''MATERIALIN'';',
'    tmp         number ;',
'begin',
'',
'    if :P69_VALID is not null then  ',
'        raise_application_error(-20000,:P69_VALID);',
'    end if;',
'',
'     if :P69_TNO is null then',
'        Select GlobalTno.NextVal into :P69_TNO From Dual;',
'     end if;',
'    ----',
'    if :P69_MATERIALINNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P69_LOCATIONCODE,',
'					:P69_DOCTYPECODE,',
'					NULL,',
'					TO_DATE(:P69_MATERIALINDATE, ''DD-MM-RRRR'')',
'				);',
'        :P69_MATERIALINNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P69_LOCATIONCODE,',
'                    :P69_DOCTYPECODE,',
'                    NULL,',
'                    TO_DATE(:P69_MATERIALINDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>142503173404909942
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(591701171873086662)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Get Items'
,p_static_id=>'validate-get-items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20003,:P118_DOCTYPECODE);',
'declare ',
'    l_count number;',
'',
'begin',
'',
'if :P69_PURCHASEORDERTNO is not null and :P69_LOADINGADVICETNO is null then ',
'',
'',
'    for vloop in (',
'    select ',
'    		',
'    			b.itemcode',
'    from ',
'    			MATERIALIN a, ',
'    			MATERIALINDETAIL b,',
'    			item e,',
'    			itemspecification ee',
'    where',
'    			a.tno = b.tno',
'    			and b.itemcode = e.itemcode',
'    			and a.tno = :P69_TNO',
'    		',
'    		',
'    ) loop',
'        Select ',
'            Count(*) into l_count',
'            from purchaseorderdetail A ',
'            Where A.TNO = :P69_PURCHASEORDERTNO',
'                  AND A.ITEMCODE = vloop.itemcode;',
'',
'        if l_count <= 0 Then',
'           raise_application_error(-20000,''ITEM Details not Matching with Selected Purchase Order No.'');',
'        end if;',
'    end loop;',
'',
'elsif :P69_LOADINGADVICETNO is not null then',
'',
'    for vloop in (',
'    select ',
'    		',
'    			b.itemcode',
'    from ',
'    			materialin a, ',
'    			materialindetail b,',
'    			item e,',
'    			itemspecification ee',
'    where',
'    			a.tno = b.tno',
'    			and b.itemcode = e.itemcode',
'    			and a.tno = :P69_TNO',
'    		',
'    		',
'    ) loop',
'        Select ',
'            Count(*) into l_count',
'            from loadingadvicedetail A ',
'            Where A.TNO = :P69_LOADINGADVICETNO',
'                  AND A.ITEMCODE = vloop.itemcode;',
'',
'        if l_count <= 0 Then',
'           raise_application_error(-20000,''ITEM Details not Matching with Selected Loading Advice No.'');',
'        end if;',
'    end loop;',
'',
'end if;',
'',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(582698702990499279)
,p_internal_uid=>151314826622160138
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(298322710886944744)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate quantity'
,p_static_id=>'validate-quantity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    sumqty number;',
'begin',
'    select sum(quantity1) into sumqty from MATERIALINDETAIL where tno = :P69_TNO;',
'    if sumqty<0 then ',
'        raise_application_error(-20000,''Check Quantity.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>80822026073726010
);
wwv_flow_imp.component_end;
end;
/
