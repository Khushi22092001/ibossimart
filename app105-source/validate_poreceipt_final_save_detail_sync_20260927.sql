whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
begin
    update poreceiptdetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0),
                  nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from poreceiptdetailfooter f
            where f.tno=d.tno and f.sno=d.sno
       )
     where 1=0
       and not exists (
           select 1 from poreceiptdetail x
            where x.tno=d.tno and x.sno=d.sno
           group by x.tno,x.sno
          having count(*) > 1
       );
    rollback;
end;
/
prompt PORECEIPT_FINAL_SAVE_DETAIL_SYNC_SQL_COMPILED
exit
