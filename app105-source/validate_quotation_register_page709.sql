whenever sqlerror exit failure rollback
connect -name IMART

select button_name,
       button_action
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 709
   and button_name = 'REFRESH';

select region_name,
       static_id,
       ajax_items_to_submit
  from apex_application_page_regions
 where application_id = 105
   and page_id = 709
   and region_name = 'Quotation Report';

select dynamic_action_name
  from apex_application_page_da
 where application_id = 105
   and page_id = 709
   and dynamic_action_name = 'Apply Quotation Filters';

exit
