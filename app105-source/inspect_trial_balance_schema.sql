connect -name IMART
set pagesize 500 linesize 240 trimspool on
column table_name format a24
column column_name format a30
column data_type format a20
select table_name, column_id, column_name, data_type, data_length
  from user_tab_columns
 where table_name in ('FINANCIALYEAR','VOUCHER','VOUCHERDETAIL','OPENING','PARTY','COMPANY','LOCATION')
 order by table_name, column_id;

prompt === existing relevant pages ===
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and (upper(page_name) like '%TRIAL%BALANCE%'
        or upper(page_name) like '%ACCOUNT%LEDGER%'
        or upper(page_alias) like '%TRIAL%BALANCE%')
 order by page_id;

prompt === row counts ===
select 'PARTY' object_name, count(*) row_count from party
union all select 'OPENING', count(*) from opening
union all select 'VOUCHER', count(*) from voucher
union all select 'VOUCHERDETAIL', count(*) from voucherdetail;
exit
