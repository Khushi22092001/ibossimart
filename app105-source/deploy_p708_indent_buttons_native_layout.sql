whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_old_css_marker constant varchar2(80) := '/* HSPL_P708_INDENT_BUTTON_LAYOUT_V2';
  l_old_css_position pls_integer;
  l_css constant clob := q'~

/* HSPL_P708_INDENT_BUTTON_CONTRAST_V2 */
html.page-708 #show-all-unordered-indents {
  background:#e7edfb!important;
  border:1px solid #b9c8ee!important;
  box-shadow:0 1px 2px rgba(30,64,175,.10)!important;
  color:#23458c!important;
}
html.page-708 #show-all-unordered-indents:hover,
html.page-708 #show-all-unordered-indents:focus-visible {
  background:#dce6fb!important;
  border-color:#94aae0!important;
}
~';
begin
  /* Remove only the obsolete CSS positioning block. */
  select dbms_lob.instr(inline_css, l_old_css_marker)
    into l_old_css_position
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 708
   for update;

  if l_old_css_position > 0 then
    update apex_260100.wwv_flow_steps
       set inline_css = substr(inline_css, 1, l_old_css_position - 1) || l_css,
           last_updated_on = sysdate
     where flow_id = 105
       and id = 708;
  else
    update apex_260100.wwv_flow_steps
       set inline_css = to_clob(inline_css) || l_css,
           last_updated_on = sysdate
     where flow_id = 105
       and id = 708;
  end if;

  /* Native grid: first button occupies columns 3-6, second 7-12. */
  update apex_260100.wwv_flow_step_buttons
     set grid_new_row = case button_name
             when 'GetUnorderedIndent' then 'Y'
             else 'N'
           end,
         grid_new_column = 'N',
         grid_column = case button_name
             when 'GetUnorderedIndent' then 3
             else 7
           end,
         grid_column_span = case button_name
             when 'GetUnorderedIndent' then 4
             else 6
           end
   where flow_id = 105
     and flow_step_id = 708
     and button_name in ('GetUnorderedIndent', 'ShowAllUnorderedIndents');

  if sql%rowcount <> 2 then
    raise_application_error(-20001, 'Expected the two Purchase Enquiry indent buttons, found ' || sql%rowcount || '.');
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

select button_name,
       grid_column,
       grid_column_span,
       new_grid_row
  from apex_260100.apex_application_page_buttons
 where application_id = 105
   and page_id = 708
   and button_name in ('GetUnorderedIndent', 'ShowAllUnorderedIndents')
 order by button_name;

exit
