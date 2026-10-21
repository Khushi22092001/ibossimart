declare
 l_doc varchar2(4000);l_root varchar2(128):='MEASURINGUNIT';l_record varchar2(4000);l_tno varchar2(100);l_links clob;
 l_mode varchar2(20):=apex_application.g_x01;
 l_key varchar2(100):=apex_application.g_x02;
 l_after number:=to_number(apex_application.g_x03 default null on conversion error);
 l_snapshot number:=to_number(apex_application.g_x04 default null on conversion error);
 l_sort varchar2(10):=case when apex_application.g_x05='OLDEST' then 'OLDEST' else 'NEWEST' end;
 l_filter varchar2(20):=nvl(apex_application.g_x06,'ALL');
 l_company varchar2(128);l_location varchar2(128);l_count number:=0;l_more boolean:=false;
 l_json clob;l_pos pls_integer:=1;
 function label_for(p_table varchar2,p_column varchar2) return varchar2 is v varchar2(500);
 begin
  select max(regexp_replace(label,'<[^>]+>','')) into v from apex_application_page_items
  where application_id=105 and page_id=51 and item_source=p_column and label is not null;
  return coalesce(v,case p_column when 'QUANTITY1' then 'Primary Quantity' when 'QUANTITY2' then 'Secondary Quantity'
    when 'ITEMSPECS' then 'Item Specification' when 'TNO' then 'Document ID' when 'SNO' then 'Line ID'
    when 'IMART_AUDIT_ROW_ID' then 'Audit Row ID' when 'ITEMCODE' then 'Item' else initcap(replace(p_column,'_',' ')) end);
 end;
 function actor_name(p_code varchar2,p_user varchar2) return varchar2 is v varchar2(255);
 begin select max(coalesce(e.employeename,b.bossusername)) into v from bossuser b left join employee e on e.employeecode=b.employeecode
 where b.bossusercode=p_code or (p_code is null and upper(b.loginname)=upper(p_user));
 return coalesce(v,p_user,p_code,'Unknown user');end;
 function readable(p_field varchar2,p_value clob) return varchar2 is v varchar2(500);k varchar2(500):=dbms_lob.substr(p_value,500,1);
 begin
  if k is null then return null;end if;
  case p_field
   when 'PARTYCODE' then select max(partyname) into v from party where partycode=k;
   when 'ITEMCODE' then select max(itemname) into v from item where itemcode=k;
   when 'LOCATIONCODE' then select max(locationname) into v from location where locationcode=k;
   when 'DOCTYPECODE' then select max(doctypename) into v from doctype where doctypecode=k;
   when 'EMPLOYEECODE' then select max(employeename) into v from employee where employeecode=k;
   when 'ITEMSPECIFICATIONCODE' then select max(itemspecificationname) into v from itemspecification where itemspecificationcode=k;
   else return null;
  end case;return v;
 end;
 function item_context(p_line varchar2) return varchar2 is begin return case when p_line is not null then 'Detail Line '||p_line end;end;
