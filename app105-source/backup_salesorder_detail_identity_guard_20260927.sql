connect -name IMART
set pagesize 1000 linesize 240 feedback on verify off
spool app105-source/deployments/salesorder-detail-identity-guard-20260927/live-before/trigger-inventory.txt
select owner,trigger_name,triggering_event,trigger_type,status
  from all_triggers
 where table_owner='IMART' and table_name='SALESORDERDETAIL'
 order by trigger_name;
spool off
exit
