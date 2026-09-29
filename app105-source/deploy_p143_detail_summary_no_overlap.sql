whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

/* Keep the Summary inside the Detail tab, but place it in a normal full-width
   row after the Interactive Grid instead of its current floating grid cell. */
begin
  update apex_260100.wwv_flow_page_plugs
     set plug_new_grid_row = 'Y',
         plug_display_column = 1,
         plug_grid_column_span = 12
   where id = 447354910990243096
     and flow_id = 105
     and page_id = 143
     and parent_plug_id = 596723855758907765;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Bill Detail Summary region was not found in the expected location.');
  end if;

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

select id,
       plug_new_grid,
       plug_new_grid_row,
       plug_display_column,
       plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs
 where id = 447354910990243096
   and flow_id = 105
   and page_id = 143;

exit
