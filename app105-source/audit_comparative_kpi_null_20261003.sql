whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 240
set long 100000
set longchunksize 100000
set trimspool on
set serveroutput on size unlimited
connect -name IMART

prompt === Comparative Statement KPI configuration ===
select page_id,
       region_id,
       region_label,
       region_static_id,
       state,
       status_expression,
       recent_predicate,
       mine_predicate,
       grain_label,
       scope_note
  from imart_rkpi_config
 where page_id = 711;

prompt === Projected source columns ===
declare
  l_cursor integer;
  l_count integer;
  l_desc dbms_sql.desc_tab2;
begin
  for r in (
    select region_id, source_sql
      from imart_rkpi_config
     where page_id = 711
  ) loop
    dbms_output.put_line('REGION=' || r.region_id);
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

prompt === Generated KPI count SQL ===
select dbms_lob.getlength(imart_report_kpis.count_sql(region_id)) count_sql_length
  from imart_rkpi_config
 where page_id = 711;

prompt === Comparative Statement workflow status distribution ===
with workflow as (
  select cs.tno,
         nvl(
           (select max(ds.documentstatuscode)
              from documentstatusdetail ds
             where ds.modulecode = 'COMPARATIVESTATEMENT'
               and ds.moduletno = cs.tno),
           '<NULL>'
         ) configured_status,
         nvl(getdocumentstatuscode('COMPARATIVESTATEMENT', cs.tno), '<NULL>') function_status,
         case
           when exists (
             select 1
               from purchaseorder po
              where po.comparativestatementtno = cs.tno
           ) then 'PURCHASE ORDER CREATED'
           else 'AWAITING PURCHASE ORDER'
         end next_process
    from comparativestatement cs
)
select configured_status,
       function_status,
       next_process,
       count(*) documents
  from workflow
 group by configured_status, function_status, next_process
 order by 1, 2, 3;

prompt === Comparative Statement document dates and detail availability ===
select cs.tno,
       cs.comparativestatementno,
       to_char(cs.comparativestatementdate, 'DD-MM-YYYY') document_date,
       cs.companycode,
       cs.locationcode,
       cs.creator,
       (select count(*) from comparativestatementitem csi where csi.tno = cs.tno) item_rows,
       (select count(*) from comparativestatementdetail csd where csd.tno = cs.tno) participant_rows
  from comparativestatement cs
 order by cs.comparativestatementdate desc, cs.tno desc;

prompt === BOSS filter values available from the existing LOV security rules ===
select (
         select listagg(companycode, ':') within group (order by companycode)
           from (
             select distinct a.companycode
               from moduleprivilege a
               join bossuser bu on bu.bossusercode = a.bossusercode
              where a.modulecode = 'PURCHASEORDER'
                and a.viewprivilege = 'YES'
                and upper(bu.bossusername) = 'BOSS'
           )
       ) company_codes,
       (
         select listagg(locationcode, ':') within group (order by locationcode)
           from (
             select distinct l.locationcode
               from moduleprivilege a
               left join moduleprivilegelocation b on b.tno = a.tno
               join bossuser bu on bu.bossusercode = a.bossusercode
               join modulelocation ml on ml.modulecode = a.modulecode
               join modulelocationdetail md on md.tno = ml.tno
               join location l on (b.locationcode = l.locationcode or b.locationcode is null)
                              and md.locationcode = l.locationcode
              where a.modulecode = 'COMPARATIVESTATEMENT'
                and upper(bu.bossusername) = 'BOSS'
           )
       ) location_codes
  from dual;

exit
