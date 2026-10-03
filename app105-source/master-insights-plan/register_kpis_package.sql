create or replace package imart_register_kpis authid definer as
 procedure payload(p_page number);
end;
/
create or replace package body imart_register_kpis as
 procedure payload(p_page number) is
   src clob; q clob; c imart_mr_catalog%rowtype; rid number; cur integer;
   total number; missing number; repeated number; changed varchar2(100);
   key_available number; name_available number; changed_available number;
   b varchar2(100); n integer; seen varchar2(32767):='|';
   desc_cols dbms_sql.desc_tab2; col_count number; latest_date date;
   identity_column varchar2(128); projection clob;
   procedure card(label varchar2,val varchar2,note varchar2) is
   begin apex_json.open_object; apex_json.write('label',label);apex_json.write('value',val);apex_json.write('note',note);apex_json.close_object;end;
 begin
   if p_page<>to_number(v('APP_PAGE_ID')) then raise_application_error(-20001,'Register context mismatch'); end if;
   select * into c from imart_mr_catalog where register_page=p_page and imart_master_reports.allowed(module_code)=1 fetch first 1 row only;
   select region_id,query_sql,key_available,name_available,changed_available,identity_column into rid,src,key_available,name_available,changed_available,identity_column
    from imart_mr_register where page_id=p_page and module_code=c.module_code;
   src:=regexp_replace(src,';[[:space:]]*$','');
   projection:=case when identity_column is not null then dbms_assert.simple_sql_name(identity_column)||' mr_id,' else '' end;
   projection:=projection||case when key_available>0 then 'cast('||dbms_assert.simple_sql_name(c.code_column)||' as varchar2(4000))' else 'cast(null as varchar2(4000))' end||' mr_code,';
   projection:=projection||case when name_available>0 then 'cast('||dbms_assert.simple_sql_name(c.name_column)||' as varchar2(4000))' else 'cast(null as varchar2(4000))' end||' mr_name,';
   projection:=projection||case when changed_available>0 then dbms_assert.simple_sql_name(c.changed_column) else 'cast(null as varchar2(100))' end||' mr_date';
   -- A register can join one master to many specification/detail rows.
   -- Deduplicate by the real master key before computing master KPIs.
   if identity_column is not null then src:='select distinct '||projection||' from ('||src||chr(10)||')';
   else src:='select '||projection||' from ('||src||chr(10)||')';end if;
   q:='select count(*),';
   if key_available>0 and name_available>0 then
     q:=q||'nvl(sum(case when mr_code is null or trim(mr_name) is null then 1 else 0 end),0),';
   else q:=q||'cast(null as number),'; end if;
   if name_available>0 and c.name_column<>c.code_column then
     q:=q||'count(trim(mr_name))-count(distinct upper(trim(mr_name))),';
   else q:=q||'cast(null as number),'; end if;
   if changed_available>0 then q:=q||'max(mr_date)';
   else q:=q||'cast(null as varchar2(100))'; end if;
   q:=q||' from ('||src||chr(10)||')';
   cur:=dbms_sql.open_cursor;
   dbms_sql.parse(cur,q,dbms_sql.native);
   dbms_sql.describe_columns2(cur,col_count,desc_cols);
   for i in 1..regexp_count(src,':[A-Za-z][A-Za-z0-9_]*') loop
     b:=upper(regexp_substr(src,':([A-Za-z][A-Za-z0-9_]*)',1,i,null,1));
     if instr(seen,'|'||b||'|')=0 then
       begin dbms_sql.bind_variable(cur,':'||b,v(b)); exception when others then if sqlcode<>-1006 then raise; end if; end;
       seen:=seen||b||'|';
     end if;
   end loop;
   dbms_sql.define_column(cur,1,total); dbms_sql.define_column(cur,2,missing);
   dbms_sql.define_column(cur,3,repeated);
   if desc_cols(4).col_type=12 then dbms_sql.define_column(cur,4,latest_date);
   else dbms_sql.define_column(cur,4,changed,100);changed_available:=0;end if;
   n:=dbms_sql.execute(cur);n:=dbms_sql.fetch_rows(cur);
   dbms_sql.column_value(cur,1,total);dbms_sql.column_value(cur,2,missing);
   dbms_sql.column_value(cur,3,repeated);
   if desc_cols(4).col_type=12 then dbms_sql.column_value(cur,4,latest_date);changed:=to_char(latest_date,'DD Mon YYYY');
   else dbms_sql.column_value(cur,4,changed);end if;
   dbms_sql.close_cursor(cur);
   apex_json.open_object;apex_json.write('title',c.master_name||' KPIs');
   apex_json.write('scope','Uses the register source and current page filters. Interactive report search and saved-report filters are not included.');
   apex_json.open_array('cards');
   card('Total records',to_char(total,'FM999G999G999G990'),'Records in this register scope');
   if missing is not null then card('Missing code / name',to_char(missing,'FM999G999G999G990'),'Identity fields to review');end if;
   if repeated is not null then card('Repeated names',to_char(repeated,'FM999G999G999G990'),'Additional rows sharing a normalized name; review before merging');end if;
   if changed_available>0 then card('Latest recorded change',nvl(changed,'No date recorded'),'Latest available record date');end if;
   apex_json.close_array;apex_json.close_object;
 exception when others then
   if cur is not null and dbms_sql.is_open(cur) then dbms_sql.close_cursor(cur);end if;
   raise;
 end;
end;
/
