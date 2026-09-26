set pagesize 1000 linesize 240 feedback off
connect -name IMART
select table_name,
       max(case when column_name='PANEL' then 'Y' end) panel,
       max(case when column_name='COMPANYCODE' then 'Y' end) companycode,
       max(case when column_name='LOCATIONCODE' then 'Y' end) locationcode,
       max(case when column_name='PARTYCODE' then 'Y' end) partycode
from user_tab_columns
where table_name in ('PURCHASEORDER','PURCHASEBILL','MATERIALIN','GRN','PBPASS','VOUCHER','ENQUIRY','QUOTATION','FREIGHTADVICE')
group by table_name
order by table_name;

select owner, object_name, object_type
from all_objects
where object_name in ('PARTYCURRENTCLOSING','ITEMTREE')
order by owner,object_name;
exit
