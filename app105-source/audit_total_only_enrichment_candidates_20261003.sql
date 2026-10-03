whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
set serveroutput on size unlimited

declare
  l_cursor integer;
  l_count integer;
  l_desc dbms_sql.desc_tab2;
  l_date_col varchar2(128);
  l_date_rank number;
  l_creator_col varchar2(128);
  l_candidate_regions number := 0;
  l_date_regions number := 0;
  l_creator_regions number := 0;
  l_no_candidate_regions number := 0;
  l_rank number;
begin
  for r in (
    select region_id, page_id, region_label, source_sql
      from imart_rkpi_config
     where state = 'READY'
       and status_expression is null
       and recent_predicate is null
       and mine_predicate is null
     order by page_id, region_id
  ) loop
    l_candidate_regions := l_candidate_regions + 1;
    l_date_col := null;
    l_date_rank := 999;
    l_creator_col := null;
    l_cursor := dbms_sql.open_cursor;
    begin
      dbms_sql.parse(l_cursor, r.source_sql, dbms_sql.native);
      dbms_sql.describe_columns2(l_cursor, l_count, l_desc);
      for i in 1..l_count loop
        if l_desc(i).col_type in (12, 180, 181, 231) then
          l_rank := case
            when l_desc(i).col_name in ('CREATIONTIME','CREATEDON','DATECREATED','DATECRATED') then 1
            when regexp_like(l_desc(i).col_name, '(TRANSACTION|DOCUMENT|DOC|ENTRY|VOUCHER|POSTING)DATE$') then 2
            when regexp_like(l_desc(i).col_name, 'DATE$') then 3
            else 9
          end;
          if l_rank < l_date_rank then
            l_date_col := l_desc(i).col_name;
            l_date_rank := l_rank;
          end if;
        end if;
        if l_creator_col is null and l_desc(i).col_type in (1, 96)
           and l_desc(i).col_name in ('CREATOR','CREATEDBY','CREATED_BY') then
          l_creator_col := l_desc(i).col_name;
        end if;
      end loop;

      if l_date_col is not null then l_date_regions := l_date_regions + 1; end if;
      if l_creator_col is not null then l_creator_regions := l_creator_regions + 1; end if;
      if l_date_col is null and l_creator_col is null then
        l_no_candidate_regions := l_no_candidate_regions + 1;
      end if;

      dbms_output.put_line(
        'CANDIDATE page=' || r.page_id ||
        ' region=' || r.region_id ||
        ' date=' || nvl(l_date_col, '-') ||
        ' creator=' || nvl(l_creator_col, '-') ||
        ' label=' || substr(r.region_label,1,80)
      );
    exception
      when others then
        dbms_output.put_line('ERROR page=' || r.page_id || ' region=' || r.region_id || ' ' || sqlerrm);
    end;
    if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
  end loop;

  dbms_output.put_line('TOTAL_ONLY_REGIONS=' || l_candidate_regions);
  dbms_output.put_line('DATE_CANDIDATE_REGIONS=' || l_date_regions);
  dbms_output.put_line('CREATOR_CANDIDATE_REGIONS=' || l_creator_regions);
  dbms_output.put_line('NO_SAFE_CANDIDATE_REGIONS=' || l_no_candidate_regions);
end;
/

exit
