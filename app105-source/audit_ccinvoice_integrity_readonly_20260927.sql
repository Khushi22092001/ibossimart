whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 300 trimspool on feedback on verify off

prompt === CC INVOICE DETAIL CONSTRAINTS / TRIGGERS ===
select ac.table_name,ac.constraint_name,ac.constraint_type,ac.status,
       listagg(acc.column_name,',') within group(order by acc.position) columns
  from all_constraints ac left join all_cons_columns acc on acc.owner=ac.owner and acc.constraint_name=ac.constraint_name
 where ac.owner='IMART' and ac.table_name in ('CCINVOICEDETAIL','CCINVOICEDETAILFOOTER')
 group by ac.table_name,ac.constraint_name,ac.constraint_type,ac.status
 order by ac.table_name,ac.constraint_type,ac.constraint_name;

select table_name,trigger_name,triggering_event,trigger_type,status
  from all_triggers
 where table_owner='IMART' and table_name in ('CCINVOICEDETAIL','CCINVOICEDETAILFOOTER')
 order by table_name,trigger_name;

prompt === CC INVOICE LIVE FOOTER / TOTAL CONSISTENCY ===
select count(*) rows_checked,
       sum(case when abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01 then 1 else 0 end) material_footer_mismatches,
       sum(case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end) material_total_mismatches,
       sum(case when dup.row_count > 1 then 1 else 0 end) rows_with_duplicate_identity
  from ccinvoicedetail d
  left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from ccinvoicedetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
  left join (select tno,sno,count(*) row_count from ccinvoicedetail group by tno,sno) dup on dup.tno=d.tno and dup.sno=d.sno;

prompt === NEWEST CC INVOICE MATERIAL MISMATCHES ===
select * from (
  select d.tno,d.sno,d.itemcode,d.itemspecificationcode,d.amount,d.footeramount,nvl(f.footeramount,0) actual_footer,d.totalamount
    from ccinvoicedetail d
    left join (select tno,sno,sum(nvl(footervalue,0)) footeramount from ccinvoicedetailfooter group by tno,sno) f on f.tno=d.tno and f.sno=d.sno
   where abs(nvl(d.footeramount,0)-nvl(f.footeramount,0)) > .01
      or abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) > .01
   order by d.tno desc
) fetch first 30 rows only;
exit
