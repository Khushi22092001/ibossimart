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
  select count(*)
    into l_exists
    from user_tables
   where table_name = 'IMART_CSREG_BAK_20261003';

  if l_exists = 0 then
    execute immediate q'~
      create table imart_csreg_bak_20261003 as
      select 'ITEM' component_type,
             id component_id,
             name component_name,
             item_default old_value_1,
             item_default_type old_value_2,
             item_default_language old_value_3,
             use_cache_before_default old_value_4
        from apex_260100.wwv_flow_step_items
       where flow_id = 105
         and flow_step_id = 711
         and name in ('P711_COMPANY', 'P711_LOCATION')
      union all
      select 'KPI',
             region_id,
             region_label,
             status_expression,
             recent_predicate,
             mine_predicate,
             scope_note
        from imart_rkpi_config
       where page_id = 711
         and region_id = 462028200917989297
    ~';
  end if;
end;
/

declare
  l_items number;
  l_kpis number;
begin
  select count(*)
    into l_items
    from apex_260100.wwv_flow_step_items
   where flow_id = 105
     and flow_step_id = 711
     and name in ('P711_COMPANY', 'P711_LOCATION');

  select count(*)
    into l_kpis
    from imart_rkpi_config
   where page_id = 711
     and region_id = 462028200917989297
     and state = 'READY';

  if l_items <> 2 or l_kpis <> 1 then
    raise_application_error(-20001,
      'Comparative Statement preflight failed: items=' || l_items || ', KPI rows=' || l_kpis);
  end if;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 0,
    p_default_owner           => 'IMART'
  );

  update apex_260100.wwv_flow_step_items
     set item_default = q'~select listagg(companycode, ':') within group (order by companycode)
                              from (
                                select distinct a.companycode
                                  from moduleprivilege a
                                  join bossuser bu
                                    on bu.bossusercode = a.bossusercode
                                 where a.modulecode = 'PURCHASEORDER'
                                   and a.viewprivilege = 'YES'
                                   and upper(bu.bossusername) = upper(:APP_USER)
                              )~',
         item_default_type = 'SQL_QUERY',
         item_default_language = null,
         use_cache_before_default = 'YES'
   where flow_id = 105
     and flow_step_id = 711
     and name = 'P711_COMPANY';

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'P711_COMPANY default update count mismatch');
  end if;

  update apex_260100.wwv_flow_step_items
     set item_default = q'~select listagg(locationcode, ':') within group (order by locationcode)
                              from (
                                select distinct l.locationcode
                                  from moduleprivilege a
                                  left join moduleprivilegelocation b
                                    on b.tno = a.tno
                                  join bossuser bu
                                    on bu.bossusercode = a.bossusercode
                                  join modulelocation ml
                                    on ml.modulecode = a.modulecode
                                  join modulelocationdetail md
                                    on md.tno = ml.tno
                                  join location l
                                    on (b.locationcode = l.locationcode or b.locationcode is null)
                                   and md.locationcode = l.locationcode
                                 where a.modulecode = 'COMPARATIVESTATEMENT'
                                   and upper(bu.bossusername) = upper(:APP_USER)
                              )~',
         item_default_type = 'SQL_QUERY',
         item_default_language = null,
         use_cache_before_default = 'YES'
   where flow_id = 105
     and flow_step_id = 711
     and name = 'P711_LOCATION';

  if sql%rowcount <> 1 then
    raise_application_error(-20003, 'P711_LOCATION default update count mismatch');
  end if;

  wwv_flow_imp.component_end;
end;
/

begin
  update imart_rkpi_config
     set status_expression = q'~case
           when exists (
             select 1
               from purchaseorder rk_po
              where rk_po.comparativestatementtno = rk_source.tno
           ) then 'PO CREATED'
           when nvl(getdocumentstatuscode('COMPARATIVESTATEMENT', rk_source.tno), 'ACTIVE') = 'ACTIVE'
             then 'AWAITING PO'
           else nvl(getdocumentstatuscode('COMPARATIVESTATEMENT', rk_source.tno), 'PENDING')
         end~',
         recent_predicate = q'~rk_source.comparativestatementdate >= trunc(sysdate) - 6
                                and rk_source.comparativestatementdate < trunc(sysdate) + 1~',
         mine_predicate = q'~exists (
           select 1
             from comparativestatement rk_cs
            where rk_cs.tno = rk_source.tno
              and upper(trim(rk_cs.creator)) = upper(trim(:APP_USER))
         )~',
         scope_note = 'Counts match the visible Comparative Statement report rows and current filters. Process cards show whether the statement is awaiting a Purchase Order or already has one.'
   where page_id = 711
     and region_id = 462028200917989297
     and state = 'READY';

  if sql%rowcount <> 1 then
    raise_application_error(-20004, 'Comparative Statement KPI update count mismatch');
  end if;
end;
/

declare
  l_cursor integer;
  l_sql clob;
begin
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

prompt === Comparative Statement register fix verification ===
select name,
       item_default_type,
       item_default_language,
       use_cache_before_default,
       length(item_default) default_length
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and flow_step_id = 711
   and name in ('P711_COMPANY', 'P711_LOCATION')
 order by name;

select page_id,
       region_id,
       case when status_expression is not null then 'YES' else 'NO' end has_process_status,
       case when recent_predicate is not null then 'YES' else 'NO' end has_recent,
       case when mine_predicate is not null then 'YES' else 'NO' end has_mine,
       scope_note
  from imart_rkpi_config
 where page_id = 711
   and region_id = 462028200917989297;

exit
