set pages 100
set lines 200
select javascript_file_urls, css_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;
exit
