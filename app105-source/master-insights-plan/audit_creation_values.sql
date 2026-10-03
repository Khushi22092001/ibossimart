set define off
set sqlformat csv
set long 20000
connect -name IMART
select trigger_name,trigger_body from user_triggers where table_name in ('ITEM','PARTY','CITY');
select creator,count(*) records,count(creationtime) dated,min(creationtime),max(creationtime) from item group by creator;
select page_id,identity_column from imart_mr_register where identity_column is null;
select r.page_id,c.table_name,r.identity_column from imart_mr_register r join imart_mr_catalog c on c.module_code=r.module_code where not exists(select 1 from user_tab_columns u where u.table_name=upper(c.table_name) and u.column_name=upper(r.identity_column));
exit
