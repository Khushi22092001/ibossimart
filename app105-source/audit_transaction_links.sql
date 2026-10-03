set define off
set long 30000
set linesize 220
set pagesize 1000
connect -name IMART
spool app105-source/transaction_links.txt
select table_name,column_name,data_type from user_tab_columns where table_name in('PURCHASEBILLGRNDETAIL','MATERIALINDETAIL','GRN','DINSPECTION','INDENT','DOCUMENTSTATUSDETAIL','PBPASS','VOUCHERDETAIL','VOUCHER') order by table_name,column_id;
select text from user_source where upper(text) like '%SANCTIONDATE%' or (upper(text) like '%INDENT%' and upper(text) like '%APPROV%') fetch first 80 rows only;
select grnstatus,count(*) from gateinregister_view group by grnstatus;
spool off
exit