begin
 apex_json.initialize_clob_output;
 apex_json.open_object;
 if :APP_ID<>105 or :APP_PAGE_ID<>51 or not imart_audit.can_inquire then
  apex_json.write('status','restricted');apex_json.write('message','Audit history access is not granted for this user.');
 else
  begin select v('GLOBAL_COMPANYCODE'),cast(null as varchar2(128)),json_object('TNO' value to_char(TNO,'TM9','NLS_NUMERIC_CHARACTERS=''.,''')),to_char(TNO,'TM9','NLS_NUMERIC_CHARACTERS=''.,'''),json_array(json_object('t' value 'MEASURINGUNIT','c' value 'TNO','v' value to_char(TNO,'TM9','NLS_NUMERIC_CHARACTERS=''.,''')) returning clob) into l_company,l_location,l_record,l_tno,l_links from MEASURINGUNIT where TNO=to_number(:P51_TNO default null on conversion error);l_doc:=l_record;
  exception when no_data_found then l_doc:=null;when too_many_rows then l_doc:=null;end;
  if l_doc is null then apex_json.write('status','empty');apex_json.write('message','History is available after this record has been saved.');
  elsif imart_audit.can_read(l_company,l_location)<>1 then
   apex_json.write('status','restricted');apex_json.write('message','Audit history access is not granted for this document.');
  else
   -- A sequence boundary is not an audit row; authorize only the document's candidate rows below.
   if l_snapshot is null then select nvl(max(audit_event_id),0) into l_snapshot from imart_audit_event;end if;
   apex_json.write('status','ok');apex_json.write('snapshot',to_char(l_snapshot));
   if l_mode='LIST' then
    apex_json.open_array('activities');
    for r in (
with links as (
 select t,c,v from json_table(l_links,'$[*]' columns(t varchar2(128) path '$.t',c varchar2(128) path '$.c',v varchar2(4000) path '$.v'))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in ('ROW_CHANGE','BUSINESS') and e.outcome in ('SUCCESS','OBSERVED')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,'$.TNO')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c='TNO' and json_value(e.record_key,'$.TNO')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||'|'||transaction_id||'|'||nvl(bossusercode,user_name)||'|'||apex_session_id||'|'||source_type,'SHA256'))
 else 'EVENT-'||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type='APEX_USER' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     , grouped as (
      select activity_key,max(audit_event_id) sort_id,min(event_timestamp) first_time,max(event_timestamp) last_time,
      max(user_name) user_name,max(bossusercode) bossusercode,max(rawtohex(request_id)) request_id,max(transaction_id) transaction_id,
      sum(field_count) change_count,
      count(*) event_count,
      case when max(case when table_name=l_root and action_type='INSERT' and event_type='ROW_CHANGE' then 1 else 0 end)=1 then 'CREATED'
       when max(case when action_type='APPROVE' then 1 else 0 end)=1 then 'APPROVED'
       when max(case when action_type='REJECT' then 1 else 0 end)=1 then 'REJECTED'
       when max(case when action_type='CANCEL' then 1 else 0 end)=1 then 'CANCELLED'
       when max(case when table_name=l_root and action_type='DELETE' then 1 else 0 end)=1 then 'DELETED'
       when max(case when action_type='SUBMIT' then 1 else 0 end)=1 and max(case when event_type='ROW_CHANGE' then 1 else 0 end)=0 then 'SUBMITTED'
       else 'UPDATED' end activity_type
      from eligible e group by activity_key
     ) select * from grouped where (l_filter='ALL' or activity_type=l_filter)
     and (l_after is null or (l_sort='NEWEST' and sort_id<l_after) or (l_sort='OLDEST' and sort_id>l_after))
     order by case when l_sort='NEWEST' then -sort_id else sort_id end fetch first 21 rows only
    ) loop
     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;
     apex_json.open_object;apex_json.write('key',r.activity_key);apex_json.write('cursor',to_char(r.sort_id));
     apex_json.write('type',r.activity_type);apex_json.write('changes',r.change_count);apex_json.write('events',r.event_count);
     apex_json.write('user',actor_name(r.bossusercode,r.user_name));apex_json.write('login',r.user_name);
     apex_json.write('time',to_char(r.first_time at time zone sessiontimezone,'DD-MM-YYYY HH:MI:SS AM TZH:TZM'));
     apex_json.write('lastTime',to_char(r.last_time at time zone sessiontimezone,'DD-MM-YYYY HH:MI:SS AM TZH:TZM'));
     apex_json.write('request',r.request_id);apex_json.write('transaction',r.transaction_id);apex_json.close_object;
    end loop;
    apex_json.close_array;apex_json.write('more',l_more);
   elsif l_mode='DETAIL' then
    apex_json.open_array('changes');
    for r in (
with links as (
 select t,c,v from json_table(l_links,'$[*]' columns(t varchar2(128) path '$.t',c varchar2(128) path '$.c',v varchar2(4000) path '$.v'))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in ('ROW_CHANGE','BUSINESS') and e.outcome in ('SUCCESS','OBSERVED')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,'$.TNO')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c='TNO' and json_value(e.record_key,'$.TNO')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||'|'||transaction_id||'|'||nvl(bossusercode,user_name)||'|'||apex_session_id||'|'||source_type,'SHA256'))
 else 'EVENT-'||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type='APEX_USER' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     select c.*,e.action_type,e.record_key,e.event_timestamp,e.user_name,e.bossusercode,e.outcome,
     coalesce(json_value(e.record_key,'$.SNO'),(select coalesce(dbms_lob.substr(z.new_value,100,1),dbms_lob.substr(z.old_value,100,1))
       from imart_audit_event h join imart_audit_change z on z.audit_event_id=h.audit_event_id
       where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
       and h.audit_event_id<=e.audit_event_id and z.column_name='SNO'
       order by h.audit_event_id desc,z.audit_change_id desc fetch first 1 row only)) line_id
     from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id
     where e.activity_key=l_key and (l_after is null or c.audit_change_id>l_after)
     order by c.audit_change_id fetch first 21 rows only
    ) loop
     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;
     apex_json.open_object;apex_json.write('id',to_char(r.audit_change_id));apex_json.write('event',to_char(r.audit_event_id));
     apex_json.write('table',r.table_name);apex_json.write('field',r.column_name);apex_json.write('label',label_for(r.table_name,r.column_name));
     apex_json.write('action',r.action_type);apex_json.write('record',r.record_key);apex_json.write('line',r.line_id);
     apex_json.write('item',item_context(r.line_id));
     apex_json.write('user',actor_name(r.bossusercode,r.user_name));
     apex_json.write('time',to_char(r.event_timestamp at time zone sessiontimezone,'DD-MM-YYYY HH:MI:SS AM TZH:TZM'));
     apex_json.write('old',dbms_lob.substr(r.old_value,2000,1));apex_json.write('new',dbms_lob.substr(r.new_value,2000,1));
     if r.old_state='VALUE' and r.capture_mode='FULL' then apex_json.write('oldLabel',readable(r.column_name,r.old_value));end if;
     if r.new_state='VALUE' and r.capture_mode='FULL' then apex_json.write('newLabel',readable(r.column_name,r.new_value));end if;
     apex_json.write('oldState',r.old_state);apex_json.write('newState',r.new_state);apex_json.write('mode',r.capture_mode);
     apex_json.write('long',greatest(nvl(dbms_lob.getlength(r.old_value),0),nvl(dbms_lob.getlength(r.new_value),0))>2000);
     apex_json.close_object;
    end loop;
    apex_json.close_array;apex_json.write('more',l_more);
    apex_json.open_array('events');
    for r in (
with links as (
 select t,c,v from json_table(l_links,'$[*]' columns(t varchar2(128) path '$.t',c varchar2(128) path '$.c',v varchar2(4000) path '$.v'))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in ('ROW_CHANGE','BUSINESS') and e.outcome in ('SUCCESS','OBSERVED')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,'$.TNO')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c='TNO' and json_value(e.record_key,'$.TNO')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||'|'||transaction_id||'|'||nvl(bossusercode,user_name)||'|'||apex_session_id||'|'||source_type,'SHA256'))
 else 'EVENT-'||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type='APEX_USER' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     select audit_event_id,action_type,table_name,record_key,outcome,event_type,event_timestamp,remarks,user_name,bossusercode
     from eligible e where activity_key=l_key and not exists(select 1 from imart_audit_change c where c.audit_event_id=e.audit_event_id)
     order by audit_event_id
    ) loop
     apex_json.open_object;apex_json.write('event',to_char(r.audit_event_id));apex_json.write('action',r.action_type);
     apex_json.write('table',r.table_name);apex_json.write('record',r.record_key);apex_json.write('outcome',r.outcome);
     apex_json.write('time',to_char(r.event_timestamp at time zone sessiontimezone,'DD-MM-YYYY HH:MI:SS AM TZH:TZM'));
     apex_json.write('user',actor_name(r.bossusercode,r.user_name));apex_json.write('remarks',r.remarks);apex_json.close_object;
    end loop;apex_json.close_array;
   elsif l_mode='VALUE' then
    for r in (
with links as (
 select t,c,v from json_table(l_links,'$[*]' columns(t varchar2(128) path '$.t',c varchar2(128) path '$.c',v varchar2(4000) path '$.v'))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in ('ROW_CHANGE','BUSINESS') and e.outcome in ('SUCCESS','OBSERVED')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,'$.TNO')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c='TNO' and json_value(e.record_key,'$.TNO')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||'|'||transaction_id||'|'||nvl(bossusercode,user_name)||'|'||apex_session_id||'|'||source_type,'SHA256'))
 else 'EVENT-'||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type='APEX_USER' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     select c.old_value,c.new_value from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id
     where e.activity_key=l_key and c.audit_change_id=l_after
    ) loop apex_json.write('old',r.old_value);apex_json.write('new',r.new_value);end loop;
   else raise_application_error(-20001,'Unsupported history request');end if;
  end if;
 end if;
 apex_json.close_object;l_json:=apex_json.get_clob_output;
 while l_pos<=dbms_lob.getlength(l_json) loop sys.htp.prn(dbms_lob.substr(l_json,8000,l_pos));l_pos:=l_pos+8000;end loop;
 apex_json.free_output;
exception when others then
 apex_json.free_output;
 apex_json.open_object;apex_json.write('status','error');apex_json.write('message','History could not be loaded. Retry or open Audit Trail.');apex_json.close_object;
end;

