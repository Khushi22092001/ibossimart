whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Restore the original Purchase Order General and Ship To item grid metadata. */
update apex_260100.wwv_flow_step_items
   set grid_column = case name
                       when 'P118_QUANTITY'     then 5
                       when 'P118_CUSTOMERCODE' then 1
                       when 'P118_PENDINGSOTNO' then 7
                       else null
                     end,
       begin_on_new_line = case name
                             when 'P118_QUANTITY'     then 'Y'
                             when 'P118_CUSTOMERCODE' then 'Y'
                             when 'P118_PENDINGSOTNO' then 'N'
                             else null
                           end
 where flow_id = 105
   and flow_step_id = 118
   and security_group_id = 4744311978888504
   and name in (
     'P118_ISOPENSPEC', 'P118_QUANTITY', 'P118_CUSTOMERCODE',
     'P118_PENDINGSOTNO'
   );

begin
  if sql%rowcount <> 4 then
    raise_application_error(-20001, 'Expected 4 Purchase Order General/Ship To items; found ' || sql%rowcount);
  end if;
end;
/

commit;
exit
