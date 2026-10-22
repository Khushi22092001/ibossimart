WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET FEEDBACK OFF
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLFORMAT JSON
SET LONG 1000000
SPOOL validation.json
select name,type,line,text from user_source where name in('POSTPRODUCTION','IMART_VOUCHER_BALANCE','IMART_VB_CAPTURE_HEADER','VOUCHERDETAILBI') order by name,type,line;
select object_name,object_type,status from user_objects where status<>'VALID' or object_name in('POSTPRODUCTION','IMART_VOUCHER_BALANCE','IMART_VB_CAPTURE_HEADER','VOUCHERDETAILBI') order by object_name,object_type;
select trigger_name,status from user_triggers where table_name in('VOUCHER','VOUCHERDETAIL','DRCRALLOCATION') and trigger_name in('IMART_VB_CAPTURE_DETAIL','IMART_VB_CAPTURE_HEADER','VOUCHERDETAILBI','VOUCHERDETAILBU','IMART_ALLOC_LEDGER_BUD','IMART_DRCR_INTEGRITY');
select count(distinct tno) affected_vouchers,count(*) fractional_lines from voucherdetail where amount<>round(amount,2);
select v.tno,v.voucherno,v.modulecode,v.moduletno,to_char(v.voucherdate,'DD-MM-YYYY') voucher_date,
 to_char(sum(case when d.amount<0 then -d.amount else 0 end),'TM9') debit_exact,
 to_char(sum(case when d.amount>0 then d.amount else 0 end),'TM9') credit_exact,
 to_char(sum(d.amount),'TM9') net_exact from voucher v join voucherdetail d on d.tno=v.tno
 where v.tno in(56483080,56560351,56612802,56733813)
 group by v.tno,v.voucherno,v.modulecode,v.moduletno,v.voucherdate order by v.tno;
SPOOL OFF
SET SQLFORMAT DEFAULT
SPOOL test-deployed.log
declare
 d pls_integer;p pls_integer;x sys.odcinumberlist;good_tno number;bad_tno number;n pls_integer:=0;
 procedure expect_reject(p_dr number,p_cr number,p_dr_rows number,p_cr_rows number) is
 begin
  begin IMART_VOUCHER_BALANCE.assert_totals(-1,p_dr,p_cr,p_dr_rows,p_cr_rows);raise_application_error(-20991,'Invalid totals accepted');
  exception when others then if sqlcode<>-20083 then raise;end if;end;
  n:=n+1;
 end;
begin
 if IMART_VOUCHER_BALANCE.posting_scope_active then raise_application_error(-20991,'Scope leaked');end if;
 d:=IMART_VOUCHER_BALANCE.begin_scope;
 p:=IMART_VOUCHER_BALANCE.begin_scope;
 if d<>0 or p<>1 then raise_application_error(-20991,'Nested scope depth incorrect');end if;
 IMART_VOUCHER_BALANCE.touch(-987654321);
 IMART_VOUCHER_BALANCE.end_scope(p);
 if not IMART_VOUCHER_BALANCE.posting_scope_active then raise_application_error(-20991,'Nested scope closed early');end if;
 IMART_VOUCHER_BALANCE.end_scope(d);
 if IMART_VOUCHER_BALANCE.posting_scope_active then raise_application_error(-20991,'Scope leaked after end');end if;
 begin IMART_VOUCHER_BALANCE.end_scope(99);raise_application_error(-20991,'Scope mismatch accepted');
 exception when others then if sqlcode<>-20084 then raise;end if;end;
 d:=IMART_VOUCHER_BALANCE.begin_scope;IMART_VOUCHER_BALANCE.abort_scope(d);
 if IMART_VOUCHER_BALANCE.posting_scope_active then raise_application_error(-20991,'Abort leaked scope');end if;
 expect_reject(100,101,1,1);expect_reject(0,0,0,0);expect_reject(100,100,0,1);
 x:=IMART_VOUCHER_BALANCE.round_side(sys.odcinumberlist(1.004,1.004,3));
 if x(1)+x(2)+x(3)<>5.01 or x(3)<>3 then raise_application_error(-20991,'Deployed function total failure');end if;
 select min(tno) into good_tno from(select tno from voucherdetail group by tno having sum(amount)=0
   and count(case when amount<>round(amount,2) or amount is null or accountcode is null then 1 end)=0
   and count(case when amount<0 then 1 end)>0 and count(case when amount>0 then 1 end)>0);
 if good_tno is null then raise_application_error(-20991,'No valid voucher available');end if;
 IMART_VOUCHER_BALANCE.assert_voucher(good_tno);
 select min(tno) into bad_tno from voucherdetail where amount<>round(amount,2);
 begin IMART_VOUCHER_BALANCE.assert_voucher(bad_tno);raise_application_error(-20991,'Fractional voucher accepted');
 exception when others then if sqlcode not in(-20083,-20085) then raise;end if;end;
 dbms_output.put_line('PASS deployed package: pure rounding, nested/end/abort scope, mismatch/zero/missing-side rejection, valid-voucher acceptance, fractional-voucher rejection. No business DML.');
exception when others then IMART_VOUCHER_BALANCE.abort_scope(0);raise;
end;
/
ROLLBACK;
SPOOL OFF
EXIT
