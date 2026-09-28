whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 300 trimspool on feedback on verify off

prompt === PO RECEIPT DETAIL IDENTITY DUPLICATES ===
select d.tno,d.sno,count(*) detail_rows,
       count(distinct nvl(to_char(d.itemcode),'~') || '|' || nvl(to_char(d.itemspecificationcode),'~')) distinct_item_specs,
       min(d.amount) min_amount,max(d.amount) max_amount,
       nvl(f.footer_rows,0) footer_rows,nvl(f.footeramount,0) stored_footer
  from poreceiptdetail d
  left join (
    select tno,sno,count(*) footer_rows,sum(nvl(footervalue,0)) footeramount
      from poreceiptdetailfooter
     group by tno,sno
  ) f on f.tno=d.tno and f.sno=d.sno
 group by d.tno,d.sno,f.footer_rows,f.footeramount
having count(*) > 1
 order by d.tno desc,d.sno;

prompt === DECLARED FOREIGN KEYS REFERENCING PO RECEIPT DETAIL ===
select c.table_name,c.constraint_name,
       listagg(cc.column_name,',') within group(order by cc.position) child_columns
  from all_constraints c
  join all_cons_columns cc on cc.owner=c.owner and cc.constraint_name=c.constraint_name
 where c.owner='IMART' and c.constraint_type='R'
   and c.r_owner='IMART'
   and c.r_constraint_name in (
     select constraint_name from all_constraints
      where owner='IMART' and table_name='PORECEIPTDETAIL'
   )
 group by c.table_name,c.constraint_name
 order by c.table_name,c.constraint_name;

prompt === POPULATED SAME-IDENTITY CHILD DATA ON DUPLICATES ===
select 'PORECEIPTDETAILFOOTER' child_table,count(*) child_rows,count(distinct f.tno || ':' || f.sno) identities
  from poreceiptdetailfooter f
 where exists (select 1 from poreceiptdetail d where d.tno=f.tno and d.sno=f.sno group by d.tno,d.sno having count(*) > 1)
union all
select 'PORECEIPTFN',count(*),count(distinct n.tno || ':' || n.sno)
  from poreceiptfn n
 where exists (select 1 from poreceiptdetail d where d.tno=n.tno and d.sno=n.sno group by d.tno,d.sno having count(*) > 1)
union all
select 'PORECEIPTTAC',count(*),count(distinct t.tno || ':' || t.sno)
  from poreceipttac t
 where exists (select 1 from poreceiptdetail d where d.tno=t.tno and d.sno=t.sno group by d.tno,d.sno having count(*) > 1);

prompt === CURRENT DETAIL TRIGGERS ===
select trigger_name,triggering_event,trigger_type,status
  from all_triggers
 where table_owner='IMART' and table_name='PORECEIPTDETAIL'
 order by trigger_name;

prompt === SOURCE / PACKAGE REFERENCES ===
select owner,name,type,line,text
  from all_source
 where owner='IMART'
   and upper(text) like '%PORECEIPTDETAIL%'
   and (upper(text) like '%INSERT%' or upper(text) like '%UPDATE%' or upper(text) like '%SNO%')
 order by name,type,line fetch first 120 rows only;
exit
