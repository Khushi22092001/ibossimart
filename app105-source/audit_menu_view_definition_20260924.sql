set pagesize 0
set linesize 260
set long 200000
set longchunksize 200000
connect -name IMART
select object_type from user_objects where object_name='MYBOXTREE_APEXMENU';
select text from user_views where view_name='MYBOXTREE_APEXMENU';
exit
