whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_css_marker constant varchar2(80) := '/* HSPL_P152_OTHER_DETAILS_TWO_COLUMNS_V1';
  l_css_position pls_integer;
begin
  /* Remove the earlier CSS-only attempt. It did not match the APEX item rows. */
  select dbms_lob.instr(inline_css, l_css_marker)
    into l_css_position
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 152
   for update;

  if l_css_position > 0 then
    update apex_260100.wwv_flow_steps
       set inline_css = substr(inline_css, 1, l_css_position - 1),
           last_updated_on = sysdate
     where flow_id = 105
       and id = 152;
  end if;

  /* Native APEX grid only: pairs amount fields without changing their behavior. */
  update apex_260100.wwv_flow_step_items
     set begin_on_new_line = case name
             when 'P152_SUMOFFOOTERAMOUNT' then 'N'
             when 'P152_ROUNDOFF' then 'N'
             when 'P152_PAIDINADVANCE' then 'N'
             else 'Y'
           end,
         grid_column = case name
             when 'P152_SUMOFFOOTERAMOUNT' then 7
             when 'P152_ROUNDOFF' then 7
             when 'P152_PAIDINADVANCE' then 7
             else 1
           end,
         colspan = case name
             when 'P152_REMARK' then 12
             when 'P152_NETPAYABLEAMOUNT' then 12
             when 'P152_PAIDINADVANCE' then 4
             else 6
           end
   where flow_id = 105
     and flow_step_id = 152
     and name in (
       'P152_REMARK',
       'P152_SUMOFAMOUNT',
       'P152_SUMOFFOOTERAMOUNT',
       'P152_PBPASSAMOUNTBEFOREROUND',
       'P152_ROUNDOFF',
       'P152_PBPASSAMOUNT',
       'P152_PAIDINADVANCE',
       'P152_NETPAYABLEAMOUNT'
     );

  if sql%rowcount <> 8 then
    raise_application_error(-20001, 'Expected eight Other Details items, found ' || sql%rowcount || '.');
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

select item_name,
       grid_column,
       grid_column_span,
       begins_on_new_row
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 152
   and item_name in (
     'P152_REMARK',
     'P152_SUMOFAMOUNT',
     'P152_SUMOFFOOTERAMOUNT',
     'P152_PBPASSAMOUNTBEFOREROUND',
     'P152_ROUNDOFF',
     'P152_PBPASSAMOUNT',
     'P152_PAIDINADVANCE',
     'P152_NETPAYABLEAMOUNT'
   )
 order by item_name;

exit
