whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 500
set linesize 280
connect -name IMART

prompt === Backups ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_STATUS_CFG_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_status_cfg_bak_20261003 as select * from imart_rkpi_config~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_REG_STATUS_CAT_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_status_cat_bak_20261003 as select * from imart_rkpi_status_catalog~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_REG_TX_CFG_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_tx_cfg_bak_20261003 as select * from imart_tx_kpi_config~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_REG_TX_CARD_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_tx_card_bak_20261003 as select * from imart_tx_kpi_cards~';
  end if;

  select count(*) into l_exists from user_tables where table_name='IMART_REG_PKG_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_pkg_bak_20261003 as
      select * from user_source where name in ('IMART_REPORT_KPIS','IMART_TRANSACTION_KPIS')~';
  end if;
end;
/

prompt === Extend reusable KPI metadata ===
begin
  execute immediate 'alter table imart_rkpi_config add (process_expression varchar2(4000))';
exception when others then if sqlcode<>-1430 then raise; end if;
end;
/
begin
  execute immediate q'~alter table imart_rkpi_status_catalog add (card_mode varchar2(10) default 'STATUS' not null)~';
exception when others then if sqlcode<>-1430 then raise; end if;
end;
/
begin
  execute immediate 'alter table imart_tx_kpi_config add (module_code varchar2(50))';
exception when others then if sqlcode<>-1430 then raise; end if;
end;
/

prompt === Restore native document status and add independent next-process dimension ===
begin
  update imart_rkpi_config
     set status_expression = q'~nvl(getdocumentstatuscode('ENQUIRY',rk_source.tno),'NONACTIVE')~',
         process_expression = q'~case
           when getdocumentstatuscode('ENQUIRY',rk_source.tno)='ACTIVE'
            and nvl(upper(trim(cast(rk_source.quotationstatus as varchar2(4000)))),'PENDING')='PENDING'
           then 'QUOTATION NOT CREATED'
         end~',
         scope_note = 'Document statuses are shown first. QUOTATION NOT CREATED contains only active Enquiry rows without a linked Purchase Quotation.'
   where page_id=707 and region_id=416786540566841742 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20001,'Enquiry config mismatch'); end if;

  update imart_rkpi_config
     set status_expression = q'~nvl(getdocumentstatuscode('QUOTATION',rk_source.tno),'NONACTIVE')~',
         process_expression = q'~case
           when getdocumentstatuscode('QUOTATION',rk_source.tno)='ACTIVE'
            and not exists(select 1 from comparativestatementdetail x where x.quotationtno=rk_source.tno)
           then 'CS NOT CREATED'
         end~',
         scope_note = 'Document statuses are shown first. CS NOT CREATED contains only active Quotation rows without a linked Comparative Statement.'
   where page_id=709 and region_id=439473576294649698 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20002,'Quotation config mismatch'); end if;

  update imart_rkpi_config
     set status_expression = q'~nvl(getdocumentstatuscode('COMPARATIVESTATEMENT',rk_source.tno),'NONACTIVE')~',
         process_expression = q'~case
           when getdocumentstatuscode('COMPARATIVESTATEMENT',rk_source.tno)='ACTIVE'
            and not exists(select 1 from purchaseorder x where x.comparativestatementtno=rk_source.tno)
           then 'PO NOT CREATED'
         end~',
         scope_note = 'Document statuses are shown first. PO NOT CREATED contains only active Comparative Statement rows without a linked Purchase Order.'
   where page_id=711 and region_id=462028200917989297 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20003,'Comparative Statement config mismatch'); end if;

  update imart_rkpi_config
     set status_expression = q'~nvl(getdocumentstatuscode('RATECONTRACT',rk_source.tno),'NONACTIVE')~',
         process_expression = q'~case
           when getdocumentstatuscode('RATECONTRACT',rk_source.tno)='ACTIVE'
            and not exists(select 1 from purchaseorder x where x.ratecontracttno=rk_source.tno)
           then 'PO NOT CREATED'
         end~',
         scope_note = 'Document statuses are shown first. PO NOT CREATED contains only active Rate Contract rows without a linked Purchase Order.'
   where page_id=713 and region_id=238367991065946931 and state='READY';
  if sql%rowcount<>1 then raise_application_error(-20004,'Rate Contract config mismatch'); end if;
