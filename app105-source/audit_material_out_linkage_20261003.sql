whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 500
set linesize 320
set long 2000000
set longchunksize 2000000
connect -name IMART

prompt === Material Out current KPI expressions ===
select page_id,region_id,status_expression,process_expression,recent_predicate,mine_predicate,scope_note
  from imart_rkpi_config
 where page_id=167;

prompt === GATEOUTREGISTER_VIEW definition ===
select text from user_views where view_name='GATEOUTREGISTER_VIEW';

prompt === WEIGHMENT and CCINVOICE relevant columns ===
select table_name,column_id,column_name,data_type
  from user_tab_columns
 where table_name in('WEIGHMENT','CCINVOICE')
   and (column_name like '%TNO%' or column_name like '%NO' or column_name like '%DATE' or column_name like '%CODE')
 order by table_name,column_id;

prompt === SLC package exact linkage section ===
select line,text
  from user_source
 where name='IMART_SLC_360' and type='PACKAGE BODY' and line between 125 and 175
 order by line;

prompt === Material Out linkage population ===
select count(*) material_out_docs,
       sum(case when exists(select 1 from weighment w where w.despatchadvicetno=m.referencetno) then 1 else 0 end) has_weight_by_da,
       sum(case when exists(select 1 from weighment w where w.referencetno=m.tno) then 1 else 0 end) has_weight_by_mo,
       sum(case when exists(select 1 from weighment w where w.referencetno=m.referencetno) then 1 else 0 end) has_weight_by_ref,
       sum(case when exists(select 1 from ccinvoice c where c.despatchadvicetno=m.referencetno or c.despatchtno=m.referencetno) then 1 else 0 end) has_invoice_by_da
  from materialout m;

prompt === Current-date and full-year Material Out report-row counts/status/process candidates ===
select scope_name,total_rows,active_rows,non_active_rows,weighment_not_created
  from (
    select 'TODAY' scope_name,
           count(*) total_rows,
           count(case when getdocumentstatuscode('MATERIALOUT',r.tno)='ACTIVE' then 1 end) active_rows,
           count(case when nvl(getdocumentstatuscode('MATERIALOUT',r.tno),'NON ACTIVE')<>'ACTIVE' then 1 end) non_active_rows,
           count(case when getdocumentstatuscode('MATERIALOUT',r.tno)='ACTIVE' and r.weighmenttno is null then 1 end) weighment_not_created
      from gateoutregister_view r
     where trunc(r.materialoutdate)=trunc(sysdate)
    union all
    select 'FY_2026_27',
           count(*),
           count(case when getdocumentstatuscode('MATERIALOUT',r.tno)='ACTIVE' then 1 end),
           count(case when nvl(getdocumentstatuscode('MATERIALOUT',r.tno),'NON ACTIVE')<>'ACTIVE' then 1 end),
           count(case when getdocumentstatuscode('MATERIALOUT',r.tno)='ACTIVE' and r.weighmenttno is null then 1 end)
      from gateoutregister_view r
     where trunc(r.materialoutdate) between date '2026-04-01' and date '2027-03-31'
  );

prompt === Sample Material Out downstream linkage ===
select * from (
  select m.tno,m.materialoutno,m.referencetno,
         (select min(w.tno) from weighment w where w.despatchadvicetno=m.referencetno) weighment_tno,
         (select min(c.tno) from ccinvoice c where c.despatchadvicetno=m.referencetno or c.despatchtno=m.referencetno) ccinvoice_tno
    from materialout m
   order by m.tno desc
) where rownum<=40;

exit
