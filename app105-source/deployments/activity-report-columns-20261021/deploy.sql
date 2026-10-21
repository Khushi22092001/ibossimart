WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
DECLARE n number;begin
if user<>'IMART' or sys_context('USERENV','CON_NAME')<>'ORA26PDB' then raise_application_error(-20841,'Unexpected target');end if;
select count(*) into n from apex_application_pages where application_id=105 and page_id between 1101 and 1114;
if n<>14 then raise_application_error(-20842,'Missing report pages');end if;
end;
/
@report-pages.sql
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
SET TERMOUT OFF
SPOOL deployed-report-pages.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:1101','PAGE:1102','PAGE:1103','PAGE:1104','PAGE:1105','PAGE:1106','PAGE:1107','PAGE:1108','PAGE:1109','PAGE:1110','PAGE:1111','PAGE:1112','PAGE:1113','PAGE:1114')));
SPOOL OFF
SET TERMOUT ON
EXIT
