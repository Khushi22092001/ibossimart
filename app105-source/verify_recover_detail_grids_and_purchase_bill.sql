set heading off
set feedback off
set pagesize 0
connect -name IMART

select 'PAGE0_DETAIL_POLICY=' || case when dbms_lob.instr(javascript_code_onload, 'Detail-grid scrollbar policy: preserve native IG operations and sizing.') > 0 then 'PRESENT' else 'MISSING' end
  from apex_260100.wwv_flow_steps where flow_id=105 and id=0 and security_group_id=4744311978888504;
select 'P146_BAD_OVERRIDE=' || case when dbms_lob.instr(nvl(inline_css, empty_clob()), 'GRN Detail: remove only the unnecessary inner vertical scroll.') > 0 then 'PRESENT' else 'REMOVED' end
  from apex_260100.wwv_flow_steps where flow_id=105 and id=146 and security_group_id=4744311978888504;
select 'P143_LAYOUT_MOVER=' || case when dbms_lob.instr(nvl(javascript_code_onload, empty_clob()), 'Page 143 balanced Bill Details layout') > 0 then 'PRESENT' else 'REMOVED' end
  from apex_260100.wwv_flow_steps where flow_id=105 and id=143 and security_group_id=4744311978888504;
exit
