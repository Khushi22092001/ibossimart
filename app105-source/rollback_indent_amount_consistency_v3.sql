whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/backups/indent-before-amount-consistency-v3-20260926-155804/live-before/f105_page_108.sql
select case when dbms_lob.instr(javascript_code,'HSPL_INDENT_AMOUNT_CONSISTENCY_V3')=0
            then 'V3_REMOVED' else 'V3_STILL_PRESENT' end rollback_status,
       case when dbms_lob.instr(javascript_code,'HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2')>0
            then 'FOCUS_GUARD_PRESERVED' else 'FOCUS_GUARD_MISSING' end guard_status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=108 and security_group_id=4744311978888504;
exit

