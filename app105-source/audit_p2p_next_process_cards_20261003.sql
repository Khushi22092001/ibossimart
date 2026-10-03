whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 1000
set linesize 280
set long 10000
set longchunksize 10000
set trimspool on
set serveroutput on size unlimited
connect -name IMART

prompt === P2P register KPI regions ===
select c.page_id,
       s.name page_name,
       c.region_id,
       c.region_label,
       c.region_static_id,
       c.status_expression,
       case when c.recent_predicate is not null then 'YES' else 'NO' end has_recent,
       case when c.mine_predicate is not null then 'YES' else 'NO' end has_mine
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
 where c.page_id in (107, 707, 709, 711, 713, 117, 147, 154, 132, 68, 145, 142, 151, 222)
   and c.state = 'READY'
 order by c.page_id, c.region_id;

prompt === P2P config rows including non-ready states ===
select c.page_id,
       s.name page_name,
       c.region_id,
       c.region_label,
       c.state,
       c.issue
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
 where c.page_id in (107, 707, 709, 711, 713, 117, 147, 154, 132, 68, 145, 142, 151, 222)
 order by c.page_id, c.region_id;

prompt === Report regions on P2P pages missing READY configuration ===
select p.page_id,
       s.name page_name,
       p.id region_id,
       p.plug_name region_name,
       p.static_id,
       p.plug_source_type,
       p.plug_display_point
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id = p.flow_id
   and s.id = p.page_id
 where p.flow_id = 105
   and p.page_id in (107, 117, 68, 145, 142, 151)
   and p.plug_source_type in ('NATIVE_IR', 'NATIVE_IG', 'NATIVE_SQL_REPORT')
 order by p.page_id, p.plug_display_sequence, p.id;

prompt === Projected columns in P2P register sources ===
declare
  l_cursor integer;
  l_count integer;
  l_desc dbms_sql.desc_tab2;
begin
  for r in (
    select c.page_id, s.name page_name, c.region_id, c.source_sql
      from imart_rkpi_config c
      join apex_260100.wwv_flow_steps s
        on s.flow_id = 105
       and s.id = c.page_id
     where c.page_id in (107, 707, 709, 711, 713, 117, 147, 154, 132, 68, 145, 142, 151, 222)
       and c.state = 'READY'
     order by c.page_id, c.region_id
  ) loop
    dbms_output.put_line(chr(10) || 'PAGE=' || r.page_id || ' ' || r.page_name || ' REGION=' || r.region_id);
    l_cursor := dbms_sql.open_cursor;
    dbms_sql.parse(l_cursor, r.source_sql, dbms_sql.native);
    dbms_sql.describe_columns2(l_cursor, l_count, l_desc);
    for i in 1 .. l_count loop
      dbms_output.put_line(lpad(i, 3) || ' ' || l_desc(i).col_name || ' type=' || l_desc(i).col_type);
    end loop;
    dbms_sql.close_cursor(l_cursor);
  end loop;
exception
  when others then
    if l_cursor is not null and dbms_sql.is_open(l_cursor) then
      dbms_sql.close_cursor(l_cursor);
    end if;
    raise;
end;
/

prompt === Candidate transaction link columns ===
select table_name,
       column_id,
       column_name,
       data_type
  from user_tab_columns
 where table_name in (
       'INDENT', 'INDENTDETAIL',
       'ENQUIRY', 'ENQUIRYDETAIL',
       'QUOTATION', 'QUOTATIONDETAIL',
       'COMPARATIVESTATEMENT', 'COMPARATIVESTATEMENTITEM', 'COMPARATIVESTATEMENTDETAIL',
       'RATECONTRACT', 'RATECONTRACTDETAIL',
       'PURCHASEORDER', 'PURCHASEORDERDETAIL',
       'POAMENDMENT', 'POAMENDMENTDETAIL',
       'LOADINGADVICE', 'LOADINGADVICEDETAIL',
       'MATERIALIN', 'MATERIALINDETAIL',
       'GRN', 'GRNDETAIL',
       'PURCHASEBILL', 'PURCHASEBILLDETAIL',
       'PURCHASEBILLPASS', 'PURCHASEBILLPASSDETAIL',
       'MRN', 'MRNDETAIL'
     )
   and (
       column_name = 'TNO'
       or regexp_like(column_name, '(INDENT|ENQUIRY|QUOTATION|COMPARATIVE|RATECONTRACT|PURCHASEORDER|POAMENDMENT|LOADINGADVICE|MATERIALIN|GRN|PURCHASEBILL|PURCHASEBILLPASS|MRN).*TNO')
     )
 order by table_name, column_id;

exit
