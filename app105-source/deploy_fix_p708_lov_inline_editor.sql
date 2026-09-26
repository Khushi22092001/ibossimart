whenever sqlerror exit failure rollback
set define off
connect -name IMART

/*
  Purchase Enquiry / Item Detail (Page 708) only.

  The old page-local horizontal-scroll patch forced the IG body, scroll body,
  and scroll track into a scrolling container. In edit mode APEX then moves a
  Popup LOV into a "Floating overflow cell content" wrapper to prevent it
  from being clipped. The shared theme now owns the native horizontal track,
  so remove only this obsolete Page 708 block. No shared CSS or any other
  page metadata is changed.
*/
declare
  l_css        clob;
  l_block_from pls_integer;
  l_block_to   pls_integer;
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 708
     and security_group_id = 4744311978888504
     for update;

  l_block_from := dbms_lob.instr(l_css,
    '/* WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1 */');
  l_block_to := dbms_lob.instr(l_css,
    '/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */', l_block_from + 1);

  if l_block_from = 0 or l_block_to = 0 or l_block_to <= l_block_from then
    raise_application_error(-20001,
      'Expected Page 708 legacy horizontal-scroll CSS block was not found.');
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = dbms_lob.substr(l_css, l_block_from - 1, 1) ||
                      dbms_lob.substr(l_css, dbms_lob.getlength(l_css), l_block_to),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 708
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected exactly one Page 708 update.');
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
exit
