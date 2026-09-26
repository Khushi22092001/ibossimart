set pagesize 100
set linesize 220
connect -name IMART

select case when instr(javascript_code_onload, 'Page 143 balanced Bill Details layout') > 0 then 'PRESENT' else 'MISSING' end as onload_js,
       case when instr(inline_css, 'preserve authored Bill Details pairs') > 0 then 'PRESENT' else 'MISSING' end as page_css,
       last_updated_on
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 143
   and security_group_id = 4744311978888504;

exit
