set define off
set pages 200
set lines 240
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEP_ITEMS'
   and column_name like '%GRID%'
 order by column_name;

select item_name, grid_column, grid_column_span, begins_on_new_row, new_grid_row
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 118
   and item_name in ('P118_SUMOFAMOUNT', 'P118_SUMOFFOOTERAMOUNT', 'P118_PURCHASEORDERAMOUNT')
 order by display_sequence;

exit
