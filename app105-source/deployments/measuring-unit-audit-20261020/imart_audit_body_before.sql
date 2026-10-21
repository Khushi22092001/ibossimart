
package body IMART_AUDIT as
 g_request_id raw(16); g_request_session varchar2(128); g_system_source varchar2(30); g_process varchar2(255); g_failures number:=0; g_request_module_code varchar2(128);
 function informational_failures return number is begin return g_failures;end;
 procedure clear_context is begin g_request_id:=null;g_request_session:=null;g_system_source:=null;g_process:=null;g_request_module_code:=null;end;
 procedure failed_info is begin g_failures:=g_failures+1;apex_debug.warn('Audit informational sink unavailable; failure count %s',g_failures);exception when others then null;end;
 procedure set_system_context(p_source varchar2,p_process varchar2 default null) is begin
  clear_context;
  if p_source not in('SCHEDULED_JOB','API','INTEGRATION','BATCH','SYSTEM','DATABASE') or p_source is null then raise_application_error(-20801,'Invalid audit system source');end if;
  g_system_source:=p_source;g_process:=substr(p_process,1,255);g_request_id:=sys_guid();
 end;
 function native_web_user return varchar2 is method_name varchar2(20);u varchar2(255);job_id varchar2(128);begin
  if g_system_source is not null then return null;end if;
  job_id:=coalesce(sys_context('USERENV','BG_JOB_ID'),sys_context('USERENV','FG_JOB_ID'));
  if to_number(job_id default null on conversion error)>0 or sys_context('USERENV','AUTHENTICATION_METHOD')='JOB' then return null;end if;
  begin method_name:=upper(owa_util.get_cgi_env('REQUEST_METHOD'));exception when others then return null;end;
  if method_name is null or method_name not in('GET','POST') or sys_context('APEX$SESSION','APP_ID') is null or sys_context('APEX$SESSION','APP_SESSION') is null then return null;end if;
  u:=sys_context('APEX$SESSION','APP_USER');
  if u is null or upper(u) in('NOBODY','APEX_PUBLIC_USER') then return null;end if;
  return u;
 end;
 function inquiry_user return varchar2 is u varchar2(255);n number;b varchar2(128);begin
  if sys_context('APEX$SESSION','APP_ID')<>'105' then return null;end if;
  u:=native_web_user;if u is null then return null;end if;
  select count(*),max(bossusercode) into n,b from bossuser where upper(trim(loginname))=upper(trim(u)) or upper(trim(bossusername))=upper(trim(u));
  if n<>1 then return null;end if;return b;
 end;
 function request_is_ajax return boolean is ajax_header varchar2(100);begin
  begin ajax_header:=owa_util.get_cgi_env('HTTP_X_REQUESTED_WITH');exception when others then null;end;
  return upper(nvl(ajax_header,'-'))='XMLHTTPREQUEST' or regexp_like(apex_application.g_request,'^(PLUGIN($|=)|APEX_AJAX_DISPATCH($|=)|APXWGT($|=)|APPLICATION_PROCESS($|=)|AJAX)','i');
 end;
 function get_context return context_rec is c context_rec;n number;u varchar2(128);job_session boolean:=false;native_app varchar2(128):=sys_context('APEX$SESSION','APP_ID');native_user varchar2(255):=sys_context('APEX$SESSION','APP_USER');b
