whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 200 lines 240 trimspool on
connect -name IMART

select template_id, template_name, template_type
from apex_application_templates
where application_id = 105
  and upper(template_type) like '%REPORT%'
order by template_name;

select page_id, region_name, template_id, source_type, report_template_id
from apex_application_page_regions
where application_id = 105
  and page_id in (253,504,721)
order by page_id, display_sequence;

select column_name
from all_tab_columns
where table_name = 'APEX_APPLICATION_PAGE_REGIONS'
  and column_name like '%TEMPLATE%'
order by column_id;

exit
