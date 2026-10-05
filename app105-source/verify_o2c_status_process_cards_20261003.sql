whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 200
set linesize 260
connect -name IMART

select count(*) status_configs,
       count(process_expression) process_configs
  from imart_rkpi_config
 where page_id in(154,160,170,174,190,273,701,704)
   and state='READY'
   and status_expression is not null;

select count(*) catalog_cards
  from imart_rkpi_status_catalog
 where region_id in(
   603956119249045018,604865642406184046,578271541182137349,
   573917201776151631,600498172302484751,209951780917329537,
   231408634368176212,232021330335737131
 );

select count(*) wrapped_reports
  from apex_260100.wwv_flow_page_plugs r
  join imart_rkpi_config c on c.region_id=r.id and c.page_id=r.page_id
 where r.flow_id=105
   and c.page_id in(154,160,170,174,190,273,701,704)
   and dbms_lob.instr(r.plug_source,'select rk_source.* from (')>0;

exit
