whenever sqlerror exit failure rollback
set define off
set pagesize 500 linesize 260 trimspool on
connect -name IMART
column page_name format a70
column page_alias format a45
select application_id, page_id, page_name, page_alias
  from apex_application_pages
 where application_id in (105,107)
   and (upper(page_name) like '%SALES%LIFECYCLE%'
        or upper(page_name) like '%CONTROL%TOWER%')
 order by application_id,page_id;
exit
