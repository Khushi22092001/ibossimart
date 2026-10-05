whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 500
set linesize 320
connect -name IMART

prompt === Reversible backups for remaining O2C status cards ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_O2CR_CFG_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_o2cr_cfg_bak_20261003 as
      select * from imart_rkpi_config where page_id in(198,347,377,382)~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_O2CR_CAT_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_o2cr_cat_bak_20261003 as
      select s.* from imart_rkpi_status_catalog s
       where s.region_id in(506009576941145204,506313811322508472,57926020090864967,19829060650332680)~';
  end if;
end;
/

prompt === Normalize O2C document statuses to Active / Non Active ===
begin
  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('FREIGHTADVICE',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         scope_note='Cards show Freight Advice report rows split into ACTIVE and NON ACTIVE document status.'
   where page_id=198 and region_id=506009576941145204 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20198,'Freight Advice KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('ADVANCERECEIPT',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         scope_note='Cards show Advance Receipt report rows split into ACTIVE and NON ACTIVE document status.'
   where page_id=347 and region_id=506313811322508472 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20347,'Advance Receipt KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('PAYMENTFOLLOWUPACTION',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         scope_note='Cards show Payment Follow-up Action report rows split into ACTIVE and NON ACTIVE document status.'
   where page_id=377 and region_id=57926020090864967 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20377,'Payment Follow-up Action KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('PINVOICE',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         scope_note='Cards show Proforma Invoice report rows split into ACTIVE and NON ACTIVE document status.'
   where page_id=382 and region_id=19829060650332680 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20382,'Proforma Invoice KPI config mismatch'); end if;
end;
/

delete from imart_rkpi_status_catalog
 where region_id in(506009576941145204,506313811322508472,57926020090864967,19829060650332680);

insert all
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(506009576941145204,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(506009576941145204,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(506313811322508472,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(506313811322508472,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(57926020090864967,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(57926020090864967,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(19829060650332680,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(19829060650332680,'NON ACTIVE',11,'STATUS')
select 1 from dual;

prompt === Refresh only the four audited O2C report wrappers ===
begin
  for r in(
    select page_id,region_id from imart_rkpi_config
     where page_id in(198,347,377,382) and state='READY'
     order by page_id
  ) loop
    update apex_260100.wwv_flow_page_plugs
       set plug_source=imart_report_kpis.report_sql(r.region_id),
           query_type='SQL',query_table=null,query_where=null,query_order_by=null
     where flow_id=105 and page_id=r.page_id and id=r.region_id;
    if sql%rowcount<>1 then raise_application_error(-20400,'O2C report wrapper mismatch page '||r.page_id); end if;
  end loop;
end;
/

prompt === Parse every report/count query before commit ===
declare
  l_cursor integer;
  l_sql clob;
begin
  for r in(
    select page_id,region_id from imart_rkpi_config
     where page_id in(198,347,377,382) and state='READY'
     order by page_id
  ) loop
    l_cursor:=dbms_sql.open_cursor;
    l_sql:=imart_report_kpis.report_sql(r.region_id);
    dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
    dbms_sql.close_cursor(l_cursor);

    l_cursor:=dbms_sql.open_cursor;
    l_sql:=imart_report_kpis.count_sql(r.region_id);
    dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
    dbms_sql.close_cursor(l_cursor);
  end loop;
exception when others then
  if l_cursor is not null and dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
  raise;
end;
/

commit;

prompt === Verification ===
select c.page_id,p.name page_name,
       listagg(s.status_code,', ') within group(order by s.display_order,s.status_code) configured_cards
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps p on p.flow_id=105 and p.id=c.page_id
  left join imart_rkpi_status_catalog s on s.region_id=c.region_id
 where c.page_id in(198,347,377,382)
 group by c.page_id,p.name
 order by c.page_id;

select count(*) affected_region_count
  from apex_260100.wwv_flow_page_plugs r
  join imart_rkpi_config c on c.region_id=r.id and c.page_id=r.page_id
 where r.flow_id=105 and c.page_id in(198,347,377,382)
   and dbms_lob.instr(r.plug_source,'select rk_source.* from (')>0;

exit
