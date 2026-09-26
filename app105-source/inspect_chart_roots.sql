connect -name IMART
set pagesize 200 linesize 220 trimspool on
column partycode format a24
column partyname format a45
column parentcode format a24
column natureofaccountcode format a20
select partycode, partyname, parentcode, natureofaccountcode,
       (select count(*) from party c where c.parentcode=p.partycode) child_count
  from party p
 where p.partytypecode in ('ACCOUNTGROUP','ACCOUNT')
   and p.parentcode is null
 order by partyname;

prompt === natures ===
select natureofaccountcode, count(*) cnt
  from party
 where partytypecode in ('ACCOUNTGROUP','ACCOUNT')
 group by natureofaccountcode
 order by natureofaccountcode;
exit
