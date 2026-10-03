set pagesize 50
set linesize 220
connect -name IMART

select app_user, count(*) as cached_pages, max(refreshed_at) as refreshed_at
  from imart_home_popular_cache
 group by app_user
 order by app_user;

select job_name, enabled, state
  from user_scheduler_jobs
 where job_name = 'IMART_HOME_POPULAR_CACHE_REFRESH';

exit
