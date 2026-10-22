WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET FEEDBACK OFF
SET DEFINE OFF
SET LONG 10000000
SET LONGCHUNKSIZE 10000000
SET SQLFORMAT JSON
SET TERMOUT OFF
begin apex_util.set_security_group_id(4744311978888504);end;
/
SPOOL actions-after.json
select dynamic_action_id,dynamic_action_name,action_id,action_sequence,action_code,attributes from apex_application_page_da_acts where application_id=105 and page_id=197 order by dynamic_action_id,action_sequence;
select object_name,object_type from user_objects where status='INVALID' order by object_name,object_type;
SPOOL OFF
variable page_export clob
declare f apex_t_export_files;
begin f:=apex_export.get_application(p_application_id=>105,p_components=>apex_t_varchar2('PAGE:197'),p_with_date=>false,p_with_original_ids=>false);:page_export:=f(1).contents;end;
/
SPOOL page-after.json
select :page_export contents from dual;
SPOOL OFF
EXIT
