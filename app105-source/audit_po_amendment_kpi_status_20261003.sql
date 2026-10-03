whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 260
set long 1000000
set longchunksize 1000000
set trimspool on
connect -name IMART

prompt === POAMENDMENT columns ===
select column_id, column_name, data_type
  from user_tab_columns
 where table_name = 'POAMENDMENT'
 order by column_id;

prompt === Page module mapping ===
select 147 page_id,
       getmodulecodeforpageno(147) module_code,
       148 detail_page_id,
       getmodulecodeforpageno(148) detail_module_code
  from dual;

prompt === Live KPI configuration ===
select page_id,
       region_id,
       key_expression,
       status_expression,
       recent_predicate,
       mine_predicate,
       grain_label
  from imart_rkpi_config
 where page_id = 147;

prompt === Recent PO amendments with status candidates ===
select *
  from (
    select po.tno,
           po.poamendmentno,
           po.poamendmentdate,
           po.purchaseordertno,
           getdocumentstatuscode(getmodulecodeforpageno(147), po.tno) status_page_147,
           getdocumentstatuscode(getmodulecodeforpageno(148), po.tno) status_page_148
      from poamendment po
     order by po.poamendmentdate desc nulls last, po.tno desc
  )
 where rownum <= 25;

prompt === GETDOCUMENTSTATUSCODE source ===
select line, text
  from user_source
 where name = 'GETDOCUMENTSTATUSCODE'
 order by line;

prompt === POAMENDMENT related constraints ===
select c.constraint_name,
       c.constraint_type,
       cc.column_name,
       c.r_constraint_name
  from user_constraints c
  join user_cons_columns cc
    on cc.constraint_name = c.constraint_name
   and cc.owner = c.owner
 where c.table_name = 'POAMENDMENT'
 order by c.constraint_name, cc.position;

exit
