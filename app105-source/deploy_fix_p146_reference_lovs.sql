whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Restore the two GRN reference selectors to the native Popup LOVs already
   authored in the App 105 APEXLang page.  The cascading parent items and
   dynamic actions are intentionally left untouched. */
update apex_260100.wwv_flow_step_items
   set display_as = 'NATIVE_POPUP_LOV',
       named_lov  = case name
                      when 'P146_MATERIALINTNO' then 'P146_MATERIALINTNO'
                      when 'P146_LOADINGADVICETNO' then 'P146_LOADINGADVICETNO'
                    end
 where flow_id = 105
   and flow_step_id = 146
   and name in ('P146_MATERIALINTNO', 'P146_LOADINGADVICETNO')
   and security_group_id = 4744311978888504;

begin
  if sql%rowcount <> 2 then
    raise_application_error(-20001, 'GRN Material In / Loading Advice LOV items were not updated exactly twice');
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
