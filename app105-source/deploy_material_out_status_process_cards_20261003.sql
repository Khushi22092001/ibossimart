whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 500
set linesize 320
connect -name IMART

prompt === Reversible Material Out KPI backup ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_MOUT_CFG_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_mout_cfg_bak_20261003 as
      select * from imart_rkpi_config where page_id=167 and region_id=512288033104679057~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_MOUT_CAT_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_mout_cat_bak_20261003 as
      select * from imart_rkpi_status_catalog where region_id=512288033104679057~';
  end if;
end;
/

prompt === Material Out status and next-process cards ===
begin
  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('MATERIALOUT',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('MATERIALOUT',rk_source.tno)='ACTIVE'
            and not exists(
              select 1
                from materialout m
                join ccinvoice c
                  on c.despatchadvicetno=m.referencetno
                  or c.despatchtno=m.referencetno
               where m.tno=rk_source.tno
            )
           then 'INVOICE NOT CREATED'
         end~',
         scope_note='Status cards use Material Out document status. INVOICE NOT CREATED contains active report rows whose linked Dispatch Advice has no CC Invoice.'
   where page_id=167
     and region_id=512288033104679057
     and state='READY';
  if sql%rowcount<>1 then
    raise_application_error(-20167,'Material Out KPI config mismatch');
  end if;
end;
/

delete from imart_rkpi_status_catalog where region_id=512288033104679057;

insert all
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(512288033104679057,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(512288033104679057,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(512288033104679057,'INVOICE NOT CREATED',20,'PROCESS')
select 1 from dual;

prompt === Refresh only Material Out report wrapper ===
begin
  update apex_260100.wwv_flow_page_plugs
     set plug_source=imart_report_kpis.report_sql(512288033104679057),
         query_type='SQL',query_table=null,query_where=null,query_order_by=null
   where flow_id=105 and page_id=167 and id=512288033104679057;
  if sql%rowcount<>1 then
    raise_application_error(-20168,'Material Out report wrapper mismatch');
  end if;
end;
/

prompt === Parse report and count queries before commit ===
declare
  l_cursor integer;
  l_sql clob;
begin
  l_cursor:=dbms_sql.open_cursor;
  l_sql:=imart_report_kpis.report_sql(512288033104679057);
  dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);

  l_cursor:=dbms_sql.open_cursor;
  l_sql:=imart_report_kpis.count_sql(512288033104679057);
  dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);
exception when others then
  if l_cursor is not null and dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
  raise;
end;
/

commit;

prompt === Deployment verification ===
select c.page_id,p.name page_name,
       case when c.status_expression is not null then 'YES' else 'NO' end status_cards,
       case when c.process_expression is not null then 'YES' else 'NO' end process_card,
       listagg(s.status_code,', ') within group(order by s.display_order,s.status_code) configured_cards
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps p on p.flow_id=105 and p.id=c.page_id
  left join imart_rkpi_status_catalog s on s.region_id=c.region_id
 where c.page_id=167 and c.region_id=512288033104679057
 group by c.page_id,p.name,c.status_expression,c.process_expression;

select count(*) affected_region_count
  from apex_260100.wwv_flow_page_plugs r
 where r.flow_id=105 and r.page_id=167 and r.id=512288033104679057
   and dbms_lob.instr(r.plug_source,'select rk_source.* from (')>0;

exit
