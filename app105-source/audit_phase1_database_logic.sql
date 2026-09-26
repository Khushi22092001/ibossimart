whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 260
set long 30000
connect -name IMART

prompt === GETITEM SOURCE ===
select line, text
  from user_source
 where name = 'GETITEM'
   and line between 80 and 235
 order by type, line;

prompt === PHASE 1 DETAIL CONSTRAINTS ===
select c.table_name, c.constraint_name, c.constraint_type,
       listagg(cc.column_name, ',') within group (order by cc.position) columns_list
  from user_constraints c
  join user_cons_columns cc on cc.constraint_name = c.constraint_name
 where c.table_name in ('INDENTDETAIL','ENQUIRYITEMDETAIL','QUOTATIONDETAIL','QUOTATIONDETAILFOOTER')
   and c.constraint_type in ('P','U')
 group by c.table_name, c.constraint_name, c.constraint_type
 order by c.table_name, c.constraint_type, c.constraint_name;

exit