egin
  c.database_user:=sys_context('USERENV','SESSION_USER');c.current_schema_name:=sys_context('USERENV','CURRENT_SCHEMA');
  c.db_session_id:=sys_context('USERENV','SESSIONID');c.db_host:=sys_context('USERENV','HOST');c.server_host:=sys_context('USERENV','SERVER_HOST');
  c.client_identifier:=sys_context('USERENV','CLIENT_IDENTIFIER');c.db_module:=sys_context('USERENV','MODULE');c.db_action:=sys_context('USERENV','ACTION');
  c.background_job_id:=coalesce(sys_context('USERENV','BG_JOB_ID'),sys_context('USERENV','FG_JOB_ID'));
  if to_number(c.background_job_id default null on conversion error)>0 or sys_context('USERENV','AUTHENTICATION_METHOD')='JOB' then job_session:=true;else c.background_job_id:=null;end if;
  c.source_type:=nvl(g_system_source,case when job_session then 'SCHEDULED_JOB' else 'DATABASE' end);
  if g_system_source is null and not job_session and native_app is not null then
   c.application_id:=to_number(native_app default null on conversion error);c.apex_session_id:=sys_context('APEX$SESSION','APP_SESSION');
   if g_request_session=c.apex_session_id then c.request_id:=g_request_id;end if;
   begin c.ip_address:=substr(owa_util.get_cgi_env('REMOTE_ADDR'),1,255);c.user_agent:=substr(owa_util.get_cgi_env('HTTP_USER_AGENT'),1,1000);exception when others then null;end;
  end if;
  if native_web_user is not null then
   c.source_type:='APEX_USER';c.application_id:=to_number(native_app default null on conversion error);c.apex_session_id:=sys_context('APEX$SESSION','APP_SESSION');c.user_name:=native_user;
   c.page_id:=apex_application.g_flow_step_id;c.company_code:=substr(v('GLOBAL_COMPANYCODE'),1,128);
   select max(button_name) into c.button_name from apex_application_page_buttons where application_id=c.application_id and page_id=c.page_id and button_name=apex_application.g_request;
   c.request_name:=case when c.button_name is not null then c.button_name when request_is_ajax then 'AJAX' when apex_application.g_request is null then 'RENDER' else 'REQUEST' end;
   select count(*),max(bossusercode),max(employeecode) into n,c.bossusercode,c.employee_code from bossuser where upper(trim(loginname))=upper(trim(native_user)) or upper(trim(bossusername))=upper(trim(native_user));
   if n<>1 then c.bossusercode:=null;c.employee_code:=null;end if;
   begin select page_name,page_alias into c.page_name,c.page_alias from apex_application_pages where application_id=c.application_id and page_id=c.page_id;exception when no_data_found then null;end;
   if g_request_session=c.apex_session_id then c.request_id:=g_request_id;end if;
  elsif g_system_source is not null then c.request_id:=g_request_id;
  end if;
  return c;
 end;
 procedure begin_request is begin clear_context;g_failures:=0;g_request_session:=sys_context('APEX$SESSION','APP_SESSION');g_request_id:=sys_guid();
  if sys_context('APEX$SESSION','APP_ID')='105' and native_web_user is not null then
   select max(module_code) into g_request_module_code from IMART_AUDIT_MODULE_PAGE_V where page_id=apex_application.g_flow_step_id;
  end if;
 end;
 procedure end_request is begin clear_context;end;
 function get_policy(p_table varchar2) return policy_rec is p policy_rec;begin
  select enabled,audit_insert,audit_update,audit_delete,field_level,module_code into p from IMART_AUDIT_CONFIG where table_name=p_table;return p;
 exception when no_data_found then p.enabled:='N';return p;end;
 function get_fields(p_table varchar2) return field_map is fields field_map;begin
  for r in(select column_name,capture_mode,max_full_chars from IMART_AUDIT_FIELD_CONFIG where table_name=p_table)loop fields(r.column_name).capture_mode:=r.capture_mode;fields(r.column_name).max_full_chars:=r.max_full_chars;end loop;return 
