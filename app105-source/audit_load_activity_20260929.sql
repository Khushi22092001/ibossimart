whenever sqlerror exit sql.sqlcode rollback
set define off
set linesize 250
set pagesize 100
connect -name IMART
select time_stamp,step_id,round(elap,3) server_seconds,num_rows,content_length,page_view_type
 from (select time_stamp,step_id,elap,num_rows,content_length,page_view_type
 from (select time_stamp,step_id,elap,num_rows,content_length,page_view_type,flow_id,security_group_id,session_id from apex_260100.wwv_flow_activity_log1$
 union all select time_stamp,step_id,elap,num_rows,content_length,page_view_type,flow_id,security_group_id,session_id from apex_260100.wwv_flow_activity_log2$) where flow_id=105
 and security_group_id=4744311978888504 and session_id=15530881568237
 and step_id in (107,117,118,145,142,68,940)
 order by time_stamp desc) where rownum<=25;
exit
