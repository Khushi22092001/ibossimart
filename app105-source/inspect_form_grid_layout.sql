connect -name IMART

set pagesize 500
set linesize 320
column page_id format 9999
column region_name format a32
column static_id format a32
column item_name format a32
column display_as format a24

prompt === Available grid metadata ===
select table_name, column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name in ('APEX_APPLICATION_PAGE_REGIONS', 'APEX_APPLICATION_PAGE_ITEMS', 'WWV_FLOW_STEP_ITEMS', 'WWV_FLOW_PAGE_PLUGS')
   and (column_name like 'GRID%' or column_name like '%SEQUENCE%' or column_name like '%NEW%LINE%' or column_name like '%NEW%ROW%')
 order by table_name, column_id;

prompt === Native page-item update arguments ===
select argument_name, position, data_type, in_out
  from all_arguments
 where owner = 'APEX_260100'
   and package_name = 'WWV_FLOW_IMP_PAGE'
   and object_name = 'UPDATE_PAGE_ITEM'
   and argument_name is not null
 order by sequence;

prompt === Target regions ===
select page_id,
       region_id,
       parent_region_id,
       display_sequence,
       region_name,
       static_id,
       grid_column,
       grid_column_span
  from apex_application_page_regions
 where application_id = 105
   and page_id in (118, 248)
 order by page_id, display_sequence, region_id;

prompt === Native three-column reference ===
select page_id, item_id, item_name, grid_column, grid_column_span, begins_on_new_row, new_grid_row
  from apex_application_page_items
 where application_id = 105
   and page_id = 10
   and item_name in ('P10_LOCATIONCODE','P10_ITEMCODE','P10_ITEMSPECIFICATIONCODE')
 order by item_id;

prompt === Underlying grid storage comparison ===
select flow_step_id, id, name, begin_on_new_line, grid_column,
       attribute_01, attribute_02, attribute_03, attribute_04, attribute_05,
       attribute_06, attribute_07, attribute_08, attribute_09, attribute_10,
       attribute_11, attribute_12, attribute_13, attribute_14, attribute_15
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and security_group_id = 4744311978888504
   and ((flow_step_id = 10 and name in ('P10_ITEMCODE','P10_ITEMSPECIFICATIONCODE'))
     or (flow_step_id = 118 and name in ('P118_LOCATIONCODE','P118_DOCTYPECODE','P118_PURCHASEORDERDATE')))
 order by flow_step_id, id;

prompt === Target form items ===
select page_id,
       item_id,
       item_name,
       region_id,
       display_as,
       grid_column,
       grid_column_span,
       grid_label_column_span
  from apex_application_page_items
 where application_id = 105
   and ((page_id = 118 and item_name in (
          'P118_LOCATIONCODE','P118_DOCTYPECODE','P118_PURCHASEORDERDATE',
          'P118_PURCHASEORDERNO','P118_PARTYCODE','P118_DELIVERYDATE','P118_QUANTITY'))
     or (page_id = 248 and item_name like 'P248_%'))
 order by page_id, region_id, item_id;

exit
