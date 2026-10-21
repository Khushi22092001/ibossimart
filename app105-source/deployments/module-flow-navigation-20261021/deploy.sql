WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
DECLARE n number; begin
if user<>'IMART' or sys_context('USERENV','CON_NAME')<>'ORA26PDB' then raise_application_error(-20841,'Unexpected target');end if;
select count(*) into n from apex_application_page_regions where application_id=105 and page_id=259 and region_id=465910995074396601;
if n<>1 then raise_application_error(-20842,'Unexpected navigation region');end if;
select count(*) into n from apex_application_pages where application_id=105 and ((page_id=263 and page_alias='MODULE-FLOW-LIST') or (page_id=264 and page_alias='MODULE-FLOW'));
if n<>2 then raise_application_error(-20843,'Missing Module Flow pages');end if;
end;
/
@page259.sql
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
SET TERMOUT OFF
SPOOL deployed-page259.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:259')));
SPOOL OFF
SET TERMOUT ON
EXIT
