TRIGGER "VOUCHERDETAILBI"
  Before Insert or update On VoucherDetail
  For Each Row
Begin
  -- Never silently change :NEW here: other BEFORE triggers maintain accounting balances.
  -- Scoped sources are finalized together; unscoped writers must supply currency precision.
  if not IMART_VOUCHER_BALANCE.posting_scope_active then
    if inserting or (:new.amount<>:old.amount) or (:new.amount is null and :old.amount is not null)
       or (:new.amount is not null and :old.amount is null) then
      if :new.amount<>round(:new.amount,2) then
        raise_application_error(-20085,'Voucher amount must have at most 2 decimal places. Correct the source amount and retry.');
      end if;
    end if;
  end if;
  Declare
    Cursor cVoucher Is
      Select a.CompanyCode,a.voucherdate From Voucher a Where a.TNO = :new.TNo;
    vVoucher cVoucher%Rowtype;
  Begin
    Open cVoucher;
    Fetch cVoucher Into vVoucher;
    If cVoucher%Found Then
      :new.CompanyCode := vVoucher.CompanyCode;
      :new.voucherdate := vVoucher.voucherdate;
    End If;
    Close cVoucher;
  End;
End;
