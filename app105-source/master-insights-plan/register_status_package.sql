create or replace package imart_register_kpis authid definer as
 procedure payload(p_page number);
 procedure apply_status(p_page number,p_mode varchar2,p_status varchar2);
 function selected_mode(p_page number) return varchar2;
 function selected_status(p_page number) return varchar2;
 function creation_test(p_page number,p_mode varchar2) return varchar2;
end;
/
create or replace package body imart_register_kpis as
 function creation_test(p_page number,p_mode varchar2) return varchar2 is
  x imart_mr_creation%rowtype; pred varchar2(4000);
 begin
  select * into x from imart_mr_creation where page_id=p_page;
  if p_mode='RECENT' and x.created_column is not null then
   pred:='mr_created.'||dbms_assert.simple_sql_name(x.created_column)||' >= sysdate-7 and mr_created.'||dbms_assert.simple_sql_name(x.created_column)||' <= sysdate';
  elsif p_mode='MINE' and x.creator_column is not null then
   pred:='upper(trim(mr_created.'||dbms_assert.simple_sql_name(x.creator_column)||'))=upper(trim(:APP_USER))';
  else return '1=0';end if;
  return 'exists(select 1 from '||dbms_assert.simple_sql_name(x.table_name)||' mr_created where mr_created.'||dbms_assert.simple_sql_name(x.identity_column)||'=mr_source.'||dbms_assert.simple_sql_name(x.identity_column)||' and '||pred||')';
 exception when no_data_found then return '1=0';
 end;
 function cname(p_page number) return varchar2 is
 begin return 'MR_KPI_105_'||to_char(p_page,'FM999999');end;
 function selected_mode(p_page number) return varchar2 is m varchar2(10);cn varchar2(100):=cname(p_page);
 begin select c001 into m from apex_collections where collection_name=cn and seq_id=1;return m;
 exception when no_data_found then return 'ALL';end;
 function selected_status(p_page number) return varchar2 is s varchar2(4000);cn varchar2(100):=cname(p_page);
 begin select c002 into s from apex_collections where collection_name=cn and seq_id=1;return s;
 exception when no_data_found then return null;end;
 procedure context(p_page number,r out imart_mr_register%rowtype,c out imart_mr_catalog%rowtype) is
 begin
  if v('APP_ID')<>'105' or p_page<>to_number(v('APP_PAGE_ID')) then raise_application_error(-20001,'Register context mismatch');end if;
  select * into c from imart_mr_catalog where register_page=p_page and imart_master_reports.allowed(module_code)=1 fetch first 1 row only;
  select * into r from imart_mr_register where page_id=p_page and module_code=c.module_code;
 end;
 procedure apply_status(p_page number,p_mode varchar2,p_status varchar2) is
  r imart_mr_register%rowtype;c imart_mr_catalog%rowtype;
 begin
  context(p_page,r,c);
  if p_mode not in ('ALL','STATUS','RECENT','MINE') or p_mode is null or length(p_status)>4000 then raise_application_error(-20002,'Invalid KPI filter');end if;
  if p_mode='STATUS' and r.status_expression is null then raise_application_error(-20003,'No status available');end if;
  if p_mode in ('RECENT','MINE') and creation_test(p_page,p_mode)='1=0' then raise_application_error(-20003,'Creation metadata unavailable');end if;
  apex_collection.create_or_truncate_collection(cname(p_page));
  apex_collection.add_member(p_collection_name=>cname(p_page),p_c001=>p_mode,p_c002=>p_status);
  apex_json.open_object;apex_json.write('ok',true);apex_json.close_object;
 end;
 procedure payload(p_page number) is
  r imart_mr_register%rowtype;c imart_mr_catalog%rowtype;
  src clob;q clob;cur integer;n integer;b varchar2(128);seen varchar2(32767):='|';
  status_value varchar2(4000);amount number;total number:=0;recent number:=0;mine number:=0;nr number;nm number;
  type counts is table of number index by pls_integer;
  type labels is table of varchar2(4000) index by pls_integer;
  vals labels;nums counts;i pls_integer:=0;
  procedure card(label varchar2,value number,card_mode varchar2,status varchar2) is
  begin
   apex_json.open_object;apex_json.write('label',label);apex_json.write('value',to_char(value,'FM999G999G999G990'));
   apex_json.write('mode',card_mode);apex_json.write('status',status,true);
   apex_json.write('selected',selected_mode(p_page)=card_mode and (card_mode<>'STATUS' or nvl(selected_status(p_page),chr(1))=nvl(status,chr(1))));
   if card_mode='RECENT' then apex_json.write('note','Created in the last 7 days');
   elsif card_mode='MINE' then apex_json.write('note','Created by '||v('APP_USER'));end if;
   apex_json.close_object;
  end;
 begin
  context(p_page,r,c);
  src:=regexp_replace(r.query_sql,';[[:space:]]*$','');
  src:='select distinct '||case when r.identity_column is not null then dbms_assert.simple_sql_name(r.identity_column)||' mr_id,' else 'rownum mr_id,' end||
    case when r.status_expression is null then 'cast(null as varchar2(4000))' else 'trim(cast('||r.status_expression||' as varchar2(4000)))' end||' mr_status,'||
    'case when '||creation_test(p_page,'RECENT')||' then 1 else 0 end mr_recent,'||
    'case when '||creation_test(p_page,'MINE')||' then 1 else 0 end mr_mine from ('||src||chr(10)||') mr_source';
  q:='select mr_status,count(*),sum(mr_recent),sum(mr_mine) from ('||src||chr(10)||') group by mr_status order by mr_status nulls last';
  cur:=dbms_sql.open_cursor;dbms_sql.parse(cur,q,dbms_sql.native);
  for j in 1..regexp_count(src,':[A-Za-z][A-Za-z0-9_]*') loop
   b:=upper(regexp_substr(src,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
   if instr(seen,'|'||b||'|')=0 then
    begin dbms_sql.bind_variable(cur,':'||b,v(b));exception when others then if sqlcode<>-1006 then raise;end if;end;
    seen:=seen||b||'|';
   end if;
  end loop;
  dbms_sql.define_column(cur,1,status_value,4000);dbms_sql.define_column(cur,2,amount);
  dbms_sql.define_column(cur,3,nr);dbms_sql.define_column(cur,4,nm);
  n:=dbms_sql.execute(cur);
  while dbms_sql.fetch_rows(cur)>0 loop
   dbms_sql.column_value(cur,1,status_value);dbms_sql.column_value(cur,2,amount);
   dbms_sql.column_value(cur,3,nr);dbms_sql.column_value(cur,4,nm);recent:=recent+nr;mine:=mine+nm;
   i:=i+1;vals(i):=status_value;nums(i):=amount;total:=total+amount;
  end loop;
  dbms_sql.close_cursor(cur);
  apex_json.open_object;apex_json.write('title',c.master_name||' KPIs');apex_json.write('region',r.region_static_id);
  apex_json.write('scope','Click a card to filter this register. Total clears only the KPI filter. New records uses the actual creation timestamp in the last rolling 7 days (server time), excluding future dates. Created by me matches the signed-in username against the original creator, across all dates. Counts use distinct masters and current page filters; report search/saved-report filters are additional.');
  apex_json.open_array('cards');card('Total',total,'ALL',null);
  if r.status_expression is not null then for j in 1..i loop card(nvl(vals(j),'No status'),nums(j),'STATUS',vals(j));end loop;end if;
  if creation_test(p_page,'RECENT')<>'1=0' then card('New records',recent,'RECENT',null);end if;
  if creation_test(p_page,'MINE')<>'1=0' then card('Created by me',mine,'MINE',null);end if;
  apex_json.close_array;apex_json.close_object;
 exception when others then
  if cur is not null and dbms_sql.is_open(cur) then dbms_sql.close_cursor(cur);end if;raise;
 end;
end;
/