end;
/

delete from imart_rkpi_status_catalog
 where region_id in (477903160125596064,416786540566841742,439473576294649698,462028200917989297,238367991065946931);

insert all
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(416786540566841742,'QUOTATION NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(439473576294649698,'CS NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(462028200917989297,'PO NOT CREATED',20,'PROCESS')
  into imart_rkpi_status_catalog(region_id,status_code,display_order,card_mode)
    values(238367991065946931,'PO NOT CREATED',20,'PROCESS')
select 1 from dual;

prompt === Consolidate Indent to its existing transaction KPI panel ===
declare
  l_report_sql clob;
begin
  l_report_sql:=imart_transaction_kpis.report_sql(107);
  update apex_260100.wwv_flow_page_plugs
     set plug_source=l_report_sql,
         query_type='SQL',
         query_table=null,
         query_where=null,
         query_order_by=null
   where flow_id=105 and page_id=107 and id=477903160125596064;
  if sql%rowcount<>1 then raise_application_error(-20005,'Indent report restore mismatch'); end if;

  delete from apex_260100.wwv_flow_page_plugs
   where flow_id=105 and page_id=107 and static_id='coverage-kpi-shell-477903160125596064';
  delete from imart_rkpi_config where page_id=107 and region_id=477903160125596064;
end;
/

prompt === Document status cards for the six detailed procurement KPI registers ===
update imart_tx_kpi_config set module_code=case page_id
  when 68 then 'MATERIALIN'
  when 107 then 'INDENT'
  when 117 then 'PURCHASEORDER'
  when 142 then 'PURCHASEBILL'
  when 145 then 'GRN'
  when 151 then 'PBPASS'
end where page_id in(68,107,117,142,145,151);

declare
  l_base clob;
  l_module varchar2(50);
  l_literal varchar2(100);
begin
  for r in(select page_id,classifier_sql,module_code from imart_tx_kpi_config where page_id in(68,107,117,142,145,151) order by page_id) loop
    l_base:=r.classifier_sql;
    l_module:=r.module_code;
    if instr(l_base,'IMART_STATUS_PROCESS_V1')=0 then
      if r.page_id=68 then
        l_base:=replace(l_base,q'~ where nvl(getdocumentstatuscode('MATERIALIN',a.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED') group by a.tno~',q'~ group by a.tno~');
      elsif r.page_id=145 then
        l_base:=replace(l_base,q'~ where nvl(getdocumentstatuscode('GRN',d.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED') group by d.tno~',q'~ group by d.tno~');
      elsif r.page_id=142 then
        l_base:=replace(l_base,q'~where nvl(getdocumentstatuscode('PURCHASEBILL',p.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED')~','');
      elsif r.page_id=151 then
        l_base:=replace(l_base,q'~where nvl(getdocumentstatuscode('PBPASS',p.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED')~','');
      end if;

      l_literal:=dbms_assert.enquote_literal(l_module);
      l_base:='select /* IMART_STATUS_PROCESS_V1 */ f.tno,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then 1 else 0 end active,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')<>''ACTIVE'' then 1 else 0 end nonactive,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.approval,0) else 0 end approval,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.pending,0) else 0 end pending,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.partial,0) else 0 end partial,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.done,0) else 0 end done,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.overdue,0) else 0 end overdue,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.missing_due,0) else 0 end missing_due,'||
        'case when nvl(getdocumentstatuscode('||l_literal||',f.tno),''NONACTIVE'')=''ACTIVE'' then nvl(f.review,0) else 0 end review '||
        'from ('||l_base||') f';

      update imart_tx_kpi_config set classifier_sql=l_base where page_id=r.page_id;
    end if;
  end loop;
end;
/

