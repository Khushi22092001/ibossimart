whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

begin
    update poamendmentdetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0), nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from poamendmentdetailfooter f where f.tno=d.tno and f.sno=d.sno)
     where 1=0;

    update salesorderdetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0), nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from salesorderdetailfooter f where f.tno=d.tno and f.sno=d.sno)
     where 1=0
       and not exists (select 1 from salesorderdetail d2 where d2.tno=d.tno and d2.sno=d.sno and d2.rowid<>d.rowid);

    update salesenquirydetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0), nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from salesenquirydetailfooter f where f.tno=d.tno and f.sno=d.sno)
     where 1=0;

    update salesquotationdetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0), nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from salesquotationdetailfooter f where f.tno=d.tno and f.sno=d.sno)
     where 1=0;

    rollback;
end;
/
prompt FINAL_SAVE_DETAIL_SYNC_SQL_COMPILED
exit
