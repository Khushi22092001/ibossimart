whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 240
set trimspool on
set feedback on
connect -name IMART

prompt === IMART_RKPI_CONFIG columns ===
select column_id, column_name, data_type
  from user_tab_columns
 where table_name = 'IMART_RKPI_CONFIG'
 order by column_id;

prompt === READY KPI capability summary ===
select case
         when status_expression is null
          and recent_predicate is null
          and mine_predicate is null then 'TOTAL_ONLY'
         else 'USEFUL_FILTERS'
       end capability,
       count(*) region_count,
       count(distinct page_id) page_count
  from imart_rkpi_config
 where state = 'READY'
 group by case
         when status_expression is null
          and recent_predicate is null
          and mine_predicate is null then 'TOTAL_ONLY'
         else 'USEFUL_FILTERS'
       end
 order by capability;

prompt === Total-only live register shells ===
select c.page_id,
       s.name page_name,
       c.region_id,
       c.region_label,
       c.region_static_id,
       c.grain_label,
       c.issue,
       k.id shell_id,
       k.static_id shell_static_id
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
  left join apex_260100.wwv_flow_page_plugs k
    on k.flow_id = 105
   and k.page_id = c.page_id
   and k.static_id = 'coverage-kpi-shell-' || c.region_id
 where c.state = 'READY'
   and c.status_expression is null
   and c.recent_predicate is null
   and c.mine_predicate is null
 order by c.page_id, c.region_id;

prompt === Useful KPI live register shells ===
select c.page_id,
       s.name page_name,
       c.region_id,
       c.region_label,
       case when c.status_expression is not null then 'Y' else 'N' end has_status,
       case when c.recent_predicate is not null then 'Y' else 'N' end has_recent,
       case when c.mine_predicate is not null then 'Y' else 'N' end has_mine,
       k.id shell_id
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
  left join apex_260100.wwv_flow_page_plugs k
    on k.flow_id = 105
   and k.page_id = c.page_id
   and k.static_id = 'coverage-kpi-shell-' || c.region_id
 where c.state = 'READY'
   and (c.status_expression is not null
     or c.recent_predicate is not null
     or c.mine_predicate is not null)
 order by c.page_id, c.region_id;

exit
