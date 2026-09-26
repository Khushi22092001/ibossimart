set pages 120
set lines 220
connect -name IMART

select page_id, plug_name, static_id, region_css_classes
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 711
   and id = 462028106178989296;

select file_name, dbms_lob.getlength(file_content) as bytes, last_updated_on
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and file_name in ('hspl-theme.js', 'hspl-theme.css')
 order by file_name;

select javascript_file_urls, css_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
