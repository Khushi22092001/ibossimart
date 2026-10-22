package body IMART_VOUCHER_BALANCE as
 type ids is table of number index by varchar2(100);
 g_ids ids;
 g_depth pls_integer:=0;
 procedure assert_totals(p_tno number,p_debit number,p_credit number,p_debit_rows number,p_credit_rows number,p_bad_rows number default 0,p_voucher_no varchar2 default null) is
 begin
  if nvl(p_debit_rows,0)=0 or nvl(p_credit_rows,0)=0 or nvl(p_debit,0)<=0 or nvl(p_credit,0)<=0
     or nvl(p_bad_rows,0)>0 or abs(nvl(p_debit,0)-nvl(p_credit,0))>.0051 or round(nvl(p_debit,0),2)<>round(nvl(p_credit,0),2) then
   raise_application_error(-20083,'Voucher '||nvl(p_voucher_no,to_char(p_tno))||' is incomplete or unbalanced. Debit='||nvl(p_debit,0)||', Credit='||nvl(p_credit,0)||'. Both sides must be present and equal. Posting was rejected.');
  end if;
 end;
 procedure assert_voucher(p_tno number) is
  v_id number; v_no voucher.voucherno%type; dr number; cr number; dr_rows number; cr_rows number; bad_rows number;
 begin
  -- Deleted vouchers have no final posting to validate. Serialize final checks on existing vouchers.
  begin select tno,voucherno into v_id,v_no from voucher where tno=p_tno for update;
   exception when no_data_found then return;end;
  select nvl(sum(case when amount<0 then -amount else 0 end),0),
         nvl(sum(case when amount>0 then amount else 0 end),0),
         count(case when amount<0 then 1 end),count(case when amount>0 then 1 end),
         count(case when amount is null or accountcode is null then 1 end)
    into dr,cr,dr_rows,cr_rows,bad_rows from voucherdetail where tno=p_tno;
  assert_totals(p_tno,dr,cr,dr_rows,cr_rows,bad_rows,v_no);
 end;
 function begin_scope return pls_integer is prior_depth pls_integer:=g_depth;
 begin
  if g_depth=0 then g_ids.delete;end if;
  g_depth:=g_depth+1;return prior_depth;
 end;
 procedure touch(p_tno number) is
 begin
  if g_depth>0 and p_tno is not null then g_ids(to_char(p_tno,'TM9','NLS_NUMERIC_CHARACTERS=''.,''')):=p_tno;end if;
 end;
 procedure end_scope(p_prior_depth pls_integer) is key_text varchar2(100);
 begin
  if p_prior_depth is null or g_depth<>p_prior_depth+1 then raise_application_error(-20084,'Voucher posting scope mismatch. Posting rejected.');end if;
  g_depth:=p_prior_depth;
  -- A nested posting may still be assembling the same voucher. Validate only at its outer posting boundary.
  if g_depth=0 then
   key_text:=g_ids.first;
   while key_text is not null loop assert_voucher(g_ids(key_text));key_text:=g_ids.next(key_text);end loop;
   g_ids.delete;
  end if;
 end;
 procedure abort_scope(p_prior_depth pls_integer) is
 begin
  g_depth:=greatest(nvl(p_prior_depth,0),0);
  if g_depth=0 then g_ids.delete;end if;
 end;
end;
