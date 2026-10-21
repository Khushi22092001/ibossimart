-- Read-only. Abort before deployment if the inspected environment changed.
SET DEFINE OFF
SET SERVEROUTPUT ON
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
DECLARE n number;v varchar2(100);
BEGIN
 if user<>'IMART' then raise_application_error(-20841,'Expected parsing schema IMART.');end if;
 select version_no into v from apex_release;
 if v not like '26.1.%' then raise_application_error(-20841,'Expected verified APEX 26.1.');end if;
 select count(*) into n from apex_applications where application_id=105 and owner='IMART';
 if n<>1 then raise_application_error(-20841,'Expected application 105 owned by IMART.');end if;
 select count(*) into n from apex_application_pages where application_id=105 and page_id between 1100 and 1115;
 if n<>0 then raise_application_error(-20841,'Reserved page range is occupied. Do not overwrite.');end if;
 select count(*) into n from user_objects where object_name in ('IMART_ACTIVITY_EVENTS_V','IMART_ACTIVITY_SCOPE_V');
 if n<>0 then raise_application_error(-20841,'New view name already exists. Do not replace.');end if;
 select count(*) into n from apex_application_page_regions where application_id=105 and region_id=92002610209999000;
 if n<>0 then raise_application_error(-20841,'Activity hub card already exists.');end if;
 select count(*) into n from apex_application_authorization where application_id=105 and authorization_scheme_id=91004000000000002;
 if n<>1 then raise_application_error(-20841,'Existing Audit Inquiry authorization is missing.');end if;
 select count(*) into n from user_objects where object_name in ('IMART_AUDIT_EVENT_V','IMART_AUDIT_CHANGE_V','IMART_AUDIT','IMART_AUDIT_SESSION') and status='VALID';
 if n<4 then raise_application_error(-20841,'Existing audit dependencies are invalid or missing.');end if;
 dbms_output.put_line('PASS preflight: new objects/pages available; verified audit dependencies present.');
END;
/
