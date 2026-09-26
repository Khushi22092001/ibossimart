whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART'
  );
  wwv_flow_imp_shared.create_flow_process(
    p_id => wwv_flow_imp.id(900000000000143),
    p_process_sequence => 10,
    p_process_point => 'ON_DEMAND',
    p_process_name => 'GET_POPULAR_PAGES',
    p_static_id => 'get-popular-pages',
    p_process_sql_clob => q'~
declare
begin
  apex_json.initialize_clob_output;
  apex_json.open_object;
  apex_json.open_array('pages');
  for r in (
    select page_id,
           max(page_name) as page_name,
           count(*) as visit_count
      from apex_260100.apex_workspace_activity_log
     where workspace_id = 4744311978888504
       and application_id = 105
       and upper(apex_user) = upper(v('APP_USER'))
       and page_id not in (0, 1)
       and page_name is not null
     group by page_id
     order by count(*) desc, max(view_timestamp) desc
     fetch first 8 rows only
  ) loop
    apex_json.open_object;
    apex_json.write('pageId', r.page_id);
    apex_json.write('pageName', r.page_name);
    apex_json.write('visitCount', r.visit_count);
    apex_json.close_object;
  end loop;
  apex_json.close_array;
  apex_json.close_object;
  sys.htp.prn(apex_json.get_clob_output);
  apex_json.free_output;
end;
~',
    p_process_clob_language => 'PLSQL',
    p_security_scheme => 'MUST_NOT_BE_PUBLIC_USER'
  );
  wwv_flow_imp.component_end;
end;
/

declare
  l_js clob := q'~

/* Home: user-specific popular pages sourced from APEX activity history. */
(function () {
  function escapeHtml(value) {
    return String(value || '').replace(/[&<>'"]/g, function (char) {
      return {'&':'&amp;','<':'&lt;','>':'&gt;',"'":'&#39;','"':'&quot;'}[char];
    });
  }
  function pageUrl(pageId) {
    return 'f?p=' + $v('pFlowId') + ':' + pageId + ':' + $v('pInstance') + '::::';
  }
  function cardClass(index) {
    return ['', ' imart-home-card--teal', ' imart-home-card--amber', ' imart-home-card--purple', ' imart-home-card--rose'][index % 5];
  }
  function renderPopularPages(payload) {
    var pages = payload && payload.pages || [];
    if (!pages.length) return; // The curated operational shortcuts remain useful for a new user.
    var section = document.querySelector('.imart-home-section');
    var grid = section && section.querySelector('.imart-home-grid');
    if (!section || !grid) return;
    var heading = section.querySelector('h2');
    var description = section.querySelector('.imart-home-section-head p');
    var link = section.querySelector('.imart-home-section-link');
    if (heading) heading.textContent = 'Popular Pages';
    if (description) description.textContent = 'Your most frequently used pages, based on your own activity.';
    if (link) { link.textContent = 'View all pages →'; link.href = 'f?p=' + $v('pFlowId') + ':1:' + $v('pInstance') + '::::'; }
    grid.id = 'imart-popular-pages';
    grid.innerHTML = pages.map(function (page, index) {
      var count = Number(page.visitCount) || 0;
      var label = count === 1 ? 'Visited once' : 'Visited ' + count + ' times';
      return '<a class="imart-home-card' + cardClass(index) + '" href="' + pageUrl(page.pageId) + '">' +
        '<span class="imart-home-card-icon">' + (index % 2 ? '↗' : '▣') + '</span>' +
        '<h3>' + escapeHtml(page.pageName) + '</h3>' +
        '<p>' + label + '</p><span class="imart-home-card-arrow">→</span></a>';
    }).join('');
  }
  function loadPopularPages() {
    if (!(window.apex && apex.server && document.querySelector('.imart-home-section'))) return;
    apex.server.process('GET_POPULAR_PAGES', {}, { dataType: 'json', success: renderPopularPages });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', loadPopularPages, { once: true });
  else loadPopularPages();
}());
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code_onload = case
           when instr(nvl(javascript_code_onload, empty_clob()), 'Home: user-specific popular pages') = 0
             then nvl(javascript_code_onload, empty_clob()) || l_js
           else javascript_code_onload
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Page 1 record; found ' || sql%rowcount);
  end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
