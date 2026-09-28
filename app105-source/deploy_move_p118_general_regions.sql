whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Purchase Order General: restore the authored section order and pairing. */
update apex_260100.wwv_flow_page_plugs
   set plug_display_sequence = case plug_name
                                 when 'Currency' then 30
                                 when 'Select Indent' then 40
                                 when 'Texts' then 50
                                 when 'GST In Nature And Transaction' then 60
                                 when 'Other Informations' then 70
                                 when 'PO Amendment Detail' then 80
                               end,
       plug_new_grid_row = case plug_name
                             when 'Currency' then 'Y'
                             when 'Select Indent' then 'N'
                             when 'Texts' then 'Y'
                             when 'GST In Nature And Transaction' then 'N'
                             when 'Other Informations' then 'Y'
                             when 'PO Amendment Detail' then 'N'
                           end,
       last_updated_on = sysdate
 where flow_id = 105
   and page_id = 118
   and security_group_id = 4744311978888504
   and plug_name in (
     'Texts', 'PO Amendment Detail', 'Currency', 'Select Indent',
     'GST In Nature And Transaction', 'Other Informations'
   );

begin
  if sql%rowcount <> 6 then
    raise_application_error(-20001, 'Expected 6 Purchase Order General regions; found ' || sql%rowcount);
  end if;
end;
/

commit;
exit
