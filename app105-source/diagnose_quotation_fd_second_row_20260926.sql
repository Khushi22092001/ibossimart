whenever sqlerror exit sql.sqlcode rollback
set pagesize 200 linesize 260 trimspool on
connect -name IMART
column footerheadcode format a24
column legendscode format a15
column itemcode format a20
column detail_state format a12

prompt === EXACT SECOND ROW SNO ===
select d.tno, d.sno, d.itemcode, d.amount, d.footeramount, d.totalamount
  from quotationdetail d
 where d.sno = 57011214;

prompt === FOOTERS FOR SECOND ROW SNO ===
select f.tno, f.sno, f.serialno, f.footerheadcode, f.legendscode,
       f.footerpercent, f.footervalue,
       case when exists (
              select 1 from quotationdetail d
               where d.tno=f.tno and d.sno=f.sno
            ) then 'SAVED' else 'UNSAVED' end detail_state
  from quotationdetailfooter f
 where f.sno = 57011214
 order by f.tno, f.serialno;

prompt === RECENT 30000/5400 AND 150000/27000 DETAIL OR FOOTER ROWS ===
select * from (
    select d.tno, d.sno, d.itemcode, d.amount, d.footeramount, d.totalamount,
           (select count(*) from quotationdetailfooter f
             where f.tno=d.tno and f.sno=d.sno) footer_rows
      from quotationdetail d
     where abs(nvl(d.amount,0)-30000) < .01
        or abs(nvl(d.footeramount,0)-5400) < .01
        or abs(nvl(d.amount,0)-150000) < .01
        or abs(nvl(d.footeramount,0)-27000) < .01
     order by d.rowid desc
) where rownum <= 20;

prompt === CURRENT DOCUMENT 57011212 DETAILS ===
select d.tno, d.sno, d.serialno, d.itemcode, d.itemspecificationcode,
       d.hsncode, d.quantity1, d.withoutdiscountrate, d.rateafterdiscount,
       d.rate, d.amount, d.footeramount, d.totalamount
  from quotationdetail d
 where d.tno = 57011212
 order by d.serialno, d.sno;

prompt === CURRENT DOCUMENT 57011212 FOOTERS ===
select f.tno, f.sno, f.serialno, f.footerheadcode, f.legendscode,
       f.footerpercent, f.footervalue
  from quotationdetailfooter f
 where f.tno = 57011212
 order by f.sno, f.serialno;

prompt === FOOTER TABLE TRIGGERS AND COLUMN DEFAULTS ===
select trigger_name, status, triggering_event
  from user_triggers
 where table_name = 'QUOTATIONDETAILFOOTER';

select column_name, data_default, identity_column
  from user_tab_columns
 where table_name = 'QUOTATIONDETAILFOOTER'
   and column_name in ('TNO','SNO','SN','SERIALNO')
 order by column_id;

prompt === ALL FOOTERS AROUND SECOND ROW SNO ===
select f.tno, f.sno, f.serialno, f.footerheadcode, f.legendscode,
       f.footerpercent, f.footervalue
  from quotationdetailfooter f
 where f.sno between 57011150 and 57011250
 order by f.sno, f.serialno;

select * from (
    select f.tno, f.sno, f.footerheadcode, f.legendscode,
           f.footerpercent, f.footervalue,
           case when exists (
                  select 1 from quotationdetail d
                   where d.tno=f.tno and d.sno=f.sno
                ) then 'SAVED' else 'UNSAVED' end detail_state
      from quotationdetailfooter f
     where abs(nvl(f.footervalue,0)-5400) < .01
        or abs(nvl(f.footervalue,0)-27000) < .01
     order by f.rowid desc
) where rownum <= 20;

exit
