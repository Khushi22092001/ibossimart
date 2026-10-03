whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
connect -name IMART
create table imart_rkpi_config(region_id number primary key,page_id number,module_code varchar2(100),region_label varchar2(255),region_static_id varchar2(255),source_sql clob,key_expression varchar2(4000),status_expression varchar2(4000),recent_predicate varchar2(4000),mine_predicate varchar2(4000),grain_label varchar2(255),scope_note varchar2(4000),state varchar2(20),issue varchar2(4000));
create table imart_rkpi_bak_20261003 as select p.* from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id in(select to_number(pageno default null on conversion error) from module where isactive='YES') and p.plug_source_type in('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT');
declare
 c integer;n integer;d dbms_sql.desc_tab2;q clob;k varchar2(4000);st varchar2(4000);recent varchar2(4000);mine varchar2(4000);pkjoin varchar2(4000);keylist varchar2(4000);grain varchar2(255);issue varchar2(4000);editable varchar2(3);state varchar2(20);tbl varchar2(128);
 type colmap is table of pls_integer index by varchar2(128);cols colmap;
 function has_col(t varchar2,col varchar2) return boolean is cnt number;begin select count(*) into cnt from user_tab_columns where table_name=t and column_name=col;return cnt=1;end;
begin
 for r in (select p.*,m.modulecode,upper(m.mastertablename) master_table
 from apex_260100.wwv_flow_page_plugs p join (select trim(pageno) pageno,min(modulecode) modulecode,min(mastertablename) mastertablename from module where isactive='YES' group by trim(pageno)) m on m.pageno=to_char(p.page_id)
 join apex_260100.wwv_flow_steps s on s.flow_id=p.flow_id and s.id=p.page_id
 where p.flow_id=105 and p.plug_source_type in('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT')
 and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing','i')
 and not exists(select 1 from apex_260100.wwv_flow_page_plugs kp where kp.flow_id=105 and kp.page_id=p.page_id and (kp.static_id like 'tx-kpi-shell-%' or kp.static_id like 'mr-kpi-shell-%')) order by p.page_id,p.id) loop
  state:='READY';issue:=null;q:=null;k:=null;st:=null;recent:=null;mine:=null;pkjoin:=null;keylist:=null;cols.delete;grain:='Rows in this report scope';tbl:=r.master_table;
  if r.plug_source_type='NATIVE_IG' then select upper(is_editable) into editable from apex_260100.apex_appl_page_igs where application_id=105 and region_id=r.id;
   if editable='YES' then state:='REVIEW';issue:='Editable grid: requires unsaved-edit safe filtering; original source retained.';end if;
  end if;
  if r.query_type='SQL' then q:=r.plug_source;
  elsif r.query_type='TABLE' and r.plug_source_type='NATIVE_IR' then
   q:='select * from '||dbms_assert.sql_object_name(r.query_table);
   if r.query_where is not null then q:=q||' where '||r.query_where;end if;
   if r.query_order_by is not null then q:=q||' order by '||r.query_order_by;end if;
  else state:='REVIEW';issue:='Non-SQL source requires dedicated source adapter.';end if;
  if state='READY' then
   c:=dbms_sql.open_cursor;
   begin
    dbms_sql.parse(c,q,dbms_sql.native);dbms_sql.describe_columns2(c,n,d);
    for j in 1..n loop cols(d(j).col_name):=d(j).col_type;end loop;
    -- Prefer the actual projected master primary key. Never infer a key from a label.
    for x in(select cc.column_name from user_constraints uc join user_cons_columns cc on cc.constraint_name=uc.constraint_name and cc.table_name=uc.table_name where uc.table_name=tbl and uc.constraint_type='P' order by cc.position) loop
     if not cols.exists(x.column_name) then keylist:=null;pkjoin:=null;exit;end if;
     keylist:=keylist||case when keylist is not null then '||chr(31)||' end||'nvl(to_char(rk_source.'||dbms_assert.simple_sql_name(x.column_name)||'),chr(0))';
     pkjoin:=pkjoin||case when pkjoin is not null then ' and ' end||'rk_created.'||dbms_assert.simple_sql_name(x.column_name)||'=rk_source.'||dbms_assert.simple_sql_name(x.column_name);
    end loop;
    if keylist is not null then k:=keylist;
    elsif cols.exists('TNO') then k:='rk_source.TNO';end if;
    for x in(select column_value col from table(sys.odcivarchar2list('DOCUMENTSTATUSCODE','DOCSTATUS','DOCUMENTSTATUS','STATUS','ISACTIVE','QUOTATIONSTATUS','WINLOSS'))) loop
     if cols.exists(x.col) and cols(x.col) in(1,96) then st:='trim(cast(rk_source.'||x.col||' as varchar2(4000)))';exit;end if;
    end loop;
    if pkjoin is not null then
     for x in(select column_name from user_tab_columns where table_name=tbl and column_name in('CREATIONTIME','CREATEDON','DATECREATED','DATECRATED') and data_type like '%DATE%' or table_name=tbl and column_name in('CREATIONTIME','CREATEDON','DATECREATED','DATECRATED') and data_type like 'TIMESTAMP%' order by case column_name when 'CREATIONTIME' then 1 else 2 end) loop
      recent:='exists(select 1 from '||dbms_assert.simple_sql_name(tbl)||' rk_created where '||pkjoin||' and rk_created.'||x.column_name||'>=sysdate-7 and rk_created.'||x.column_name||'<=sysdate)';exit;
     end loop;
     if has_col(tbl,'CREATOR') then mine:='exists(select 1 from '||dbms_assert.simple_sql_name(tbl)||' rk_created where '||pkjoin||' and upper(trim(rk_created.CREATOR))=upper(trim(:APP_USER)))';end if;
    end if;
   exception when others then state:='REVIEW';issue:=sqlerrm;end;
   dbms_sql.close_cursor(c);
  end if;
   insert into imart_rkpi_config values(r.id,r.page_id,r.modulecode,r.plug_name,nvl(r.static_id,'R'||r.id),q,k,st,recent,mine,grain,'Counts use the original report row grain and current page/access filters. Total clears only this KPI filter; report search and saved filters are additional. Creation cards use the original table timestamp and creator, not display names.',state,issue);
  dbms_output.put_line(r.page_id||' '||r.modulecode||' '||state||' '||issue);
 end loop;
end;
/
@app105-source/report_kpis_package_20261003.sql
declare c integer;q clob;errs number;msg varchar2(4000);begin
 select count(*) into errs from user_errors where name='IMART_REPORT_KPIS';if errs>0 then raise_application_error(-20001,'KPI package compilation errors');end if;
 for r in(select region_id,page_id from imart_rkpi_config where state='READY')loop
 c:=dbms_sql.open_cursor;
 begin q:=imart_report_kpis.report_sql(r.region_id);dbms_sql.parse(c,q,dbms_sql.native);q:=imart_report_kpis.count_sql(r.region_id);dbms_sql.parse(c,q,dbms_sql.native);
 exception when others then msg:=sqlerrm;update imart_rkpi_config set state='REVIEW',issue=msg where region_id=r.region_id;end;
 dbms_sql.close_cursor(c);
 end loop;
end;
/
commit;
set sqlformat csv
spool app105-source/verification/report-kpi-preflight-20261003.csv
select region_id,page_id,module_code,region_label,key_expression,status_expression,recent_predicate,mine_predicate,grain_label,state,issue from imart_rkpi_config order by page_id;
spool off
exit
