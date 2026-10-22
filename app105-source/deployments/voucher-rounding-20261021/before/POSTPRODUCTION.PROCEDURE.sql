procedure POSTPRODUCTION(pProductionTNo Number) IS
 /* IMART_PER_VOUCHER_BALANCE_20261010 */
 l_vb_depth pls_integer; l_vb_started boolean:=false; l_vb_savepoint boolean:=false;
 procedure imart_run_original is

Procedure run_native(pProductionTNo Number) Is

  tSerialNo   Number := 0;
  tVoucherTNo Number;

  tTotalFGAmount Number;
  tTotalFGQty    Number;
  tFGRate        Number;

  tTotalRMCost Number;
  tTotalRMQty  Number;

Begin

  For vProduction In (Select a.TNo,
                             a.CompanyCode,
                             a.FinancialYearCode,
                             a.LocationCode,
                             a.ProductionNo,
                             a.ProductionDate
                        From Production a
                       Where a.TNo = pProductionTNo
                         And Not Exists
                       (Select aa.tno
                                From Voucher aa
                               Where aa.moduletno = a.tno)) Loop
    --
    Select globaltno.nextval Into tVoucherTNo From dual;
    --
    Insert Into Voucher
      (TNo,
       DocTypeCode,
       LocationCode,
       CompanyCode,
       FinancialYearCode,
       VoucherNo,
       VoucherDate,
       ModuleCode,
       ModuleTNo,
       Narration)
    Values
      (tVoucherTNo,
       'JOURNAL',
       vProduction.LocationCode,
       vProduction.CompanyCode,
       vProduction.FinancialYearCode,
       vProduction.ProductionNo,
       vProduction.ProductionDate,
       'PRODUCTION',
       vProduction.TNo,
       'Being debite towards Production No ' || vProduction.ProductionNo);
    --
    Select Sum(e.Quantity1), Sum(e.Quantity1 * f.Rate)
      Into tTotalRMQty, tTotalRMCost
      From Production               a,
           ProductionRaw            c,
           ProductionRawStockDetail e,
           Stock                    f
     Where a.TNo = pProductionTNo
       And a.TNO = c.TNo
       And c.TNo = e.TNo
       And c.SNo = e.SNo
       And e.StockTNo = f.TNo;
    ---------
    tTotalFGAmount := nvl(tTotalRMCost, 0);
    ----
    Select Sum(x.Quantity1)
      Into tTotalFGQty
      From ProductionFinished x
     Where x.TNo = pProductionTNo;
    --
    If tTotalFGQty > 0 Then
      tFGRate := tTotalFGAmount / tTotalFGQty;
    End If;
    --
    mytestlog('aaaaa pProductionTNo ' || pProductionTNo ||
              '  tTotalFGAmount=' || tTotalFGAmount || '  tTotalFGQty= ' ||
              tTotalFGQty || '  tFGRate ' || tFGRate);

    For vFG In (Select x.ItemCode,
                       x.ItemSpecificationCode,
                       y.StockAccountCode,
                       y.ConsumptionAccountCode,
                       Sum(z.Quantity1) As Qty,
                       Sum(z.Quantity1 * tFGRate) As Amount
                  From ProductionFinished       x,
                       Item                     y,
                       ProductionFinishedDetail z
                 Where x.tno = vProduction.TNo
                   And x.ItemCode = y.ItemCode
                   And x.tno = z.tno
                   And x.sno = z.sno
                 Group By x.ItemCode,
                          x.ItemSpecificationCode,
                          y.StockAccountCode,
                          y.ConsumptionAccountCode
                Having Sum(z.Quantity1 * tFGRate) > 0
                ------
                ) Loop
      --
      tSerialNo := tSerialNo + 1;
      --
      Insert Into VoucherDetail
        (TNo,
         SNo,
         SerialNo,
         LocationCode,
         AccountCode,
         Amount,
         VoucherDate,
         Narration)
      Values
        (tVoucherTNo,
         globaltno.nextval,
         tSerialNo,
         vProduction.LocationCode,
         vFG.StockAccountCode,
         -1 * vFG.Amount,
         vProduction.ProductionDate,
         'Finish Item ' || GetItemName(vFG.ItemCode) || ' - ' ||
         getItemSpecificationName(vFG.ItemCode, vFG.ItemSpecificationCode) ||
         ' Qty ' || vFG.Qty);
      --
      tSerialNo := tSerialNo + 1;
      --
      Insert Into VoucherDetail
        (TNo,
         SNo,
         SerialNo,
         LocationCode,
         AccountCode,
         Amount,
         VoucherDate,
         Narration)
      Values
        (tVoucherTNo,
         globaltno.nextval,
         tSerialNo,
         vProduction.LocationCode,
         vFG.ConsumptionAccountCode,
         vFG.Amount,
         vProduction.ProductionDate,
         'Finish Item ' || GetItemName(vFG.ItemCode) || ' - ' ||
         getItemSpecificationName(vFG.ItemCode, vFG.ItemSpecificationCode) ||
         ' Qty ' || vFG.Qty);
      --
      Update Stock a
         Set a.Rate = tFGRate, a.Amount = A.STOCKQUANTITY1 * tFGRate
       Where a.StockModuleTNo = vProduction.TNo
         And a.ItemCode = vFG.ItemCode
         And a.ItemSpecificationCode = vFG.ItemSpecificationCode;
      --
    End Loop; -- vFG
    --
    --

    For vRM In (Select c.ItemCode,
                       c.ItemSpecificationCode,
                       g.StockAccountCode,
                       g.ConsumptionAccountCode,
                       Sum(e.Quantity1) As Quantity1,
                       Sum(e.Quantity1 * f.Rate) As Amount
                  From Production               a,
                       ProductionRaw            c,
                       ProductionRawStockDetail e,
                       Stock                    f,
                       Item                     g
                 Where a.TNo = pProductionTNo
                   And a.TNO = c.TNo
                   And c.TNo = e.TNo
                   And c.SNo = e.SNo
                   And e.StockTNo = f.TNo
                   And f.ItemCode = g.ItemCode
                 Group By c.ItemCode,
                          c.ItemSpecificationCode,
                          g.StockAccountCode,
                          g.ConsumptionAccountCode) Loop
      --
      tSerialNo := tSerialNo + 1;
      --
      Insert Into VoucherDetail
        (TNo,
         SNo,
         SerialNo,
         LocationCode,
         AccountCode,
         Amount,
         VoucherDate,
         Narration)
      Values
        (tVoucherTNo,
         globaltno.nextval,
         tSerialNo,
         vProduction.LocationCode,
         vRM.ConsumptionAccountCode,
         -1 * vRM.Amount,
         vProduction.ProductionDate,
         'RM Item ' || GetItemName(vRM.ItemCode) || ' - ' ||
         getItemSpecificationName(vRM.ItemCode, vRM.ItemSpecificationCode) ||
         ' Qty ' || vRM.Quantity1);
      --
      tSerialNo := tSerialNo + 1;
      --
      Insert Into VoucherDetail
        (TNo,
         SNo,
         SerialNo,
         LocationCode,
         AccountCode,
         Amount,
         VoucherDate,
         Narration)
      Values
        (tVoucherTNo,
         globaltno.nextval,
         tSerialNo,
         vProduction.LocationCode,
         vRM.StockAccountCode,
         vRM.Amount,
         vProduction.ProductionDate,
         'RM Item ' || GetItemName(vRM.ItemCode) || ' - ' ||
         getItemSpecificationName(vRM.ItemCode, vRM.ItemSpecificationCode) ||
         ' Qty ' || vRM.Quantity1);
      --
    --
    End Loop; --vRM
  --

  End Loop; -- for vProduction
