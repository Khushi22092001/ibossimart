WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
SET TERMOUT OFF
SPOOL before-pages.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:76','PAGE:77')));
SPOOL OFF
SET TERMOUT ON
SET HEADING ON PAGESIZE 100
SPOOL inspection.log
select user,sys_context('USERENV','CON_NAME') pdb from dual;
select page_id,region_id,region_name from apex_application_page_regions where application_id=105 and page_id in(76,77);
select table_name,column_name,data_type from user_tab_columns where table_name in('MODULELOCATION','MODULELOCATIONDETAIL','LOCATION','COMPANY') order by table_name,column_id;
select a.modulecode,count(*) detail_rows,count(c.locationcode) codes,count(d.locationname) named_locations from modulelocation a left join modulelocationdetail c on c.tno=a.tno left join location d on d.locationcode=c.locationcode where a.companycode='1' group by a.modulecode order by a.modulecode;
select constraint_name,table_name,constraint_type,r_constraint_name from user_constraints where table_name in('MODULELOCATION','MODULELOCATIONDETAIL','LOCATION','COMPANY');
SPOOL OFF
EXIT
