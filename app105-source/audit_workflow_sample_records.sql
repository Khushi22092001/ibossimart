whenever sqlerror exit sql.sqlcode rollback
set serveroutput on size unlimited
set pagesize 200
set linesize 260
connect -name IMART

/* Read-only: one existing document per launcher module for visual audit. */
declare
  l_tno number;
begin
  for r in (
    select modulecode, modulename, mastertablename, entrypageno
      from module
     where modulecode in (
       'INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
       'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
       'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER',
       'SALESENQUIRY','SALESQUOTATION','PORECEIPT','SALESORDER',
       'DESPATCHADVICE','CCINVOICE','BILLRECEIPT'
     )
     order by modulecode
  ) loop
    begin
      execute immediate
        'select max(tno) from ' || dbms_assert.sql_object_name(r.mastertablename)
        into l_tno;
      dbms_output.put_line(r.modulecode || '|' || r.entrypageno || '|' ||
                           r.mastertablename || '|' || nvl(to_char(l_tno), 'NO_RECORD'));
    exception
      when others then
        dbms_output.put_line(r.modulecode || '|' || r.entrypageno || '|' ||
                             r.mastertablename || '|QUERY_ERROR:' || sqlcode);
    end;
  end loop;
end;
/

exit
