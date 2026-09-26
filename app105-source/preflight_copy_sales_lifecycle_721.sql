whenever sqlerror exit failure rollback
set define off
set pagesize 500 linesize 260 trimspool on
connect -name IMART
column page_name format a70
select application_id,page_id,page_name
  from apex_application_pages
 where application_id=105
   and page_id in (4,132,133,155,160,161,167,168,170,171,174,175,182,274,701,702,704,705,721)
 order by page_id;
select case when exists (
         select 1 from apex_application_pages where application_id=105 and page_id=721
       ) then 'PAGE_721_CONFLICT' else 'PAGE_721_AVAILABLE' end copy_status
  from dual;
exit
