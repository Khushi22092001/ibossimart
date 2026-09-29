whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_marker constant varchar2(80) := '/* HSPL_P152_APPROVED_LAYOUT_V2';
  l_position pls_integer;
begin
  select dbms_lob.instr(inline_css, l_marker)
    into l_position
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 152
   for update;

  if l_position = 0 then
    raise_application_error(-20001, 'Purchase Bill Pass layout marker was not found.');
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = substr(inline_css, 1, l_position - 1),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 152;

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
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select dbms_lob.instr(inline_css, 'HSPL_P152_APPROVED_LAYOUT_V2') as layout_marker
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152;

exit
