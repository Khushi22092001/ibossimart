whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 260 trimspool on feedback on verify off

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
