whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
set serveroutput on size unlimited

declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_RKPI_CONFIG_BAK_ENRICH';
  if l_exists = 0 then
    execute immediate 'create table imart_rkpi_config_bak_enrich as select * from imart_rkpi_config';
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

declare
  l_cursor integer;
  l_count integer;
  l_desc dbms_sql.desc_tab2;
  l_date_col varchar2(128);
  l_date_rank number;
  l_creator_col varchar2(128);
  l_rank number;
  l_recent varchar2(4000);
  l_mine varchar2(4000);
  l_updated number := 0;
begin
  for r in (
    select region_id, page_id, source_sql
      from imart_rkpi_config
     where state = 'READY'
       and status_expression is null
       and recent_predicate is null
       and mine_predicate is null
     order by page_id, region_id
  ) loop
    l_date_col := null;
    l_date_rank := 999;
    l_creator_col := null;
    l_recent := null;
    l_mine := null;
    l_cursor := dbms_sql.open_cursor;
    begin
      dbms_sql.parse(l_cursor, r.source_sql, dbms_sql.native);
      dbms_sql.describe_columns2(l_cursor, l_count, l_desc);
      for i in 1..l_count loop
        if l_desc(i).col_type in (12, 180, 181, 231)
           and not regexp_like(l_desc(i).col_name, '^(FROM|TO)_?DATE$') then
          l_rank := case
            when l_desc(i).col_name in ('CREATIONTIME','CREATEDON','DATECREATED','DATECRATED') then 1
            when regexp_like(l_desc(i).col_name, '(TRANSACTION|DOCUMENT|DOC|ENTRY|VOUCHER|POSTING)DATE$') then 2
            when regexp_like(l_desc(i).col_name, 'DATE$') then 3
            else 9
          end;
          if l_rank < l_date_rank then
            l_date_col := dbms_assert.simple_sql_name(l_desc(i).col_name);
            l_date_rank := l_rank;
          end if;
        end if;

        if l_creator_col is null
           and l_desc(i).col_type in (1, 96)
           and l_desc(i).col_name in ('CREATOR','CREATEDBY','CREATED_BY') then
          l_creator_col := dbms_assert.simple_sql_name(l_desc(i).col_name);
        end if;
      end loop;

      if l_date_col is not null then
        l_recent := 'rk_source.' || l_date_col || '>=trunc(sysdate)-6 and rk_source.' || l_date_col || '<trunc(sysdate)+1';
      end if;
      if l_creator_col is not null then
        l_mine := 'upper(trim(cast(rk_source.' || l_creator_col || ' as varchar2(4000))))=upper(trim(:APP_USER))';
      end if;

      if l_recent is not null or l_mine is not null then
        update imart_rkpi_config
           set recent_predicate = l_recent,
               mine_predicate = l_mine
         where region_id = r.region_id;
        l_updated := l_updated + 1;
        dbms_output.put_line('ENRICHED page=' || r.page_id || ' region=' || r.region_id ||
          ' date=' || nvl(l_date_col,'-') || ' creator=' || nvl(l_creator_col,'-'));
      end if;
    exception
      when others then
        if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
        raise_application_error(-20002,
          'Enrichment failed for page ' || r.page_id || ', region ' || r.region_id || ': ' || sqlerrm);
    end;
    dbms_sql.close_cursor(l_cursor);
  end loop;
  dbms_output.put_line('ENRICHED_REGIONS=' || l_updated);
end;
/

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
        if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
        raise_application_error(-20003,
          'Post-enrichment parse failed for page ' || r.page_id || ', region ' || r.region_id || ': ' || sqlerrm);
    end;
    dbms_sql.close_cursor(l_cursor);
  end loop;
end;
/

commit;

select count(*) ready_regions,
       sum(case when status_expression is not null then 1 else 0 end) status_regions,
       sum(case when recent_predicate is not null then 1 else 0 end) recent_regions,
       sum(case when mine_predicate is not null then 1 else 0 end) mine_regions,
       sum(case when status_expression is null and recent_predicate is null and mine_predicate is null then 1 else 0 end) source_specific_regions
  from imart_rkpi_config
 where state = 'READY';

exit
