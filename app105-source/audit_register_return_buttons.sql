whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 300
set long 1200
connect -name IMART

with buttons as (
  select b.flow_step_id as source_page,
         source.step_title as source_title,
         b.id as button_id,
         b.button_name,
         b.button_action,
         b.button_redirect_url,
         to_number(regexp_substr(b.button_redirect_url, 'APP_ID[.]:([0-9]+)', 1, 1, null, 1)) as target_page
    from apex_260100.wwv_flow_step_buttons b
    join apex_260100.wwv_flow_steps source
      on source.flow_id = b.flow_id
     and source.id = b.flow_step_id
   where b.flow_id = 105
     and b.security_group_id = 4744311978888504
)
select b.source_page,
       b.source_title,
       b.button_id,
       b.button_name,
       b.target_page,
       target.step_title as target_title,
       b.button_redirect_url
  from buttons b
  join apex_260100.wwv_flow_steps target
    on target.flow_id = 105
   and target.id = b.target_page
 where regexp_like(target.step_title, '(register|list)', 'i')
   and regexp_like(b.button_redirect_url, '::[^:]*:[0-9,]+:', 'i')
 order by b.source_page, b.button_id;

exit
