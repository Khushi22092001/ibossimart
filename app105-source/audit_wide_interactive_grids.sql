set define off
set pagesize 500
set linesize 250

select c.page_id,
       c.region_name,
       p.static_id,
       count(*) as columns_in_grid
  from apex_260100.apex_appl_page_ig_columns c
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = c.application_id
   and p.page_id = c.page_id
   and p.id = c.region_id
 where c.application_id = 105
   and c.page_id = 175
 group by c.page_id, c.region_name, p.static_id
 order by c.region_name;

exit
