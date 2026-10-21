WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLFORMAT ANSICONSOLE
SPOOL trend-validation.log
declare actual number;expected number;periods number;points number;begin with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=365
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
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual))),trend as (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series) select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>24 or points<>72 then raise_application_error(-20842,'Trend reconciliation failed: Single day hourly');end if;dbms_output.put_line('PASS Single day hourly: events='||actual||', buckets='||periods||', points='||points);end;
/
declare actual number;expected number;periods number;points number;begin with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)<=365
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
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual))),trend as (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series) select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>7 or points<>21 then raise_application_error(-20842,'Trend reconciliation failed: Seven daily buckets');end if;dbms_output.put_line('PASS Seven daily buckets: events='||actual||', buckets='||periods||', points='||points);end;
/
declare actual number;expected number;periods number;points number;begin with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)<=365
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
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual))),trend as (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'HOUR'='MONTH' then 'MONTH' when ('HOUR'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)<=6) or ('HOUR'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'HOUR'='MONTH' then 'MONTH' when ('HOUR'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)<=6) or ('HOUR'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-14' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-14','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series) select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>168 or points<>504 then raise_application_error(-20842,'Trend reconciliation failed: Seven hourly days');end if;dbms_output.put_line('PASS Seven hourly days: events='||actual||', buckets='||periods||', points='||points);end;
/
declare actual number;expected number;periods number;points number;begin with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)<=365
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
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual))),trend as (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'HOUR'='MONTH' then 'MONTH' when ('HOUR'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)<=6) or ('HOUR'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'HOUR'='MONTH' then 'MONTH' when ('HOUR'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)<=6) or ('HOUR'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series) select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>20 or points<>60 then raise_application_error(-20842,'Trend reconciliation failed: Long hourly selection adapts');end if;dbms_output.put_line('PASS Long hourly selection adapts: events='||actual||', buckets='||periods||', points='||points);end;
/
declare actual number;expected number;periods number;points number;begin with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)<=365
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
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual))),trend as (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'MONTH'='MONTH' then 'MONTH' when ('MONTH'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)<=6) or ('MONTH'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual) t,case when 'MONTH'='MONTH' then 'MONTH' when ('MONTH'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)<=6) or ('MONTH'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-10-20' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-20','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-10-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-10-01','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series) select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>1 or points<>3 then raise_application_error(-20842,'Trend reconciliation failed: Monthly buckets');end if;dbms_output.put_line('PASS Monthly buckets: events='||actual||', buckets='||periods||', points='||points);end;
/
declare actual number;expected number;periods number;points number;begin with IMART_ACTIVITY_EVENTS_V as (select e.audit_event_id,e.event_timestamp,
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
where e.event_timestamp>=from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual) as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast((select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)+1 as timestamp),'Asia/Kolkata')
and (select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)>=(select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual) and (select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual)<=365
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
and ((select /*+ no_unnest */ null from dual) is null or e.current_department_code=(select /*+ no_unnest */ null from dual))),trend as (select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (select (select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end) b cross join (select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual) o left join (select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (select (select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual) f,(select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual) t,case when 'DAY'='MONTH' then 'MONTH' when ('DAY'='HOUR' and (select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)-(select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual)<=6) or ('DAY'='DAY' and (select /*+ no_unnest */ case when validate_conversion('2026-09-30' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-30','FXYYYY-MM-DD') end from dual)=(select /*+ no_unnest */ case when validate_conversion('2026-09-01' as date,'FXYYYY-MM-DD')=1 then to_date('2026-09-01','FXYYYY-MM-DD') end from dual)) then 'HOUR' else 'DAY' end grain from dual) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series) select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>0 or points<>0 then raise_application_error(-20842,'Trend reconciliation failed: Empty historical period');end if;dbms_output.put_line('PASS Empty historical period: events='||actual||', buckets='||periods||', points='||points);end;
/
SPOOL OFF
EXIT
