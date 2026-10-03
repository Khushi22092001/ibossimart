whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_bootstrap constant clob := q'~
<script id="hspl-sidebar-head-state">
(function(d){
  var state='closed';
  try {
    var saved=window.localStorage.getItem('imart.sidebar.state.v1');
    if(saved==='open'||saved==='closed') state=saved;
  } catch(ignore) {}
  d.classList.remove(state==='open'?'hspl-nav-target-closed':'hspl-nav-target-open');
  d.classList.add(state==='open'?'hspl-nav-target-open':'hspl-nav-target-closed');
})(document.documentElement);
</script>~';
  l_header clob;

  function replace_bootstrap(p_header clob) return clob is
    l_start  pls_integer;
    l_finish pls_integer;
    l_length pls_integer;
    l_after  pls_integer;
    l_result clob;
  begin
    if p_header is null then
      return l_bootstrap;
    end if;
    l_start := dbms_lob.instr(p_header, '<script id="hspl-sidebar-head-state">');
    if l_start = 0 then
      return p_header || l_bootstrap;
    end if;
    l_finish := dbms_lob.instr(p_header, '</script>', l_start);
    if l_finish = 0 then
      raise_application_error(-20001, 'Sidebar head bootstrap has no closing script tag.');
    end if;
    l_length := dbms_lob.getlength(p_header);
    dbms_lob.createtemporary(l_result, true);
    if l_start > 1 then
      dbms_lob.copy(l_result, p_header, l_start - 1, 1, 1);
    end if;
    dbms_lob.append(l_result, l_bootstrap);
    l_after := l_finish + length('</script>');
    if l_after <= l_length then
      dbms_lob.copy(
        l_result,
        p_header,
        l_length - l_after + 1,
        dbms_lob.getlength(l_result) + 1,
        l_after
      );
    end if;
    return l_result;
  end replace_bootstrap;
begin
  for page in (select id, html_page_header from apex_260100.wwv_flow_steps
                where flow_id = 105 and security_group_id = 4744311978888504) loop
    l_header := replace_bootstrap(page.html_page_header);
    update apex_260100.wwv_flow_steps
       set html_page_header = l_header,
           last_updated_on = sysdate
     where id = page.id and flow_id = 105 and security_group_id = 4744311978888504;
  end loop;

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;

  commit;
end;
/

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

select count(*) total_pages,
       sum(case
             when dbms_lob.instr(html_page_header, 'hspl-sidebar-head-state') > 0
               then 1 else 0
           end) bootstrapped_pages
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and security_group_id = 4744311978888504;

exit
