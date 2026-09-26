whenever sqlerror exit failure rollback
set pagesize 200 linesize 240 trimspool on feedback off verify off heading on
connect -name IMART

prompt === CASH / PURCHASE CANDIDATE OBJECTS ===
select object_type, object_name
  from user_objects
 where (upper(object_name) like '%CASH%PUR%'
     or upper(object_name) like '%PUR%CASH%')
 order by object_type, object_name;

prompt === CANDIDATE BILL REFERENCE COLUMNS ===
select table_name, column_name, data_type
  from user_tab_columns
 where (upper(table_name) like '%CASH%PUR%'
     or upper(table_name) like '%PUR%CASH%')
   and (upper(column_name) like '%BILL%'
     or upper(column_name) like '%INVOICE%'
     or upper(column_name) in ('TNO','DOCUMENTNO','VOUCHERNO'))
 order by table_name, column_id;

exit
