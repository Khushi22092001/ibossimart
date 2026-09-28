set pagesize 500
set linesize 260
set long 1000000
set longchunksize 1000000
set trimspool on

prompt === Collection procedure source ===
select type, name, line, text
  from user_source
 where name in ('CSCOLLECTION','CREATECSCOLLECTION')
 order by name, type, line;

prompt === Recent quotation headers linked to enquiries ===
select *
  from (
        select q.tno,
               q.enquirytno,
               q.quotationno,
               q.partycode,
               p.partyname,
               q.quotationdate
          from quotation q
          left join party p on p.partycode = q.partycode
         where q.enquirytno is not null
         order by q.tno desc
       )
 where rownum <= 20;

prompt === Recent linked quotation details ===
select *
  from (
        select q.enquirytno,
               q.tno quotationtno,
               q.quotationno,
               q.partycode,
               p.partyname,
               d.itemcode,
               d.itemspecificationcode,
               d.quantity1,
               d.rate,
               d.amount
          from quotation q
          join quotationdetail d on d.tno = q.tno
          left join party p on p.partycode = q.partycode
         where q.enquirytno is not null
         order by q.tno desc, d.sno
       )
 where rownum <= 50;

exit
