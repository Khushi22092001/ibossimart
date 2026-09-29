whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

/* Purchase Bill page 143: native APEX grid layout only.
   No process, validation, dynamic action, source, LOV, or item behavior is changed. */
begin
  update apex_260100.wwv_flow_step_items
     set begin_on_new_line = case name
           when 'P143_PARTYBILLDATE' then 'N'
           when 'P143_TAXINROUND' then 'N'
           when 'P143_CURRENCYVALUE' then 'N'
           when 'P143_NATUREOFSUPPLYCODE' then 'N'
           else 'Y'
         end,
         grid_column = case name
           when 'P143_PARTYBILLDATE' then 7
           when 'P143_TAXINROUND' then 7
           when 'P143_CURRENCYVALUE' then 7
           when 'P143_NATUREOFSUPPLYCODE' then 7
           else 1
         end,
         colspan = case name
           when 'P143_PARTYCODE' then 12
           when 'P143_BILLING_TYPE' then 12
           when 'P143_PURCHASEORDERTNO' then 12
           when 'P143_REMARK' then 12
           else 6
         end
   where flow_id = 105
     and flow_step_id = 143
     and name in (
       'P143_PARTYCODE',
       'P143_BILLING_TYPE',
       'P143_PARTYBILLNO',
       'P143_PARTYBILLDATE',
       'P143_BILLEDON',
       'P143_TAXINROUND',
       'P143_BILLINROUNDFIGURE',
       'P143_CURRENCYUNITCODE',
       'P143_CURRENCYVALUE',
       'P143_PURCHASEORDERTNO',
       'P143_TRANSACTIONTYPECODE',
       'P143_NATUREOFSUPPLYCODE',
       'P143_REMARK'
     );

  if sql%rowcount <> 13 then
    raise_application_error(-20001, 'Expected thirteen Purchase Bill layout items, found ' || sql%rowcount || '.');
  end if;

  /* A date item shares a six-column cell; its label must not consume all six. */
  update apex_260100.wwv_flow_step_items
     set grid_label_column_span = 3
   where flow_id = 105
     and flow_step_id = 143
     and name = 'P143_PARTYBILLDATE';

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Party Bill Date item was not found.');
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
   and page_id = 143
   and item_name in (
     'P143_PARTYCODE', 'P143_BILLING_TYPE', 'P143_PARTYBILLNO', 'P143_PARTYBILLDATE',
     'P143_BILLEDON', 'P143_TAXINROUND', 'P143_BILLINROUNDFIGURE',
     'P143_CURRENCYUNITCODE', 'P143_CURRENCYVALUE', 'P143_PURCHASEORDERTNO',
     'P143_TRANSACTIONTYPECODE', 'P143_NATUREOFSUPPLYCODE', 'P143_REMARK'
   )
 order by item_name;

exit
