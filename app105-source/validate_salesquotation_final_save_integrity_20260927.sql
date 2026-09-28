whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
declare
  l_tno number := null;
  l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number;
  l_sa number:=0; l_sf number:=0; l_st number:=0;
  procedure add_error(p varchar2) is begin l_count:=l_count+1; if l_count<=8 then l_errors:=l_errors||case when l_errors is null then null else ' | ' end||p; end if; end;
  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;
begin
  update salesquotationdetail d
     set (footeramount,totalamount) = (
         select nvl(sum(f.footervalue),0),nvl(d.amount,0)+nvl(sum(f.footervalue),0)
           from salesquotationdetailfooter f where f.tno=d.tno and f.sno=d.sno)
   where 1=0;
  update salesquotation h
     set (sumofamount,sumoffooteramount,salesquotationamount) = (
         select nvl(sum(d.amount),0),nvl(sum(d.footeramount),0),nvl(sum(d.totalamount),0)
           from salesquotationdetail d where d.tno=h.tno)
   where 1=0;
  for d in (select d.*,i.measuringunitcode2 unit2,
                    nvl((select sum(f.footervalue) from salesquotationdetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs
               from salesquotationdetail d join item i on i.itemcode=d.itemcode
              where d.tno=l_tno order by d.sno) loop
    l_amount:=nvl(d.rate,0)*case when d.unit2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(d.unit2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end;
    l_footer:=d.fs;
    if different(d.amount,l_amount,.01) then add_error('amount'); end if;
    if different(d.footeramount,l_footer,.01) then add_error('footer'); end if;
    if different(d.totalamount,l_amount+l_footer,.01) then add_error('total'); end if;
  end loop;
  rollback;
end;
/
prompt SALESQUOTATION_FINAL_SAVE_INTEGRITY_SQL_COMPILED
exit
