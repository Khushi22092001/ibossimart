whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Customer and Pending SO are two equal six-column fields in Ship To. */
update apex_260100.wwv_flow_step_items
   set grid_column = case name
                       when 'P118_CUSTOMERCODE' then 1
                       when 'P118_PENDINGSOTNO' then 7
                     end,
       grid_column_css_classes = 'col-6',
       begin_on_new_line = case name
                             when 'P118_CUSTOMERCODE' then 'Y'
                             else 'N'
                           end
 where flow_id = 105
   and flow_step_id = 118
   and security_group_id = 4744311978888504
   and name in ('P118_CUSTOMERCODE', 'P118_PENDINGSOTNO');

begin
  if sql%rowcount <> 2 then
    raise_application_error(-20001, 'Expected Customer and Pending SO items; found ' || sql%rowcount);
  end if;
end;
/

commit;

select item_name, grid_column, grid_column_span, begins_on_new_row, grid_column_css_classes
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 118
   and item_name in ('P118_CUSTOMERCODE', 'P118_PENDINGSOTNO')
 order by display_sequence;

exit
