whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
declare n number;
begin
 select count(*) into n from apex_application_pages where application_id=105 and page_id between 942 and 950;
 if n>0 then raise_application_error(-20001,'Report page range is occupied; deployment stopped'); end if;
 select count(*) into n from user_objects where object_name in ('IMART_MR_CATALOG','IMART_MR_ROW','IMART_MR_ROWS','IMART_MASTER_REPORTS');
 if n>0 then raise_application_error(-20002,'Report objects already exist; deployment stopped'); end if;
end;
/
@app105-source/master-insights-plan/reports_schema.sql
@app105-source/master-insights-plan/reports_catalog_seed.sql
declare n number;
begin
 select count(*) into n from user_errors where name='IMART_MASTER_REPORTS';
 if n>0 then raise_application_error(-20003,'Report package compilation failed'); end if;
end;
/
begin apex_application_install.set_application_id(105); apex_application_install.set_offset(0); end;
/
@app105-source/master-insights-plan/reports_pages.sql
commit;
select name,type,line,text from user_errors where name like 'IMART_M%';
prompt MASTER_REPORTS_DEPLOYED
exit
