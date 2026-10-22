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
