whenever sqlerror exit sql.sqlcode rollback
set define off
set linesize 250
set pagesize 100
connect -name IMART
select count(*) filters, sum(case when regexp_like(region_css_classes,'(^|[[:space:]])hspl-drawer([[:space:]]|$)') then 1 else 0 end) server_drawers from apex_260100.wwv_flow_page_plugs where flow_id=105 and security_group_id=4744311978888504 and lower(trim(plug_name)) in ('filter','filters') and plug_source_type='NATIVE_STATIC';
select css_file_urls,javascript_file_urls from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
select column_name from all_tab_columns where owner='APEX_260100' and table_name='WWV_FLOW_ACTIVITY_LOG1$' and (column_name like '%TIME%' or column_name like '%ELAPSED%' or column_name like '%PAGE%' or column_name like '%FLOW%' or column_name like '%SESSION%');
exit
