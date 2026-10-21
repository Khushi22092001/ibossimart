-- Update only the two reporting views introduced by this approved module.
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
DECLARE current_ddl clob;previous_ddl clob:=q'!CREATE OR REPLACE FORCE EDITIONABLE VIEW "IMART"."IMART_AUDIT_EVENT_V" ("AUDIT_EVENT_ID", "EVENT_TIMESTAMP", "AUDIT_SESSION_ID", "APPLICATION_ID", "APEX_SESSION_ID", "USER_NAME", "BOSSUSERCODE", "EMPLOYEE_CODE", "DATABASE_USER", "CURRENT_SCHEMA_NAME", "DB_SESSION_ID", "DB_HOST", "SERVER_HOST", "BACKGROUND_JOB_ID", "COMPANY_CODE", "LOCATION_CODE", "MODULE_CODE", "PAGE_ID", "PAGE_NAME", "PAGE_ALIAS", "FORM_NAME", "TABLE_NAME", "OLD_PRIMARY_KEY", "NEW_PRIMARY_KEY", "RECORD_KEY", "RECORD_KEY_HASH", "PARENT_TABLE", "PARENT_KEY", "TRANSACTION_REFERENCE", "REQUEST_ID", "TRANSACTION_ID", "ACTION_TYPE", "EVENT_TYPE", "SOURCE_TYPE", "OUTCOME", "IP_ADDRESS", "USER_AGENT", "CLIENT_IDENTIFIER", "DB_MODULE", "DB_ACTION", "REQUEST_NAME", "BUTTON_NAME", "PROCESS_NAME", "ERROR_CODE", "REMARKS", "RESOLVED_MODULE_CODE", "MODULE_NAME", "MODULE_MAPPING_SOURCE") AS
  select e."AUDIT_EVENT_ID",e."EVENT_TIMESTAMP",e."AUDIT_SESSION_ID",e."APPLICATION_ID",e."APEX_SESSION_ID",e."USER_NAME",e."BOSSUSERCODE",e."EMPLOYEE_CODE",e."DATABASE_USER",e."CURRENT_SCHEMA_NAME",e."DB_SESSION_ID",e."DB_HOST",e."SERVER_HOST",e."BACKGROUND_JOB_ID",e."COMPANY_CODE",e."LOCATION_CODE",e."MODULE_CODE",e."PAGE_ID",e."PAGE_NAME",e."PAGE_ALIAS",e."FORM_NAME",e."TABLE_NAME",e."OLD_PRIMARY_KEY",e."NEW_PRIMARY_KEY",e."RECORD_KEY",e."RECORD_KEY_HASH",e."PARENT_TABLE",e."PARENT_KEY",e."TRANSACTION_REFERENCE",e."REQUEST_ID",e."TRANSACTION_ID",e."ACTION_TYPE",e."EVENT_TYPE",e."SOURCE_TYPE",e."OUTCOME",e."IP_ADDRESS",e."USER_AGENT",e."CLIENT_IDENTIFIER",e."DB_MODULE",e."DB_ACTION",e."REQUEST_NAME",e."BUTTON_NAME",e."PROCESS_NAME",e."ERROR_CODE",e."REMARKS",
 coalesce(e.module_code,tc.module_code,pm.module_code) resolved_module_code,
 coalesce(m.module_name,case when e.event_type='AUTHENTICATION' then 'Authentication' when e.page_id between 1090 and 1096 and e.application_id=105 then 'Audit Trail' else 'Unmapped module' end) module_name,
 case when e.module_code is not null then 'Recorded with event' when tc.module_code is not null then 'Current table mapping (historical event)' when pm.module_code is not null then 'Current page mapping (historical event)' else 'No unique ERP module mapping' end module_mapping_source
