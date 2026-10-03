create or replace package imart_report_kpis authid definer as
 function selected_mode(p_region number) return varchar2;
 function selected_status(p_region number) return varchar2;
 function report_sql(p_region number) return clob;
 function count_sql(p_region number) return clob;
 procedure payload(p_region number);
 procedure apply_filter(p_region number,p_mode varchar2,p_status varchar2);
end;
/
create or replace package body imart_report_kpis as
 function cname(p_region number) return varchar2 is begin return 'RKPI_105_'||to_char(p_region,'FM99999999999999999999');end;
 function selected_mode(p_region number) return varchar2 is m varchar2(10);cn varchar2(100):=cname(p_region);begin
 select c001 into m from apex_collections where collection_name=cn and seq_id=1;return m;
 exception when no_data_found then return 'ALL';end;
 function selected_status(p_region number) return varchar2 is m varchar2(4000);cn varchar2(100):=cname(p_region);begin
 select c002 into m from apex_collections where collection_name=cn and seq_id=1;return m;
 exception when no_data_found then return null;end;
 procedure context(p_region number,r out imart_rkpi_config%rowtype) is g imart_rkpi_bak_20261003%rowtype;begin
 select * into r from imart_rkpi_config where region_id=p_region and state='READY';
 if v('APP_ID')<>'105' or r.page_id<>to_number(v('APP_PAGE_ID')) or v('APP_USER') is null or upper(v('APP_USER'))='NOBODY' then raise_application_error(-20001,'Report KPI context mismatch');end if;
 select * into g from imart_rkpi_bak_20261003 where flow_id=105 and page_id=r.page_id and id=p_region;
 if not apex_plugin_util.is_component_used(p_authorization_scheme_id=>to_char(g.plug_required_role),p_condition_type=>g.plug_display_condition_type,p_condition_expression1=>g.plug_display_when_condition,p_condition_expression2=>g.plug_display_when_cond2,p_component=>'REGION') then raise_application_error(-20003,'Report is not available in this context');end if;
 end;
 function report_sql(p_region number) return clob is r imart_rkpi_config%rowtype;q clob;m varchar2(200);begin
 select * into r from imart_rkpi_config where region_id=p_region;
 m:='(select imart_report_kpis.selected_mode('||to_char(p_region,'FM99999999999999999999')||') from dual)';
 q:='select rk_source.* from ('||regexp_replace(r.source_sql,';[[:space:]]*$','')||chr(10)||') rk_source where ('||m||'=''ALL''';
 if r.status_expression is not null then q:=q||' or ('||m||'=''STATUS'' and '||r.status_expression||'=(select imart_report_kpis.selected_status('||to_char(p_region,'FM99999999999999999999')||') from dual))';end if;
 if r.process_expression is not null then q:=q||' or ('||m||'=''PROCESS'' and '||r.process_expression||'=(select imart_report_kpis.selected_status('||to_char(p_region,'FM99999999999999999999')||') from dual))';end if;
 if r.recent_predicate is not null then q:=q||' or ('||m||'=''RECENT'' and '||r.recent_predicate||')';end if;
 if r.mine_predicate is not null then q:=q||' or ('||m||'=''MINE'' and '||r.mine_predicate||')';end if;
 return q||')';end;
 function count_sql(p_region number) return clob is r imart_rkpi_config%rowtype;base clob;q clob;begin
 select * into r from imart_rkpi_config where region_id=p_region;
 base:='select 1 rk_row,'||nvl(r.status_expression,'cast(null as varchar2(4000))')||' rk_status,'||
       nvl(r.process_expression,'cast(null as varchar2(4000))')||' rk_process,'||
       'case when '||nvl(r.recent_predicate,'1=0')||' then 1 else 0 end rk_recent,'||
       'case when '||nvl(r.mine_predicate,'1=0')||' then 1 else 0 end rk_mine from ('||
       regexp_replace(r.source_sql,';[[:space:]]*$','')||chr(10)||') rk_source';
 q:='with rk_rows as ('||base||') '||
    'select ''ALL'' rk_mode,cast(null as varchar2(4000)) rk_status,count(*) rk_amount,0 rk_order from rk_rows';
 if r.status_expression is not null then
   q:=q||' union all select ''STATUS'',rk_status,count(*),10 from rk_rows where rk_status is not null and upper(rk_status) not in(''STATUS'',''DOCSTATUS'',''NO STATUS'') group by rk_status';
 end if;
 if r.process_expression is not null then
   q:=q||' union all select ''PROCESS'',rk_process,count(*),20 from rk_rows where rk_process is not null group by rk_process';
 end if;
 if r.recent_predicate is not null then
   q:=q||' union all select ''RECENT'',cast(null as varchar2(4000)),count(case when rk_recent=1 then 1 end),30 from rk_rows';
 end if;
 if r.mine_predicate is not null then
   q:=q||' union all select ''MINE'',cast(null as varchar2(4000)),count(case when rk_mine=1 then 1 end),40 from rk_rows';
 end if;
 q:=q||' union all select c.card_mode,c.status_code,0,'||
      'case c.card_mode when ''STATUS'' then 10 when ''PROCESS'' then 20 else c.display_order end '||
      'from imart_rkpi_status_catalog c where c.region_id='||to_char(p_region,'FM99999999999999999999')||
      ' and not exists (select 1 from rk_rows where '||
      '(c.card_mode=''STATUS'' and upper(rk_status)=upper(c.status_code)) or '||
      '(c.card_mode=''PROCESS'' and upper(rk_process)=upper(c.status_code)))';
 return 'select rk_mode,rk_status,rk_amount from ('||q||') order by rk_order,rk_status';
 end;
 procedure apply_filter(p_region number,p_mode varchar2,p_status varchar2) is r imart_rkpi_config%rowtype;begin
 context(p_region,r);
 if p_mode is null or p_mode not in('ALL','STATUS','PROCESS','RECENT','MINE') or length(p_status)>4000 or
 (p_mode='STATUS' and (r.status_expression is null or p_status is null)) or
 (p_mode='PROCESS' and (r.process_expression is null or p_status is null)) or
 (p_mode='RECENT' and r.recent_predicate is null) or (p_mode='MINE' and r.mine_predicate is null) then raise_application_error(-20002,'Invalid report KPI filter');end if;
 apex_collection.create_or_truncate_collection(cname(p_region));apex_collection.add_member(p_collection_name=>cname(p_region),p_c001=>p_mode,p_c002=>p_status);
 apex_json.open_object;apex_json.write('ok',true);apex_json.close_object;
 end;
 procedure payload(p_region number) is r imart_rkpi_config%rowtype;q clob;c integer;n integer;b varchar2(128);seen varchar2(32767):='|';card_seen varchar2(32767):='|';m varchar2(10);s varchar2(4000);amount number;
 begin
 context(p_region,r);q:=count_sql(p_region);c:=dbms_sql.open_cursor;dbms_sql.parse(c,q,dbms_sql.native);
 for j in 1..regexp_count(q,':[A-Za-z][A-Za-z0-9_]*') loop b:=upper(regexp_substr(q,':([A-Za-z][A-Za-z0-9_]*)',1,j,null,1));
 if instr(seen,'|'||b||'|')=0 then begin dbms_sql.bind_variable(c,':'||b,v(b));exception when others then if sqlcode<>-1006 then raise;end if;end;seen:=seen||b||'|';end if;end loop;
 dbms_sql.define_column(c,1,m,10);dbms_sql.define_column(c,2,s,4000);dbms_sql.define_column(c,3,amount);n:=dbms_sql.execute(c);
 apex_json.open_object;apex_json.write('region',r.region_static_id);apex_json.write('scope',r.scope_note);apex_json.open_array('cards');
 while dbms_sql.fetch_rows(c)>0 loop
 dbms_sql.column_value(c,1,m);dbms_sql.column_value(c,2,s);dbms_sql.column_value(c,3,amount);
 if m in('STATUS','PROCESS') and s is not null then card_seen:=card_seen||m||'~'||upper(s)||'|';end if;
 apex_json.open_object;apex_json.write('mode',m);apex_json.write('status',s,true);
 apex_json.write('label',case m when 'ALL' then 'Total records' when 'RECENT' then 'Last 7 days' when 'MINE' then 'Created by me' else s end);
 apex_json.write('value',to_char(amount,'FM999G999G999G990'));apex_json.write('selected',selected_mode(p_region)=m and (m not in('STATUS','PROCESS') or selected_status(p_region)=s));
 apex_json.write('note',case m when 'ALL' then r.grain_label when 'RECENT' then 'Rows dated in the last 7 days' when 'MINE' then 'Rows created by '||v('APP_USER') when 'PROCESS' then 'Active records waiting for the next document' else 'Report rows with this status' end);
 apex_json.close_object;end loop;
 for x in (select card_mode,status_code from imart_rkpi_status_catalog where region_id=p_region order by display_order,status_code) loop
 if instr(card_seen,'|'||x.card_mode||'~'||upper(x.status_code)||'|')=0 then
 apex_json.open_object;apex_json.write('mode',x.card_mode);apex_json.write('status',x.status_code);
 apex_json.write('label',x.status_code);apex_json.write('value','0');apex_json.write('selected',selected_mode(p_region)=x.card_mode and selected_status(p_region)=x.status_code);
 apex_json.write('note',case when x.card_mode='PROCESS' then 'Active records waiting for the next document' else 'Report rows with this status' end);apex_json.close_object;
 end if;end loop;
 dbms_sql.close_cursor(c);apex_json.close_array;apex_json.close_object;
 exception when others then if c is not null and dbms_sql.is_open(c) then dbms_sql.close_cursor(c);end if;raise;
 end;
end;
/