End;

begin
 savepoint imart_guarded_post;
 IMART_BUSINESS_GUARD.lock_document('PRODUCTION',pProductionTNo);
 -- A service charge is not physical finished material; preserve draft editing.
 for service_row in (
   select f.ItemCode,i.ItemName from ProductionFinished f join Item i on i.ItemCode=f.ItemCode
    where f.TNo=pProductionTNo and i.ItemNatureCode='SERVICES'
      and (nvl(f.Quantity1,0)>0 or exists(select 1 from ProductionFinishedDetail fd where fd.TNo=f.TNo and fd.SNo=f.SNo and nvl(fd.Quantity1,0)>0))
 ) loop
   raise_application_error(-20000,'Service item '||service_row.ItemName||' cannot be produced as stock. Select a material in Output Detail.');
 end loop;


 run_native(pProductionTNo);
 IMART_BUSINESS_GUARD.assert_posting('PRODUCTION',pProductionTNo);
exception when others then rollback to imart_guarded_post;raise;
END imart_run_original;
BEGIN
 begin savepoint VB_7F55E982A0AD98BB; l_vb_savepoint:=true;exception when others then if sqlcode<>-4092 then raise;end if;end;
 l_vb_depth:=IMART_VOUCHER_BALANCE.begin_scope;l_vb_started:=true;
 imart_run_original;
 IMART_VOUCHER_BALANCE.end_scope(l_vb_depth);l_vb_started:=false;
EXCEPTION WHEN OTHERS THEN
 if l_vb_started then IMART_VOUCHER_BALANCE.abort_scope(l_vb_depth);end if;
 if l_vb_savepoint then begin rollback to VB_7F55E982A0AD98BB;exception when others then if sqlcode<>-1086 then raise;end if;end;end if;
 raise;
END;
