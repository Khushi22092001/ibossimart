set define off
set long 100000
set linesize 200
set pagesize 1000
connect -name IMART
spool app105-source/transaction_next_stages.txt
select table_name,column_name from user_tab_columns where (table_name like 'PURCHASEBILL%' and column_name like '%GRN%') or (table_name='PBPASSDETAIL') or (table_name like '%GRN%' and column_name like '%BILL%') order by table_name,column_id;
select region_name,region_source from apex_application_page_regions where application_id=105 and page_id=378 and source_type='Interactive Report';
select region_name,region_source from apex_application_page_regions where application_id=105 and page_id=923 and source_type='Interactive Report';
spool off
exit
