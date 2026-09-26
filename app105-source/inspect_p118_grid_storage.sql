set define off
set pages 200
set lines 240
connect -name IMART

prompt === tables with GRID_COLUMN_SPAN ===
select owner, table_name, column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and column_name in ('GRID_COLUMN', 'GRID_COLUMN_SPAN', 'NEW_GRID_ROW', 'BEGINS_ON_NEW_ROW')
 order by table_name, column_name;

prompt === page item layout view ===
select item_name, grid_column, grid_column_span, begins_on_new_row, new_grid_row
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 118
   and item_name in ('P118_LOCATIONCODE','P118_DOCTYPECODE','P118_PURCHASEORDERDATE','P118_PURCHASEORDERNO','P118_PARTYCODE','P118_DELIVERYDATE','P118_QUANTITY')
 order by display_sequence;

exit
