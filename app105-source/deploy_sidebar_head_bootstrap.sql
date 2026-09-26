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
begin
  update apex_260100.wwv_flow_steps
     set html_page_header = case
       when dbms_lob.instr(html_page_header, 'hspl-sidebar-head-state') > 0
         then html_page_header
       else nvl(html_page_header, to_clob('')) || l_bootstrap
     end,
         last_updated_on = sysdate
   where flow_id = 105
     and security_group_id = 4744311978888504;

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
