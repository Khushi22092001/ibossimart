whenever sqlerror exit failure rollback
connect -name IMART

select page_id, region_name, name, item_type,
       json_value(attributes, '$.fetch_on_search') as fetch_on_search
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and page_id = 81
   and name = 'COMPANYCODE';

exit
