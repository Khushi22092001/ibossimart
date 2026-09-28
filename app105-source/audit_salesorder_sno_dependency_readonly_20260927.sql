whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 360 long 4000 longchunksize 4000 trimspool on feedback on verify off

prompt === SALES-ORDER DETAIL FAMILY TABLES ===
select t.owner,t.table_name,
       max(case when c.column_name='TNO' then 'Y' else 'N' end) has_tno,
       max(case when c.column_name='SNO' then 'Y' else 'N' end) has_sno,
       listagg(c.column_name,',') within group(order by c.column_id) columns
  from all_tables t
  join all_tab_columns c on c.owner=t.owner and c.table_name=t.table_name
 where t.owner='IMART'
   and (t.table_name like 'SALESORDER%' or t.table_name like '%SALESORDER%')
 group by t.owner,t.table_name
 order by t.table_name;

prompt === DECLARED FOREIGN-KEY DEPENDENCIES ===
select child.table_name child_table,child.constraint_name,child.status,
       parent.table_name parent_table,parent.constraint_name parent_constraint,
       listagg(cols.column_name,',') within group(order by cols.position) child_columns
  from all_constraints child
  join all_constraints parent on parent.owner=child.r_owner and parent.constraint_name=child.r_constraint_name
  join all_cons_columns cols on cols.owner=child.owner and cols.constraint_name=child.constraint_name
 where child.owner='IMART'
   and child.constraint_type='R'
   and (parent.table_name='SALESORDERDETAIL' or child.table_name like 'SALESORDER%')
 group by child.table_name,child.constraint_name,child.status,parent.table_name,parent.constraint_name
 order by child.table_name,child.constraint_name;

prompt === STORED PROGRAMS REFERENCING SALESORDERDETAIL ===
select owner,name,type,min(line) first_reference_line,count(*) reference_lines
  from all_source
 where owner='IMART'
   and type in ('PROCEDURE','FUNCTION','PACKAGE','PACKAGE BODY','TRIGGER')
   and upper(text) like '%SALESORDERDETAIL%'
 group by owner,name,type
 order by type,name;

prompt === PAGE PROCESSES / DYNAMIC ACTIONS REFERENCING SALESORDERDETAIL ===
select page_id, component_kind, component_name
  from (
    select p.flow_step_id page_id,'PROCESS' component_kind,p.process_name component_name
      from apex_260100.wwv_flow_step_processing p
     where p.flow_id=105
       and (dbms_lob.instr(p.process_sql_clob,'salesorderdetail',1,1)>0
         or dbms_lob.instr(p.process_sql_clob,'SalesOrderDetail',1,1)>0
         or dbms_lob.instr(p.process_sql_clob,'SALESORDERDETAIL',1,1)>0)
    union all
    select e.page_id,'DYNAMIC ACTION' component_kind,e.name
      from apex_260100.wwv_flow_page_da_events e
      join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
     where e.flow_id=105
       and (dbms_lob.instr(a.attributes,'salesorderdetail',1,1)>0
         or dbms_lob.instr(a.attributes,'SalesOrderDetail',1,1)>0
         or dbms_lob.instr(a.attributes,'SALESORDERDETAIL',1,1)>0)
  )
 order by page_id,component_kind,component_name;

prompt === CHILD DATA COUNTS FOR DUPLICATE SALES-ORDER IDENTITIES ===
with duplicate_keys as (
  select tno,sno from salesorderdetail group by tno,sno having count(*)>1
)
select 'SALESORDERDETAILFOOTER' child_table,count(*) child_rows,count(distinct f.tno||':'||f.sno) affected_identities
  from salesorderdetailfooter f join duplicate_keys k on k.tno=f.tno and k.sno=f.sno
union all
select 'SALESORDERDETAILQUALITY',count(*),count(distinct q.tno||':'||q.sno)
  from salesorderdetailquality q join duplicate_keys k on k.tno=q.tno and k.sno=q.sno
union all
select 'SALESORDERFN',count(*),count(distinct n.tno||':'||n.sno)
  from salesorderfn n join duplicate_keys k on k.tno=n.tno and k.sno=n.sno
union all
select 'SALESORDERTAC',count(*),count(distinct t.tno||':'||t.sno)
  from salesordertac t join duplicate_keys k on k.tno=t.tno and k.sno=t.sno;

exit
