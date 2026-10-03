whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on size unlimited
connect -name IMART

declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_RKPI_CONFIG_BAK_ROWCOUNT';
  if l_exists = 0 then
    execute immediate 'create table imart_rkpi_config_bak_rowcount as select * from imart_rkpi_config';
  end if;
end;
/

@app105-source/report_kpis_package_20261003.sql

declare
  l_errors number;
begin
  select count(*) into l_errors
    from user_errors
   where name = 'IMART_REPORT_KPIS';
  if l_errors > 0 then
    raise_application_error(-20001, 'IMART_REPORT_KPIS compilation errors=' || l_errors);
  end if;
end;
/

update imart_rkpi_config
   set grain_label = 'Rows in this report scope',
       scope_note = 'Counts use the original report row grain and current page/access filters. Total clears only this KPI filter; report search and saved filters are additional. Creation cards use the original table timestamp and creator, not display names.'
 where state = 'READY';

update imart_rkpi_config
   set status_expression = q'~case
         when rk_source.POAMENDMENTTNO is null then 'NOT AMENDED'
         else nvl(
           (select ds.documentstatuscode
              from documentstatusdetail ds
             where ds.modulecode = 'POAMENDMENT'
               and ds.moduletno = rk_source.POAMENDMENTTNO
             fetch first 1 row only),
           'AMENDED'
         )
       end~',
       recent_predicate = q'~exists (
         select 1
           from poamendment rk_created
          where rk_created.tno = rk_source.POAMENDMENTTNO
            and rk_created.creationtime >= sysdate - 7
            and rk_created.creationtime <= sysdate
       )~',
       mine_predicate = q'~exists (
         select 1
           from poamendment rk_created
          where rk_created.tno = rk_source.POAMENDMENTTNO
            and upper(trim(rk_created.creator)) = upper(trim(:APP_USER))
       )~'
 where page_id = 147
   and region_id = 500104838763311836
   and state = 'READY';

declare
  l_cursor integer;
  l_sql clob;
begin
  for r in (
    select region_id, page_id
      from imart_rkpi_config
     where state = 'READY'
     order by page_id, region_id
  ) loop
    l_cursor := dbms_sql.open_cursor;
    begin
      l_sql := imart_report_kpis.report_sql(r.region_id);
      dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
      l_sql := imart_report_kpis.count_sql(r.region_id);
      dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
    exception
      when others then
        if dbms_sql.is_open(l_cursor) then
          dbms_sql.close_cursor(l_cursor);
        end if;
        raise_application_error(-20002,
          'KPI parse failed for page ' || r.page_id || ', region ' || r.region_id || ': ' || sqlerrm);
    end;
    dbms_sql.close_cursor(l_cursor);
  end loop;
end;
/

commit;

prompt === Row-count KPI configuration verification ===
select count(*) ready_regions,
       sum(case when grain_label = 'Rows in this report scope' then 1 else 0 end) row_grain_regions
  from imart_rkpi_config
 where state = 'READY';

select page_id,
       region_id,
       status_expression,
       recent_predicate,
       mine_predicate,
       grain_label
  from imart_rkpi_config
 where page_id = 147;

exit
