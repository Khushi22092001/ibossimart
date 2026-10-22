WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLBLANKLINES ON
ALTER SESSION SET DDL_LOCK_TIMEOUT=15;
SPOOL rollback.log
CREATE OR REPLACE package IMART_VOUCHER_BALANCE authid definer as
 function begin_scope return pls_integer;
 procedure touch(p_tno number);
 procedure end_scope(p_prior_depth pls_integer);
 procedure abort_scope(p_prior_depth pls_integer);
 procedure assert_voucher(p_tno number);
 procedure assert_totals(p_tno number,p_debit number,p_credit number,p_debit_rows number,p_credit_rows number,p_bad_rows number default 0,p_voucher_no varchar2 default null);
end;
/
declare n number;begin select count(*) into n from user_errors where name='IMART_VOUCHER_BALANCE' and type='PACKAGE' and attribute='ERROR';if n>0 then raise_application_error(-20990,'Compilation failed: IMART_VOUCHER_BALANCE PACKAGE');end if;end;
/
CREATE OR REPLACE package body IMART_VOUCHER_BALANCE as
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
/
declare n number;begin select count(*) into n from user_errors where name='IMART_VOUCHER_BALANCE' and type='PACKAGE BODY' and attribute='ERROR';if n>0 then raise_application_error(-20990,'Compilation failed: IMART_VOUCHER_BALANCE PACKAGE BODY');end if;end;
/
CREATE OR REPLACE trigger IMART_VB_CAPTURE_HEADER
after insert or update or delete on VOUCHER for each row
begin
 IMART_VOUCHER_BALANCE.touch(:old.tno);IMART_VOUCHER_BALANCE.touch(:new.tno);
