whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
begin
    update purchaseorderdetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0),
                  nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from purchaseorderdetailfooter f
            where f.tno=d.tno and f.sno=d.sno
       )
     where 1=0;

    update purchaseorder h
       set (sumofamount,sumoffooteramount,purchaseorderamount) = (
           select nvl(sum(d.amount),0),
                  nvl(sum(d.footeramount),0),
                  nvl(sum(d.totalamount),0)
             from purchaseorderdetail d
            where d.tno=h.tno
       )
     where 1=0;
    rollback;
end;
/
prompt PURCHASEORDER_FINAL_SAVE_DETAIL_SYNC_SQL_COMPILED
exit
