whenever sqlerror exit failure rollback
set define off
set long 100000
set longchunksize 100000
set pagesize 500
set linesize 240
connect -name IMART

select view_name, text
  from user_views
 where view_name = 'ERP_GLOBAL_SEARCH_VW';

select referenced_name, referenced_type
  from user_dependencies
 where name = 'ERP_GLOBAL_SEARCH_VW'
   and type = 'VIEW'
 order by referenced_type, referenced_name;

select i.table_name,
       i.index_name,
       i.uniqueness,
       listagg(c.column_name, ',') within group (order by c.column_position) index_columns
  from user_indexes i
  join user_ind_columns c
    on c.index_name = i.index_name
   and c.table_name = i.table_name
 where i.table_name in ('MODULE', 'MODULEPRIVILEGE')
 group by i.table_name, i.index_name, i.uniqueness
 order by i.table_name, i.index_name;

exit
