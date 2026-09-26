whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 300
set long 1200
connect -name IMART

with branches as (
  select b.flow_step_id as source_page,
         s.step_title as source_title,
         b.id as branch_id,
         b.branch_name,
         b.branch_action,
         b.clear_page_cache,
         to_number(regexp_substr(b.branch_action, 'APP_ID[.]:([0-9]+)', 1, 1, null, 1)) as target_page
    from apex_260100.wwv_flow_step_branches b
    join apex_260100.wwv_flow_steps s
      on s.flow_id = b.flow_id
     and s.id = b.flow_step_id
   where b.flow_id = 105
     and b.security_group_id = 4744311978888504
)
select b.source_page,
       b.source_title,
       b.branch_id,
       b.branch_name,
       b.target_page,
       target.step_title as target_title,
       b.clear_page_cache,
       b.branch_action
  from branches b
  join apex_260100.wwv_flow_steps target
    on target.flow_id = 105
   and target.id = b.target_page
 where regexp_like(target.step_title, '(register|list)', 'i')
   and (b.clear_page_cache is not null or regexp_like(b.branch_action, '::[^:]*:[0-9,]+:', 'i'))
 order by b.source_page, b.branch_id;

exit
