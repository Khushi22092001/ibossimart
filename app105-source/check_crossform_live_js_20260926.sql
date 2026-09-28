set pagesize 100 linesize 220 feedback off verify off
select id,
       dbms_lob.getlength(javascript_code) js_len,
       dbms_lob.instr(javascript_code,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1') marker_pos,
       dbms_lob.instr(javascript_code,'hsplP118OpenFd') po_fd_pos,
       dbms_lob.instr(javascript_code,'hsplP143OpenFd') pb_fd_pos,
       dbms_lob.instr(javascript_code,'hsplP152OpenFd') pbp_fd_pos
from apex_260100.wwv_flow_steps
where flow_id=105 and id in (69,108,118,140,143,146,152,155,710)
order by id;

select id,
       dbms_lob.getlength(javascript_code_onload) onload_len,
       dbms_lob.instr(javascript_code_onload,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1') marker_pos,
       dbms_lob.instr(javascript_code_onload,'hsplP118OpenFd') po_fd_pos
from apex_260100.wwv_flow_steps
where flow_id=105 and id in (69,108,118,140,143,146,152,155,710)
order by id;
exit
