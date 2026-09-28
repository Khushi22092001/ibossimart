whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 320 trimspool on feedback on verify off

prompt === IMART CONSTRAINTS ON O2C DETAIL / FOOTER TABLES ===
select ac.table_name,ac.constraint_name,ac.constraint_type,ac.status,
       listagg(acc.column_name,',') within group(order by acc.position) columns
  from all_constraints ac
  left join all_cons_columns acc on acc.owner=ac.owner and acc.constraint_name=ac.constraint_name
 where ac.owner='IMART'
   and ac.table_name in ('SALESORDERDETAIL','SALESORDERDETAILFOOTER','SALESENQUIRYDETAIL','SALESENQUIRYDETAILFOOTER','SALESQUOTATIONDETAIL','SALESQUOTATIONDETAILFOOTER','POAMENDMENTDETAIL','POAMENDMENTDETAILFOOTER')
 group by ac.table_name,ac.constraint_name,ac.constraint_type,ac.status
 order by ac.table_name,ac.constraint_type,ac.constraint_name;

prompt === IMART TRIGGERS ON O2C DETAIL / FOOTER TABLES ===
select table_name,trigger_name,triggering_event,trigger_type,status
  from all_triggers
 where table_owner='IMART'
   and table_name in ('SALESORDERDETAIL','SALESORDERDETAILFOOTER','SALESENQUIRYDETAIL','SALESENQUIRYDETAILFOOTER','SALESQUOTATIONDETAIL','SALESQUOTATIONDETAILFOOTER','POAMENDMENTDETAIL','POAMENDMENTDETAILFOOTER')
 order by table_name,trigger_name;

prompt === DATABASE-WRITER SOURCE REFERENCES ===
select owner,name,type,line,trim(text) source_line
  from all_source
 where owner='IMART'
   and type in ('TRIGGER','PROCEDURE','FUNCTION','PACKAGE BODY')
   and upper(text) like '%SALESORDERDETAIL%'
 order by name,type,line fetch first 250 rows only;

prompt === SALES-ORDER COPY/CONVERSION WRITER ===
select line,text
  from all_source
 where owner='IMART'
   and name='SAVEASSALESORDER'
   and type='PROCEDURE'
 order by line;

prompt === LIVE SALES-ORDER DUPLICATE-KEY EXAMPLE ===
select tno,sno,itemcode,itemspecificationcode,quantity1,quantity2,ratemeasuringunitcode,rate,amount,footeramount,totalamount,rowid
  from salesorderdetail
 where tno=56972968 and sno=56972989
 order by rowid;

prompt === FOOTER ROWS FOR THAT DUPLICATE IDENTITY ===
select tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode,rowid
  from salesorderdetailfooter
 where tno=56972968 and sno=56972989
 order by sn;

exit
