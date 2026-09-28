set define off
set pages 100
set lines 240
connect -name IMART

select item_name, grid_column, grid_column_span, begins_on_new_row, new_grid_row, grid_column_css_classes
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 118
   and item_name in ('P118_CUSTOMERCODE', 'P118_PENDINGSOTNO')
 order by display_sequence;

exit
