whenever sqlerror exit failure rollback
connect -name IMART

select item_type, count(*) as lov_columns
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and upper(item_type) like '%LOV%'
 group by item_type
 order by item_type;

select case
         when attributes like '%"fetch_on_search":"Y"%' then 'Y (Sales Item style)'
         when attributes like '%"fetch_on_search":"N"%' then 'N (current alternative)'
         else 'Not explicitly set'
       end as fetch_on_search,
       count(*) as lov_columns
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and item_type = 'NATIVE_POPUP_LOV'
 group by case
         when attributes like '%"fetch_on_search":"Y"%' then 'Y (Sales Item style)'
         when attributes like '%"fetch_on_search":"N"%' then 'N (current alternative)'
         else 'Not explicitly set'
       end
 order by fetch_on_search;

select page_id, region_name, count(*) as popup_lovs
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and item_type = 'NATIVE_POPUP_LOV'
 group by page_id, region_name
 order by popup_lovs desc, page_id;

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'APEX_APPL_PAGE_IG_COLUMNS'
   and (upper(column_name) like '%WIDTH%' or upper(column_name) like '%STRETCH%')
 order by column_id;

select page_id, region_name, name as column_name, item_type,
       lov_display_null, item_width, attributes
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and ((page_id = 81 and name = 'COMPANYCODE')
     or (page_id = 171 and name = 'ITEMCODE'))
 order by page_id;

exit
