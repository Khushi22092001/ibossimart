whenever sqlerror exit failure rollback
connect -name IMART

select page_id,
       case when inline_css like '%outlined icon controls%' then 'YES' else 'NO' end as button_style
  from apex_application_pages
 where application_id = 105
   and page_id = 55;

select button_name, button_template_id, button_template_options, icon_css_classes
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 55
   and upper(button_name) in ('PASS','FAIL','FLOW','STATUS','PRINT','CANCEL','DELETE','SAVE','CREATE')
 order by button_name;

select item_name, is_required
  from apex_application_page_items
 where application_id = 105
   and page_id = 55
   and item_name = 'P55_ITEMCATEGORYNAME';

select count(*) as server_validation_count
  from apex_application_page_val
 where application_id = 105
   and page_id = 55
   and validation_name = 'Item Category Name Required';

exit
