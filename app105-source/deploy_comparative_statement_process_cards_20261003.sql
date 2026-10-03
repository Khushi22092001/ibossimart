whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 200
set linesize 240
connect -name IMART

declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_RKPI_PKG_BAK_CSPROC';
  if l_exists = 0 then
    execute immediate q'~
      create table imart_rkpi_pkg_bak_csproc as
      select name, type, line, text
        from user_source
       where name = 'IMART_REPORT_KPIS'
         and type in ('PACKAGE', 'PACKAGE BODY')
    ~';
  end if;

  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_RKPI_STATUS_CATALOG';
  if l_exists = 0 then
    execute immediate q'~
      create table imart_rkpi_status_catalog (
        region_id     number         not null,
        status_code   varchar2(400)  not null,
        display_order number         default 10 not null,
        constraint imart_rkpi_status_catalog_pk primary key (region_id, status_code)
      )
    ~';
  end if;
end;
/

merge into imart_rkpi_status_catalog d
using (
  select 462028200917989297 region_id, 'PO CREATED' status_code, 10 display_order from dual
  union all
  select 462028200917989297, 'PO NOT CREATED', 20 from dual
) s
on (d.region_id = s.region_id and d.status_code = s.status_code)
when matched then update set d.display_order = s.display_order
when not matched then insert (region_id, status_code, display_order)
values (s.region_id, s.status_code, s.display_order);

begin
  update imart_rkpi_config
     set status_expression = q'~case
           when exists (
             select 1
               from purchaseorder rk_po
              where rk_po.comparativestatementtno = rk_source.tno
           ) then 'PO CREATED'
           when nvl(getdocumentstatuscode('COMPARATIVESTATEMENT', rk_source.tno), 'ACTIVE') = 'ACTIVE'
             then 'PO NOT CREATED'
           else nvl(getdocumentstatuscode('COMPARATIVESTATEMENT', rk_source.tno), 'PENDING')
         end~',
         scope_note = 'Counts match the visible Comparative Statement report rows and current filters. PO Created and PO Not Created remain visible as the next-process cards, including zero counts.'
   where page_id = 711
     and region_id = 462028200917989297
     and state = 'READY';

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Comparative Statement process KPI update count mismatch');
  end if;
end;
/

@app105-source/report_kpis_package_20261003.sql

declare
  l_errors number;
  l_cursor integer;
  l_sql clob;
begin
  select count(*)
    into l_errors
    from user_errors
   where name = 'IMART_REPORT_KPIS'
     and type in ('PACKAGE', 'PACKAGE BODY');

  if l_errors > 0 then
    raise_application_error(-20002, 'IMART_REPORT_KPIS compilation errors=' || l_errors);
  end if;

  l_cursor := dbms_sql.open_cursor;
  l_sql := imart_report_kpis.report_sql(462028200917989297);
  dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);

  l_cursor := dbms_sql.open_cursor;
  l_sql := imart_report_kpis.count_sql(462028200917989297);
  dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);
exception
  when others then
    if l_cursor is not null and dbms_sql.is_open(l_cursor) then
      dbms_sql.close_cursor(l_cursor);
    end if;
    raise;
end;
/

commit;

prompt === Comparative Statement process-card verification ===
select c.page_id,
       c.region_id,
       s.status_code,
       s.display_order,
       case when instr(c.status_expression, s.status_code) > 0 then 'YES' else 'NO' end mapped_in_expression
  from imart_rkpi_config c
  join imart_rkpi_status_catalog s
    on s.region_id = c.region_id
 where c.page_id = 711
 order by s.display_order;

select count(*) package_errors
  from user_errors
 where name = 'IMART_REPORT_KPIS'
   and type in ('PACKAGE', 'PACKAGE BODY');

exit
