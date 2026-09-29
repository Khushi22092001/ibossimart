set pagesize 200
set linesize 220
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEPS'
   and upper(column_name) like '%DIALOG%'
 order by column_id;

select page_id,
       page_name,
       page_mode,
       dialog_width,
       dialog_height,
       dialog_resizable
  from apex_260100.apex_application_pages
 where application_id = 105
   and page_id = 321;

exit
