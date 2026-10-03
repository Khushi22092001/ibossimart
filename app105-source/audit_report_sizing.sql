set define off
set pagesize 100
set linesize 240
set long 100000
connect -name IMART
select javascript_file_urls,css_file_urls from apex_applications where application_id=105;
select file_name from apex_application_static_files where application_id=105 and (file_name like '%theme%' or file_name like '%scroll%');
select page_id,page_name,page_alias from apex_application_pages where application_id=105 and page_id in (24,46,48,58,84,116,118,706,707,708,709,710,711,712,713,714,934);
exit
