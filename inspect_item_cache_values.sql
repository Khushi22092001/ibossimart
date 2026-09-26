set pages 100
set lines 200
select use_cache_before_default, count(*)
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
 group by use_cache_before_default
 order by 1;
exit
