whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
declare js clob:=q'~(function () {
  'use strict';
  if (window.IMARTReportKpis) return;
  var requests = {};
  function report(root) {
    var id = root.dataset.reportRegion;
    if (id && document.getElementById(id) && apex.region(id)) return apex.region(id);
    var matches = Array.from(document.querySelectorAll('main .js-apex-region')).filter(function (el) {
      return el.getAttribute('aria-label') === root.dataset.reportLabel && el.querySelector('.a-IRR,.a-IG,.t-Report') && apex.region(el.id);
    });
    if (matches.length === 1) { root.dataset.reportRegion = matches[0].id; return apex.region(matches[0].id); }
    return null;
  }
  function pageValues(root) {
    var names = [], values = [];
    (root.dataset.pageItems || '').split(',').forEach(function (selector) {
      var name = selector.replace(/^#/, ''), item, node, value;
      if (!name) return;
      node = document.getElementById(name + '_input') || document.getElementById(name) || document.querySelector('[name="' + name + '"]');
      if (!node) return;
      item = apex.item(name);
      value = 'value' in node ? node.value : null;
      if ((value === null || value === undefined) && item) {
        try { value = item.getValue(); } catch (ignore) { value = null; }
      }
      if (Array.isArray(value)) value = value.join(':');
      names.push(name);
      values.push(value === null || value === undefined || value === '' ? '__IMART_NULL__' : String(value));
    });
    return {names: names, values: values};
  }
  function load(root) {
    var key = root.dataset.kpiRegion, content = root.querySelector('[data-kpi-content]'), payload = {x01: key}, filters = pageValues(root);
    if (filters.names.length) { payload.f01 = filters.names; payload.f02 = filters.values; }
    if (requests[key]) requests[key].abort();
    root.setAttribute('aria-busy', 'true');
    if (!content.querySelector('.mr-inline-kpi')) content.textContent = 'Loading KPIs…';
    requests[key] = apex.server.process('IMART_REPORT_KPIS', payload, {
      dataType: 'json', timeout: 15000,
      success: function (data) {
        root.querySelector('[data-kpi-scope]').textContent = data.scope;
        content.replaceChildren();
        data.cards.forEach(function (card) {
          if (card.mode === 'STATUS' && (!card.status || /^NO[ _-]?STATUS$/i.test(card.label))) return;
          var el = document.createElement('button'), body = document.createElement('span'), icon = document.createElement('span'),
            details = document.createElement('span'), label = document.createElement('span'), value = document.createElement('strong'),
            note = document.createElement('span'), bottom = document.createElement('span'), action = document.createElement('span'), arrow = document.createElement('span');
          var tone = 'info', fa = 'fa-circle-o', status = String(card.label).toUpperCase();
          if (card.mode === 'ALL') { tone = 'total'; fa = 'fa-file-text-o'; }
          else if (card.mode === 'MINE') { tone = 'total'; fa = 'fa-user'; }
          else if (card.mode === 'RECENT') fa = 'fa-calendar';
          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT|OVERDUE|LOSS|^NO$/.test(status)) { tone = 'danger'; fa = 'fa-ban'; }
          else if (/ACTIVE|CLOSED|COMPLETE|AUTHORI|^YES$|WIN/.test(status)) { tone = 'success'; fa = 'fa-check-circle-o'; }
          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = 'warning'; fa = 'fa-clock-o'; }
          el.type = 'button'; el.className = 'mr-inline-kpi'; el.dataset.tone = tone;
          el.setAttribute('aria-pressed', String(card.selected)); el.setAttribute('aria-label', card.label + ': ' + card.value);
          body.className = 'mr-kpi-card-body'; icon.className = 'mr-kpi-card-icon fa ' + fa; icon.setAttribute('aria-hidden', 'true');
          details.className = 'mr-kpi-card-details'; label.className = 'mr-kpi-status'; label.textContent = card.label;
          value.textContent = card.value; note.className = 'mr-kpi-share'; note.textContent = card.note;
          details.append(label, value, note); body.append(icon, details);
          bottom.className = 'mr-kpi-card-bottom'; action.textContent = card.selected ? 'Showing records' : 'View records';
          arrow.className = 'fa fa-arrow-right'; arrow.setAttribute('aria-hidden', 'true'); bottom.append(action, arrow); el.append(body, bottom);
          el.addEventListener('click', function () {
            var api = report(root);
            if (!api) { apex.message.alert('Report region unavailable. Please reload this page.'); return; }
            var buttons = Array.from(content.querySelectorAll('button'));
            buttons.forEach(function (b) { b.disabled = true; });
            apex.server.process('IMART_REPORT_KPI_FILTER', {x01: key, x02: card.mode, x03: card.status}, {
              dataType: 'json', timeout: 15000,
              success: function () {
                buttons.forEach(function (b) { b.setAttribute('aria-pressed', String(b === el)); b.querySelector('.mr-kpi-card-bottom span').textContent = b === el ? 'Showing records' : 'View records'; });
                api.refresh();
              },
              error: function () { apex.message.alert('KPI filter could not be applied. Please retry.'); },
              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }
            });
          });
          content.append(el);
        });
      },
      error: function (request, status) {
        if (status === 'abort') return;
        if (!content.querySelector('.mr-inline-kpi')) {
          content.textContent = 'KPIs unavailable. ';
          var retry = document.createElement('button'); retry.type = 'button'; retry.textContent = 'Retry';
          retry.addEventListener('click', function () { load(root); }); content.append(retry);
        }
      },
      complete: function () { delete requests[key]; root.removeAttribute('aria-busy'); }
    });
  }
  function listen() {
    var roots = Array.from(document.querySelectorAll('.coverage-register-kpis'));
    roots.forEach(load);
    apex.jQuery(document).on('apexafterrefresh.imartReportCoverage', '.js-apex-region', function () {
      var region = this.id;
      roots.forEach(function (root) {
        if (root.dataset.reportRegion !== region) return;
        var key = root.dataset.kpiRegion;
        load(root);
      });
    });
  }
  window.IMARTReportKpis = {reload: function () { document.querySelectorAll('.coverage-register-kpis').forEach(load); }};
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', listen, {once: true}); else listen();
})();
~';css clob:=q'~.coverage-register-kpis[hidden]{display:none!important}
.coverage-register-kpis{margin:0 0 18px;padding:22px;border:1px solid #e0e5f2;border-radius:18px;background:linear-gradient(120deg,#fff 65%,#faf9ff);box-shadow:0 4px 18px #24336205}
.coverage-register-kpis header{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;margin-bottom:20px}
.coverage-register-kpis .mr-kpi-heading{display:flex;align-items:center;gap:13px;min-width:0}
.coverage-register-kpis .mr-kpi-heading-icon{display:grid;place-items:center;width:44px;height:44px;flex:none;border-radius:13px;background:#eeecff;color:#6255d7;font-size:20px}
.coverage-register-kpis .mr-kpi-eyebrow{font-size:10px;font-weight:700;letter-spacing:1.4px;color:#847baf;display:block;margin-bottom:5px}
.coverage-register-kpis h2{font-size:19px;font-weight:700;line-height:1.3;color:#202a43;margin:0}
.coverage-register-kpis .mr-kpi-subtitle{font-size:12px;color:#79849b;margin:5px 0 0}
.coverage-register-kpis .mr-kpi-close{display:flex;align-items:center;gap:7px;flex:none;border:1px solid #e2e5f0;border-radius:9px;padding:8px 12px;background:#fff;color:#657089;font:inherit;font-size:12px;cursor:pointer}
.coverage-register-kpis .mr-kpi-close:hover{color:#5d50d2;border-color:#bcb5ee;background:#faf9ff}
.coverage-register-kpis .mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:14px}
.coverage-register-kpis .mr-inline-kpi{--kpi-accent:#6658d7;--kpi-tint:#efedff;--kpi-line:#e3defb;position:relative;overflow:hidden;display:flex;flex-direction:column;gap:0;min-width:0;width:100%;padding:17px 18px 14px;border:1px solid var(--kpi-line);border-radius:13px;background:linear-gradient(125deg,#fff,var(--kpi-tint));font-family:inherit;text-align:left;cursor:pointer;color:#202a43;box-shadow:0 2px 5px #24336203}
.coverage-register-kpis .mr-inline-kpi[data-tone="success"]{--kpi-accent:#198a68;--kpi-tint:#edf9f3;--kpi-line:#d8eee4}
.coverage-register-kpis .mr-inline-kpi[data-tone="warning"]{--kpi-accent:#b87b19;--kpi-tint:#fff8e9;--kpi-line:#f0e4c7}
.coverage-register-kpis .mr-inline-kpi[data-tone="danger"]{--kpi-accent:#c55364;--kpi-tint:#fff0f2;--kpi-line:#f2dce2}
.coverage-register-kpis .mr-inline-kpi[data-tone="neutral"]{--kpi-accent:#738099;--kpi-tint:#f2f5fa;--kpi-line:#e0e5ee}
.coverage-register-kpis .mr-inline-kpi[data-tone="info"]{--kpi-accent:#397db7;--kpi-tint:#edf6ff;--kpi-line:#dceafa}
.coverage-register-kpis .mr-inline-kpi:hover{border-color:var(--kpi-accent);box-shadow:0 4px 14px #2433620a}
.coverage-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:var(--kpi-accent);box-shadow:inset 0 0 0 1px var(--kpi-accent),0 4px 14px #24336208}
.coverage-register-kpis .mr-inline-kpi:focus-visible,.coverage-register-kpis .mr-kpi-close:focus-visible{outline:2px solid #6658d7;outline-offset:3px}
.coverage-register-kpis .mr-inline-kpi:disabled{cursor:progress;opacity:.75}
.coverage-register-kpis .mr-kpi-card-top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:10px}
.coverage-register-kpis .mr-kpi-status{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;color:#606d85}
.coverage-register-kpis .mr-kpi-status::before{content:"";width:6px;height:6px;border-radius:50%;background:var(--kpi-accent);flex:none}
.coverage-register-kpis .mr-kpi-card-icon{display:grid;place-items:center;flex:none;width:31px;height:31px;border:1px solid var(--kpi-line);border-radius:9px;background:#ffffffb3;color:var(--kpi-accent);font-size:16px}
.coverage-register-kpis .mr-inline-kpi strong{font-size:32px;line-height:1.15;font-weight:700;letter-spacing:-.8px;color:#202a43;margin-bottom:5px}
.coverage-register-kpis .mr-kpi-share{font-size:11px;color:#8790a3;margin-bottom:13px}
.coverage-register-kpis .mr-kpi-card-bottom{display:flex;justify-content:space-between;align-items:center;border-top:1px solid var(--kpi-line);padding-top:10px;gap:10px;color:var(--kpi-accent);font-size:11px;font-weight:600}
.coverage-register-kpis .mr-kpi-selected{display:none}
.coverage-register-kpis [aria-pressed="true"] .mr-kpi-selected{display:inline}
.coverage-register-kpis [aria-pressed="true"] .mr-kpi-unselected{display:none}
.coverage-register-kpis .mr-kpi-method{margin-top:13px;color:#8790a3;font-size:11px}
.coverage-register-kpis .mr-kpi-method summary{cursor:pointer;list-style:none;display:inline-flex;align-items:center;gap:6px}
.coverage-register-kpis .mr-kpi-method summary::-webkit-details-marker{display:none}
.coverage-register-kpis .mr-kpi-method p{font-size:11px;line-height:1.6;color:#738099;margin:8px 0 0;max-width:1000px}
.coverage-register-kpis .mr-kpi-card-body{display:flex;align-items:flex-start;gap:17px;position:relative;padding:3px 0 0;min-height:100px}
.coverage-register-kpis .mr-kpi-card-details{display:flex;flex-direction:column;min-width:0;position:relative;z-index:1}
.coverage-register-kpis .mr-kpi-card-icon{width:45px;height:45px;border:0;border-radius:16px;background:var(--kpi-tint);font-size:24px}
.coverage-register-kpis .mr-kpi-status{font-size:13px;margin:5px 0 8px}
.coverage-register-kpis .mr-kpi-status::before{display:none}
.coverage-register-kpis .mr-kpi-share{margin-bottom:13px}
.coverage-register-kpis .mr-kpi-wave{position:absolute;right:0;bottom:18px;width:105px;height:39px;color:var(--kpi-accent);opacity:.65;pointer-events:none}
.coverage-register-kpis .mr-kpi-wave svg{display:block;width:100%;height:100%}
@media(max-width:1000px){.coverage-register-kpis .mr-kpi-wave{width:75px;opacity:.35}}
@media(max-width:650px){.coverage-register-kpis{padding:16px}.coverage-register-kpis h2{font-size:16px}.coverage-register-kpis .mr-kpi-heading-icon{display:none}.coverage-register-kpis .mr-kpi-grid{gap:10px}.coverage-register-kpis .mr-inline-kpi{padding:13px}.coverage-register-kpis .mr-inline-kpi strong{font-size:27px}.coverage-register-kpis .mr-kpi-card-top{flex-wrap:wrap;gap:6px}}
@media(max-width:380px){.coverage-register-kpis .mr-kpi-grid{grid-template-columns:1fr}}
.coverage-register-kpis{padding:12px;margin-bottom:12px}
.coverage-register-kpis header{gap:10px;margin-bottom:10px}
.coverage-register-kpis .mr-kpi-heading{gap:9px}
.coverage-register-kpis .mr-kpi-heading-icon{width:32px;height:32px;border-radius:10px;font-size:17px}
.coverage-register-kpis .mr-kpi-eyebrow{margin-bottom:2px;letter-spacing:1px}
.coverage-register-kpis h2{font-size:16px}
.coverage-register-kpis .mr-kpi-subtitle{margin-top:3px;font-size:11px}
.coverage-register-kpis .mr-kpi-grid{gap:9px}
.coverage-register-kpis .mr-inline-kpi{padding:7px 10px 6px;border-radius:10px}
.coverage-register-kpis .mr-kpi-card-body{min-height:0;gap:8px;padding:0}
.coverage-register-kpis .mr-kpi-card-icon{width:27px;height:27px;border-radius:9px;font-size:17px}
.coverage-register-kpis .mr-kpi-status{font-size:11px;line-height:1.3;margin:0 0 1px}
.coverage-register-kpis .mr-inline-kpi strong{font-size:22px;line-height:1.05;margin:0;letter-spacing:-.4px}
.coverage-register-kpis .mr-kpi-share{font-size:10px;line-height:1.3;margin:1px 0 2px}
.coverage-register-kpis .mr-kpi-card-bottom{padding-top:4px;gap:6px;font-size:10px;line-height:1.3}
.coverage-register-kpis .mr-kpi-card-bottom>.fa{font-size:11px;line-height:13px}
.coverage-register-kpis .mr-kpi-wave{width:48px;height:18px;bottom:5px;opacity:.3}
.coverage-register-kpis .mr-kpi-method{margin-top:8px}
.coverage-register-kpis .mr-kpi-grid{min-height:0}

.coverage-register-kpis .mr-kpi-grid{grid-template-columns:repeat(auto-fit,minmax(180px,280px));min-height:0}.coverage-register-kpis .mr-kpi-card-details{min-width:0}.coverage-register-kpis .mr-kpi-share{overflow-wrap:anywhere}~';payload_process clob:=q'~declare
 l_name varchar2(128);
 l_value varchar2(32767);
 l_allowed number;
begin
 for i in 1..apex_application.g_f01.count loop
  l_name:=upper(apex_application.g_f01(i));
  l_value:=case when apex_application.g_f02.exists(i) and apex_application.g_f02(i)<>'__IMART_NULL__' then apex_application.g_f02(i) end;
  if regexp_like(l_name,'^P[0-9]+_[A-Z0-9_]+$') then
   select count(*) into l_allowed
     from apex_260100.wwv_flow_step_items
    where flow_id=105
      and flow_step_id=to_number(v('APP_PAGE_ID'))
      and upper(name)=l_name;
   if l_allowed=1 then apex_util.set_session_state(l_name,l_value);end if;
  end if;
 end loop;
 imart_report_kpis.payload(to_number(apex_application.g_x01));
end;~';src clob;rid number;seq number:=0;n number:=0;found number;shell number;items varchar2(32767);seen varchar2(32767);bind_name varchar2(128);
begin
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 select count(*) into found from apex_260100.wwv_flow_processing where flow_id=105 and process_name='IMART_REPORT_KPIS';
 if found=0 then wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100300900001),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_REPORT_KPIS',p_static_id=>'imart-report-kpis',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>payload_process);
 else update apex_260100.wwv_flow_processing set process_sql_clob=payload_process where flow_id=105 and process_name='IMART_REPORT_KPIS';end if;
 select count(*) into found from apex_260100.wwv_flow_processing where flow_id=105 and process_name='IMART_REPORT_KPI_FILTER';
 if found=0 then wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100300900002),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_REPORT_KPI_FILTER',p_static_id=>'imart-report-kpi-filter',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_report_kpis.apply_filter(to_number(apex_application.g_x01),apex_application.g_x02,apex_application.g_x03);end;');end if;
 for r in(select c.*,p.plug_display_sequence,p.plug_display_point,p.plug_required_role,p.plug_display_condition_type,p.plug_display_when_condition,p.plug_display_when_cond2,p.function_body_language from imart_rkpi_config c join apex_260100.wwv_flow_page_plugs p on p.id=c.region_id and p.flow_id=105 where c.state='READY' order by c.page_id,c.region_id)loop
  seq:=seq+1;rid:=2026100300020000+seq;
  items:=null;seen:='|';
  for j in 1..regexp_count(r.source_sql,':P[0-9]+_[A-Za-z0-9_]+',1,'i') loop
   bind_name:=upper(regexp_substr(r.source_sql,':(P[0-9]+_[A-Za-z0-9_]+)',1,j,'i',1));
   if bind_name is not null and instr(seen,'|'||bind_name||'|')=0 then
    items:=items||case when items is not null then ',' end||'#'||bind_name;
    seen:=seen||bind_name||'|';
   end if;
  end loop;
  src:='begin htp.p(q''^<style>'||css||'</style><section id="coverage-kpis-'||r.region_id||'" class="coverage-register-kpis" data-kpi-region="'||r.region_id||'" data-report-region="'||apex_escape.html_attribute(r.region_static_id)||'" data-report-label="'||apex_escape.html_attribute(r.region_label)||'" data-page-items="'||apex_escape.html_attribute(items)||'" aria-label="'||apex_escape.html_attribute(r.region_label)||' KPIs"><div class="mr-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary>How counts work</summary><p data-kpi-scope></p></details></section><script>'||js||'</script>^'');end;';
  select min(id) into shell from apex_260100.wwv_flow_page_plugs where flow_id=105 and page_id=r.page_id and static_id='coverage-kpi-shell-'||r.region_id;
  if shell is null then wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(rid),p_flow_id=>105,p_page_id=>r.page_id,p_plug_name=>'Register KPI Overview',p_static_id=>'coverage-kpi-shell-'||r.region_id,p_plug_template=>3371237801798025892,p_region_template_options=>'#DEFAULT#:t-Region--noUI',p_plug_display_sequence=>r.plug_display_sequence-1,p_plug_display_point=>r.plug_display_point,p_plug_source_type=>'NATIVE_PLSQL',p_plug_source=>src);
  else update apex_260100.wwv_flow_page_plugs set plug_source=src where id=shell and flow_id=105;end if;
  update apex_260100.wwv_flow_page_plugs set plug_required_role=r.plug_required_role,plug_display_condition_type=r.plug_display_condition_type,plug_display_when_condition=r.plug_display_when_condition,plug_display_when_cond2=r.plug_display_when_cond2,function_body_language=r.function_body_language where flow_id=105 and page_id=r.page_id and static_id='coverage-kpi-shell-'||r.region_id;
  update apex_260100.wwv_flow_page_plugs set plug_source=imart_report_kpis.report_sql(r.region_id),query_type='SQL',query_table=null,query_where=null,query_order_by=null where flow_id=105 and id=r.region_id;
  n:=n+1;
 end loop;
 wwv_flow_imp.component_end;
 dbms_output.put_line('NEW_REPORT_KPI_REGIONS='||n);
end;
/
commit;
exit