delete from imart_tx_kpi_cards where page_id in(68,107,117,142,145,151);
insert into imart_tx_kpi_cards(page_id,seq,code,label,note)
select page_id,seq,code,label,note
  from imart_reg_tx_card_bak_20261003
 where page_id in(68,107,117,142,145,151);
delete from imart_tx_kpi_cards where page_id in(68,107,117,142,145,151) and code in('ACTIVE','NONACTIVE','APPROVAL');
update imart_tx_kpi_cards set seq=seq+2 where page_id in(68,107,117,142,145,151) and seq>0;
insert all
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(68,1,'ACTIVE','Active','Active Material In documents')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(68,2,'NONACTIVE','Non Active','Material In documents not currently active')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(107,1,'ACTIVE','Active','Active Indent documents')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(107,2,'NONACTIVE','Non Active','Indent documents not currently active')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(117,1,'ACTIVE','Active','Active Purchase Order documents')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(117,2,'NONACTIVE','Non Active','Purchase Orders not currently active')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(142,1,'ACTIVE','Active','Active Purchase Bill documents')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(142,2,'NONACTIVE','Non Active','Purchase Bills not currently active')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(145,1,'ACTIVE','Active','Active GRN documents')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(145,2,'NONACTIVE','Non Active','GRNs not currently active')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(151,1,'ACTIVE','Active','Active Purchase Bill Pass documents')
  into imart_tx_kpi_cards(page_id,seq,code,label,note) values(151,2,'NONACTIVE','Non Active','Bill Pass documents not currently active')
select 1 from dual;

update imart_tx_kpi_cards set label='PO NOT CREATED',note='Active Indents with sanctioned quantity still not ordered' where page_id=107 and code='PENDING';
update imart_tx_kpi_cards set label='RECEIPT NOT STARTED',note='Active Purchase Orders with no receipt or gate-in progress' where page_id=117 and code='PENDING';
update imart_tx_kpi_cards set label='GRN NOT CREATED',note='Active Material In records without a linked GRN' where page_id=68 and code='PENDING';
update imart_tx_kpi_cards set label='INSPECTION NOT CREATED',note='Active GRNs without a linked inspection number' where page_id=145 and code='REVIEW';
update imart_tx_kpi_cards set label='BILL NOT CREATED',note='Active GRN lines not linked to a Purchase Bill' where page_id=145 and code='PENDING';
update imart_tx_kpi_cards set label='BILL PASS NOT CREATED',note='Active Purchase Bills without a valid Bill Pass' where page_id=142 and code='PENDING';

prompt === Compile enhanced generic KPI package ===
@app105-source/report_kpis_package_20261003.sql

prompt === Refresh live report wrappers ===
begin
  for r in(select region_id,page_id from imart_rkpi_config where page_id in(707,709,711,713) and state='READY') loop
    update apex_260100.wwv_flow_page_plugs
       set plug_source=imart_report_kpis.report_sql(r.region_id),query_type='SQL',query_table=null,query_where=null,query_order_by=null
     where flow_id=105 and id=r.region_id and page_id=r.page_id;
    if sql%rowcount<>1 then raise_application_error(-20006,'Generic report update mismatch page '||r.page_id); end if;
  end loop;

  for r in(select page_id,region_id from imart_tx_kpi_config where page_id in(68,107,117,142,145,151)) loop
    update apex_260100.wwv_flow_page_plugs
       set plug_source=imart_transaction_kpis.report_sql(r.page_id),query_type='SQL',query_table=null,query_where=null,query_order_by=null
     where flow_id=105 and id=r.region_id and page_id=r.page_id;
    if sql%rowcount<>1 then raise_application_error(-20007,'Transaction report update mismatch page '||r.page_id); end if;
  end loop;
end;
/

prompt === Per-page register compactness and Add New placement (no universal asset edits) ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_UX_STEP_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_ux_step_bak_20261003 as
      select s.id,s.flow_id,s.name,s.inline_css,s.javascript_code
        from apex_260100.wwv_flow_steps s
       where s.flow_id=105
         and s.id in(
           select distinct page_id from imart_rkpi_config where state='READY'
           union select page_id from imart_tx_kpi_config
         )~';
  end if;
