WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
DECLARE n number; begin
if user<>'IMART' or sys_context('USERENV','CON_NAME')<>'ORA26PDB' then raise_application_error(-20841,'Unexpected schema'); end if;
select count(*) into n from apex_application_page_regions where application_id=105 and page_id=75 and region_id=583618271907140282;
if n<>1 then raise_application_error(-20842,'Unexpected form region'); end if;
select count(*) into n from apex_application_page_items where application_id=105 and page_id=75 and item_id in(583620318360140284,583619524718140283);
if n<>2 then raise_application_error(-20843,'Unexpected target items'); end if;
end;
/
@pages.sql
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
SET TERMOUT OFF
SPOOL deployed-pages.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:75')));
SPOOL OFF
SET TERMOUT ON
EXIT
