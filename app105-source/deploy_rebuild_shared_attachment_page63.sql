whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
connect -name IMART

/* Rebuild Page 63 so APEX recompiles the legacy modal definition. */
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');

  wwv_flow_imp_page.remove_page(p_flow_id => 105, p_page_id => 63);

  wwv_flow_imp.component_end;
end;
/

@app105-source/export/f105/application/pages/page_00063.sql

commit;

select button_name, button_position
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 63
   and button_name in ('CANCEL', 'DELETE', 'CREATE', 'SAVE')
   and security_group_id = 4744311978888504
 order by button_name;

exit
