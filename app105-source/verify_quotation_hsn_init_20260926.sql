whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 240
connect -name IMART

prompt === BLANK SAVED HSN WITH ITEM-SPEC FALLBACK AVAILABLE ===
select count(*) blank_hsn_with_fallback
  from quotationdetail qd
 where trim(qd.hsncode) is null
   and exists (
       select 1 from itemspecification s
        where s.itemspecificationcode = qd.itemspecificationcode
          and trim(s.hsncode) is not null
   );

prompt === REGION FALLBACK QUERY PARSE CHECK ===
select * from (
    select qd.tno, qd.sno, qd.itemcode, qd.itemspecificationcode,
           nvl(qd.hsncode, (select max(trim(s.hsncode))
                              from itemspecification s
                             where s.itemspecificationcode = qd.itemspecificationcode)) as hsncode
      from quotationdetail qd
     order by qd.rowid desc
) where rownum <= 5;

prompt === GET ITEM HSN SELECT PARSE CHECK ===
select * from (
    select eid.itemcode, eid.itemspecificationcode,
           (select max(trim(s.hsncode))
              from itemspecification s
             where s.itemspecificationcode = eid.itemspecificationcode) hsncode
      from enquiryitemdetail eid
     order by eid.rowid desc
) where rownum <= 5;

exit
