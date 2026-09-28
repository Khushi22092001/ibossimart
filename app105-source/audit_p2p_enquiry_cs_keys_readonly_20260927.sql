whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 220 feedback off verify off

select source,total_rows,null_keys,duplicate_key_rows
from (
  select 'ENQUIRYITEMDETAIL' source,
         (select count(*) from enquiryitemdetail) total_rows,
         (select count(*) from enquiryitemdetail where tno is null or sno is null) null_keys,
         nvl((select sum(c) from (select count(*) c from enquiryitemdetail group by tno,sno having count(*)>1)),0) duplicate_key_rows
  from dual
  union all
  select 'COMPARATIVESTATEMENTDETAIL',
         (select count(*) from comparativestatementdetail),
         (select count(*) from comparativestatementdetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from comparativestatementdetail group by tno,sno having count(*)>1)),0)
  from dual
)
order by source;

exit
