whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 500
set linesize 300
connect -name IMART

prompt === Reversible O2C KPI backups ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_O2C_CFG_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_o2c_cfg_bak_20261003 as
      select * from imart_rkpi_config
       where page_id in(154,160,170,174,190,273,701,704)~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_O2C_CAT_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_o2c_cat_bak_20261003 as
      select s.* from imart_rkpi_status_catalog s
       where s.region_id in(
         603956119249045018,604865642406184046,578271541182137349,
         573917201776151631,600498172302484751,209951780917329537,
         231408634368176212,232021330335737131
       )~';
  end if;
end;
/

prompt === Total + Active + Non Active + verified next-process cards ===
begin
  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('SALESENQUIRY',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('SALESENQUIRY',rk_source.tno)='ACTIVE'
            and not exists(select 1 from salesquotation q where q.salesenquirytno=rk_source.tno)
           then 'QUOTATION NOT CREATED'
         end~',
         scope_note='Status cards use Sales Enquiry document status. QUOTATION NOT CREATED contains active report rows with no linked Sales Quotation.'
   where page_id=701 and region_id=231408634368176212 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20101,'Sales Enquiry KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('SALESQUOTATION',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('SALESQUOTATION',rk_source.tno)='ACTIVE'
            and not exists(select 1 from poreceipt p where p.salesquotationtno=rk_source.tno)
           then 'PO RECEIPT NOT CREATED'
         end~',
         scope_note='Status cards use Sales Quotation document status. PO RECEIPT NOT CREATED contains active report rows with no linked customer PO Receipt.'
   where page_id=704 and region_id=232021330335737131 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20102,'Sales Quotation KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('PORECEIPT',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('PORECEIPT',rk_source.tno)='ACTIVE'
            and not exists(select 1 from salesorder s where s.poreceipttno=rk_source.tno)
           then 'SALES ORDER NOT CREATED'
         end~',
         scope_note='Status cards use PO Receipt document status. SALES ORDER NOT CREATED contains active report rows with no linked Sales Order.'
   where page_id=273 and region_id=209951780917329537 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20103,'PO Receipt KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('SALESORDER',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('SALESORDER',rk_source.tno)='ACTIVE'
            and not exists(select 1 from loadingadvice l where l.salesordertno=rk_source.tno)
            and not exists(select 1 from despatchadvice d where d.salesordertno=rk_source.tno or d.referencetno=rk_source.tno)
            and not exists(select 1 from ccinvoice c where c.salesordertno=rk_source.tno)
           then 'FULFILMENT NOT STARTED'
         end~',
         scope_note='Status cards use Sales Order document status. FULFILMENT NOT STARTED contains active report rows without Loading Advice, Dispatch Advice or CC Invoice.'
   where page_id=170 and region_id=578271541182137349 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20104,'Sales Order KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('LOADINGADVICE',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('LOADINGADVICE',rk_source.tno)='ACTIVE'
            and exists(select 1 from loadingadvice l where l.tno=rk_source.tno and l.salesordertno is not null)
            and not exists(select 1 from ccinvoice c where c.loadingadvicetno=rk_source.tno)
           then 'INVOICE NOT CREATED'
         end~',
         scope_note='Status cards cover the current Loading Advice report. INVOICE NOT CREATED is limited to active sales-linked Loading Advice rows without a linked CC Invoice.'
   where page_id=154 and region_id=603956119249045018 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20105,'Loading Advice KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('DESPATCHADVICE',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('DESPATCHADVICE',rk_source.tno)='ACTIVE'
            and not exists(select 1 from ccinvoice c where c.despatchadvicetno=rk_source.tno or c.despatchtno=rk_source.tno)
           then 'INVOICE NOT CREATED'
         end~',
         scope_note='Status cards use Dispatch Advice document status. INVOICE NOT CREATED contains active report rows with no linked CC Invoice.'
   where page_id=160 and region_id=604865642406184046 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20106,'Dispatch Advice KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('CCINVOICE',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=q'~case
           when getdocumentstatuscode('CCINVOICE',rk_source.tno)='ACTIVE'
            and not exists(
              select 1
                from invoice i
                join dfreightbillreceiptdetail r on r.moduletno=i.tno
               where i.moduletno=rk_source.tno
                 and i.modulecode='CCINVOICE'
            )
           then 'RECEIPT NOT CREATED'
         end~',
         scope_note='Status cards use CC Invoice document status. RECEIPT NOT CREATED contains active report rows with no linked Bill Receipt through the CC Invoice accounting Invoice.'
   where page_id=174 and region_id=573917201776151631 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20107,'CC Invoice KPI config mismatch'); end if;

  update imart_rkpi_config
     set status_expression=q'~case when getdocumentstatuscode('BILLRECEIPT',rk_source.tno)='ACTIVE' then 'ACTIVE' else 'NON ACTIVE' end~',
         process_expression=null,
         scope_note='Bill Receipt is the final register in this O2C flow; cards show its report total and document-status split only.'
   where page_id=190 and region_id=600498172302484751 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20108,'Bill Receipt KPI config mismatch'); end if;
