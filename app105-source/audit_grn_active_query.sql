set linesize 220
set pagesize 100
connect -name IMART
select * from table(dbms_xplan.display_cursor('badw0dd3jva7x',null,'ALLSTATS LAST'));
select sql_id,elapsed_time/1000000 elapsed_seconds,executions,substr(sql_text,1,130) sql_text from v$sql where parsing_schema_name='IMART' and elapsed_time>10000000 order by elapsed_time desc fetch first 12 rows only;
exit
