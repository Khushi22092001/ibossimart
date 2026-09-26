whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 300
set linesize 280
connect -name IMART

prompt === DIWANKA MODULE / SCHEME COVERAGE ===
select (select count(*) from modulelocation where companycode = '3') modulelocation_count,
       (select count(*) from codescheme where companycode = '3' and financialyearcode = '26-27') codescheme_count,
       (select count(*) from codescheme where companycode = '3' and financialyearcode = '26-27' and modulecode = 'QUOTATION') quotation_scheme_count
  from dual;

prompt === REPAIRED QUOTATION ===
select tno, quotationno, quotationdate, companycode, financialyearcode,
       locationcode, doctypecode, partycode,
       (select count(*) from quotationdetail d where d.tno = q.tno) detail_rows
  from quotation q
 where tno = 56983631;

prompt === PAGE BUTTON VIEW COLUMNS ===
select owner, column_id, column_name
  from all_tab_columns
 where table_name = 'APEX_APPLICATION_PAGE_BUTTONS'
 order by owner, column_id;

prompt === PAGE PROCESS VIEW COLUMNS ===
select owner, column_id, column_name
  from all_tab_columns
 where table_name = 'APEX_APPLICATION_PAGE_PROC'
 order by owner, column_id;

exit