end;
/
declare n number;begin select count(*) into n from user_errors where name='IMART_VB_CAPTURE_HEADER' and type='TRIGGER' and attribute='ERROR';if n>0 then raise_application_error(-20990,'Compilation failed: IMART_VB_CAPTURE_HEADER TRIGGER');end if;end;
/
CREATE OR REPLACE TRIGGER "VOUCHERDETAILBI"
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
/
declare n number;begin select count(*) into n from user_errors where name='VOUCHERDETAILBI' and type='TRIGGER' and attribute='ERROR';if n>0 then raise_application_error(-20990,'Compilation failed: VOUCHERDETAILBI TRIGGER');end if;end;
/
CREATE OR REPLACE procedure POSTPRODUCTION(pProductionTNo Number) IS
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
/
declare n number;begin select count(*) into n from user_errors where name='POSTPRODUCTION' and type='PROCEDURE' and attribute='ERROR';if n>0 then raise_application_error(-20990,'Compilation failed: POSTPRODUCTION PROCEDURE');end if;end;
/
declare n number;
begin
 for pass in 1..5 loop
  for r in(select object_name,object_type from user_objects where status='INVALID' and not((object_name='ACTIVATE_TASK_ASSIGNMENT' and object_type='PROCEDURE') or (object_name='APEX_CREATEPBPASSFROMPBILL_TEMP' and object_type='PROCEDURE') or (object_name='APEX_GETPENDINGPOQUANTITY1' and object_type='FUNCTION') or (object_name='APEX_PBPREPAREDATA' and object_type='PROCEDURE') or (object_name='APEX_PBPREPAREDATA_TEMP' and object_type='PROCEDURE') or (object_name='COMPLETE_TASK' and object_type='PROCEDURE') or (object_name='CREATECREDITNOTEFORSALESGRN' and object_type='PROCEDURE') or (object_name='CREATEDFREIGHTBILLRECEIPTFORCN' and object_type='PROCEDURE') or (object_name='CREATEDINSPECTION_TEMP' and object_type='PROCEDURE') or (object_name='CREATEENQUIRYFROMSALESENQUIRY' and object_type='PROCEDURE') or (object_name='CREATEINDENTFROMSALESENQUIRY' and object_type='PROCEDURE') or (object_name='CREATEINSPECTION_APEX_TEMP' and object_type='PROCEDURE') or (object_name='CREATEMPLOYEEACCOUNT' and object_type='PROCEDURE') or (object_name='CREATEREVERSECHARGEFORFA' and object_type='PROCEDURE') or (object_name='CREATEREVERSECHARGEFORJBPASS' and object_type='PROCEDURE') or (object_name='CREATE_TASK_INSTANCES' and object_type='PROCEDURE') or (object_name='DEBUG_TASK_AUTOMATION' and object_type='PROCEDURE') or (object_name='DEPRECIATIONFOR1YEAR' and object_type='PROCEDURE') or (object_name='D_CREATE_360VIEW' and object_type='PROCEDURE') or (object_name='D_CREATE_360_VIEW_JOB' and object_type='PROCEDURE') or (object_name='D_CREATE_SUPPLIER360VIEW' and object_type='PROCEDURE') or (object_name='D_PREPAREPURCHASEORDERFORSUPPLIER360VIEW' and object_type='PROCEDURE') or (object_name='EMPLOYEEAIU_MOBILEAPPS' and object_type='TRIGGER') or (object_name='EWAYBILLAIDU' and object_type='TRIGGER') or (object_name='EXTENDEWAYBILLVALIDITY' and object_type='PROCEDURE') or (object_name='GENERATEACCOUNTLEDGERGROUP' and object_type='PROCEDURE') or (object_name='GETCCINVOICESIGNEDQRCODEIMAGE' and object_type='FUNCTION') or (object_name='GETEINVOICESIGNEDQRCODEIMAGE' and object_type='FUNCTION') or (object_name='GETEMPLOYEEINCENTIVESCHEMECODE' and object_type='FUNCTION') or (object_name='GETINWARDTAXABLESUPPLY_GSTIN' and object_type='PROCEDURE') or (object_name='GETSALEINCENTIVERATE' and object_type='FUNCTION') or (object_name='GET_FILE' and object_type='PROCEDURE') or (object_name='IMART_SLC_360' and object_type='PACKAGE BODY') or (object_name='IMA_IMM_SESSION' and object_type='TRIGGER') or (object_name='INSERT_SCHEDULED_TASKS' and object_type='PROCEDURE') or (object_name='ISSUERETURNDETAILAISTOCK' and object_type='TRIGGER') or (object_name='ISSUERETURNDETAILBDSTOCK' and object_type='TRIGGER') or (object_name='ISSUERETURNDETAILBUSTOCK' and object_type='TRIGGER') or (object_name='IS_ITEMSPECIFICATION_USED' and object_type='FUNCTION') or (object_name='IS_ITEM_USED' and object_type='FUNCTION') or (object_name='MYBOXTREE_APEX_TEMP' and object_type='VIEW') or (object_name='PKG_EMAIL_MGR' and object_type='PACKAGE BODY') or (object_name='PKG_GRN' and object_type='PACKAGE BODY') or (object_name='POSTCCINVOICESTOCK_FROMPO' and object_type='PROCEDURE') or (object_name='POSTCREDITNOTE' and object_type='PROCEDURE') or (object_name='POSTFREIGHTADVICE' and object_type='PROCEDURE') or (object_name='POSTFREIGHTADVICEPURCHASE' and object_type='PROCEDURE') or (object_name='POSTFREIGHTADVICE_TEMP' and object_type='PROCEDURE') or (object_name='POSTJBPASSDANDRFULLBILLANDDN' and object_type='PROCEDURE') or (object_name='POSTJBPASSFN' and object_type='PROCEDURE') or (object_name='POSTJBPASSFULLBILLANDDEBITNOTE' and object_type='PROCEDURE') or (object_name='POSTJBPASSPURCHASE' and object_type='PROCEDURE') or (object_name='POSTJBPASSREVISED' and object_type='PROCEDURE') or (object_name='POSTLOANRECEIPT' and object_type='PROCEDURE') or (object_name='POSTPBPASS_WITHOUTFREIGHT' and object_type='PROCEDURE') or (object_name='POSTVOUCHER' and object_type='PROCEDURE') or (object_name='PROCESSIMPORTACCOUNT' and object_type='PROCEDURE') or (object_name='PROCESSIMPORTACCOUNTOPENING' and object_type='PROCEDURE') or (object_name='PROCESSIMPORTITEM' and object_type='PROCEDURE') or (object_name='REQUESTFOREWAYBILLEXTEND' and object_type='PROCEDURE') or (object_name='REQUESTFORMULTIPLECEWAYBILL' and object_type='PROCEDURE') or (object_name='RESIGNATION_AI' and object_type='TRIGGER') or (object_name='RUN_TASK_AUTOMATION_NOW' and object_type='PROCEDURE') or (object_name='SETSTOCKRATE' and object_type='PROCEDURE') or (object_name='SP_GENERATE_DAILY_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_GENERATE_MONTHLY_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_GENERATE_ONCE_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_GENERATE_WEEKLY_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_RUN_INSTANCE_GENERATOR' and object_type='PROCEDURE') or (object_name='STOP_TASK_ASSIGNMENT' and object_type='PROCEDURE') or (object_name='VERIFY_TASK' and object_type='PROCEDURE') or (object_name='V_LATEST_ACTIVE_SALESORDERS' and object_type='VIEW')) and object_type in('PROCEDURE','FUNCTION','PACKAGE','PACKAGE BODY','TRIGGER','VIEW'))loop
   begin
    if r.object_type='PACKAGE BODY' then execute immediate 'alter package '||dbms_assert.enquote_name(r.object_name,false)||' compile body';
    elsif r.object_type='PACKAGE' then execute immediate 'alter package '||dbms_assert.enquote_name(r.object_name,false)||' compile specification';
    else execute immediate 'alter '||r.object_type||' '||dbms_assert.enquote_name(r.object_name,false)||' compile';end if;
   exception when others then dbms_output.put_line('Compile: '||r.object_name||' '||sqlerrm);end;
  end loop;
 end loop;
 select count(*) into n from user_objects where status='INVALID' and not((object_name='ACTIVATE_TASK_ASSIGNMENT' and object_type='PROCEDURE') or (object_name='APEX_CREATEPBPASSFROMPBILL_TEMP' and object_type='PROCEDURE') or (object_name='APEX_GETPENDINGPOQUANTITY1' and object_type='FUNCTION') or (object_name='APEX_PBPREPAREDATA' and object_type='PROCEDURE') or (object_name='APEX_PBPREPAREDATA_TEMP' and object_type='PROCEDURE') or (object_name='COMPLETE_TASK' and object_type='PROCEDURE') or (object_name='CREATECREDITNOTEFORSALESGRN' and object_type='PROCEDURE') or (object_name='CREATEDFREIGHTBILLRECEIPTFORCN' and object_type='PROCEDURE') or (object_name='CREATEDINSPECTION_TEMP' and object_type='PROCEDURE') or (object_name='CREATEENQUIRYFROMSALESENQUIRY' and object_type='PROCEDURE') or (object_name='CREATEINDENTFROMSALESENQUIRY' and object_type='PROCEDURE') or (object_name='CREATEINSPECTION_APEX_TEMP' and object_type='PROCEDURE') or (object_name='CREATEMPLOYEEACCOUNT' and object_type='PROCEDURE') or (object_name='CREATEREVERSECHARGEFORFA' and object_type='PROCEDURE') or (object_name='CREATEREVERSECHARGEFORJBPASS' and object_type='PROCEDURE') or (object_name='CREATE_TASK_INSTANCES' and object_type='PROCEDURE') or (object_name='DEBUG_TASK_AUTOMATION' and object_type='PROCEDURE') or (object_name='DEPRECIATIONFOR1YEAR' and object_type='PROCEDURE') or (object_name='D_CREATE_360VIEW' and object_type='PROCEDURE') or (object_name='D_CREATE_360_VIEW_JOB' and object_type='PROCEDURE') or (object_name='D_CREATE_SUPPLIER360VIEW' and object_type='PROCEDURE') or (object_name='D_PREPAREPURCHASEORDERFORSUPPLIER360VIEW' and object_type='PROCEDURE') or (object_name='EMPLOYEEAIU_MOBILEAPPS' and object_type='TRIGGER') or (object_name='EWAYBILLAIDU' and object_type='TRIGGER') or (object_name='EXTENDEWAYBILLVALIDITY' and object_type='PROCEDURE') or (object_name='GENERATEACCOUNTLEDGERGROUP' and object_type='PROCEDURE') or (object_name='GETCCINVOICESIGNEDQRCODEIMAGE' and object_type='FUNCTION') or (object_name='GETEINVOICESIGNEDQRCODEIMAGE' and object_type='FUNCTION') or (object_name='GETEMPLOYEEINCENTIVESCHEMECODE' and object_type='FUNCTION') or (object_name='GETINWARDTAXABLESUPPLY_GSTIN' and object_type='PROCEDURE') or (object_name='GETSALEINCENTIVERATE' and object_type='FUNCTION') or (object_name='GET_FILE' and object_type='PROCEDURE') or (object_name='IMART_SLC_360' and object_type='PACKAGE BODY') or (object_name='IMA_IMM_SESSION' and object_type='TRIGGER') or (object_name='INSERT_SCHEDULED_TASKS' and object_type='PROCEDURE') or (object_name='ISSUERETURNDETAILAISTOCK' and object_type='TRIGGER') or (object_name='ISSUERETURNDETAILBDSTOCK' and object_type='TRIGGER') or (object_name='ISSUERETURNDETAILBUSTOCK' and object_type='TRIGGER') or (object_name='IS_ITEMSPECIFICATION_USED' and object_type='FUNCTION') or (object_name='IS_ITEM_USED' and object_type='FUNCTION') or (object_name='MYBOXTREE_APEX_TEMP' and object_type='VIEW') or (object_name='PKG_EMAIL_MGR' and object_type='PACKAGE BODY') or (object_name='PKG_GRN' and object_type='PACKAGE BODY') or (object_name='POSTCCINVOICESTOCK_FROMPO' and object_type='PROCEDURE') or (object_name='POSTCREDITNOTE' and object_type='PROCEDURE') or (object_name='POSTFREIGHTADVICE' and object_type='PROCEDURE') or (object_name='POSTFREIGHTADVICEPURCHASE' and object_type='PROCEDURE') or (object_name='POSTFREIGHTADVICE_TEMP' and object_type='PROCEDURE') or (object_name='POSTJBPASSDANDRFULLBILLANDDN' and object_type='PROCEDURE') or (object_name='POSTJBPASSFN' and object_type='PROCEDURE') or (object_name='POSTJBPASSFULLBILLANDDEBITNOTE' and object_type='PROCEDURE') or (object_name='POSTJBPASSPURCHASE' and object_type='PROCEDURE') or (object_name='POSTJBPASSREVISED' and object_type='PROCEDURE') or (object_name='POSTLOANRECEIPT' and object_type='PROCEDURE') or (object_name='POSTPBPASS_WITHOUTFREIGHT' and object_type='PROCEDURE') or (object_name='POSTVOUCHER' and object_type='PROCEDURE') or (object_name='PROCESSIMPORTACCOUNT' and object_type='PROCEDURE') or (object_name='PROCESSIMPORTACCOUNTOPENING' and object_type='PROCEDURE') or (object_name='PROCESSIMPORTITEM' and object_type='PROCEDURE') or (object_name='REQUESTFOREWAYBILLEXTEND' and object_type='PROCEDURE') or (object_name='REQUESTFORMULTIPLECEWAYBILL' and object_type='PROCEDURE') or (object_name='RESIGNATION_AI' and object_type='TRIGGER') or (object_name='RUN_TASK_AUTOMATION_NOW' and object_type='PROCEDURE') or (object_name='SETSTOCKRATE' and object_type='PROCEDURE') or (object_name='SP_GENERATE_DAILY_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_GENERATE_MONTHLY_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_GENERATE_ONCE_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_GENERATE_WEEKLY_INSTANCES' and object_type='PROCEDURE') or (object_name='SP_RUN_INSTANCE_GENERATOR' and object_type='PROCEDURE') or (object_name='STOP_TASK_ASSIGNMENT' and object_type='PROCEDURE') or (object_name='VERIFY_TASK' and object_type='PROCEDURE') or (object_name='V_LATEST_ACTIVE_SALESORDERS' and object_type='VIEW'));
 if n>0 then raise_application_error(-20990,'New invalid dependencies: '||n);end if;
 dbms_output.put_line('PASS: no new invalid database objects.');
end;
/
SPOOL OFF
EXIT
