set define off
set sqlformat csv
connect -name IMART
select count(*) registers,count(created_column) recent_supported,count(creator_column) mine_supported from imart_mr_creation;
select page_id,table_name,created_column,creator_column from imart_mr_creation where created_column is null or creator_column is null;
select count(*) masters,sum(case when creationtime>=sysdate-7 and creationtime<=sysdate then 1 else 0 end) recent,sum(case when upper(trim(creator))='BOSS' then 1 else 0 end) boss_created from party;
select creator,count(*) from party group by creator order by count(*) desc fetch first 8 rows only;
select count(*) errors from user_errors where name='IMART_REGISTER_KPIS';
exit
