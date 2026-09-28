whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Purchase Enquiry: retain both button actions while preventing label overlap. */
update apex_260100.wwv_flow_step_buttons
   set grid_new_row = case button_name
                        when 'GetUnorderedIndent' then 'Y'
                        when 'ShowAllUnorderedIndents' then 'N'
                      end,
       grid_column = case button_name
                       when 'GetUnorderedIndent' then 3
                       when 'ShowAllUnorderedIndents' then 7
                     end,
       last_updated_on = sysdate
 where flow_id = 105
   and flow_step_id = 708
   and security_group_id = 4744311978888504
   and button_name in ('GetUnorderedIndent', 'ShowAllUnorderedIndents');

begin
  if sql%rowcount <> 2 then
    raise_application_error(-20001, 'Expected two Purchase Enquiry Indent buttons; found ' || sql%rowcount);
  end if;
end;
/

commit;
exit
