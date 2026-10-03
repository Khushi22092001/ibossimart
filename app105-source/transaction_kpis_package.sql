create or replace package imart_transaction_kpis authid definer as
 function selected_code(p_page number) return varchar2;
 function report_sql(p_page number) return clob;
 procedure payload(p_page number);
 procedure apply_filter(p_page number,p_mode varchar2,p_code varchar2);
end;
/
create or replace package body imart_transaction_kpis as
 function cname(p_page number) return varchar2 is begin return 'TX_KPI_105_'||to_char(p_page,'FM999999');end;
 function selected_code(p_page number) return varchar2 is c varchar2(30);cn varchar2(100):=cname(p_page);begin
 select c001 into c from apex_collections where collection_name=cn and seq_id=1;return c;
 exception when no_data_found then return 'ALL';end;
 procedure context(p_page number) is n number;begin
 if v('APP_ID')<>'105' or to_number(v('APP_PAGE_ID'))<>p_page then raise_application_error(-20001,'Transaction register context mismatch');end if;
 select count(*) into n from imart_tx_kpi_config where page_id=p_page;
 if n<>1 then raise_application_error(-20002,'Unsupported transaction register');end if;
 end;
 function report_sql(p_page number) return clob is r imart_tx_kpi_config%rowtype;q clob;begin
 select * into r from imart_tx_kpi_config where page_id=p_page;
 if p_page=145 then
 q:='with tx_flags as (select /*+ materialize */ * from ('||r.classifier_sql||chr(10)||')) select tx_source.* from ('||regexp_replace(r.source_sql,';[[:space:]]*$','')||chr(10)||') tx_source where (select imart_transaction_kpis.selected_code('||p_page||') from dual)=''ALL'' or exists(select 1 from tx_flags where tx_flags.tno=tx_source.tno and case (select imart_transaction_kpis.selected_code('||p_page||') from dual)';
 else
 q:='select tx_source.* from ('||regexp_replace(r.source_sql,';[[:space:]]*$','')||chr(10)||') tx_source where (select imart_transaction_kpis.selected_code('||p_page||') from dual)=''ALL'' or exists(select 1 from ('||r.classifier_sql||chr(10)||') tx_flags where tx_flags.tno=tx_source.tno and case (select imart_transaction_kpis.selected_code('||p_page||') from dual)';
 end if;
 for c in(select code from imart_tx_kpi_cards where page_id=p_page and code<>'ALL')loop
 q:=q||' when '''||c.code||''' then tx_flags.'||dbms_assert.simple_sql_name(c.code);
 end loop;return q||' else 0 end=1)';end;
 procedure apply_filter(p_page number,p_mode varchar2,p_code varchar2) is c varchar2(30);n number;begin
 context(p_page);c:=case when p_mode='ALL' then 'ALL' when p_mode='STATUS' then p_code end;
 select count(*) into n from imart_tx_kpi_cards where page_id=p_page and code=c;
 if n<>1 then raise_application_error(-20003,'Invalid transaction KPI filter');end if;
 apex_collection.create_or_truncate_collection(cname(p_page));apex_collection.add_member(p_collection_name=>cname(p_page),p_c001=>c);
 apex_json.open_object;apex_json.write('ok',true);apex_json.close_object;
 end;
 procedure payload(p_page number) is
 r imart_tx_kpi_config%rowtype;q clob;cur integer;n integer;b varchar2(128);seen varchar2(32767):='|';
 type nums is table of number index by pls_integer;values_found nums;idx integer:=0;
 begin
 context(p_page);select * into r from imart_tx_kpi_config where page_id=p_page;
 if p_page=145 then
 q:='with tx_flags as (select /*+ materialize */ * from ('||r.classifier_sql||chr(10)||')) select count(*)';
 else q:='select count(*)';end if;
 for c in(select * from imart_tx_kpi_cards where page_id=p_page and code<>'ALL' order by seq)loop q:=q||',nvl(sum(tx_flags.'||dbms_assert.simple_sql_name(c.code)||'),0)';end loop;
 q:=q||' from (select distinct tno from ('||regexp_replace(r.source_sql,';[[:space:]]*$','')||chr(10)||')) tx_scope left join ';
 if p_page=145 then q:=q||'tx_flags';else q:=q||'('||r.classifier_sql||chr(10)||') tx_flags';end if;
 q:=q||' on tx_flags.tno=tx_scope.tno';
 cur:=dbms_sql.open_cursor;dbms_sql.parse(cur,q,dbms_sql.native);
 for j in 1..regexp_count(q,':[A-Za-z][A-Za-z0-9_]*') loop
 b:=upper(regexp_substr(q,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
 if instr(seen,'|'||b||'|')=0 then begin dbms_sql.bind_variable(cur,':'||b,v(b));exception when others then if sqlcode<>-1006 then raise;end if;end;seen:=seen||b||'|';end if;
 end loop;
 for c in(select * from imart_tx_kpi_cards where page_id=p_page order by seq)loop idx:=idx+1;dbms_sql.define_column(cur,idx,n);end loop;
 n:=dbms_sql.execute(cur);if dbms_sql.fetch_rows(cur)>0 then for j in 1..idx loop dbms_sql.column_value(cur,j,n);values_found(j):=n;end loop;end if;dbms_sql.close_cursor(cur);
 apex_json.open_object;apex_json.write('region','MYID');apex_json.write('scope',r.scope_note);apex_json.open_array('cards');idx:=0;
 for c in(select * from imart_tx_kpi_cards where page_id=p_page order by seq)loop
 idx:=idx+1;apex_json.open_object;apex_json.write('label',c.label);apex_json.write('value',to_char(values_found(idx),'FM999G999G999G990'));
 apex_json.write('mode',case when c.code='ALL' then 'ALL' else 'STATUS' end);apex_json.write('status',c.code);apex_json.write('note',c.note);apex_json.write('selected',selected_code(p_page)=c.code);apex_json.close_object;
 end loop;apex_json.close_array;apex_json.close_object;
 exception when others then if cur is not null and dbms_sql.is_open(cur) then dbms_sql.close_cursor(cur);end if;raise;
 end;
end;
/
