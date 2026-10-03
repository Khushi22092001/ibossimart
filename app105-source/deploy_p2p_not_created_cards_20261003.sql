whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 300
set linesize 260
connect -name IMART

declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_P2P_NOTCREATED_CFG_BAK';
  if l_exists = 0 then
    execute immediate q'~
      create table imart_p2p_notcreated_cfg_bak as
      select *
        from imart_rkpi_config
       where region_id in (
         416786540566841742,
         439473576294649698,
         462028200917989297,
         238367991065946931
       )
    ~';
  end if;

  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_P2P_NOTCREATED_REG_BAK';
  if l_exists = 0 then
    execute immediate q'~
      create table imart_p2p_notcreated_reg_bak as
      select *
        from apex_260100.wwv_flow_page_plugs
       where flow_id = 105
         and id = 477903160125596064
    ~';
  end if;

  select count(*) into l_exists
    from user_tables
   where table_name = 'IMART_P2P_NOTCREATED_STATUS_BAK';
  if l_exists = 0 then
    execute immediate q'~
      create table imart_p2p_notcreated_status_bak as
      select *
        from imart_rkpi_status_catalog
       where region_id in (
         477903160125596064,
         416786540566841742,
         439473576294649698,
         462028200917989297,
         238367991065946931
       )
    ~';
  end if;
end;
/

declare
  l_region_count number;
  l_config_count number;
  l_reference_shell number;
begin
  select count(*) into l_region_count
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and page_id = 107
     and id = 477903160125596064
     and plug_source_type = 'NATIVE_IR';

  select count(*) into l_config_count
    from imart_rkpi_config
   where region_id in (
     416786540566841742,
     439473576294649698,
     462028200917989297,
     238367991065946931
   )
     and state = 'READY';

  select count(*) into l_reference_shell
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and page_id = 707
     and static_id = 'coverage-kpi-shell-416786540566841742';

  if l_region_count <> 1 or l_config_count <> 4 or l_reference_shell <> 1 then
    raise_application_error(-20001,
      'P2P not-created preflight failed: indent region=' || l_region_count ||
      ', configured stages=' || l_config_count || ', reference shell=' || l_reference_shell);
  end if;
end;
/

insert into imart_rkpi_bak_20261003
select p.*
  from apex_260100.wwv_flow_page_plugs p
 where p.flow_id = 105
   and p.id = 477903160125596064
   and not exists (
     select 1
       from imart_rkpi_bak_20261003 b
      where b.id = p.id
   );

declare
  l_source clob;
  l_config_count number;
begin
  select count(*)
    into l_config_count
    from imart_rkpi_config
   where region_id = 477903160125596064;

  if l_config_count = 0 then
    select plug_source
      into l_source
      from apex_260100.wwv_flow_page_plugs
     where flow_id = 105
       and id = 477903160125596064;

    insert into imart_rkpi_config (
      region_id, page_id, module_code, region_label, region_static_id,
      source_sql, key_expression, status_expression, recent_predicate,
      mine_predicate, grain_label, scope_note, state, issue
    ) values (
      477903160125596064,
      107,
      'INDENT',
      'Indent Register Report',
      'indent-register-report',
      l_source,
      q'~nvl(to_char(rk_source.tno), chr(0)) || chr(31) || nvl(to_char(rk_source.sno), chr(0))~',
      q'~case
        when getdocumentstatuscode('INDENT', rk_source.tno) = 'ACTIVE'
         and not exists (
           select 1
             from indentdetail rk_id
            where rk_id.tno = rk_source.tno
              and rk_id.sno = rk_source.sno
              and rk_id.enquirytno is not null
         ) then 'ENQUIRY NOT CREATED'
       end~',
      null,
      null,
      'Rows in this report scope',
      'Only active Indent rows without a linked Purchase Enquiry are shown by the process card. The card count uses the visible report row grain.',
      'READY',
      null
    );
  end if;

  update imart_rkpi_config
     set status_expression = q'~case
           when getdocumentstatuscode('INDENT', rk_source.tno) = 'ACTIVE'
            and not exists (
              select 1
                from indentdetail rk_id
               where rk_id.tno = rk_source.tno
                 and rk_id.sno = rk_source.sno
                 and rk_id.enquirytno is not null
            ) then 'ENQUIRY NOT CREATED'
         end~',
         recent_predicate = null,
         mine_predicate = null,
         scope_note = 'Only active Indent rows without a linked Purchase Enquiry are shown by the process card. The card count uses the visible report row grain.',
         state = 'READY',
         issue = null
   where region_id = 477903160125596064
     and page_id = 107;
  if sql%rowcount <> 1 then
    raise_application_error(-20008, 'Indent KPI update mismatch');
  end if;
end;
/

