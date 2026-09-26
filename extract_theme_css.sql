set heading off
set feedback off
set pagesize 0
set long 1000000
set longchunksize 32767
set linesize 32767
set trimspool on
set termout off
spool "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-theme.css.b64"
select apex_web_service.blob2clobbase64(file_content)
  from apex_application_static_files
 where application_id = 105
   and file_name = 'hspl-theme.css';
spool off
exit
