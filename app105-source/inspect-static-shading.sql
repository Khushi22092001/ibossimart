whenever sqlerror exit failure rollback
set define off
connect -name IMART
set pagesize 100 linesize 200
select flow_id, id, file_name, dbms_lob.getlength(file_content) bytes
  from apex_260100.wwv_flow_static_files
 where flow_id in (105,107) and file_name = 'hspl-theme.css';
exit
