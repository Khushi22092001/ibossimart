whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

select item_name,
       grid_column,
       grid_column_span,
       grid_label_column_span,
       begins_on_new_row,
       display_as,
       item_element_width
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 143
   and item_name = 'P143_PARTYCODE';

exit
