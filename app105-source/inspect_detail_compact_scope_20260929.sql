whenever sqlerror exit sql.sqlcode rollback
set define off pagesize 100 linesize 220 long 10000
connect -name IMART
select css_file_urls, javascript_file_urls
  from apex_260100.wwv_flows
 where id=105 and security_group_id=4744311978888504;
select count(distinct r.page_id) as common_tab_grid_pages
  from apex_application_page_regions r
 where r.application_id=105 and r.source_type='Interactive Grid'
   and exists (select 1 from apex_application_page_regions t
                where t.application_id=r.application_id and t.page_id=r.page_id
                  and lower(t.static_id)='tabcontainer');
select distinct p.page_id,p.page_name,r.region_name,r.static_id
  from apex_application_page_regions r
  join apex_application_pages p on p.application_id=r.application_id and p.page_id=r.page_id
 where r.application_id=105 and r.source_type='Interactive Grid'
   and r.page_id in (118,143,146,152)
 order by p.page_id,r.region_name;
exit
