-- Reference scope: inspected BOSS grant company 1 / all locations. No web-context impersonation.
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
SET TIMING ON
SET SQLFORMAT ANSICONSOLE
SET LINESIZE 240
SPOOL reconciliation.log
SELECT COUNT(*) EXPECTED_GRANT FROM IMART_AUDIT_ACCESS WHERE BOSSUSERCODE='1' AND COMPANY_SCOPE='1' AND LOCATION_SCOPE='*';
VARIABLE P1113_D1 VARCHAR2(4000)
VARIABLE P1113_V1 VARCHAR2(4000)
VARIABLE P1113_D2 VARCHAR2(4000)
VARIABLE P1113_V2 VARCHAR2(4000)
VARIABLE P1113_D3 VARCHAR2(4000)
VARIABLE P1113_V3 VARCHAR2(4000)
VARIABLE P1113_D4 VARCHAR2(4000)
VARIABLE P1113_V4 VARCHAR2(4000)
VARIABLE P1114_EVENT NUMBER
BEGIN :P1114_EVENT:=85874;END;
/
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'No event multiplication' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select count(*) from IMART_ACTIVITY_SCOPE_V) actual,(select count(distinct audit_event_id) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Outcome partition' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select sum(case when outcome='SUCCESS' then 1 when outcome='FAILURE' then 1 when outcome='OBSERVED' then 1 else 1 end) from IMART_ACTIVITY_SCOPE_V) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1101' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select activity_period,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(company_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(location_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,case when regexp_like(to_char(module_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,cast(null as varchar2(4000)) detail_url from (select case when 'DAY'='HOUR' then trunc(local_timestamp,'HH24') when 'DAY'='MONTH' then trunc(local_timestamp,'MM') else trunc(local_timestamp) end activity_period,company_name,location_name,module_name,company_code,location_code,module_code,count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity from IMART_ACTIVITY_SCOPE_V group by case when 'DAY'='HOUR' then trunc(local_timestamp,'HH24') when 'DAY'='MONTH' then trunc(local_timestamp,'MM') else trunc(local_timestamp) end,company_name,location_name,module_name,company_code,location_code,module_code))) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1102' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(company_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(location_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,cast(null as varchar2(4000)) detail_url from (select user_name,bossusercode,employee_code,current_employee_name,current_department_name,company_name,location_name,company_code,location_code,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by user_name,bossusercode,employee_code,current_employee_name,current_department_name,company_name,location_name,company_code,location_code))) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1103' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(module_mapping_source),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_mapping_source) else to_char(module_mapping_source) end module_mapping_source,case when regexp_like(to_char(module_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,case when regexp_like(to_char(page_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_id) else to_char(page_id) end page_id,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,cast(null as varchar2(4000)) detail_url from (select module_name,page_name,form_name,module_mapping_source,module_code,page_id,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by module_name,page_name,form_name,module_mapping_source,module_code,page_id))) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1104' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(company_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,cast(null as varchar2(4000)) detail_url from (select company_code,company_name,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by company_code,company_name))) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1105' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(company_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,cast(null as varchar2(4000)) detail_url from (select company_name,location_code,location_name,company_code,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by company_name,location_code,location_name,company_code))) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1106' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(module_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,case when regexp_like(to_char(row_kind),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(row_kind) else to_char(row_kind) end row_kind,case when row_kind='Detail' then cast(null as varchar2(4000)) when row_kind='Row total' then cast(null as varchar2(4000)) when row_kind='Column total' then cast(null as varchar2(4000)) else cast(null as varchar2(4000)) end detail_url from (select user_name,module_name,module_code,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity,case when grouping(user_name)=1 and grouping(module_code)=1 then 'Grand total' when grouping(user_name)=1 then 'Column total' when grouping(module_code)=1 then 'Row total' else 'Detail' end row_kind
from IMART_ACTIVITY_SCOPE_V group by grouping sets ((user_name,module_name,module_code),(user_name),(module_name,module_code),()))) where row_kind='Detail') actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1107' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(company_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_code) else to_char(company_code) end company_code,case when regexp_like(to_char(location_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_code) else to_char(location_code) end location_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,case when regexp_like(to_char(row_kind),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(row_kind) else to_char(row_kind) end row_kind,case when row_kind='Detail' then cast(null as varchar2(4000)) when row_kind='Row total' then cast(null as varchar2(4000)) when row_kind='Column total' then cast(null as varchar2(4000)) else cast(null as varchar2(4000)) end detail_url from (select company_name,location_name,company_code,location_code,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity,case when grouping(company_code)=1 and grouping(location_code)=1 then 'Grand total' when grouping(company_code)=1 then 'Column total' when grouping(location_code)=1 then 'Row total' else 'Detail' end row_kind
from IMART_ACTIVITY_SCOPE_V group by grouping sets ((company_name,location_name,company_code,location_code),(company_name,company_code),(location_name,location_code),()))) where row_kind='Detail') actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Summary 1108' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (select nvl(sum(total_events),0) from (select case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(module_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_code) else to_char(module_code) end module_code,total_events,successful_events,failed_events,observed_events,inserts,updates,deletes,other_events,active_users,distinct_records,successful_row_operations,first_activity,last_activity,cast(null as varchar2(4000)) detail_url from (select operation,original_action,module_name,company_name,location_name,user_name,module_code,
count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,min(local_timestamp) first_activity,max(local_timestamp) last_activity
from IMART_ACTIVITY_SCOPE_V group by operation,original_action,module_name,company_name,location_name,user_name,module_code))) actual,(select count(*) from IMART_ACTIVITY_SCOPE_V) expected from dual);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Exception Activity MIS' report_name,count(*) result_rows from (select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,cast(null as varchar2(4000)) detail_url from IMART_ACTIVITY_SCOPE_V where exception_reason is not null);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Login and Session MIS' report_name,count(*) result_rows from (select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,cast(null as varchar2(4000)) detail_url from IMART_ACTIVITY_SCOPE_V where event_type='AUTHENTICATION');
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Master Data Change MIS' report_name,count(*) result_rows from (select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,cast(null as varchar2(4000)) detail_url from IMART_ACTIVITY_SCOPE_V where event_type='ROW_CHANGE' and master_mapping is not null);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Administrative Entity Audit' report_name,count(*) result_rows from (select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,cast(null as varchar2(4000)) detail_url from IMART_ACTIVITY_SCOPE_V where event_type='ROW_CHANGE' and table_name in ('BOSSUSER','BOSSUSERROLE'));
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'User Activity Detail' report_name,count(*) result_rows from (select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,cast(null as varchar2(4000)) detail_url,cast(null as varchar2(4000)) history_url from IMART_ACTIVITY_SCOPE_V where 1=1 and (:P1113_D1 is null or case :P1113_D1 when 'USER' then nvl(to_char(user_name),'~NULL~') when 'COMPANY' then nvl(to_char(company_code),'~NULL~') when 'LOCATION' then nvl(to_char(location_code),'~NULL~') when 'MODULE' then nvl(to_char(module_code),'~NULL~') when 'PAGE' then nvl(to_char(page_id),'~NULL~') when 'ACTION' then nvl(to_char(operation),'~NULL~') when 'OUTCOME' then nvl(to_char(outcome),'~NULL~') when 'SOURCE' then nvl(to_char(source_type),'~NULL~') when 'TABLE' then nvl(to_char(table_name),'~NULL~') when 'RECORD' then nvl(to_char(record_key),'~NULL~') when 'EVENT' then nvl(to_char(audit_event_id),'~NULL~') when 'EXCEPTION' then nvl(to_char(exception_reason),'~NULL~') when 'ROW_SUCCESS' then nvl(to_char(successful_row_operation),'~NULL~') when 'KEYED' then nvl(to_char(case when record_identity is not null then '1' else '0' end),'~NULL~') when 'OTHEROPS' then nvl(to_char(case when operation not in ('INSERT','UPDATE','DELETE') then '1' else '0' end),'~NULL~') when 'PERIOD' then to_char(local_timestamp,case length(:P1113_V1) when 7 then 'YYYY-MM' when 13 then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) end = replace(replace(:P1113_V1,'%2C',','),'%25','%'))
and (:P1113_D2 is null or case :P1113_D2 when 'USER' then nvl(to_char(user_name),'~NULL~') when 'COMPANY' then nvl(to_char(company_code),'~NULL~') when 'LOCATION' then nvl(to_char(location_code),'~NULL~') when 'MODULE' then nvl(to_char(module_code),'~NULL~') when 'PAGE' then nvl(to_char(page_id),'~NULL~') when 'ACTION' then nvl(to_char(operation),'~NULL~') when 'OUTCOME' then nvl(to_char(outcome),'~NULL~') when 'SOURCE' then nvl(to_char(source_type),'~NULL~') when 'TABLE' then nvl(to_char(table_name),'~NULL~') when 'RECORD' then nvl(to_char(record_key),'~NULL~') when 'EVENT' then nvl(to_char(audit_event_id),'~NULL~') when 'EXCEPTION' then nvl(to_char(exception_reason),'~NULL~') when 'ROW_SUCCESS' then nvl(to_char(successful_row_operation),'~NULL~') when 'KEYED' then nvl(to_char(case when record_identity is not null then '1' else '0' end),'~NULL~') when 'OTHEROPS' then nvl(to_char(case when operation not in ('INSERT','UPDATE','DELETE') then '1' else '0' end),'~NULL~') when 'PERIOD' then to_char(local_timestamp,case length(:P1113_V2) when 7 then 'YYYY-MM' when 13 then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) end = replace(replace(:P1113_V2,'%2C',','),'%25','%'))
and (:P1113_D3 is null or case :P1113_D3 when 'USER' then nvl(to_char(user_name),'~NULL~') when 'COMPANY' then nvl(to_char(company_code),'~NULL~') when 'LOCATION' then nvl(to_char(location_code),'~NULL~') when 'MODULE' then nvl(to_char(module_code),'~NULL~') when 'PAGE' then nvl(to_char(page_id),'~NULL~') when 'ACTION' then nvl(to_char(operation),'~NULL~') when 'OUTCOME' then nvl(to_char(outcome),'~NULL~') when 'SOURCE' then nvl(to_char(source_type),'~NULL~') when 'TABLE' then nvl(to_char(table_name),'~NULL~') when 'RECORD' then nvl(to_char(record_key),'~NULL~') when 'EVENT' then nvl(to_char(audit_event_id),'~NULL~') when 'EXCEPTION' then nvl(to_char(exception_reason),'~NULL~') when 'ROW_SUCCESS' then nvl(to_char(successful_row_operation),'~NULL~') when 'KEYED' then nvl(to_char(case when record_identity is not null then '1' else '0' end),'~NULL~') when 'OTHEROPS' then nvl(to_char(case when operation not in ('INSERT','UPDATE','DELETE') then '1' else '0' end),'~NULL~') when 'PERIOD' then to_char(local_timestamp,case length(:P1113_V3) when 7 then 'YYYY-MM' when 13 then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) end = replace(replace(:P1113_V3,'%2C',','),'%25','%'))
and (:P1113_D4 is null or case :P1113_D4 when 'USER' then nvl(to_char(user_name),'~NULL~') when 'COMPANY' then nvl(to_char(company_code),'~NULL~') when 'LOCATION' then nvl(to_char(location_code),'~NULL~') when 'MODULE' then nvl(to_char(module_code),'~NULL~') when 'PAGE' then nvl(to_char(page_id),'~NULL~') when 'ACTION' then nvl(to_char(operation),'~NULL~') when 'OUTCOME' then nvl(to_char(outcome),'~NULL~') when 'SOURCE' then nvl(to_char(source_type),'~NULL~') when 'TABLE' then nvl(to_char(table_name),'~NULL~') when 'RECORD' then nvl(to_char(record_key),'~NULL~') when 'EVENT' then nvl(to_char(audit_event_id),'~NULL~') when 'EXCEPTION' then nvl(to_char(exception_reason),'~NULL~') when 'ROW_SUCCESS' then nvl(to_char(successful_row_operation),'~NULL~') when 'KEYED' then nvl(to_char(case when record_identity is not null then '1' else '0' end),'~NULL~') when 'OTHEROPS' then nvl(to_char(case when operation not in ('INSERT','UPDATE','DELETE') then '1' else '0' end),'~NULL~') when 'PERIOD' then to_char(local_timestamp,case length(:P1113_V4) when 7 then 'YYYY-MM' when 13 then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) end = replace(replace(:P1113_V4,'%2C',','),'%25','%')));
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Record Audit History' report_name,count(*) result_rows from (select audit_event_id,local_timestamp,case when regexp_like(to_char(user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(user_name) else to_char(user_name) end user_name,case when regexp_like(to_char(bossusercode),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(bossusercode) else to_char(bossusercode) end bossusercode,case when regexp_like(to_char(employee_code),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(employee_code) else to_char(employee_code) end employee_code,case when regexp_like(to_char(current_employee_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_employee_name) else to_char(current_employee_name) end current_employee_name,case when regexp_like(to_char(current_department_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(current_department_name) else to_char(current_department_name) end current_department_name,case when regexp_like(to_char(company_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(company_name) else to_char(company_name) end company_name,case when regexp_like(to_char(location_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(location_name) else to_char(location_name) end location_name,case when regexp_like(to_char(module_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(module_name) else to_char(module_name) end module_name,case when regexp_like(to_char(page_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(page_name) else to_char(page_name) end page_name,case when regexp_like(to_char(form_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(form_name) else to_char(form_name) end form_name,case when regexp_like(to_char(original_action),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(original_action) else to_char(original_action) end original_action,case when regexp_like(to_char(operation),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(operation) else to_char(operation) end operation,case when regexp_like(to_char(event_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(event_type) else to_char(event_type) end event_type,case when regexp_like(to_char(table_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(table_name) else to_char(table_name) end table_name,case when regexp_like(to_char(record_key),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(record_key) else to_char(record_key) end record_key,case when regexp_like(to_char(transaction_reference),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_reference) else to_char(transaction_reference) end transaction_reference,case when regexp_like(to_char(outcome),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(outcome) else to_char(outcome) end outcome,error_code,audit_session_id,case when regexp_like(to_char(apex_session_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(apex_session_id) else to_char(apex_session_id) end apex_session_id,case when regexp_like(to_char(source_type),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(source_type) else to_char(source_type) end source_type,case when regexp_like(to_char(correlation_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(correlation_id) else to_char(correlation_id) end correlation_id,case when regexp_like(to_char(transaction_id),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(transaction_id) else to_char(transaction_id) end transaction_id,case when regexp_like(to_char(exception_reason),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(exception_reason) else to_char(exception_reason) end exception_reason,cast(null as varchar2(4000)) detail_url from IMART_ACTIVITY_SCOPE_V e where exists(select 1 from IMART_ACTIVITY_EVENTS_V chosen where chosen.audit_event_id=to_number(:P1114_EVENT default null on conversion error) and chosen.table_name=e.table_name and chosen.record_identity is not null and chosen.record_identity=e.record_identity));
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Observed authenticated sessions' report_name,count(*) result_rows from (select s.audit_session_id,case when regexp_like(to_char(s.user_name),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(s.user_name) else to_char(s.user_name) end user_name,case when regexp_like(to_char(max(e.company_name)),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(max(e.company_name)) else to_char(max(e.company_name)) end company_name,
 cast(s.observed_at at time zone 'Asia/Kolkata' as timestamp) session_started,
 cast(min(case when e.event_type='AUTHENTICATION' and e.original_action in ('LOGOUT','SESSION_EXPIRED') and e.event_timestamp>=s.observed_at then e.event_timestamp end) at time zone 'Asia/Kolkata' as timestamp) session_end,
 max(e.local_timestamp) last_activity,
 round((cast(min(case when e.event_type='AUTHENTICATION' and e.original_action in ('LOGOUT','SESSION_EXPIRED') and e.event_timestamp>=s.observed_at then sys_extract_utc(e.event_timestamp) end) as date)-cast(sys_extract_utc(s.observed_at) as date))*1440,2) session_minutes,
 case when count(case when e.event_type='AUTHENTICATION' and e.original_action in ('LOGOUT','SESSION_EXPIRED') and e.event_timestamp>=s.observed_at then 1 end)>0 then 'Recorded end within selected period' else 'No recorded end within selected period' end end_status
 from IMART_ACTIVITY_SCOPE_V e join IMART_AUDIT_SESSION s on s.audit_session_id=e.audit_session_id and s.application_id=105 and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name
 group by s.audit_session_id,s.user_name,s.observed_at);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Activity trend' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Operation distribution' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (select operation label,operation series,count(*) value from IMART_ACTIVITY_SCOPE_V group by operation);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Module activity (top 12 plus others)' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (select case when r.rn<=12 then e.module_name else 'Other modules' end label,e.operation series,count(*) value,case when r.rn<=12 then e.module_code else '~OTHER~' end drill_key
 from IMART_ACTIVITY_SCOPE_V e join (select module_code,row_number() over(order by count(*) desc,module_code) rn from IMART_ACTIVITY_SCOPE_V group by module_code) r on r.module_code=e.module_code
 group by case when r.rn<=12 then e.module_name else 'Other modules' end,e.operation,case when r.rn<=12 then e.module_code else '~OTHER~' end);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Top active ERP users' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (select user_name label,'Events' series,count(*) value from IMART_ACTIVITY_SCOPE_V where source_type='APEX_USER' and user_name is not null group by user_name order by value desc,user_name fetch first 10 rows only);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Company and location comparison' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (select company_name||' / '||location_name label,'Events' series,count(*) value,company_code drill_key,location_code drill_location from IMART_ACTIVITY_SCOPE_V group by company_name,location_name,company_code,location_code);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select 'Exception categories' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (select exception_reason label,'Events' series,count(*) value from IMART_ACTIVITY_SCOPE_V where exception_reason is not null group by exception_reason);
