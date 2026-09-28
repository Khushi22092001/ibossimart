whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 260 feedback off verify off

prompt === Latest quotation / FD tax-rule match by detail row ===
with latest_quote as (
  select max(tno) tno from quotationdetail
), detail_rows as (
  select q.tno, q.partycode, q.transactiontypecode,
         d.sno, d.itemspecificationcode, d.hsncode,
         (select max(trim(i.hsncode)) from itemspecification i
           where i.itemspecificationcode=d.itemspecificationcode) master_hsn
    from quotation q
    join quotationdetail d on d.tno=q.tno
   where q.tno=(select tno from latest_quote)
)
select d.tno, d.sno, d.partycode, d.transactiontypecode,
       d.itemspecificationcode, d.hsncode, d.master_hsn,
       (select count(*)
          from taxruledetail a
          join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
          join taxrule tr on tr.tno=a.tno
          join taxrulehsn h on h.tno=tr.tno
          join vendor v on v.taxregistrationtypecode=tr.taxregistrationtypecode
         where v.vendorcode=d.partycode
           and tr.transactiontypecode=d.transactiontypecode
           and h.hsncode=d.master_hsn) expected_tax_rows,
       (select count(*) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) stored_tax_rows
  from detail_rows d
 order by d.sno;

exit
