whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

/* Purchase Bill (page 143): only the Party item layout is widened.
   It does not alter LOVs, source, validations, DAs, processes, or data. */
begin
  update apex_260100.wwv_flow_step_items
     set begin_on_new_line = 'Y',
         grid_column      = 1,
         colspan          = 12,
         csize            = 32
   where flow_id = 105
     and flow_step_id = 143
     and name = 'P143_PARTYCODE';

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Bill Party item was not found.');
  end if;

  update apex_260100.wwv_flows
     set files_version   = files_version + 1,
         version_scn     = dbms_flashback.get_system_change_number,
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

select item_name,
       grid_column,
       grid_column_span,
       begins_on_new_row,
       item_element_width
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 143
   and item_name = 'P143_PARTYCODE';

exit
