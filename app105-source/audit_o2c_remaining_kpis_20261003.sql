whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 320
connect -name IMART

select p.id page_id,p.name page_name,c.region_id,c.state,
       case when c.region_id is null then 'NO' else 'YES' end has_kpi_shell,
       case when c.status_expression is not null then 'YES' else 'NO' end has_status,
       case when c.process_expression is not null then 'YES' else 'NO' end has_process,
       (select listagg(s.status_code,', ') within group(order by s.display_order,s.status_code)
          from imart_rkpi_status_catalog s where s.region_id=c.region_id) catalog_cards
  from apex_260100.wwv_flow_steps p
  left join imart_rkpi_config c on c.page_id=p.id
 where p.flow_id=105
   and p.id in(154,160,167,170,174,190,198,273,347,362,377,382,701,704)
 order by p.id,c.region_id;

exit
