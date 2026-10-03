set timing on
set pagesize 100
set linesize 220
connect -name IMART

select target_page_id as page_id,
       max(page_name) keep (dense_rank last order by view_timestamp) as page_name,
       count(*) as visit_count
  from (
    select nvl((select max(m.pageno)
                  from module m
                 where m.entrypageno = a.page_id), a.page_id) as target_page_id,
           a.page_name,
           a.view_timestamp
      from apex_260100.apex_workspace_activity_log a
     where a.workspace_id = 4744311978888504
       and a.application_id = 105
       and upper(a.apex_user) = 'BOSS'
       and a.page_id not in (0, 1)
       and a.page_name is not null
  )
 group by target_page_id
 order by count(*) desc, max(view_timestamp) desc
 fetch first 8 rows only;

exit