end;
/

declare
  l_css clob:=q'~/* IMART_REGISTER_COMPACT_V1: page-scoped, not a universal asset */
body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card{
  margin:0 8px 4px!important;padding:9px 14px!important;gap:10px!important;
  min-height:0!important;border-radius:0 0 12px 12px!important
}
body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-hero-icon{
  width:40px!important;height:40px!important;border-radius:10px!important
}
body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-hero-icon svg{width:21px!important;height:21px!important}
body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-page-title{font-size:1.2rem!important;line-height:1.15!important}
body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card .hspl-page-desc{font-size:11.5px!important;margin-top:1px!important}
body:not(.t-PageBody--login) .t-Body-contentInner{padding-top:4px!important}
body:not(.t-PageBody--login) [id^="coverage-kpi-shell-"],
body:not(.t-PageBody--login) [id^="tx-kpi-shell-"]{margin-top:0!important;margin-bottom:4px!important}
body:not(.t-PageBody--login) .coverage-register-kpis,
body:not(.t-PageBody--login) .tx-register-kpis{margin:0 0 6px!important;padding:9px 10px!important;border-radius:12px!important}
body:not(.t-PageBody--login) .coverage-register-kpis .mr-kpi-grid,
body:not(.t-PageBody--login) .tx-register-kpis .mr-kpi-grid{
  grid-template-columns:repeat(auto-fit,minmax(min(100%,165px),1fr))!important;gap:7px!important;min-height:0!important
}
body:not(.t-PageBody--login) .coverage-register-kpis .mr-kpi-method,
body:not(.t-PageBody--login) .tx-register-kpis .mr-kpi-method{margin-top:4px!important}
body:not(.t-PageBody--login) .t-Body-contentInner .row:has(.coverage-register-kpis,.tx-register-kpis){margin-top:0!important;margin-bottom:0!important}
body:not(.t-PageBody--login) .hspl-hero-add-new{
  order:3!important;flex:none!important;margin-left:0!important;min-height:38px!important;
  border-radius:10px!important;background:#5d55d9!important;border-color:#5d55d9!important;color:#fff!important
}
body:not(.t-PageBody--login) .hspl-hero-card .hspl-filter-trigger{order:2!important;margin-left:auto!important}
@media(max-width:700px){
 body:not(.t-PageBody--login) .t-Body-title.hspl-hero-card{margin-inline:4px!important;padding:8px 10px!important;flex-wrap:wrap!important}
 body:not(.t-PageBody--login) .coverage-register-kpis .mr-kpi-grid,
 body:not(.t-PageBody--login) .tx-register-kpis .mr-kpi-grid{grid-template-columns:repeat(2,minmax(0,1fr))!important}
}
~';
  l_js clob:=q'~/* IMART_REGISTER_ACTIONS_V1: page-scoped, not a universal asset */
