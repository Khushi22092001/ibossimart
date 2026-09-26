connect -name IMART
set long 100000 longchunksize 100000 linesize 240 pagesize 300
select owner,object_type from all_objects where object_name='MYBOXTREE_APEXMENU';
select owner,synonym_name,table_owner,table_name from all_synonyms where synonym_name='MYBOXTREE_APEXMENU';
select text from all_views where view_name='MYBOXTREE_APEXMENU';

prompt === candidate menu sources ===
select object_name,object_type
  from user_objects
 where upper(object_name) like '%MYBOX%'
    or upper(object_name) like '%APEXMENU%'
 order by object_type,object_name;
exit
