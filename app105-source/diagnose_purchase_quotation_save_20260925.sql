whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 200
set linesize 240
connect -name IMART

prompt === QUOTATION PRIMARY KEY ===
select acc.constraint_name,
       acc.column_name,
       acc.position
  from user_cons_columns acc
  join user_constraints ac
    on ac.constraint_name = acc.constraint_name
 where ac.table_name = 'QUOTATION'
   and ac.constraint_type = 'P'
 order by acc.position;

prompt === REPORTED TNO ===
select tno,
       quotationno,
       quotationdate,
       companycode,
       locationcode,
       partycode,
       creator,
       creationtime
  from quotation
 where tno = 56983631;

prompt === TABLE / SEQUENCE POSITION ===
select (select max(tno) from quotation) quotation_max_tno,
       (select last_number from user_sequences where sequence_name = 'GLOBALTNO') globaltno_last_number,
       (select increment_by from user_sequences where sequence_name = 'GLOBALTNO') globaltno_increment,
       (select cache_size from user_sequences where sequence_name = 'GLOBALTNO') globaltno_cache
  from dual;

prompt === POSSIBLE DUPLICATE-PRODUCING TRIGGERS ===
select trigger_name, status, triggering_event
  from user_triggers
 where table_name = 'QUOTATION'
 order by trigger_name;

prompt === LIVE PAGE 710 PROCESSES ===
select process_sequence,
       process_point,
       process_name,
       process_type,
       when_button_pressed,
       process_condition_type,
       process_condition
  from apex_application_page_proc
 where application_id = 105
   and page_id = 710
 order by process_point, process_sequence;

prompt === LIVE PAGE 710 BUTTONS ===
select button_sequence,
       button_name,
       button_action,
       database_action,
       condition_type,
       condition_expression1
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 710
 order by button_sequence;

exit
