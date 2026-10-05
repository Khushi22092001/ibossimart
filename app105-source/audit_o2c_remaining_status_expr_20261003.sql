whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 320
set long 1000000
set longchunksize 1000000
connect -name IMART

select c.page_id,p.name page_name,c.region_id,c.status_expression,c.process_expression,c.scope_note
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps p on p.flow_id=105 and p.id=c.page_id
 where c.page_id in(198,347,377,382)
 order by c.page_id;

exit
