WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET FEEDBACK OFF
SET LONG 10000000
SET LONGCHUNKSIZE 10000000
SET SQLFORMAT JSON
SET TERMOUT OFF
begin apex_util.set_security_group_id(4744311978888504);end;
/
variable page_export clob
declare f apex_t_export_files;
begin
 f:=apex_export.get_application(p_application_id=>105,p_components=>apex_t_varchar2('PAGE:197'),p_with_date=>false,p_with_original_ids=>false);
 :page_export:=f(1).contents;
end;
/
SPOOL page-before.json
select :page_export contents from dual;
SPOOL OFF
EXIT
