set pagesize 200
set linesize 32767
set long 100000
set longchunksize 100000
set trimspool on
connect -name IMART

select javascript_file_urls, css_file_urls, nav_list_template_options
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select id, name, dbms_lob.substr(html_page_header, 12000, 1) as page_header
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and security_group_id = 4744311978888504
   and id in (0, 1, 9999)
 order by id;

exit
