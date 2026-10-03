whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
declare
 client_js varchar2(32767):='(function () {
  ''use strict'';
  if (window.IMARTMasterKpis) return;
  var currentRequest = null;
  function section(page) { return document.getElementById(''mr-register-kpis-'' + page); }
  function reportId(root) {
    var id = root.dataset.reportRegion;
    if (id && document.getElementById(id) && apex.region(id)) return id;
    var reports = Array.from(document.querySelectorAll(''main .js-apex-region'')).filter(function (el) {
      return el.querySelector(''.a-IRR,.a-IG'') && apex.region(el.id);
    });
    var named = reports.filter(function (el) { return el.getAttribute(''aria-label'') === root.dataset.reportLabel; });
    return named.length === 1 ? named[0].id : reports.length === 1 ? reports[0].id : null;
  }
  function load(page) {
    var root = section(page);
    if (!root) return;
    if (currentRequest) currentRequest.abort();
    var content = root.querySelector(''[data-kpi-content]'');
    if (!content.querySelector(''button'')) content.textContent = ''Loading KPIs…'';
    root.setAttribute(''aria-busy'', ''true'');
    currentRequest = apex.server.process(''IMART_REGISTER_KPIS'', {x01: String(page)}, {
      dataType: ''json'', timeout: 15000,
      success: function (data) {
        root.dataset.reportRegion = reportId(root) || data.region;
        root.querySelector(''[data-kpi-scope]'').textContent = data.scope;
        content.replaceChildren();
        var total = Number(String(data.cards[0].value).replace(/[^0-9.-]/g, ''''));
        data.cards.forEach(function (card) {
          if (card.mode === ''STATUS'' && (card.status == null || /^NO[ _-]?STATUS$/i.test(String(card.label).trim()))) return;
          var el = document.createElement(''button''), label = document.createElement(''span''),
            value = document.createElement(''strong''), share = document.createElement(''span''),
            top = document.createElement(''span''), icon = document.createElement(''span''),
            bottom = document.createElement(''span''), action = document.createElement(''span''), arrow = document.createElement(''span''),
            body = document.createElement(''span''), details = document.createElement(''span''), wave = document.createElement(''span'');
          var status = String(card.label).toUpperCase(), tone = ''info'', iconName = ''fa-circle-o'';
          if (card.mode === ''ALL'') { tone = ''total''; iconName = ''fa-th-large''; }
          else if (card.mode === ''RECENT'') { tone = ''info''; iconName = ''fa-calendar''; }
          else if (card.mode === ''MINE'') { tone = ''total''; iconName = ''fa-user''; }
          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT/.test(status)) { tone = ''danger''; iconName = ''fa-ban''; }
          else if (/^ACTIVE$|CLOSED|COMPLETE|APPROV|AUTHORI/.test(status)) { tone = ''success''; iconName = ''fa-check-circle-o''; }
          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = ''warning''; iconName = ''fa-clock-o''; }
          else if (/NO STATUS/.test(status)) { tone = ''neutral''; iconName = ''fa-minus-circle''; }
          el.className = ''mr-inline-kpi''; el.dataset.tone = tone;
          label.className = ''mr-kpi-status''; label.textContent = card.mode === ''ALL'' ? ''Total records'' : card.label.replace(/[_-]/g, '' '').toLowerCase().replace(/\b\w/g, function (s) { return s.toUpperCase(); });
          top.className = ''mr-kpi-card-top''; icon.className = ''mr-kpi-card-icon fa '' + (card.mode === ''ALL'' ? ''fa-file-text-o'' : iconName); icon.setAttribute(''aria-hidden'', ''true'');
          el.type = ''button''; el.setAttribute(''aria-pressed'', String(card.selected));
          el.setAttribute(''aria-label'', card.label + '': '' + card.value);
          value.textContent = card.value; share.className = ''mr-kpi-share'';
          var count = Number(String(card.value).replace(/[^0-9.-]/g, ''''));
          share.textContent = card.note || (card.mode === ''ALL'' ? ''All records in this scope'' : (total ? (count / total * 100).toFixed(1) : ''0'') + ''% of total records'');
          bottom.className = ''mr-kpi-card-bottom''; action.innerHTML = ''<span class="mr-kpi-unselected">View records</span><span class="mr-kpi-selected">Showing records</span>'';
          arrow.className = ''fa fa-arrow-right''; arrow.setAttribute(''aria-hidden'', ''true''); bottom.append(action, arrow);
          el.addEventListener(''click'', function () {
            var buttons = content.querySelectorAll(''button'');
            buttons.forEach(function (b) { b.disabled = true; });
            apex.server.process(''IMART_KPI_STATUS_FILTER'', {x01: String(page), x02: card.mode, x03: card.status}, {
              dataType: ''json'', timeout: 15000,
              success: function () {
                buttons.forEach(function (b) { b.setAttribute(''aria-pressed'', String(b === el)); });
                var id = reportId(root), report = id && apex.region(id);
                if (id) root.dataset.reportRegion = id;
                if (report) report.refresh();
                else apex.message.alert(''The register could not be refreshed. Please reload this page.'');
              },
              error: function () { apex.message.alert(''KPI filter could not be applied. Please retry.''); },
              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }
            });
          });
          details.className = ''mr-kpi-card-details''; details.append(label, value, share);
          body.className = ''mr-kpi-card-body''; body.append(icon, details);
          wave.className = ''mr-kpi-wave''; wave.setAttribute(''aria-hidden'', ''true'');
          wave.innerHTML = ''<svg viewBox="0 0 120 44" fill="none" focusable="false"><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13" stroke="currentColor" stroke-width="1.2"/><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13 V44 H1 Z" fill="currentColor" opacity=".06"/></svg>'';
          body.append(wave); el.append(body, bottom); content.append(el);
        });
      },
      error: function (request, status) {
        if (status !== ''abort'' && !content.querySelector(''.mr-inline-kpi'')) {
          content.textContent = ''KPIs could not be loaded. '';
          var retry = document.createElement(''button'');
          retry.type = ''button''; retry.textContent = ''Retry'';
          retry.addEventListener(''click'', function () { load(page); });
          content.append(retry);
        }
      },
      complete: function () { currentRequest = null; root.removeAttribute(''aria-busy''); }
    });
  }
  function listen() {
    var initial = document.querySelector(''.mr-register-kpis'');
    if (initial) load(Number(initial.id.replace(''mr-register-kpis-'', '''')));
    apex.jQuery(document).on(''apexafterrefresh.imartMasterKpis'', ''.js-apex-region'', function () {
    var root = document.querySelector(''.mr-register-kpis'');
    if (!root) return;
    var page = Number(root.id.replace(''mr-register-kpis-'', ''''));
    if (root.dataset.reportRegion === this.id) load(page);
  }); }
  window.IMARTMasterKpis = {reload: load};
  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', listen, {once: true});
  else listen();
})();
';
 css varchar2(32767):='.mr-register-kpis[hidden]{display:none!important}
