whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
begin
    update ccinvoicedetail d
       set (footeramount,totalamount) = (
           select nvl(sum(f.footervalue),0),
                  nvl(d.amount,0) + nvl(sum(f.footervalue),0)
             from ccinvoicedetailfooter f
            where f.tno=d.tno and f.sno=d.sno
       )
     where 1=0;
    rollback;
end;
/
prompt CCINVOICE_FINAL_SAVE_DETAIL_SYNC_SQL_COMPILED
exit
