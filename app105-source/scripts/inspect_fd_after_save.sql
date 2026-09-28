set pagesize 200
set linesize 240
set trimspool on
set feedback on
set verify off

prompt === Recent purchase quotation headers ===
select *
from (
  select tno,
         quotationno,
         quotationdate,
         partycode,
         transactiontypecode
    from quotation
   order by tno desc
)
where rownum <= 5;

prompt === Detail and footer rows for the latest quotation ===
column footerheadcode format a20
column legendscode format a20
select q.tno,
       q.sno,
       q.serialno,
       q.amount as detail_amount,
       q.footeramount as detail_footer_amount,
       q.totalamount,
       f.sno as footer_sno,
       f.footerheadcode,
       f.legendscode,
       f.footerpercent,
       f.footervalue
  from quotationdetail q
  left join quotationdetailfooter f
    on f.tno = q.tno
   and f.sno = q.sno
 where q.tno = (select max(tno) from quotation)
 order by q.sno, f.footerheadcode, f.legendscode;

prompt === Orphan footer rows for the latest quotation ===
select f.tno,
       f.sno,
       f.footerheadcode,
       f.legendscode,
       f.footerpercent,
       f.footervalue
  from quotationdetailfooter f
 where f.tno = (select max(tno) from quotation)
   and not exists (
         select 1
           from quotationdetail q
          where q.tno = f.tno
            and q.sno = f.sno
       )
 order by f.sno, f.footerheadcode, f.legendscode;

exit