button[aria-controls^="mr-register-kpis-"]{display:inline-flex;align-items:center;justify-content:center;gap:7px;margin-right:4px;padding:8px 11px!important;min-height:0;border:1px solid #c5bfee!important;border-radius:9px!important;background:linear-gradient(135deg,#fff,#f5f3ff)!important;color:#6255d7!important;font-weight:600!important;font-size:13px!important;box-shadow:0 2px 5px #5846c80c!important}
button[aria-controls^="mr-register-kpis-"]::before{content:"";display:block;flex:none;width:15px;height:15px;background:linear-gradient(currentColor,currentColor) left bottom/3px 7px no-repeat,linear-gradient(currentColor,currentColor) center bottom/3px 13px no-repeat,linear-gradient(currentColor,currentColor) right bottom/3px 10px no-repeat}
button[aria-controls^="mr-register-kpis-"]:hover{border-color:#9687e7!important;background:#eeebff!important}
button[aria-controls^="mr-register-kpis-"][aria-expanded="true"]{border-color:#a89de6!important;background:#f2efff!important;color:#5846c8!important}
button[aria-controls^="mr-register-kpis-"]:focus-visible{outline:2px solid #6658d7;outline-offset:3px}
.mr-register-kpis{margin:0 0 18px;padding:22px;border:1px solid #e0e5f2;border-radius:18px;background:linear-gradient(120deg,#fff 65%,#faf9ff);box-shadow:0 4px 18px #24336205}
.mr-register-kpis header{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;margin-bottom:20px}
.mr-register-kpis .mr-kpi-heading{display:flex;align-items:center;gap:13px;min-width:0}
.mr-register-kpis .mr-kpi-heading-icon{display:grid;place-items:center;width:44px;height:44px;flex:none;border-radius:13px;background:#eeecff;color:#6255d7;font-size:20px}
.mr-register-kpis .mr-kpi-eyebrow{font-size:10px;font-weight:700;letter-spacing:1.4px;color:#847baf;display:block;margin-bottom:5px}
.mr-register-kpis h2{font-size:19px;font-weight:700;line-height:1.3;color:#202a43;margin:0}
.mr-register-kpis .mr-kpi-subtitle{font-size:12px;color:#79849b;margin:5px 0 0}
.mr-register-kpis .mr-kpi-close{display:flex;align-items:center;gap:7px;flex:none;border:1px solid #e2e5f0;border-radius:9px;padding:8px 12px;background:#fff;color:#657089;font:inherit;font-size:12px;cursor:pointer}
.mr-register-kpis .mr-kpi-close:hover{color:#5d50d2;border-color:#bcb5ee;background:#faf9ff}
.mr-register-kpis .mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:14px}
.mr-register-kpis .mr-inline-kpi{--kpi-accent:#6658d7;--kpi-tint:#efedff;--kpi-line:#e3defb;position:relative;overflow:hidden;display:flex;flex-direction:column;gap:0;min-width:0;width:100%;padding:17px 18px 14px;border:1px solid var(--kpi-line);border-radius:13px;background:linear-gradient(125deg,#fff,var(--kpi-tint));font-family:inherit;text-align:left;cursor:pointer;color:#202a43;box-shadow:0 2px 5px #24336203}
.mr-register-kpis .mr-inline-kpi[data-tone="success"]{--kpi-accent:#198a68;--kpi-tint:#edf9f3;--kpi-line:#d8eee4}
.mr-register-kpis .mr-inline-kpi[data-tone="warning"]{--kpi-accent:#b87b19;--kpi-tint:#fff8e9;--kpi-line:#f0e4c7}
.mr-register-kpis .mr-inline-kpi[data-tone="danger"]{--kpi-accent:#c55364;--kpi-tint:#fff0f2;--kpi-line:#f2dce2}
.mr-register-kpis .mr-inline-kpi[data-tone="neutral"]{--kpi-accent:#738099;--kpi-tint:#f2f5fa;--kpi-line:#e0e5ee}
.mr-register-kpis .mr-inline-kpi[data-tone="info"]{--kpi-accent:#397db7;--kpi-tint:#edf6ff;--kpi-line:#dceafa}
.mr-register-kpis .mr-inline-kpi:hover{border-color:var(--kpi-accent);box-shadow:0 4px 14px #2433620a}
.mr-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:var(--kpi-accent);box-shadow:inset 0 0 0 1px var(--kpi-accent),0 4px 14px #24336208}
.mr-register-kpis .mr-inline-kpi:focus-visible,.mr-register-kpis .mr-kpi-close:focus-visible{outline:2px solid #6658d7;outline-offset:3px}
.mr-register-kpis .mr-inline-kpi:disabled{cursor:progress;opacity:.75}
.mr-register-kpis .mr-kpi-card-top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:10px}
.mr-register-kpis .mr-kpi-status{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;color:#606d85}
.mr-register-kpis .mr-kpi-status::before{content:"";width:6px;height:6px;border-radius:50%;background:var(--kpi-accent);flex:none}
.mr-register-kpis .mr-kpi-card-icon{display:grid;place-items:center;flex:none;width:31px;height:31px;border:1px solid var(--kpi-line);border-radius:9px;background:#ffffffb3;color:var(--kpi-accent);font-size:16px}
.mr-register-kpis .mr-inline-kpi strong{font-size:32px;line-height:1.15;font-weight:700;letter-spacing:-.8px;color:#202a43;margin-bottom:5px}
.mr-register-kpis .mr-kpi-share{font-size:11px;color:#8790a3;margin-bottom:13px}
.mr-register-kpis .mr-kpi-card-bottom{display:flex;justify-content:space-between;align-items:center;border-top:1px solid var(--kpi-line);padding-top:10px;gap:10px;color:var(--kpi-accent);font-size:11px;font-weight:600}
.mr-register-kpis .mr-kpi-selected{display:none}
.mr-register-kpis [aria-pressed="true"] .mr-kpi-selected{display:inline}
.mr-register-kpis [aria-pressed="true"] .mr-kpi-unselected{display:none}
.mr-register-kpis .mr-kpi-method{margin-top:13px;color:#8790a3;font-size:11px}
.mr-register-kpis .mr-kpi-method summary{cursor:pointer;list-style:none;display:inline-flex;align-items:center;gap:6px}
.mr-register-kpis .mr-kpi-method summary::-webkit-details-marker{display:none}
.mr-register-kpis .mr-kpi-method p{font-size:11px;line-height:1.6;color:#738099;margin:8px 0 0;max-width:1000px}
.mr-register-kpis .mr-kpi-card-body{display:flex;align-items:flex-start;gap:17px;position:relative;padding:3px 0 0;min-height:100px}
.mr-register-kpis .mr-kpi-card-details{display:flex;flex-direction:column;min-width:0;position:relative;z-index:1}
.mr-register-kpis .mr-kpi-card-icon{width:45px;height:45px;border:0;border-radius:16px;background:var(--kpi-tint);font-size:24px}
.mr-register-kpis .mr-kpi-status{font-size:13px;margin:5px 0 8px}
.mr-register-kpis .mr-kpi-status::before{display:none}
.mr-register-kpis .mr-kpi-share{margin-bottom:13px}
.mr-register-kpis .mr-kpi-wave{position:absolute;right:0;bottom:18px;width:105px;height:39px;color:var(--kpi-accent);opacity:.65;pointer-events:none}
.mr-register-kpis .mr-kpi-wave svg{display:block;width:100%;height:100%}
@media(max-width:1000px){.mr-register-kpis .mr-kpi-wave{width:75px;opacity:.35}}
@media(max-width:650px){.mr-register-kpis{padding:16px}.mr-register-kpis h2{font-size:16px}.mr-register-kpis .mr-kpi-heading-icon{display:none}.mr-register-kpis .mr-kpi-grid{gap:10px}.mr-register-kpis .mr-inline-kpi{padding:13px}.mr-register-kpis .mr-inline-kpi strong{font-size:27px}.mr-register-kpis .mr-kpi-card-top{flex-wrap:wrap;gap:6px}}
@media(max-width:380px){.mr-register-kpis .mr-kpi-grid{grid-template-columns:1fr}}
.mr-register-kpis{padding:12px;margin-bottom:12px}
.mr-register-kpis header{gap:10px;margin-bottom:10px}
.mr-register-kpis .mr-kpi-heading{gap:9px}
.mr-register-kpis .mr-kpi-heading-icon{width:32px;height:32px;border-radius:10px;font-size:17px}
.mr-register-kpis .mr-kpi-eyebrow{margin-bottom:2px;letter-spacing:1px}
.mr-register-kpis h2{font-size:16px}
.mr-register-kpis .mr-kpi-subtitle{margin-top:3px;font-size:11px}
.mr-register-kpis .mr-kpi-grid{gap:9px}
.mr-register-kpis .mr-inline-kpi{padding:7px 10px 6px;border-radius:10px}
.mr-register-kpis .mr-kpi-card-body{min-height:0;gap:8px;padding:0}
.mr-register-kpis .mr-kpi-card-icon{width:27px;height:27px;border-radius:9px;font-size:17px}
.mr-register-kpis .mr-kpi-status{font-size:11px;line-height:1.3;margin:0 0 1px}
.mr-register-kpis .mr-inline-kpi strong{font-size:22px;line-height:1.05;margin:0;letter-spacing:-.4px}
.mr-register-kpis .mr-kpi-share{font-size:10px;line-height:1.3;margin:1px 0 2px}
.mr-register-kpis .mr-kpi-card-bottom{padding-top:4px;gap:6px;font-size:10px;line-height:1.3}
.mr-register-kpis .mr-kpi-card-bottom>.fa{font-size:11px;line-height:13px}
.mr-register-kpis .mr-kpi-wave{width:48px;height:18px;bottom:5px;opacity:.3}
.mr-register-kpis .mr-kpi-method{margin-top:8px}
.mr-register-kpis .mr-kpi-grid{min-height:87px}
';
 src clob;
begin
 for r in (select r.page_id,nvl(p.static_id,'R'||p.id) report_static,p.plug_name report_label from imart_mr_register r join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.id=r.region_id) loop
  src:='begin htp.p(q''^<style>'||css||'</style><section id="mr-register-kpis-'||r.page_id||'" class="mr-register-kpis" data-report-region="'||apex_escape.html_attribute(r.report_static)||'" data-report-label="'||apex_escape.html_attribute(r.report_label)||'" aria-label="Master KPIs"><div class="mr-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary><span class="fa fa-info-circle" aria-hidden="true"></span> How counts work</summary><p data-kpi-scope></p></details></section><script>'||client_js||'</script>^'');end;';
  update apex_260100.wwv_flow_page_plugs set plug_source=src where flow_id=105 and static_id='mr-kpi-shell-'||r.page_id;
 end loop;
 dbms_output.put_line('KPI panels styled; business sources and processes unchanged.');
end;
/
commit;
exit