begin
  update imart_rkpi_config
     set status_expression = q'~case
           when getdocumentstatuscode('ENQUIRY', rk_source.tno) = 'ACTIVE'
            and nvl(upper(trim(cast(rk_source.quotationstatus as varchar2(4000)))), 'PENDING') = 'PENDING'
             then 'QUOTATION NOT CREATED'
         end~',
         scope_note = 'Only active Enquiry rows without a linked Purchase Quotation are shown by the process card. Counts use the visible report row grain.'
   where region_id = 416786540566841742
     and page_id = 707
     and state = 'READY';
  if sql%rowcount <> 1 then raise_application_error(-20002, 'Enquiry KPI update mismatch'); end if;

  update imart_rkpi_config
     set status_expression = q'~case
           when getdocumentstatuscode('QUOTATION', rk_source.tno) = 'ACTIVE'
            and not exists (
              select 1
                from comparativestatementdetail rk_csd
               where rk_csd.quotationtno = rk_source.tno
            ) then 'CS NOT CREATED'
         end~',
         scope_note = 'Only active Quotation rows without a linked Comparative Statement are shown by the process card. Counts use the visible report row grain.'
   where region_id = 439473576294649698
     and page_id = 709
     and state = 'READY';
  if sql%rowcount <> 1 then raise_application_error(-20003, 'Quotation KPI update mismatch'); end if;

  update imart_rkpi_config
     set status_expression = q'~case
           when getdocumentstatuscode('COMPARATIVESTATEMENT', rk_source.tno) = 'ACTIVE'
            and not exists (
              select 1
                from purchaseorder rk_po
               where rk_po.comparativestatementtno = rk_source.tno
            ) then 'PO NOT CREATED'
         end~',
         scope_note = 'Only active Comparative Statement rows without a linked Purchase Order are shown by the process card. Counts use the visible report row grain.'
   where region_id = 462028200917989297
     and page_id = 711
     and state = 'READY';
  if sql%rowcount <> 1 then raise_application_error(-20004, 'Comparative Statement KPI update mismatch'); end if;

  update imart_rkpi_config
     set status_expression = q'~case
           when getdocumentstatuscode('RATECONTRACT', rk_source.tno) = 'ACTIVE'
            and not exists (
              select 1
                from purchaseorder rk_po
               where rk_po.ratecontracttno = rk_source.tno
            ) then 'PO NOT CREATED'
         end~',
         scope_note = 'Only active Rate Contract rows without a linked Purchase Order are shown by the process card. Counts use the visible report row grain.'
   where region_id = 238367991065946931
     and page_id = 713
     and state = 'READY';
  if sql%rowcount <> 1 then raise_application_error(-20005, 'Rate Contract KPI update mismatch'); end if;
end;
/

delete from imart_rkpi_status_catalog
 where region_id in (
   477903160125596064,
   416786540566841742,
   439473576294649698,
   462028200917989297,
   238367991065946931
 );

insert all
  into imart_rkpi_status_catalog (region_id, status_code, display_order)
    values (477903160125596064, 'ENQUIRY NOT CREATED', 10)
  into imart_rkpi_status_catalog (region_id, status_code, display_order)
    values (416786540566841742, 'QUOTATION NOT CREATED', 10)
  into imart_rkpi_status_catalog (region_id, status_code, display_order)
    values (439473576294649698, 'CS NOT CREATED', 10)
  into imart_rkpi_status_catalog (region_id, status_code, display_order)
    values (462028200917989297, 'PO NOT CREATED', 10)
  into imart_rkpi_status_catalog (region_id, status_code, display_order)
    values (238367991065946931, 'PO NOT CREATED', 10)
select 1 from dual;

declare
  l_source clob;
  l_reference_region constant number := 416786540566841742;
  l_target_region constant number := 477903160125596064;
  l_items varchar2(32767);
  l_seen varchar2(32767) := '|';
  l_bind varchar2(128);
  l_shell_count number;
  l_target apex_260100.wwv_flow_page_plugs%rowtype;
  l_config_source clob;
