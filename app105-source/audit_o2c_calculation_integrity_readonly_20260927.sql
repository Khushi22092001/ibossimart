whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 300 trimspool on feedback on verify off

prompt === SYNONYM / OWNER RESOLUTION ===
select owner, synonym_name, table_owner, table_name
  from all_synonyms
 where synonym_name in (
   'POAMENDMENTDETAIL','POAMENDMENTDETAILFOOTER',
   'SALESORDERDETAIL','SALESORDERDETAILFOOTER',
   'SALESENQUIRYDETAIL','SALESENQUIRYDETAILFOOTER',
   'SALESQUOTATIONDETAIL','SALESQUOTATIONDETAILFOOTER',
   'CCINVOICEDETAIL','CCINVOICEDETAILFOOTER',
   'PORECEIPTDETAIL','PORECEIPTDETAILFOOTER',
   'BILLRECEIPTDETAIL')
 order by synonym_name, owner;

prompt === TABLES VISIBLE TO THE APPLICATION SCHEMA ===
select owner, table_name
  from all_tables
 where table_name in (
   'POAMENDMENTDETAIL','POAMENDMENTDETAILFOOTER',
   'SALESORDERDETAIL','SALESORDERDETAILFOOTER',
   'SALESENQUIRYDETAIL','SALESENQUIRYDETAILFOOTER',
   'SALESQUOTATIONDETAIL','SALESQUOTATIONDETAILFOOTER',
   'CCINVOICEDETAIL','CCINVOICEDETAILFOOTER',
   'PORECEIPTDETAIL','PORECEIPTDETAILFOOTER',
   'BILLRECEIPTDETAIL')
 order by table_name, owner;

prompt === SALES ORDER DETAIL VS FOOTER ===
select count(*) rows_checked,
       sum(case when nvl(d.footeramount,0) <> nvl(f.footeramount,0) then 1 else 0 end) footer_mismatches,
       sum(case when nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0) then 1 else 0 end) total_mismatches
  from salesorderdetail d
  left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesorderdetailfooter group by tno,sno) f
    on f.tno=d.tno and f.sno=d.sno;

prompt === SALES ENQUIRY DETAIL VS FOOTER ===
select count(*) rows_checked,
       sum(case when nvl(d.footeramount,0) <> nvl(f.footeramount,0) then 1 else 0 end) footer_mismatches,
       sum(case when nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0) then 1 else 0 end) total_mismatches
  from salesenquirydetail d
  left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesenquirydetailfooter group by tno,sno) f
    on f.tno=d.tno and f.sno=d.sno;

prompt === SALES QUOTATION DETAIL VS FOOTER ===
select count(*) rows_checked,
       sum(case when nvl(d.footeramount,0) <> nvl(f.footeramount,0) then 1 else 0 end) footer_mismatches,
       sum(case when nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0) then 1 else 0 end) total_mismatches
  from salesquotationdetail d
  left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesquotationdetailfooter group by tno,sno) f
    on f.tno=d.tno and f.sno=d.sno;

prompt === PO AMENDMENT DETAIL VS FOOTER ===
select count(*) rows_checked,
       sum(case when nvl(d.footeramount,0) <> nvl(f.footeramount,0) then 1 else 0 end) footer_mismatches,
       sum(case when nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0) then 1 else 0 end) total_mismatches
  from poamendmentdetail d
  left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from poamendmentdetailfooter group by tno,sno) f
    on f.tno=d.tno and f.sno=d.sno;

