whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 240 feedback off verify off

prompt === FD-related table columns ===
select table_name, column_name, data_type
  from user_tab_columns
 where table_name in ('QUOTATION','QUOTATIONDETAIL','QUOTATIONDETAILFOOTER')
   and column_name in ('TNO','SNO','SERIALNO','PARTYCODE','TRANSACTIONTYPECODE',
                       'ITEMSPECIFICATIONCODE','HSNCODE','AMOUNT','FOOTERAMOUNT',
                       'TOTALAMOUNT','FOOTERHEADCODE','FOOTERPERCENT','FOOTERVALUE')
 order by table_name, column_id;

prompt === Recent quotation detail rows with calculated vs stored FD ===
select * from (
  select d.tno, d.sno, d.serialno, d.itemspecificationcode, d.hsncode,
         d.amount, d.footeramount, d.totalamount,
         (select count(*) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) footer_rows,
         (select nvl(sum(f.footervalue),0) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) stored_footer
    from quotationdetail d
   order by d.tno desc, d.sno
) where rownum <= 30;

exit
