whenever sqlerror exit failure rollback
connect -name IMART
set define off
set pagesize 100
set linesize 220

prompt === State-clearing Back/Cancel/Return controls ===
select page_id, page_name, button_name, redirect_url
  from apex_application_page_buttons
 where application_id = 105
   and regexp_like(button_name, '(BACK|CANCEL|RETURN)', 'i')
   and regexp_like(redirect_url, ':[0-9]+:&(APP_)?SESSION[.]?::&DEBUG[.]?:[0-9]+', 'i')
 order by page_id, button_name;

prompt === Register-return branches that contain a report reset ===
select page_id, page_name, branch_name, branch_action
  from apex_application_page_branches
 where application_id = 105
   and regexp_like(branch_action,
       '(^|[^0-9])(68|107|129|137|139|142|145|147|151|160|167|170|174|194|207|212|216|220|229|243|245|265|283|291|293|294|295|304|316|349|351|375|414|417|419|644|707|709|711)([^0-9]|$)')
   and regexp_like(branch_action, ':(RR|CR|RP)(,|:)', 'i')
 order by page_id, branch_name;

exit
