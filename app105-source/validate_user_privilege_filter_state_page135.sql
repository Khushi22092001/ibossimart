whenever sqlerror exit failure rollback
connect -name IMART

select count(*) filter_item_count
  from apex_application_page_items
 where application_id = 105
   and page_id = 135
   and item_name in (
       'P135_USER',
       'P135_MODULE',
       'P135_MODULEGROUP',
       'P135_MODULETYPE',
       'P135_MODULESUBTYPE'
   );

select region_name,
       ajax_items_to_submit
  from apex_application_page_regions
 where application_id = 105
   and page_id = 135
   and region_name = 'User Privilege';

exit
