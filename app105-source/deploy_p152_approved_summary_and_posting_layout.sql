whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

begin
  /* Other Details: retain the approved two-column summary and let the
     Paid In Advance field use all remaining space before its existing action. */
  update apex_260100.wwv_flow_step_items
     set colspan = 5,
         grid_label_column_span = 2
   where flow_id = 105
     and flow_step_id = 152
     and name = 'P152_PAIDINADVANCE'
     and grid_column = 7;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Paid In Advance item was not found in the expected layout state.');
  end if;

  /* Account Posting Detail: two balanced native APEX columns. */
  update apex_260100.wwv_flow_step_items
     set begin_on_new_line = case name
             when 'P152_DEBITNOTENO' then 'N'
             when 'P152_BILLAMOUNT' then 'N'
             when 'P152_REVERSECHARGENO' then 'N'
             else 'Y'
           end,
         grid_column = case name
             when 'P152_DEBITNOTENO' then 7
             when 'P152_BILLAMOUNT' then 7
             when 'P152_REVERSECHARGENO' then 7
             else 1
           end,
         colspan = 6
   where flow_id = 105
     and flow_step_id = 152
     and name in (
       'P152_VOUCHERNO',
       'P152_DEBITNOTENO',
       'P152_DNNO',
       'P152_BILLAMOUNT',
       'P152_DEBITNOTEAMOUNT',
       'P152_REVERSECHARGENO'
     );

  if sql%rowcount <> 6 then
    raise_application_error(-20002, 'Expected six Account Posting Detail items, found ' || sql%rowcount || '.');
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
       grid_label_column_span,
       begins_on_new_row
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 152
   and item_name in (
     'P152_PAIDINADVANCE',
     'P152_VOUCHERNO',
     'P152_DEBITNOTENO',
     'P152_DNNO',
     'P152_BILLAMOUNT',
     'P152_DEBITNOTEAMOUNT',
     'P152_REVERSECHARGENO'
   )
 order by item_name;

exit
