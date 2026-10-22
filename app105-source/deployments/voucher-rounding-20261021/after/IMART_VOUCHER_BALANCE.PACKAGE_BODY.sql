package body IMART_VOUCHER_BALANCE as
 type ids is table of number index by varchar2(100);
 g_ids ids;
 g_new_ids ids;
 g_depth pls_integer:=0;
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

 function posting_scope_active return boolean is begin return g_depth>0;end;
 procedure mark_new(p_tno number) is
 begin
  if g_depth>0 and p_tno is not null then g_new_ids(to_char(p_tno,'TM9','NLS_NUMERIC_CHARACTERS=''.,''')):=p_tno;end if;
 end;
 procedure assert_totals(p_tno number,p_debit number,p_credit number,p_debit_rows number,p_credit_rows number,p_bad_rows number default 0,p_voucher_no varchar2 default null) is
 begin
  if nvl(p_debit_rows,0)=0 or nvl(p_credit_rows,0)=0 or nvl(p_debit,0)<=0 or nvl(p_credit,0)<=0
     or nvl(p_bad_rows,0)>0 or abs(nvl(p_debit,0)-nvl(p_credit,0))>.0051 or round(nvl(p_debit,0),2)<>round(nvl(p_credit,0),2) then
   raise_application_error(-20083,'Voucher '||nvl(p_voucher_no,to_char(p_tno))||' is incomplete or unbalanced. Debit='||nvl(p_debit,0)||', Credit='||nvl(p_credit,0)||'. Both sides must be present and equal. Posting was rejected.');
  end if;
 end;
 procedure assert_voucher(p_tno number) is
  v_id number; v_no voucher.voucherno%type; dr number; cr number; dr_rows number; cr_rows number; bad_rows number; fractional_rows number;
 begin
  begin select tno,voucherno into v_id,v_no from voucher where tno=p_tno for update;
   exception when no_data_found then return;end;
  select nvl(sum(case when amount<0 then -amount else 0 end),0),
         nvl(sum(case when amount>0 then amount else 0 end),0),
         count(case when amount<0 then 1 end),count(case when amount>0 then 1 end),
         count(case when amount is null or accountcode is null then 1 end),
         count(case when amount<>round(amount,2) then 1 end)
    into dr,cr,dr_rows,cr_rows,bad_rows,fractional_rows from voucherdetail where tno=p_tno;
  assert_totals(p_tno,dr,cr,dr_rows,cr_rows,bad_rows,v_no);
  if fractional_rows>0 or dr<>cr then
   raise_application_error(-20085,'Voucher '||nvl(v_no,to_char(p_tno))||' must contain only 2-decimal ledger amounts and exactly equal Debit/Credit totals. Posting rejected.');
  end if;
 end;
 procedure finalize_new(p_tno number) is
  dr number;cr number;dr_rows number;cr_rows number;bad_rows number;v_no voucher.voucherno%type;
  type rowids is table of rowid index by pls_integer;
  dr_ids rowids;cr_ids rowids;
  da sys.odcinumberlist:=sys.odcinumberlist();ca sys.odcinumberlist:=sys.odcinumberlist();
  dr_rounded sys.odcinumberlist;cr_rounded sys.odcinumberlist;
 begin
  begin select voucherno into v_no from voucher where tno=p_tno for update;
   exception when no_data_found then return;end;
  -- Reject genuine source mismatches before reconciling only fractional cents.
  select nvl(sum(case when amount<0 then -amount else 0 end),0),
         nvl(sum(case when amount>0 then amount else 0 end),0),
         count(case when amount<0 then 1 end),count(case when amount>0 then 1 end),
         count(case when amount is null or accountcode is null then 1 end)
   into dr,cr,dr_rows,cr_rows,bad_rows from voucherdetail where tno=p_tno;
  assert_totals(p_tno,dr,cr,dr_rows,cr_rows,bad_rows,v_no);
  for r in(select rowid rid,amount from voucherdetail where tno=p_tno and amount<>0 order by serialno nulls last,sno nulls last,rowid for update)loop
   if r.amount<0 then da.extend;da(da.count):=-r.amount;dr_ids(da.count):=r.rid;
   else ca.extend;ca(ca.count):=r.amount;cr_ids(ca.count):=r.rid;end if;
  end loop;
  dr_rounded:=round_side(da);cr_rounded:=round_side(ca);
  -- Existing row triggers maintain balances and preserve all freeze/settlement restrictions.
  -- Settled rows requiring any change remain blocked by IMART_ALLOC_LEDGER_BUD.
  for i in 1..da.count loop
   if da(i)<>dr_rounded(i) then update voucherdetail set amount=-dr_rounded(i) where rowid=dr_ids(i) and tno=p_tno;end if;
  end loop;
  for i in 1..ca.count loop
   if ca(i)<>cr_rounded(i) then update voucherdetail set amount=cr_rounded(i) where rowid=cr_ids(i) and tno=p_tno;end if;
  end loop;
 end;
 function begin_scope return pls_integer is prior_depth pls_integer:=g_depth;
 begin
  if g_depth=0 then g_ids.delete;g_new_ids.delete;end if;
  g_depth:=g_depth+1;return prior_depth;
 end;
 procedure touch(p_tno number) is
 begin
  if g_depth>0 and p_tno is not null then g_ids(to_char(p_tno,'TM9','NLS_NUMERIC_CHARACTERS=''.,''')):=p_tno;end if;
 end;
 procedure end_scope(p_prior_depth pls_integer) is key_text varchar2(100);
 begin
  if p_prior_depth is null or g_depth<>p_prior_depth+1 then raise_application_error(-20084,'Voucher posting scope mismatch. Posting rejected.');end if;
  -- Keep scope active during finalization. Nested calls must finish assembling first.
  if p_prior_depth=0 then
   key_text:=g_ids.first;
   while key_text is not null loop
    if g_new_ids.exists(key_text) then finalize_new(g_ids(key_text));end if;
    assert_voucher(g_ids(key_text));key_text:=g_ids.next(key_text);
   end loop;
   g_ids.delete;g_new_ids.delete;
  end if;
  g_depth:=p_prior_depth;
 end;
 procedure abort_scope(p_prior_depth pls_integer) is
 begin
  g_depth:=greatest(nvl(p_prior_depth,0),0);
  if g_depth=0 then g_ids.delete;g_new_ids.delete;end if;
 end;
end;
