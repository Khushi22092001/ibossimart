whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Restore the GRN Party field to its authored native APEX Popup LOV.
   The rest of the item's Popup LOV attributes, parent cascade and submitted
   item are already present in the live metadata; only these two drifted
   definition fields are corrected. */
update apex_260100.wwv_flow_step_items
   set display_as = 'NATIVE_POPUP_LOV',
       named_lov  = 'P146_PARTY'
 where flow_id = 105
   and flow_step_id = 146
   and name = 'P146_PARTYCODE'
   and security_group_id = 4744311978888504;

begin
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'GRN Party item was not updated exactly once');
  end if;
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
exit