(function(){
  'use strict';
  function placeAddNew(){
    var hero=document.querySelector('.t-Body-title.hspl-hero-card');
    if(!hero)return;
    var filter=hero.querySelector('.hspl-filter-trigger');
    if(!filter)return;
    var add=hero.querySelector('.hspl-hero-add-new');
    if(!add){
      add=Array.prototype.find.call(document.querySelectorAll('.t-Body-main .t-Button,.t-Body-content .t-Button'),function(el){
        return !hero.contains(el)&&String(el.textContent||el.getAttribute('aria-label')||'').trim().toLowerCase()==='add new';
      });
    }
    if(add){add.classList.add('hspl-hero-add-new');filter.insertAdjacentElement('afterend',add);}
  }
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',placeAddNew,{once:true});else placeAddNew();
  [100,400,1000,2000].forEach(function(ms){setTimeout(placeAddNew,ms);});
  document.addEventListener('apexreadyend',placeAddNew);
  if(window.apex&&apex.jQuery)apex.jQuery(document).on('apexafterrefresh.imartRegisterActions',placeAddNew);
})();
~';
begin
  for r in(
    select s.id page_id,s.inline_css,s.javascript_code,
           case when exists(
             select 1 from apex_260100.wwv_flow_step_buttons b
              where b.flow_id=105 and b.flow_step_id=s.id
                and upper(trim(b.button_image_alt))='ADD NEW'
           ) then 1 else 0 end has_add_new
      from apex_260100.wwv_flow_steps s
     where s.flow_id=105
       and s.id in(
         select distinct x.page_id
           from(
             select page_id from imart_rkpi_config where state='READY'
             union select page_id from imart_tx_kpi_config
           ) x
          where exists(
            select 1 from apex_260100.wwv_flow_page_plugs f
             where f.flow_id=105 and f.page_id=x.page_id
               and (lower(nvl(f.static_id,' '))='filter' or regexp_like(nvl(f.plug_name,' '),'filter|register','i'))
          )
       )
  ) loop
    if dbms_lob.instr(nvl(r.inline_css,to_clob(' ')),'IMART_REGISTER_COMPACT_V1')=0 then
      update apex_260100.wwv_flow_steps
         set inline_css=case when inline_css is null then l_css else inline_css||chr(10)||l_css end
       where flow_id=105 and id=r.page_id;
    end if;
    if r.has_add_new=1 and dbms_lob.instr(nvl(r.javascript_code,to_clob(' ')),'IMART_REGISTER_ACTIONS_V1')=0 then
      update apex_260100.wwv_flow_steps
         set javascript_code=case when javascript_code is null then l_js else javascript_code||chr(10)||l_js end
       where flow_id=105 and id=r.page_id;
    end if;
  end loop;
end;
/

prompt === Parse validation ===
declare
  l_cursor integer;
  l_sql clob;
begin
  for r in(select region_id,page_id from imart_rkpi_config where page_id in(707,709,711,713) and state='READY' order by page_id) loop
    l_cursor:=dbms_sql.open_cursor;
    l_sql:=imart_report_kpis.report_sql(r.region_id);
    dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
    dbms_sql.close_cursor(l_cursor);
    l_cursor:=dbms_sql.open_cursor;
    l_sql:=imart_report_kpis.count_sql(r.region_id);
    dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
    dbms_sql.close_cursor(l_cursor);
  end loop;
  for r in(select page_id from imart_tx_kpi_config where page_id in(68,107,117,142,145,151) order by page_id) loop
    l_cursor:=dbms_sql.open_cursor;
    l_sql:=imart_transaction_kpis.report_sql(r.page_id);
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
select c.page_id,s.name page_name,
       case when c.status_expression is not null then 'YES' else 'NO' end document_status,
       case when c.process_expression is not null then 'YES' else 'NO' end next_process,
       sc.status_code,sc.card_mode
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s on s.flow_id=105 and s.id=c.page_id
  left join imart_rkpi_status_catalog sc on sc.region_id=c.region_id
 where c.page_id in(707,709,711,713)
 order by c.page_id,sc.display_order;

select c.page_id,s.name page_name,
       listagg(k.label,', ') within group(order by k.seq) cards
  from imart_tx_kpi_config c
  join apex_260100.wwv_flow_steps s on s.flow_id=105 and s.id=c.page_id
  join imart_tx_kpi_cards k on k.page_id=c.page_id
 where c.page_id in(68,107,117,142,145,151)
 group by c.page_id,s.name
 order by c.page_id;

select count(*) indent_kpi_shells
  from apex_260100.wwv_flow_page_plugs
 where flow_id=105 and page_id=107
   and (static_id='tx-kpi-shell-107' or static_id='coverage-kpi-shell-477903160125596064');

select count(*) compact_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(inline_css,'IMART_REGISTER_COMPACT_V1')>0;

select count(*) add_new_moved_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(javascript_code,'IMART_REGISTER_ACTIONS_V1')>0;

select count(*) package_errors from user_errors
 where name in('IMART_REPORT_KPIS','IMART_TRANSACTION_KPIS') and type in('PACKAGE','PACKAGE BODY');

exit
