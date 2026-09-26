whenever sqlerror exit failure rollback
set define off
connect -name IMART
set serveroutput on size unlimited
set lines 240 pages 100 long 100000

select region_id,
       region_name,
       static_id,
       case when dbms_lob.instr(region_source, '5 live workspaces') > 0 then 'YES' else 'NO' end live_count_5,
       case when dbms_lob.instr(region_source, '4 live workspaces') > 0 then 'YES' else 'NO' end stale_count_4,
       case when dbms_lob.instr(region_source, 'f?p=&APP_ID.:721:') > 0 then 'YES' else 'NO' end sales_page_721
  from apex_application_page_regions
 where application_id = 105
   and page_id = 901
 order by display_sequence, region_id;

exit
