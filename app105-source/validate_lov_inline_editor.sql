whenever sqlerror exit failure rollback
connect -name IMART

select case
         when instr(css_file_urls, 'cb=20260925inline-lov') > 0 then 'YES'
         else 'NO'
       end as cachebuster_updated
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select count(*) as popup_lov_grid_columns
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and item_type = 'NATIVE_POPUP_LOV';

exit
