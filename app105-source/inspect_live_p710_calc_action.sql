whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 200 linesize 320 long 200000 longchunksize 200000
connect -name IMART
select dbms_lob.substr(attributes, 4000,
       greatest(1, dbms_lob.instr(attributes, ':RATEAFTERDISCOUNT') - 500)) calc_fragment
  from apex_260100.wwv_flow_page_da_actions
 where id = 41168478745923814
   and flow_id = 105 and page_id = 710
   and security_group_id = 4744311978888504;
exit