from IMART_AUDIT_EVENT e
left join IMART_AUDIT_CONFIG tc on tc.table_name=e.table_name and exists(select 1 from module x where x.modulecode=tc.module_code)
left join IMART_AUDIT_MODULE_PAGE_V pm on pm.page_id=e.page_id and e.application_id=105
left join (select modulecode,max(regexp_replace(modulename,'[[:space:]]+',' ')) module_name from module group by modulecode) m on m.modulecode=coalesce(e.module_code,tc.module_code,pm.module_code)
where IMART_AUDIT.can_read(e.company_code,e.location_code)=1;!';n number;
BEGIN
 if user<>'IMART' then raise_application_error(-20841,'Expected IMART');end if;
 current_ddl:=dbms_metadata.get_ddl('VIEW','IMART_AUDIT_EVENT_V');
 if dbms_lob.instr(lower(current_ddl),'select e.')=0 or dbms_lob.instr(lower(previous_ddl),'select e.')=0 then raise_application_error(-20841,'Cannot locate inspected view query');end if;
 current_ddl:=substr(current_ddl,dbms_lob.instr(lower(current_ddl),'select e.'));
 previous_ddl:=substr(previous_ddl,dbms_lob.instr(lower(previous_ddl),'select e.'));
 current_ddl:=regexp_replace(regexp_replace(replace(current_ddl,chr(13),''),'^[[:space:]]+|[[:space:]]+$',''),';$','');
 previous_ddl:=regexp_replace(regexp_replace(replace(previous_ddl,chr(13),''),'^[[:space:]]+|[[:space:]]+$',''),';$','');
 if dbms_lob.compare(current_ddl,previous_ddl)<>0 then
 dbms_output.put_line('Query lengths: current='||dbms_lob.getlength(current_ddl)||', inspected='||dbms_lob.getlength(previous_ddl));
 for i in 1..least(dbms_lob.getlength(current_ddl),dbms_lob.getlength(previous_ddl)) loop
 if dbms_lob.substr(current_ddl,1,i)<>dbms_lob.substr(previous_ddl,1,i) then
 dbms_output.put_line('First difference at '||i||'; current: '||dbms_lob.substr(current_ddl,120,greatest(1,i-30)));
 dbms_output.put_line('Inspected: '||dbms_lob.substr(previous_ddl,120,greatest(1,i-30)));exit;end if;end loop;
 raise_application_error(-20841,'Existing secured view query differs from inspected source; review before optimizing');end if;
 select count(*) into n from user_objects where object_name in ('IMART_ACTIVITY_EVENTS_V','IMART_ACTIVITY_SCOPE_V') and object_type='VIEW' and status='VALID';
 if n<>2 then raise_application_error(-20841,'Expected both newly installed reporting views');end if;
 dbms_output.put_line('PASS: existing secured source matches inspected source; central can_read remains authoritative.');
END;
/
SET TERMOUT OFF
SPOOL before-reporting-optimization-1792571330139.sql
SELECT dbms_metadata.get_ddl('VIEW','IMART_ACTIVITY_EVENTS_V') FROM dual;
SELECT dbms_metadata.get_ddl('VIEW','IMART_ACTIVITY_SCOPE_V') FROM dual;
SPOOL OFF
SET TERMOUT ON
SPOOL reporting-optimization.log

