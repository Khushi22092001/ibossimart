WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET FEEDBACK OFF
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLFORMAT JSON
SET LONG 1000000
SPOOL e2e-verification.json
select systimestamp checked_at,p.tno,p.productionno,getdocumentstatuscode('PRODUCTION',p.tno) document_status,p.remark from production p where p.tno=57092429;
select v.tno,v.voucherno,v.modulecode,v.moduletno,count(*) ledger_lines,
 sum(case when d.amount<0 then -d.amount else 0 end) debit_total,
 sum(case when d.amount>0 then d.amount else 0 end) credit_total,
 sum(d.amount) net_total,
 count(case when d.amount<>round(d.amount,2) then 1 end) excess_precision_lines
 from voucher v join voucherdetail d on d.tno=v.tno where v.modulecode='PRODUCTION' and v.moduletno=57092429 group by v.tno,v.voucherno,v.modulecode,v.moduletno;
select d.tno,d.sno,d.serialno,d.accountcode,p.partyname account_name,to_char(d.amount,'FM999999999999990D00','NLS_NUMERIC_CHARACTERS=''.,''') amount_2dp from voucherdetail d left join party p on p.partycode=d.accountcode where d.tno in(select tno from voucher where modulecode='PRODUCTION' and moduletno=57092429) order by d.serialno,d.sno;
select to_char(sum(d.quantity1*s.rate),'TM9') raw_cost_exact,round(sum(d.quantity1*s.rate),2) raw_cost_2dp,sum(d.quantity1) raw_quantity from productionrawstockdetail d join stock s on s.tno=d.stocktno where d.tno=57092429;
select tno,itemcode,itemspecificationcode,stockquantity1,nvl(usedstockquantity1,0) used_quantity,nvl(reservestockquantity1,0) reserved_quantity,to_char(rate,'TM9') rate_exact from stock where tno=57083878 or (stockmodulecode='PRODUCTION' and stockmoduletno=57092429) order by tno;
SPOOL OFF
SET SQLFORMAT DEFAULT
SPOOL e2e-assertions.log
declare
 n number;t number;dr number;cr number;bad number;cost number;qty number;fg_qty number;fg_rate number;
begin
 select count(*),min(tno) into n,t from voucher where modulecode='PRODUCTION' and moduletno=57092429;
 if n<>1 then raise_application_error(-20991,'Expected exactly one test voucher');end if;
 if getdocumentstatuscode('PRODUCTION',57092429)<>'ACTIVE' then raise_application_error(-20991,'Test Production is not ACTIVE');end if;
 IMART_VOUCHER_BALANCE.assert_voucher(t);
 select sum(case when amount<0 then -amount else 0 end),sum(case when amount>0 then amount else 0 end),
 count(case when amount<>round(amount,2) then 1 end),count(*) into dr,cr,bad,n from voucherdetail where tno=t;
 if dr<>348.12 or cr<>348.12 or bad<>0 or n<>4 then raise_application_error(-20991,'Voucher currency/balance/line-count assertion failed');end if;
 select sum(d.quantity1*s.rate),sum(d.quantity1) into cost,qty from productionrawstockdetail d join stock s on s.tno=d.stocktno where d.tno=57092429;
 if qty<>.003 or round(cost,2)<>174.06 or cost=round(cost,2) then raise_application_error(-20991,'Fractional-cost fixture was not exercised');end if;
 select nvl(usedstockquantity1,0),stockquantity1 into qty,n from stock where tno=57083878;
 if qty<>.003 or n<>20.15 then raise_application_error(-20991,'Source stock movement mismatch');end if;
 select count(*),sum(stockquantity1),max(rate) into n,fg_qty,fg_rate from stock where stockmodulecode='PRODUCTION' and stockmoduletno=57092429;
 if n<>1 or fg_qty<>.003 or abs(fg_rate-cost/.003)>1e-25 or fg_rate=round(fg_rate,2) then raise_application_error(-20991,'Finished stock quantity/rate precision mismatch');end if;
 dbms_output.put_line('PASS UI end-to-end Production 57092429; voucher='||t||'; 4 ledger lines; Debit=348.12; Credit=348.12; excess precision=0; source cost rounded=174.06; raw stock used=.003; finished stock=.003; stock-rate precision preserved.');
end;
/
ROLLBACK;
SPOOL OFF
EXIT
