whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 240
connect -name IMART
select c.page_id,c.region_id,s.status_code,s.display_order,s.card_mode
  from imart_rkpi_config c
  left join imart_rkpi_status_catalog s on s.region_id=c.region_id
 where c.page_id in(154,160,170,174,190,273,701,704)
 order by c.page_id,s.display_order,s.status_code;
exit