create or replace view IMART_ACTIVITY_EVENTS_V as
select e.audit_event_id,e.event_timestamp,
 cast(e.event_timestamp at time zone 'Asia/Kolkata' as timestamp) local_timestamp,
 e.user_name,e.bossusercode,e.employee_code,em.employee_name current_employee_name,em.department_code current_department_code,dp.department_name current_department_name,e.company_code,e.location_code,
 coalesce(c.company_name,e.company_code,'Unscoped') company_name,
 coalesce(l.location_name,e.location_code,'Unspecified') location_name,
 nvl(e.resolved_module_code,'UNMAPPED') module_code,e.module_name,e.module_mapping_source,
 e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,
 case when e.table_name is not null and coalesce(rawtohex(e.record_key_hash),e.record_key) is not null then length(e.table_name)||':'||e.table_name||':'||coalesce(rawtohex(e.record_key_hash),e.record_key) end record_identity,e.parent_table,e.parent_key,e.transaction_reference,
 rawtohex(e.request_id) correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,
 e.action_type original_action,e.event_type,e.source_type,e.outcome,e.error_code,
 case when e.action_type in ('INSERT','UPDATE','DELETE','APPROVE','REJECT','EXPORT','LOGIN','LOGOUT') then e.action_type
 when e.action_type in ('VIEW','READ') then 'VIEW'
 when e.table_name='BOSSUSERROLE' and e.event_type='ROW_CHANGE' then 'PERMISSION / ROLE CHANGE'
 else 'OTHER' end operation,
 case when e.outcome='FAILURE' then 'Captured failure'
 when e.action_type='DELETE' then 'Deletion activity'
 when e.table_name in ('BOSSUSER','BOSSUSERROLE') and e.event_type='ROW_CHANGE' then 'Administrative entity change'
 else null end exception_reason,
 case when e.event_type='ROW_CHANGE' and e.outcome='SUCCESS' then 1 else 0 end successful_row_operation,
 case when exists(select 1 from module m where upper(m.mastertablename)=e.table_name) then 'Current ERP master mapping' else null end master_mapping
from (select e."AUDIT_EVENT_ID",e."EVENT_TIMESTAMP",e."AUDIT_SESSION_ID",e."APPLICATION_ID",e."APEX_SESSION_ID",e."USER_NAME",e."BOSSUSERCODE",e."EMPLOYEE_CODE",e."COMPANY_CODE",e."LOCATION_CODE",e."PAGE_ID",e."PAGE_NAME",e."FORM_NAME",e."TABLE_NAME",e."RECORD_KEY",e."RECORD_KEY_HASH",e."PARENT_TABLE",e."PARENT_KEY",e."TRANSACTION_REFERENCE",e."REQUEST_ID",e."TRANSACTION_ID",e."ACTION_TYPE",e."EVENT_TYPE",e."SOURCE_TYPE",e."OUTCOME",e."ERROR_CODE",
 coalesce(e.module_code,tc.module_code,pm.module_code) resolved_module_code,
 coalesce(m.module_name,case when e.event_type='AUTHENTICATION' then 'Authentication' when e.page_id between 1090 and 1096 and e.application_id=105 then 'Audit Trail' else 'Unmapped module' end) module_name,
 case when e.module_code is not null then 'Recorded with event' when tc.module_code is not null then 'Current table mapping (historical event)' when pm.module_code is not null then 'Current page mapping (historical event)' else 'No unique ERP module mapping' end module_mapping_source
from IMART_AUDIT_EVENT e
left join IMART_AUDIT_CONFIG tc on tc.table_name=e.table_name and exists(select 1 from module x where x.modulecode=tc.module_code)
left join IMART_AUDIT_MODULE_PAGE_V pm on pm.page_id=e.page_id and e.application_id=105
left join (select modulecode,max(regexp_replace(modulename,'[[:space:]]+',' ')) module_name from module group by modulecode) m on m.modulecode=coalesce(e.module_code,tc.module_code,pm.module_code)
where (select /*+ no_unnest */ IMART_AUDIT.can_read(e.company_code,e.location_code) from dual)=1) e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105;

