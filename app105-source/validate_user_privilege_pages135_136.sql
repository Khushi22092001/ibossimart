whenever sqlerror exit failure rollback
connect -name IMART

select page_id,
       case when inline_css like '%User Privilege drill-down links%' then 'YES' else 'NO' end as list_link_css,
       case when inline_css like '%icon-button header%' then 'YES' else 'NO' end as detail_action_css
  from apex_application_pages
 where application_id = 105
   and page_id in (135, 136)
 order by page_id;

select page_id, button_name, button_template_id, button_template_options, icon_css_classes
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 136
   and upper(button_name) in ('PASS', 'FAIL', 'FLOW', 'STATUS', 'DELETE', 'SAVE')
 order by button_name;

exit
