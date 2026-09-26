whenever sqlerror exit failure rollback
set define off
connect -name IMART
set lines 220 pages 100 long 100000

select region_name,
       dbms_lob.getlength(region_source) source_length,
       dbms_lob.instr(region_source, 'Open trial balance') accounts_link_marker,
       dbms_lob.instr(region_source, 'Coming soon') coming_soon_marker
  from apex_application_page_regions
 where application_id = 105
   and page_id = 901
   and static_id = 'business-insights-cards';

exit
