whenever sqlerror exit failure rollback
set pagesize 500
set linesize 240
set trimspool on
connect -name IMART
set define off

prompt === APEX branch metadata available for application 105 ===
select column_name
  from all_tab_columns
 where table_name = 'APEX_APPLICATION_PAGE_BRANCHES'
 order by column_id;

prompt === Register pages ===
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and (lower(page_name) like '%register%' or lower(page_alias) like '%register%')
 order by page_id;

prompt === Branches that return to a register ===
select page_id, page_name, branch_name, when_button_pressed, branch_type, branch_action
  from apex_application_page_branches
 where application_id = 105
   and regexp_like(branch_action,
       '(^|[^0-9])(68|107|129|137|139|142|145|147|151|160|167|170|174|194|207|212|216|220|229|243|245|265|283|291|293|294|295|304|316|349|351|375|414|417|419|644|707|709|711)([^0-9]|$)')
 order by page_id, branch_name;

prompt === Button metadata available for application 105 ===
select column_name
  from all_tab_columns
 where table_name = 'APEX_APPLICATION_PAGE_BUTTONS'
 order by column_id;

prompt === Interactive report column metadata available ===
select column_name
  from all_tab_columns
 where table_name = 'APEX_APPLICATION_PAGE_IR_COL'
 order by column_id;

prompt === Interactive grid column metadata available ===
select column_name
  from all_tab_columns
 where table_name = 'APEX_APPL_PAGE_IG_COLUMNS'
 order by column_id;

prompt === Live Schedule Cancel target ===
select page_id, button_name, redirect_url
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 415
   and button_name = 'CANCEL';

prompt === Back / Cancel / Return controls that still use Clear Cache ===
select page_id, page_name, button_name, redirect_url
  from apex_application_page_buttons
 where application_id = 105
   and regexp_like(button_name, '(BACK|CANCEL|RETURN)', 'i')
   and regexp_like(redirect_url, ':[0-9]+:&(APP_)?SESSION[.]?::&DEBUG[.]?:[0-9]+', 'i')
 order by page_id, button_name;

exit
