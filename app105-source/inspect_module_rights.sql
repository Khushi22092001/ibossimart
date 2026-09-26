set pagesize 200
set linesize 240
connect -name IMART

select column_name
  from user_tab_columns
 where table_name = 'MODULE'
 order by column_id;

select table_name
  from user_tables
 where upper(table_name) like '%RIGHT%'
    or upper(table_name) like '%USER%MODULE%'
    or upper(table_name) like '%ROLE%'
    or upper(table_name) like '%PERMISSION%'
order by table_name;

select table_name, column_name
  from user_tab_columns
 where table_name = 'BOSSUSERROLE'
 order by column_id;

select object_name, object_type
  from user_objects
 where object_type in ('FUNCTION', 'PROCEDURE', 'PACKAGE')
   and (upper(object_name) like '%RIGHT%'
     or upper(object_name) like '%ACCESS%'
     or upper(object_name) like '%ROLE%'
     or upper(object_name) like '%USER%')
order by object_type, object_name;

select object_name, position, argument_name, data_type, in_out
  from user_arguments
 where object_name in ('CHECK_MODULE_VIEW_ACCESS', 'CHECK_USER_PRIVILEGE')
 order by object_name, overload, sequence;

select name, type, line, text
  from user_source
 where name in ('CHECK_MODULE_VIEW_ACCESS', 'CHECK_USER_PRIVILEGE')
order by name, type, line;

select modulecode, modulename, pageno, entrypageno, iconname, isactive
  from module
 where upper(modulename) in (
   'INDENT', 'PURCHASE ENQUIRY', 'PURCHASE QUOTATION', 'COMPARATIVE STATEMENT', 'RATE CONTRACT',
   'PURCHASE ORDER', 'PO AMENDMENT', 'LOADING ADVICE', 'MATERIAL IN', 'GRN',
   'FREIGHT ADVICE', 'PURCHASE BILL', 'PURCHASE BILL PASS', 'PAYMENT ADVICE', 'VOUCHER POSTING'
 )
order by modulename;

select modulecode, modulename, pageno, entrypageno, iconname, isactive
  from module
 where upper(modulecode) like '%VOUCHER%'
    or upper(modulename) like '%VOUCHER%'
 order by modulename;

exit
