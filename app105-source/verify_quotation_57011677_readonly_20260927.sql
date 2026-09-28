whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 240 trimspool on feedback on verify off

prompt === PURCHASE QUOTATION 57011677: HEADER VS DETAIL ===
select q.tno,q.quotationno,q.sumofamount,q.sumoffooteramount,q.quotationamount,
       nvl(sum(d.amount),0) detail_amount,
       nvl(sum(d.footeramount),0) detail_footer,
       nvl(sum(d.totalamount),0) detail_total
  from quotation q
  left join quotationdetail d on d.tno=q.tno
 where q.tno=57011677
 group by q.tno,q.quotationno,q.sumofamount,q.sumoffooteramount,q.quotationamount;

prompt === PURCHASE QUOTATION 57011677: LINE VS FD ===
select d.sno,d.serialno,d.itemcode,d.itemspecificationcode,d.quantity1,d.rate,d.amount,
       d.footeramount,d.totalamount,nvl(sum(f.footervalue),0) fd_total,
       d.amount+nvl(sum(f.footervalue),0) expected_total
  from quotationdetail d
  left join quotationdetailfooter f on f.tno=d.tno and f.sno=d.sno
 where d.tno=57011677
 group by d.sno,d.serialno,d.itemcode,d.itemspecificationcode,d.quantity1,d.rate,d.amount,d.footeramount,d.totalamount
 order by d.serialno,d.sno;

prompt === PURCHASE QUOTATION 57011677: TAX ROWS ===
select f.sno,f.footerheadcode,f.legendscode,f.footerpercent,f.footervalue
  from quotationdetailfooter f
 where f.tno=57011677
 order by f.sno,f.serialno;

exit