end;
/

delete from imart_rkpi_status_catalog
 where region_id in(
   603956119249045018,604865642406184046,578271541182137349,
   573917201776151631,600498172302484751,209951780917329537,
   231408634368176212,232021330335737131
 );

insert all
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(231408634368176212,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(231408634368176212,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(231408634368176212,'QUOTATION NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(232021330335737131,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(232021330335737131,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(232021330335737131,'PO RECEIPT NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(209951780917329537,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(209951780917329537,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(209951780917329537,'SALES ORDER NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(578271541182137349,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(578271541182137349,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(578271541182137349,'FULFILMENT NOT STARTED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(603956119249045018,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(603956119249045018,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(603956119249045018,'INVOICE NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(604865642406184046,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(604865642406184046,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(604865642406184046,'INVOICE NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(573917201776151631,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(573917201776151631,'NON ACTIVE',11,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(573917201776151631,'RECEIPT NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(600498172302484751,'ACTIVE',10,'STATUS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode) values(600498172302484751,'NON ACTIVE',11,'STATUS')
select 1 from dual;

prompt === Refresh only the eight O2C report wrappers ===
begin
  for r in(
    select page_id,region_id
      from imart_rkpi_config
     where page_id in(154,160,170,174,190,273,701,704)
       and state='READY'
     order by page_id
  ) loop
    update apex_260100.wwv_flow_page_plugs
       set plug_source=imart_report_kpis.report_sql(r.region_id),
           query_type='SQL',query_table=null,query_where=null,query_order_by=null
     where flow_id=105 and page_id=r.page_id and id=r.region_id;
    if sql%rowcount<>1 then
      raise_application_error(-20120,'O2C report wrapper mismatch for page '||r.page_id);
    end if;
  end loop;
end;
/

prompt === Parse every affected report and KPI count query before commit ===
declare
  l_cursor integer;
  l_sql clob;
begin
  for r in(
    select page_id,region_id
      from imart_rkpi_config
     where page_id in(154,160,170,174,190,273,701,704)
       and state='READY'
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

prompt === Deployment verification ===
select c.page_id,p.name page_name,
       case when c.status_expression is not null then 'YES' else 'NO' end status_cards,
       case when c.process_expression is not null then 'YES' else 'FINAL' end next_process,
       listagg(s.status_code,', ') within group(order by s.display_order,s.status_code) configured_cards
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps p on p.flow_id=105 and p.id=c.page_id
  left join imart_rkpi_status_catalog s on s.region_id=c.region_id
 where c.page_id in(154,160,170,174,190,273,701,704)
 group by c.page_id,p.name,c.status_expression,c.process_expression
 order by c.page_id;

select count(*) affected_region_count
  from apex_260100.wwv_flow_page_plugs r
  join imart_rkpi_config c on c.region_id=r.id and c.page_id=r.page_id
 where r.flow_id=105
   and c.page_id in(154,160,170,174,190,273,701,704)
   and dbms_lob.instr(r.plug_source,'select rk_source.* from (')>0;

exit