begin
  select *
    into l_target
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and id = l_target_region;

  select plug_source
    into l_source
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and page_id = 707
     and static_id = 'coverage-kpi-shell-' || l_reference_region;

  select source_sql
    into l_config_source
    from imart_rkpi_config
   where region_id = l_target_region;

  for i in 1 .. regexp_count(
    l_config_source,
    ':P[0-9]+_[A-Za-z0-9_]+', 1, 'i'
  ) loop
    l_bind := upper(regexp_substr(
      l_config_source,
      ':(P[0-9]+_[A-Za-z0-9_]+)', 1, i, 'i', 1
    ));
    if l_bind is not null and instr(l_seen, '|' || l_bind || '|') = 0 then
      l_items := l_items || case when l_items is not null then ',' end || '#' || l_bind;
      l_seen := l_seen || l_bind || '|';
    end if;
  end loop;

  l_source := replace(l_source,
    'coverage-kpis-' || l_reference_region,
    'coverage-kpis-' || l_target_region);
  l_source := replace(l_source,
    'data-kpi-region="' || l_reference_region || '"',
    'data-kpi-region="' || l_target_region || '"');
  l_source := replace(l_source,
    'data-report-region="enquiry-report"',
    'data-report-region="indent-register-report"');
  l_source := replace(l_source,
    'data-report-label="Enquiry Report"',
    'data-report-label="Indent Register Report"');
  l_source := replace(l_source,
    'aria-label="Enquiry Report KPIs"',
    'aria-label="Indent Register Report KPIs"');
  l_source := regexp_replace(
    l_source,
    'data-page-items="[^"]*"',
    'data-page-items="' || l_items || '"',
    1, 1, 'n'
  );

  select count(*)
    into l_shell_count
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and page_id = 107
     and static_id = 'coverage-kpi-shell-' || l_target_region;

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 0,
    p_default_owner => 'IMART'
  );

  if l_shell_count = 0 then
    wwv_flow_imp_page.create_page_plug(
      p_id => wwv_flow_imp.id(2026100300020107),
      p_flow_id => 105,
      p_page_id => 107,
      p_plug_name => 'Register KPI Overview',
      p_static_id => 'coverage-kpi-shell-' || l_target_region,
      p_plug_template => 3371237801798025892,
      p_region_template_options => '#DEFAULT#:t-Region--noUI',
      p_plug_display_sequence => l_target.plug_display_sequence - 1,
      p_plug_display_point => l_target.plug_display_point,
      p_plug_source_type => 'NATIVE_PLSQL',
      p_plug_source => l_source
    );
  else
    update apex_260100.wwv_flow_page_plugs
       set plug_source = l_source
     where flow_id = 105
       and page_id = 107
       and static_id = 'coverage-kpi-shell-' || l_target_region;
  end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_required_role = l_target.plug_required_role,
         plug_display_condition_type = l_target.plug_display_condition_type,
         plug_display_when_condition = l_target.plug_display_when_condition,
         plug_display_when_cond2 = l_target.plug_display_when_cond2,
         function_body_language = l_target.function_body_language
   where flow_id = 105
     and page_id = 107
     and static_id = 'coverage-kpi-shell-' || l_target_region;

  update apex_260100.wwv_flow_page_plugs
     set plug_source = imart_report_kpis.report_sql(l_target_region),
         query_type = 'SQL',
         query_table = null,
         query_where = null,
         query_order_by = null
   where flow_id = 105
     and id = l_target_region;

  if sql%rowcount <> 1 then
    raise_application_error(-20006, 'Indent report source update mismatch');
  end if;

  wwv_flow_imp.component_end;
end;
/

declare
  l_cursor integer;
  l_sql clob;
begin
  for r in (
    select region_id, page_id
      from imart_rkpi_config
     where region_id in (
       477903160125596064,
       416786540566841742,
       439473576294649698,
       462028200917989297,
       238367991065946931
     )
       and state = 'READY'
     order by page_id
  ) loop
    l_cursor := dbms_sql.open_cursor;
    begin
      l_sql := imart_report_kpis.report_sql(r.region_id);
      dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
      dbms_sql.close_cursor(l_cursor);

      l_cursor := dbms_sql.open_cursor;
      l_sql := imart_report_kpis.count_sql(r.region_id);
      dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
      dbms_sql.close_cursor(l_cursor);
    exception
      when others then
        if l_cursor is not null and dbms_sql.is_open(l_cursor) then
          dbms_sql.close_cursor(l_cursor);
        end if;
        raise_application_error(-20007,
          'P2P not-created parse failed for page ' || r.page_id || ': ' || sqlerrm);
    end;
  end loop;
end;
/

commit;

prompt === P2P NOT CREATED rollout verification ===
select c.page_id,
       s.name page_name,
       c.region_id,
       sc.status_code,
       sc.display_order,
       case when instr(c.status_expression, sc.status_code) > 0 then 'YES' else 'NO' end mapped,
       case when k.id is not null then 'YES' else 'NO' end shell_present
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
  join imart_rkpi_status_catalog sc
    on sc.region_id = c.region_id
  left join apex_260100.wwv_flow_page_plugs k
    on k.flow_id = 105
   and k.page_id = c.page_id
   and k.static_id = 'coverage-kpi-shell-' || c.region_id
 where c.region_id in (
   477903160125596064,
   416786540566841742,
   439473576294649698,
   462028200917989297,
   238367991065946931
 )
 order by c.page_id;

select count(*) package_errors
  from user_errors
 where name = 'IMART_REPORT_KPIS'
   and type in ('PACKAGE', 'PACKAGE BODY');

exit
