set pagesize 200
set linesize 180
connect -name IMART
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and page_id between 800 and 899
 order by page_id;
exit
