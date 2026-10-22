WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SPOOL test-pure.log
SET TRANSACTION READ ONLY;
declare

 n pls_integer:=0;eligible pls_integer:=0;rejected pls_integer:=0;prod pls_integer:=0;
 da sys.odcinumberlist;ca sys.odcinumberlist;d sys.odcinumberlist;c sys.odcinumberlist;
 dr number;cr number;rd number;rc number;
 function round_side(p_amounts sys.odcinumberlist) return sys.odcinumberlist is
  result sys.odcinumberlist:=sys.odcinumberlist();
  type used_set is table of boolean index by pls_integer;
  used used_set;
  raw_total number:=0; rounded_total number:=0; cents pls_integer; direction pls_integer;
  best pls_integer; remainder number; best_remainder number;
 begin
  if p_amounts.count=0 then return result;end if;
  result.extend(p_amounts.count);
  for i in 1..p_amounts.count loop
   if p_amounts(i) is null or p_amounts(i)<0 then raise_application_error(-20085,'Voucher rounding needs nonnegative non-null side amounts.');end if;
   result(i):=round(p_amounts(i),2);raw_total:=raw_total+p_amounts(i);rounded_total:=rounded_total+result(i);
  end loop;
  cents:=round((round(raw_total,2)-rounded_total)*100);
  while cents<>0 loop
   direction:=case when cents>0 then 1 else -1 end;best:=null;
   for i in 1..p_amounts.count loop
    remainder:=p_amounts(i)-round(p_amounts(i),2);
    if not used.exists(i) and remainder*direction>0 and result(i)+direction*.01>=0 then
     if best is null or remainder*direction>best_remainder*direction then best:=i;best_remainder:=remainder;end if;
    end if;
   end loop;
   if best is null then raise_application_error(-20085,'Voucher rounding could not distribute cents safely. Posting rejected.');end if;
   result(best):=result(best)+direction*.01;used(best):=true;cents:=cents-direction;
  end loop;
  return result;
 end;

 procedure check_side(a sys.odcinumberlist) is r sys.odcinumberlist;s number:=0;t number:=0;
 begin
  r:=round_side(a);
  for i in 1..a.count loop
   s:=s+a(i);t:=t+r(i);
   if r(i)<>round(r(i),2) or r(i)<0 or abs(r(i)-round(a(i),2))>.01 then raise_application_error(-20991,'Invalid line rounding');end if;
   if a(i)=round(a(i),2) and a(i)<>r(i) then raise_application_error(-20991,'Exact-cent line was changed');end if;
  end loop;
  if t<>round(s,2) then raise_application_error(-20991,'Side total changed');end if;n:=n+1;
 end;
begin
 check_side(sys.odcinumberlist());
 check_side(sys.odcinumberlist(0,1,1.23,999999999.99));
 check_side(sys.odcinumberlist(1.005,1.005,3));
 check_side(sys.odcinumberlist(1.004,1.004,3));
 check_side(sys.odcinumberlist(.001,.002,.003,.004));
 check_side(sys.odcinumberlist(.005,.005,.005,.005));
 check_side(sys.odcinumberlist(123.12345678901234567890123456789012345,.87654321098765432109876543210987655));
 begin d:=round_side(sys.odcinumberlist(-1));raise_application_error(-20991,'Negative input accepted');
 exception when others then if sqlcode<>-20085 then raise;end if;end;
 begin d:=round_side(sys.odcinumberlist(null));raise_application_error(-20991,'Null input accepted');
 exception when others then if sqlcode<>-20085 then raise;end if;end;
 for v in(select v.tno,v.modulecode from voucher v where exists(select 1 from voucherdetail x where x.tno=v.tno and x.amount<>round(x.amount,2)) order by v.tno)loop
  da:=sys.odcinumberlist();ca:=sys.odcinumberlist();dr:=0;cr:=0;rd:=0;rc:=0;
  for l in(select amount from voucherdetail where tno=v.tno and amount<>0 order by serialno nulls last,sno nulls last,rowid)loop
   if l.amount<0 then da.extend;da(da.count):=-l.amount;dr:=dr-l.amount;
   else ca.extend;ca(ca.count):=l.amount;cr:=cr+l.amount;end if;
  end loop;
  if abs(dr-cr)>.0051 or round(dr,2)<>round(cr,2) or da.count=0 or ca.count=0 then
   rejected:=rejected+1;dbms_output.put_line('SOURCE_MISMATCH TNO='||v.tno||' MODULE='||v.modulecode||' DR='||dr||' CR='||cr);
  else
   check_side(da);check_side(ca);d:=round_side(da);c:=round_side(ca);
   for i in 1..d.count loop rd:=rd+d(i);end loop;
   for i in 1..c.count loop rc:=rc+c(i);end loop;
   if rd<>rc then raise_application_error(-20991,'Replay unbalanced '||v.tno);end if;
   eligible:=eligible+1;if v.modulecode='PRODUCTION' then prod:=prod+1;end if;
  end if;
 end loop;
 dbms_output.put_line('PASS pure side tests='||n||'; replayed balanced vouchers='||eligible||'; Production='||prod||'; pre-existing source mismatches rejected='||rejected);
end;
/
ROLLBACK;
SPOOL OFF
EXIT
