whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
connect -name IMART
declare
 client_js varchar2(32767):='(function () {
  ''use strict'';
  if (window.IMARTMasterKpis) return;
  var currentRequest = null;
  function section(page) { return document.getElementById(''mr-register-kpis-'' + page); }
  function close(page) {
    var root = section(page), opener = document.querySelector(''[aria-controls="mr-register-kpis-'' + page + ''"]'');
    if (!root) return;
    root.hidden = true;
    if (currentRequest) { currentRequest.abort(); currentRequest = null; }
    if (opener) { opener.setAttribute(''aria-expanded'', ''false''); opener.focus(); }
  }
  function load(page) {
    var root = section(page), opener = document.querySelector(''[aria-controls="mr-register-kpis-'' + page + ''"]'');
    if (!root) return;
    root.hidden = false;
    if (opener) opener.setAttribute(''aria-expanded'', ''true'');
    var content = root.querySelector(''[data-kpi-content]'');
    content.textContent = ''Loading KPIs…'';
    root.setAttribute(''aria-busy'', ''true'');
    currentRequest = apex.server.process(''IMART_REGISTER_KPIS'', {x01: String(page)}, {
      dataType: ''json'', timeout: 15000,
      success: function (data) {
        if (root.hidden) return;
        root.querySelector(''[data-kpi-title]'').textContent = data.title;
        root.querySelector(''[data-kpi-scope]'').textContent = data.scope;
        content.replaceChildren();
        data.cards.forEach(function (card) {
          var el = document.createElement(''button''), label = document.createElement(''span''),
            value = document.createElement(''strong''), note = document.createElement(''small'');
          el.className = ''mr-inline-kpi''; label.textContent = card.label;
          el.type = ''button''; el.setAttribute(''aria-pressed'', String(card.selected));
          el.setAttribute(''aria-label'', card.label + '': '' + card.value);
          value.textContent = card.value; note.textContent = ''Click to filter'';
          el.addEventListener(''click'', function () {
            var buttons = content.querySelectorAll(''button'');
            buttons.forEach(function (b) { b.disabled = true; });
            apex.server.process(''IMART_KPI_STATUS_FILTER'', {x01: String(page), x02: card.mode, x03: card.status}, {
              dataType: ''json'', timeout: 15000,
              success: function () {
                buttons.forEach(function (b) { b.setAttribute(''aria-pressed'', String(b === el)); });
                var reportRoot = opener && opener.closest(''.js-apex-region'');
                var report = apex.region(reportRoot ? reportRoot.id : data.region);
                if (report) report.refresh();
                else apex.message.alert(''The register could not be refreshed. Please reload this page.'');
              },
              error: function () { apex.message.alert(''Status filter could not be applied. Please retry.''); },
              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }
            });
          });
          el.append(label, value, note); content.append(el);
        });
      },
      error: function (request, status) {
        if (status !== ''abort'' && !root.hidden) content.textContent = ''KPIs could not be loaded. Close and reopen to retry.'';
      },
      complete: function () { currentRequest = null; root.removeAttribute(''aria-busy''); }
    });
  }
  function toggle(page) {
    var root = section(page);
    if (!root) return;
    if (!root.hidden) close(page); else load(page);
  }
  function listen() { apex.jQuery(document).on(''apexafterrefresh.imartMasterKpis'', ''.js-apex-region'', function () {
    var root = document.querySelector(''.mr-register-kpis:not([hidden])'');
    if (!root) return;
    var page = Number(root.id.replace(''mr-register-kpis-'', ''''));
    var opener = document.querySelector(''[aria-controls="'' + root.id + ''"]'');
    if (opener && opener.closest(''.js-apex-region'') === this) load(page);
  }); }
  window.IMARTMasterKpis = {toggle: toggle, close: close};
  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', listen, {once: true});
  else listen();
})();
';
 source_sql clob;
begin
 for r in (select * from imart_mr_register) loop
  if r.status_expression is not null then
   source_sql:='select mr_source.* from ('||regexp_replace(r.query_sql,';[[:space:]]*$','')||chr(10)||') mr_source where (select imart_register_kpis.selected_mode('||r.page_id||') from dual)=''ALL'' or nvl(trim(cast('||r.status_expression||' as varchar2(4000))),chr(1))=nvl((select imart_register_kpis.selected_status('||r.page_id||') from dual),chr(1))';
   update apex_260100.wwv_flow_page_plugs set plug_source=source_sql where flow_id=105 and id=r.region_id;
  end if;
  select plug_source into source_sql from imart_mr_status_backup where static_id='mr-kpi-shell-'||r.page_id;
  source_sql:=regexp_replace(source_sql,'<script>.*</script>','<script>'||client_js||'</script>',1,0,'n');
  source_sql:=replace(source_sql,'</style>','.mr-register-kpis .mr-inline-kpi{font-family:inherit;text-align:left;cursor:pointer;width:100%}.mr-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:#6155d9;background:#f0efff}.mr-register-kpis .mr-inline-kpi:focus-visible{outline:2px solid #6155d9;outline-offset:2px}</style>');
  update apex_260100.wwv_flow_page_plugs set plug_source=source_sql where flow_id=105 and static_id='mr-kpi-shell-'||r.page_id;
 end loop;
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 wwv_flow_imp_shared.create_flow_process(p_id=>wwv_flow_imp.id(2026100100960001),p_process_sequence=>1,p_process_point=>'ON_DEMAND',p_process_name=>'IMART_KPI_STATUS_FILTER',p_static_id=>'imart-kpi-status-filter',p_process_type=>'NATIVE_PLSQL',p_process_sql_clob=>'begin imart_register_kpis.apply_status(to_number(apex_application.g_x01),apex_application.g_x02,apex_application.g_x03);end;');
 wwv_flow_imp.component_end;
end;
/
commit;
exit
