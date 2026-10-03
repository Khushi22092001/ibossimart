whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off heading on pagesize 500 linesize 32767 long 1000000 longchunksize 1000000 trimspool on
connect -name IMART

prompt === PAGE 118 ASSET URLS ===
select id,
       name page_name,
       css_file_urls,
       javascript_file_urls,
       dbms_lob.getlength(inline_css) inline_css_length,
       dbms_lob.getlength(javascript_code_onload) onload_js_length,
       to_char(last_updated_on, 'YYYY-MM-DD HH24:MI:SS') last_updated_on
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 118
   and security_group_id = 4744311978888504;

prompt === TARGET STATIC FILE IDS ===
select id, file_name, mime_type,
       dbms_lob.getlength(file_content) bytes
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and (id in (7710030000000118, 7710030000001118)
        or file_name in ('hspl-p118-compact-v2.js', 'hspl-p118-compact-v2.css'))
 order by file_name;

exit
