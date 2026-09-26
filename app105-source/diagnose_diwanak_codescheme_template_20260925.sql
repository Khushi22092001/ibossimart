whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 100
set linesize 320
connect -name IMART

prompt === DIWANKA NUMBERING TEMPLATE ROWS ===
select companycode, financialyearcode, modulecode,
       includecompanyshortname, includemoduleshortname, includelocationshortname,
       includetransactionyear, includetransactionmonth, includetransactionday,
       companyshortnameposition, moduleshortnameposition, locationshortnameposition,
       transactionyearposition, transactionmonthposition, transactiondayposition,
       separatorcharacter, initializationperiod, startno, codescheme,
       monthlyinitializationday, dailyinitializationday,
       includedoctypeshortname, includeothershortname,
       doctypeshortnameposition, othershortnameposition,
       othertablename, othercolumnname, othercolumnnameinthemodule,
       othercodecolumnname, noformat, tno
  from codescheme
 where companycode = '3'
   and financialyearcode = '26-27'
   and modulecode in ('ENQUIRY','INDENT','PURCHASEORDER')
 order by modulecode;

prompt === CODESCHEME CONSTRAINTS/TRIGGERS ===
select c.constraint_name, c.constraint_type,
       listagg(cc.column_name, ',') within group (order by cc.position) columns_list
  from user_constraints c
  join user_cons_columns cc on cc.constraint_name = c.constraint_name
 where c.table_name = 'CODESCHEME'
 group by c.constraint_name, c.constraint_type
 order by c.constraint_type, c.constraint_name;
select trigger_name, status, triggering_event from user_triggers where table_name = 'CODESCHEME';

exit
