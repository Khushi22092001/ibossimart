package IMART_VOUCHER_BALANCE authid definer as
 function begin_scope return pls_integer;
 procedure touch(p_tno number);
 procedure end_scope(p_prior_depth pls_integer);
 procedure abort_scope(p_prior_depth pls_integer);
 procedure assert_voucher(p_tno number);
 procedure assert_totals(p_tno number,p_debit number,p_credit number,p_debit_rows number,p_credit_rows number,p_bad_rows number default 0,p_voucher_no varchar2 default null);
 function round_side(p_amounts sys.odcinumberlist) return sys.odcinumberlist;
 function posting_scope_active return boolean;
 procedure mark_new(p_tno number);
end;
