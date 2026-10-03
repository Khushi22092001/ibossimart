whenever sqlerror exit sql.sqlcode rollback
set define off
set linesize 250
connect -name IMART
select css_file_urls from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
select file_name,dbms_lob.getlength(file_content) bytes,
 dbms_lob.instr(file_content,utl_raw.cast_to_raw('.t-Body-main')) main_container_override,
 dbms_lob.instr(file_content,utl_raw.cast_to_raw('margin-left')) physical_offset,
 dbms_lob.instr(file_content,utl_raw.cast_to_raw('margin-inline-start')) logical_offset
 from apex_application_static_files where application_id=105 and file_name='hspl-register-first-paint.css';
exit
