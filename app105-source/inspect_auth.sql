set pagesize 200 linesize 260 long 100000 trimspool on
connect -name IMART
select line, text from user_source where name='VALIDATEBOSSUSER' order by line;
select column_name, data_type from user_tab_columns where table_name='BOSSUSER' order by column_id;
exit
