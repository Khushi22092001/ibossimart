whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 320
set long 20000
set serveroutput on
connect -name IMART

prompt === DA EVENT TABLE COLUMNS ===
select column_id, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_DA_EVENTS'
 order by column_id;

prompt === DA ACTION TABLE COLUMNS ===
select column_id, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_DA_ACTIONS'
 order by column_id;

prompt === PAGE 710 CALCULATION EVENTS ===
select id, name, triggering_element, bind_event_type, display_when_type
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and page_id = 710
   and name in ('set amount', 'Calculate Detail Footer Amount',
                'Calculate Detail Footer Total Amount value on get focus',
                'Calculate Detail Footer Total Amount value on loose focus',
                'Calculate Footer Total',
                'Set Value- Final value of Detail footer on Loose Focus')
 order by id;

prompt === PAGE 710 CALCULATION ACTIONS ===
select a.id, a.event_id, a.action, a.action_sequence,
       dbms_lob.getlength(a.attributes) attribute_length,
       dbms_lob.instr(a.attributes, 'commit;') commit_position,
       dbms_lob.instr(a.attributes, 'parseInt') parseint_position,
       dbms_lob.substr(a.attributes, 2000, 1) attribute_start
  from apex_260100.wwv_flow_page_da_actions a
 where a.flow_id = 105
   and a.event_id in (
       select e.id
         from apex_260100.wwv_flow_page_da_events e
        where e.flow_id = 105
          and e.page_id = 710
          and e.name in ('set amount', 'Calculate Detail Footer Amount',
                         'Calculate Detail Footer Total Amount value on get focus',
                         'Calculate Detail Footer Total Amount value on loose focus',
                         'Calculate Footer Total',
                         'Set Value- Final value of Detail footer on Loose Focus'))
 order by a.event_id, a.action_sequence;

exit
