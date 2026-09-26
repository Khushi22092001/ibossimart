whenever sqlerror exit failure rollback
connect -name IMART
set heading off feedback off pagesize 0

select case
         when inline_css like '%User Privilege form only:%'
          and javascript_code_onload like '%buildUserPrivilegeLayout%'
         then 'PAGE136_SCOPED_CLEAN_LAYOUT_OK'
         else 'PAGE136_SCOPED_CLEAN_LAYOUT_MISSING'
       end
  from apex_application_pages
 where application_id = 105
   and page_id = 136;

select 'PAGE136_COMPONENT_COUNTS=' ||
       (select count(*) from apex_application_page_items
         where application_id = 105 and page_id = 136) || '/' ||
       (select count(*) from apex_application_page_buttons
         where application_id = 105 and page_id = 136) || '/' ||
       (select count(*) from apex_application_page_da
         where application_id = 105 and page_id = 136)
  from dual;

exit
