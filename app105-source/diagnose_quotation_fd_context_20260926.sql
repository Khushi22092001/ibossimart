whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 260
connect -name IMART
column itemcode format a20
column footerheadcode format a25
column legendscode format a15

prompt === RECENT DETAIL ROWS MATCHING SCREEN AMOUNT/TAX ===
select * from (
    select d.tno, d.sno, d.itemcode, d.amount, d.footeramount, d.totalamount,
           (select count(*) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) footer_rows
      from quotationdetail d
     where abs(nvl(d.amount,0)-32000) < .01
        or abs(nvl(d.footeramount,0)-5760) < .01
     order by d.rowid desc
) where rownum <= 10;

prompt === FOOTER ROW CONTENT FOR MATCHED DETAILS ===
select f.tno, f.sno, f.footerheadcode, f.legendscode, f.footerpercent, f.footervalue
  from quotationdetailfooter f
 where exists (
       select 1 from quotationdetail d
        where d.tno=f.tno and d.sno=f.sno
          and (abs(nvl(d.amount,0)-32000) < .01 or abs(nvl(d.footeramount,0)-5760) < .01))
 order by f.tno desc, f.sno, f.serialno;

prompt === UNSAVED/ORPHAN FOOTER ROWS MATCHING 5760 ===
select * from (
    select f.tno, f.sno, f.footerheadcode, f.legendscode, f.footerpercent, f.footervalue,
           case when exists (select 1 from quotationdetail d where d.tno=f.tno and d.sno=f.sno) then 'SAVED' else 'UNSAVED' end detail_state
      from quotationdetailfooter f
     where abs(nvl(f.footervalue,0)-5760) < .01
     order by f.rowid desc
) where rownum <= 10;

exit
