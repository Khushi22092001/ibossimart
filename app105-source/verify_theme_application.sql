set pagesize 100
set linesize 250
set long 10000
select browser_cache, css_file_urls, javascript_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;
exit
