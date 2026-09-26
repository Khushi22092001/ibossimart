whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 260
set long 200000
set longchunksize 200000
connect -name IMART

prompt === QUOTATION COLUMNS ===
select column_id, column_name, data_type
  from user_tab_columns
 where table_name = 'QUOTATION'
 order by column_id;

prompt === COMPANY 3 ===
select * from company where companycode = 3;

prompt === DIWANKA QUOTATIONS CREATED TODAY ===
select tno,
       quotationno,
       quotationdate,
       companycode,
       locationcode,
       partycode,
       creator,
       creationtime
  from quotation
 where companycode = 3
   and trunc(creationtime) = date '2026-09-25'
 order by creationtime, tno;

prompt === QUOTATION TRIGGER SOURCE ===
select line, text
  from user_source
 where name = 'QUOTATION_BI'
   and type = 'TRIGGER'
 order by line;

prompt === APEX PAGE PROCESS VIEW COLUMNS ===
select column_id, column_name
  from all_tab_columns
 where owner = 'APEX_240200'
   and table_name = 'APEX_APPLICATION_PAGE_PROC'
 order by column_id;

prompt === LIVE PAGE 710 PROCESS CORE ===
select process_sequence,
       process_point,
       process_name,
       process_type,
       when_button_pressed
  from apex_application_page_proc
 where application_id = 105
   and page_id = 710
 order by process_point, process_sequence;

prompt === LIVE PAGE 710 BUTTON CORE ===
select button_sequence,
       button_name,
       button_action,
       database_action,
       condition_type,
       condition_expression1,
       condition_expression2
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 710
 order by button_sequence;

exit
