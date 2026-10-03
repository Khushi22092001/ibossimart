whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
@app105-source/master-insights-plan/reports_package.sql
select name,line,text from user_errors where name='IMART_MASTER_REPORTS';
declare n number;
begin
 select count(*) into n from user_errors where name='IMART_MASTER_REPORTS';
 if n>0 then raise_application_error(-20003,'Package compilation failed'); end if;
 select count(*) into n from imart_mr_catalog;
 if n>0 then raise_application_error(-20004,'Catalogue already seeded'); end if;
end;
/
@app105-source/master-insights-plan/reports_catalog_seed.sql
begin apex_application_install.set_application_id(105); apex_application_install.set_offset(0); end;
/
@app105-source/master-insights-plan/reports_pages.sql
commit;
prompt MASTER_REPORTS_DEPLOYED
exit
