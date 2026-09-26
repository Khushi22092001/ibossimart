whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 100
set linesize 280
set long 10000
connect -name IMART

prompt === LIVE PAGE 710 BUTTON CONDITIONS ===
select button_name, button_action, database_action,
       condition_type_code, condition_expression1, condition_expression2,
       last_updated_by, last_updated_on
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 710
   and button_name in ('CREATE','SAVE','DELETE','PRINT_1')
 order by button_name;

prompt === LIVE DOCUMENT NUMBER PROCESS ===
select process_name, execution_sequence, process_point_code,
       case when process_source like '%number could not be generated%'
            then 'GUARD_PRESENT' else 'GUARD_MISSING' end number_guard,
       last_updated_by, last_updated_on
  from apex_application_page_proc
 where application_id = 105
   and page_id = 710
   and process_name = 'Det Doc No';

exit
