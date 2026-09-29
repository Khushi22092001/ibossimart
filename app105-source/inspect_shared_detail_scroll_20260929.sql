whenever sqlerror exit sql.sqlcode rollback
set define off pagesize 300 linesize 240
connect -name IMART
column page_name format a34
column region_name format a26
column static_id format a24
select p.page_id, s.page_name, p.region_name, p.static_id, p.source_type
  from apex_application_page_regions p
  join apex_application_pages s on s.application_id=p.application_id and s.page_id=p.page_id
 where p.application_id=105
   and (regexp_like(p.region_name, 'detail', 'i') or p.source_type='Interactive Grid')
 order by p.page_id, p.display_sequence;
select css_file_urls, javascript_file_urls from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
