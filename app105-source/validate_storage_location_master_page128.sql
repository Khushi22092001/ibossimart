whenever sqlerror exit failure rollback
connect -name IMART

select page_id, dialog_height,
       case when inline_css like '%outlined icon controls%' then 'YES' else 'NO' end as button_style
  from apex_application_pages
 where application_id = 105
   and page_id = 128;

select button_name, button_template_id, button_template_options, icon_css_classes
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 128
   and upper(button_name) in ('PASS','FAIL','FLOW','STATUS','PRINT','CANCEL','DELETE','SAVE','CREATE')
 order by button_name;

exit
