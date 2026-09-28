whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
declare
  l_tno number := null; l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number;
  procedure add_error(p varchar2) is begin l_count:=l_count+1; end;
  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;
begin
  update salesenquirydetail d set (footeramount,totalamount)=(select nvl(sum(f.footervalue),0),nvl(d.amount,0)+nvl(sum(f.footervalue),0) from salesenquirydetailfooter f where f.tno=d.tno and f.sno=d.sno) where 1=0;
  update salesenquiry h set (sumofamount,sumoffooteramount,salesenquiryamount)=(select nvl(sum(d.amount),0),nvl(sum(d.footeramount),0),nvl(sum(d.totalamount),0) from salesenquirydetail d where d.tno=h.tno) where 1=0;
  for d in (select d.*,i.measuringunitcode2 unit2,nvl((select sum(f.footervalue) from salesenquirydetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs from salesenquirydetail d join item i on i.itemcode=d.itemcode where d.tno=l_tno) loop
    l_amount:=nvl(d.rate,0)*case when d.unit2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(d.unit2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end;
    l_footer:=d.fs;
    if different(d.amount,l_amount,.01) or different(d.footeramount,l_footer,.01) or different(d.totalamount,l_amount+l_footer,.01) then add_error('mismatch'); end if;
  end loop;
  rollback;
end;
/
prompt SALESENQUIRY_FINAL_SAVE_INTEGRITY_SQL_COMPILED
exit