fields;
 end;
 function field_policy(p_fields field_map,p_column varchar2) return field_policy_rec is p field_policy_rec;begin
  if p_fields.exists(p_column) then return p_fields(p_column);end if;p.capture_mode:='MASK';p.max_full_chars:=1000000;return p;
 end;
 function action_enabled(p_policy policy_rec,p_action varchar2) return boolean is begin
  return p_policy.enabled='Y' and case p_action when 'INSERT' then p_policy.audit_insert when 'UPDATE' then p_policy.audit_update when 'DELETE' then p_policy.audit_delete else 'N' end='Y';
 end;
 function is_secret(p_column varchar2) return boolean is begin return regexp_like(p_column,'PASSW|SECRET|TOKEN|APIKEY|API_KEY|ENCRYPTIONKEY|PRIVATEKEY|ACCESSKEY|CREDENTIAL','i');end;
 function number_text(p_value number) return varchar2 is begin return to_char(p_value,'TM9','NLS_NUMERIC_CHARACTERS=''.,''');end;
 function date_text(p_value date) return varchar2 is begin return to_char(p_value,'YYYY-MM-DD"T"HH24:MI:SS','NLS_DATE_LANGUAGE=American NLS_CALENDAR=Gregorian');end;
 function timestamp_text(p_value timestamp_value) return varchar2 is result varchar2(100);begin select to_char(p_value,'YYYY-MM-DD"T"HH24:MI:SS.FF9','NLS_DATE_LANGUAGE=American NLS_CALENDAR=Gregorian') into result from dual;return result;en
d;
 function timestamptz_text(p_value timestamptz_value) return varchar2 is result varchar2(100);begin select to_char(p_value at time zone 'UTC','YYYY-MM-DD"T"HH24:MI:SS.FF9"Z"','NLS_DATE_LANGUAGE=American NLS_CALENDAR=Gregorian') into result 
from dual;return result;end;
 function different(p_old clob,p_new clob) return boolean is begin
  if p_old is null then return p_new is not null;elsif p_new is null then return true;else return dbms_lob.compare(p_old,p_new)<>0;end if;
 end;
 function blob_different(p_old blob,p_new blob) return boolean is begin
  if p_old is null then return p_new is not null;elsif p_new is null then return true;else return dbms_lob.compare(p_old,p_new)<>0;end if;
 end;
 function blob_metadata(p_value blob) return clob is c clob;begin if p_value is null then return null;end if;select json_object('bytes' value dbms_lob.getlength(p_value),'contentVersioned' value 'N' returning clob) into c from dual;return c