prompt === NEWEST MISMATCH SAMPLES ===
select * from (
  select 'SALESORDER' document_type,d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0) calculated_footer,d.totalamount
    from salesorderdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesorderdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where nvl(d.footeramount,0) <> nvl(f.footeramount,0) or nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0)
  union all
  select 'SALESENQUIRY',d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0),d.totalamount
    from salesenquirydetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesenquirydetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where nvl(d.footeramount,0) <> nvl(f.footeramount,0) or nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0)
  union all
  select 'SALESQUOTATION',d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0),d.totalamount
    from salesquotationdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesquotationdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where nvl(d.footeramount,0) <> nvl(f.footeramount,0) or nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0)
  union all
  select 'POAMENDMENT',d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0),d.totalamount
    from poamendmentdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from poamendmentdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where nvl(d.footeramount,0) <> nvl(f.footeramount,0) or nvl(d.totalamount,0) <> nvl(d.amount,0)+nvl(d.footeramount,0)
) order by tno desc fetch first 30 rows only;

prompt === DUPLICATE DETAIL IDENTITIES (TNO,SNO) ===
select 'SALESORDERDETAIL' table_name, count(*) duplicate_keys, sum(row_count) rows_in_duplicate_keys
  from (select tno,sno,count(*) row_count from salesorderdetail group by tno,sno having count(*) > 1)
union all
select 'SALESENQUIRYDETAIL', count(*), sum(row_count)
  from (select tno,sno,count(*) row_count from salesenquirydetail group by tno,sno having count(*) > 1)
union all
select 'SALESQUOTATIONDETAIL', count(*), sum(row_count)
  from (select tno,sno,count(*) row_count from salesquotationdetail group by tno,sno having count(*) > 1)
union all
select 'POAMENDMENTDETAIL', count(*), sum(row_count)
  from (select tno,sno,count(*) row_count from poamendmentdetail group by tno,sno having count(*) > 1);

prompt === LATEST DUPLICATE SALES ORDER DETAILS ===
select * from (
  select d.tno,d.sno,count(*) duplicate_rows,
         listagg(to_char(d.amount)||'/'||to_char(d.footeramount)||'/'||to_char(d.totalamount),', ') within group(order by d.rowid) stored_amounts
    from salesorderdetail d
   group by d.tno,d.sno
  having count(*) > 1
   order by d.tno desc
) fetch first 20 rows only;

prompt === MATERIAL FOOTER / TOTAL MISMATCHES (MORE THAN ONE PAISE) ===
select * from (
  select 'SALESORDER' document_type,d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0) calculated_footer,d.totalamount
    from salesorderdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesorderdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01
      or abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01
  union all
  select 'SALESENQUIRY',d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0),d.totalamount
    from salesenquirydetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesenquirydetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01
      or abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01
  union all
  select 'SALESQUOTATION',d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0),d.totalamount
    from salesquotationdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesquotationdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01
      or abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01
  union all
  select 'POAMENDMENT',d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0),d.totalamount
    from poamendmentdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from poamendmentdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01
      or abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01
) order by tno desc fetch first 40 rows only;

prompt === MATERIAL MISMATCH COUNTS (MORE THAN ONE PAISE) ===
select 'SALESORDER' document_type,
       sum(case when abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01 then 1 else 0 end) footer_mismatches,
       sum(case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end) total_mismatches
  from salesorderdetail d left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesorderdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
union all
select 'SALESENQUIRY',sum(case when abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01 then 1 else 0 end),sum(case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end)
  from salesenquirydetail d left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesenquirydetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
union all
select 'SALESQUOTATION',sum(case when abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01 then 1 else 0 end),sum(case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end)
  from salesquotationdetail d left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesquotationdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
union all
select 'POAMENDMENT',sum(case when abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01 then 1 else 0 end),sum(case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end)
  from poamendmentdetail d left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from poamendmentdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno;

prompt === NEWEST MATERIAL SALES-QUOTATION MISMATCHES ===
select * from (
  select d.tno,d.sno,d.amount,d.footeramount,nvl(f.footeramount,0) calculated_footer,d.totalamount,d.itemcode,d.itemspecificationcode
    from salesquotationdetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from salesquotationdetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01
      or abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01
   order by d.tno desc
) fetch first 30 rows only;

exit
