-- Approved installation recovery: views already VALID; first page block rolled back.
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SPOOL apex-installation.log
DECLARE n number;begin
 select count(*) into n from apex_application_pages where application_id=105 and page_id between 1100 and 1115;
 if n<>0 then raise_application_error(-20841,'New page range occupied; inspect before continuing.');end if;
 select count(*) into n from user_objects where object_name in ('IMART_ACTIVITY_EVENTS_V','IMART_ACTIVITY_SCOPE_V') and status='VALID';
 if n<>2 then raise_application_error(-20841,'Expected two installed VALID reporting views.');end if;
end;
/
@02_apex_pages.sql
@03_dashboard_hub_card.sql
SPOOL OFF
EXIT
