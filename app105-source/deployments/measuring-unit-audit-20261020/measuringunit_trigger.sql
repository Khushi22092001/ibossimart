CREATE OR REPLACE TRIGGER IMA_AT_298881C8E5DED9622EE6
FOR INSERT OR UPDATE OR DELETE ON MEASURINGUNIT
compound trigger
 c IMART_AUDIT.context_rec; p IMART_AUDIT.policy_rec; fields IMART_AUDIT.field_map;
 before statement is begin
  p:=IMART_AUDIT.get_policy('MEASURINGUNIT');
  if p.enabled='Y' then c:=IMART_AUDIT.get_context;if p.field_level='Y' then fields:=IMART_AUDIT.get_fields('MEASURINGUNIT');end if;end if;
 end before statement;
 after each row is
  event_id number; action_name varchar2(30); old_key varchar2(4000);new_key varchar2(4000);
  company_code varchar2(128):=case when c.source_type='APEX_USER' then c.company_code end;location_code varchar2(128);reference_text varchar2(1000);parent_key varchar2(4000);
  procedure ensure_event is begin
   if event_id is null then event_id:=IMART_AUDIT.log_event(c,action_name,'ROW_CHANGE','MEASURINGUNIT',old_key,new_key,p.module_code,company_code,location_code,reference_text,null,parent_key);end if;
  end;
 begin
  action_name:=case when inserting then 'INSERT' when updating then 'UPDATE' else 'DELETE' end;
  if IMART_AUDIT.action_enabled(p,action_name) then
   if not inserting then select json_object('TNO' value IMART_AUDIT.number_text(:old."TNO") null on null returning varchar2(4000)) into old_key from dual;end if;
   if not deleting then select json_object('TNO' value IMART_AUDIT.number_text(:new."TNO") null on null returning varchar2(4000)) into new_key from dual;end if;
   if inserting or deleting then ensure_event;end if;
   if inserting or deleting or (:old."TNO" <> :new."TNO" or (:old."TNO" is null and :new."TNO" is not null) or (:old."TNO" is not null and :new."TNO" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','TNO','NUMBER',to_clob(IMART_AUDIT.number_text(:old."TNO")),to_clob(IMART_AUDIT.number_text(:new."TNO")),IMART_AUDIT.field_policy(fields,'TNO'));end if;
   end if;
   if inserting or deleting or (:old."MEASURINGUNITCODE" <> :new."MEASURINGUNITCODE" or (:old."MEASURINGUNITCODE" is null and :new."MEASURINGUNITCODE" is not null) or (:old."MEASURINGUNITCODE" is not null and :new."MEASURINGUNITCODE" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','MEASURINGUNITCODE','VARCHAR2',to_clob(:old."MEASURINGUNITCODE"),to_clob(:new."MEASURINGUNITCODE"),IMART_AUDIT.field_policy(fields,'MEASURINGUNITCODE'));end if;
   end if;
   if inserting or deleting or (:old."MEASURINGUNITNAME" <> :new."MEASURINGUNITNAME" or (:old."MEASURINGUNITNAME" is null and :new."MEASURINGUNITNAME" is not null) or (:old."MEASURINGUNITNAME" is not null and :new."MEASURINGUNITNAME" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','MEASURINGUNITNAME','VARCHAR2',to_clob(:old."MEASURINGUNITNAME"),to_clob(:new."MEASURINGUNITNAME"),IMART_AUDIT.field_policy(fields,'MEASURINGUNITNAME'));end if;
   end if;
   if inserting or deleting or (:old."DECIMALPLACE" <> :new."DECIMALPLACE" or (:old."DECIMALPLACE" is null and :new."DECIMALPLACE" is not null) or (:old."DECIMALPLACE" is not null and :new."DECIMALPLACE" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','DECIMALPLACE','NUMBER',to_clob(IMART_AUDIT.number_text(:old."DECIMALPLACE")),to_clob(IMART_AUDIT.number_text(:new."DECIMALPLACE")),IMART_AUDIT.field_policy(fields,'DECIMALPLACE'));end if;
   end if;
   if inserting or deleting or (:old."DATECRATED" <> :new."DATECRATED" or (:old."DATECRATED" is null and :new."DATECRATED" is not null) or (:old."DATECRATED" is not null and :new."DATECRATED" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','DATECRATED','DATE',to_clob(IMART_AUDIT.date_text(:old."DATECRATED")),to_clob(IMART_AUDIT.date_text(:new."DATECRATED")),IMART_AUDIT.field_policy(fields,'DATECRATED'));end if;
   end if;
   if inserting or deleting or (:old."DATEMODIFY" <> :new."DATEMODIFY" or (:old."DATEMODIFY" is null and :new."DATEMODIFY" is not null) or (:old."DATEMODIFY" is not null and :new."DATEMODIFY" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','DATEMODIFY','DATE',to_clob(IMART_AUDIT.date_text(:old."DATEMODIFY")),to_clob(IMART_AUDIT.date_text(:new."DATEMODIFY")),IMART_AUDIT.field_policy(fields,'DATEMODIFY'));end if;
   end if;
   if inserting or deleting or (:old."ISWEIGHMENTREQUIRED" <> :new."ISWEIGHMENTREQUIRED" or (:old."ISWEIGHMENTREQUIRED" is null and :new."ISWEIGHMENTREQUIRED" is not null) or (:old."ISWEIGHMENTREQUIRED" is not null and :new."ISWEIGHMENTREQUIRED" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','ISWEIGHMENTREQUIRED','VARCHAR2',to_clob(:old."ISWEIGHMENTREQUIRED"),to_clob(:new."ISWEIGHMENTREQUIRED"),IMART_AUDIT.field_policy(fields,'ISWEIGHMENTREQUIRED'));end if;
   end if;
   if inserting or deleting or (:old."DIVISORFACTOR" <> :new."DIVISORFACTOR" or (:old."DIVISORFACTOR" is null and :new."DIVISORFACTOR" is not null) or (:old."DIVISORFACTOR" is not null and :new."DIVISORFACTOR" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','DIVISORFACTOR','NUMBER',to_clob(IMART_AUDIT.number_text(:old."DIVISORFACTOR")),to_clob(IMART_AUDIT.number_text(:new."DIVISORFACTOR")),IMART_AUDIT.field_policy(fields,'DIVISORFACTOR'));end if;
   end if;
   if inserting or deleting or (:old."MULTIPLYINGFACTOR" <> :new."MULTIPLYINGFACTOR" or (:old."MULTIPLYINGFACTOR" is null and :new."MULTIPLYINGFACTOR" is not null) or (:old."MULTIPLYINGFACTOR" is not null and :new."MULTIPLYINGFACTOR" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','MULTIPLYINGFACTOR','NUMBER',to_clob(IMART_AUDIT.number_text(:old."MULTIPLYINGFACTOR")),to_clob(IMART_AUDIT.number_text(:new."MULTIPLYINGFACTOR")),IMART_AUDIT.field_policy(fields,'MULTIPLYINGFACTOR'));end if;
   end if;
   if inserting or deleting or (:old."GSTUQCCODE" <> :new."GSTUQCCODE" or (:old."GSTUQCCODE" is null and :new."GSTUQCCODE" is not null) or (:old."GSTUQCCODE" is not null and :new."GSTUQCCODE" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','GSTUQCCODE','VARCHAR2',to_clob(:old."GSTUQCCODE"),to_clob(:new."GSTUQCCODE"),IMART_AUDIT.field_policy(fields,'GSTUQCCODE'));end if;
   end if;
   if inserting or deleting or (:old."FORMANPOWER" <> :new."FORMANPOWER" or (:old."FORMANPOWER" is null and :new."FORMANPOWER" is not null) or (:old."FORMANPOWER" is not null and :new."FORMANPOWER" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','FORMANPOWER','VARCHAR2',to_clob(:old."FORMANPOWER"),to_clob(:new."FORMANPOWER"),IMART_AUDIT.field_policy(fields,'FORMANPOWER'));end if;
   end if;
   if inserting or deleting or (:old."REMARK" <> :new."REMARK" or (:old."REMARK" is null and :new."REMARK" is not null) or (:old."REMARK" is not null and :new."REMARK" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','REMARK','VARCHAR2',to_clob(:old."REMARK"),to_clob(:new."REMARK"),IMART_AUDIT.field_policy(fields,'REMARK'));end if;
   end if;
   if inserting or deleting or (:old."CREATIONTIME" <> :new."CREATIONTIME" or (:old."CREATIONTIME" is null and :new."CREATIONTIME" is not null) or (:old."CREATIONTIME" is not null and :new."CREATIONTIME" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','CREATIONTIME','DATE',to_clob(IMART_AUDIT.date_text(:old."CREATIONTIME")),to_clob(IMART_AUDIT.date_text(:new."CREATIONTIME")),IMART_AUDIT.field_policy(fields,'CREATIONTIME'));end if;
   end if;
   if inserting or deleting or (:old."CREATOR" <> :new."CREATOR" or (:old."CREATOR" is null and :new."CREATOR" is not null) or (:old."CREATOR" is not null and :new."CREATOR" is null)) then
    ensure_event;
    if p.field_level='Y' then IMART_AUDIT.log_change(event_id,'MEASURINGUNIT','CREATOR','VARCHAR2',to_clob(:old."CREATOR"),to_clob(:new."CREATOR"),IMART_AUDIT.field_policy(fields,'CREATOR'));end if;
   end if;
  end if;
 exception when others then
  raise_application_error(-20810,'Required audit capture failed for MEASURINGUNIT; the statement was rejected',true);
 end after each row;
end;
/