;end;
 procedure business_origin(p_table varchar2,p_program out varchar2,p_action out varchar2) is u varchar2(255);n number;a varchar2(30);begin
  p_program:=null;p_action:=null;
  for depth in reverse 1..utl_call_stack.dynamic_depth loop
   if utl_call_stack.owner(depth)='IMART' then
    u:=upper(utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(depth)));
    if regexp_like(u,'^[A-Z][A-Z0-9_$#]*(\.[A-Z][A-Z0-9_$#]*)*$') and not regexp_like(u,'^(IMART_AUDIT|IMA_)') then
     if p_program is null then p_program:=substr('IMART.'||u,1,255);end if;
     select count(*),max(action_type) into n,a from IMART_AUDIT_PROGRAM_CONFIG where program_name=u and table_name=p_table and enabled='Y';
     if n=1 then p_program:=substr('IMART.'||u,1,255);p_action:=a;return;end if;
    end if;
   end if;
  end loop;
 end;
 function log_event(p_context context_rec,p_action varchar2,p_type varchar2,p_table varchar2 default null,
  p_old_key varchar2 default null,p_new_key varchar2 default null,p_module varchar2 default null,
  p_company varchar2 default null,p_location varchar2 default null,p_reference varchar2 default null,
  p_parent_table varchar2 default null,p_parent_key varchar2 default null,p_process varchar2 default null,
  p_outcome varchar2 default 'SUCCESS',p_remarks varchar2 default null,p_error_code number default null) return number is id number;key_text varchar2(4000):=coalesce(p_new_key,p_old_key);hash_value raw(32);sid number;
  actual_program varchar2(255);domain_action varchar2(30);domain_id number;root_table varchar2(128);root_key varchar2(4000);root_hash raw(32);existing number;tx varchar2(128);begin
  if p_type='ROW_CHANGE' then business_origin(p_table,actual_program,domain_action);end if;
  if p_context.source_type='APEX_USER' then
   begin select audit_session_id into sid from IMART_AUDIT_SESSION where application_id=p_context.application_id and apex_session_id=p_context.apex_session_id and user_name=p_context.user_name;exception when no_data_found then null;end;
  end if;
  if key_text is not null then select standard_hash(key_text,'SHA256') into hash_value from dual;end if;
  insert into IMART_AUDIT_EVENT(audit_session_id,application_id,apex_session_id,user_name,bossusercode,employee_code,database_user,current_schema_name,db_session_id,db_host,server_host,background_job_id,
   company_code,location_code,module_code,page_id,page_name,page_alias,form_name,table_name,old_primary_key,new_primary_key,record_key,record_key_hash,parent_table,parent_key,
   transaction_reference,request_id,transaction_id,action_type,event_type,source_type,outcome,ip_address,user_agent,client_identifier,db_module,db_action,request_name,button_name,process_name,remarks,error_code)
  values(sid,p_context.application_id,p_context.apex_session_id,p_context.user_name,p_context.bossusercode,p_context.employee_code,p_context.database_user,p_context.current_schema_name,p_context.db_session_id,p_context.db_host,p_context.ser
ver_host,p_context.background_job_id,
   p_company,p_location,coalesce(p_module,case when p_context.source_type='APEX_USER' and g_request_session=p_context.apex_session_id then g_request_module_code end),p_context.page_id,p_context.page_name,p_context.page_alias,p_context.page_
name,p_table,p_old_key,p_new_key,key_text,hash_value,p_parent_table,p_parent_key,
   p_reference,p_context.request_id,dbms_transaction.local_transaction_id(true),p_action,p_type,p_context.source_type,p_outcome,p_context.ip_address,p_context.user_agent,p_context.client_identifier,p_context.db_module,p_context.db_action,p_
context.request_name,p_context.button_name,coalesce(p_process,g_process,actual_program),p_remarks,p_error_code)
  returning audit_event_id into id;
  if p_type='ROW_CHANGE' and domain_action is not null then
   root_table:=case when p_parent_table is not null and p_parent_key is not null then p_parent_table else p_table end;
   root_key:=case when p_parent_table is not null and p_parent_key is not null then p_parent_key else key_text end;
   if root_key is not null then
    select standard_hash(root_key,'SHA256') into root_hash from dual;tx:=dbms_transaction.local_transaction_id(true);
    select count(*) into existing from IMART_AUDIT_EVENT where transaction_id=tx and event_type='BUSINESS' and process_name=actual_program and action_type=domain_action and table_name=root_table and record_key_hash=root_hash and record_key=
