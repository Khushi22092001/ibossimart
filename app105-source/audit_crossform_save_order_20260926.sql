whenever sqlerror exit sql.sqlcode rollback
set pagesize 400 linesize 280 long 200000 feedback on verify off

prompt === SAVE PROCESS ORDER / EXPLICIT COMMIT AUDIT ===
select flow_step_id page_id,
       process_sequence,
       process_point,
       process_name,
       nvl(process_when,'-') process_when,
       case when regexp_like(dbms_lob.substr(process_sql_clob,4000,1),'(^|[[:space:]])commit[[:space:]]*;','i') then 'YES' else 'NO' end explicit_commit
from apex_260100.wwv_flow_step_processing
where flow_id=105
  and flow_step_id in (118,143,152)
order by flow_step_id, process_point, process_sequence;

exit
