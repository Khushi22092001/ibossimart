whenever sqlerror exit failure rollback
set define off
connect -name IMART
set heading off feedback off pagesize 0 long 1000000 longchunksize 32767 linesize 32767 trimspool on termout off
spool "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\live-theme-shading-20260921.b64"
select apex_web_service.blob2clobbase64(file_content)
  from apex_application_static_files
 where application_id = 105 and file_name = 'hspl-theme.css';
spool off
exit
