whenever sqlerror exit sql.sqlcode rollback
set long 100000
set longchunksize 100000
set pagesize 500
connect -name IMART

select inline_css
  from apex_260100.apex_application_pages
 where application_id = 105
   and page_id = 143;

exit
