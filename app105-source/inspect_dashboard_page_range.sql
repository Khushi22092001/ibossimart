whenever sqlerror exit failure rollback
set define off
set pagesize 200
set linesize 200
connect -name IMART
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and page_id between 900 and 950
 order by page_id;
exit