with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.company_code='1') e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105),IMART_ACTIVITY_SCOPE_V as (select e.audit_event_id,e.event_timestamp,e.local_timestamp,e.user_name,e.bossusercode,e.employee_code,e.company_code,e.location_code,e.company_name,e.location_name,e.module_code,e.module_name,e.module_mapping_source,e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,e.record_identity,e.parent_table,e.parent_key,e.transaction_reference,e.correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,e.original_action,e.event_type,e.source_type,e.outcome,e.error_code,e.operation,e.exception_reason,e.successful_row_operation,e.master_mapping,e.current_employee_name,e.current_department_code,e.current_department_name from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXDD-MM-YYYY')=1 then to_date('2026-10-20','FXDD-MM-YYYY') when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
and ((select /*+ no_unnest */ null from dual) is null or e.company_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.location_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.user_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.employee_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.module_code=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or to_char(e.page_id)=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.operation=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.outcome=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.source_type=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.table_name=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.record_key=(select /*+ no_unnest */ null from dual))
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual)))  select count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations,sum(case when original_action='LOGIN' and outcome='FAILURE' then 1 else 0 end) failed_logins from IMART_ACTIVITY_SCOPE_V;
WITH boundary_cases(t,expected) AS (
SELECT to_timestamp_tz('2026-10-19 18:29:59 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),0 FROM dual UNION ALL
SELECT to_timestamp_tz('2026-10-19 18:30:00 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),1 FROM dual UNION ALL
SELECT to_timestamp_tz('2026-10-20 18:29:59 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),1 FROM dual UNION ALL
SELECT to_timestamp_tz('2026-10-20 18:30:00 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),0 FROM dual)
SELECT 'Timezone midnight boundaries' TEST_NAME,CASE WHEN COUNT(*)=4 THEN 'PASS' ELSE 'FAIL' END RESULT FROM boundary_cases WHERE CASE WHEN t>=from_tz(timestamp '2026-10-20 00:00:00','Asia/Kolkata') AND t<from_tz(timestamp '2026-10-21 00:00:00','Asia/Kolkata') THEN 1 ELSE 0 END=expected;
SELECT 'Unchanged secured view outside web' TEST_NAME,CASE WHEN COUNT(*)=0 THEN 'PASS' ELSE 'FAIL' END RESULT FROM IMART_AUDIT_EVENT_V;
SPOOL OFF
EXIT