create or replace view IMART_ACTIVITY_SCOPE_V as
select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state('P1100_FROM') as date,'FXDD-MM-YYYY')=1 then to_date(apex_util.get_session_state('P1100_FROM'),'FXDD-MM-YYYY') when validate_conversion(apex_util.get_session_state('P1100_FROM') as date,'FXYYYY-MM-DD')=1 then to_date(apex_util.get_session_state('P1100_FROM'),'FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state('P1100_TO') as date,'FXDD-MM-YYYY')=1 then to_date(apex_util.get_session_state('P1100_TO'),'FXDD-MM-YYYY') when validate_conversion(apex_util.get_session_state('P1100_TO') as date,'FXYYYY-MM-DD')=1 then to_date(apex_util.get_session_state('P1100_TO'),'FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state('P1100_TO') as date,'FXDD-MM-YYYY')=1 then to_date(apex_util.get_session_state('P1100_TO'),'FXDD-MM-YYYY') when validate_conversion(apex_util.get_session_state('P1100_TO') as date,'FXYYYY-MM-DD')=1 then to_date(apex_util.get_session_state('P1100_TO'),'FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state('P1100_FROM') as date,'FXDD-MM-YYYY')=1 then to_date(apex_util.get_session_state('P1100_FROM'),'FXDD-MM-YYYY') when validate_conversion(apex_util.get_session_state('P1100_FROM') as date,'FXYYYY-MM-DD')=1 then to_date(apex_util.get_session_state('P1100_FROM'),'FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state('P1100_TO') as date,'FXDD-MM-YYYY')=1 then to_date(apex_util.get_session_state('P1100_TO'),'FXDD-MM-YYYY') when validate_conversion(apex_util.get_session_state('P1100_TO') as date,'FXYYYY-MM-DD')=1 then to_date(apex_util.get_session_state('P1100_TO'),'FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion(apex_util.get_session_state('P1100_FROM') as date,'FXDD-MM-YYYY')=1 then to_date(apex_util.get_session_state('P1100_FROM'),'FXDD-MM-YYYY') when validate_conversion(apex_util.get_session_state('P1100_FROM') as date,'FXYYYY-MM-DD')=1 then to_date(apex_util.get_session_state('P1100_FROM'),'FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_COMPANY') from dual) is null or e.company_code=(select /*+ no_unnest */ apex_util.get_session_state('P1100_COMPANY') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_LOCATION') from dual) is null or e.location_code=(select /*+ no_unnest */ apex_util.get_session_state('P1100_LOCATION') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_USER') from dual) is null or e.user_name=(select /*+ no_unnest */ apex_util.get_session_state('P1100_USER') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_EMPLOYEE') from dual) is null or e.employee_code=(select /*+ no_unnest */ apex_util.get_session_state('P1100_EMPLOYEE') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_MODULE') from dual) is null or e.module_code=(select /*+ no_unnest */ apex_util.get_session_state('P1100_MODULE') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_PAGE') from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ apex_util.get_session_state('P1100_PAGE') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_ACTION') from dual) is null or e.operation=(select /*+ no_unnest */ apex_util.get_session_state('P1100_ACTION') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_OUTCOME') from dual) is null or e.outcome=(select /*+ no_unnest */ apex_util.get_session_state('P1100_OUTCOME') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_SOURCE') from dual) is null or e.source_type=(select /*+ no_unnest */ apex_util.get_session_state('P1100_SOURCE') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_TABLE') from dual) is null or e.table_name=(select /*+ no_unnest */ apex_util.get_session_state('P1100_TABLE') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_RECORD') from dual) is null or e.record_key=(select /*+ no_unnest */ apex_util.get_session_state('P1100_RECORD') from dual))
and ((select /*+ no_unnest */ apex_util.get_session_state('P1100_DEPARTMENT') from dual) is null or e.current_department_code=(select /*+ no_unnest */ apex_util.get_session_state('P1100_DEPARTMENT') from dual));

SELECT OBJECT_NAME,STATUS FROM USER_OBJECTS WHERE OBJECT_NAME IN('IMART_ACTIVITY_EVENTS_V','IMART_ACTIVITY_SCOPE_V');
SELECT COUNT(*) SECURED_REPORT_ROWS_OUTSIDE_WEB FROM IMART_ACTIVITY_EVENTS_V;
SPOOL OFF
EXIT
