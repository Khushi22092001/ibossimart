trigger IMART_VB_CAPTURE_HEADER
after insert or update or delete on VOUCHER for each row
begin
 IMART_VOUCHER_BALANCE.touch(:old.tno);IMART_VOUCHER_BALANCE.touch(:new.tno);
end;
