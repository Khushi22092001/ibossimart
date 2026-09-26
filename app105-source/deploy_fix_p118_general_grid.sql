whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Purchase Order General: use the native 12-column APEX grid. */
update apex_260100.wwv_flow_step_items
   set grid_column = case name
                       when 'P118_LOCATIONCODE'       then 1
                       when 'P118_DOCTYPECODE'        then 5
                       when 'P118_PURCHASEORDERDATE'  then 9
                       when 'P118_PURCHASEORDERNO'    then 1
                       when 'P118_PARTYCODE'          then 5
                       when 'P118_DELIVERYDATE'       then 9
                       when 'P118_QUANTITY'           then 1
                     end,
       begin_on_new_line = case name
                             when 'P118_LOCATIONCODE'      then 'Y'
                             when 'P118_DOCTYPECODE'       then 'N'
                             when 'P118_PURCHASEORDERDATE' then 'N'
                             when 'P118_PURCHASEORDERNO'   then 'Y'
                             when 'P118_PARTYCODE'         then 'N'
                             when 'P118_DELIVERYDATE'      then 'N'
                             when 'P118_QUANTITY'          then 'Y'
                           end
 where flow_id = 105
   and flow_step_id = 118
   and security_group_id = 4744311978888504
   and name in (
     'P118_LOCATIONCODE', 'P118_DOCTYPECODE', 'P118_PURCHASEORDERDATE',
     'P118_PURCHASEORDERNO', 'P118_PARTYCODE', 'P118_DELIVERYDATE',
     'P118_QUANTITY'
   );

begin
  if sql%rowcount <> 7 then
    raise_application_error(-20001, 'Expected 7 Purchase Order General items; found ' || sql%rowcount);
  end if;
end;
/

commit;
exit
