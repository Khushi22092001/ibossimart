whenever sqlerror exit failure rollback
set define off
connect -name IMART
set heading off feedback off pagesize 0 long 3000000 longchunksize 32767 linesize 32767 trimspool on termout off
spool verification/responsive-ui-live-before-20260929.txt
select css_file_urls || chr(10) || javascript_file_urls from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
select file_name || ':' || apex_web_service.blob2clobbase64(file_content)
from apex_application_static_files where application_id=105 and file_name in ('hspl-theme.css','design-system.css','hspl-master-forms.css','hspl-grid-compact.css','hspl-scroll-layout.css','hspl-responsive-ui.css');
spool off
set termout on
select column_name from all_tab_columns where owner='APEX_260100' and table_name='APEX_APPLICATION_STATIC_FILES' order by column_id;
prompt RESPONSIVE_UI_BACKUP_COMPLETE
exit
