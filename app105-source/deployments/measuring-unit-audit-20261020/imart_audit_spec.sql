
package IMART_AUDIT authid definer as
 subtype timestamp_value is timestamp(9);
 subtype timestamptz_value is timestamp(9) with time zone;
 type context_rec is record (
  application_id number, apex_session_id varchar2(128), user_name varchar2(255), bossusercode varchar2(128), employee_code varchar2(128),
  company_code varchar2(128), page_id number, page_name varchar2(255), page_alias varchar2(255),
  ip_address varchar2(255), user_agent varchar2(1000), source_type varchar2(30), request_name varchar2(255),
  request_id raw(16), database_user varchar2(128), current_schema_name varchar2(128), db_session_id varchar2(128), db_host varchar2(255), server_host varchar2(255),button_name varchar2(128), background_job_id varchar2(128),
  client_identifier varchar2(255), db_module varchar2(128), db_action varchar2(128)
 );
 type policy_rec is record(enabled char(1), audit_insert char(1), audit_update char(1),audit_delete char(1),field_level char(1),module_code varchar2(128));
 type field_policy_rec is record(capture_mode varchar2(10),max_full_chars number);
 type field_map is table of field_policy_rec index by varchar2(128);
 function get_context return context_rec;
 procedure begin_request;
 procedure end_request;
 procedure set_system_context(p_source varchar2,p_process varchar2 default null);
 procedure clear_context;
 function get_policy(p_table varchar2) return policy_rec;
 function get_fields(p_table varchar2) return field_map;
 function field_policy(p_fields field_map,p_column varchar2) return field_policy_rec;
 function action_enabled(p_policy policy_rec,p_action varchar2) return boolean;
 function is_secret(p_column varchar2) return boolean;
 function number_text(p_value number) return varchar2;
 function date_text(p_value date) return varchar2;
 function timestamp_text(p_value timestamp_value) return varchar2;
 function timestamptz_text(p_value timestamptz_value) return varchar2;
 function different(p_old clob,p_new clob) return boolean;
 function blob_different(p_old blob,p_new blob) return boolean;
 function blob_metadata(p_value blob) return clob;
 function log_event(p_context context_rec,p_action varchar2,p_type varchar2,p_table varchar2 default null,
  p_old_key varchar2 default null,p_new_key varchar2 default null,p_module varchar2 default null,
  p_company varchar2 default null,p_location varchar2 default null,p_reference varchar2 default null,
  p_parent_table varchar2 default null,p_parent_key varchar2 default null,p_process varchar2 default null,
  p_outcome varchar2 default 'SUCCESS',p_remarks varchar2 default null,p_error_code number default null) return number;
 procedure log_change(p_event number,p_table varchar2,p_column varchar2,p_type varchar2,p_old clob,p_new clob);
 procedure log_change(p_event number,p_table varchar2,p_column varchar2,p_type varchar2,p_old clob,p_new clob,p_policy field_policy_rec);
 procedure log_excluded_change(p_event number,p_table varchar2,p_column varchar2);
 procedure log_business(p_action varchar2,p_table varchar2,p_key varchar2,p_company varchar2,p_location varchar2 default null,
  p_reference varchar2 default null,p_process varchar2 default null);
 procedure log_login(p_username varchar2,p_success boolean,p_error_code number default null);
 procedure start_session;
 procedure end_session(p_action varchar2 default 'LOGOUT');
 procedure log_page_access;
 procedure log_search;
 procedure log_error(p_error_code number,p_component varchar2);
 function can_read(p_company varchar2,p_location varchar2) return number;
 function can_inquire return boolean;
 function can_export(p_company varchar2,p_location varchar2) return number;
 function informational_failures return number;
end IMART_AUDIT;
