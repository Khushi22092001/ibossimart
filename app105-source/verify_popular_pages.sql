set pagesize 100
set linesize 220
connect -name IMART

select page_id, max(page_name) page_name, count(*) visit_count
  from apex_260100.apex_workspace_activity_log
 where workspace_id = 4744311978888504
   and application_id = 105
   and upper(apex_user) = 'BOSS'
   and page_id not in (0, 1)
 group by page_id
 order by count(*) desc, max(view_timestamp) desc
 fetch first 8 rows only;

select process_name, process_point
  from apex_260100.wwv_flow_processing
 where flow_id = 105
   and process_name = 'GET_POPULAR_PAGES';

exit
