whenever sqlerror exit failure rollback
connect -name IMART

select page_id,
       page_name
  from apex_application_pages
 where application_id = 105
   and page_id = 36;

select count(*) item_group_region_count
  from apex_application_page_regions
 where application_id = 105
   and page_id = 36
   and region_name = 'Item Group List';

exit
