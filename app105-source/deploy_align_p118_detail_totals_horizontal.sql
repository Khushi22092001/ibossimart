whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Keep the three Purchase Order Detail totals in one horizontal row. */
update apex_260100.wwv_flow_step_items
   set grid_column = case name
                       when 'P118_SUMOFAMOUNT'          then 1
                       when 'P118_SUMOFFOOTERAMOUNT'    then 5
                       when 'P118_PURCHASEORDERAMOUNT'  then 9
                     end,
       begin_on_new_line = case name
                             when 'P118_SUMOFAMOUNT' then 'Y'
                             else 'N'
                           end
 where flow_id = 105
   and flow_step_id = 118
   and security_group_id = 4744311978888504
   and name in ('P118_SUMOFAMOUNT', 'P118_SUMOFFOOTERAMOUNT', 'P118_PURCHASEORDERAMOUNT');

begin
  if sql%rowcount <> 3 then
    raise_application_error(-20001, 'Expected 3 Purchase Order Detail total items; found ' || sql%rowcount);
  end if;
end;
/

commit;

select item_name, grid_column, begins_on_new_row
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 118
   and item_name in ('P118_SUMOFAMOUNT', 'P118_SUMOFFOOTERAMOUNT', 'P118_PURCHASEORDERAMOUNT')
 order by grid_column;

exit