root_key;
    if existing=0 then domain_id:=log_event(p_context,domain_action,'BUSINESS',root_table,root_key,root_key,p_module,p_company,p_location,p_reference,p_process=>actual_program,p_outcome=>'OBSERVED',p_remarks=>'Actual audited row effects wit
hin a reviewed compiled business routine; this event does not assert whole-routine completion.');end if;
   end if;
  end if;
  return id;
 end;
 procedure log_change(p_event number,p_table varchar2,p_column varchar2,p_type varchar2,p_old clob,p_new clob,p_policy field_policy_rec) is
  capture_mode_value varchar2(10):=p_policy.capture_mode;limit_chars number:=p_policy.max_full_chars;o clob;n clob;os varchar2(10);ns varchar2(10);
  procedure capture(p_value clob,p_result out clob,p_state out varchar2) is begin
   if p_value is null then p_result:=null;p_state:='NULL';
   elsif capture_mode_value='FULL' then
    if dbms_lob.getlength(p_value)>limit_chars then raise_application_error(-20802,'Audit full-value limit exceeded; review field policy');end if;
    p_result:=p_value;p_state:='VALUE';
   elsif capture_mode_value='MASK' then p_result:=to_clob('[MASKED]');p_state:='MASKED';
   elsif capture_mode_value='METADATA' then
    if p_type='BLOB' then p_result:=p_value;else select json_object('characters' value dbms_lob.getlength(p_value),'contentVersioned' value 'N' returning clob) into p_result from dual;end if;p_state:='METADATA';
   else p_result:=null;p_state:='OMITTED';end if;
  end;
 begin
  if is_secret(p_column) then return;end if;
  if capture_mode_value is null or capture_mode_value not in('FULL','MASK','OMIT','METADATA') or limit_chars is null or limit_chars<1 then raise_application_error(-20805,'Invalid audit field policy');end if;
  if capture_mode_value='OMIT' then return;end if;
  if p_type='BLOB' and capture_mode_value='FULL' then capture_mode_value:='METADATA';end if;
  capture(p_old,o,os);capture(p_new,n,ns);
  insert into IMART_AUDIT_CHANGE(audit_event_id,table_name,column_name,data_type,old_value,new_value,old_state,new_state,capture_mode) values(p_event,p_table,p_column,p_type,o,n,os,ns,capture_mode_value);
 end;
 procedure log_change(p_event number,p_table varchar2,p_column varchar2,p_type varchar2,p_old clob,p_new clob) is p field_policy_rec;begin
  if is_secret(p_column) then return;end if;
  begin select capture_mode,max_full_chars into p from IMART_AUDIT_FIELD_CONFIG where table_name=p_table and column_name=p_column;exception when no_data_found then p.capture_mode:='MASK';p.max_full_chars:=1000000;end;
  log_change(p_event,p_table,p_column,p_type,p_old,p_new,p);
 end;
 procedure log_business(p_action varchar2,p_table varchar2,p_key varchar2,p_company varchar2,p_location varchar2 default null,p_reference varchar2 default null,p_process varchar2 default null) is id number;c context_rec;begin
  c:=get_context;id:=log_event(c,p_action,'BUSINESS',p_table,p_key,p_key,null,p_company,p_location,p_reference,null,null,p_process);
 end;
 procedure log_excluded_change(p_event number,p_table varchar2,p_column varchar2) is begin
  if not is_secret(p_column) then raise_application_error(-20804,'Only excluded credential fields use this API');end if;
  insert into IMART_AUDIT_CHANGE(audit_event_id,table_name,column_name,data_type,old_state,new_state,capture_mode)
   values(p_event,p_table,p_column,'EXCLUDED','OMITTED','OMITTED','OMIT');
 end;
 procedure log_login(p_username varchar2,p_success boolean,p_error_code number default null) is pragma autonomous_transaction;c context_rec;result varchar2(20);id number;begin
  c:=get_context;result:=case when p_success then 'SUCCESS' else 'FAILURE' end;
  insert into IMART_AUDIT_LOGIN(application_id,apex_session_id,user_name,action_type,outcome,ip_address,user_agent,database_user,error_code)
   values(to_number(sys_context('APEX$SESSION','APP_ID') default null on conversion error),sys_context('APEX$SESSION','APP_SESSION'),substr(p_username,1,255),'LOGIN',result,c.ip_address,c.user_agent,c.database_user,p_error_code);
  c.user_name:=substr(p_username,1,255);c.bossusercode:=null;c.employee_code:=null;
  if c.application_id is not null then c.source_type:='SYSTEM';end if;
  id:=log_event(c,'LOGIN','AUTHENTICATION',p_outcome=>result,p_process=>'Authentication decision',p_error_code=>p_error_code);
  commit;
 exception when others then rollback;failed_info;end;
 procedure start_session is pragma autonomous_transaction;c context_rec;begin
  c:=get_context;if c.source_type<>'APEX_USER' or c.apex_session_id is null then rollback;return;end if;
  begin insert into IMART_AUDIT_SESSION(application_id,apex_session_id,user_name,bossusercode,employee_code,ip_address,user_agent,db_user,db_host,server_host,company_code)
   values(c.application_id,c.apex_session_id,c.user_name,c.bossusercode,c.employee_code,c.ip_address,c.user_agent,c.database_user,c.db_host,c.server_host,c.company_code);exception when dup_val_on_index then null;end;
  commit;
 exception when others then rollback;failed_info;end;
 procedure end_session(p_action varchar2 default 'LOGOUT') is pragma autonomous_transaction;c context_rec;id number;begin
  if p_action not in('LOGOUT','SESSION_EXPIRED') or p_action is null then raise_application_error(-20803,'Invalid audit session end action');end if;
  c:=get_context;if c.source_type<>'APEX_USER' then rollback;return;end if;
  insert into IMART_AUDIT_LOGIN(application_id,apex_session_id,user_name,action_type,outcome,ip_address,user_agent,database_user)
   values(c.application_id,c.apex_session_id,c.user_name,p_action,'OBSERVED',c.ip_address,c.user_agent,c.database_user);
  id:=log_event(c,p_action,'AUTHENTICATION',p_company=>c.company_code,p_outcome=>'OBSERVED');commit;
 exception when others then rollback;failed_info;end;
 procedure log_page_access is pragma autonomous_transaction;c context_rec;enabled char(1);id number;begin
  c:=get_context;if c.source_type<>'APEX_USER' then rollback;return;end if;
  begin select read_enabled into enabled from IMART_AUDIT_PAGE_CONFIG where application_id=c.application_id and page_id=c.page_id;exception when no_data_found then enabled:='N';end;
  if enabled='Y' then id:=log_event(c,'VIEW','ACCESS',p_company=>c.company_code,p_outcome=>'OBSERVED');end if;commit;
 exception when others then rollback;failed_info;end;
 procedure log_error(p_error_code number,p_component varchar2) is pragma autonomous_transaction;c context_rec;id number;begin
  c:=get_context;insert into IMART_AUDIT_ERROR(request_id,application_id,apex_session_id,user_name,database_user,error_code,component_name)
   values(c.request_id,c.application_id,c.apex_session_id,c.user_name,c.database_user,p_error_code,substr(p_component,1,255));
  id:=log_event(c,'OTHER','ERROR',p_company=>c.company_code,p_process=>substr(p_component,1,255),p_outcome=>'FAILURE',p_error_code=>p_error_code);commit;
 exception when others then rollback;failed_info;end;
 procedure log_search is pragma autonomous_transaction;c context_rec;enabled char(1);id number;begin
  c:=get_context;if c.source_type<>'APEX_USER' then rollback;return;end if;
  begin select search_enabled into enabled from IMART_AUDIT_PAGE_CONFIG where application_id=c.application_id and page_id=c.page_id;exception when no_data_found then enabled:='N';end;
  if enabled='Y' then id:=log_event(c,'VIEW','ACCESS',p_company=>c.company_code,p_process=>'Selected search activity',p_outcome=>'OBSERVED',p_remarks=>'Search criteria and result payload are not captured');end if;commit;
 exception when others then rollback;failed_info;end;
 function can_read(p_company varchar2,p_location varchar2) return number is b varchar2(128);n number;begin
  b:=inquiry_user;if b is null then return 0;end if;
  select count(*) into n from IMART_AUDIT_ACCESS where bossusercode=b and company_scope=nvl(p_company,'*TECHNICAL*') and (location_scope='*' or location_scope=p_location);return case when n>0 then 1 else 0 end;
 exception when others then return 0;end;
 function can_export(p_company varchar2,p_location varchar2) return number is b varchar2(128);n number;begin
  b:=inquiry_user;if b is null then return 0;end if;
  select count(*) into n from IMART_AUDIT_ACCESS where bossusercode=b and company_scope=nvl(p_company,'*TECHNICAL*') and (location_scope='*' or location_scope=p_location) and can_export='Y';return case when n>0 then 1 else 0 end;
 exception when others then return 0;end;
 function can_inquire return boolean is b varchar2(128);n number;begin
  b:=inquiry_user;if b is null then return false;end if;
  select count(*) into n from IMART_AUDIT_ACCESS where bossusercode=b;return n>0;
 exception when others then return false;end;
end IMART_AUDIT;

