TRIGGER "VOUCHERDETAILBI"
  Before Insert or update On VoucherDetail
  For Each Row
Begin
  --If :new.CompanyCode Is Null Then

    Declare
      Cursor cVoucher Is
        Select a.CompanyCode,a.voucherdate From Voucher a Where a.TNO = :new.TNo;
      vVoucher cVoucher%Rowtype;
    Begin
      Open cVoucher;
      Fetch cVoucher
        Into vVoucher;
      If cVoucher%Found Then
        :new.CompanyCode := vVoucher.CompanyCode;
        :new.voucherdate := vVoucher.voucherdate;
      End If;
      Close cVoucher;
    End;

  --End If;
End;
