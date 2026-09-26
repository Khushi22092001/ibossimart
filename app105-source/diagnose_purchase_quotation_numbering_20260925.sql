whenever sqlerror continue
set define off
set pagesize 500
set linesize 260
set long 200000
set longchunksize 200000
connect -name IMART

prompt === EXACT MASTER ROW ===
select tno, companycode, financialyearcode, locationcode, doctypecode,
       quotationno, quotationdate, partycode, enquirytno,
       partyquotationno, partyquotationdate, modulecode, moduletno,
       transactiontypecode, natureofsupplycode, creator, creationtime
  from quotation
 where tno = 56983631;

prompt === EXACT DETAIL COUNTS AND LINES ===
select count(*) detail_rows, count(distinct sno) distinct_sno
  from quotationdetail
 where tno = 56983631;
select tno, sno, serialno, itemcode, itemspecificationcode,
       quantity1, quantity2, rate, amount, totalamount
  from quotationdetail
 where tno = 56983631
 order by sno, serialno;

prompt === MODULE MAPPING ===
select getModuleCodeForPageNo(710) module_code from dual;

prompt === NUMBER CURRENTLY RESOLVED WITHOUT INCREMENT ===
select GetDocNo(
         getModuleCodeForPageNo(710),
         '3',
         '26-27',
         'RC',
         'PURCHASE',
         null,
         date '2026-09-25') doc_no
  from dual;

prompt === NUMBERING FUNCTIONS OBJECTS ===
select object_name, object_type, status
  from user_objects
 where object_name in ('GETDOCNO','SETDOCNONEXT','GETMODULECODEFORPAGENO')
 order by object_name, object_type;

prompt === GETDOCNO SOURCE ===
select line, text
  from user_source
 where name = 'GETDOCNO'
 order by type, line;

prompt === SETDOCNONEXT SOURCE ===
select line, text
  from user_source
 where name = 'SETDOCNONEXT'
 order by type, line;

prompt === QUOTATION DETAIL CONSTRAINTS ===
select c.constraint_name, c.constraint_type,
       listagg(cc.column_name, ',') within group (order by cc.position) columns_list
  from user_constraints c
  join user_cons_columns cc on cc.constraint_name = c.constraint_name
 where c.table_name = 'QUOTATIONDETAIL'
 group by c.constraint_name, c.constraint_type
 order by c.constraint_type, c.constraint_name;

exit
