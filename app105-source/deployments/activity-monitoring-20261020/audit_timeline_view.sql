

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "IMART"."IMART_AUDIT_TIMELINE_V" ("AUDIT_EVENT_ID", "EVENT_TIMESTAMP", "USER_NAME", "EMPLOYEE_CODE", "MODULE_CODE", "ACTION_TYPE", "TABLE_NAME", "RECORD_KEY", "OLD_PRIMARY_KEY", "NEW_PRIMARY_KEY", "PARENT_TABLE", "PARENT_KEY", "TRANSACTION_REFERENCE", "REQUEST_ID", "TRANSACTION_ID", "COMPANY_CODE", "LOCATION_CODE") AS
  select e.audit_event_id,e.event_timestamp,e.user_name,e.employee_code,e.module_code,e.action_type,e.table_name,e.record_key,e.old_primary_key,e.new_primary_key,e.parent_table,e.parent_key,e.transaction_reference,e.request_id,e.transaction_id,e.company_code,e.location_code from IMART_AUDIT_EVENT_V e;

