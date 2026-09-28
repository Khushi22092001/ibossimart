set pagesize 300
set linesize 260
set trimspool on

prompt === Exact quotation loop in both collection procedures ===
select type, name, line, text
  from user_source
 where name in ('CSCOLLECTION','CREATECSCOLLECTION')
   and line between 90 and 140
 order by name, type, line;

prompt === Recent quotation eligibility conditions ===
select q.tno,
       q.enquirytno,
       q.quotationno,
       q.partycode,
       q.validitydate,
       case when exists (select 1 from vendor v where v.vendorcode=q.partycode) then 'Y' else 'N' end vendor_match,
       case when exists (select 1 from party p where p.partycode=q.partycode) then 'Y' else 'N' end party_match
  from quotation q
 where q.enquirytno is not null
 order by q.tno desc;

prompt === Item/spec joins for latest enquiry quotation ===
select e.tno enquirytno,
       e.itemcode enquiry_item,
       e.itemspecificationcode enquiry_spec,
       q.tno quotationtno,
       q.partycode,
       q.validitydate,
       d.sno detail_sno,
       d.itemcode quote_item,
       d.itemspecificationcode quote_spec,
       d.rate,
       d.amount,
       case when d.itemcode=e.itemcode then 'Y' else 'N' end item_match,
       case when d.itemspecificationcode=e.itemspecificationcode
                  or e.itemspecificationcode is null then 'Y' else 'N' end spec_match
  from enquiryitemdetail e
  left join quotation q on q.enquirytno=e.tno
  left join quotationdetail d on d.tno=q.tno and d.itemcode=e.itemcode
 where e.tno=(select max(enquirytno) from quotation where enquirytno is not null)
 order by e.sno, q.tno, d.sno;

exit
