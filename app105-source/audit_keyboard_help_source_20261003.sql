whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 300
set linesize 260
set long 4000
connect -name IMART

prompt === PAGE JAVASCRIPT ===
select id page_id,name page_name,
       case when dbms_lob.instr(javascript_code,'hspl-keyboard-help')>0 then 'ID'
            when dbms_lob.instr(javascript_code,'Keyboard help')>0 then 'TEXT'
       end match_type
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and (dbms_lob.instr(javascript_code,'hspl-keyboard-help')>0
        or dbms_lob.instr(javascript_code,'Keyboard help')>0)
 order by id;

prompt === REGION SOURCE ===
select page_id,id region_id,plug_name
  from apex_260100.wwv_flow_page_plugs
 where flow_id=105
   and (dbms_lob.instr(plug_source,'hspl-keyboard-help')>0
        or dbms_lob.instr(plug_source,'Keyboard help')>0)
 order by page_id,id;

prompt === STATIC FILES ===
select filename,mime_type
  from apex_260100.wwv_flow_files
 where flow_id=105
   and (dbms_lob.instr(file_content,'hspl-keyboard-help')>0
        or dbms_lob.instr(file_content,'Keyboard help')>0)
 order by filename;

exit
