set pagesize 100
set linesize 260
set trimspool on

select q.tno,
       q.enquirytno,
       q.quotationno,
       q.quotationdate,
       q.partyquotationdate,
       q.validitydays,
       q.validitydate,
       q.quotationdate + nvl(q.validitydays,0) expected_from_quotation_date,
       q.partyquotationdate + nvl(q.validitydays,0) expected_from_party_date
  from quotation q
 where q.enquirytno is not null
 order by q.tno desc;

exit
