whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 280
connect -name IMART

prompt === CODESCHEME COLUMNS ===
select column_id, column_name, data_type
  from user_tab_columns
 where table_name = 'CODESCHEME'
 order by column_id;

prompt === QUOTATION SCHEMES FOR FY 26-27 ===
select tno, companycode, financialyearcode, modulecode, codescheme,
       initializationperiod, startno, noformat,
       includecompanyshortname, includemoduleshortname,
       includelocationshortname, includedoctypeshortname,
       includeothershortname, separatorcharacter
  from codescheme
 where modulecode = 'QUOTATION'
   and financialyearcode = '26-27'
 order by companycode;

prompt === ALL DIWANKA SCHEMES FY 26-27 ===
select tno, modulecode, codescheme, initializationperiod, startno, noformat,
       includecompanyshortname, includemoduleshortname,
       includelocationshortname, includedoctypeshortname,
       includeothershortname, separatorcharacter
  from codescheme
 where companycode = '3'
   and financialyearcode = '26-27'
 order by modulecode;

prompt === QUOTATION MODULE / DOCTYPE / LOCATION ===
select modulecode, modulename, moduleshortname from module where modulecode = 'QUOTATION';
select doctypecode, doctypename, doctypeshortname from doctype where doctypecode = 'PURCHASE';
select locationcode, locationname, locationshortname from location where locationcode = 'RC';

prompt === QUOTATION CODE DETAIL ALL COMPANIES ===
select d.tno, d.sno, d.companycode, d.financialyearcode, d.modulecode,
       d.locationcode, d.doctypecode, d.othercode,
       d.transactiondate, d.formonth, d.lastno
  from codeschemedetail d
 where d.modulecode = 'QUOTATION'
   and d.financialyearcode = '26-27'
 order by d.companycode, d.locationcode, d.doctypecode, d.sno;

exit
