whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
connect -name IMART

/*
  Shared attachment dialog Page 63.

  Legacy PREVIOUS/CREATE slots do not render in the current modal template.
  Match the working Page 62 modal layout: Cancel/Delete in DELETE and
  Save/Update in NEXT.  Data processing, validation and calling pages remain
  unchanged.
*/
declare
begin
  update apex_260100.wwv_flow_step_buttons
     set button_position = case button_name
                             when 'CANCEL' then 'DELETE'
                             when 'DELETE' then 'DELETE'
                             when 'CREATE' then 'NEXT'
                             when 'SAVE'   then 'NEXT'
                           end,
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 63
     and button_name in ('CANCEL', 'DELETE', 'CREATE', 'SAVE')
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 4 then
    raise_application_error(-20001,
      'Expected four Page 63 attachment dialog buttons, updated ' || sql%rowcount);
  end if;

  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select button_name, button_position
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 63
   and button_name in ('CANCEL', 'DELETE', 'CREATE', 'SAVE')
   and security_group_id = 4744311978888504
 order by button_name;

exit
