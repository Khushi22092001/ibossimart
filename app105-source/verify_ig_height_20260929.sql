whenever sqlerror exit failure rollback
set define off
connect -name IMART
set heading off feedback off pagesize 0 long 3000000 longchunksize 32767 linesize 32767 trimspool on termout off
spool verification/ig-height-live-after-20260929.txt
select css_file_urls || chr(10) || javascript_file_urls from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
select file_name || ':' || apex_web_service.blob2clobbase64(file_content) from apex_application_static_files where application_id=105 and file_name='hspl-detail-scroll.js';
spool off
set termout on
prompt IG_HEIGHT_ASSET_VERIFIED
exit
